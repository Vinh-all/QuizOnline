const express = require('express');
const cors = require('cors');
const morgan = require('morgan');
const compression = require('compression');
require('dotenv').config();

const authRoutes = require('./routes/authRoutes');
const testRoutes = require('./routes/testRoutes');
const examRoutes = require('./routes/examRoutes');
const statsRoutes = require('./routes/statsRoutes');

const app = express();
const { pool } = require('./database/db');
const PORT = process.env.PORT || 5000;

// Middleware nén dữ liệu HTTP Gzip để tăng tốc độ tải mạng
app.use(compression({
  threshold: 1024, // Chỉ nén các gói tin > 1KB
}));

// Middleware cơ bản
app.use(cors({
  origin: '*', // Cho phép kết nối từ Cloudflare Pages hoặc localhost
  methods: ['GET', 'POST', 'PUT', 'DELETE'],
  allowedHeaders: ['Content-Type', 'Authorization'],
}));
app.use(express.json({ limit: '10mb' }));
app.use(morgan('dev'));
// API trang chủ
app.get('/', (req, res) => {
  res.json({
    success: true,
    message: 'QuizOnline Backend API đang hoạt động!',
    version: '1.0.0',
    endpoints: {
      health: '/api/health',
      database: '/api/db-health',
      auth: '/api/auth',
      tests: '/api/tests',
      exams: '/api/exams',
      stats: '/api/stats'
    }
  });
});
// Tuyến đường kiểm tra sức khỏe hệ thống (Health Check)
app.get('/api/health', (req, res) => {
  res.json({
    status: 'online',
    timestamp: new Date().toISOString(),
    service: 'QuizOnline Backend API',
    database: 'Supabase PostgreSQL',
  });
});
// API kiểm tra kết nối Supabase PostgreSQL
app.get('/api/db-health', async (req, res) => {
  try {
    const result = await pool.query(`
      SELECT current_database() AS database,
             current_user AS user,
             NOW() AS server_time
    `);

    res.json({
      success: true,
      message: 'Kết nối Supabase thành công từ Render!',
      database: result.rows[0].database,
      user: result.rows[0].user,
      server_time: result.rows[0].server_time
    });
  } catch (error) {
    console.error('Database health check failed:', error.message);

    res.status(500).json({
      success: false,
      message: 'Không thể kết nối Supabase',
      error: error.message
    });
  }
});

// Đăng ký các Route API
app.use('/api/auth', authRoutes);
app.use('/api/tests', testRoutes);
app.use('/api/exams', examRoutes);
app.use('/api/stats', statsRoutes);

// Xử lý 404
app.use((req, res) => {
  res.status(404).json({
    success: false,
    message: 'Không tìm thấy API yêu cầu!',
  });
});

// Middleware xử lý lỗi toàn cục
app.use((err, req, res, next) => {
  console.error('Lỗi hệ thống chưa bắt:', err);
  res.status(500).json({
    success: false,
    message: 'Đã xảy ra sự cố nội bộ trên máy chủ!',
  });
});

if (require.main === module) {
  app.listen(PORT, () => {
    console.log(`===============================================`);
    console.log(`🚀 QuizOnline Backend đang chạy tại PORT: ${PORT}`);
    console.log(`📡 URL Health Check: http://localhost:${PORT}/api/health`);
    console.log(`===============================================`);
  });
}

module.exports = app;

