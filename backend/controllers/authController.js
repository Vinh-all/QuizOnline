const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const db = require('../database/db');

// Hàm tạo JWT Token
const generateToken = (user) => {
  return jwt.sign(
    { id: user.id, email: user.email, role: user.role, full_name: user.full_name },
    process.env.JWT_SECRET || 'super_secret_jwt_key_quizonline_2026',
    { expiresIn: process.env.JWT_EXPIRES_IN || '7d' }
  );
};

// Đăng ký tài khoản mới (Mặc định: student)
exports.register = async (req, res) => {
  const { email, password, full_name, role = 'student' } = req.body;

  if (!email || !password || !full_name) {
    return res.status(400).json({
      success: false,
      message: 'Vui lòng cung cấp đầy đủ email, mật khẩu và họ tên!',
    });
  }

  try {
    // 1. Kiểm tra email đã tồn tại chưa
    const userExist = await db.query('SELECT id FROM users WHERE email = $1', [email.toLowerCase().trim()]);
    if (userExist.rows.length > 0) {
      return res.status(400).json({
        success: false,
        message: 'Email này đã được đăng ký trong hệ thống!',
      });
    }

    // 2. Băm mật khẩu
    const salt = await bcrypt.genSalt(10);
    const passwordHash = await bcrypt.hash(password, salt);

    // 3. Cho phép vai trò hợp lệ
    const validRoles = ['student', 'teacher'];
    const assignedRole = validRoles.includes(role) ? role : 'student';

    // 4. Lưu vào database
    const newUser = await db.query(
      `INSERT INTO users (email, password_hash, full_name, role)
       VALUES ($1, $2, $3, $4)
       RETURNING id, email, full_name, role, created_at`,
      [email.toLowerCase().trim(), passwordHash, full_name.trim(), assignedRole]
    );

    const user = newUser.rows[0];
    const token = generateToken(user);

    return res.status(201).json({
      success: true,
      message: 'Đăng ký tài khoản thành công!',
      token,
      user,
    });
  } catch (error) {
    console.error('Lỗi đăng ký:', error);
    return res.status(500).json({
      success: false,
      message: 'Lỗi máy chủ khi đăng ký tài khoản!',
    });
  }
};

// Đăng nhập
exports.login = async (req, res) => {
  const { email, password } = req.body;

  if (!email || !password) {
    return res.status(400).json({
      success: false,
      message: 'Vui lòng nhập email và mật khẩu!',
    });
  }

  try {
    // 1. Tìm người dùng theo email
    const result = await db.query(
      'SELECT id, email, password_hash, full_name, role, is_active FROM users WHERE email = $1',
      [email.toLowerCase().trim()]
    );

    if (result.rows.length === 0) {
      return res.status(401).json({
        success: false,
        message: 'Email hoặc mật khẩu không chính xác!',
      });
    }

    const user = result.rows[0];

    if (!user.is_active) {
      return res.status(403).json({
        success: false,
        message: 'Tài khoản của bạn đã bị vô hiệu hóa. Vui lòng liên hệ quản trị viên!',
      });
    }

    // 2. Kiểm tra mật khẩu
    const isMatch = await bcrypt.compare(password, user.password_hash);
    if (!isMatch) {
      return res.status(401).json({
        success: false,
        message: 'Email hoặc mật khẩu không chính xác!',
      });
    }

    // 3. Tạo token
    const token = generateToken(user);

    return res.json({
      success: true,
      message: 'Đăng nhập thành công!',
      token,
      user: {
        id: user.id,
        email: user.email,
        full_name: user.full_name,
        role: user.role,
      },
    });
  } catch (error) {
    console.error('Lỗi đăng nhập:', error);
    return res.status(500).json({
      success: false,
      message: 'Lỗi máy chủ khi đăng nhập!',
    });
  }
};

// Lấy thông tin tài khoản hiện tại
exports.getMe = async (req, res) => {
  try {
    const userRes = await db.query(
      'SELECT id, email, full_name, role, created_at FROM users WHERE id = $1',
      [req.user.id]
    );

    if (userRes.rows.length === 0) {
      return res.status(404).json({
        success: false,
        message: 'Không tìm thấy thông tin tài khoản!',
      });
    }

    return res.json({
      success: true,
      user: userRes.rows[0],
    });
  } catch (error) {
    console.error('Lỗi lấy thông tin tài khoản:', error);
    return res.status(500).json({
      success: false,
      message: 'Lỗi máy chủ!',
    });
  }
};
