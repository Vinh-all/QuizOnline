const fs = require('fs');
const path = require('path');
const { pool } = require('./db');

async function runMigrations() {
  console.log('🚀 Bắt đầu quá trình khởi tạo Schema & nạp dữ liệu (Seed) vào PostgreSQL...');
  const client = await pool.connect();

  try {
    // 1. Chạy schema.sql
    const schemaPath = path.join(__dirname, 'schema.sql');
    console.log(`📄 Đang đọc file DDL: ${schemaPath}...`);
    const schemaSql = fs.readFileSync(schemaPath, 'utf8');

    console.log('⏳ Đang thực thi tạo bảng (schema.sql)...');
    await client.query(schemaSql);
    console.log('✅ Khởi tạo Schema và người dùng mẫu thành công!');

    // 2. Chạy seed_data.sql (200 câu hỏi & 5 đề thi)
    const seedPath = path.join(__dirname, 'seed_data.sql');
    console.log(`📄 Đang đọc file Seed: ${seedPath}...`);
    const seedSql = fs.readFileSync(seedPath, 'utf8');

    console.log('⏳ Đang nạp 5 Practice Tests và 200 câu hỏi trắc nghiệm (seed_data.sql)...');
    await client.query(seedSql);
    console.log('✅ Nạp dữ liệu câu hỏi thành công!');

    // 3. Thống kê kết quả nạp
    const stats = await client.query(`
      SELECT 
        (SELECT COUNT(*) FROM tests) AS total_tests,
        (SELECT COUNT(*) FROM test_parts) AS total_parts,
        (SELECT COUNT(*) FROM questions) AS total_questions,
        (SELECT COUNT(*) FROM question_options) AS total_options,
        (SELECT COUNT(*) FROM users) AS total_users;
    `);

    console.log('\n📊 THỐNG KÊ DỮ LIỆU ĐÃ TẠO:');
    console.table(stats.rows[0]);

    client.release();
    process.exit(0);
  } catch (error) {
    console.error('\n❌ Lỗi trong quá trình chạy migration:', error.message);
    client.release();
    process.exit(1);
  }
}

runMigrations();

