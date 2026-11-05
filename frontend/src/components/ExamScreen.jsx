import React, { useState, useEffect, useMemo, useCallback } from 'react';
import { Clock, ChevronLeft, ChevronRight, CheckSquare, AlertTriangle, Send, CheckCircle2 } from 'lucide-react';

// Subcomponent Đồng hồ tính giờ độc lập - Tránh re-render toàn bộ 40 câu hỏi và bài đọc mỗi giây
function ExamTimer({ isUnlimitedTime, initialTimeLeft, onToggleMode, onTimeOut }) {
  const [elapsedTime, setElapsedTime] = useState(0);
  const [timeLeft, setTimeLeft] = useState(initialTimeLeft);

  useEffect(() => {
    const timer = setInterval(() => {
      if (isUnlimitedTime) {
        setElapsedTime((prev) => prev + 1);
      } else {
        setTimeLeft((prev) => {
          if (prev <= 1) {
            clearInterval(timer);
            if (onTimeOut) onTimeOut();
            return 0;
          }
          return prev - 1;
        });
      }
    }, 1000);

    return () => clearInterval(timer);
  }, [isUnlimitedTime, onTimeOut]);

  // Format MM:SS
  const formatTime = (seconds) => {
    const mins = Math.floor(seconds / 60);
    const secs = seconds % 60;
    return `${String(mins).padStart(2, '0')}:${String(secs).padStart(2, '0')}`;
  };

  return (
    <>
      {/* Nút chuyển đổi chế độ thời gian */}
      <button 
        onClick={onToggleMode}
        title="Bấm để chuyển đổi giữa Không giới hạn thời gian và Bấm giờ"
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
          cursor: 'pointer',
        }}
      >
        {isUnlimitedTime ? '🟢 Không giới hạn giờ' : '⏳ Bấm giờ tính thời gian'}
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
    </>
  );
}

