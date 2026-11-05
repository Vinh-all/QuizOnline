import React, { useState, useEffect } from 'react';
import { Clock, ChevronLeft, ChevronRight, CheckSquare, AlertTriangle, Send } from 'lucide-react';
import confetti from 'canvas-confetti';

export default function ExamScreen({ examData, onSubmitExam, onExit }) {
  const { attempt_id, test, parts, started_at } = examData;

  // Thu thập toàn bộ 40 câu hỏi thành mảng phẳng để điều hướng
  const flatQuestions = [];
  parts.forEach((part) => {
    part.questions.forEach((q) => {
      flatQuestions.push({
        ...q,
        part_id: part.id,
        part_number: part.part_number,
        part_title: part.title,
        passage_text: part.passage_text,
      });
    });
  });

  const [currentIndex, setCurrentIndex] = useState(0);
  const [selectedPartId, setSelectedPartId] = useState(parts[0]?.id || null);
  const [userAnswers, setUserAnswers] = useState({}); // { [question_id]: { selected_key, selected_option_id } }
  const [isUnlimitedTime, setIsUnlimitedTime] = useState(examData.is_timed !== undefined ? !examData.is_timed : true);
  const [elapsedTime, setElapsedTime] = useState(0); // Thời gian đã làm bài
  const [timeLeft, setTimeLeft] = useState((test.time_limit_minutes || (examData.part_number ? 15 : 60)) * 60);
  const [showSubmitModal, setShowSubmitModal] = useState(false);
  const [submitting, setSubmitting] = useState(false);

  // Câu hỏi hiện tại
  const currentQuestion = flatQuestions[currentIndex] || null;

  // Khi chuyển câu hỏi, tự động cập nhật tab bài đọc tương ứng
  useEffect(() => {
    if (currentQuestion && currentQuestion.part_id !== selectedPartId) {
      setSelectedPartId(currentQuestion.part_id);
    }
  }, [currentIndex]);

  // Bộ đếm thời gian: Không giới hạn (đếm xuôi) HOẶC Bấm giờ (đếm ngược)
  useEffect(() => {
    const timer = setInterval(() => {
      if (isUnlimitedTime) {
        setElapsedTime((prev) => prev + 1);
      } else {
        setTimeLeft((prev) => {
          if (prev <= 1) {
            clearInterval(timer);
            handleAutoSubmit();
            return 0;
          }
          return prev - 1;
        });
      }
    }, 1000);

    return () => clearInterval(timer);
  }, [isUnlimitedTime]);

  // Format MM:SS
  const formatTime = (seconds) => {
    const mins = Math.floor(seconds / 60);
    const secs = seconds % 60;
    return `${String(mins).padStart(2, '0')}:${String(secs).padStart(2, '0')}`;
  };

  // Chọn phương án
  const handleSelectOption = (qId, key, optId) => {
    setUserAnswers((prev) => ({
      ...prev,
      [qId]: { selected_key: key, selected_option_id: optId },
    }));
  };

  // Nộp bài tự động khi hết giờ
  const handleAutoSubmit = async () => {
    alert('⏰ Thời gian làm bài đã hết! Hệ thống đang tự động nộp bài và chấm điểm.');
    await doSubmit();
  };

  // Thực hiện gửi kết quả lên Backend
  const doSubmit = async () => {
    setSubmitting(true);
    try {
      const formattedAnswers = Object.keys(userAnswers).map((qId) => ({
        question_id: qId,
        selected_key: userAnswers[qId].selected_key,
        selected_option_id: userAnswers[qId].selected_option_id,
      }));

      await onSubmitExam(attempt_id, formattedAnswers);
    } catch (err) {
      alert('Lỗi nộp bài: ' + err.message);
      setSubmitting(false);
    }
  };

  // Lấy bài đọc đang hiển thị theo tab
  const activePart = parts.find((p) => p.id === selectedPartId) || parts[0];
  const answeredCount = Object.keys(userAnswers).length;
  const totalCount = flatQuestions.length;

  return (
    <div className="container" style={{ paddingBottom: '30px' }}>
      {/* Top Floating Exam Header */}
      <div 
        style={{
          display: 'flex',
          justifyContent: 'space-between',
          alignItems: 'center',
          background: '#ffffff',
          padding: '14px 24px',
          borderRadius: 'var(--radius-lg)',
          border: '1px solid var(--border-color)',
          boxShadow: 'var(--shadow-sm)',
          marginTop: '16px',
        }}
      >
        <div>
          <h2 style={{ fontSize: '1.25rem', fontWeight: 800, color: 'var(--dark)' }}>
            {test.title}
          </h2>
          <span style={{ fontSize: '0.85rem', color: 'var(--text-muted)' }}>
            Đã làm: <strong style={{ color: 'var(--primary)' }}>{answeredCount}</strong> / {totalCount} câu
          </span>
        </div>

        {/* Timer & Controls Box */}
        <div style={{ display: 'flex', alignItems: 'center', gap: '14px', flexWrap: 'wrap' }}>
          {/* Nút chuyển đổi chế độ thời gian */}
          <button 
            onClick={() => setIsUnlimitedTime(!isUnlimitedTime)}
            title="Bấm để chuyển đổi giữa Không giới hạn thời gian và Bấm giờ 60 phút"
            style={{
              display: 'flex',
              alignItems: 'center',
              gap: '6px',
              padding: '8px 14px',
              borderRadius: '8px',
              fontSize: '0.84rem',
              fontWeight: 700,
              background: isUnlimitedTime ? '#ecfdf5' : '#fef3c7',
              color: isUnlimitedTime ? '#047857' : '#b45309',
              border: `1.5px solid ${isUnlimitedTime ? '#a7f3d0' : '#fde68a'}`,
            }}
          >
            {isUnlimitedTime ? '🟢 Không giới hạn giờ' : '⏳ Bấm giờ 60 phút'}
          </button>

          {/* Hộp đồng hồ */}
          <div 
            className={`timer-box ${!isUnlimitedTime && timeLeft < 300 ? 'timer-warning' : ''}`}
            style={{
              background: isUnlimitedTime ? '#f0fdf4' : undefined,
              borderColor: isUnlimitedTime ? '#bbf7d0' : undefined,
            }}
          >
            <Clock size={18} color={isUnlimitedTime ? '#047857' : undefined} />
            <span style={{ color: isUnlimitedTime ? '#047857' : undefined }}>
              {formatTime(isUnlimitedTime ? elapsedTime : timeLeft)}
            </span>
          </div>

          <button 
            onClick={() => setShowSubmitModal(true)}
            style={{
              display: 'flex',
              alignItems: 'center',
              gap: '8px',
              padding: '10px 20px',
              background: 'var(--primary)',
              color: '#ffffff',
              borderRadius: '8px',
              fontWeight: 700,
              fontSize: '0.92rem',
              boxShadow: '0 4px 10px rgba(79, 70, 229, 0.25)',
            }}
          >
            <Send size={16} />
            Nộp Bài Thi
          </button>
        </div>
      </div>

      {/* Main Exam Split View (2 Boxes) */}
      <div className="exam-layout">
        {/* Box Cột Trái: BÀI ĐỌC (Passage Box) */}
        <div className="passage-panel">
          {/* Part Selection Tabs (Nếu luyện cả đề thì có 4 tabs, nếu luyện 1 part thì hiện nhãn Part đó) */}
          <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '14px', borderBottom: '1px solid var(--border-color)', paddingBottom: '10px' }}>
            {parts.length > 1 ? (
              <div className="passage-tabs" style={{ marginBottom: 0, paddingBottom: 0, borderBottom: 'none' }}>
                {parts.map((p) => (
                  <button
                    key={p.id}
                    className={`passage-tab-btn ${selectedPartId === p.id ? 'active' : ''}`}
                    onClick={() => setSelectedPartId(p.id)}
                  >
                    Part {p.part_number}
                  </button>
                ))}
              </div>
            ) : (
              <span style={{ fontSize: '0.85rem', fontWeight: 800, color: 'var(--primary)', background: 'var(--primary-light)', padding: '6px 14px', borderRadius: '8px' }}>
                🎯 Đang luyện riêng Part {activePart.part_number} (10 câu trắc nghiệm)
              </span>
            )}
            <span style={{ fontSize: '0.78rem', fontWeight: 700, color: 'var(--text-muted)', textTransform: 'uppercase' }}>
              📄 Đoạn văn bản bài đọc
            </span>
          </div>

          {/* Title of Reading Section */}
          <h3 style={{ fontSize: '1.2rem', fontWeight: 800, color: 'var(--dark)', marginBottom: '16px', lineHeight: 1.4 }}>
            {activePart.title}
          </h3>

          {/* Reading Passage Text with clean paragraph split */}
          <div className="passage-content">
            {activePart.passage_text.split(/\r?\n\s*\r?\n/).map((paragraph, idx) => (
              <p key={idx} style={{ marginBottom: '14px', textAlign: 'justify', lineHeight: 1.75 }}>
                {paragraph}
              </p>
            ))}
          </div>
        </div>

        {/* Box Cột Phải: CÂU HỎI & PHƯƠNG ÁN (Question Box) */}
        <div className="question-panel">
          <div>
            {/* Header câu hỏi */}
            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '14px' }}>
              <span style={{ fontSize: '0.88rem', fontWeight: 700, color: 'var(--primary)', background: 'var(--primary-light)', padding: '4px 10px', borderRadius: '6px' }}>
                Câu {currentIndex + 1} / {totalCount} (Part {currentQuestion?.part_number})
              </span>
              <span style={{ fontSize: '0.8rem', color: 'var(--text-muted)', fontWeight: 600 }}>
                {activePart.title.length > 25 ? activePart.title.slice(0, 25) + '...' : activePart.title}
              </span>
            </div>

            {/* Question Text */}
            <h4 style={{ fontSize: '1.08rem', fontWeight: 700, color: 'var(--dark)', marginBottom: '20px', lineHeight: 1.5 }}>
              Câu {currentQuestion?.question_number}: {currentQuestion?.question_text}
            </h4>

            {/* 4 Options Buttons */}
            <div style={{ display: 'flex', flexDirection: 'column' }}>
              {currentQuestion?.options.map((opt) => {
                const isSelected = userAnswers[currentQuestion.id]?.selected_key === opt.option_key;
                return (
                  <button
                    key={opt.id || opt.option_key}
                    className={`option-btn ${isSelected ? 'selected' : ''}`}
                    onClick={() => handleSelectOption(currentQuestion.id, opt.option_key, opt.id)}
                  >
                    <span className="option-key-badge">{opt.option_key}</span>
                    <span style={{ flex: 1 }}>{opt.option_text}</span>
                  </button>
                );
              })}
            </div>
          </div>

          {/* Bottom Area: Controls & Question Palette Box */}
          <div>
            {/* Previous / Next Button */}
            <div style={{ display: 'flex', justifyContent: 'space-between', gap: '12px', marginTop: '16px', marginBottom: '16px' }}>
              <button
                disabled={currentIndex === 0}
                onClick={() => setCurrentIndex((prev) => Math.max(0, prev - 1))}
                style={{
                  display: 'flex',
                  alignItems: 'center',
                  gap: '6px',
                  padding: '10px 16px',
                  borderRadius: '8px',
                  background: '#f1f5f9',
                  color: currentIndex === 0 ? '#cbd5e1' : 'var(--text-main)',
                  fontWeight: 600,
                  fontSize: '0.88rem',
                }}
              >
                <ChevronLeft size={18} /> Câu trước
              </button>

              <button
                disabled={currentIndex === totalCount - 1}
                onClick={() => setCurrentIndex((prev) => Math.min(totalCount - 1, prev + 1))}
                style={{
                  display: 'flex',
                  alignItems: 'center',
                  gap: '6px',
                  padding: '10px 16px',
                  borderRadius: '8px',
                  background: 'var(--primary)',
                  color: '#ffffff',
                  fontWeight: 600,
                  fontSize: '0.88rem',
                }}
              >
                Câu tiếp <ChevronRight size={18} />
              </button>
            </div>

            {/* 40 Question Palette Box */}
            <div style={{ borderTop: '1px solid var(--border-color)', paddingTop: '12px' }}>
              <div style={{ fontSize: '0.78rem', fontWeight: 700, textTransform: 'uppercase', color: 'var(--text-muted)', marginBottom: '8px' }}>
                Danh sách 40 câu hỏi:
              </div>
              <div className="palette-grid">
                {flatQuestions.map((q, idx) => {
                  const isAnswered = !!userAnswers[q.id];
                  const isCurrent = idx === currentIndex;
                  return (
                    <button
                      key={q.id}
                      className={`palette-btn ${isCurrent ? 'active' : ''} ${isAnswered ? 'answered' : ''}`}
                      onClick={() => setCurrentIndex(idx)}
                    >
                      {idx + 1}
                    </button>
                  );
                })}
              </div>
            </div>
          </div>
        </div>
      </div>

      {/* Confirmation Submit Modal */}
      {showSubmitModal && (
        <div className="modal-overlay">
          <div className="modal-box">
            <h3 style={{ fontSize: '1.3rem', fontWeight: 800, marginBottom: '10px', color: 'var(--dark)' }}>
              Xác Nhận Nộp Bài Thi?
            </h3>
            <p style={{ fontSize: '0.92rem', color: 'var(--text-muted)', marginBottom: '16px' }}>
              Bạn đã hoàn thành <strong>{answeredCount} / {totalCount}</strong> câu hỏi.
              {answeredCount < totalCount && (
                <span style={{ display: 'block', color: '#dc2626', fontWeight: 600, marginTop: '8px' }}>
                  ⚠️ Còn {totalCount - answeredCount} câu chưa làm. Bạn có chắc muốn nộp sớm không?
                </span>
              )}
            </p>

            <div style={{ display: 'flex', justifyContent: 'flex-end', gap: '12px' }}>
              <button 
                onClick={() => setShowSubmitModal(false)}
                disabled={submitting}
                style={{ padding: '10px 18px', borderRadius: '8px', background: '#f1f5f9', fontWeight: 600 }}
              >
                Tiếp tục làm bài
              </button>
              <button 
                onClick={doSubmit}
                disabled={submitting}
                style={{ padding: '10px 20px', borderRadius: '8px', background: 'var(--primary)', color: '#ffffff', fontWeight: 700 }}
              >
                {submitting ? 'Đang chấm điểm...' : 'Đồng ý nộp'}
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}

