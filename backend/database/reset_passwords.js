const bcrypt = require('bcryptjs');
const { pool } = require('./db');

async function fixUsers() {
  const hash = await bcrypt.hash('123456', 10);
  console.log('Generated hash for 123456:', hash);

  await pool.query('UPDATE users SET password_hash = $1', [hash]);
  console.log('✅ Đã cập nhật mật khẩu 123456 cho tất cả người dùng trong database!');

  const res = await pool.query('SELECT id, email, full_name, role FROM users');
  console.table(res.rows);
  process.exit(0);
}

fixUsers();

