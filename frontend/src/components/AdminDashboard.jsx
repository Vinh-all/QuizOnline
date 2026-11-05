import React, { useEffect, useState } from 'react';
import { Users, BookOpen, CheckCircle, TrendingUp, Award, BarChart3 } from 'lucide-react';
import { apiClient } from '../api/client';

export default function AdminDashboard() {
  const [data, setData] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    async function loadStats() {
      try {
        const res = await apiClient.getDashboardStats();
        setData(res);
      } catch (err) {
        console.error('Lỗi tải thống kê quản trị:', err);
      } finally {
        setLoading(false);
      }
    }
    loadStats();
  }, []);

  if (loading) {
    return (
      <div className="container" style={{ textAlign: 'center', padding: '60px 0', color: 'var(--text-muted)' }}>
        ⏳ Đang tải số liệu thống kê quản trị...
      </div>
    );
  }

  const { overview, test_performance } = data || {};

  return (
    <div className="container animate-fade" style={{ padding: '30px 24px 60px' }}>
      <div style={{ marginBottom: '28px' }}>
        <h2 style={{ fontSize: '1.8rem', fontWeight: 800, color: 'var(--dark)' }}>
          Bảng Điều Khiển Quản Trị & Thống Kê
        </h2>
        <p style={{ fontSize: '0.95rem', color: 'var(--text-muted)' }}>
          Tổng hợp dữ liệu học sinh, lượt thi trắc nghiệm và phổ điểm 5 đề thi từ CSDL Supabase PostgreSQL
        </p>
      </div>

      {/* 4 Stat Cards */}
      <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(240px, 1fr))', gap: '20px', marginBottom: '32px' }}>
        <div style={{ background: '#ffffff', borderRadius: 'var(--radius-md)', padding: '24px', border: '1px solid var(--border-color)', boxShadow: 'var(--shadow-sm)' }}>
          <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
            <span style={{ fontSize: '0.85rem', fontWeight: 700, color: 'var(--text-muted)', textTransform: 'uppercase' }}>Học Sinh</span>
            <div style={{ background: '#e0e7ff', padding: '8px', borderRadius: '8px', color: '#4338ca' }}><Users size={20} /></div>
          </div>
          <div style={{ fontSize: '2rem', fontWeight: 800, marginTop: '8px', color: 'var(--dark)' }}>{overview?.total_students || 0}</div>
        </div>

        <div style={{ background: '#ffffff', borderRadius: 'var(--radius-md)', padding: '24px', border: '1px solid var(--border-color)', boxShadow: 'var(--shadow-sm)' }}>
          <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
            <span style={{ fontSize: '0.85rem', fontWeight: 700, color: 'var(--text-muted)', textTransform: 'uppercase' }}>Ngân Hàng Câu Hỏi</span>
            <div style={{ background: '#ecfdf5', padding: '8px', borderRadius: '8px', color: '#047857' }}><BookOpen size={20} /></div>
          </div>
          <div style={{ fontSize: '2rem', fontWeight: 800, marginTop: '8px', color: 'var(--dark)' }}>{overview?.total_questions || 200}</div>
        </div>

        <div style={{ background: '#ffffff', borderRadius: 'var(--radius-md)', padding: '24px', border: '1px solid var(--border-color)', boxShadow: 'var(--shadow-sm)' }}>
          <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
            <span style={{ fontSize: '0.85rem', fontWeight: 700, color: 'var(--text-muted)', textTransform: 'uppercase' }}>Lượt Thi Đã Nộp</span>
            <div style={{ background: '#fef3c7', padding: '8px', borderRadius: '8px', color: '#b45309' }}><CheckCircle size={20} /></div>
          </div>
          <div style={{ fontSize: '2rem', fontWeight: 800, marginTop: '8px', color: 'var(--dark)' }}>{overview?.total_completed_exams || 0}</div>
        </div>

        <div style={{ background: '#ffffff', borderRadius: 'var(--radius-md)', padding: '24px', border: '1px solid var(--border-color)', boxShadow: 'var(--shadow-sm)' }}>
          <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
            <span style={{ fontSize: '0.85rem', fontWeight: 700, color: 'var(--text-muted)', textTransform: 'uppercase' }}>Điểm Trung Bình</span>
            <div style={{ background: '#fae8ff', padding: '8px', borderRadius: '8px', color: '#86198f' }}><TrendingUp size={20} /></div>
          </div>
          <div style={{ fontSize: '2rem', fontWeight: 800, marginTop: '8px', color: 'var(--dark)' }}>{overview?.system_average_score || 0} / 10</div>
        </div>
      </div>

      {/* Test Performance Table */}
      <div style={{ background: '#ffffff', borderRadius: 'var(--radius-lg)', padding: '28px', border: '1px solid var(--border-color)', boxShadow: 'var(--shadow-sm)' }}>
        <h3 style={{ fontSize: '1.25rem', fontWeight: 800, color: 'var(--dark)', marginBottom: '18px', display: 'flex', alignItems: 'center', gap: '8px' }}>
          <BarChart3 size={20} color="var(--primary)" /> Thống Kê Theo Từng Đề Thi (Practice Tests)
        </h3>

        <div style={{ overflowX: 'auto' }}>
          <table style={{ width: '100%', borderCollapse: 'collapse', textAlign: 'left' }}>
            <thead>
              <tr style={{ borderBottom: '2px solid var(--border-color)' }}>
                <th style={{ padding: '12px 16px', fontSize: '0.85rem', fontWeight: 700, color: 'var(--text-muted)' }}>TÊN ĐỀ THI</th>
                <th style={{ padding: '12px 16px', fontSize: '0.85rem', fontWeight: 700, color: 'var(--text-muted)' }}>SỐ LƯỢT THI</th>
                <th style={{ padding: '12px 16px', fontSize: '0.85rem', fontWeight: 700, color: 'var(--text-muted)' }}>ĐIỂM TRUNG BÌNH</th>
                <th style={{ padding: '12px 16px', fontSize: '0.85rem', fontWeight: 700, color: 'var(--text-muted)' }}>ĐIỂM CAO NHẤT</th>
              </tr>
            </thead>
            <tbody>
              {test_performance?.map((t) => (
                <tr key={t.id} style={{ borderBottom: '1px solid var(--border-color)' }}>
                  <td style={{ padding: '14px 16px', fontWeight: 700, color: 'var(--dark)' }}>{t.title}</td>
                  <td style={{ padding: '14px 16px', color: 'var(--text-main)' }}>{t.attempt_count} lượt</td>
                  <td style={{ padding: '14px 16px', fontWeight: 700, color: 'var(--primary)' }}>{t.avg_score} / 10</td>
                  <td style={{ padding: '14px 16px', fontWeight: 700, color: '#16a34a' }}>{t.max_score} / 10</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );
}
