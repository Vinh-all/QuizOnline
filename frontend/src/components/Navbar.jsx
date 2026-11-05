import React from 'react';
import { BookOpen, User, LogOut, Award, BarChart2, Shield } from 'lucide-react';

export default function Navbar({ user, onOpenLogin, onLogout, onNavigate, currentView }) {
  return (
    <nav className="navbar">
      <div className="container navbar-inner">
        {/* Brand */}
        <div 
          className="brand-logo" 
          style={{ cursor: 'pointer' }}
          onClick={() => onNavigate('tests')}
        >
          <div className="brand-icon">
            <BookOpen size={24} />
          </div>
          <div>
            <div style={{ lineHeight: 1.2 }}>QuizOnline</div>
            <span style={{ fontSize: '0.72rem', color: 'var(--text-muted)', fontWeight: 500 }}>
              Tiếng Anh 3 • Luyện Thi Trắc Nghiệm
            </span>
          </div>
        </div>

        {/* Navigation Items */}
        <div style={{ display: 'flex', alignItems: 'center', gap: '16px' }}>
          <button 
            onClick={() => onNavigate('tests')}
            style={{
              padding: '8px 16px',
              borderRadius: '8px',
              fontWeight: 600,
              fontSize: '0.9rem',
              background: currentView === 'tests' ? 'var(--primary-light)' : 'transparent',
              color: currentView === 'tests' ? 'var(--primary)' : 'var(--text-main)',
            }}
          >
            Đề Thi (5 Boxes)
          </button>

          {user && (
            <button 
              onClick={() => onNavigate('history')}
              style={{
                display: 'flex',
                alignItems: 'center',
                gap: '6px',
                padding: '8px 16px',
                borderRadius: '8px',
                fontWeight: 600,
                fontSize: '0.9rem',
                background: currentView === 'history' ? 'var(--primary-light)' : 'transparent',
                color: currentView === 'history' ? 'var(--primary)' : 'var(--text-main)',
              }}
            >
              <Award size={18} />
              Lịch Sử Thi
            </button>
          )}

          {user && (user.role === 'admin' || user.role === 'teacher') && (
            <button 
              onClick={() => onNavigate('admin')}
              style={{
                display: 'flex',
                alignItems: 'center',
                gap: '6px',
                padding: '8px 16px',
                borderRadius: '8px',
                fontWeight: 600,
                fontSize: '0.9rem',
                background: currentView === 'admin' ? 'var(--primary-light)' : 'transparent',
                color: currentView === 'admin' ? 'var(--primary)' : 'var(--text-main)',
              }}
            >
              <BarChart2 size={18} />
              Thống Kê Quản Trị
            </button>
          )}

          {/* User Auth Info */}
          {user ? (
            <div style={{ display: 'flex', alignItems: 'center', gap: '12px', marginLeft: '12px' }}>
              <div style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
                <div 
                  style={{
                    width: '36px',
                    height: '36px',
                    borderRadius: '50%',
                    background: user.role === 'admin' ? '#fef3c7' : user.role === 'teacher' ? '#ecfdf5' : '#e0e7ff',
                    color: user.role === 'admin' ? '#b45309' : user.role === 'teacher' ? '#047857' : '#4338ca',
                    display: 'flex',
                    alignItems: 'center',
                    justifyContent: 'center',
                    fontWeight: 700,
                    fontSize: '0.9rem'
                  }}
                >
                  {user.full_name ? user.full_name.charAt(0).toUpperCase() : 'U'}
                </div>
                <div>
                  <div style={{ fontSize: '0.88rem', fontWeight: 700, lineHeight: 1.2 }}>{user.full_name}</div>
                  <span 
                    style={{
                      fontSize: '0.72rem',
                      fontWeight: 600,
                      padding: '2px 8px',
                      borderRadius: '4px',
                      background: user.role === 'admin' ? '#fef3c7' : user.role === 'teacher' ? '#ecfdf5' : '#f1f5f9',
                      color: user.role === 'admin' ? '#b45309' : user.role === 'teacher' ? '#047857' : '#64748b',
                      textTransform: 'uppercase'
                    }}
                  >
                    {user.role}
                  </span>
                </div>
              </div>

              <button 
                onClick={onLogout}
                title="Đăng xuất"
                style={{
                  padding: '8px',
                  borderRadius: '8px',
                  background: '#f1f5f9',
                  color: 'var(--text-muted)',
                }}
              >
                <LogOut size={18} />
              </button>
            </div>
          ) : (
            <button 
              onClick={onOpenLogin}
              style={{
                display: 'flex',
                alignItems: 'center',
                gap: '8px',
                padding: '10px 20px',
                borderRadius: '8px',
                background: 'var(--primary)',
                color: '#ffffff',
                fontWeight: 700,
                fontSize: '0.92rem',
                boxShadow: '0 4px 10px rgba(79, 70, 229, 0.25)',
              }}
            >
              <User size={18} />
              Đăng Nhập
            </button>
          )}
        </div>
      </div>
    </nav>
  );
}
