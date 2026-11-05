import React, { useState } from 'react';
import { X, Lock, Mail, User, ShieldCheck, Eye, EyeOff } from 'lucide-react';
import { apiClient } from '../api/client';

export default function LoginModal({ isOpen = true, onClose, onLoginSuccess }) {
  const [isRegister, setIsRegister] = useState(false);
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [fullName, setFullName] = useState('');
  const [role, setRole] = useState('student');
  const [showPassword, setShowPassword] = useState(false);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');

  if (isOpen === false) return null;

  const handleSubmit = async (e) => {
    e.preventDefault();
    setError('');

    const cleanEmail = email.trim().toLowerCase();
    const cleanPassword = password.trim();

    if (!cleanEmail || !cleanPassword) {
      setError('Vui lòng điền đầy đủ email và mật khẩu!');
      return;
    }

    if (cleanPassword.length < 6) {
      setError('Mật khẩu phải có độ dài từ 6 ký tự trở lên!');
      return;
    }

    if (isRegister && !fullName.trim()) {
      setError('Vui lòng nhập họ và tên của bạn!');
      return;
    }

    setLoading(true);

    try {
      if (isRegister) {
        const res = await apiClient.register(cleanEmail, cleanPassword, fullName.trim(), role);
        apiClient.setToken(res.token);
        apiClient.setUser(res.user);
        onLoginSuccess(res.user);
        onClose();
      } else {
        const res = await apiClient.login(cleanEmail, cleanPassword);
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
    <div className="modal-overlay" style={{ zIndex: 10000 }}>
      <div className="modal-box" style={{ maxWidth: '440px', width: '92%' }}>
        {/* Header */}
        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '20px' }}>
          <div>
            <h2 style={{ fontSize: '1.4rem', fontWeight: 800, color: 'var(--dark)' }}>
              {isRegister ? 'Đăng Ký Tài Khoản' : 'Đăng Nhập QuizOnline'}
            </h2>
            <p style={{ fontSize: '0.88rem', color: 'var(--text-muted)' }}>
              {isRegister ? 'Tạo tài khoản để lưu lại lịch sử làm bài' : 'Đăng nhập để luyện thi và lưu điểm số'}
            </p>
          </div>
          <button 
            onClick={onClose}
            style={{ background: '#f1f5f9', padding: '6px', borderRadius: '50%', color: 'var(--text-muted)', cursor: 'pointer' }}
          >
            <X size={20} />
          </button>
        </div>

        {/* Error Alert */}
        {error && (
          <div style={{ padding: '12px', background: '#fef2f2', border: '1.5px solid #fecaca', borderRadius: '8px', color: '#b91c1c', fontSize: '0.88rem', marginBottom: '16px', lineHeight: 1.4 }}>
            ⚠️ {error}
          </div>
        )}

        {/* Form */}
        <form onSubmit={handleSubmit} style={{ display: 'flex', flexDirection: 'column', gap: '14px' }}>
          {isRegister && (
            <div>
              <label style={{ display: 'block', fontSize: '0.85rem', fontWeight: 700, marginBottom: '6px' }}>Họ và tên</label>
              <div style={{ display: 'flex', alignItems: 'center', border: '1.5px solid var(--border-color)', borderRadius: '8px', padding: '10px 14px', background: '#fff' }}>
                <User size={18} color="#94a3b8" style={{ marginRight: '10px' }} />
                <input 
                  type="text" 
                  required 
                  placeholder="Ví dụ: Lý Anh Vinh"
                  value={fullName}
                  onChange={(e) => setFullName(e.target.value)}
                  style={{ width: '100%', border: 'none', fontSize: '0.95rem' }}
                />
              </div>
            </div>
          )}

          <div>
            <label style={{ display: 'block', fontSize: '0.85rem', fontWeight: 700, marginBottom: '6px' }}>Email</label>
            <div style={{ display: 'flex', alignItems: 'center', border: '1.5px solid var(--border-color)', borderRadius: '8px', padding: '10px 14px', background: '#fff' }}>
              <Mail size={18} color="#94a3b8" style={{ marginRight: '10px' }} />
              <input 
                type="email" 
                required 
                placeholder="name@example.com"
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                style={{ width: '100%', border: 'none', fontSize: '0.95rem' }}
              />
            </div>
          </div>

          <div>
            <label style={{ display: 'block', fontSize: '0.85rem', fontWeight: 700, marginBottom: '6px' }}>Mật khẩu</label>
            <div style={{ display: 'flex', alignItems: 'center', border: '1.5px solid var(--border-color)', borderRadius: '8px', padding: '10px 14px', background: '#fff' }}>
              <Lock size={18} color="#94a3b8" style={{ marginRight: '10px' }} />
              <input 
                type={showPassword ? 'text' : 'password'} 
                required 
                placeholder="Tối thiểu 6 ký tự"
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                style={{ width: '100%', border: 'none', fontSize: '0.95rem' }}
              />
              <button
                type="button"
                onClick={() => setShowPassword(!showPassword)}
                style={{ background: 'transparent', border: 'none', color: '#94a3b8', padding: '2px', cursor: 'pointer' }}
              >
                {showPassword ? <EyeOff size={18} /> : <Eye size={18} />}
              </button>
            </div>
          </div>

          {isRegister && (
            <div>
              <label style={{ display: 'block', fontSize: '0.85rem', fontWeight: 700, marginBottom: '6px' }}>Vai trò</label>
              <select 
                value={role} 
                onChange={(e) => setRole(e.target.value)}
                style={{ width: '100%', padding: '10px', borderRadius: '8px', border: '1.5px solid var(--border-color)', fontSize: '0.95rem', background: '#fff' }}
              >
                <option value="student">👨‍🎓 Học Sinh (Luyện đề, xem điểm)</option>
                <option value="teacher">👩‍🏫 Giáo Viên (Quản lý đề, xem thống kê)</option>
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
              cursor: loading ? 'not-allowed' : 'pointer',
              opacity: loading ? 0.7 : 1,
            }}
          >
            {loading ? 'Đang xử lý...' : isRegister ? 'Đăng Ký Tài Khoản' : 'Đăng Nhập'}
          </button>
        </form>

        {/* Toggle Register / Login */}
        <div style={{ textAlign: 'center', marginTop: '16px', fontSize: '0.88rem' }}>
          {isRegister ? (
            <span>
              Đã có tài khoản?{' '}
              <strong 
                style={{ color: 'var(--primary)', cursor: 'pointer' }} 
                onClick={() => { setIsRegister(false); setError(''); }}
              >
                Đăng nhập ngay
              </strong>
            </span>
          ) : (
            <span>
              Chưa có tài khoản?{' '}
              <strong 
                style={{ color: 'var(--primary)', cursor: 'pointer' }} 
                onClick={() => { setIsRegister(true); setError(''); }}
              >
                Đăng ký tài khoản mới
              </strong>
            </span>
          )}
        </div>

        {/* Quick Demo Login Boxes */}
        <div style={{ marginTop: '20px', paddingTop: '16px', borderTop: '1px solid var(--border-color)' }}>
          <div style={{ fontSize: '0.78rem', fontWeight: 700, color: 'var(--text-muted)', marginBottom: '10px', textTransform: 'uppercase', textAlign: 'center' }}>
            ⚡ Đăng Nhập Nhanh Mẫu (Mật khẩu: 123456)
          </div>
          <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr 1fr', gap: '8px' }}>
            <button 
              onClick={() => handleQuickLogin('student@quizonline.com', 'Học sinh')}
              style={{ padding: '8px', background: '#e0e7ff', color: '#4338ca', borderRadius: '8px', fontSize: '0.8rem', fontWeight: 700, cursor: 'pointer' }}
            >
              👨‍🎓 Học Sinh
            </button>
            <button 
              onClick={() => handleQuickLogin('teacher@quizonline.com', 'Giáo viên')}
              style={{ padding: '8px', background: '#ecfdf5', color: '#047857', borderRadius: '8px', fontSize: '0.8rem', fontWeight: 700, cursor: 'pointer' }}
            >
              👩‍🏫 Giáo Viên
            </button>
            <button 
              onClick={() => handleQuickLogin('admin@quizonline.com', 'Admin')}
              style={{ padding: '8px', background: '#fef3c7', color: '#b45309', borderRadius: '8px', fontSize: '0.8rem', fontWeight: 700, cursor: 'pointer' }}
            >
              🛡️ Admin
            </button>
          </div>
        </div>
      </div>
    </div>
  );
}
