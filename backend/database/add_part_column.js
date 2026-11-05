const { pool } = require('./db');

async function migrate() {
  try {
    await pool.query('ALTER TABLE exam_attempts ADD COLUMN IF NOT EXISTS part_number INTEGER NULL;');
    console.log('✅ Đã thêm cột part_number vào bảng exam_attempts thành công!');
    process.exit(0);
  } catch (err) {
    console.error('Lỗi migration:', err.message);
    process.exit(1);
  }
}

migrate();

