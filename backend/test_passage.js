const { pool } = require('./database/db');

async function test() {
  const res = await pool.query('SELECT part_number, title, passage_text FROM test_parts WHERE part_number = 1 LIMIT 1');
  console.log('PART TITLE:', res.rows[0].title);
  console.log('RAW PASSAGE TEXT (first 500 chars):');
  console.log(JSON.stringify(res.rows[0].passage_text.slice(0, 500)));
  process.exit(0);
}

test();
