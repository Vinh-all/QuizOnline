const db = require('../database/db');
const cache = require('../utils/cache');

// Lấy danh sách tất cả các bài thi (Practice Tests) - Đã tối ưu Cache In-Memory
exports.getAllTests = async (req, res) => {
  try {
    const userRole = req.user ? req.user.role : 'student';
    const cacheKey = `tests_list_${userRole}`;
    const cachedData = cache.get(cacheKey);

    if (cachedData) {
      return res.json(cachedData);
    }

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
    const result = await db.query(query, [userRole]);
    const responsePayload = {
      success: true,
      tests: result.rows,
    };

    // Cache trong 5 phút
    cache.set(cacheKey, responsePayload, 300);

    return res.json(responsePayload);
  } catch (error) {
    console.error('Lỗi lấy danh sách bài thi:', error);
    return res.status(500).json({
      success: false,
      message: 'Không thể tải danh sách đề thi!',
    });
  }
};

// Lấy thông tin chi tiết bài thi theo ID - Tối ưu 1 câu truy vấn SQL json_agg duy nhất
exports.getTestById = async (req, res) => {
  const { id } = req.params;
  const cacheKey = `test_detail_${id}`;
  const cachedTest = cache.get(cacheKey);

  if (cachedTest) {
    return res.json(cachedTest);
  }

  try {
    const testRes = await db.query('SELECT * FROM tests WHERE id = $1', [id]);
    if (testRes.rows.length === 0) {
      return res.status(404).json({
        success: false,
        message: 'Không tìm thấy bài thi!',
      });
    }

    const test = testRes.rows[0];

    // Truy vấn hợp nhất 1 lần duy nhất cho toàn bộ Parts, Questions và Options
    const query = `
      SELECT 
        tp.id,
        tp.part_number,
        tp.title,
        tp.passage_text,
        COALESCE(
          json_agg(
            json_build_object(
              'id', q.id,
              'question_number', q.question_number,
              'question_text', q.question_text,
              'options', (
                SELECT json_agg(
                  json_build_object(
                    'id', qo.id,
                    'option_key', qo.option_key,
                    'option_text', qo.option_text
                  ) ORDER BY qo.option_key ASC
                )
                FROM question_options qo
                WHERE qo.question_id = q.id
              )
            ) ORDER BY q.question_number ASC
          ) FILTER (WHERE q.id IS NOT NULL),
          '[]'::json
        ) AS questions
      FROM test_parts tp
      LEFT JOIN questions q ON q.test_part_id = tp.id
      WHERE tp.test_id = $1
      GROUP BY tp.id, tp.part_number, tp.title, tp.passage_text
      ORDER BY tp.part_number ASC;
    `;

    const partsRes = await db.query(query, [id]);

    const responsePayload = {
      success: true,
      test: {
        ...test,
        parts: partsRes.rows,
      },
    };

    cache.set(cacheKey, responsePayload, 600);
    return res.json(responsePayload);
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

    cache.clear(); // Xóa bộ đệm để làm mới danh sách đề thi

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

    cache.clear();

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
