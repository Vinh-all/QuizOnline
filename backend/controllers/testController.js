const db = require('../database/db');

// Lấy danh sách tất cả các bài thi (Practice Tests)
exports.getAllTests = async (req, res) => {
  try {
    const query = `
      SELECT 
        t.id, 
        t.title, 
        t.description, 
        t.time_limit_minutes, 
        t.shuffle_questions, 
        t.shuffle_options, 
        t.is_published, 
        t.created_at,
        COUNT(DISTINCT tp.id)::int AS parts_count,
        COUNT(DISTINCT q.id)::int AS questions_count
      FROM tests t
      LEFT JOIN test_parts tp ON tp.test_id = t.id
      LEFT JOIN questions q ON q.test_part_id = tp.id
      WHERE t.is_published = true OR ($1 = 'admin' OR $1 = 'teacher')
      GROUP BY t.id
      ORDER BY t.title ASC;
    `;
    const userRole = req.user ? req.user.role : 'student';
    const result = await db.query(query, [userRole]);

    return res.json({
      success: true,
      tests: result.rows,
    });
  } catch (error) {
    console.error('Lỗi lấy danh sách bài thi:', error);
    return res.status(500).json({
      success: false,
      message: 'Không thể tải danh sách đề thi!',
    });
  }
};

// Lấy thông tin chi tiết bài thi theo ID (dành cho quản lý hoặc xem cấu trúc)
exports.getTestById = async (req, res) => {
  const { id } = req.params;

  try {
    const testRes = await db.query('SELECT * FROM tests WHERE id = $1', [id]);
    if (testRes.rows.length === 0) {
      return res.status(404).json({
        success: false,
        message: 'Không tìm thấy bài thi!',
      });
    }

    const test = testRes.rows[0];

    // Lấy các phần đọc (test_parts)
    const partsRes = await db.query(
      'SELECT id, part_number, title, passage_text FROM test_parts WHERE test_id = $1 ORDER BY part_number ASC',
      [id]
    );

    const parts = [];
    for (const part of partsRes.rows) {
      // Lấy câu hỏi
      const questionsRes = await db.query(
        'SELECT id, question_number, question_text FROM questions WHERE test_part_id = $1 ORDER BY question_number ASC',
        [part.id]
      );

      const questions = [];
      for (const q of questionsRes.rows) {
        // Lấy phương án
        const optionsRes = await db.query(
          'SELECT id, option_key, option_text FROM question_options WHERE question_id = $1 ORDER BY option_key ASC',
          [q.id]
        );
        questions.push({
          ...q,
          options: optionsRes.rows,
        });
      }

      parts.push({
        ...part,
        questions,
      });
    }

    return res.json({
      success: true,
      test: {
        ...test,
        parts,
      },
    });
  } catch (error) {
    console.error('Lỗi lấy chi tiết bài thi:', error);
    return res.status(500).json({
      success: false,
      message: 'Không thể tải thông tin đề thi!',
    });
  }
};

// Tạo bài thi mới (Admin & Teacher)
exports.createTest = async (req, res) => {
  const { title, description, time_limit_minutes = 60, shuffle_questions = true, shuffle_options = true } = req.body;

  if (!title) {
    return res.status(400).json({
      success: false,
      message: 'Vui lòng cung cấp tiêu đề bài thi!',
    });
  }

  try {
    const newTest = await db.query(
      `INSERT INTO tests (title, description, time_limit_minutes, shuffle_questions, shuffle_options, created_by)
       VALUES ($1, $2, $3, $4, $5, $6)
       RETURNING *`,
      [title, description, time_limit_minutes, shuffle_questions, shuffle_options, req.user.id]
    );

    return res.status(201).json({
      success: true,
      message: 'Tạo bài thi mới thành công!',
      test: newTest.rows[0],
    });
  } catch (error) {
    console.error('Lỗi tạo bài thi:', error);
    return res.status(500).json({
      success: false,
      message: 'Lỗi máy chủ khi tạo bài thi!',
    });
  }
};

// Xóa bài thi (Admin)
exports.deleteTest = async (req, res) => {
  const { id } = req.params;

  try {
    const delRes = await db.query('DELETE FROM tests WHERE id = $1 RETURNING id', [id]);
    if (delRes.rows.length === 0) {
      return res.status(404).json({
        success: false,
        message: 'Không tìm thấy bài thi cần xóa!',
      });
    }

    return res.json({
      success: true,
      message: 'Đã xóa bài thi thành công!',
    });
  } catch (error) {
    console.error('Lỗi xóa bài thi:', error);
    return res.status(500).json({
      success: false,
      message: 'Lỗi máy chủ khi xóa bài thi!',
    });
  }
};

