const { pool } = require('./db');

async function testConnection() {
  console.log('🔄 Đang thử kết nối trực tiếp đến PostgreSQL (Supabase)...');
  try {
    const client = await pool.connect();
    console.log('✅ KẾT NỐI THÀNH CÔNG ĐẾN POSTGRESQL!');
    
    const versionRes = await client.query('SELECT version();');
    console.log(`📌 Phiên bản PostgreSQL: ${versionRes.rows[0].version}`);

    const dbRes = await client.query('SELECT current_database(), current_user;');
    console.log(`📌 Database hiện tại: ${dbRes.rows[0].current_database} | User: ${dbRes.rows[0].current_user}`);

    // Kiểm tra các bảng đã tạo
    const tablesRes = await client.query(`
      SELECT table_name 
      FROM information_schema.tables 
      WHERE table_schema = 'public' 
      ORDER BY table_name;
    `);
    
    console.log('\n📋 Danh sách bảng trong public schema:');
    if (tablesRes.rows.length === 0) {
      console.log('   (Chưa có bảng nào được tạo. Hãy chạy script migration: npm run db:migrate)');
    } else {
      tablesRes.rows.forEach(r => console.log(`   - ${r.table_name}`));
    }

    client.release();
    process.exit(0);
  } catch (error) {
    console.error('\n❌ KẾT NỐI THẤT BẠI!');
    console.error('Chi tiết lỗi:', error.message);
    console.error('\n💡 Hướng dẫn kiểm tra:');
    console.error(' 1. Đảm bảo file backend/.env đã có dòng DATABASE_URL chính xác.');
    console.error(' 2. Kiểm tra lại password của database trên Supabase (tránh ký tự đặc biệt chưa được url-encode).');
    console.error(' 3. Kiểm tra kết nối mạng hoặc thử dùng Session Pooler (port 5432 hoặc 6543) của Supabase.');
    process.exit(1);
  }
}

testConnection();

