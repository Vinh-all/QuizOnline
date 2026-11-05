const { pool } = require('./db');

async function check() {
  try {
    const res = await pool.query(`
      SELECT 
        tp.id, 
        t.title as test_title, 
        tp.part_number, 
        tp.title as part_title, 
        LENGTH(tp.passage_text) as passage_length,
        COUNT(q.id) as question_count
      FROM test_parts tp
      JOIN tests t ON t.id = tp.test_id
      LEFT JOIN questions q ON q.test_part_id = tp.id
      GROUP BY tp.id, t.title, tp.part_number, tp.title, tp.passage_text
      ORDER BY t.title, tp.part_number;
    `);
    console.table(res.rows);
    process.exit(0);
  } catch (err) {
    console.error('Lỗi:', err.message);
    process.exit(1);
  }
}

check();
