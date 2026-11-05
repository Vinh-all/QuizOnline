const { pool } = require('./database/db');

async function test() {
  const query = `
    SELECT 
      q.id AS question_id,
      q.question_number,
      q.question_text,
      (
        SELECT json_agg(
          json_build_object(
            'id', qo.id,
            'option_key', qo.option_key,
            'option_text', qo.option_text,
            'is_correct', qo.is_correct
          ) ORDER BY qo.option_key ASC
        )
        FROM question_options qo
        WHERE qo.question_id = q.id
      ) AS options
    FROM questions q
    LIMIT 2;
  `;
  const res = await pool.query(query);
  console.log('Result of json_agg options:');
  console.log(JSON.stringify(res.rows[0], null, 2));
  process.exit(0);
}

test();
