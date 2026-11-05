const express = require('express');
const router = express.Router();
const statsController = require('../controllers/statsController');
const { authenticateToken, authorizeRoles } = require('../middlewares/auth');

router.use(authenticateToken);

// Thống kê cá nhân của học sinh
router.get('/user', statsController.getUserStats);

// Thống kê toàn hệ thống dành cho Admin & Teacher
router.get('/dashboard', authorizeRoles('admin', 'teacher'), statsController.getDashboardStats);

module.exports = router;

