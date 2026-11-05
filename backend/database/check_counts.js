const { pool } = require('./db');

async function check() {
  try {
    const res = await pool.query(`
      SELECT 
        (SELECT COUNT(*) FROM tests) AS tests,
        (SELECT COUNT(*) FROM test_parts) AS test_parts,
        (SELECT COUNT(*) FROM questions) AS questions,
        (SELECT COUNT(*) FROM question_options) AS question_options,
        (SELECT COUNT(*) FROM users) AS users;
    `);
    console.log('Database Statistics:', res.rows[0]);
    process.exit(0);
  } catch (err) {
    console.error('Lỗi truy vấn:', err.message);
    process.exit(1);
  }
}

check();

