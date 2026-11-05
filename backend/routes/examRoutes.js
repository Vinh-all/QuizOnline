const express = require('express');
const router = express.Router();
const examController = require('../controllers/examController');
const { authenticateToken } = require('../middlewares/auth');

// Tất cả thao tác thi đều yêu cầu đăng nhập
router.use(authenticateToken);

router.post('/start', examController.startExam);
router.post('/submit', examController.submitExam);
router.get('/history', examController.getExamHistory);
router.get('/attempt/:attempt_id', examController.getAttemptDetail);

module.exports = router;
