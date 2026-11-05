import React from 'react';
import { Clock, HelpCircle, BookOpen, Shuffle, PlayCircle, CheckCircle2 } from 'lucide-react';

export default function TestCard({ test, index, onStartTest }) {
  // Danh sách chủ đề bài đọc tương ứng với từng Test
  const testTopics = {
    1: [
      'Part 1: The Preservation of Native American Languages',
      'Part 2: Doctors treat patients for free at clinic in Ha Noi',
      'Part 3: The Interconnected Future',
      'Part 4: The Price of Convenience'
    ],
    2: [
      'Part 1: The Paris Underground',
      'Part 2: Phillis Wheatley',
      'Part 3: The Rise of Digital Media',
      'Part 4: Economics and Everyday Life'
    ],
    3: [
      'Part 1: The Space Age and Exploration',
      'Part 2: The History of Comic Strips',
      'Part 3: The Role of Art in Society',
      'Part 4: Technology and the Future of Work'
    ],
    4: [
      'Part 1: Holiday Horror Stories',
      'Part 2: Effects of Global Warming on Wildlife',
      'Part 3: Environmental Challenges and Climate Change',
      'Part 4: The Power of Social Media'
    ],
    5: [
      'Passage 1: Coasteering (Adventure Activity)',
      'Passage 2: Continents and Ocean Basins',
      'Passage 3: SpeedFlatmating',
      'Passage 4: Personality Revealed & Phrenology'
    ]
  };

  const topics = testTopics[index + 1] || [];

  return (
    <div className="test-card animate-fade">
      {/* Top Banner */}
      <div>
        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start', marginBottom: '14px' }}>
          <span className="test-card-tag tag-blue">
            <BookOpen size={14} />
            Đề số 0{index + 1}
          </span>
          <div style={{ display: 'flex', gap: '6px' }}>
            {test.shuffle_questions && (
              <span className="test-card-tag tag-amber" title="Đề thi tự động trộn thứ tự câu hỏi">
                <Shuffle size={12} /> Trộn Đề
              </span>
            )}
          </div>
        </div>

        {/* Title */}
        <h3 style={{ fontSize: '1.3rem', fontWeight: 800, color: 'var(--dark)', marginBottom: '8px' }}>
          {test.title}
        </h3>
        <p style={{ fontSize: '0.88rem', color: 'var(--text-muted)', marginBottom: '16px' }}>
          Bộ đề trắc nghiệm Kỹ năng Đọc Tiếng Anh 3 bóc tách đầy đủ từ tài liệu chuẩn.
        </p>

        {/* 4 Passages Box */}
        <div style={{ background: '#f8fafc', borderRadius: '10px', padding: '12px 14px', marginBottom: '20px', border: '1px solid #f1f5f9' }}>
          <div style={{ fontSize: '0.78rem', fontWeight: 700, textTransform: 'uppercase', color: 'var(--text-muted)', marginBottom: '8px' }}>
            📖 4 Phần Đọc Hiểu (Reading Passages):
          </div>
          <div style={{ display: 'flex', flexDirection: 'column', gap: '6px' }}>
            {topics.map((t, idx) => (
              <div key={idx} style={{ fontSize: '0.82rem', color: '#334155', display: 'flex', alignItems: 'center', gap: '6px' }}>
                <span style={{ width: '6px', height: '6px', borderRadius: '50%', background: 'var(--primary)', flexShrink: 0 }}></span>
                <span style={{ whiteSpace: 'nowrap', overflow: 'hidden', textOverflow: 'ellipsis' }}>{t}</span>
              </div>
            ))}
          </div>
        </div>

        {/* Meta Stats Badges */}
        <div style={{ display: 'flex', gap: '16px', marginBottom: '24px' }}>
          <div style={{ display: 'flex', alignItems: 'center', gap: '6px', fontSize: '0.88rem', color: 'var(--text-muted)', fontWeight: 600 }}>
            <Clock size={16} color="var(--primary)" />
            {test.time_limit_minutes} Phút
          </div>
          <div style={{ display: 'flex', alignItems: 'center', gap: '6px', fontSize: '0.88rem', color: 'var(--text-muted)', fontWeight: 600 }}>
            <HelpCircle size={16} color="var(--primary)" />
            {test.questions_count || 40} Câu hỏi
          </div>
        </div>
      </div>

      {/* Action Button */}
      <button 
        onClick={() => onStartTest(test)}
        style={{
          width: '100%',
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'center',
          gap: '8px',
          padding: '12px',
          background: 'linear-gradient(135deg, #4f46e5, #6366f1)',
          color: '#ffffff',
          borderRadius: '10px',
          fontWeight: 700,
          fontSize: '0.98rem',
          boxShadow: '0 4px 12px rgba(79, 70, 229, 0.25)',
        }}
      >
        <PlayCircle size={20} />
        Bắt Đầu Làm Bài
      </button>
    </div>
  );
}
