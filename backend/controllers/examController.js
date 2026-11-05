const db = require('../database/db');

// Thuật toán trộn mảng Fisher-Yates (Knuth Shuffle)
function shuffleArray(array) {
  const arr = [...array];
  for (let i = arr.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [arr[i], arr[j]] = [arr[j], arr[i]];
  }
  return arr;
}

// Bắt đầu làm bài thi (Tạo lượt thi mới & nạp câu hỏi bảo mật)
exports.startExam = async (req, res) => {
  const { test_id } = req.body;
  const user_id = req.user.id;

  if (!test_id) {
    return res.status(400).json({
      success: false,
      message: 'Vui lòng cung cấp mã đề thi (test_id)!',
    });
  }

  try {
    // 1. Kiểm tra đề thi tồn tại
    const testRes = await db.query('SELECT * FROM tests WHERE id = $1 AND is_published = true', [test_id]);
    if (testRes.rows.length === 0) {
      return res.status(404).json({
        success: false,
        message: 'Đề thi không tồn tại hoặc chưa được mở!',
      });
    }
    const test = testRes.rows[0];

    // 2. Tạo một lượt thi mới trong exam_attempts
    const attemptRes = await db.query(
      `INSERT INTO exam_attempts (user_id, test_id, started_at, total_questions, status)
       VALUES ($1, $2, CURRENT_TIMESTAMP, 40, 'in_progress')
       RETURNING *`,
      [user_id, test_id]
    );
    const attempt = attemptRes.rows[0];

    // 3. Lấy tất cả các phần đọc và câu hỏi
    const partsRes = await db.query(
      'SELECT id, part_number, title, passage_text FROM test_parts WHERE test_id = $1 ORDER BY part_number ASC',
      [test_id]
    );

    const parts = [];
    let globalQuestions = [];

    for (const part of partsRes.rows) {
      const questionsRes = await db.query(
        'SELECT id, question_number, question_text FROM questions WHERE test_part_id = $1 ORDER BY question_number ASC',
        [part.id]
      );

      let questions = [];
      for (const q of questionsRes.rows) {
        // Chỉ lấy id, key và text của phương án - TUYỆT ĐỐI KHÔNG TRẢ VỀ is_correct
        const optionsRes = await db.query(
          'SELECT id, option_key, option_text FROM question_options WHERE question_id = $1 ORDER BY option_key ASC',
          [q.id]
        );

        let options = optionsRes.rows;
        if (test.shuffle_options) {
          options = shuffleArray(options);
        }

        const qData = {
          id: q.id,
          question_number: q.question_number,
          question_text: q.question_text,
          options,
          part_id: part.id,
          part_title: part.title,
        };
        questions.push(qData);
        globalQuestions.push(qData);
      }

      if (test.shuffle_questions) {
        questions = shuffleArray(questions);
      }

      parts.push({
        id: part.id,
        part_number: part.part_number,
        title: part.title,
        passage_text: part.passage_text,
        questions,
      });
    }

    return res.status(201).json({
      success: true,
      message: 'Bắt đầu làm bài thi thành công!',
      attempt_id: attempt.id,
      test: {
        id: test.id,
        title: test.title,
        description: test.description,
        time_limit_minutes: test.time_limit_minutes,
      },
      started_at: attempt.started_at,
      parts,
      total_questions: globalQuestions.length,
    });
  } catch (error) {
    console.error('Lỗi bắt đầu bài thi:', error);
    return res.status(500).json({
      success: false,
      message: 'Lỗi máy chủ khi bắt đầu bài thi!',
    });
  }
};

