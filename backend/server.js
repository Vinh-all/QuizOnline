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

// Tuyến đường kiểm tra sức khỏe hệ thống (Health Check)
app.get('/api/health', (req, res) => {
  res.json({
    status: 'online',
    timestamp: new Date().toISOString(),
    service: 'QuizOnline Backend API',
    database: 'Supabase PostgreSQL',
  });
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

