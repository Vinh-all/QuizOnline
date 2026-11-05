const { pool } = require('./database/db');

async function check() {
  const res = await pool.query(`
    SELECT q.question_number, q.question_text 
    FROM questions q
    JOIN test_parts tp ON tp.id = q.test_part_id
    WHERE tp.part_number = 2
    ORDER BY q.question_number
  `);
  console.log('Part 2 questions:');
  console.log(res.rows);
  process.exit(0);
}

check();
