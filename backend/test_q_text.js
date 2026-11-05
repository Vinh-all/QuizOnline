const { pool } = require('./database/db');

async function check() {
  const res = await pool.query('SELECT question_number, question_text FROM questions LIMIT 5');
  console.log(res.rows);
  process.exit(0);
}

check();

