import json
import re

def escape_sql(text):
    if text is None:
        return "NULL"
    # Double single quotes for SQL string literal
    escaped = text.replace("'", "''")
    return f"'{escaped}'"

def generate():
    with open('quiz_data.json', 'r', encoding='utf-8') as f:
        tests = json.load(f)

    sql_lines = []
    sql_lines.append("-- ====================================================================")
    sql_lines.append("-- SEED DATA: NẠP 5 PRACTICE TESTS VÀ 200 CÂU HỎI TỪ ANH VĂN.DOCX")
    sql_lines.append("-- ====================================================================\n")
    sql_lines.append("DO $$")
    sql_lines.append("DECLARE")
    sql_lines.append("    v_test_id UUID;")
    sql_lines.append("    v_part_id UUID;")
    sql_lines.append("    v_question_id UUID;")
    sql_lines.append("BEGIN\n")

    for test in tests:
        t_id = test['test_id']
        t_title = test['title']
        t_desc = f"Đề thi trắc nghiệm Kỹ năng Đọc Tiếng Anh 3 - Gồm 4 phần đọc và 40 câu hỏi."
        
        sql_lines.append(f"    -- PRACTICE TEST {t_id}")
        sql_lines.append(f"    INSERT INTO tests (title, description, time_limit_minutes, shuffle_questions, shuffle_options, is_published)")
        sql_lines.append(f"    VALUES ({escape_sql(t_title)}, {escape_sql(t_desc)}, 60, true, true, true)")
        sql_lines.append(f"    RETURNING id INTO v_test_id;\n")

        for part in test['parts']:
            p_num = part['part_id']
            p_title = part['title']
            passage_full = "\n\n".join(part['passage'])

            sql_lines.append(f"    -- Part {p_num}: {p_title[:40]}")
            sql_lines.append(f"    INSERT INTO test_parts (test_id, part_number, title, passage_text)")
            sql_lines.append(f"    VALUES (v_test_id, {p_num}, {escape_sql(f'Part {p_num}: {p_title}')}, {escape_sql(passage_full)})")
            sql_lines.append(f"    RETURNING id INTO v_part_id;\n")

            for q in part['questions']:
                q_num = q['q_num']
                q_text = q['question']
                explanation_full = "\n".join(q['explanation'])
                c_ans = q['correct_answer']

                sql_lines.append(f"    -- Question {q_num}")
                sql_lines.append(f"    INSERT INTO questions (test_part_id, question_number, question_text, explanation)")
                sql_lines.append(f"    VALUES (v_part_id, {q_num}, {escape_sql(q_text)}, {escape_sql(explanation_full)})")
                sql_lines.append(f"    RETURNING id INTO v_question_id;\n")

                for opt in q['options']:
                    opt_key = opt['key']
                    opt_text = opt['text']
                    is_correct = "true" if opt_key == c_ans else "false"
                    sql_lines.append(f"    INSERT INTO question_options (question_id, option_key, option_text, is_correct)")
                    sql_lines.append(f"    VALUES (v_question_id, {escape_sql(opt_key)}, {escape_sql(opt_text)}, {is_correct});")
                
                sql_lines.append("")

    sql_lines.append("END $$;")

    with open('backend/database/seed_data.sql', 'w', encoding='utf-8') as f:
        f.write("\n".join(sql_lines))

    print(f"Generated backend/database/seed_data.sql successfully! Total lines: {len(sql_lines)}")

if __name__ == '__main__':
    generate()