export default function ExamScreen({ examData, onSubmitExam, onExit }) {
  const { attempt_id, test, parts } = examData;

  // Thu thập toàn bộ câu hỏi thành mảng phẳng - useMemo để không bao giờ tạo lại nếu parts không đổi
  const flatQuestions = useMemo(() => {
    const list = [];
    parts.forEach((part) => {
      part.questions.forEach((q) => {
        list.push({
          ...q,
          part_id: part.id,
          part_number: part.part_number,
          part_title: part.title,
          passage_text: part.passage_text,
        });
      });
    });
    return list;
  }, [parts]);

  const [currentIndex, setCurrentIndex] = useState(0);
  const [selectedPartId, setSelectedPartId] = useState(parts[0]?.id || null);
  const [userAnswers, setUserAnswers] = useState({}); // { [question_id]: { selected_key, selected_option_id } }
  const [isUnlimitedTime, setIsUnlimitedTime] = useState(examData.is_timed !== undefined ? !examData.is_timed : true);
  const [showSubmitModal, setShowSubmitModal] = useState(false);
  const [submitting, setSubmitting] = useState(false);
  const [mobileTab, setMobileTab] = useState('question');

  // Câu hỏi hiện tại
  const currentQuestion = flatQuestions[currentIndex] || null;

  // Khi chuyển câu hỏi, tự động cập nhật tab bài đọc tương ứng
  useEffect(() => {
    if (currentQuestion && currentQuestion.part_id !== selectedPartId) {
      setSelectedPartId(currentQuestion.part_id);
    }
  }, [currentIndex, currentQuestion, selectedPartId]);

  // Chọn phương án - useCallback để tối ưu re-render các button
  const handleSelectOption = useCallback((qId, key, optId) => {
    setUserAnswers((prev) => ({
      ...prev,
      [qId]: { selected_key: key, selected_option_id: optId },
    }));
  }, []);

  // Thực hiện gửi kết quả lên Backend
  const doSubmit = useCallback(async () => {
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
  }, [attempt_id, userAnswers, onSubmitExam]);

  // Nộp bài tự động khi hết giờ
  const handleAutoSubmit = useCallback(async () => {
    alert('⏰ Thời gian làm bài đã hết! Hệ thống đang tự động nộp bài và chấm điểm.');
    await doSubmit();
  }, [doSubmit]);

  // Lấy bài đọc đang hiển thị theo tab (useMemo)
  const activePart = useMemo(() => {
    return parts.find((p) => p.id === selectedPartId) || parts[0];
  }, [parts, selectedPartId]);

  // Tách đoạn văn bản bài đọc thành các đoạn <p> - useMemo để tránh split string liên tục
  const paragraphs = useMemo(() => {
    if (!activePart?.passage_text) return [];
    return activePart.passage_text.split(/\r?\n\s*\r?\n/);
  }, [activePart?.passage_text]);

  const totalCount = flatQuestions.length;
  const answeredCount = useMemo(() => {
    return Object.keys(userAnswers).filter((k) => !!userAnswers[k]?.selected_key).length;
  }, [userAnswers]);

  const allAnswered = answeredCount === totalCount && totalCount > 0;
  const firstUnansweredIndex = useMemo(() => {
    return flatQuestions.findIndex((q) => !userAnswers[q.id] || !userAnswers[q.id].selected_key);
  }, [flatQuestions, userAnswers]);

  // Xử lý khi bấm nút Nộp bài ở cuối trang (chuyển từ nút Câu tiếp khi đến câu cuối)
  const handleBottomSubmitClick = () => {
    if (!allAnswered) {
      const remaining = totalCount - answeredCount;
      alert(`⚠️ Nút nộp bài này bắt buộc bạn phải trả lời đủ tất cả ${totalCount} câu hỏi! Hiện còn ${remaining} câu chưa làm.\n\nHệ thống sẽ tự động chuyển bạn đến câu chưa chọn đáp án.\n(Mẹo: Bạn có thể dùng nút "Nộp Bài Thi" ở thanh trên cùng nếu muốn nộp bài sớm).`);
      if (firstUnansweredIndex !== -1) {
        setCurrentIndex(firstUnansweredIndex);
      }
      return;
    }
    setShowSubmitModal(true);
  };

  const initialTimeSeconds = (test.time_limit_minutes || (examData.part_number ? 15 : 60)) * 60;

  return (
    <div className="container" style={{ paddingBottom: '30px' }}>
      {/* Top Floating Exam Header */}
      <div 
        className="exam-header-bar"
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
        <div className="exam-header-controls" style={{ display: 'flex', alignItems: 'center', gap: '14px', flexWrap: 'wrap' }}>
          <ExamTimer
            isUnlimitedTime={isUnlimitedTime}
            initialTimeLeft={initialTimeSeconds}
            onToggleMode={() => setIsUnlimitedTime(!isUnlimitedTime)}
            onTimeOut={handleAutoSubmit}
          />

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
              cursor: 'pointer',
            }}
          >
            <Send size={16} />
            Nộp Bài Thi
          </button>
        </div>
      </div>

      {/* Thanh chuyển đổi linh hoạt trên Điện thoại (iPhone / Android) */}
      <div className="mobile-view-tabs">
        <button 
          className={`mobile-tab-btn ${mobileTab === 'question' ? 'active' : ''}`}
          onClick={() => setMobileTab('question')}
        >
          ✍️ Câu Hỏi ({currentIndex + 1}/{totalCount})
        </button>
        <button 
          className={`mobile-tab-btn ${mobileTab === 'passage' ? 'active' : ''}`}
          onClick={() => setMobileTab('passage')}
        >
          📄 Bài Đọc (Part {activePart.part_number})
        </button>
        <button 
          className={`mobile-tab-btn ${mobileTab === 'both' ? 'active' : ''}`}
          onClick={() => setMobileTab('both')}
        >
          📱 Cả Hai
        </button>
      </div>

      {/* Main Exam Split View (2 Boxes) */}
      <div className={`exam-layout ${mobileTab === 'passage' ? 'show-passage-only' : mobileTab === 'question' ? 'show-question-only' : ''}`}>
        {/* Box Cột Trái: BÀI ĐỌC (Passage Box) */}
        <div className="passage-panel">
          {/* Part Selection Tabs */}
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

          {/* Reading Passage Text with memoized paragraphs */}
          <div className="passage-content">
            {paragraphs.map((paragraph, idx) => (
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
                  cursor: currentIndex === 0 ? 'not-allowed' : 'pointer',
                }}
              >
                <ChevronLeft size={18} /> Câu trước
              </button>

              {currentIndex < totalCount - 1 ? (
                <button
                  onClick={() => setCurrentIndex((prev) => Math.min(totalCount - 1, prev + 1))}
                  style={{
                    display: 'flex',
                    alignItems: 'center',
                    gap: '6px',
                    padding: '10px 18px',
                    borderRadius: '8px',
                    background: 'var(--primary)',
                    color: '#ffffff',
                    fontWeight: 700,
                    fontSize: '0.88rem',
                    cursor: 'pointer',
                  }}
                >
                  Câu tiếp <ChevronRight size={18} />
                </button>
              ) : (
                <button
                  onClick={handleBottomSubmitClick}
                  style={{
                    display: 'flex',
                    alignItems: 'center',
                    gap: '6px',
                    padding: '10px 18px',
                    borderRadius: '8px',
                    background: allAnswered 
                      ? 'linear-gradient(135deg, #059669, #10b981)' 
                      : '#f1f5f9',
                    color: allAnswered ? '#ffffff' : '#475569',
                    border: allAnswered ? 'none' : '1.5px solid #cbd5e1',
                    fontWeight: 800,
                    fontSize: '0.88rem',
                    boxShadow: allAnswered ? '0 4px 12px rgba(16, 185, 129, 0.3)' : 'none',
                    cursor: 'pointer',
                  }}
                  title={allAnswered ? 'Đã làm đủ tất cả các câu - Bấm để nộp bài' : `Bắt buộc chọn đủ ${totalCount} câu để nộp bằng nút này (Đã làm: ${answeredCount}/${totalCount})`}
                >
                  <CheckCircle2 size={18} color={allAnswered ? '#ffffff' : '#64748b'} />
                  {allAnswered ? 'Nộp Bài Thi' : `Nộp Bài (${answeredCount}/${totalCount})`}
                </button>
              )}
            </div>

            {/* Question Palette Box */}
            <div style={{ borderTop: '1px solid var(--border-color)', paddingTop: '12px' }}>
              <div style={{ fontSize: '0.78rem', fontWeight: 700, textTransform: 'uppercase', color: 'var(--text-muted)', marginBottom: '8px' }}>
                {totalCount === 10 ? 'Danh sách 10 câu hỏi của Part này:' : 'Danh sách 40 câu hỏi (4 Parts):'}
              </div>
              <div className="palette-grid">
                {flatQuestions.map((q, idx) => {
                  const isAnswered = !!userAnswers[q.id]?.selected_key;
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
                style={{ padding: '10px 18px', borderRadius: '8px', background: '#f1f5f9', fontWeight: 600, cursor: 'pointer' }}
              >
                Tiếp tục làm bài
              </button>
              <button 
                onClick={doSubmit}
                disabled={submitting}
                style={{ padding: '10px 20px', borderRadius: '8px', background: 'var(--primary)', color: '#ffffff', fontWeight: 700, cursor: 'pointer' }}
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
