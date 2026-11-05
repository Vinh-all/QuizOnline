import React, { useState, useEffect } from 'react';
import Navbar from './components/Navbar';
import LoginModal from './components/LoginModal';
import TestCard from './components/TestCard';
import ExamScreen from './components/ExamScreen';
import ResultReview from './components/ResultReview';
import HistoryModal from './components/HistoryModal';
import AdminDashboard from './components/AdminDashboard';
import { apiClient } from './api/client';
import { Sparkles, BookOpen, Clock, ShieldCheck, CheckCircle } from 'lucide-react';

export default function App() {
  const [user, setUser] = useState(apiClient.getUser());
  const [currentView, setCurrentView] = useState('tests'); // 'tests' | 'exam' | 'result' | 'history' | 'admin'
  const [tests, setTests] = useState([]);
  const [loadingTests, setLoadingTests] = useState(true);
  const [isLoginOpen, setIsLoginOpen] = useState(false);
  const [examData, setExamData] = useState(null);
  const [activeAttemptId, setActiveAttemptId] = useState(null);

  // Tải danh sách đề thi
  const loadTests = async () => {
    try {
      setLoadingTests(true);
      const res = await apiClient.getTests();
      setTests(res.tests || []);
    } catch (err) {
      console.error('Lỗi tải đề thi:', err);
    } finally {
      setLoadingTests(false);
    }
  };

  useEffect(() => {
    loadTests();
  }, []);

  // Xử lý khi nhấn bắt đầu thi (Tự động cấp quyền học sinh nếu chưa đăng nhập để trải nghiệm ngay)
  const handleStartTest = async (test, part_number = null, is_timed = false) => {
    let currentUser = user;
    if (!currentUser) {
      try {
        const loginRes = await apiClient.login('student@quizonline.com', '123456');
        apiClient.setToken(loginRes.token);
        apiClient.setUser(loginRes.user);
        setUser(loginRes.user);
        currentUser = loginRes.user;
      } catch (err) {
        setIsLoginOpen(true);
        return;
      }
    }

    try {
      const data = await apiClient.startExam(test.id, part_number, is_timed);
      setExamData(data);
      setCurrentView('exam');
    } catch (err) {
      alert('Không thể bắt đầu bài thi: ' + err.message);
    }
  };

  // Nộp bài thi
  const handleSubmitExam = async (attempt_id, answers) => {
    const res = await apiClient.submitExam(attempt_id, answers);
    setActiveAttemptId(attempt_id);
    setCurrentView('result');
  };

  // Xem lại một lượt thi từ lịch sử
  const handleReviewAttempt = (attempt_id) => {
    setActiveAttemptId(attempt_id);
    setCurrentView('result');
  };

  // Đăng xuất
  const handleLogout = () => {
    apiClient.logout();
    setUser(null);
    setCurrentView('tests');
  };

  return (
    <div style={{ minHeight: '100vh', display: 'flex', flexDirection: 'column' }}>
      {/* Navbar luôn hiển thị trừ khi đang trong phòng thi toàn màn hình */}
      {currentView !== 'exam' && (
        <Navbar
          user={user}
          currentView={currentView}
          onOpenLogin={() => setIsLoginOpen(true)}
          onLogout={handleLogout}
          onNavigate={(view) => setCurrentView(view)}
        />
      )}

      {/* VIEW 1: DANH SÁCH 5 PRACTICE TESTS (DASHBOARD 5 BOXES) */}
      {currentView === 'tests' && (
        <main className="container animate-fade" style={{ padding: '40px 24px 60px' }}>
          {/* Hero Banner */}
          <div 
            style={{
              background: 'linear-gradient(135deg, #312e81, #4338ca 60%, #6366f1)',
              borderRadius: 'var(--radius-xl)',
              padding: '48px',
              color: '#ffffff',
              boxShadow: 'var(--shadow-xl)',
              marginBottom: '36px',
              position: 'relative',
              overflow: 'hidden',
            }}
          >
            <div style={{ maxWidth: '780px', position: 'relative', zIndex: 2 }}>
              <div style={{ display: 'inline-flex', alignItems: 'center', gap: '8px', background: 'rgba(255,255,255,0.15)', backdropFilter: 'blur(8px)', padding: '6px 14px', borderRadius: '999px', fontSize: '0.85rem', fontWeight: 700, textTransform: 'uppercase', marginBottom: '16px' }}>
                <Sparkles size={16} /> Ngân hàng đề thi tiếng Anh 3 chuẩn hóa
              </div>
              <h1 style={{ fontSize: '2.5rem', fontWeight: 800, lineHeight: 1.2, marginBottom: '8px' }}>
                Hệ Thống Luyện Thi QuizOnline (5 Practice Tests)
              </h1>
              <div style={{ fontSize: '1.1rem', fontWeight: 700, color: '#fde047', marginBottom: '16px', display: 'flex', alignItems: 'center', gap: '6px' }}>
                ✍️ Tác giả: Lý Anh Vinh
              </div>
              <p style={{ fontSize: '1.05rem', opacity: 0.9, lineHeight: 1.6, marginBottom: '24px' }}>
                Trọn bộ 5 đề thi với 20 bài đọc tiếng Anh và 200 câu hỏi trắc nghiệm có lời giải thích chi tiết, 
                dẫn chứng bài đọc và dịch nghĩa song ngữ Anh - Việt. Hỗ trợ bấm giờ, trộn đề và chấm điểm tự động.
              </p>

              <div style={{ display: 'flex', flexWrap: 'wrap', gap: '20px' }}>
                <div style={{ display: 'flex', alignItems: 'center', gap: '8px', fontSize: '0.9rem', fontWeight: 600 }}>
                  <CheckCircle size={18} color="#4ade80" /> 200 Câu hỏi chuẩn format
                </div>
                <div style={{ display: 'flex', alignItems: 'center', gap: '8px', fontSize: '0.9rem', fontWeight: 600 }}>
                  <Clock size={18} color="#38bdf8" /> Luyện tập không giới hạn thời gian (Tùy chọn bấm giờ)
                </div>
                <div style={{ display: 'flex', alignItems: 'center', gap: '8px', fontSize: '0.9rem', fontWeight: 600 }}>
                  <ShieldCheck size={18} color="#facc15" /> Chấm điểm & Bảo mật đề thi
                </div>
              </div>
            </div>
          </div>

          {/* Section Header */}
          <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '8px' }}>
            <div>
              <h2 style={{ fontSize: '1.6rem', fontWeight: 800, color: 'var(--dark)' }}>
                Các Bộ Đề Luyện Thi (5 Boxes)
              </h2>
              <p style={{ fontSize: '0.92rem', color: 'var(--text-muted)' }}>
                Chọn 1 trong 5 đề dưới đây để bắt đầu làm bài thi trực tuyến:
              </p>
            </div>
            <span style={{ fontSize: '0.88rem', fontWeight: 700, color: 'var(--primary)', background: 'var(--primary-light)', padding: '6px 14px', borderRadius: '8px' }}>
              {tests.length} Bài thi khả dụng
            </span>
          </div>

          {/* 5 Test Boxes Grid */}
          {loadingTests ? (
            <div style={{ textAlign: 'center', padding: '60px 0', color: 'var(--text-muted)' }}>
              ⏳ Đang tải dữ liệu 5 đề thi từ CSDL Supabase...
            </div>
          ) : (
            <div className="tests-grid">
              {tests.map((test, idx) => (
                <TestCard 
                  key={test.id} 
                  test={test} 
                  index={idx} 
                  onStartTest={handleStartTest} 
                />
              ))}
            </div>
          )}
        </main>
      )}

      {/* VIEW 2: MÀN HÌNH LÀM BÀI THI (EXAM SCREEN) */}
      {currentView === 'exam' && examData && (
        <ExamScreen
          examData={examData}
          onSubmitExam={handleSubmitExam}
          onExit={() => setCurrentView('tests')}
        />
      )}

      {/* VIEW 3: MÀN HÌNH XEM KẾT QUẢ & LỜI GIẢI CHI TIẾT */}
      {currentView === 'result' && activeAttemptId && (
        <ResultReview
          attemptId={activeAttemptId}
          onBackToTests={() => setCurrentView('tests')}
          onRetake={() => setCurrentView('tests')}
        />
      )}

      {/* VIEW 4: LỊCH SỬ THI */}
      {currentView === 'history' && (
        <HistoryModal
          onReviewAttempt={handleReviewAttempt}
        />
      )}

      {/* VIEW 5: THỐNG KÊ QUẢN TRỊ (ADMIN & TEACHER) */}
      {currentView === 'admin' && (
        <AdminDashboard />
      )}

      {/* Modal Đăng nhập / Đăng ký */}
      <LoginModal
        isOpen={isLoginOpen}
        onClose={() => setIsLoginOpen(false)}
        onLoginSuccess={(loggedInUser) => {
          setUser(loggedInUser);
        }}
      />

      {/* Footer */}
      {currentView !== 'exam' && (
        <footer style={{ marginTop: 'auto', borderTop: '1px solid var(--border-color)', padding: '24px 0', background: '#ffffff', textAlign: 'center' }}>
          <div className="container">
            <div style={{ fontWeight: 800, fontSize: '1.05rem', color: 'var(--primary)' }}>
              QuizOnline • Hệ Thống Luyện Thi Tiếng Anh 3
            </div>
            <div style={{ fontSize: '0.92rem', fontWeight: 700, color: '#1e293b', marginTop: '4px' }}>
              Tác giả: <span style={{ color: '#4f46e5' }}>Lý Anh Vinh</span>
            </div>
            <div style={{ fontSize: '0.8rem', color: 'var(--text-muted)', marginTop: '4px' }}>
              Trọn bộ 5 Practice Tests chuẩn hóa (200 câu hỏi trắc nghiệm & lời giải chi tiết)
            </div>
          </div>
        </footer>
      )}
    </div>
  );
}

