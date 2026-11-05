import React from 'react';
import { Clock, HelpCircle, BookOpen, Shuffle, PlayCircle, Zap, Timer } from 'lucide-react';

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
        <h3 style={{ fontSize: '1.35rem', fontWeight: 800, color: 'var(--dark)', marginBottom: '8px' }}>
          {test.title}
        </h3>
        <p style={{ fontSize: '0.88rem', color: 'var(--text-muted)', marginBottom: '16px' }}>
          Bộ đề trắc nghiệm Kỹ năng Đọc Tiếng Anh 3 (40 câu hỏi, 4 bài đọc).
        </p>

        {/* 4 Passages Box with Direct Practice per Part */}
        <div style={{ background: '#f8fafc', borderRadius: '12px', padding: '14px', marginBottom: '20px', border: '1px solid #f1f5f9' }}>
          <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '10px' }}>
            <span style={{ fontSize: '0.78rem', fontWeight: 800, textTransform: 'uppercase', color: 'var(--text-muted)' }}>
              📖 Luyện Từng Part Riêng Lẻ (10 câu/part):
            </span>
          </div>

          <div style={{ display: 'flex', flexDirection: 'column', gap: '8px' }}>
            {topics.map((t, idx) => {
              const partNum = idx + 1;
              return (
                <div 
                  key={idx} 
                  style={{ 
                    background: '#ffffff', 
                    borderRadius: '8px', 
                    padding: '8px 10px', 
                    border: '1px solid #e2e8f0',
                    display: 'flex', 
                    justifyContent: 'space-between', 
                    alignItems: 'center', 
                    gap: '8px' 
                  }}
                >
                  <div style={{ minWidth: 0, flex: 1 }}>
                    <div style={{ fontSize: '0.82rem', fontWeight: 700, color: '#1e293b', whiteSpace: 'nowrap', overflow: 'hidden', textOverflow: 'ellipsis' }}>
                      {t}
                    </div>
                  </div>

                  <div style={{ display: 'flex', gap: '4px', flexShrink: 0 }}>
                    <button
                      onClick={() => onStartTest(test, partNum, false)}
                      title={`Luyện riêng Part ${partNum} không giới hạn thời gian`}
                      style={{
                        padding: '4px 8px',
                        background: '#ecfdf5',
                        color: '#047857',
                        border: '1px solid #a7f3d0',
                        borderRadius: '6px',
                        fontSize: '0.75rem',
                        fontWeight: 700,
                      }}
                    >
                      Luyện Tự Do
                    </button>
                    <button
                      onClick={() => onStartTest(test, partNum, true)}
                      title={`Thi riêng Part ${partNum} bấm giờ 15 phút`}
                      style={{
                        padding: '4px 8px',
                        background: '#e0e7ff',
                        color: '#4338ca',
                        border: '1px solid #c7d2fe',
                        borderRadius: '6px',
                        fontSize: '0.75rem',
                        fontWeight: 700,
                      }}
                    >
                      Bấm Giờ 15p
                    </button>
                  </div>
                </div>
              );
            })}
          </div>
        </div>

        {/* Meta Stats Badges */}
        <div style={{ display: 'flex', gap: '16px', marginBottom: '20px', flexWrap: 'wrap' }}>
          <div style={{ display: 'flex', alignItems: 'center', gap: '6px', fontSize: '0.85rem', color: '#047857', fontWeight: 700, background: '#ecfdf5', padding: '4px 10px', borderRadius: '6px' }}>
            <Clock size={15} color="#047857" />
            Có Luyện Tự Do & Bấm Giờ
          </div>
          <div style={{ display: 'flex', alignItems: 'center', gap: '6px', fontSize: '0.85rem', color: 'var(--text-muted)', fontWeight: 600 }}>
            <HelpCircle size={15} color="var(--primary)" />
            {test.questions_count || 40} Câu cả đề
          </div>
        </div>
      </div>

      {/* TWO MAIN BUTTONS FOR FULL EXAM (40 CÂU) */}
      <div style={{ display: 'flex', flexDirection: 'column', gap: '10px' }}>
        {/* Nút 1: Luyện toàn bộ đề không giới hạn thời gian */}
        <button 
          onClick={() => onStartTest(test, null, false)}
          style={{
            width: '100%',
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'center',
            gap: '8px',
            padding: '12px',
            background: 'linear-gradient(135deg, #059669, #10b981)',
            color: '#ffffff',
            borderRadius: '10px',
            fontWeight: 700,
            fontSize: '0.94rem',
            boxShadow: '0 4px 12px rgba(16, 185, 129, 0.25)',
          }}
        >
          <Zap size={18} />
          Luyện Đề Tự Do (Không Giới Hạn Giờ)
        </button>

        {/* Nút 2: Thi thử toàn bộ đề có bấm giờ 60 phút */}
        <button 
          onClick={() => onStartTest(test, null, true)}
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
            fontSize: '0.94rem',
            boxShadow: '0 4px 12px rgba(79, 70, 229, 0.25)',
          }}
        >
          <Timer size={18} />
          Thi Thử (Bấm Giờ 60 Phút)
        </button>
      </div>
    </div>
  );
}
