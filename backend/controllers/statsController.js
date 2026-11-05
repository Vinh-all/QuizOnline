const db = require('../database/db');

// Thống kê cá nhân của học sinh
exports.getUserStats = async (req, res) => {
  const user_id = req.user.id;

  try {
    const statsRes = await db.query(`
      SELECT 
        COUNT(*)::int AS total_attempts,
        COALESCE(ROUND(AVG(score), 2), 0) AS average_score,
        COALESCE(MAX(score), 0) AS highest_score,
        COALESCE(SUM(correct_count), 0)::int AS total_correct_answers
      FROM exam_attempts
      WHERE user_id = $1 AND status = 'completed';
    `, [user_id]);

    const recentRes = await db.query(`
      SELECT 
        ea.id,
        ea.test_id,
        t.title AS test_title,
        ea.score,
        ea.correct_count,
        ea.total_questions,
        ea.submitted_at
      FROM exam_attempts ea
      JOIN tests t ON t.id = ea.test_id
      WHERE ea.user_id = $1 AND ea.status = 'completed'
      ORDER BY ea.submitted_at DESC
      LIMIT 5;
    `, [user_id]);

    return res.json({
      success: true,
      stats: statsRes.rows[0],
      recent_attempts: recentRes.rows,
    });
  } catch (error) {
    console.error('Lỗi lấy thống kê người dùng:', error);
    return res.status(500).json({
      success: false,
      message: 'Không thể tải thống kê cá nhân!',
    });
  }
};

// Thống kê tổng quan hệ thống (Admin & Giáo viên)
exports.getDashboardStats = async (req, res) => {
  try {
    const overviewRes = await db.query(`
      SELECT 
        (SELECT COUNT(*) FROM users WHERE role = 'student')::int AS total_students,
        (SELECT COUNT(*) FROM users WHERE role = 'teacher')::int AS total_teachers,
        (SELECT COUNT(*) FROM tests WHERE is_published = true)::int AS total_tests,
        (SELECT COUNT(*) FROM questions)::int AS total_questions,
        (SELECT COUNT(*) FROM exam_attempts WHERE status = 'completed')::int AS total_completed_exams,
        COALESCE((SELECT ROUND(AVG(score), 2) FROM exam_attempts WHERE status = 'completed'), 0) AS system_average_score;
    `);

    // Bảng xếp hạng điểm trung bình theo từng đề thi
    const testPerformanceRes = await db.query(`
      SELECT 
        t.id, 
        t.title,
        COUNT(ea.id)::int AS attempt_count,
        COALESCE(ROUND(AVG(ea.score), 2), 0) AS avg_score,
        COALESCE(MAX(ea.score), 0) AS max_score
      FROM tests t
      LEFT JOIN exam_attempts ea ON ea.test_id = t.id AND ea.status = 'completed'
      GROUP BY t.id
      ORDER BY t.title ASC;
    `);

    return res.json({
      success: true,
      overview: overviewRes.rows[0],
      test_performance: testPerformanceRes.rows,
    });
  } catch (error) {
    console.error('Lỗi lấy thống kê tổng quan:', error);
    return res.status(500).json({
      success: false,
      message: 'Không thể tải thống kê quản trị!',
    });
  }
};

