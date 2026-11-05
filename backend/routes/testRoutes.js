const express = require('express');
const router = express.Router();
const testController = require('../controllers/testController');
const { authenticateToken, authorizeRoles } = require('../middlewares/auth');

// Học sinh và khách có thể xem danh sách đề thi
router.get('/', testController.getAllTests);
router.get('/:id', testController.getTestById);

// Chỉ Admin và Teacher mới được tạo, xóa đề thi
router.post('/', authenticateToken, authorizeRoles('admin', 'teacher'), testController.createTest);
router.delete('/:id', authenticateToken, authorizeRoles('admin'), testController.deleteTest);

module.exports = router;

