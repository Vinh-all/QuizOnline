require('dotenv').config();
const { pool } = require('./database/db');
const examController = require('./controllers/examController');

async function runBenchmark() {
  const tests = await pool.query('SELECT id, title FROM tests ORDER BY title LIMIT 1');
  const users = await pool.query("SELECT id FROM users WHERE role = 'student' LIMIT 1");
  const testId = tests.rows[0].id;
  const userId = users.rows[0].id;

  console.log('--- TEST 1: Lần đầu tiên (Cold Start - Query DB qua mạng Supabase) ---');
  const t0 = Date.now();
  let res1 = null;
  await examController.startExam({
    user: { id: userId, role: 'student' },
    body: { test_id: testId, part_number: null, is_timed: false }
  }, {
    status(c) { return this; },
    json(data) { res1 = data; }
  });
  console.log(`⏱️ Thời gian Cold Start: ${Date.now() - t0}ms (Parts: ${res1.parts.length}, Questions: ${res1.total_questions})`);

  console.log('\n--- TEST 2: Lần thứ 2 (Warm In-Memory Cache - 0 DB roundtrip cho đề thi) ---');
  const t1 = Date.now();
  let res2 = null;
  await examController.startExam({
    user: { id: userId, role: 'student' },
    body: { test_id: testId, part_number: null, is_timed: false }
  }, {
    status(c) { return this; },
    json(data) { res2 = data; }
  });
  console.log(`⏱️ Thời gian Warm Cache: ${Date.now() - t1}ms (Parts: ${res2.parts.length}, Questions: ${res2.total_questions})`);

  console.log('\n--- TEST 3: Thử nghiệm Nộp bài & Chấm điểm 40 câu (Batch Insert) ---');
  const answers = [];
  res2.parts.forEach(p => {
    p.questions.forEach(q => {
      answers.push({
        question_id: q.id,
        selected_key: 'A',
        selected_option_id: q.options[0]?.id
      });
    });
  });

  const t2 = Date.now();
  let submitRes = null;
  await examController.submitExam({
    user: { id: userId, role: 'student' },
    body: { attempt_id: res2.attempt_id, answers }
  }, {
    status(c) { return this; },
    json(data) { submitRes = data; }
  });
  console.log(`⏱️ Thời gian Nộp bài và chấm điểm 40 câu: ${Date.now() - t2}ms (Điểm: ${submitRes.score}, Đúng: ${submitRes.correct_count}/${submitRes.total_questions})`);

  await pool.end();
}

runBenchmark().catch(console.error);

