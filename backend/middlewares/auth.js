const jwt = require('jsonwebtoken');

// Middleware xác thực JWT Token
const authenticateToken = (req, res, next) => {
  const authHeader = req.headers['authorization'];
  const token = authHeader && authHeader.split(' ')[1]; // "Bearer TOKEN"

  if (!token) {
    return res.status(401).json({
      success: false,
      message: 'Không tìm thấy mã xác thực (Token). Vui lòng đăng nhập!',
    });
  }

  jwt.verify(token, process.env.JWT_SECRET || 'super_secret_jwt_key_quizonline_2026', (err, user) => {
    if (err) {
      return res.status(403).json({
        success: false,
        message: 'Mã xác thực không hợp lệ hoặc đã hết hạn. Vui lòng đăng nhập lại!',
      });
    }
    req.user = user;
    next();
  });
};

// Middleware kiểm tra phân quyền người dùng (Role-Based Access Control)
const authorizeRoles = (...roles) => {
  return (req, res, next) => {
    if (!req.user || !roles.includes(req.user.role)) {
      return res.status(403).json({
        success: false,
        message: `Bạn không có quyền truy cập chức năng này (Yêu cầu vai trò: ${roles.join(', ')})`,
      });
    }
    next();
  };
};

module.exports = {
  authenticateToken,
  authorizeRoles,
};

