import React, { useEffect, useState } from 'react';
import { Award, Clock, Calendar, ArrowRight } from 'lucide-react';
import { apiClient } from '../api/client';

export default function HistoryModal({ onReviewAttempt }) {
  const [history, setHistory] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    async function loadHistory() {
      try {
        const res = await apiClient.getExamHistory();
        setHistory(res.history || []);
      } catch (err) {
        console.error('Lỗi tải lịch sử:', err);
      } finally {
        setLoading(false);
      }
    }
    loadHistory();
  }, []);

  return (
    <div className="container animate-fade" style={{ padding: '30px 24px 60px' }}>
      <div style={{ marginBottom: '28px' }}>
        <h2 style={{ fontSize: '1.8rem', fontWeight: 800, color: 'var(--dark)' }}>
          Lịch Sử Làm Bài Của Bạn
        </h2>
        <p style={{ fontSize: '0.95rem', color: 'var(--text-muted)' }}>
          Theo dõi tiến độ, điểm số và xem lại chi tiết các câu đúng/sai của từng bài thi
        </p>
      </div>

      {loading ? (
        <div style={{ textAlign: 'center', padding: '60px 0', color: 'var(--text-muted)' }}>
          ⏳ Đang tải dữ liệu lịch sử...
        </div>
      ) : history.length === 0 ? (
        <div style={{ background: '#ffffff', borderRadius: 'var(--radius-lg)', padding: '48px', textAlign: 'center', border: '1px solid var(--border-color)' }}>
          <Award size={48} color="var(--primary)" style={{ opacity: 0.5, marginBottom: '12px' }} />
          <h3 style={{ fontSize: '1.2rem', fontWeight: 700, color: 'var(--dark)' }}>Chưa có bài thi nào</h3>
          <p style={{ color: 'var(--text-muted)', fontSize: '0.9rem', marginTop: '6px' }}>
            Hãy bắt đầu làm một trong 5 đề thi để xem kết quả và thống kê tại đây!
          </p>
        </div>
      ) : (
        <div style={{ display: 'flex', flexDirection: 'column', gap: '14px' }}>
          {history.map((item) => {
            const timeMinutes = Math.floor((item.time_spent_seconds || 0) / 60);
            const timeSeconds = (item.time_spent_seconds || 0) % 60;
            return (
              <div
                key={item.id}
                style={{
                  background: '#ffffff',
                  border: '1px solid var(--border-color)',
                  borderRadius: 'var(--radius-md)',
                  padding: '20px 24px',
                  display: 'flex',
                  justifyContent: 'space-between',
                  alignItems: 'center',
                  boxShadow: 'var(--shadow-sm)',
                }}
              >
                <div>
                  <h4 style={{ fontSize: '1.15rem', fontWeight: 800, color: 'var(--dark)' }}>
                    {item.test_title}
                  </h4>
                  <div style={{ display: 'flex', gap: '16px', marginTop: '6px', fontSize: '0.85rem', color: 'var(--text-muted)' }}>
                    <span style={{ display: 'flex', alignItems: 'center', gap: '4px' }}>
                      <Calendar size={14} /> {new Date(item.submitted_at).toLocaleString('vi-VN')}
                    </span>
                    <span style={{ display: 'flex', alignItems: 'center', gap: '4px' }}>
                      <Clock size={14} /> Thời gian làm: {timeMinutes}p {timeSeconds}s
                    </span>
                  </div>
                </div>

                <div style={{ display: 'flex', alignItems: 'center', gap: '24px' }}>
                  <div style={{ textAlign: 'right' }}>
                    <div style={{ fontSize: '1.5rem', fontWeight: 800, color: 'var(--primary)' }}>
                      {item.score} / 10
                    </div>
                    <div style={{ fontSize: '0.8rem', color: 'var(--text-muted)', fontWeight: 600 }}>
                      Đúng {item.correct_count} / {item.total_questions} câu
                    </div>
                  </div>

                  <button
                    onClick={() => onReviewAttempt(item.id)}
                    style={{
                      display: 'flex',
                      alignItems: 'center',
                      gap: '6px',
                      padding: '10px 18px',
                      borderRadius: '8px',
                      background: 'var(--primary-light)',
                      color: 'var(--primary)',
                      fontWeight: 700,
                      fontSize: '0.9rem',
                    }}
                  >
                    Xem Chi Tiết <ArrowRight size={16} />
                  </button>
                </div>
              </div>
            );
          })}
        </div>
      )}
    </div>
  );
}

