import React, { useEffect, useState } from 'react';
import { Award, CheckCircle, XCircle, RotateCcw, Home, BookOpen, ChevronDown, ChevronUp } from 'lucide-react';
import confetti from 'canvas-confetti';
import { apiClient } from '../api/client';

export default function ResultReview({ attemptId, onBackToTests, onRetake }) {
  const [detailData, setDetailData] = useState(null);
  const [loading, setLoading] = useState(true);
  const [activePartFilter, setActivePartFilter] = useState('all');

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
          ⏳ Đang tổng hợp kết quả và lời giải chi tiết...
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

  const { attempt, review } = detailData;
  const filteredQuestions = activePartFilter === 'all' 
    ? review 
    : review.filter(q => String(q.part_number) === String(activePartFilter));

  return (
    <div className="container animate-fade" style={{ padding: '30px 24px 60px' }}>
      {/* Score Summary Box */}
      <div 
        style={{
          background: 'linear-gradient(135deg, #1e1b4b, #312e81)',
          borderRadius: 'var(--radius-xl)',
          padding: '40px',
          color: '#ffffff',
          boxShadow: 'var(--shadow-xl)',
          marginBottom: '32px',
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
          <h2 style={{ fontSize: '2rem', fontWeight: 800, marginTop: '12px', marginBottom: '8px' }}>
            {attempt.test_title}
          </h2>
          <p style={{ opacity: 0.85, fontSize: '0.95rem' }}>
            Nộp bài lúc: {new Date(attempt.submitted_at).toLocaleString('vi-VN')}
          </p>
        </div>

        {/* Big Numbers */}
        <div style={{ display: 'flex', gap: '32px', alignItems: 'center' }}>
          <div style={{ textAlign: 'center' }}>
            <div style={{ fontSize: '3rem', fontWeight: 800, color: '#38bdf8', lineHeight: 1 }}>
              {attempt.score}
            </div>
            <div style={{ fontSize: '0.85rem', opacity: 0.8, marginTop: '6px', fontWeight: 600 }}>Điểm (Thang 10)</div>
          </div>

          <div style={{ width: '1px', height: '60px', background: 'rgba(255,255,255,0.2)' }}></div>

          <div style={{ textAlign: 'center' }}>
            <div style={{ fontSize: '3rem', fontWeight: 800, color: '#4ade80', lineHeight: 1 }}>
              {attempt.correct_count}
              <span style={{ fontSize: '1.5rem', opacity: 0.7 }}>/{attempt.total_questions}</span>
            </div>
            <div style={{ fontSize: '0.85rem', opacity: 0.8, marginTop: '6px', fontWeight: 600 }}>Số câu đúng</div>
          </div>
        </div>

        {/* Actions */}
        <div style={{ display: 'flex', gap: '12px' }}>
          <button 
            onClick={onBackToTests}
            style={{
              display: 'flex',
              alignItems: 'center',
              gap: '8px',
              padding: '12px 20px',
              borderRadius: '10px',
              background: 'rgba(255,255,255,0.15)',
              color: '#ffffff',
              fontWeight: 700,
              fontSize: '0.95rem'
            }}
          >
            <Home size={18} /> Danh Sách Đề
          </button>
        </div>
      </div>

      {/* Part Filter Tabs */}
      <div style={{ display: 'flex', gap: '8px', marginBottom: '24px', overflowX: 'auto', paddingBottom: '8px' }}>
        <button 
          onClick={() => setActivePartFilter('all')}
          style={{
            padding: '8px 18px',
            borderRadius: '8px',
            fontWeight: 700,
            fontSize: '0.9rem',
            background: activePartFilter === 'all' ? 'var(--primary)' : '#ffffff',
            color: activePartFilter === 'all' ? '#ffffff' : 'var(--text-main)',
            border: '1px solid var(--border-color)',
          }}
        >
          {attempt.part_number ? `Toàn bộ ${attempt.total_questions} câu của Part ${attempt.part_number}` : `Tất cả ${attempt.total_questions || 40} câu`}
        </button>
        {!attempt.part_number && [1, 2, 3, 4].map(partNum => (
          <button 
            key={partNum}
            onClick={() => setActivePartFilter(partNum)}
            style={{
              padding: '8px 18px',
              borderRadius: '8px',
              fontWeight: 700,
              fontSize: '0.9rem',
              background: activePartFilter === partNum ? 'var(--primary)' : '#ffffff',
              color: activePartFilter === partNum ? '#ffffff' : 'var(--text-main)',
              border: '1px solid var(--border-color)',
            }}
          >
            Part {partNum} (10 câu)
          </button>
        ))}
      </div>

      {/* Detailed Questions List with Bilingual Explanations */}
      <div style={{ display: 'flex', flexDirection: 'column', gap: '20px' }}>
        {filteredQuestions.map((q) => {
          const isCorrect = q.is_correct;
          return (
            <div 
              key={q.question_id}
              style={{
                background: '#ffffff',
                border: `1.5px solid ${isCorrect ? '#86efac' : '#fca5a5'}`,
                borderRadius: 'var(--radius-lg)',
                padding: '24px',
                boxShadow: 'var(--shadow-sm)',
              }}
            >
              {/* Question Header & Status */}
              <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '14px' }}>
                <span style={{ fontSize: '0.88rem', fontWeight: 700, color: 'var(--text-muted)' }}>
                  Câu {q.question_number} • {q.part_title}
                </span>
                <div style={{ display: 'flex', alignItems: 'center', gap: '6px' }}>
                  {isCorrect ? (
                    <span style={{ display: 'flex', alignItems: 'center', gap: '4px', color: '#16a34a', fontWeight: 700, fontSize: '0.9rem', background: '#dcfce7', padding: '4px 12px', borderRadius: '999px' }}>
                      <CheckCircle size={16} /> Chính xác
                    </span>
                  ) : (
                    <span style={{ display: 'flex', alignItems: 'center', gap: '4px', color: '#dc2626', fontWeight: 700, fontSize: '0.9rem', background: '#fee2e2', padding: '4px 12px', borderRadius: '999px' }}>
                      <XCircle size={16} /> Chưa chính xác
                    </span>
                  )}
                </div>
              </div>

              {/* Question Text */}
              <h4 style={{ fontSize: '1.05rem', fontWeight: 700, color: 'var(--dark)', marginBottom: '16px' }}>
                {q.question_text}
              </h4>

              {/* Answer Comparison */}
              <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '12px', marginBottom: '18px' }}>
                <div style={{ background: isCorrect ? '#f0fdf4' : '#fef2f2', padding: '12px 16px', borderRadius: '8px', border: `1px solid ${isCorrect ? '#bbf7d0' : '#fecaca'}` }}>
                  <div style={{ fontSize: '0.78rem', fontWeight: 700, color: 'var(--text-muted)', textTransform: 'uppercase' }}>Bạn đã chọn:</div>
                  <div style={{ fontSize: '1rem', fontWeight: 800, color: isCorrect ? '#16a34a' : '#dc2626', marginTop: '4px' }}>
                    {q.selected_key ? `Đáp án ${q.selected_key}` : '(Chưa chọn)'}
                  </div>
                </div>

                <div style={{ background: '#f0fdf4', padding: '12px 16px', borderRadius: '8px', border: '1px solid #bbf7d0' }}>
                  <div style={{ fontSize: '0.78rem', fontWeight: 700, color: 'var(--text-muted)', textTransform: 'uppercase' }}>Đáp án chuẩn:</div>
                  <div style={{ fontSize: '1rem', fontWeight: 800, color: '#16a34a', marginTop: '4px' }}>
                    Đáp án {q.correct_key}: {q.correct_text}
                  </div>
                </div>
              </div>

              {/* Bilingual Explanation Box */}
              {q.explanation && (
                <div style={{ background: '#f8fafc', borderRadius: '10px', padding: '16px', border: '1px solid #e2e8f0' }}>
                  <div style={{ display: 'flex', alignItems: 'center', gap: '6px', fontSize: '0.85rem', fontWeight: 800, color: 'var(--primary)', marginBottom: '8px' }}>
                    <BookOpen size={16} /> LỜI GIẢI THÍCH & DỊCH NGHĨA CHI TIẾT:
                  </div>
                  <div style={{ fontSize: '0.92rem', color: '#334155', lineHeight: 1.7, whiteSpace: 'pre-line' }}>
                    {q.explanation}
                  </div>
                </div>
              )}
            </div>
          );
        })}
      </div>
    </div>
  );
}
