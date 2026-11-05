// API Client cho QuizOnline Frontend
const API_BASE_URL = import.meta.env.VITE_API_URL || 'http://localhost:5000/api';

export const apiClient = {
  getToken: () => localStorage.getItem('quiz_token'),
  setToken: (token) => localStorage.setItem('quiz_token', token),
  getUser: () => {
    try {
      const u = localStorage.getItem('quiz_user');
      return u ? JSON.parse(u) : null;
    } catch {
      return null;
    }
  },
  setUser: (user) => localStorage.setItem('quiz_user', JSON.stringify(user)),
  logout: () => {
    localStorage.removeItem('quiz_token');
    localStorage.removeItem('quiz_user');
  },

  request: async (endpoint, options = {}) => {
    const token = apiClient.getToken();
    const headers = {
      'Content-Type': 'application/json',
      ...options.headers,
    };
    if (token) {
      headers['Authorization'] = `Bearer ${token}`;
    }

    const url = endpoint.startsWith('http') ? endpoint : `${API_BASE_URL}${endpoint}`;
    
    try {
      const res = await fetch(url, { ...options, headers });
      const data = await res.json().catch(() => ({}));

      if (!res.ok) {
        throw new Error(data.message || `Lỗi máy chủ (${res.status})`);
      }
      return data;
    } catch (err) {
      if (err.name === 'TypeError' || err.message === 'Failed to fetch') {
        throw new Error('Không thể kết nối đến máy chủ Backend (Cổng 5000)! Vui lòng kiểm tra lại kết nối mạng hoặc đảm bảo máy chủ backend đang chạy.');
      }
      throw err;
    }
  },

  // Auth
  login: (email, password) => apiClient.request('/auth/login', {
    method: 'POST',
    body: JSON.stringify({ email: email.trim().toLowerCase(), password }),
  }),

  register: (email, password, full_name, role) => apiClient.request('/auth/register', {
    method: 'POST',
    body: JSON.stringify({ email: email.trim().toLowerCase(), password, full_name: full_name.trim(), role }),
  }),

  getMe: () => apiClient.request('/auth/me'),

  // Tests
  getTests: () => apiClient.request('/tests'),
  getTestById: (id) => apiClient.request(`/tests/${id}`),

  // Exam
  startExam: (test_id, part_number = null, is_timed = false) => apiClient.request('/exams/start', {
    method: 'POST',
    body: JSON.stringify({ test_id, part_number, is_timed }),
  }),

  submitExam: (attempt_id, answers) => apiClient.request('/exams/submit', {
    method: 'POST',
    body: JSON.stringify({ attempt_id, answers }),
  }),

  getExamHistory: () => apiClient.request('/exams/history'),
  getAttemptDetail: (attempt_id) => apiClient.request(`/exams/attempt/${attempt_id}`),

  // Stats
  getUserStats: () => apiClient.request('/stats/user'),
  getDashboardStats: () => apiClient.request('/stats/dashboard'),
};
