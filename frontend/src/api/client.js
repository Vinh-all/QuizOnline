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
    const res = await fetch(url, { ...options, headers });
    const data = await res.json().catch(() => ({}));

    if (!res.ok) {
      throw new Error(data.message || `Lỗi yêu cầu (${res.status})`);
    }
    return data;
  },

  // Auth
  login: (email, password) => apiClient.request('/auth/login', {
    method: 'POST',
    body: JSON.stringify({ email, password }),
  }),

  register: (email, password, full_name, role) => apiClient.request('/auth/register', {
    method: 'POST',
    body: JSON.stringify({ email, password, full_name, role }),
  }),

  getMe: () => apiClient.request('/auth/me'),

  // Tests
  getTests: () => apiClient.request('/tests'),
  getTestById: (id) => apiClient.request(`/tests/${id}`),

  // Exam
  startExam: (test_id) => apiClient.request('/exams/start', {
    method: 'POST',
    body: JSON.stringify({ test_id }),
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

