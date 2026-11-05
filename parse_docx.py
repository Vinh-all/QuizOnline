import zipfile
import xml.etree.ElementTree as ET
import json
import re

def parse_docx(file_path):
    with zipfile.ZipFile(file_path) as z:
        xml_content = z.read('word/document.xml')
    tree = ET.fromstring(xml_content)

    paragraphs = [''.join(node.itertext()).strip() for node in tree.iter() if node.tag.endswith('}p')]
    paragraphs = [p for p in paragraphs if p]

    part_regex = re.compile(r'^PRACTICE TEST\s+(\d+)\s*[-:]\s*(?:PART|PASSAGE)\s*(\d+)(.*?):(.*)$', re.IGNORECASE)
    q_regex = re.compile(r'^(\d+)[\.\)]\s+(.*)$')
    opt_regex = re.compile(r'^([A-D])[\.\)]\s+(.*)$')

    data = []
    current_test = None
    current_part = None
    current_q = None

    for p in paragraphs:
        m_part = part_regex.match(p)
        if m_part:
            test_id = int(m_part.group(1))
            part_id = int(m_part.group(2))
            is_continuation = 'tiếp theo' in p.lower()
            title = m_part.group(4).strip()

            t_obj = next((t for t in data if t['test_id'] == test_id), None)
            if not t_obj:
                t_obj = {'test_id': test_id, 'title': f'Practice Test {test_id}', 'parts': []}
                data.append(t_obj)
            current_test = t_obj

            if is_continuation and current_test['parts']:
                current_part = current_test['parts'][-1]
                current_q = None
                continue

            p_obj = {
                'part_id': part_id,
                'title': title,
                'passage': [],
                'questions': []
            }
            current_test['parts'].append(p_obj)
            current_part = p_obj
            current_q = None
            continue

        if current_part is None:
            continue

        m_q = q_regex.match(p)
        if m_q and int(m_q.group(1)) <= 40:
            q_num = int(m_q.group(1))
            q_text = m_q.group(2).strip()
            current_q = {
                'q_num': q_num,
                'question': q_text,
                'options': [],
                'correct_answer': None,
                'explanation': []
            }
            current_part['questions'].append(current_q)
            continue

        m_opt = opt_regex.match(p)
        if current_q and m_opt and len(current_q['options']) < 4:
            opt_key = m_opt.group(1).upper()
            opt_val = m_opt.group(2).strip()
            is_correct = False
            if any(k in opt_val.lower() for k in ['đáp án được chọn', 'đáp án đã chọn', 'đáp án đúng']):
                is_correct = True
                opt_val = re.sub(r'[\(\[]đáp án.*?[\]\)]', '', opt_val, flags=re.IGNORECASE).strip()
            current_q['options'].append({
                'key': opt_key,
                'text': opt_val
            })
            if is_correct:
                current_q['correct_answer'] = opt_key
            continue

        if current_q:
            if not current_q['correct_answer']:
                m_ans = re.search(r'đáp án(?:\s+đúng)?[:\s]+([A-D])\b', p, re.IGNORECASE)
                if m_ans:
                    current_q['correct_answer'] = m_ans.group(1).upper()
            current_q['explanation'].append(p)
        else:
            current_part['passage'].append(p)

    return data

if __name__ == '__main__':
    data = parse_docx('Anh văn.docx')
    with open('quiz_data.json', 'w', encoding='utf-8') as f:
        json.dump(data, f, ensure_ascii=False, indent=2)
    
    total_q = sum(len(p['questions']) for t in data for p in t['parts'])
    print(f'Done! Total tests: {len(data)}, Total questions: {total_q}')
    for t in data:
        q_cnt = sum(len(p['questions']) for p in t['parts'])
        no_ans = sum(1 for p in t['parts'] for q in p['questions'] if not q['correct_answer'])
        print(f"Test {t['test_id']}: {len(t['parts'])} parts, {q_cnt} questions, missing answers: {no_ans}")

