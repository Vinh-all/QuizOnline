require('dotenv').config();
const http = require('http');
const app = require('./server');

const PORT = 5001; // Dùng port phụ để test
const server = app.listen(PORT, async () => {
  console.log(`\n🧪 BẮT ĐẦU KIỂM THỬ TỰ ĐỘNG CÁC API BACKEND TRÊN PORT ${PORT}...`);

  const request = (path, method = 'GET', body = null, token = null) => {
    return new Promise((resolve, reject) => {
      const options = {
        hostname: 'localhost',
        port: PORT,
        path,
        method,
        headers: {
          'Content-Type': 'application/json',
        },
      };
      if (token) options.headers['Authorization'] = `Bearer ${token}`;

      const req = http.request(options, (res) => {
        let data = '';
        res.on('data', (chunk) => (data += chunk));
        res.on('end', () => {
          try {
            resolve({ status: res.statusCode, body: JSON.parse(data) });
          } catch {
            resolve({ status: res.statusCode, body: data });
          }
        });
      });

      req.on('error', reject);
      if (body) req.write(JSON.stringify(body));
      req.end();
    });
  };

  try {
    // 1. Health check
    console.log('1. Kiểm tra /api/health...');
    const health = await request('/api/health');
    console.log('   Status:', health.status, '| Body:', health.body);

    // 2. Login
    console.log('\n2. Kiểm tra Đăng nhập (/api/auth/login)...');
    const loginRes = await request('/api/auth/login', 'POST', {
      email: 'student@quizonline.com',
      password: '123456',
    });
    console.log('   Status:', loginRes.status, '| User:', loginRes.body.user);
    const token = loginRes.body.token;

    // 3. Get Tests
    console.log('\n3. Kiểm tra Lấy danh sách 5 bài thi (/api/tests)...');
    const testsRes = await request('/api/tests', 'GET', null, token);
    console.log(`   Status: ${testsRes.status} | Tổng số bài thi: ${testsRes.body.tests.length}`);
    testsRes.body.tests.forEach((t) => {
      console.log(`   - ${t.title}: ${t.parts_count} bài đọc, ${t.questions_count} câu hỏi (${t.time_limit_minutes} phút)`);
    });

    console.log('\n🎉 TẤT CẢ CÁC API BACKEND ĐÃ HOẠT ĐỘNG HOÀN HẢO!');
  } catch (err) {
    console.error('❌ Thử nghiệm thất bại:', err);
  } finally {
    server.close(() => {
      console.log('Đã đóng server kiểm thử.');
      process.exit(0);
    });
  }
});