// Nộp bài và chấm điểm tự động tại Server
exports.submitExam = async (req, res) => {
  const { attempt_id, answers } = req.body; // answers = [{ question_id, selected_key, selected_option_id }]
  const user_id = req.user.id;

  if (!attempt_id) {
    return res.status(400).json({
      success: false,
      message: 'Thiếu thông tin lượt thi (attempt_id)!',
    });
  }

  try {
    // 1. Kiểm tra lượt thi
    const attemptRes = await db.query(
      'SELECT * FROM exam_attempts WHERE id = $1 AND user_id = $2',
      [attempt_id, user_id]
    );

    if (attemptRes.rows.length === 0) {
      return res.status(404).json({
        success: false,
        message: 'Không tìm thấy lượt thi của bạn!',
      });
    }

    const attempt = attemptRes.rows[0];
    if (attempt.status !== 'in_progress') {
      return res.status(400).json({
        success: false,
        message: 'Lượt thi này đã kết thúc trước đó!',
      });
    }

    // 2. Chấm điểm từng câu hỏi
    const answersList = Array.isArray(answers) ? answers : [];
    let correctCount = 0;
    const gradedDetails = [];

    // Lấy toàn bộ đáp án đúng của đề thi từ CSDL
    const correctOptionsRes = await db.query(`
      SELECT 
        q.id AS question_id,
        q.question_number,
        q.question_text,
        q.explanation,
        qo.id AS correct_option_id,
        qo.option_key AS correct_key,
        qo.option_text AS correct_text
      FROM questions q
      JOIN question_options qo ON qo.question_id = q.id
      JOIN test_parts tp ON tp.id = q.test_part_id
      WHERE tp.test_id = $1 AND qo.is_correct = true;
    `, [attempt.test_id]);

    const correctMap = {};
    correctOptionsRes.rows.forEach(r => {
      correctMap[r.question_id] = r;
    });

    // Duyệt qua từng câu trả lời nộp lên
    for (const ans of answersList) {
      const qInfo = correctMap[ans.question_id];
      if (!qInfo) continue;

      const isCorrect = ans.selected_key && ans.selected_key.toUpperCase() === qInfo.correct_key.toUpperCase();
      if (isCorrect) {
        correctCount++;
      }

      // Lưu câu trả lời vào exam_answers
      await db.query(
        `INSERT INTO exam_answers (attempt_id, question_id, selected_option_id, selected_key, is_correct)
         VALUES ($1, $2, $3, $4, $5)`,
        [attempt_id, ans.question_id, ans.selected_option_id || null, ans.selected_key || null, isCorrect]
      );

      gradedDetails.push({
        question_id: ans.question_id,
        question_number: qInfo.question_number,
        question_text: qInfo.question_text,
        selected_key: ans.selected_key,
        correct_key: qInfo.correct_key,
        is_correct: isCorrect,
        explanation: qInfo.explanation,
      });
    }

    // 3. Tính điểm (Thang điểm 10)
    const totalQuestions = correctOptionsRes.rows.length || 40;
    const score = Number(((correctCount / totalQuestions) * 10).toFixed(2));

    // 4. Cập nhật trạng thái lượt thi trong exam_attempts
    await db.query(
      `UPDATE exam_attempts 
       SET submitted_at = CURRENT_TIMESTAMP, 
           correct_count = $1, 
           score = $2, 
           total_questions = $3, 
           status = 'completed'
       WHERE id = $4`,
      [correctCount, score, totalQuestions, attempt_id]
    );

    return res.json({
      success: true,
      message: 'Nộp bài và chấm điểm thành công!',
      attempt_id,
      score,
      correct_count: correctCount,
      total_questions: totalQuestions,
      percentage: Math.round((correctCount / totalQuestions) * 100),
      graded_details: gradedDetails,
    });
  } catch (error) {
    console.error('Lỗi nộp bài thi:', error);
    return res.status(500).json({
      success: false,
      message: 'Lỗi máy chủ khi nộp bài thi!',
    });
  }
};

// Lấy lịch sử làm bài của học sinh
exports.getExamHistory = async (req, res) => {
  const user_id = req.user.id;

  try {
    const query = `
      SELECT 
        ea.id,
        ea.test_id,
        t.title AS test_title,
        ea.started_at,
        ea.submitted_at,
        ea.score,
        ea.correct_count,
        ea.total_questions,
        ea.status,
        EXTRACT(EPOCH FROM (ea.submitted_at - ea.started_at))::int AS time_spent_seconds
      FROM exam_attempts ea
      JOIN tests t ON t.id = ea.test_id
      WHERE ea.user_id = $1 AND ea.status = 'completed'
      ORDER BY ea.submitted_at DESC;
    `;
    const result = await db.query(query, [user_id]);

    return res.json({
      success: true,
      history: result.rows,
    });
  } catch (error) {
    console.error('Lỗi lấy lịch sử thi:', error);
    return res.status(500).json({
      success: false,
      message: 'Không thể tải lịch sử làm bài!',
    });
  }
};

// Xem lại chi tiết một bài thi đã nộp (kèm đáp án và lời giải chi tiết)
exports.getAttemptDetail = async (req, res) => {
  const { attempt_id } = req.params;
  const user_id = req.user.id;

  try {
    const attemptRes = await db.query(
      `SELECT ea.*, t.title AS test_title 
       FROM exam_attempts ea 
       JOIN tests t ON t.id = ea.test_id 
       WHERE ea.id = $1 AND (ea.user_id = $2 OR $3 IN ('admin', 'teacher'))`,
      [attempt_id, user_id, req.user.role]
    );

    if (attemptRes.rows.length === 0) {
      return res.status(404).json({
        success: false,
        message: 'Không tìm thấy kết quả lượt thi!',
      });
    }

    const attempt = attemptRes.rows[0];

    // Lấy câu hỏi, đáp án đã chọn và lời giải
    const query = `
      SELECT 
        q.id AS question_id,
        q.question_number,
        q.question_text,
        q.explanation,
        tp.part_number,
        tp.title AS part_title,
        tp.passage_text,
        ans.selected_key,
        ans.is_correct,
        correct_qo.option_key AS correct_key,
        correct_qo.option_text AS correct_text
      FROM questions q
      JOIN test_parts tp ON tp.id = q.test_part_id
      LEFT JOIN exam_answers ans ON ans.question_id = q.id AND ans.attempt_id = $1
      LEFT JOIN question_options correct_qo ON correct_qo.question_id = q.id AND correct_qo.is_correct = true
      WHERE tp.test_id = $2
      ORDER BY q.question_number ASC;
    `;

    const detailRes = await db.query(query, [attempt_id, attempt.test_id]);

    // Gom nhóm theo part
    const questionsWithPart = detailRes.rows;

    return res.json({
      success: true,
      attempt,
      review: questionsWithPart,
    });
  } catch (error) {
    console.error('Lỗi xem chi tiết lượt thi:', error);
    return res.status(500).json({
      success: false,
      message: 'Lỗi tải chi tiết bài thi!',
    });
  }
};
