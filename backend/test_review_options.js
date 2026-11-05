require('dotenv').config();
const { pool } = require('./database/db');
const examController = require('./controllers/examController');

async function testReview() {
  const attempts = await pool.query('SELECT id, user_id FROM exam_attempts ORDER BY created_at DESC LIMIT 1');
  if (attempts.rows.length === 0) {
    console.log('Chưa có lượt thi nào để test');
    process.exit(0);
  }

  const attemptId = attempts.rows[0].id;
  const userId = attempts.rows[0].user_id;

  console.log(`Kiểm tra xem chi tiết kết quả attempt: ${attemptId}...`);

  const req = {
    user: { id: userId, role: 'student' },
    params: { attempt_id: attemptId }
  };

  const res = {
    status(c) { return this; },
    json(data) {
      console.log('SUCCESS:', data.success);
      console.log('TỔNG SỐ CÂU TRONG BÀI THI:', data.review.length);
      const q1 = data.review[0];
      console.log('CÂU 1:', q1.question_number, q1.question_text);
      console.log('SỐ PHƯƠNG ÁN (OPTIONS):', q1.options ? q1.options.length : 'CHƯA CÓ');
      if (q1.options) {
        q1.options.forEach(opt => {
          console.log(`   [${opt.option_key}] ${opt.option_text} (${opt.is_correct ? 'ĐÚNG' : 'SAI'})`);
        });
      }
    }
  };

  await examController.getAttemptDetail(req, res);
  process.exit(0);
}

testReview();
