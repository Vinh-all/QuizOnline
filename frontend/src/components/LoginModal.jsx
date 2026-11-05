import React, { useState } from 'react';
import { X, Lock, Mail, User, ShieldCheck } from 'lucide-react';
import { apiClient } from '../api/client';

export default function LoginModal({ isOpen, onClose, onLoginSuccess }) {
  const [isRegister, setIsRegister] = useState(false);
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [fullName, setFullName] = useState('');
  const [role, setRole] = useState('student');
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');

  if (!isOpen) return null;

  const handleSubmit = async (e) => {
    e.preventDefault();
    setError('');
    setLoading(true);

    try {
      if (isRegister) {
        const res = await apiClient.register(email, password, fullName, role);
        apiClient.setToken(res.token);
        apiClient.setUser(res.user);
        onLoginSuccess(res.user);
        onClose();
      } else {
        const res = await apiClient.login(email, password);
        apiClient.setToken(res.token);
        apiClient.setUser(res.user);
        onLoginSuccess(res.user);
        onClose();
      }
    } catch (err) {
      setError(err.message || 'Thao tác không thành công!');
    } finally {
      setLoading(false);
    }
  };

  const handleQuickLogin = async (quickEmail, quickRole) => {
    setError('');
    setLoading(true);
    try {
      const res = await apiClient.login(quickEmail, '123456');
      apiClient.setToken(res.token);
      apiClient.setUser(res.user);
      onLoginSuccess(res.user);
      onClose();
    } catch (err) {
      setError(err.message || `Lỗi đăng nhập nhanh (${quickRole})`);
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="modal-overlay">
      <div className="modal-box">
        {/* Header */}
        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '20px' }}>
          <div>
            <h2 style={{ fontSize: '1.4rem', fontWeight: 800, color: 'var(--dark)' }}>
              {isRegister ? 'Đăng Ký Tài Khoản' : 'Đăng Nhập QuizOnline'}
            </h2>
            <p style={{ fontSize: '0.88rem', color: 'var(--text-muted)' }}>
              {isRegister ? 'Tạo tài khoản để lưu lại lịch sử làm bài' : 'Đăng nhập để bắt đầu làm bài luyện thi'}
            </p>
          </div>
          <button 
            onClick={onClose}
            style={{ background: '#f1f5f9', padding: '6px', borderRadius: '50%', color: 'var(--text-muted)' }}
          >
            <X size={20} />
          </button>
        </div>

        {/* Error Alert */}
        {error && (
          <div style={{ padding: '12px', background: '#fef2f2', border: '1px solid #fecaca', borderRadius: '8px', color: '#b91c1c', fontSize: '0.88rem', marginBottom: '16px' }}>
            ⚠️ {error}
          </div>
        )}

        {/* Form */}
        <form onSubmit={handleSubmit} style={{ display: 'flex', flexDirection: 'column', gap: '14px' }}>
          {isRegister && (
            <div>
              <label style={{ display: 'block', fontSize: '0.85rem', fontWeight: 700, marginBottom: '6px' }}>Họ và tên</label>
              <div style={{ display: 'flex', alignItems: 'center', border: '1.5px solid var(--border-color)', borderRadius: '8px', padding: '10px 14px' }}>
                <User size={18} color="#94a3b8" style={{ marginRight: '10px' }} />
                <input 
                  type="text" 
                  required 
                  placeholder="Nguyễn Văn A"
                  value={fullName}
                  onChange={(e) => setFullName(e.target.value)}
                  style={{ width: '100%', border: 'none', fontSize: '0.95rem' }}
                />
              </div>
            </div>
          )}

          <div>
            <label style={{ display: 'block', fontSize: '0.85rem', fontWeight: 700, marginBottom: '6px' }}>Email</label>
            <div style={{ display: 'flex', alignItems: 'center', border: '1.5px solid var(--border-color)', borderRadius: '8px', padding: '10px 14px' }}>
              <Mail size={18} color="#94a3b8" style={{ marginRight: '10px' }} />
              <input 
                type="email" 
                required 
                placeholder="email@example.com"
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                style={{ width: '100%', border: 'none', fontSize: '0.95rem' }}
              />
            </div>
          </div>

          <div>
            <label style={{ display: 'block', fontSize: '0.85rem', fontWeight: 700, marginBottom: '6px' }}>Mật khẩu</label>
            <div style={{ display: 'flex', alignItems: 'center', border: '1.5px solid var(--border-color)', borderRadius: '8px', padding: '10px 14px' }}>
              <Lock size={18} color="#94a3b8" style={{ marginRight: '10px' }} />
              <input 
                type="password" 
                required 
                placeholder="••••••••"
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                style={{ width: '100%', border: 'none', fontSize: '0.95rem' }}
              />
            </div>
          </div>

          {isRegister && (
            <div>
              <label style={{ display: 'block', fontSize: '0.85rem', fontWeight: 700, marginBottom: '6px' }}>Vai trò</label>
              <select 
                value={role} 
                onChange={(e) => setRole(e.target.value)}
                style={{ width: '100%', padding: '10px', borderRadius: '8px', border: '1.5px solid var(--border-color)', fontSize: '0.95rem' }}
              >
                <option value="student">Học Sinh (Student)</option>
                <option value="teacher">Giáo Viên (Teacher)</option>
              </select>
            </div>
          )}

          <button 
            type="submit" 
            disabled={loading}
            style={{
              marginTop: '6px',
              padding: '12px',
              background: 'var(--primary)',
              color: '#ffffff',
              borderRadius: '8px',
              fontWeight: 700,
              fontSize: '1rem',
              opacity: loading ? 0.7 : 1,
            }}
          >
            {loading ? 'Đang xử lý...' : isRegister ? 'Đăng Ký Ngay' : 'Đăng Nhập'}
          </button>
        </form>

        {/* Toggle Register / Login */}
        <div style={{ textAlign: 'center', marginTop: '16px', fontSize: '0.88rem' }}>
          {isRegister ? (
            <span>Đã có tài khoản? <strong style={{ color: 'var(--primary)', cursor: 'pointer' }} onClick={() => setIsRegister(false)}>Đăng nhập</strong></span>
          ) : (
            <span>Chưa có tài khoản? <strong style={{ color: 'var(--primary)', cursor: 'pointer' }} onClick={() => setIsRegister(true)}>Tạo tài khoản</strong></span>
          )}
        </div>

        {/* Quick Demo Login Boxes */}
        <div style={{ marginTop: '24px', paddingTop: '16px', borderTop: '1px solid var(--border-color)' }}>
          <div style={{ fontSize: '0.8rem', fontWeight: 700, color: 'var(--text-muted)', marginBottom: '10px', textTransform: 'uppercase', textAlign: 'center' }}>
            ⚡ Đăng Nhập Nhanh Mẫu (Demo 1-Click)
          </div>
          <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr 1fr', gap: '8px' }}>
            <button 
              onClick={() => handleQuickLogin('student@quizonline.com', 'Học sinh')}
              style={{ padding: '8px', background: '#e0e7ff', color: '#4338ca', borderRadius: '8px', fontSize: '0.8rem', fontWeight: 700 }}
            >
              👨‍🎓 Học Sinh
            </button>
            <button 
              onClick={() => handleQuickLogin('teacher@quizonline.com', 'Giáo viên')}
              style={{ padding: '8px', background: '#ecfdf5', color: '#047857', borderRadius: '8px', fontSize: '0.8rem', fontWeight: 700 }}
            >
              👩‍🏫 Giáo Viên
            </button>
            <button 
              onClick={() => handleQuickLogin('admin@quizonline.com', 'Admin')}
              style={{ padding: '8px', background: '#fef3c7', color: '#b45309', borderRadius: '8px', fontSize: '0.8rem', fontWeight: 700 }}
            >
              🛡️ Admin
            </button>
          </div>
        </div>
      </div>
    </div>
  );
}
