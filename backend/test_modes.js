require('dotenv').config();
const { pool } = require('./database/db');
const examController = require('./controllers/examController');

async function verifyModes() {
  const tests = await pool.query('SELECT id, title FROM tests ORDER BY title LIMIT 1');
  const users = await pool.query("SELECT id FROM users WHERE role = 'student' LIMIT 1");
  const testId = tests.rows[0].id;
  const userId = users.rows[0].id;

  console.log('=== 1. KIỂM THỬ CHẾ ĐỘ LUYỆN 1 PART (PART 1) ===');
  let singlePartRes = null;
  await examController.startExam({
    user: { id: userId, role: 'student' },
    body: { test_id: testId, part_number: 1, is_timed: false }
  }, {
    status(c) { return this; },
    json(data) { singlePartRes = data; }
  });

  console.log('Tiêu đề:', singlePartRes.test.title);
  console.log('Số parts trả về:', singlePartRes.parts.length);
  console.log('Tổng số câu hỏi:', singlePartRes.total_questions);
  console.log('Câu hỏi thuộc Part 1:', singlePartRes.parts[0].questions.length);

  if (singlePartRes.total_questions === 10 && singlePartRes.parts.length === 1) {
    console.log('✅ CHẾ ĐỘ 1 PART: ĐẠT CHUẨN ĐÚNG 10 CÂU & 1 BÀI ĐỌC!');
  } else {
    console.error('❌ CHẾ ĐỘ 1 PART SAI!');
  }

  console.log('\n=== 2. KIỂM THỬ CHẾ ĐỘ LUYỆN CẢ ĐỀ (40 CÂU) ===');
  let fullTestRes = null;
  await examController.startExam({
    user: { id: userId, role: 'student' },
    body: { test_id: testId, part_number: null, is_timed: false }
  }, {
    status(c) { return this; },
    json(data) { fullTestRes = data; }
  });

  console.log('Tiêu đề:', fullTestRes.test.title);
  console.log('Số parts trả về:', fullTestRes.parts.length);
  console.log('Tổng số câu hỏi:', fullTestRes.total_questions);

  if (fullTestRes.total_questions === 40 && fullTestRes.parts.length === 4) {
    console.log('✅ CHẾ ĐỘ CẢ ĐỀ: ĐẠT CHUẨN ĐỦ 40 CÂU & 4 BÀI ĐỌC!');
  } else {
    console.error('❌ CHẾ ĐỘ CẢ ĐỀ SAI!');
  }

  process.exit(0);
}

verifyModes();

