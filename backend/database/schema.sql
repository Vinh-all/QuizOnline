-- ====================================================================
-- DỰ ÁN QUIZONLINE - SCHEMA CƠ SỞ DỮ LIỆU POSTGRESQL (SUPABASE)
-- GIAI ĐOẠN 2: THIẾT KẾ CSDL HOÀN CHỈNH
-- ====================================================================

-- 1. Kích hoạt extension hỗ trợ UUID nếu chưa có
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- 2. Xóa các bảng cũ nếu tồn tại (theo thứ tự khóa ngoại ngược lại)
DROP TABLE IF EXISTS exam_answers CASCADE;
DROP TABLE IF EXISTS exam_attempts CASCADE;
DROP TABLE IF EXISTS question_options CASCADE;
DROP TABLE IF EXISTS questions CASCADE;
DROP TABLE IF EXISTS test_parts CASCADE;
DROP TABLE IF EXISTS tests CASCADE;
DROP TABLE IF EXISTS users CASCADE;

-- 3. Tạo kiểu dữ liệu ENUM cho vai trò và trạng thái
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'user_role') THEN
        CREATE TYPE user_role AS ENUM ('admin', 'teacher', 'student');
    END IF;
    IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'attempt_status') THEN
        CREATE TYPE attempt_status AS ENUM ('in_progress', 'completed', 'timed_out');
    END IF;
END $$;

-- ====================================================================
-- BẢNG 1: USERS (Người dùng, phân quyền Admin / Teacher / Student)
-- ====================================================================
CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    full_name VARCHAR(150) NOT NULL,
    role user_role NOT NULL DEFAULT 'student',
    is_active BOOLEAN NOT NULL DEFAULT true,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- ====================================================================
-- BẢNG 2: TESTS (Đề thi / Bài luyện tập, ví dụ: Practice Test 1 - 5)
-- ====================================================================
CREATE TABLE tests (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    title VARCHAR(255) NOT NULL,
    description TEXT,
    time_limit_minutes INTEGER NOT NULL DEFAULT 60, -- Thời gian làm bài (phút)
    shuffle_questions BOOLEAN NOT NULL DEFAULT false, -- Cho phép trộn thứ tự câu hỏi
    shuffle_options BOOLEAN NOT NULL DEFAULT false,   -- Cho phép trộn phương án A/B/C/D
    is_published BOOLEAN NOT NULL DEFAULT true,
    created_by UUID REFERENCES users(id) ON DELETE SET NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- ====================================================================
-- BẢNG 3: TEST_PARTS (Các phần đọc / Passages trong đề thi)
-- Mỗi Test có 4 Parts, chứa bài đọc tiếng Anh tương ứng
-- ====================================================================
CREATE TABLE test_parts (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    test_id UUID NOT NULL REFERENCES tests(id) ON DELETE CASCADE,
    part_number INTEGER NOT NULL, -- 1, 2, 3, 4
    title VARCHAR(255) NOT NULL,  -- e.g. "Part 1: The Preservation of Native American Languages"
    passage_text TEXT NOT NULL,   -- Đoạn văn tiếng Anh đầy đủ
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- ====================================================================
-- BẢNG 4: QUESTIONS (Ngân hàng câu hỏi trắc nghiệm)
-- ====================================================================
CREATE TABLE questions (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    test_part_id UUID NOT NULL REFERENCES test_parts(id) ON DELETE CASCADE,
    question_number INTEGER NOT NULL, -- Số thứ tự trong đề (1 đến 40)
    question_text TEXT NOT NULL,      -- Nội dung câu hỏi
    explanation TEXT,                 -- Lời giải thích, dẫn chứng và dịch nghĩa chi tiết
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- ====================================================================
-- BẢNG 5: QUESTION_OPTIONS (4 phương án lựa chọn A, B, C, D)
-- ====================================================================
CREATE TABLE question_options (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    question_id UUID NOT NULL REFERENCES questions(id) ON DELETE CASCADE,
    option_key VARCHAR(2) NOT NULL, -- 'A', 'B', 'C', 'D'
    option_text TEXT NOT NULL,      -- Nội dung phương án
    is_correct BOOLEAN NOT NULL DEFAULT false, -- Đánh dấu đáp án đúng
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- ====================================================================
-- BẢNG 6: EXAM_ATTEMPTS (Lịch sử mỗi lượt làm bài thi của học sinh)
-- ====================================================================
CREATE TABLE exam_attempts (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    test_id UUID NOT NULL REFERENCES tests(id) ON DELETE CASCADE,
    started_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    submitted_at TIMESTAMP WITH TIME ZONE,
    total_questions INTEGER NOT NULL DEFAULT 40,
    correct_count INTEGER NOT NULL DEFAULT 0,
    score NUMERIC(5,2) NOT NULL DEFAULT 0.00, -- Thang điểm 10 hoặc 100
    status attempt_status NOT NULL DEFAULT 'in_progress',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- ====================================================================
-- BẢNG 7: EXAM_ANSWERS (Chi tiết từng câu trả lời trong lượt thi)
-- ====================================================================
CREATE TABLE exam_answers (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    attempt_id UUID NOT NULL REFERENCES exam_attempts(id) ON DELETE CASCADE,
    question_id UUID NOT NULL REFERENCES questions(id) ON DELETE CASCADE,
    selected_option_id UUID REFERENCES question_options(id) ON DELETE SET NULL,
    selected_key VARCHAR(2), -- 'A', 'B', 'C', 'D'
    is_correct BOOLEAN NOT NULL DEFAULT false,
    answered_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- ====================================================================
-- TẠO CÁC CHỈ MỤC (INDEXES) TỐI ƯU HIỆU NĂNG TRUY VẤN
-- ====================================================================
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_role ON users(role);
CREATE INDEX idx_tests_published ON tests(is_published);
CREATE INDEX idx_test_parts_test_id ON test_parts(test_id);
CREATE INDEX idx_questions_part_id ON questions(test_part_id);
CREATE INDEX idx_question_options_q_id ON question_options(question_id);
CREATE INDEX idx_exam_attempts_user_id ON exam_attempts(user_id);
CREATE INDEX idx_exam_attempts_test_id ON exam_attempts(test_id);
CREATE INDEX idx_exam_answers_attempt_id ON exam_answers(attempt_id);

-- ====================================================================
-- TẠO DỮ LIỆU NGƯỜI DÙNG MẪU (Băm mật khẩu mẫu: '123456')
-- Hash bcrypt tương ứng của '123456': $2b$10$wE9mHl0nEwTf4Jv2K5QOQOi2C8XwR.f1U7R1m3YpZt8Gj8PzM.V0G
-- ====================================================================
INSERT INTO users (email, password_hash, full_name, role) VALUES
('admin@quizonline.com', '$2b$10$wE9mHl0nEwTf4Jv2K5QOQOi2C8XwR.f1U7R1m3YpZt8Gj8PzM.V0G', 'Quản Trị Viên Hệ Thống', 'admin'),
('teacher@quizonline.com', '$2b$10$wE9mHl0nEwTf4Jv2K5QOQOi2C8XwR.f1U7R1m3YpZt8Gj8PzM.V0G', 'Giáo Viên Tiếng Anh', 'teacher'),
('student@quizonline.com', '$2b$10$wE9mHl0nEwTf4Jv2K5QOQOi2C8XwR.f1U7R1m3YpZt8Gj8PzM.V0G', 'Học Sinh Mẫu', 'student');

