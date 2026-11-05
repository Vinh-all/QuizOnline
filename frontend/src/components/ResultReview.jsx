import React, { useEffect, useState } from 'react';
import { Award, CheckCircle, XCircle, AlertCircle, Home, BookOpen, Check, X } from 'lucide-react';
import confetti from 'canvas-confetti';
import { apiClient } from '../api/client';

export default function ResultReview({ attemptId, onBackToTests, onRetake }) {
  const [detailData, setDetailData] = useState(null);
  const [loading, setLoading] = useState(true);
  const [activePartFilter, setActivePartFilter] = useState('all');
  const [statusFilter, setStatusFilter] = useState('all'); // 'all' | 'correct' | 'wrong' | 'unanswered'

  useEffect(() => {
    async function fetchDetail() {
      try {
        const res = await apiClient.getAttemptDetail(attemptId);
        setDetailData(res);
        if (res.attempt && res.attempt.score >= 7.0) {
          confetti({
            particleCount: 100,
            spread: 70,
            origin: { y: 0.6 }
          });
        }
      } catch (err) {
        console.error('Lỗi tải kết quả:', err);
      } finally {
        setLoading(false);
      }
    }
    fetchDetail();
  }, [attemptId]);

  if (loading) {
    return (
      <div className="container" style={{ textAlign: 'center', padding: '80px 0' }}>
        <div style={{ fontSize: '1.2rem', fontWeight: 700, color: 'var(--text-muted)' }}>
          ⏳ Đang tổng hợp kết quả và phân tích đáp án chi tiết...
        </div>
      </div>
    );
  }

  if (!detailData) {
    return (
      <div className="container" style={{ textAlign: 'center', padding: '60px 0' }}>
        <h3>Không thể tải kết quả bài thi!</h3>
        <button onClick={onBackToTests} style={{ marginTop: '16px', padding: '10px 20px', background: 'var(--primary)', color: 'white', borderRadius: '8px' }}>
          Quay lại danh sách đề thi
        </button>
      </div>
    );
  }

  const { attempt, review = [] } = detailData;

  // Thống kê số lượng: Đúng, Sai, Chưa chọn
  const correctCount = review.filter((q) => q.is_correct).length;
  const wrongCount = review.filter((q) => !!q.selected_key && !q.is_correct).length;
  const unansweredCount = review.filter((q) => !q.selected_key).length;

  // Lọc câu hỏi theo Part và Trạng thái
  const filteredQuestions = review.filter((q) => {
    if (activePartFilter !== 'all' && String(q.part_number) !== String(activePartFilter)) {
      return false;
    }
    if (statusFilter === 'correct') return q.is_correct;
    if (statusFilter === 'wrong') return !!q.selected_key && !q.is_correct;
    if (statusFilter === 'unanswered') return !q.selected_key;
    return true;
  });

  return (
    <div className="container animate-fade" style={{ padding: '30px 24px 60px' }}>
      {/* Score Summary Box */}
      <div 
        className="score-summary-card"
        style={{
          background: 'linear-gradient(135deg, #1e1b4b, #312e81)',
          borderRadius: 'var(--radius-xl)',
          padding: '36px 40px',
          color: '#ffffff',
          boxShadow: 'var(--shadow-xl)',
          marginBottom: '28px',
          display: 'flex',
          flexWrap: 'wrap',
          justifyContent: 'space-between',
          alignItems: 'center',
          gap: '24px'
        }}
      >
        <div>
          <span style={{ background: 'rgba(255, 255, 255, 0.2)', padding: '6px 14px', borderRadius: '999px', fontSize: '0.85rem', fontWeight: 700, textTransform: 'uppercase' }}>
            Kết Quả Bài Thi
          </span>
          <h2 style={{ fontSize: '1.9rem', fontWeight: 800, marginTop: '10px', marginBottom: '6px' }}>
            {attempt.test_title}
          </h2>
          <p style={{ opacity: 0.85, fontSize: '0.92rem' }}>
            Nộp bài lúc: {new Date(attempt.submitted_at).toLocaleString('vi-VN')}
          </p>
        </div>

        {/* 4 Chỉ số: Điểm, Đúng, Sai, Chưa chọn */}
        <div style={{ display: 'flex', gap: '20px', alignItems: 'center', flexWrap: 'wrap' }}>
          {/* Điểm số */}
          <div style={{ textAlign: 'center', minWidth: '90px' }}>
            <div style={{ fontSize: '2.8rem', fontWeight: 800, color: '#38bdf8', lineHeight: 1 }}>
              {attempt.score}
            </div>
            <div style={{ fontSize: '0.8rem', opacity: 0.85, marginTop: '6px', fontWeight: 600 }}>Thang điểm 10</div>
          </div>

          <div style={{ width: '1px', height: '50px', background: 'rgba(255,255,255,0.2)' }}></div>

          {/* Câu đúng */}
          <div style={{ textAlign: 'center', minWidth: '70px' }}>
            <div style={{ fontSize: '2.4rem', fontWeight: 800, color: '#4ade80', lineHeight: 1 }}>
              {correctCount}
            </div>
            <div style={{ fontSize: '0.8rem', opacity: 0.85, marginTop: '6px', fontWeight: 600 }}>Câu đúng</div>
          </div>

          {/* Câu sai */}
          <div style={{ textAlign: 'center', minWidth: '70px' }}>
            <div style={{ fontSize: '2.4rem', fontWeight: 800, color: '#f87171', lineHeight: 1 }}>
              {wrongCount}
            </div>
            <div style={{ fontSize: '0.8rem', opacity: 0.85, marginTop: '6px', fontWeight: 600 }}>Câu sai</div>
          </div>

          {/* Chưa chọn */}
          <div style={{ textAlign: 'center', minWidth: '70px' }}>
            <div style={{ fontSize: '2.4rem', fontWeight: 800, color: '#facc15', lineHeight: 1 }}>
              {unansweredCount}
            </div>
            <div style={{ fontSize: '0.8rem', opacity: 0.85, marginTop: '6px', fontWeight: 600 }}>Chưa chọn</div>
          </div>
        </div>

        {/* Actions */}
        <div>
          <button 
            onClick={onBackToTests}
            style={{
              display: 'flex',
              alignItems: 'center',
              gap: '8px',
              padding: '12px 20px',
              borderRadius: '10px',
              background: 'rgba(255,255,255,0.18)',
              color: '#ffffff',
              fontWeight: 700,
              fontSize: '0.92rem',
              border: '1px solid rgba(255,255,255,0.25)',
            }}
          >
            <Home size={18} /> Danh Sách Đề
          </button>
        </div>
      </div>

      {/* Filter Tabs Bar (Lọc theo Part & Lọc theo Trạng Thái Đúng/Sai/Chưa Chọn) */}
      <div style={{ display: 'flex', flexDirection: 'column', gap: '12px', marginBottom: '24px' }}>
        {/* Lọc Trạng Thái: Tất cả | Đúng | Sai | Chưa chọn */}
        <div style={{ display: 'flex', gap: '8px', flexWrap: 'wrap' }}>
          <button
            onClick={() => setStatusFilter('all')}
            style={{
              padding: '8px 16px',
              borderRadius: '8px',
              fontWeight: 700,
              fontSize: '0.88rem',
              background: statusFilter === 'all' ? 'var(--dark)' : '#ffffff',
              color: statusFilter === 'all' ? '#ffffff' : 'var(--text-main)',
              border: '1px solid var(--border-color)',
            }}
          >
            Tất cả ({review.length})
          </button>
          <button
            onClick={() => setStatusFilter('correct')}
            style={{
              padding: '8px 16px',
              borderRadius: '8px',
              fontWeight: 700,
              fontSize: '0.88rem',
              background: statusFilter === 'correct' ? '#16a34a' : '#ffffff',
              color: statusFilter === 'correct' ? '#ffffff' : '#166534',
              border: `1.5px solid ${statusFilter === 'correct' ? '#16a34a' : '#bbf7d0'}`,
            }}
          >
            ✅ Câu đúng ({correctCount})
          </button>
          <button
            onClick={() => setStatusFilter('wrong')}
            style={{
              padding: '8px 16px',
              borderRadius: '8px',
              fontWeight: 700,
              fontSize: '0.88rem',
              background: statusFilter === 'wrong' ? '#dc2626' : '#ffffff',
              color: statusFilter === 'wrong' ? '#ffffff' : '#991b1b',
              border: `1.5px solid ${statusFilter === 'wrong' ? '#dc2626' : '#fecaca'}`,
            }}
          >
            ❌ Câu đã chọn sai ({wrongCount})
          </button>
          <button
            onClick={() => setStatusFilter('unanswered')}
            style={{
              padding: '8px 16px',
              borderRadius: '8px',
              fontWeight: 700,
              fontSize: '0.88rem',
              background: statusFilter === 'unanswered' ? '#d97706' : '#ffffff',
              color: statusFilter === 'unanswered' ? '#ffffff' : '#92400e',
              border: `1.5px solid ${statusFilter === 'unanswered' ? '#d97706' : '#fde68a'}`,
            }}
          >
            ⚠️ Câu chưa chọn ({unansweredCount})
          </button>
        </div>

        {/* Lọc theo Part (Chỉ hiện khi thi cả đề 40 câu) */}
        {!attempt.part_number && (
          <div style={{ display: 'flex', gap: '8px', overflowX: 'auto', paddingBottom: '4px' }}>
            <button 
              onClick={() => setActivePartFilter('all')}
              style={{
                padding: '6px 14px',
                borderRadius: '6px',
                fontWeight: 600,
                fontSize: '0.82rem',
                background: activePartFilter === 'all' ? 'var(--primary-light)' : '#ffffff',
                color: activePartFilter === 'all' ? 'var(--primary)' : 'var(--text-muted)',
                border: '1px solid var(--border-color)',
              }}
            >
              Cả 4 Parts
            </button>
            {[1, 2, 3, 4].map(partNum => (
              <button 
                key={partNum}
                onClick={() => setActivePartFilter(partNum)}
                style={{
                  padding: '6px 14px',
                  borderRadius: '6px',
                  fontWeight: 600,
                  fontSize: '0.82rem',
                  background: activePartFilter === partNum ? 'var(--primary-light)' : '#ffffff',
                  color: activePartFilter === partNum ? 'var(--primary)' : 'var(--text-muted)',
                  border: '1px solid var(--border-color)',
                }}
              >
                Part {partNum}
              </button>
            ))}
          </div>
        )}
      </div>

      {/* Danh Sách Chi Tiết Từng Câu Hỏi */}
      <div style={{ display: 'flex', flexDirection: 'column', gap: '20px' }}>
        {filteredQuestions.length === 0 ? (
          <div style={{ background: '#ffffff', padding: '36px', borderRadius: '12px', textAlign: 'center', border: '1px solid var(--border-color)', color: 'var(--text-muted)' }}>
            Không có câu hỏi nào trong mục lọc này.
          </div>
        ) : (
          filteredQuestions.map((q) => {
            const isAnswered = !!q.selected_key;
            const isCorrect = q.is_correct;
            const isWrong = isAnswered && !isCorrect;
            const isUnanswered = !isAnswered;

            // Màu viền thẻ câu hỏi
            let cardBorder = '#86efac'; // Green nếu đúng
            if (isWrong) cardBorder = '#fca5a5'; // Red nếu sai
            if (isUnanswered) cardBorder = '#fde68a'; // Amber nếu chưa chọn

            return (
              <div 
                key={q.question_id}
                style={{
                  background: '#ffffff',
                  border: `1.5px solid ${cardBorder}`,
                  borderRadius: 'var(--radius-lg)',
                  padding: '24px',
                  boxShadow: 'var(--shadow-sm)',
                }}
              >
                {/* Header câu hỏi: Số câu, Part, và Trạng Thái */}
                <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '14px', flexWrap: 'wrap', gap: '8px' }}>
                  <span style={{ fontSize: '0.88rem', fontWeight: 700, color: 'var(--text-muted)' }}>
                    Câu {q.question_number} • {q.part_title}
                  </span>

                  {/* Huy hiệu trạng thái: Đúng / Sai / Chưa chọn */}
                  <div>
                    {isCorrect && (
                      <span style={{ display: 'flex', alignItems: 'center', gap: '4px', color: '#16a34a', fontWeight: 800, fontSize: '0.88rem', background: '#dcfce7', padding: '4px 12px', borderRadius: '999px', border: '1px solid #bbf7d0' }}>
                        <CheckCircle size={15} /> Bạn đã trả lời ĐÚNG
                      </span>
                    )}
                    {isWrong && (
                      <span style={{ display: 'flex', alignItems: 'center', gap: '4px', color: '#dc2626', fontWeight: 800, fontSize: '0.88rem', background: '#fee2e2', padding: '4px 12px', borderRadius: '999px', border: '1px solid #fecaca' }}>
                        <XCircle size={15} /> Bạn đã trả lời SAI
                      </span>
                    )}
                    {isUnanswered && (
                      <span style={{ display: 'flex', alignItems: 'center', gap: '4px', color: '#b45309', fontWeight: 800, fontSize: '0.88rem', background: '#fef3c7', padding: '4px 12px', borderRadius: '999px', border: '1px solid #fde68a' }}>
                        <AlertCircle size={15} /> Câu này CHƯA CHỌN (Bỏ trống)
                      </span>
                    )}
                  </div>
                </div>

                {/* Tiêu đề câu hỏi */}
                <h4 style={{ fontSize: '1.08rem', fontWeight: 700, color: 'var(--dark)', marginBottom: '16px', lineHeight: 1.5 }}>
                  Câu {q.question_number}: {q.question_text}
                </h4>

                {/* Cảnh báo nếu thí sinh bỏ trống câu này */}
                {isUnanswered && (
                  <div style={{ background: '#fffbeb', border: '1px solid #fde68a', borderRadius: '8px', padding: '10px 14px', marginBottom: '16px', display: 'flex', alignItems: 'center', gap: '8px', color: '#b45309', fontSize: '0.88rem', fontWeight: 600 }}>
                    <AlertCircle size={18} color="#d97706" style={{ flexShrink: 0 }} />
                    <span>Bạn đã bỏ trống câu này khi nộp bài. Dưới đây là 4 phương án và đáp án đúng chuẩn (màu xanh):</span>
                  </div>
                )}

                {/* HIỂN THỊ TRỌN VẸN CẢ 4 PHƯƠNG ÁN (A, B, C, D) */}
                <div style={{ display: 'flex', flexDirection: 'column', gap: '10px', marginBottom: '20px' }}>
                  {q.options && q.options.length > 0 ? (
                    q.options.map((opt) => {
                      const isSelected = isAnswered && q.selected_key.toUpperCase() === opt.option_key.toUpperCase();
                      const isOptCorrect = opt.is_correct || (q.correct_key && q.correct_key.toUpperCase() === opt.option_key.toUpperCase());

                      let bgColor = '#ffffff';
                      let borderColor = 'var(--border-color)';
                      let textColor = 'var(--text-main)';
                      let badge = null;

                      // TRƯỜNG HỢP 1: ĐÂY LÀ ĐÁP ÁN ĐÚNG CHUẨN -> MÀU XANH LÁ
                      if (isOptCorrect) {
                        bgColor = '#f0fdf4';
                        borderColor = '#86efac';
                        textColor = '#166534';
                        badge = (
                          <span style={{ fontSize: '0.78rem', fontWeight: 800, color: '#16a34a', background: '#dcfce7', padding: '4px 10px', borderRadius: '6px', display: 'flex', alignItems: 'center', gap: '4px', border: '1px solid #bbf7d0' }}>
                            <Check size={14} /> {isSelected ? 'Bạn đã chọn (Chính xác)' : 'Đáp án đúng chuẩn'}
                          </span>
                        );
                      } 
                      // TRƯỜNG HỢP 2: ĐÂY LÀ ĐÁP ÁN THÍ SINH ĐÃ CHỌN SAI -> MÀU ĐỎ NỔI BẬT
                      else if (isSelected && !isOptCorrect) {
                        bgColor = '#fef2f2';
                        borderColor = '#f87171';
                        textColor = '#991b1b';
                        badge = (
                          <span style={{ fontSize: '0.78rem', fontWeight: 800, color: '#dc2626', background: '#fee2e2', padding: '4px 10px', borderRadius: '6px', display: 'flex', alignItems: 'center', gap: '4px', border: '1px solid #fca5a5' }}>
                            <X size={14} /> Bạn đã chọn (Sai)
                          </span>
                        );
                      }

                      return (
                        <div
                          key={opt.option_key}
                          style={{
                            background: bgColor,
                            border: `1.5px solid ${borderColor}`,
                            borderRadius: '10px',
                            padding: '12px 16px',
                            display: 'flex',
                            alignItems: 'center',
                            justifyContent: 'space-between',
                            gap: '12px',
                            boxShadow: isOptCorrect || isSelected ? '0 1px 3px rgba(0,0,0,0.05)' : 'none',
                          }}
                        >
                          <div style={{ display: 'flex', alignItems: 'center', gap: '12px', flex: 1 }}>
                            <span
                              style={{
                                width: '28px',
                                height: '28px',
                                borderRadius: '8px',
                                background: isOptCorrect ? '#16a34a' : isSelected ? '#dc2626' : '#f1f5f9',
                                color: isOptCorrect || isSelected ? '#ffffff' : 'var(--text-main)',
                                display: 'flex',
                                alignItems: 'center',
                                justifyContent: 'center',
                                fontWeight: 800,
                                fontSize: '0.85rem',
                                flexShrink: 0,
                              }}
                            >
                              {opt.option_key}
                            </span>
                            <span style={{ fontSize: '0.96rem', color: textColor, fontWeight: isOptCorrect || isSelected ? 700 : 500, lineHeight: 1.4 }}>
                              {opt.option_text}
                            </span>
                          </div>

                          {badge && <div>{badge}</div>}
                        </div>
                      );
                    })
                  ) : (
                    // Dự phòng nếu không có mảng options
                    <div style={{ padding: '12px', background: '#f8fafc', borderRadius: '8px', fontSize: '0.9rem' }}>
                      Đáp án chuẩn: <strong>{q.correct_key}</strong>
                    </div>
                  )}
                </div>

                {/* Hộp Lời Giải Thích & Dịch Nghĩa Song Ngữ Chi Tiết */}
                {q.explanation && (
                  <div style={{ background: '#f8fafc', borderRadius: '10px', padding: '16px 18px', border: '1px solid #e2e8f0' }}>
                    <div style={{ display: 'flex', alignItems: 'center', gap: '6px', fontSize: '0.86rem', fontWeight: 800, color: 'var(--primary)', marginBottom: '8px' }}>
                      <BookOpen size={16} /> LỜI GIẢI THÍCH & DỊCH NGHĨA CHI TIẾT:
                    </div>
                    <div style={{ fontSize: '0.92rem', color: '#334155', lineHeight: 1.75, whiteSpace: 'pre-line' }}>
                      {q.explanation}
                    </div>
                  </div>
                )}
              </div>
            );
          })
        )}
      </div>
    </div>
  );
}
