require('dotenv').config();
const { pool } = require('./database/db');
const examController = require('./controllers/examController');

async function test() {
  const tests = await pool.query('SELECT id, title FROM tests ORDER BY title LIMIT 1');
  const users = await pool.query("SELECT id FROM users WHERE role = 'student' LIMIT 1");
  const testId = tests.rows[0].id;
  const userId = users.rows[0].id;

  console.log(`Kiểm thử startExam với test: ${tests.rows[0].title}, part_number: 2...`);

  const req = {
    user: { id: userId, role: 'student' },
    body: { test_id: testId, part_number: 2, is_timed: false },
  };
  const res = {
    statusCode: 200,
    status(code) { this.statusCode = code; return this; },
    json(data) {
      console.log('SUCCESS:', data.success);
      console.log('TEST TITLE:', data.test.title);
      console.log('TOTAL QUESTIONS:', data.total_questions);
      console.log('PARTS COUNT:', data.parts.length);
      console.log('PART 1 TITLE:', data.parts[0].title);
      console.log('PART 1 PASSAGE LENGTH:', data.parts[0].passage_text.length);
      console.log('PART 1 QUESTIONS COUNT:', data.parts[0].questions.length);
      console.log('QUESTION 1:', data.parts[0].questions[0].question_number, data.parts[0].questions[0].question_text);
    },
  };

  await examController.startExam(req, res);
  process.exit(0);
}

test();
