-- ====================================================================
-- SEED DATA: NẠP 5 PRACTICE TESTS VÀ 200 CÂU HỎI TỪ ANH VĂN.DOCX
-- ====================================================================

DO $$
DECLARE
    v_test_id UUID;
    v_part_id UUID;
    v_question_id UUID;
BEGIN

    -- PRACTICE TEST 1
    INSERT INTO tests (title, description, time_limit_minutes, shuffle_questions, shuffle_options, is_published)
    VALUES ('Practice Test 1', 'Đề thi trắc nghiệm Kỹ năng Đọc Tiếng Anh 3 - Gồm 4 phần đọc và 40 câu hỏi.', 60, true, true, true)
    RETURNING id INTO v_test_id;

    -- Part 1: The Preservation of Native American Lang
    INSERT INTO test_parts (test_id, part_number, title, passage_text)
    VALUES (v_test_id, 1, 'Part 1: The Preservation of Native American Languages', 'They brought new cultures and languages to this place which they called America. However, there were already people living there who had their own cultures and languages. And so a terrible part of history began.

As more Europeans arrived, there was a fight for the land with the native American Indians. By the end of the nineteenth century, the Indian tribes were moved to reservations. A lot of their children were taken away to boarding schools and these children were taught to speak English. By the end of the twentieth century more than half of the Native Americans in the US were living in cities. They gave up speaking their old tribal language and only used English. As a result, many Native American languages disappeared and with them their culture.

Some American Indian languages are still used today but they are usually spoken by the older members of the tribes who still live on the reservations. In North America there are 150-170 languages that have at least one speaker and many of these languages have under a hundred speakers.

One ancient language which is spoken by the Northern Paiute tribe has more than two hundred speakers. This means when the elders of the tribe get together, they still speak it. But for most of the younger members of the tribe, the everyday language is English.

But the good news is that some of these people are keeping their culture and language alive. They are also receiving help from the National Geographic Society''s Enduring Voices Project. The aim of the project is to help languages around the world which are dying out. Linguists and experts meet these ''last speakers''. The team interview them and they are recorded with video, pictures and audio. They also tell old stories which are written down in English so people can learn more about the culture.

Recording the language and culture is only part of the project. The next stage is to pass on the language to the next generation. Some children pick up some of the language from their parents or grandparents but many tribes also offer courses in the language. The Salish tribe is an excellent example of how schools can help. The tribe lives in the Flathead Reservation in Montana. Their language is currently spoken by about 50 people who are aged over 75 years. No one under 50 speaks the language. So now, the local people have set up a school. It has 30 students aged two to twelve during the day and there are also courses for adults in the evening. It is schools and projects like these which — hopefully — might save languages for the future.')
    RETURNING id INTO v_part_id;

    -- Question 1
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 1, 'What does "taken away" in paragraph 2 mean?', 'Giải thích: Bài đọc có câu “A lot of their children were taken away to boarding schools”, nghĩa là nhiều trẻ em bị đưa khỏi gia đình đến trường nội trú.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Removed from someone', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Learnt informally', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Met and discussed something', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Stopped doing something', false);

    -- Question 2
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 2, 'What happened when more Europeans arrived?', 'Giải thích: Đoạn 2 viết “there was a fight for the land with the native American Indians”, nghĩa là người châu Âu đã tranh giành đất đai với người Mỹ bản địa.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'They were welcomed by native America Indians.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'They lived in peace with native America Indians.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'They fought for the land with the native American Indians.', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'They fought for the food with the native American Indians.', false);

    -- Question 3
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 3, 'When were the Indian tribes moved to reservations?', 'Giải thích: Bài đọc nêu rõ “By the end of the nineteenth century, the Indian tribes were moved to reservations”, tức là vào cuối thế kỷ 19.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'By the end of the nineteenth century', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'By the beginning of the nineteenth century', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'At the beginning of the twentieth century', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'At the end of the twentieth century', false);

    -- Question 4
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 4, 'Today, who usually speak American Indian languages?', 'Giải thích: Đoạn 3 nói ngôn ngữ bản địa hiện nay thường được sử dụng bởi những thành viên lớn tuổi trong các bộ lạc còn sống tại khu bảo tồn.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'The young members of the tribes who still live on the reservations.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'The old members of the tribes who still live on the reservations.', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Both young and old members of the tribes who still live on the reservations.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'No one of the tribes who still live on the reservations.', false);

    -- Question 5
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 5, 'How many languages have at least one speaker in North America?', 'Giải thích: Bài đọc ghi rõ “In North America there are 150-170 languages that have at least one speaker”, tức là có từ 150 đến 170 ngôn ngữ.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', '150-170', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', '160-170', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', '130-140', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', '140-150', false);

    -- Question 6
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 6, 'What is the aim of the National Geographic Society''s Enduring Voices Project?', 'Giải thích: Mục tiêu của dự án là giúp bảo tồn những ngôn ngữ đang dần biến mất trên khắp thế giới.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'help languages around the world which are dying out', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'help languages in America which are dying out', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'help people around the world', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'help people in America', false);

    -- Question 7
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 7, 'What doesn''t the Project team do?', 'Giải thích: Nhóm dự án phỏng vấn, ghi hình, chụp ảnh, thu âm và ghi lại những câu chuyện của người nói ngôn ngữ cuối cùng. Bài đọc không đề cập việc sắp xếp nơi ở cho họ.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'They interview the last speakers.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'They have the last speakers live in an area.', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'They record the last speakers.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'They listen to the last speakers tell stories.', false);

    -- Question 8
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 8, 'What does "pass on" in the last paragraph mean?', 'Giải thích: Cụm “pass on the language to the next generation” có nghĩa là truyền lại ngôn ngữ cho thế hệ tiếp theo.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Stop doing someone', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Write something with pen and paper', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Become less common and disappear', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Give to someone', true);

    -- Question 9
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 9, 'How many people of Salish tribe aged over 75 years speak their languages?', 'Giải thích: Đoạn cuối viết “Their language is currently spoken by about 50 people who are aged over 75 years”, nghĩa là có khoảng 50 người trên 75 tuổi nói ngôn ngữ này.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', '50', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', '150', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', '75D. 30', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', '30', false);

    -- Question 10
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 10, 'How do some children pick up their language?', 'Giải thích: Bài đọc nói một số trẻ học ngôn ngữ từ cha mẹ hoặc ông bà (parents or grandparents). Ngoài ra, các bộ lạc cũng tổ chức những khóa học ngôn ngữ. Vì vậy B là phương án gần nhất với nội dung bài đọc, nhưng không diễn đạt chính xác ý đầu tiên trong đoạn văn.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'They read books.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'They join courses in the language.', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'They stay at home.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'They do nothing.', false);

    -- Part 2: Doctors treat patients for free at clini
    INSERT INTO test_parts (test_id, part_number, title, passage_text)
    VALUES (v_test_id, 2, 'Part 2: Doctors treat patients for free at clinic in Ha Noi', 'For 20 years, Dang Thi Nhan, 67, has been waking up about 30 minutes earlier each day to bake cakes or prepare tea for two retired doctors in a clinic near her house in Ha Noi''s Giap Bat Ward. That is all Nhan can offer as thanks to doctors who provide free health checks for herself, her paralysed husband and their 43-year-old disabled son. [1] “If one day they cannot take care of themselves and need some one to look after, I will do it voluntarily till the day they are gone,” Nhan said.

The small clinic, situated on Kim Dong Street, has become familiar to many people in Ha Noi. It was established in 1992 by Dr Truong Thi Hoi To, 84, a former principal of Nam Dinh Medical College, Le Thi Soc, 87, a retired nurse from Saint Paul Municipal Hospital, and Le Thanh Thuoc, the late deputy director of the Viet Nam National Cancer Hospital, who died last year. The clinic used to open every Monday and Thursday. [2] However, after doctor Thuoc died and due to the deteriorating health of the two other medics, the clinic now only opens on Monday mornings at 8 am. Patients not only receive free health checks, but they also receive free medicine. A

Since 2014, the clinic has treated about 8,500 patients, according to Giap Bat ward''s Red Cross Association. On its first days, the clinic faced numerous difficulties due to lack of money. Mrs. To, as founder of the clinic, had to spend her own pension and encourage her children and relatives to donate money to purchase medical equipment and medicine. The clinic also had to relocate seven times as To and her co-workers could not afford high rents. Despite these difficulties, they never thought of giving up. “Being able to help my patients brings me unspeakable joy. This is also my life target. It warms my heart to see the happy faces of the patients,” To said. B

Tran Thi Toan, 64, a patient from Nam Dinh Province, now works as a servant in Ha Noi. [3] She is grateful to doctor To and nurse Soc not just for the free treatment, but for their caring manner. Toan said: [4] “They give me meticulous treatment and clear, detailed instruction as well as advise me on a healthy and happy lifestyle”. Toan feels shy about her job, so the doctors'' care and compassionate attitude have become her inspiration in life. C

To the doctors, the most precious thing they receive from their patients is confidence in their skills, which can only be achieved through ethics and medical excellence. “The success of a doctor does not lies in how much money they earn, but how many people they help”, Soc said. Sharing Soc''s opinion, To said that “Medical practitioners should not consider their profession as a tool to get rich. They should not benefit from their patients'' pain. Patients come first, not money.” D')
    RETURNING id INTO v_part_id;

    -- Question 11
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 11, 'How old was Dang Thi Nhan when she first started to bake cakes or prepare tea for the two doctors?', 'Giải thích: Bà Nhan hiện 67 tuổi và đã làm việc này trong 20 năm. Vậy tuổi lúc bắt đầu là 67 − 20 = 47 tuổi.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', '20', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', '67', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', '43', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', '47', true);

    -- Question 12
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 12, 'The word "they" in paragraph 1 refers to', 'Giải thích: Đại từ they trong câu nói về những người chăm sóc và khám bệnh miễn phí cho gia đình bà Nhan. Đó chính là hai bác sĩ đã nghỉ hưu.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'two doctors', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'husband and son', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'health checks', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Cakes', false);

    -- Question 13
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 13, 'The word "late" in paragraph 2 is closest in meaning to:', 'Giải thích: Cụm “the late deputy director” nói về vị phó giám đốc đã mất. Từ late trong ngữ cảnh này có nghĩa là đã qua đời, không phải muộn.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'last-minute', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'behind', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'delayed', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'deceased', true);

    -- Question 14
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 14, 'The word "its" in paragraph 3 refers to', 'Giải thích: Câu “On its first days, the clinic faced numerous difficulties” nói về những ngày đầu hoạt động của phòng khám. Vì vậy its thay thế cho the clinic.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Red Cross Association', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'the clinic', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'medicine', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Pension', false);

    -- Question 15
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 15, 'Who probably did not work in a hospital before retirement?', 'Giải thích: Bà Soc từng là y tá tại bệnh viện Saint Paul, ông Thuoc từng là phó giám đốc Bệnh viện Ung bướu Quốc gia Việt Nam. Bài đọc chỉ giới thiệu bà To là cựu hiệu trưởng trường Cao đẳng Y tế Nam Định.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Le Thi Soc', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Le Thanh Thuoc', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Truong Thi Hoi To', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'All of them', false);

    -- Question 16
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 16, 'Which sentence does the author mention about the bad health condition of the doctors at the clinic:', 'Giải thích: Câu [2] đề cập sức khỏe của hai bác sĩ đang suy giảm (“due to the deteriorating health of the two other medics”), khiến phòng khám chỉ mở cửa vào sáng thứ Hai.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', '[1]', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', '[2]', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', '[3]', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', '[4]', false);

    -- Question 17
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 17, 'The word "donate" in paragraph 3 could be best replaced by', 'Giải thích: Donate money có nghĩa là quyên góp tiền. Từ đồng nghĩa gần nhất trong các lựa chọn là give.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'give', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'take', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'keep', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Get', false);

    -- Question 18
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 18, 'What has helped Mrs. Tran Thi Toan gain confidence in her life?', 'Giải thích: Bà Toan biết ơn các bác sĩ vì được điều trị miễn phí và nhận được sự quan tâm, chăm sóc tận tình. Chính thái độ nhân ái của họ đã trở thành nguồn cảm hứng cho bà.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'her job as a servant', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'her gratitude to all doctors', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'her healthy and happy lifestyle', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'doctors'' caring manner and free treatment at clinic', true);

    -- Question 19
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 19, 'In which space (marked A, B, C and D in the passage) will the following sentence fit?"They treat me as a close member of their family. There is no discrimination between the rich and the poor. Everyone is treated equally." She added.', 'Giải thích: Câu cần điền nói về sự đối xử bình đẳng, thân thiết của các bác sĩ với bệnh nhân. Nó phù hợp ngay sau phần bà Toan chia sẻ về sự chăm sóc tận tình của bác sĩ To và y tá Soc.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'A', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'B', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'C', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'D', false);

    -- Question 20
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 20, 'The last paragraph indicates Mrs. Soc''s opinion that a doctor is successful if', 'Giải thích: Bà Soc nói: “The success of a doctor does not lie in how much money they earn, but how many people they help.” Nghĩa là thành công của bác sĩ được đánh giá bằng số người họ giúp đỡ, không phải số tiền kiếm được.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'he/she earns a lot of money', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'he/she is confident in his/her skills', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'he/she helps a lot of patients', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'he/she benefits from their patients'' pain', false);

    -- Part 3: The Interconnected Future
    INSERT INTO test_parts (test_id, part_number, title, passage_text)
    VALUES (v_test_id, 3, 'Part 3: The Interconnected Future', 'In the 21st century, progress in technology, media, and economics has drastically reshaped our world. With the rise of digital platforms, media now spreads information faster than ever, influencing public opinion, politics, and even consumer habits. While this creates opportunities for education and innovation, it also raises concerns about misinformation and privacy.

At the same time, technology has revolutionized not only how we communicate, but also how we live and work. Artificial intelligence, for instance, is changing industries—from manufacturing to healthcare—making systems more efficient, though also threatening to replace some human jobs. The challenge lies in ensuring that technological growth benefits society as a whole, rather than deepening inequality.

History has shown that societies flourish when they value both progress and culture. The arts, often overlooked in today''s economy-driven world, are crucial for expressing identity, preserving heritage, and inspiring creativity. In many cases, public funding for the arts is limited, as governments prioritize economic growth. However, without support for cultural sectors, a society risks losing its soul.

Meanwhile, environmental issues remain urgent. Climate change, pollution, and resource depletion are global threats that demand immediate attention. Ironically, while technology and economics often contribute to environmental problems, they may also offer solutions. Green technology, such as renewable energy and sustainable farming, represents a growing field that balances progress with responsibility.

Ultimately, the future depends on how these elements—arts, history, environment, technology, media, and economics—interact. Only by understanding their connections can we make informed decisions. A truly advanced society must combine innovation with ethics, economic strength with environmental care, and modern development with cultural respect.')
    RETURNING id INTO v_part_id;

    -- Question 21
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 21, 'What is the main idea of the passage?', 'Giải thích: Toàn bài nói về sự kết hợp giữa công nghệ, kinh tế, nghệ thuật, văn hóa và môi trường. Xã hội cần phát triển nhưng phải có trách nhiệm với con người và thiên nhiên.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Economic growth is more important than the environment', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Society must balance progress with responsibility', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Technology should replace human workers', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Art and history are no longer relevant', false);

    -- Question 22
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 22, 'What does the passage suggest about media?', 'Giải thích: Đoạn 1 cho biết truyền thông ảnh hưởng đến dư luận, chính trị và thói quen tiêu dùng (consumer habits), tức là có tác động đến hành vi con người.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'It is only used for entertainment', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'It slows down communication', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'It influences people''s behavior', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'It is not affected by technology', false);

    -- Question 23
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 23, 'The phrase "revolutionized how we live and work" means:', 'Giải thích: Revolutionized có nghĩa là tạo ra sự thay đổi lớn hoặc thay đổi hoàn toàn. Công nghệ đã làm thay đổi cách con người sống và làm việc.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Made life more boring', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Changed things completely', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Removed technology from life', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Made work easier but life harder', false);

    -- Question 24
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 24, 'Which of the following is an effect of artificial intelligence, according to the passage?', 'Giải thích: Đoạn 2 nói AI giúp các ngành công nghiệp hoạt động hiệu quả hơn (making systems more efficient), mặc dù có thể thay thế một số công việc của con người.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'It guarantees job security', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'It reduces communication', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'It improves efficiency in industries', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'It slows down economic growth', false);

    -- Question 25
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 25, 'The word "flourish" in paragraph 3 most likely means:', 'Giải thích: Flourish có nghĩa là phát triển mạnh mẽ, thịnh vượng hoặc thành công. Trong bài, từ này nói về những xã hội phát triển tốt khi coi trọng cả tiến bộ và văn hóa.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Decline', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Collapse', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Grow successfully', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Stay unchanged', false);

    -- Question 26
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 26, 'According to the passage, why are the arts important?', 'Giải thích: Đoạn 3 cho biết nghệ thuật giúp thể hiện bản sắc (identity), bảo tồn di sản (heritage) và truyền cảm hứng sáng tạo.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'They help with technical innovation', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'They reduce the need for media', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'They promote cultural identity', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'They are good for the environment', false);

    -- Question 27
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 27, 'What is the author''s attitude toward public funding for the arts?', 'Giải thích: Tác giả cho rằng ngân sách công dành cho nghệ thuật còn hạn chế vì chính phủ ưu tiên tăng trưởng kinh tế. Tác giả cảnh báo xã hội có thể đánh mất bản sắc văn hóa nếu không hỗ trợ nghệ thuật.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Supportive', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Indifferent', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Critical', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Uninterested', false);

    -- Question 28
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 28, 'The word "they" in "they may also offer solutions" (paragraph 4) refers to:', 'Giải thích: Câu trước nhắc đến technology and economics often contribute to environmental problems. Vì vậy, đại từ they thay thế cho công nghệ và kinh tế.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Environmental issues', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Historical events', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Technology and economics', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Artistic movements', false);

    -- Question 29
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 29, 'Which of the following is an example of green technology mentioned in the passage?', 'Giải thích: Đoạn 4 nêu trực tiếp “Green technology, such as renewable energy and sustainable farming”. Trong đó, renewable energy nghĩa là năng lượng tái tạo.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Social media platforms', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Renewable energy', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Artificial intelligence', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Public broadcasting', false);

    -- Question 30
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 30, 'What can be inferred from the last paragraph?', 'Giải thích: Đoạn cuối nhấn mạnh tương lai phụ thuộc vào sự kết nối giữa nghệ thuật, lịch sử, môi trường, công nghệ, truyền thông và kinh tế. Vì vậy, xã hội cần kết hợp nhiều lĩnh vực để phát triển bền vững.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Environmental issues are separate from economic decisions', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'A successful future requires integrating multiple fields', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Society must stop using technology completely', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Media has no place in modern development', false);

    -- Part 4: The Price of Convenience
    INSERT INTO test_parts (test_id, part_number, title, passage_text)
    VALUES (v_test_id, 4, 'Part 4: The Price of Convenience', 'In today''s fast-paced world, convenience often comes at a hidden cost—especially to the environment. From single-use plastics to fast fashion, many of the products that make our lives easier also contribute to pollution, resource depletion, and climate change. While people may appreciate the comfort of disposable items or the affordability of mass-produced goods, these habits are unsustainable in the long term.

Plastic waste, for example, has become a global issue. Oceans are filled with plastic bottles, bags, and packaging that can take hundreds of years to decompose. Marine animals often mistake plastic for food, leading to fatal consequences. Governments and environmental organizations have urged consumers to reduce plastic use, yet progress remains slow.

Another major concern is the fashion industry. Fast fashion encourages people to buy cheap, trendy clothing that is quickly discarded. This not only produces massive amounts of textile waste, but also relies on energy-intensive manufacturing and harmful chemicals. Moreover, most of the clothes are made in factories with poor working conditions and low wages, raising ethical issues as well.

Despite these challenges, there is hope. More individuals are becoming aware of the environmental impact of their choices. Movements promoting minimalism, zero-waste lifestyles, and ethical consumerism are growing. Some companies are shifting toward sustainable practices, such as using recycled materials, reducing packaging, or adopting circular economy models.

Ultimately, real change depends on both personal responsibility and systemic reform. While individual actions—like using reusable bags or buying fewer clothes—do make a difference, governments and industries must also implement stronger policies and greener practices. The path to sustainability may not be easy, but it is essential for protecting the planet for future generations.')
    RETURNING id INTO v_part_id;

    -- Question 31
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 31, 'What is the main message of the passage?', 'Giải thích: Bài đọc nói rằng những sản phẩm giúp cuộc sống tiện lợi như nhựa dùng một lần và thời trang nhanh cũng gây ô nhiễm, cạn kiệt tài nguyên và biến đổi khí hậu.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Modern life is too fast-paced', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'The environment cannot be protected anymore', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Convenience has environmental costs', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'People should stop buying clothes', false);

    -- Question 32
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 32, 'What does the passage say about plastic waste?', 'Giải thích: Đoạn 2 cho biết động vật biển thường nhầm rác nhựa là thức ăn, dẫn đến hậu quả nghiêm trọng, thậm chí tử vong.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'It decomposes quickly', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'It benefits marine animals', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'It is no longer a global issue', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'It causes harm to wildlife', true);

    -- Question 33
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 33, 'The phrase "unsustainable in the long term" means:', 'Giải thích: Unsustainable in the long term nghĩa là không thể duy trì lâu dài mà không gây ra tác hại. Trong bài, thói quen tiêu dùng hiện tại gây ảnh hưởng xấu đến môi trường.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Too expensive to maintain', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Cannot continue without damage', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Helpful to the environment', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Difficult to understand', false);

    -- Question 34
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 34, 'What is a problem with fast fashion, according to the text?', 'Giải thích: Đoạn 3 nói thời trang nhanh tạo ra một lượng lớn rác thải dệt may (massive amounts of textile waste) vì quần áo được mua và nhanh chóng bị vứt bỏ.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'It encourages creativity', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'It promotes recycling', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'It results in large amounts of waste', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'It uses high-quality materials', false);

    -- Question 35
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 35, 'The word "discarded" most likely means:', 'Giải thích: Cụm “clothing that is quickly discarded” có nghĩa là quần áo nhanh chóng bị vứt bỏ sau khi mua và sử dụng.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Sold in stores', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Recycled properly', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Worn again', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Thrown away', true);

    -- Question 36
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 36, 'What ethical concern is mentioned about the fashion industry?', 'Giải thích: Đoạn 3 cho biết nhiều quần áo được sản xuất tại các nhà máy có điều kiện làm việc kém và mức lương thấp (poor working conditions and low wages).')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Lack of advertisement', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Low costs for consumers', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Poor working conditions', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'High-quality production', false);

    -- Question 37
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 37, 'What does the word "these" in "Despite these challenges" refer to?', 'Giải thích: Cụm “Despite these challenges” xuất hiện sau hai đoạn nói về tác hại của rác thải nhựa và ngành thời trang nhanh. Vì vậy, these đề cập đến hai vấn đề này.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Clothes and chemicals', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Lifestyle changes', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Plastic waste and fast fashion', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Government policies', false);

    -- Question 38
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 38, 'What is the tone of the author toward environmental issues?', 'Giải thích: Tác giả vẫn lạc quan vì ngày càng nhiều người và doanh nghiệp quan tâm đến môi trường, nhưng cũng thực tế khi nhấn mạnh cần có những chính sách mạnh mẽ hơn.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Hopeless', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Optimistic yet realistic', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Indifferent', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Aggressive', false);

    -- Question 39
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 39, 'What is one example of a sustainable practice mentioned?', 'Giải thích: Đoạn 4 nêu rõ một số doanh nghiệp đang áp dụng phương pháp bền vững như sử dụng vật liệu tái chế và giảm bao bì đóng gói (reducing packaging).')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Shopping at large retail stores', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Using plastic bags', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Reducing packaging', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Buying trendy clothing', false);

    -- Question 40
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 40, 'What can be inferred from the final paragraph?', 'Giải thích: Đoạn cuối khẳng định thay đổi thực sự cần cả trách nhiệm cá nhân và cải cách hệ thống. Mỗi người cần thay đổi thói quen, đồng thời chính phủ và doanh nghiệp phải có chính sách xanh hơn.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Only individuals can make a difference', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Governments alone must solve the issue', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Both personal and institutional efforts are necessary', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'The environment will recover on its own', false);

    -- PRACTICE TEST 2
    INSERT INTO tests (title, description, time_limit_minutes, shuffle_questions, shuffle_options, is_published)
    VALUES ('Practice Test 2', 'Đề thi trắc nghiệm Kỹ năng Đọc Tiếng Anh 3 - Gồm 4 phần đọc và 40 câu hỏi.', 60, true, true, true)
    RETURNING id INTO v_test_id;

    -- Part 1: The Paris Underground
    INSERT INTO test_parts (test_id, part_number, title, passage_text)
    VALUES (v_test_id, 1, 'Part 1: The Paris Underground', 'The great avenues are quiet, the shops are closed. There''s the smell of fresh bread from a bakery somewhere. It would be hard to say which time of the day in Paris I prefer but this is probably it. Soon the streets will be full of people and traffic. As with most other cities, you see the real Paris when the city wakes up.

There is, however, another part of Paris which is silent and free from people 24 hours a day. Under the city are hundreds of kilometres of tunnels. There are sewers and old subways but there are also spaces of all kinds: canals and catacombs, wine cellars which have been made into nightclubs and galleries.

During the 19th century, the Parisians needed more stone for buildings above the ground so they dug tunnels beneath the city. After that, many farmers grew mushrooms in them. During World War II, the French Resistance fighters also used them. Since the 1970s, many groups of young people spend days and nights below the city in these tunnels. It''s a place for parties, theatre performances, art galleries - anything goes here!

Everywhere you go under Paris, there is history and legend. Historians and novelists often refer to them in their books. For example, Victor Hugo mentions the tunnels in his famous novel Les Miserables and in the story and musical The Phantom of the Opera there is a pond beneath the old opera house. Most people think this is myth but in fact there is an underground pond here with fish. A ''normal'' tourist can visit parts of Paris beneath the ground. For example, there are the Catacombs beneath the Montparnasse district. Here you can see the bones and skeletons of about six millions Parisians. The bodies came from cemeteries above the ground two centuries ago when the city needed more space.

However, it''s illegal to enter other parts of the tunnels and police often search the area. It''s also very dangerous because some of the tunnels might collapse. Nevertheless, there are people who will take you to visit them. I have found two ''unofficial'' tour guides - Dominique and Yopie (not their real names). They take me through many tunnels and after a couple of hours we arrive at a room which isn''t on any map. Yopie and some of his friends built it. The room is comfortable and clean with a table and chairs and a bed. Yopie tells me there are many other places like this. ''Many people come down here to party, some people to paint ... We do what we want here.''')
    RETURNING id INTO v_part_id;

    -- Question 1
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 1, 'In paragraph 1, what time of the day does the author describe?', 'Giải thích:
·  Từ khóa câu hỏi: what time of the day (thời điểm nào trong ngày).
·  ·  Từ khóa trong bài: “the city wakes up” (thành phố thức dậy), “the shops are closed” (các cửa hàng vẫn đóng cửa).
·  ·  Giải thích: Những chi tiết này cho thấy tác giả đang miêu tả Paris vào sáng sớm, khi đường phố còn yên tĩnh và chưa đông người.
·')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Early in the morning', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Midday', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Afternoon', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Late at night', false);

    -- Question 2
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 2, 'What does "catacomb" in paragraph 2 mean?', 'Giải thích:
·  Từ khóa câu hỏi: catacomb (hầm mộ).
·  ·  Từ khóa trong bài: “bones and skeletons” (xương và bộ hài cốt), “bodies came from cemeteries” (thi thể được chuyển từ các nghĩa trang).
·  ·  Giải thích: Catacomb là khu vực hầm mộ dưới lòng đất, nơi lưu giữ hài cốt người đã chết. Vì vậy, đáp án D đúng.
·')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Long underground passage', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Official area of a town', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Man-made river', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'An area of land where dead people are buried', true);

    -- Question 3
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 3, 'During the 19th century, why did the Parisians dig tunnels beneath the city?', 'Giải thích:
·  Từ khóa câu hỏi: why did the Parisians dig tunnels (tại sao người Paris đào đường hầm).
·  ·  Từ khóa trong bài: “needed more stone for buildings above the ground” (cần thêm đá để xây dựng các công trình trên mặt đất).
·  ·  Giải thích: Bài đọc nêu trực tiếp lý do người Paris đào đường hầm trong thế kỷ 19 là để lấy thêm đá xây nhà và công trình. Đáp án A khớp hoàn toàn.
·')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'They needed more stone for buildings above the ground.', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'They needed more space', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'They wanted to make the city to be more beautiful', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'They wanted to attract more visitors.', false);

    -- Question 4
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 4, 'What weren''t the tunnels used for?', 'Giải thích:
·  Từ khóa câu hỏi: weren''t used for (không được sử dụng để làm gì).
·  ·  Từ khóa trong bài: “grew mushrooms” (trồng nấm), “parties” (tiệc tùng), “art galleries” (phòng trưng bày nghệ thuật).
·  ·  Giải thích: Bài đọc đề cập đến việc trồng nấm, tổ chức tiệc và triển lãm nghệ thuật trong đường hầm, nhưng không đề cập đến việc học tập. Vì vậy, chọn C.
·')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Growing mushrooms', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Parties', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Studying', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Art galleries', false);

    -- Question 5
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 5, 'Why is it dangerous to enter parts of tunnels?', 'Giải thích:
·  Từ khóa câu hỏi: dangerous (nguy hiểm), why (tại sao).
·  ·  Từ khóa trong bài: “some of the tunnels might collapse” (một số đường hầm có thể sụp đổ).
·  ·  Giải thích: Tác giả giải thích trực tiếp rằng một số đường hầm có nguy cơ sụp đổ, gây nguy hiểm cho người đi vào. Đáp án B chính xác.
·')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'There are thieves in tunnels.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'The tunnels might collapse.', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'The tunnels are dark.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'The tunnels are crowded.', false);

    -- Question 6
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 6, 'What does "cellar" mean?', 'Giải thích:
·  Từ khóa câu hỏi: cellar (hầm chứa đồ).
·  ·  Từ khóa trong bài: “wine cellars” (hầm rượu vang).
·  ·  Giải thích: Cellar là căn phòng dưới lòng đất, thường dùng để lưu trữ rượu, thực phẩm hoặc đồ đạc. Vì vậy, đáp án A là nghĩa phù hợp nhất.
·')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Underground room for storing food and wine', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Long underground passage', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Man-made river', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Official area of a town', false);

    -- Question 7
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 7, 'Where does Victor Hugo mention the tunnels?', 'Giải thích:
·  Từ khóa câu hỏi: Where (ở đâu), Victor Hugo (tên nhà văn).
·  ·  Từ khóa trong bài: “Victor Hugo mentions the tunnels in his famous novel Les Miserables”.
·  ·  Giải thích: Câu trong bài nói rõ Victor Hugo nhắc đến những đường hầm trong cuốn tiểu thuyết nổi tiếng Les Misérables. Vì vậy, chọn C.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'In his drama', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'In his comic', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'In his famous novel', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'In his diary', false);

    -- Question 8
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 8, 'What can you see in the catacombs beneath the Montparnasse district?', 'Giải thích:
·  Từ khóa câu hỏi: what can you see (có thể nhìn thấy gì), catacombs, Montparnasse.
·  ·  Từ khóa trong bài: “the bones and skeletons of about six millions Parisians”.
·  ·  Giải thích: Bài đọc nêu trực tiếp du khách có thể nhìn thấy xương và bộ hài cốt của khoảng sáu triệu người Paris trong hầm mộ. Đáp án A trùng với thông tin trong bài.
·')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'the bones and skeletons of about six millions Parisians', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'The houses of about six millions Parisians', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'the living area of about six millions Parisians', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'The pond with fish', false);

    -- Question 9
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 9, 'Who will take you to visit the tunnels underground?', 'Giải thích:
·  Từ khóa câu hỏi: Who (ai), take you to visit (đưa bạn đi tham quan).
·  ·  Từ khóa trong bài: “I have found two ''unofficial'' tour guides – Dominique and Yopie”.
·  ·  Giải thích: Tác giả đã tìm được hai người hướng dẫn tham quan không chính thức là Dominique và Yopie. Họ đưa tác giả đi qua nhiều đường hầm dưới lòng đất. Vì vậy, chọn B.
·')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'The Parisians', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Zominique and Yopie', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'The official guides', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'The people around Paris', false);

    -- Question 10
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 10, 'What can we see in the tunnels that aren''t in the map?', 'Giải thích:
·  Từ khóa câu hỏi: aren''t in the map (không có trên bản đồ).
·  ·  Từ khóa trong bài: “we arrive at a room which isn''t on any map” (chúng tôi đến một căn phòng không xuất hiện trên bất kỳ bản đồ nào).
·  ·  Giải thích: Bài đọc nhắc đến một căn phòng do Yopie và bạn bè tự xây dựng, không được đánh dấu trên bản đồ. Vì vậy, đáp án A đúng.
·')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Rooms', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Hospital', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Fire station', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Houses', false);

    -- Part 2: Phillis Wheatley
    INSERT INTO test_parts (test_id, part_number, title, passage_text)
    VALUES (v_test_id, 2, 'Part 2: Phillis Wheatley', 'Phillis Wheatley was born in Gambia (in Africa) on May 8, 1753 and died in Boston on December 5, 1784. When she was 7 or 8, she was sold as a slave to John and Susanna Wheatley of Boston. She was named after the ship that brought her to America, The Phillis. The Poetry Foundation describes her sale: In August 1761, “in want of a domestic,” Susanna Wheatley, purchased “a slender, frail female child … for a trifle”. The captain of the slave ship believed that the waif was terminally ill, and he wanted to gain at least a small profit before she died. The family surmised the girl—who was “of slender frame and evidently suffering from a change of climate,” nearly naked, with “no other covering than a quantity of dirty carpet about her”—to be “about seven years old … from the circumstances of shedding her front teeth.”

Phillis was very intelligent. The Wheatley family taught her to read and write, and encouraged her to write poetry. Her first poem “On Messrs. Hussey and Coffin” was published when she was only twelve. In 1770, “An Elegiac Poem, on the Death of that Celebrated Divine, and Eminent Servant of Jesus Christ, the Reverend and Learned George Whitefield” made her famous. It was published in Boston, Newport, and Philadelphia.

When she was eighteen, Phillis and Mrs. Wheatley tried to sell a collection containing twenty-eight of her poems. Colonists did not want to buy poetry written by an African. Mrs. Wheatley wrote to England to ask Selina Hastings, Countess of Huntingdon, for help. The countess was a wealthy supporter of evangelical and abolitionist (anti-slavery) causes. She had Poems on Various Subjects, Religious and Moral published in England in 1773. This book made Phillis famous in England and the thirteen colonies. She wrote a poem for George Washington in 1775, and he praised her work. They met in 1776. Phillis supported independence for the colonies during the Revolutionary War.

After her master died, Phillis was emancipated. She married John Peters, a free black man, in 1778. She and her husband lost two children as infants. John would be imprisoned for debt in 1784. Phillis and her remaining child died in December of 1784 and were buried in an unmarked grave. Nevertheless, the legacy of Phillis Wheatley lives on. She became the first African American and the first slave in the United States to publish a book. She proved that slaves or former slaves had a valuable voice in the Revolutionary era.')
    RETURNING id INTO v_part_id;

    -- Question 11
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 11, 'It can be inferred from the passage that the Countess of Huntingdon …', 'Giải thích:
Từ khóa: Countess of Huntingdon (Nữ bá tước Huntingdon), get her writings published (giúp tác phẩm được xuất bản).
Bằng chứng: “She had Poems on Various Subjects, Religious and Moral published in England in 1773.”
Giải thích: Nữ bá tước đã giúp xuất bản tập thơ của Phillis tại Anh vào năm 1773, giúp bà nổi tiếng hơn.
Các đáp án sai:
A. Didn''t care about Phillis'' poetry: Sai, vì bà đã giúp Phillis xuất bản tập thơ.
C. Believed in slavery: Sai, vì bài đọc nói bà ủng hộ phong trào chống chế độ nô lệ (abolitionist).
D. Was surprised that Phillis could read and write: Sai, bài không đề cập bà ngạc nhiên về khả năng đọc viết của Phillis.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'didn''t care about Phillis'' poetry', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'helped Phillis get her writings published', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'believed in slavery', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'was surprised that Phillis could read and write', false);

    -- Question 12
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 12, 'What question is answered in last paragraph?', 'Giải thích:
Từ khóa: last paragraph (đoạn cuối), who did Phillis marry (Phillis kết hôn với ai).
Bằng chứng: “She married John Peters, a free black man, in 1778.”
Giải thích: Đoạn cuối trực tiếp trả lời Phillis kết hôn với John Peters vào năm 1778.
Các đáp án sai:
B. Where were Phillis'' works published?: Sai, thông tin xuất bản ở Boston, Newport, Philadelphia và Anh nằm ở đoạn trước.
C. What did Phillis prove?: Sai, đoạn cuối có nhắc bà chứng minh người nô lệ cũng có tiếng nói giá trị, nhưng câu hỏi A cũng được trả lời trực tiếp. Tuy nhiên, cần lưu ý: đáp án C cũng có thông tin trong đoạn cuối.
D. Why was Phillis a slave?: Sai, đoạn cuối không giải thích lý do bà bị bán làm nô lệ.
Lưu ý: Câu 12 có thể gây nhầm lẫn vì cả A và C đều được đề cập trong đoạn cuối. Nếu đề yêu cầu chọn một đáp án, A là câu hỏi được trả lời trực tiếp bằng thông tin cụ thể về người chồng.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Who did Phillis marry?', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Where were Phillis'' works published?', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'What did Phillis prove?', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Why was Phillis a slave?', false);

    -- Question 13
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 13, 'Phillis finally became free …', 'Giải thích:
Từ khóa: became free (được tự do), master died (chủ nhân qua đời).
Bằng chứng: “After her master died, Phillis was emancipated.”
Giải thích: Sau khi chủ nhân qua đời, Phillis được giải phóng khỏi thân phận nô lệ. Từ emancipated có nghĩa là được giải phóng hoặc được trả tự do.
Các đáp án sai:
A. When she published her poems in England: Sai, việc xuất bản thơ không phải nguyên nhân giúp bà được tự do.
B. After meeting the Countess of Huntingdon: Sai, bà được nữ bá tước hỗ trợ xuất bản thơ, không phải được giải phóng.
C. When she became wealthy: Sai, bài không nói Phillis trở nên giàu có rồi mới được tự do.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'when she published her poems in England', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'after meeting the Countess of Huntingdon', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'when she became wealthy', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'after her master died', true);

    -- Question 14
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 14, 'Phillis'' first attempt at selling her poetry in America (the colonies) was …', 'Giải thích:
Từ khóa: first attempt (lần thử đầu tiên), selling her poetry (bán thơ), unsuccessful (không thành công).
Bằng chứng: “Colonists did not want to buy poetry written by an African.”
Giải thích: Người dân thuộc địa không muốn mua thơ do một người châu Phi sáng tác, vì vậy lần đầu Phillis cố gắng bán tập thơ đã thất bại.
Các đáp án sai:
A. Illegal: Sai, bài không nói việc bán thơ là bất hợp pháp.
B. Imaginary: Sai, imaginary nghĩa là tưởng tượng, không có thật; sự kiện này thực sự xảy ra.
D. Successful: Sai, trái ngược với thông tin người dân không muốn mua thơ của bà.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'illegal', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'imaginary', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'unsuccessful', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Successful', false);

    -- Question 15
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 15, 'Which of the following is TRUE about Phillis Wheatley?', 'Giải thích:
Từ khóa: TRUE (đúng), first African-American, publish a book (xuất bản một cuốn sách).
Bằng chứng: “She became the first African American and the first slave in the United States to publish a book.”
Giải thích: Đây là thông tin được nêu trực tiếp trong câu cuối của bài đọc, khẳng định Phillis là người Mỹ gốc Phi đầu tiên và người nô lệ đầu tiên tại Mỹ xuất bản sách.
Các đáp án sai:
A. The first African-American slave to visit England: Sai, bài không nói bà là người đầu tiên đến thăm nước Anh.
C. The first African-American and slave to be able to read and write: Sai, bài chỉ nói bà được gia đình Wheatley dạy đọc và viết, không nói bà là người đầu tiên biết đọc viết.
D. The first African-American and slave to meet George Washington: Sai, bài chỉ nói bà gặp George Washington vào năm 1776, không khẳng định bà là người đầu tiên.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'She was the first African-American slave to visit England.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'She was the first African-American and slave to publish a book in the United States.', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'She was the first African-American and slave to be able to read and write', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'She was the first African-American and slave to meet George Washington.', false);

    -- Question 16
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 16, 'The Wheatley family estimated the age of the slave girl they named "Phillis" by …', 'Giải thích:
Từ khóa: estimated the age (ước tính tuổi), condition of her teeth (tình trạng răng).
Bằng chứng: “about seven years old … from the circumstances of shedding her front teeth.”
Giải thích: Gia đình Wheatley ước tính cô bé khoảng bảy tuổi dựa trên việc cô đang thay những chiếc răng cửa.
Các đáp án sai:
A. Her size: Sai, bài có mô tả vóc dáng nhỏ bé (slender frame) nhưng không nói họ dựa vào kích thước cơ thể để xác định tuổi.
C. Her color: Sai, không có thông tin về màu da được dùng để ước tính tuổi.
D. Her weight: Sai, bài không đề cập cân nặng của Phillis.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'her size', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'the condition of her teeth', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'her color', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'her weight', false);

    -- Question 17
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 17, 'By the age of twelve, Phillis was …', 'Giải thích:
Từ khóa: By the age of twelve (khi được 12 tuổi), published poet (nhà thơ đã có tác phẩm được xuất bản).
Bằng chứng: “Her first poem ... was published when she was only twelve.”
Giải thích: Bài thơ đầu tiên của Phillis được xuất bản khi bà mới 12 tuổi. Vì vậy, ở tuổi này bà đã là một nhà thơ có tác phẩm được công bố.
Các đáp án sai:
A. No longer a slave: Sai, bà chỉ được tự do sau khi chủ nhân qua đời.
B. Married: Sai, bà kết hôn vào năm 1778, khi đã trưởng thành.
D. Still not able to read or write: Sai, gia đình Wheatley đã dạy bà đọc và viết từ trước đó.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'no longer a slave', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'married', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'a published poet', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'still not able to read or write', false);

    -- Question 18
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 18, 'The slave owner who sold Phillis to the Wheatley family believed …', 'Giải thích:
Từ khóa: slave owner, believed (tin rằng), soon die (sắp chết).
Bằng chứng: “The captain of the slave ship believed that the waif was terminally ill.”
Giải thích: Thuyền trưởng tàu buôn nô lệ tin rằng Phillis mắc bệnh giai đoạn cuối (terminally ill) và có thể sắp chết. Vì vậy, ông muốn bán cô bé để kiếm một khoản tiền nhỏ trước khi cô qua đời.
Các đáp án sai:
A. She would soon recover from her illness: Sai, trái ngược với terminally ill (bệnh rất nặng, khó có khả năng hồi phục).
B. She was very intelligent: Sai, bài nói Phillis thông minh nhưng không nói thuyền trưởng biết điều đó.
C. She was worth a lot of money: Sai, cụm at least a small profit cho thấy thuyền trưởng chỉ muốn kiếm một khoản lợi nhỏ, không phải số tiền lớn.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'she would soon recover from her illness', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'she was very intelligent', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'she was worth a lot of money', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'she would soon die', true);

    -- Question 19
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 19, 'Who was George Whitefield?', 'Giải thích:
Từ khóa: Who was George Whitefield? (George Whitefield là ai?).
Bằng chứng: Bài đọc nói Phillis viết một bài thơ tưởng niệm ông: “An Elegiac Poem, on the Death of that Celebrated Divine ... George Whitefield.”
Giải thích: Elegiac poem là thơ ai điếu, tức thơ viết để tưởng nhớ người đã mất. Việc Phillis sáng tác bài thơ tưởng niệm George Whitefield cho thấy bà dành sự kính trọng và ngưỡng mộ đối với ông.
Các đáp án sai:
A. A military general: Sai, bài không nói ông là một vị tướng quân đội.
C. Phillis'' husband: Sai, chồng Phillis là John Peters.
D. A slave owner: Sai, bài không đề cập George Whitefield là chủ nô lệ.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'A military general', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Somebody who Phillis admired greatly', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Phillis'' husband', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'A slave owner', false);

    -- Question 20
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 20, 'Where is Phillis Wheatley buried?', 'Giải thích:
Từ khóa: Where (ở đâu), buried (được chôn cất).
Bằng chứng: “Phillis and her remaining child died in December of 1784 and were buried in an unmarked grave.”
Giải thích: Unmarked grave nghĩa là ngôi mộ không có bia hoặc dấu hiệu nhận diện. Vì vậy, bài đọc không cung cấp địa điểm chính xác để xác định ngôi mộ của bà.
Các đáp án sai:
B. Africa: Sai, bà sinh ra ở Gambia, châu Phi, nhưng bài không nói bà được chôn cất tại đó.
C. Boston: Sai, bà qua đời tại Boston nhưng bài không xác nhận địa điểm chôn cất cụ thể.
D. Virginia: Sai, bài không nhắc đến Virginia là nơi bà được chôn cất.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'No one knows', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Africa', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Boston', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Virginia', false);

    -- Part 3: The Rise of Digital Media
    INSERT INTO test_parts (test_id, part_number, title, passage_text)
    VALUES (v_test_id, 3, 'Part 3: The Rise of Digital Media', 'In the past, people relied on newspapers, radio, and television for information. Today, digital media has taken the lead. News websites, podcasts, blogs, and social media platforms allow people to access content instantly and from almost anywhere. This shift has not only changed how news is delivered but also how it is created and consumed.

One of the biggest advantages of digital media is its speed. Breaking news can be shared within seconds. Readers are no longer passive; they can comment, share, and even contribute their own content. However, this speed has also led to the rise of misinformation. False or misleading information can spread just as quickly—sometimes even faster—than verified facts.

Another major change is how traditional media outlets now compete with independent content creators. Influencers, YouTubers, and bloggers often have loyal audiences that rival major news organizations. While this opens up space for diverse perspectives, it also raises questions about credibility and ethics. Not all content is fact-checked, and some creators prioritize attention over accuracy.

Digital media has also affected how people engage with current events. Many young people, for example, learn about the world through short videos or memes. While this makes information more accessible, it may also reduce the depth of understanding. Complex issues are often simplified or distorted to fit fast-paced online formats.

Despite the challenges, digital media presents new opportunities for communication, creativity, and education. When used responsibly, it can strengthen democratic participation, raise awareness of global issues, and give a voice to those who were previously unheard.')
    RETURNING id INTO v_part_id;

    -- Question 21
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 21, 'What is the passage mainly about?', 'Giải thích:
·  Từ khóa: mainly about = chủ yếu nói về; impact = tác động, ảnh hưởng.
·  ·  Bằng chứng: Bài đọc đề cập đến sự thay đổi trong cách tiếp nhận tin tức, tốc độ truyền tải, thông tin sai lệch và ảnh hưởng đến người dùng.
·  ·  Giải thích: Toàn bộ bài tập trung phân tích những tác động tích cực và tiêu cực của truyền thông kỹ thuật số, nên B là đáp án bao quát nhất.
Các đáp án sai:
A. Problems in journalism: Chỉ nói về vấn đề báo chí, không bao quát toàn bài.
C. The return of traditional news: Bài nói truyền thông kỹ thuật số đang phát triển, không phải sự trở lại của truyền thông truyền thống.
D. Advertising in social media: Bài không tập trung nói về quảng cáo trên mạng xã hội.
·')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Problems in journalism', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'The impact of digital media', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'The return of traditional news', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Advertising in social media', false);

    -- Question 22
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 22, 'How is digital media different from traditional media?', 'Giải thích:
Từ khóa: different from = khác với; faster = nhanh hơn; interactive = có tính tương tác.
Bằng chứng: “Breaking news can be shared within seconds” và “They can comment, share, and even contribute their own content.”
Giải thích: Truyền thông kỹ thuật số cho phép cập nhật tin tức trong vài giây và người đọc có thể bình luận, chia sẻ, đóng góp nội dung. Vì vậy, C đúng.
Các đáp án sai:
A. It is more expensive: Bài không đề cập truyền thông kỹ thuật số đắt đỏ hơn.
B. It reaches fewer people: Sai, bài nói người dùng có thể tiếp cận nội dung từ hầu hết mọi nơi.
D. It avoids politics: Bài không nói truyền thông kỹ thuật số tránh các vấn đề chính trị.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'It is more expensive', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'It reaches fewer people', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'It is faster and more interactive', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'It avoids politics', false);

    -- Question 23
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 23, 'The phrase "breaking news can be shared within seconds" suggests:', 'Giải thích:
Từ khóa: breaking news = tin nóng, tin mới xảy ra; within seconds = chỉ trong vài giây; go viral = lan truyền nhanh chóng.
Bằng chứng: “False or misleading information can spread just as quickly.”
Giải thích: Tin nóng có thể được chia sẻ rất nhanh trên các nền tảng kỹ thuật số, thậm chí lan truyền rộng rãi chỉ trong thời gian ngắn. Vì vậy, B đúng.
Các đáp án sai:
A. News is delayed: Sai, within seconds thể hiện tốc độ nhanh, không phải trì hoãn.
C. News is hard to understand: Bài không nói tin tức khó hiểu.
D. News comes from newspapers: Sai, bài nói về tốc độ chia sẻ tin tức trên môi trường kỹ thuật số.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'News is delayed', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'News can go viral quickly', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'News is hard to understand', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'News comes from newspapers', false);

    -- Question 24
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 24, 'What is a potential danger of digital media?', 'Giải thích:
Từ khóa: potential danger = mối nguy hiểm tiềm ẩn; false information = thông tin sai lệch.
Bằng chứng: “This speed has also led to the rise of misinformation.”
Giải thích: Tốc độ truyền tải nhanh khiến thông tin giả hoặc gây hiểu lầm (misinformation) có thể lan truyền rất nhanh. Đây là một nguy cơ của truyền thông kỹ thuật số.
Các đáp án sai:
A. Better education: Bài xem giáo dục là một cơ hội tích cực, không phải mối nguy hiểm.
B. The decline of television: Bài không đề cập sự suy giảm của truyền hình như một nguy cơ.
D. The rise of radio: Bài không nói sự phát triển của radio là nguy hiểm.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Better education', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'The decline of television', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'The spread of false information', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'The rise of radio', false);

    -- Question 25
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 25, 'The word "diverse" in paragraph 3 most likely means:', 'Giải thích:
Từ khóa: diverse = đa dạng; varied = phong phú, nhiều loại khác nhau.
Bằng chứng: “This opens up space for diverse perspectives.”
Giải thích: Cụm diverse perspectives có nghĩa là những quan điểm đa dạng, đến từ nhiều người hoặc nhiều góc nhìn khác nhau. Vì vậy, varied là từ đồng nghĩa phù hợp nhất.
Các đáp án sai:
A. Popular: Nghĩa là phổ biến, được yêu thích, không đồng nghĩa với đa dạng.
B. Complicated: Nghĩa là phức tạp, không thể hiện nhiều góc nhìn.
D. Boring: Nghĩa là nhàm chán, không liên quan đến nghĩa của diverse.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Popular', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Complicated', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Varied', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Boring', false);

    -- Question 26
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 26, 'What concern is raised about content creators?', 'Giải thích:
Từ khóa: concern = mối lo ngại; verify information = xác minh thông tin.
Bằng chứng: “Not all content is fact-checked, and some creators prioritize attention over accuracy.”
Giải thích: Một số người sáng tạo nội dung không kiểm chứng thông tin trước khi đăng tải và ưu tiên thu hút sự chú ý hơn độ chính xác. Vì vậy, C đúng.
Các đáp án sai:
A. They are too creative: Bài không nói sự sáng tạo quá mức là vấn đề.
B. They often use traditional sources: Bài không đề cập đây là mối lo ngại.
D. They avoid serious topics: Bài không nói người sáng tạo nội dung né tránh các chủ đề nghiêm túc.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'They are too creative', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'They often use traditional sources', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'They may not verify their information', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'They avoid serious topics', false);

    -- Question 27
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 27, 'What does the word "it" refer to in "When used responsibly, it can strengthen democratic participation"?', 'Giải thích:
Từ khóa: it = nó; câu hỏi yêu cầu xác định danh từ được đại từ thay thế.
Bằng chứng: Câu trước nói “digital media presents new opportunities...”, sau đó là “When used responsibly, it...”.
Giải thích: Đại từ it thay thế cho danh từ số ít digital media xuất hiện ở câu trước. Vì vậy, đáp án C đúng.
Các đáp án sai:
A. Traditional media: Không phải đối tượng đang được nói đến trong đoạn này.
B. Television: Không xuất hiện trong câu trước với vai trò chủ thể của ý này.
D. The internet: Có liên quan đến truyền thông kỹ thuật số nhưng không phải danh từ được nhắc đến trực tiếp để thay thế bằng it.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Traditional media', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Television', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Digital media', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'The internet', false);

    -- Question 28
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 28, 'According to the passage, memes and short videos may:', 'Giải thích:
Từ khóa: memes and short videos = ảnh chế và video ngắn; simplify = đơn giản hóa; complex topics = chủ đề phức tạp.
Bằng chứng: “Complex issues are often simplified or distorted to fit fast-paced online formats.”
Giải thích: Các vấn đề phức tạp có thể bị đơn giản hóa hoặc bóp méo để phù hợp với định dạng nội dung trực tuyến ngắn và nhanh. Vì vậy, D đúng.
Các đáp án sai:
A. Improve understanding: Bài cảnh báo nội dung ngắn có thể làm giảm chiều sâu hiểu biết, không khẳng định cải thiện sự hiểu biết.
B. Replace all media: Bài không nói video ngắn và meme thay thế tất cả các phương tiện truyền thông.
C. Be banned in schools: Không có thông tin nào nói chúng sẽ bị cấm trong trường học.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Improve understanding', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Replace all media', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Be banned in schools', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Simplify complex topics', true);

    -- Question 29
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 29, 'What opportunity does digital media offer?', 'Giải thích:
Từ khóa: opportunity = cơ hội; unheard voices = những tiếng nói trước đây chưa được lắng nghe.
Bằng chứng: “Give a voice to those who were previously unheard.”
Giải thích: Truyền thông kỹ thuật số tạo cơ hội cho những cá nhân hoặc nhóm người trước đây ít có cơ hội thể hiện quan điểm được lên tiếng. Vì vậy, C đúng.
Các đáp án sai:
A. Less global awareness: Sai, bài nói truyền thông kỹ thuật số giúp nâng cao nhận thức về các vấn đề toàn cầu.
B. Free access to traditional newspapers: Bài không đề cập đây là cơ hội mà truyền thông kỹ thuật số mang lại.
D. Avoiding educational content: Sai, bài nhắc đến giáo dục là một trong những cơ hội của truyền thông kỹ thuật số.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Less global awareness', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Free access to traditional newspapers', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'A platform for unheard voices', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Avoiding educational content', false);

    -- Question 30
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 30, 'What can be inferred from the passage?', 'Giải thích:
Từ khóa: inferred = suy luận; used with care = sử dụng cẩn thận, có trách nhiệm.
Bằng chứng: “When used responsibly...” và bài đọc cảnh báo về thông tin sai lệch, độ tin cậy và sự đơn giản hóa các vấn đề phức tạp.
Giải thích: Truyền thông kỹ thuật số có nhiều lợi ích nhưng cũng tiềm ẩn rủi ro. Vì vậy, người dùng cần sử dụng có trách nhiệm và kiểm tra độ chính xác của thông tin.
Các đáp án sai:
A. Digital media should be avoided: Sai, tác giả vẫn đánh giá cao những cơ hội mà truyền thông kỹ thuật số mang lại.
C. Young people ignore news: Sai, bài nói người trẻ tiếp nhận tin tức qua video ngắn và meme, không phải họ bỏ qua tin tức.
D. Social media is better than books: Bài không so sánh mạng xã hội với sách.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Digital media should be avoided', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'It must be used with care', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Young people ignore news', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Social media is better than books', false);

    -- Part 4: Economics and Everyday Life
    INSERT INTO test_parts (test_id, part_number, title, passage_text)
    VALUES (v_test_id, 4, 'Part 4: Economics and Everyday Life', 'Many people think of economics as something abstract—full of numbers, charts, and theories. However, economics is closely connected to everyday decisions. Whether you''re buying groceries, choosing a career, or saving for the future, economic principles are at play.

At its core, economics studies how people use limited resources to meet unlimited needs and wants. One basic concept is opportunity cost—the idea that choosing one option means giving up another. For example, if you spend money on a concert ticket, you might have to skip dinner at a restaurant. Understanding opportunity cost can help people make better financial choices.

Inflation is another economic factor that affects daily life. When inflation rises, the cost of goods and services increases, reducing purchasing power. This means that the same amount of money buys less than it did before. People may not notice small changes at first, but over time, inflation can significantly impact savings and spending.

Wages, employment, and interest rates are also influenced by broader economic policies. Governments and central banks use tools such as taxes and interest rate adjustments to manage the economy. For example, lowering interest rates might encourage people to borrow and spend more, stimulating economic growth.

Economics is not only about money—it also involves human behavior. Behavioral economics, a growing field, explores how people make decisions, often based on emotions, habits, or social influences rather than pure logic. This helps explain why people sometimes overspend or delay saving for retirement, even when they know better.

In conclusion, understanding economics can help individuals navigate everyday challenges. It allows people to make informed choices about their finances, careers, and lifestyles, making it a practical and essential part of life.')
    RETURNING id INTO v_part_id;

    -- Question 31
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 31, 'What is the main idea of the passage?', 'Giải thích:
- A. Economics is too complicated for daily use – Kinh tế học quá phức tạp để áp dụng hằng ngày.→ Sai vì bài đọc khẳng định kinh tế học gắn liền với những quyết định thường ngày, không phải quá phức tạp để sử dụng.
- B. Economics has little effect on real life – Kinh tế học ít ảnh hưởng đến cuộc sống thực tế.→ Sai vì kinh tế học ảnh hưởng trực tiếp đến mua sắm, lựa chọn nghề nghiệp, tiết kiệm và chi tiêu.
- C. Economic knowledge helps with everyday decisions – Kiến thức kinh tế giúp ích cho các quyết định hằng ngày.→ Đúng vì đây là nội dung xuyên suốt bài đọc, được nhấn mạnh cả ở phần mở đầu và kết luận.
- D. Only experts understand economics – Chỉ chuyên gia mới hiểu kinh tế học.→ Sai vì bài đọc hướng đến tất cả mọi người và cho thấy ai cũng có thể áp dụng kiến thức kinh tế vào cuộc sống.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Economics is too complicated for daily use', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Economics has little effect on real life', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Economic knowledge helps with everyday decisions', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Only experts understand economics', false);

    -- Question 32
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 32, 'What does opportunity cost mean?', 'Giải thích:
- A. Saving money for retirement – Tiết kiệm tiền cho lúc nghỉ hưu.→ Sai vì đây là hành động tiết kiệm tài chính cho tương lai, không phải khái niệm chi phí cơ hội.
- B. Making decisions based on feelings – Đưa ra quyết định dựa trên cảm xúc.→ Sai vì đây là đặc điểm liên quan đến kinh tế học hành vi (Behavioral economics), không phải opportunity cost.
- C. Choosing one thing means giving up another – Chọn một thứ đồng nghĩa với việc từ bỏ thứ khác.→ Đúng vì khi lựa chọn một phương án, chúng ta phải đánh đổi và từ bỏ lợi ích của phương án còn lại.
- D. Paying for something in cash – Thanh toán thứ gì đó bằng tiền mặt.→ Sai vì đây chỉ là một hình thức thanh toán, không liên quan đến khái niệm chi phí cơ hội.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Saving money for retirement', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Making decisions based on feelings', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Choosing one thing means giving up another', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Paying for something in cash', false);

    -- Question 33
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 33, 'The phrase "reducing purchasing power" means:', 'Giải thích:
- A. Lowering your ability to buy things – Làm giảm khả năng mua sắm.→ Đúng vì purchasing power là sức mua. Khi giá cả tăng, cùng một số tiền sẽ mua được ít hàng hóa và dịch vụ hơn.
- B. Increasing your salary – Tăng tiền lương của bạn.→ Sai vì tăng lương thường giúp cải thiện khả năng mua sắm, trái ngược với ý nghĩa sức mua giảm.
- C. Making products cheaper – Làm cho sản phẩm rẻ hơn.→ Sai vì khi sản phẩm rẻ hơn, người tiêu dùng có thể mua được nhiều hàng hóa hơn, tức sức mua tăng.
- D. Saving more money – Tiết kiệm được nhiều tiền hơn.→ Sai vì tiết kiệm tiền là hành động quản lý tài chính, không đồng nghĩa với việc sức mua giảm.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Lowering your ability to buy things', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Increasing your salary', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Making products cheaper', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Saving more money', false);

    -- Question 34
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 34, 'What is the effect of rising inflation?', 'Giải thích:
- A. Prices go down – Giá cả giảm xuống.→ Sai vì khi lạm phát tăng, mức giá chung của hàng hóa và dịch vụ có xu hướng tăng chứ không giảm.
- B. Money buys less – Tiền mua được ít hàng hóa hơn.→ Đúng vì lạm phát làm giảm sức mua của đồng tiền. Một số tiền trước đây mua được nhiều sản phẩm thì nay chỉ mua được ít hơn.
- C. People earn more – Mọi người kiếm được nhiều tiền hơn.→ Sai vì lạm phát không đồng nghĩa với việc tiền lương của tất cả mọi người đều tăng. Giá cả có thể tăng nhanh hơn thu nhập.
- D. The economy improves quickly – Nền kinh tế nhanh chóng được cải thiện.→ Sai vì lạm phát tăng không đảm bảo nền kinh tế phát triển tốt. Lạm phát cao có thể gây khó khăn cho người tiêu dùng và doanh nghiệp.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Prices go down', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Money buys less', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'People earn more', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'The economy improves quickly', false);

    -- Question 35
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 35, 'Which of the following is used to manage the economy?', 'Gỉải thích:
- A. Concert tickets – Vé xem hòa nhạc.→ Sai vì vé xem hòa nhạc chỉ là một loại hàng hóa, dịch vụ giải trí, không phải công cụ quản lý nền kinh tế.
- B. Media reports – Các bản tin truyền thông.→ Sai vì tin tức truyền thông cung cấp thông tin về kinh tế nhưng không phải công cụ chính sách được đề cập trong bài.
- C. Tax policies and interest rates – Chính sách thuế và lãi suất.→ Đúng vì chính phủ và ngân hàng trung ương sử dụng thuế và điều chỉnh lãi suất để tác động đến hoạt động kinh tế.
- D. Grocery shopping – Việc mua sắm thực phẩm.→ Sai vì đây là hoạt động tiêu dùng cá nhân, không phải công cụ quản lý nền kinh tế của chính phủ.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Concert tickets', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Media reports', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Tax policies and interest rates', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Grocery shopping', false);

    -- Question 36
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 36, 'What does the word "this" refer to in "This helps explain why people sometimes overspend"?', 'Giải thích:
- A. Central banking – Hoạt động ngân hàng trung ương.→ Sai vì ngân hàng trung ương được đề cập ở đoạn trước, liên quan đến việc điều hành chính sách tiền tệ, không phải hành vi chi tiêu theo cảm xúc.
- B. Behavioral economics – Kinh tế học hành vi.→ Đúng vì câu trước nói về lĩnh vực nghiên cứu cách con người đưa ra quyết định dựa trên cảm xúc, thói quen và ảnh hưởng xã hội. Từ "this" nhắc lại nội dung đó.
- C. Employment trends – Xu hướng việc làm.→ Sai vì bài đọc không đề cập xu hướng việc làm trong phần giải thích lý do con người chi tiêu quá mức.
- D. Opportunity cost – Chi phí cơ hội.→ Sai vì chi phí cơ hội liên quan đến việc lựa chọn một phương án và từ bỏ phương án khác, không trực tiếp giải thích hành vi chi tiêu theo cảm xúc.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Central banking', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Behavioral economics', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Employment trends', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Opportunity cost', false);

    -- Question 37
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 37, 'According to the passage, people don''t always make logical decisions because:', 'Giải thích:
- A. They don''t earn enough – Họ không kiếm đủ tiền.→ Sai vì bài đọc không nói thiếu thu nhập là nguyên nhân khiến con người đưa ra quyết định thiếu lý trí.
- B. Prices are too high – Giá cả quá cao.→ Sai vì giá cả cao được đề cập trong phần lạm phát, không phải nguyên nhân chính của những quyết định thiếu logic.
- C. Emotions and habits influence them – Cảm xúc và thói quen ảnh hưởng đến họ.→ Đúng vì bài đọc nói rõ con người thường quyết định dựa trên cảm xúc, thói quen và ảnh hưởng xã hội thay vì chỉ dựa vào lý trí.
- D. They don''t like saving – Họ không thích tiết kiệm.→ Sai vì đây không phải nguyên nhân được bài đọc đề cập. Bài chỉ lấy việc trì hoãn tiết kiệm nghỉ hưu làm ví dụ.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'They don''t earn enough', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Prices are too high', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Emotions and habits influence them', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'They don''t like saving', false);

    -- Question 38
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 38, 'What is a practical benefit of understanding economics?', 'Giải thích:
- A. It makes shopping harder – Nó khiến việc mua sắm trở nên khó khăn hơn.→ Sai vì kiến thức kinh tế giúp con người đưa ra quyết định mua sắm hợp lý hơn, chứ không làm mọi việc khó khăn hơn.
- B. It causes more inflation – Nó gây ra lạm phát nhiều hơn.→ Sai vì hiểu biết kinh tế không phải nguyên nhân gây lạm phát. Lạm phát là một hiện tượng kinh tế liên quan đến sự gia tăng mức giá chung.
- C. It helps people make smart choices – Nó giúp mọi người đưa ra những lựa chọn thông minh.→ Đúng vì hiểu biết kinh tế giúp mỗi người quản lý tài chính, lựa chọn nghề nghiệp và xây dựng lối sống hợp lý.
- D. It avoids government control – Nó tránh được sự kiểm soát của chính phủ.→ Sai vì bài đọc không đề cập việc hiểu kinh tế sẽ giúp con người tránh sự quản lý của chính phủ.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'It makes shopping harder', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'It causes more inflation', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'It helps people make smart choices', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'It avoids government control', false);

    -- Question 39
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 39, 'Which of the following best describes behavioral economics?', 'Giải thích:
- A. A branch of psychology – Một nhánh của tâm lý học.→ Sai vì kinh tế học hành vi có liên quan đến tâm lý học nhưng thuộc lĩnh vực kinh tế học, không đơn thuần là một nhánh tâm lý học.
- B. A study of inflation – Nghiên cứu về lạm phát.→ Sai vì lạm phát là sự gia tăng mức giá chung, không phải nội dung nghiên cứu chính của kinh tế học hành vi.
- C. A part of finance law – Một phần của luật tài chính.→ Sai vì kinh tế học hành vi không phải lĩnh vực luật pháp mà nghiên cứu hành vi và cách con người đưa ra quyết định kinh tế.
- D. A look at why people don''t always act logically – Nghiên cứu lý do tại sao con người không phải lúc nào cũng hành động hợp lý.→ Đúng vì lĩnh vực này giải thích cách cảm xúc, thói quen và tác động xã hội ảnh hưởng đến quyết định kinh tế của con người.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'A branch of psychology', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'A study of inflation', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'A part of finance law', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'A look at why people don''t always act logically', true);

    -- Question 40
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 40, 'What can be inferred about the author''s view on economics?', '- A. It should be avoided by non-experts – Những người không chuyên nên tránh tìm hiểu kinh tế học.→ Sai vì tác giả khuyến khích mọi người tìm hiểu kinh tế học để áp dụng vào cuộc sống, không chỉ dành cho chuyên gia.
- B. It has no value in personal life – Nó không có giá trị trong cuộc sống cá nhân.→ Sai vì toàn bộ bài đọc đưa ra nhiều ví dụ về vai trò của kinh tế học trong mua sắm, tiết kiệm và lựa chọn nghề nghiệp.
- C. It is essential for making wise decisions – Nó rất cần thiết để đưa ra những quyết định sáng suốt.→ Đúng vì tác giả nhấn mạnh kinh tế học giúp con người đưa ra những lựa chọn có hiểu biết về tài chính, nghề nghiệp và lối sống.
- D. It only applies to businesses – Nó chỉ áp dụng cho các doanh nghiệp.→ Sai vì bài đọc khẳng định kinh tế học liên quan trực tiếp đến các quyết định cá nhân và đời sống hằng ngày.
KỸ NĂNG ĐỌC (TIẾNG ANH 3)')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'It should be avoided by non-experts', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'It has no value in personal life', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'It is essential for making wise decisions', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'It only applies to businesses.', false);

    -- PRACTICE TEST 3
    INSERT INTO tests (title, description, time_limit_minutes, shuffle_questions, shuffle_options, is_published)
    VALUES ('Practice Test 3', 'Đề thi trắc nghiệm Kỹ năng Đọc Tiếng Anh 3 - Gồm 4 phần đọc và 40 câu hỏi.', 60, true, true, true)
    RETURNING id INTO v_test_id;

    -- Part 1: The Space Age and Exploration
    INSERT INTO test_parts (test_id, part_number, title, passage_text)
    VALUES (v_test_id, 1, 'Part 1: The Space Age and Exploration', 'On October 4, 1957, the Soviet Union sent Sputnik 1 into space and a new age in history began — The Space Age. The Soviets launched more Sputnik satellites in the fifties and by 1961 they had put the first man into space.

Eight years later, an American finally walked on the moon and during the early seventies the US led the Soviet Union in the space race. However, space travel was expensive and they needed to co-operate more. As a result, in 1975 astronauts from both countries flew two spacecraft and met in space. Afterwards, one astronaut said that the mission showed that the Soviet Union and America could work together.

Nearly two decades later, leaders from both countries said they had agreed on plans for a new international space station (ISS) and by the turn of the century the ISS had started orbiting the Earth. Nowadays, the ISS is used by scientists from all over the world.

At the beginning of the twenty-first century, businessman Dennis Tito paid twenty million dollars and told the world he loved space as he spent eight days on the ISS. Since then, space tourism has developed with plans for regular tours and floating hotels.

And what about the next half a century? In 2009, a Russian Space Chief said Russia was planning a nuclear spaceship for Mars. In 2010, the US president Barack Obama told an audience that by the mid-2030s the US would send humans to Mars. The race for Mars has already started.')
    RETURNING id INTO v_part_id;

    -- Question 1
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 1, 'When did the US lead the Soviet Union in the space race?', 'Giải thích:
- A. Early seventies – Đầu những năm 1970.→ Đúng vì bài đọc viết: “during the early seventies the US led the Soviet Union in the space race”. Cụm từ này có nghĩa Mỹ dẫn trước Liên Xô trong cuộc chạy đua không gian vào đầu thập niên 1970.
- B. Late seventies – Cuối những năm 1970.→ Sai vì bài đọc ghi rõ là đầu những năm 1970 (early seventies), không phải cuối thập niên 1970.
- C. Early eighties – Đầu những năm 1980.→ Sai vì mốc thời gian này không xuất hiện trong thông tin về việc Mỹ vượt Liên Xô.
- D. Late eighties – Cuối những năm 1980.→ Sai vì đây là khoảng thời gian muộn hơn so với mốc được đề cập trong bài đọc.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Early seventies', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Late seventies', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Early eighties', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Late eighties', false);

    -- Question 2
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 2, 'How many days did Dennis Tito spend on the ISS?', 'Giải thích:
- A. 7 days – 7 ngày.→ Sai vì bài đọc không nói Dennis Tito ở trên ISS trong 7 ngày mà ghi rõ thời gian là 8 ngày.
- B. 8 days – 8 ngày.→ Đúng vì bài đọc viết: “he spent eight days on the ISS”, nghĩa là ông đã dành 8 ngày trên Trạm Vũ trụ Quốc tế.
- C. 9 days – 9 ngày.→ Sai vì con số 9 không khớp với thời gian được cung cấp trong bài đọc.
- D. 10 days – 10 ngày.→ Sai vì bài đọc xác định chính xác thời gian là 8 ngày, không phải 10 ngày.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', '7 days', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', '8 days', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', '9 days', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', '10 days', false);

    -- Question 3
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 3, 'When did the Soviets put the first man into space?', 'Giải thích:
- A. By 1975 – Trước hoặc vào năm 1975.→ Sai vì năm 1975 là thời điểm các phi hành gia Mỹ và Liên Xô thực hiện nhiệm vụ gặp nhau trong không gian.
- B. By 1961 – Trước hoặc vào năm 1961.→ Đúng vì bài đọc viết: “by 1961 they had put the first man into space”. Điều này cho biết Liên Xô đã đưa người đầu tiên vào không gian trước hoặc vào năm 1961.
- C. By 1957 – Trước hoặc vào năm 1957.→ Sai vì năm 1957 là thời điểm Liên Xô phóng vệ tinh Sputnik 1, mở đầu Kỷ nguyên Không gian, chưa phải thời điểm đưa người đầu tiên vào vũ trụ.
- D. By 2009 – Trước hoặc vào năm 2009.→ Sai vì năm 2009 được nhắc đến trong kế hoạch phát triển tàu vũ trụ chạy bằng năng lượng hạt nhân để đến Sao Hỏa.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'By 1975', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'By 1961', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'By 1957', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'By 2009', false);

    -- Question 4
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 4, 'When did space tourism begin?', 'Giải thích:
- A. 18th century – Thế kỷ 18.→ Sai vì thế kỷ 18 là giai đoạn từ năm 1701 đến 1800, rất lâu trước khi con người thực hiện du lịch vũ trụ.
- B. 19th century – Thế kỷ 19.→ Sai vì thế kỷ 19 kéo dài từ năm 1801 đến 1900, trong khi du lịch vũ trụ được đề cập trong bài diễn ra vào đầu thế kỷ 21.
- C. 20th century – Thế kỷ 20.→ Sai vì mặc dù các hoạt động khám phá không gian phát triển mạnh trong thế kỷ 20, chuyến du lịch của Dennis Tito được nhắc đến vào đầu thế kỷ 21.
- D. 21st century – Thế kỷ 21.→ Đúng vì bài đọc viết: “At the beginning of the twenty-first century, businessman Dennis Tito paid twenty million dollars”. Đây là thời điểm du lịch vũ trụ bắt đầu được phát triển.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', '18th century', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', '19th century', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', '20th century', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', '21st century', true);

    -- Question 5
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 5, 'What does ISS stand for?', 'Giải thích:
- A. International Space Station – Trạm Vũ trụ Quốc tế.→ Đúng vì ISS là chữ viết tắt của International Space Station, một trạm nghiên cứu khoa học được đưa vào quỹ đạo Trái Đất và được các nhà khoa học trên thế giới sử dụng.
- B. International train station – Ga tàu quốc tế.→ Sai vì train station có nghĩa là nhà ga xe lửa, không liên quan đến hoạt động khám phá không gian.
- C. International bus station – Bến xe buýt quốc tế.→ Sai vì bus station có nghĩa là bến xe buýt, không phải tên của trạm vũ trụ.
- D. International airport – Sân bay quốc tế.→ Sai vì airport có nghĩa là sân bay, nơi máy bay cất cánh và hạ cánh, không phải trạm nghiên cứu trong không gian.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'international space station', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'International train station', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'International bus station', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'International airport', false);

    -- Question 6
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 6, 'Who can use ISS?', 'Giải thích:
- A. People around the world – Mọi người trên khắp thế giới.→ Sai vì bài đọc không nói tất cả mọi người đều có thể sử dụng ISS. Đối tượng được nhắc đến cụ thể là các nhà khoa học.
- B. Students around the world – Học sinh, sinh viên trên khắp thế giới.→ Sai vì bài đọc không đề cập học sinh, sinh viên là những người sử dụng trạm vũ trụ.
- C. Scientists around the world – Các nhà khoa học trên khắp thế giới.→ Đúng vì bài đọc viết: “the ISS is used by scientists from all over the world”. Nghĩa là ISS được các nhà khoa học trên toàn thế giới sử dụng để nghiên cứu.
- D. No one – Không ai cả.→ Sai vì bài đọc khẳng định ISS hiện đang được các nhà khoa học trên khắp thế giới sử dụng.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'People around the world', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Students around the world', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Scientist around the world', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'No one', false);

    -- Question 7
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 7, 'When did a Russian Space Chief say Russia was planning a nuclear spaceship for Mars?', 'Giải thích:
- A. 2009 – Năm 2009.→ Đúng vì bài đọc viết: “In 2009, a Russian Space Chief said Russia was planning a nuclear spaceship for Mars”. Đây chính xác là thông tin được hỏi.
- B. 2008 – Năm 2008.→ Sai vì bài đọc không đề cập năm 2008 trong thông tin về kế hoạch chế tạo tàu vũ trụ hạt nhân.
- C. 2007 – Năm 2007.→ Sai vì đây không phải mốc thời gian được nhắc đến trong đoạn văn.
- D. 2006 – Năm 2006.→ Sai vì kế hoạch tàu vũ trụ hạt nhân đến Sao Hỏa được người đứng đầu ngành vũ trụ Nga công bố vào năm 2009 theo bài đọc.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', '2009', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', '2008', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', '2007', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', '2006', false);

    -- Question 8
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 8, 'Who told an audience that by the mid-2030s the US would send humans to Mars?', 'Giải thích:
- A. The US president Barack Obama – Tổng thống Mỹ Barack Obama.→ Đúng vì bài đọc viết: “the US president Barack Obama told an audience that by the mid-2030s the US would send humans to Mars”. Đây chính là người đưa ra tuyên bố được hỏi.
- B. An astronaut – Một phi hành gia.→ Sai vì bài đọc có nhắc đến các phi hành gia trong những nhiệm vụ không gian trước đó, nhưng người đưa ra tuyên bố về Sao Hỏa là Tổng thống Barack Obama.
- C. Dennis Tito – Dennis Tito.→ Sai vì Dennis Tito là doanh nhân đã trả 20 triệu đô la để thực hiện chuyến du lịch lên ISS, không phải người đưa ra tuyên bố về kế hoạch đưa con người đến Sao Hỏa.
- D. An official – Một quan chức.→ Sai vì đây là cách gọi chung chung, không chính xác bằng tên người được nêu cụ thể trong bài đọc là Tổng thống Barack Obama.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'the US president Barack Obama', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'an astronaut', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Dennis Tito', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'An official', false);

    -- Question 9
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 9, 'How much did Dennis Tito pay for the space travel?', 'Giải thích:
- A. Twenty million dollars – 20 triệu đô la.→ Đúng vì bài đọc viết: “Dennis Tito paid twenty million dollars”. Đây là số tiền ông đã trả để thực hiện chuyến du lịch và ở trên ISS trong 8 ngày.
- B. Twenty-one million dollars – 21 triệu đô la.→ Sai vì số tiền này nhiều hơn 1 triệu đô la so với con số được đề cập trong bài đọc.
- C. Twenty-two million dollars – 22 triệu đô la.→ Sai vì bài đọc không đề cập khoản tiền 22 triệu đô la mà xác định là 20 triệu đô la.
- D. Twenty-three million dollars – 23 triệu đô la.→ Sai vì đây không phải số tiền Dennis Tito đã trả cho chuyến du lịch vũ trụ theo thông tin trong đoạn văn.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'twenty million dollars', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'twenty-one million dollars', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'twenty-two million dollars', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'twenty-three million dollars', false);

    -- Question 10
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 10, 'Which country had put the first man into space?', 'Giải thích:
- A. The US – Mỹ.→ Sai vì Mỹ là quốc gia đưa người lên Mặt Trăng đầu tiên, nhưng theo bài đọc, Liên Xô mới là quốc gia đưa người đầu tiên vào không gian.
- B. The Soviets – Liên Xô.→ Đúng vì đoạn đầu bài đọc nói Liên Xô đã đưa người đầu tiên vào không gian vào năm 1961. Người đầu tiên đó trong lịch sử là Yuri Gagarin.
- C. The United Kingdom – Vương quốc Anh.→ Sai vì bài đọc không đề cập Anh là quốc gia đưa người đầu tiên vào không gian.
- D. Canada – Canada.→ Sai vì Canada không phải quốc gia thực hiện chuyến bay đưa con người đầu tiên vào không gian theo nội dung bài đọc.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'The US', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'The Soviets', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'The United Kingdom', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'The Canada', false);

    -- Part 2: The History of Comic Strips
    INSERT INTO test_parts (test_id, part_number, title, passage_text)
    VALUES (v_test_id, 2, 'Part 2: The History of Comic Strips', 'The modern comic strip started out as ammunition in a newspaper war between giants of the American press in the late nineteenth century. The first full-color comic strip appeared in January 1894 in the New York World, owned by Joseph Pulitzer. The first regular weekly full-color comic supplement, similar to today''s Sunday funnies, appeared two years later, in William Randolph Hearst''s rival New York paper, the Morning Journal.

Both were immensely popular, and publishers realized that supplementing the news with comic relief boosted the sale of papers. The Morning Journal started another feature in 1896, the "Yellow Kid," the first continuous comic character in the United States, whose creator, Richard Outcault, had been lured away from the World by the ambitious Hearst. The "Yellow Kid" was in many ways a pioneer. Its comic dialogue was the strictly urban farce that came to characterize later strips, and it introduced the speech balloon inside the strip, usually placed above the characters'' heads.

The first strip to incorporate all the elements of later comics was Rudolph Dirks''s "Katzenjammer Kids," based on Wilhelm Busch''s Max and Moritz, a European satire of the nineteenth century. The "Kids" strip, first published in 1897, served as the prototype for future American strips. It contained not only speech balloons, but a continuous cast of characters, and was divided into small regular panels that did away with the larger panoramic scenes of earlier comics.

Newspaper syndication played a major role in spreading the popularity of comic strips throughout the country. Though weekly colored comics came first, daily black and-white strips were not far behind. They first appeared in the Chicago American in 1904. It was followed by many imitators, and by 1915 blackand-white comic strips had become a staple of daily newspapers around the country.')
    RETURNING id INTO v_part_id;

    -- Question 11
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 11, 'What does the passage mainly discuss?', 'Giải thích:
- A. A comparison of two popular comic strips – Sự so sánh giữa hai bộ truyện tranh nổi tiếng.→ Sai vì bài đọc không tập trung so sánh hai bộ truyện tranh mà trình bày quá trình hình thành và phát triển của truyện tranh Mỹ thời kỳ đầu.
- B. The differences between early and modern comic strips – Sự khác biệt giữa truyện tranh thời kỳ đầu và hiện đại.→ Sai vì bài chỉ đề cập một số đặc điểm của truyện tranh hiện đại để liên hệ, không phân tích sự khác biệt giữa hai thời kỳ.
- C. The effects of newspapers on comic strip stories – Ảnh hưởng của báo chí đến nội dung truyện tranh.→ Sai vì báo chí là một yếu tố quan trọng trong bài, nhưng nội dung chính còn bao gồm lịch sử, nhân vật và đặc điểm của truyện tranh.
- D. Features of early comic strips in the United States – Những đặc điểm của truyện tranh thời kỳ đầu ở Mỹ.→ Đúng vì bài đọc trình bày lịch sử truyện tranh Mỹ, từ những ấn phẩm đầu tiên đến các đặc điểm như nhân vật xuyên suốt, bong bóng hội thoại và khung tranh.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'A comparison of two popular comic strips', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'The differences between early and modern comic strips', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'The effects of newspapers on comic strip stories', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Features of early comic strips in the United States', true);

    -- Question 12
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 12, 'Why does the author mention Joseph Pulitzer and William Randolph Hearst?', 'Giải thích:
- A. They established New York''s first newspaper. – Họ thành lập tờ báo đầu tiên của New York.→ Sai vì bài không nói hai người này thành lập tờ báo đầu tiên tại New York. Họ được nhắc đến với vai trò chủ sở hữu các tờ báo lớn.
- B. They published comic strips about the newspaper war. – Họ xuất bản truyện tranh về cuộc chiến giữa các tờ báo.→ Sai vì cuộc chiến báo chí là bối cảnh thúc đẩy sự ra đời của truyện tranh, không có nghĩa các bộ truyện tranh được xuất bản với nội dung kể về cuộc chiến đó.
- C. Their comic strips are still published today. – Những bộ truyện tranh của họ vẫn được xuất bản ngày nay.→ Sai vì bài không đề cập việc các bộ truyện tranh của hai người vẫn tiếp tục được xuất bản cho đến hiện tại.
- D. They owned major competitive newspapers. – Họ sở hữu những tờ báo lớn có tính cạnh tranh.→ Đúng vì Joseph Pulitzer sở hữu New York World, còn William Randolph Hearst sở hữu Morning Journal. Hai tờ báo này cạnh tranh với nhau vào cuối thế kỷ 19.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'They established New York''s first newspaper.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'They published comic strips about the newspaper war.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Their comic strips are still published today.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'They owned major competitive newspapers.', true);

    -- Question 13
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 13, 'The passage suggests that comic strips were popular for which of the following reasons?', 'Giải thích:
A. They provided a break from serious news stories. – Chúng giúp độc giả thư giãn sau những tin tức nghiêm túc.→ Đúng vì bài viết: “supplementing the news with comic relief boosted the sale of papers”. Nghĩa là việc bổ sung truyện tranh mang tính giải trí vào tin tức giúp tăng doanh số bán báo.
- B. Readers enjoyed the unusual drawings. – Độc giả thích những hình vẽ khác thường.→ Sai vì bài không đề cập hình vẽ khác thường là nguyên nhân khiến truyện tranh phổ biến.
- C. Readers could identify with the characters. – Độc giả có thể đồng cảm với các nhân vật.→ Sai vì mặc dù nhân vật là một yếu tố quan trọng của truyện tranh, bài không khẳng định đây là lý do khiến chúng được yêu thích.
- D. They were about real-life situations. – Chúng nói về những tình huống có thật trong cuộc sống.→ Sai vì bài không đề cập truyện tranh dựa trên những sự kiện có thật. Nội dung được nhấn mạnh là tính hài hước và giải trí.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'They provided a break from serious news stories.', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Readers enjoyed the unusual drawings.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Readers could identify with the characters.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'They were about real-life situations.', false);

    -- Question 14
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 14, 'To say that Richard Outcault had been "lured away from" the World by Hearst means which of the following?', 'Giải thích:
- A. Hearst convinced Outcault to leave the World. – Hearst thuyết phục Outcault rời khỏi tờ World.→ Đúng vì “lured away from” mang nghĩa lôi kéo hoặc thuyết phục ai đó rời khỏi nơi làm việc cũ để chuyển sang nơi khác. Hearst đã thu hút Richard Outcault về phía tờ báo của mình.
- B. Hearst fired Outcault from the World. – Hearst sa thải Outcault khỏi tờ World.→ Sai vì “fired” có nghĩa là sa thải, trong khi “lured away” có nghĩa là chủ động lôi kéo hoặc thu hút người khác.
- C. Hearst warned Outcault to leave the World. – Hearst cảnh báo Outcault phải rời khỏi tờ World.→ Sai vì “warned” có nghĩa là cảnh báo, không thể hiện ý nghĩa thuyết phục hoặc lôi kéo như cụm từ trong bài.
- D. Hearst wanted Outcault to work for the World. – Hearst muốn Outcault làm việc cho tờ World.→ Sai vì Hearst sở hữu tờ Morning Journal, đối thủ của New York World. Ông muốn lôi kéo Outcault về làm việc cho tờ báo của mình, chứ không phải cho World.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Hearst convinced Outcault to leave the World.', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Hearst fired Outcault from the World.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Hearst warned Outcault to leave the World.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Hearst wanted Outcault to work for the World.', false);

    -- Question 15
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 15, 'The word "it" in paragraph 2 refers to', 'Giải thích:
- A. The "Yellow Kid" – Nhân vật/truyện tranh Yellow Kid.→ Đúng vì câu trước nhắc đến “the Yellow Kid”, sau đó câu tiếp theo viết “The Yellow Kid was in many ways a pioneer. Its comic dialogue...”. Từ “its” ở đây chỉ Yellow Kid.
- B. Dialogue – Lời thoại.→ Sai vì dialogue là phần hội thoại trong truyện tranh, không phải đối tượng sở hữu những đặc điểm tiên phong được mô tả trong câu.
- C. Farce – Trò hài kịch hoặc tình huống gây cười.→ Sai vì farce chỉ thể loại hài hước, không phải nhân vật hoặc bộ truyện tranh được nhắc đến.
- D. Balloon – Bong bóng hội thoại.→ Sai vì balloon là hình thức thể hiện lời thoại trong truyện tranh, không phải đối tượng được mô tả là tiên phong.
Lưu ý: Trong đoạn gốc, từ được sử dụng là “Its” (không phải “it”). “Its” là tính từ sở hữu, mang nghĩa “của nó”, chỉ Yellow Kid.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'The "Yellow Kid"', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'dialogue', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'farce', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Balloon', false);

    -- Question 16
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 16, 'According to the passage, the "Yellow Kid" was the first comic strip to do all of the following EXCEPT', 'Giải thích:
- A. Feature the same character in each episode – Có cùng một nhân vật trong mỗi tập.→ Đây là đặc điểm được bài đề cập vì Yellow Kid là “the first continuous comic character in the United States”, tức nhân vật truyện tranh liên tục đầu tiên ở Mỹ.
- B. Include dialogue inside a balloon – Có lời thoại bên trong bong bóng hội thoại.→ Đây cũng là đặc điểm đúng vì bài viết: “it introduced the speech balloon inside the strip”. Yellow Kid đã giới thiệu hình thức bong bóng chứa lời thoại trong truyện tranh.
- C. Appear in a Chicago newspaper – Xuất hiện trên một tờ báo ở Chicago.→ Đây là đáp án đúng cho câu hỏi EXCEPT vì Yellow Kid xuất hiện trên Morning Journal ở New York, không phải báo ở Chicago. Báo Chicago American chỉ được nhắc đến với các dải truyện tranh đen trắng xuất hiện năm 1904.
- D. Characterize city life in a humorous way – Khắc họa cuộc sống thành thị theo cách hài hước.→ Đây là đặc điểm đúng vì bài viết nói lời thoại hài hước của Yellow Kid mang tính “strictly urban farce”, tức phong cách hài hước đặc trưng của đời sống đô thị.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'feature the same character in each episode', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'include dialogue inside a balloon', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'appear in a Chicago newspaper', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'characterize city life in a humorous way', false);

    -- Question 17
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 17, 'The word "incorporate" is closest in meaning to', 'Giải thích:
- A. Affect – Ảnh hưởng.→ Sai vì affect có nghĩa là tác động hoặc ảnh hưởng đến điều gì đó, không mang nghĩa kết hợp nhiều yếu tố thành một thể thống nhất.
- B. Create – Tạo ra, sáng tạo.→ Sai vì create có nghĩa là tạo ra một thứ mới, trong khi incorporate nhấn mạnh việc đưa nhiều yếu tố vào cùng một sản phẩm hoặc hệ thống.
- C. Combine – Kết hợp, kết nối.→ Đúng vì incorporate có nghĩa là kết hợp hoặc đưa nhiều thành phần vào cùng một tổng thể. Trong bài, truyện tranh kết hợp đầy đủ những yếu tố của truyện tranh hiện đại.
- D. Mention – Đề cập, nhắc đến.→ Sai vì mention chỉ có nghĩa là nhắc đến một vấn đề, không có nghĩa kết hợp các yếu tố lại với nhau.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'affect', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'create', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'combine', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Mention', false);

    -- Question 18
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 18, 'The word "prototype" is closest in meaning to', 'Giải thích:
- A. Story – Câu chuyện.→ Sai vì story chỉ nội dung hoặc cốt truyện, không thể hiện ý nghĩa một hình mẫu được dùng làm cơ sở phát triển những sản phẩm sau này.
- B. Humor – Sự hài hước.→ Sai vì humor chỉ tính hài hước của tác phẩm, không phải ý nghĩa của một hình mẫu tiêu biểu.
- C. Drawing – Bức vẽ.→ Sai vì drawing có nghĩa là hình vẽ, chỉ một yếu tố hình ảnh chứ không phải một mẫu chuẩn để các tác phẩm khác noi theo.
- D. Model – Hình mẫu, mô hình.→ Đúng vì prototype có nghĩa là nguyên mẫu hoặc hình mẫu ban đầu. Trong bài, Katzenjammer Kids được xem là hình mẫu cho các truyện tranh Mỹ ra đời sau này.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'story', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'humor', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'drawing', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'model', true);

    -- Question 19
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 19, 'The word "staple" is closest in meaning to', 'Giải thích:
- A. Regular feature – Đặc điểm hoặc chuyên mục thường xuyên.→ Đúng vì trong câu “black-and-white comic strips had become a staple of daily newspapers”, staple có nghĩa là một nội dung quen thuộc, xuất hiện thường xuyên và gần như không thể thiếu trên các tờ báo hằng ngày.
- B. Popular edition – Ấn bản phổ biến.→ Sai vì edition có nghĩa là ấn bản hoặc phiên bản xuất bản. Từ staple trong ngữ cảnh này không nói về một phiên bản báo cụ thể.
- C. New version – Phiên bản mới.→ Sai vì staple không mang nghĩa mới hoặc phiên bản mới mà nói đến một nội dung đã trở thành phần thường xuyên của một thứ gì đó.
- D. Huge success – Thành công lớn.→ Sai vì mặc dù truyện tranh rất phổ biến, staple trong câu này nhấn mạnh vai trò thường xuyên, quen thuộc của truyện tranh trên báo, không đơn thuần là sự thành công.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'regular feature', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'popular edition', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'new version', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'huge success', false);

    -- Question 20
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 20, 'In what order does the author discuss various comic strips in the passage?', 'Giải thích:
- A. In alphabetical order by title – Theo thứ tự bảng chữ cái của tên truyện.→ Sai vì các bộ truyện được nhắc đến không theo thứ tự chữ cái. Tác giả sắp xếp chúng dựa trên các mốc thời gian xuất hiện.
- B. In the order in which they were created – Theo thứ tự chúng được tạo ra hoặc xuất bản.→ Đúng vì bài lần lượt đề cập truyện tranh năm 1894, Yellow Kid năm 1896, Katzenjammer Kids năm 1897 và truyện tranh đen trắng năm 1904.
- C. According to the newspaper in which they appeared – Theo tờ báo mà chúng xuất hiện.→ Sai vì tác giả không phân loại các bộ truyện theo tên tờ báo mà trình bày theo tiến trình lịch sử, từ những truyện đầu tiên đến các hình thức phát triển sau này.
- D. From most popular to least popular – Từ phổ biến nhất đến ít phổ biến nhất.→ Sai vì bài không xếp hạng mức độ nổi tiếng của các bộ truyện. Thay vào đó, tác giả trình bày lịch sử hình thành và phát triển theo thời gian.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'In alphabetical order by title', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'In the order in which they were created', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'According to the newspaper in which they appeared', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'From most popular to least popular', false);

    -- Part 3: The Role of Art in Society
    INSERT INTO test_parts (test_id, part_number, title, passage_text)
    VALUES (v_test_id, 3, 'Part 3: The Role of Art in Society', 'Art has always played an important role in human civilization. From ancient cave paintings to modern digital installations, art reflects the values, emotions, and ideas of a culture. It is not only a form of personal expression but also a powerful tool for communication and social change.

One of the most significant contributions of art is its ability to bring awareness to important issues. Artists have used their work to highlight injustice, protest wars, and support human rights. A single image or performance can sometimes express more than a lengthy speech, capturing attention and sparking conversation.

Art also contributes to education and mental well-being. In schools, students who engage in art activities often develop better problem-solving skills and creativity. Museums and galleries provide spaces for learning about different cultures and historical events. Additionally, creating or experiencing art can help reduce stress and improve emotional health.

In terms of economics, art has a significant impact. The creative industries generate billions of dollars each year and provide jobs for millions of people worldwide. From painters and musicians to designers and filmmakers, many individuals rely on art for their livelihoods.

However, despite its importance, art is sometimes undervalued in modern society. It may be seen as non-essential or given less attention in educational systems. Yet, during difficult times—such as pandemics or political unrest—people often turn to music, films, and paintings for comfort and inspiration.

In conclusion, art is far more than decoration or entertainment. It shapes our identities, connects communities, and influences the way we see the world. Supporting the arts is not just about funding museums or buying paintings—it is about recognizing the essential role creativity plays in human development.')
    RETURNING id INTO v_part_id;

    -- Question 21
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 21, 'What is the main idea of the passage?', 'Giải thích:
- A. Art is mostly entertainment.→ Nghệ thuật chủ yếu là hoạt động giải trí.→ Sai: Bài đọc đề cập đến nhiều vai trò khác của nghệ thuật như giáo dục, kinh tế, sức khỏe tinh thần và thay đổi xã hội, chứ không chỉ giải trí.
- B. Art is important in many areas of life.→ Nghệ thuật quan trọng trong nhiều lĩnh vực của cuộc sống.→
Đáp án đúng
Đây là ý bao quát toàn bộ bài đọc. Các đoạn lần lượt nói về vai trò của nghệ thuật trong xã hội, giáo dục, sức khỏe tinh thần và kinh tế.
- C. Art only belongs in museums.→ Nghệ thuật chỉ thuộc về các bảo tàng.→ Sai: Bài đọc có nhắc đến bảo tàng nhưng nghệ thuật còn xuất hiện trong trường học, phim ảnh, âm nhạc, tranh vẽ và nhiều lĩnh vực khác.
- D. Art should replace science in schools.→ Nghệ thuật nên thay thế khoa học trong trường học.→ Sai: Bài đọc chỉ nói nghệ thuật giúp học sinh phát triển khả năng sáng tạo và giải quyết vấn đề, không hề nói nghệ thuật nên thay thế khoa học.
Từ khóa: main idea = ý chính; many areas of life = nhiều lĩnh vực của cuộc sống.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Art is mostly entertainment', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Art is important in many areas of life', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Art only belongs in museums', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Art should replace science in schools', false);

    -- Question 22
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 22, 'What is one way art can influence society?', 'Giải thích:
Dịch: Một cách mà nghệ thuật có thể ảnh hưởng đến xã hội là gì?
- A. By increasing taxes.→ Bằng cách tăng thuế.→ Sai: Bài đọc không đề cập đến việc nghệ thuật làm tăng thuế.
- B. By stopping crime.→ Bằng cách ngăn chặn tội phạm.→ Sai: Bài đọc không nói nghệ thuật trực tiếp ngăn chặn tội phạm.
- C. By raising awareness about issues.→ Bằng cách nâng cao nhận thức về các vấn đề.→
Đáp án đúng
Đoạn 2 viết: “its ability to bring awareness to important issues” – khả năng nâng cao nhận thức về những vấn đề quan trọng. Đây chính là nội dung của đáp án C.
- D. By teaching math.→ Bằng cách dạy toán.→ Sai: Bài đọc nói nghệ thuật giúp phát triển kỹ năng giải quyết vấn đề và sáng tạo, không nói nghệ thuật có nhiệm vụ dạy toán.
Từ khóa: raise awareness = nâng cao nhận thức; issues = các vấn đề.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'By increasing taxes', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'By stopping crime', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'By raising awareness about issues', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'By teaching math', false);

    -- Question 23
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 23, 'According to the passage, how does art help education?', 'Giải thích:
- A. It replaces academic subjects.→ Nó thay thế các môn học thuật.→ Sai: Bài đọc không nói nghệ thuật thay thế các môn học khác. Nghệ thuật chỉ đóng vai trò hỗ trợ quá trình học tập.
- B. It improves creative thinking.→ Nó cải thiện tư duy sáng tạo.→
Đáp án đúng
Đoạn 3 đề cập đến việc học sinh tham gia hoạt động nghệ thuật thường phát triển tốt hơn về kỹ năng giải quyết vấn đề và khả năng sáng tạo.
- C. It teaches students to paint only.→ Nó chỉ dạy học sinh vẽ tranh.→ Sai: Nghệ thuật không chỉ bao gồm hội họa mà còn có âm nhạc, biểu diễn và nhiều hoạt động sáng tạo khác.
- D. It makes history harder to learn.→ Nó khiến lịch sử trở nên khó học hơn.→ Sai: Bài đọc nói bảo tàng và phòng trưng bày giúp mọi người tìm hiểu về các sự kiện lịch sử, chứ không làm việc học lịch sử khó hơn.
Từ khóa: creative thinking = tư duy sáng tạo; problem-solving skills = kỹ năng giải quyết vấn đề.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'It replaces academic subjects', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'It improves creative thinking', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'It teaches students to paint only', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'It makes history harder to learn', false);

    -- Question 24
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 24, 'What does the passage say about art and mental health?', 'Giải thích:
Dịch: Bài đọc nói gì về nghệ thuật và sức khỏe tinh thần?
- A. Art has no effect on it.→ Nghệ thuật không có ảnh hưởng gì đến sức khỏe tinh thần.→ Sai: Bài đọc khẳng định nghệ thuật có thể giúp giảm căng thẳng và cải thiện sức khỏe cảm xúc.
- B. Art can increase stress.→ Nghệ thuật có thể làm tăng căng thẳng.→ Sai: Nội dung bài đọc nói ngược lại: nghệ thuật có thể giúp giảm căng thẳng.
- C. Art can support emotional well-being.→ Nghệ thuật có thể hỗ trợ sức khỏe cảm xúc.→
Đáp án đúng
Đoạn 3 viết: “creating or experiencing art can help reduce stress and improve emotional health”. Điều này có nghĩa là sáng tạo hoặc thưởng thức nghệ thuật giúp giảm stress và cải thiện sức khỏe cảm xúc.
- D. Art is harmful to students.→ Nghệ thuật có hại cho học sinh.→ Sai: Bài đọc nhấn mạnh những lợi ích tích cực của nghệ thuật đối với học sinh, đặc biệt là khả năng sáng tạo và giải quyết vấn đề.
Từ khóa: mental health = sức khỏe tinh thần; emotional well-being = trạng thái khỏe mạnh về cảm xúc; reduce stress = giảm căng thẳng.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Art has no effect on it', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Art can increase stress', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Art can support emotional well-being', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Art is harmful to students', false);

    -- Question 25
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 25, 'What is the economic role of art?', 'Giải thích:
Dịch: Vai trò kinh tế của nghệ thuật là gì?
- A. It causes debt.→ Nó gây ra nợ nần.→ Sai: Bài đọc không đề cập nghệ thuật gây ra nợ nần.
- B. It is not connected to jobs.→ Nó không liên quan đến việc làm.→ Sai: Đoạn 4 khẳng định ngành công nghiệp sáng tạo tạo việc làm cho hàng triệu người trên toàn thế giới.
- C. It supports jobs and industry.→ Nó hỗ trợ việc làm và ngành công nghiệp.→
Đáp án đúng
Đoạn 4 nói các ngành công nghiệp sáng tạo tạo ra hàng tỷ đô la mỗi năm và cung cấp việc làm cho hàng triệu người.
- D. It is too expensive to produce.→ Nó quá tốn kém để sản xuất.→ Sai: Bài đọc không đề cập chi phí sản xuất nghệ thuật mà tập trung vào đóng góp kinh tế và việc làm của ngành này.
Từ khóa: economic role = vai trò kinh tế; generate = tạo ra; provide jobs = cung cấp việc làm; livelihoods = kế sinh nhai.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'It causes debt', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'It is not connected to jobs', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'It supports jobs and industry', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'It is too expensive to produce', false);

    -- Question 26
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 26, 'The word "undervalued" in paragraph 5 means:', 'Giải thích:
Dịch: Từ "undervalued" trong đoạn 5 có nghĩa là gì?
- A. Overpriced.→ Bị định giá quá cao.→ Sai: Overpriced nói về giá tiền quá cao, trong khi undervalued trong bài nói về việc nghệ thuật không được coi trọng đúng mức.
- B. Not given enough importance.→ Không được coi trọng đúng mức.→
Đáp án đúng
Trong đoạn 5, nghệ thuật bị xem là không thiết yếu hoặc nhận được ít sự quan tâm trong giáo dục. Vì vậy, undervalued có nghĩa là bị đánh giá thấp, không được đánh giá đúng tầm quan trọng.
- C. Widely accepted.→ Được chấp nhận rộng rãi.→ Sai: Cụm này nói về sự chấp nhận, không diễn tả việc bị đánh giá thấp.
- D. Frequently studied.→ Được nghiên cứu thường xuyên.→ Sai: Đây là ý nói về tần suất nghiên cứu, không liên quan đến mức độ coi trọng nghệ thuật.
Từ khóa: undervalued = bị đánh giá thấp; importance = tầm quan trọng.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Overpriced', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Not given enough importance', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Widely accepted', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Frequently studied', false);

    -- Question 27
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 27, 'What does the phrase "turn to music, films, and paintings" suggest?', 'Giải thích:
Dịch: Cụm từ "turn to music, films, and paintings" gợi ý điều gì?
- A. People create them for money.→ Mọi người tạo ra chúng để kiếm tiền.→ Sai: Câu hỏi nói về việc mọi người tìm đến âm nhạc, phim ảnh và tranh vẽ trong thời điểm khó khăn, không phải mục đích kiếm tiền.
- B. People ignore them in crises.→ Mọi người phớt lờ chúng trong khủng hoảng.→ Sai: Bài đọc nói mọi người thường tìm đến nghệ thuật trong những giai đoạn khó khăn, tức là họ không hề phớt lờ nghệ thuật.
- C. People rely on them for support.→ Mọi người dựa vào chúng để tìm kiếm sự hỗ trợ.→
Đáp án đúng
Đoạn 5 viết: “people often turn to music, films, and paintings for comfort and inspiration”. Nghĩa là mọi người tìm đến nghệ thuật để được an ủi và truyền cảm hứng.
- D. People criticize them.→ Mọi người chỉ trích chúng.→ Sai: Bài đọc không nói mọi người chỉ trích nghệ thuật mà nhấn mạnh nghệ thuật giúp con người vượt qua thời điểm khó khăn.
Từ khóa: turn to = tìm đến, dựa vào; comfort = sự an ủi; inspiration = nguồn cảm hứng.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'People create them for money', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'People ignore them in crises', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'People rely on them for support', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'People criticize them', false);

    -- Question 28
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 28, 'What can be inferred about art in schools?', 'Giải thích:
Dịch: Có thể suy luận điều gì về nghệ thuật trong trường học?
- A. It should be removed.→ Nó nên bị loại bỏ.→ Sai: Bài đọc nói nghệ thuật có lợi cho giáo dục, vì vậy không có lý do để loại bỏ nó.
- B. It is the least useful subject.→ Đây là môn học ít hữu ích nhất.→ Sai: Bài đọc không đánh giá nghệ thuật là môn học ít hữu ích nhất. Ngược lại, nghệ thuật giúp phát triển khả năng sáng tạo và giải quyết vấn đề.
- C. It should be better supported.→ Nó nên được hỗ trợ tốt hơn.→
Đáp án đúng
Đây là câu hỏi suy luận. Đoạn 5 cho biết nghệ thuật đôi khi bị đánh giá thấp và ít được quan tâm trong hệ thống giáo dục. Kết hợp với những lợi ích được nêu ở đoạn 3, ta suy ra nghệ thuật cần được quan tâm và hỗ trợ nhiều hơn trong trường học.
- D. It is fully appreciated.→ Nó được đánh giá đầy đủ và đúng mức.→ Sai: Trái với nội dung đoạn 5, bài đọc nói nghệ thuật đôi khi vẫn bị đánh giá thấp trong xã hội hiện đại.
Từ khóa: infer = suy luận; better supported = được hỗ trợ tốt hơn; fully appreciated = được đánh giá đúng mức.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'It should be removed', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'It is the least useful subject', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'It should be better supported', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'It is fully appreciated', false);

    -- Question 29
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 29, 'What does the word "it" refer to in "it shapes our identities"?', 'Giải thích:
Dịch: Từ "it" trong câu "it shapes our identities" thay thế cho từ nào?
- A. Education.→ Giáo dục.→ Sai: Giáo dục được nhắc đến ở đoạn 3, nhưng không phải chủ thể được nhắc đến trong câu kết luận.
- B. History.→ Lịch sử.→ Sai: Lịch sử chỉ là một nội dung được nhắc đến trong bài đọc, không phải chủ thể định hình bản sắc của chúng ta trong câu này.
- C. Art.→ Nghệ thuật.→
Đáp án đúng
Câu trước đó là: “Art is far more than decoration or entertainment.” Câu tiếp theo “it shapes our identities” tiếp tục nói về nghệ thuật. Vì vậy, "it" thay thế cho "Art".
- D. Speech.→ Bài phát biểu.→ Sai: Bài phát biểu chỉ được nhắc đến trong đoạn 2 để so sánh với khả năng truyền tải thông điệp của nghệ thuật.
Từ khóa: refer to = đề cập đến, thay thế cho; identity = bản sắc, danh tính; shape = định hình.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Education', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'History', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Art', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Speech', false);

    -- Question 30
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 30, 'What is the author''s opinion of art?', 'Giải thích:
Giải thích: Tác giả cho rằng nghệ thuật đóng vai trò quan trọng trong đời sống con người, giúp phản ánh cảm xúc, giá trị và văn hóa xã hội.
- Essential: Cần thiết, thiết yếu.
→ Chọn B vì tác giả đánh giá nghệ thuật là một phần không thể thiếu trong cuộc sống.
KỸ NĂNG ĐỌC (TIẾNG ANH 3)')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'It''s outdated', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'It''s essential', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'It''s harmful', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'It''s confusing', false);

    -- Part 4: Technology and the Future of Work
    INSERT INTO test_parts (test_id, part_number, title, passage_text)
    VALUES (v_test_id, 4, 'Part 4: Technology and the Future of Work', 'Technology continues to reshape how we work, from the introduction of artificial intelligence (AI) to the growing popularity of remote jobs. These changes offer both exciting opportunities and serious challenges for workers and employers around the world.

AI has already taken over many repetitive and routine tasks. In factories, robots assemble products faster than humans. In offices, AI systems can analyze large amounts of data, write reports, and even respond to customer service queries. While this improves efficiency, it also raises fears about job loss, especially in industries where automation is growing rapidly.

Remote work, another major shift, became common during the COVID-19 pandemic and has remained popular. Many employees enjoy the flexibility of working from home, saving time and money on commuting. Employers also benefit by reducing the need for office space. However, remote work can lead to feelings of isolation, and some workers struggle to balance professional and personal life.

The rapid pace of technological change also creates a strong need for reskilling. Many jobs now require digital literacy, and employees must continuously update their skills to remain competitive. Governments, companies, and schools are investing more in training programs to help people adapt to the changing job market.

Despite concerns, technology also brings innovation. It enables global collaboration, opens new career paths, and increases access to work for people with disabilities or those living in remote areas. The future of work will likely include a mix of human creativity and technological power. To succeed in this new environment, flexibility, lifelong learning, and adaptability are essential. Rather than fearing technology, individuals and societies must learn to work alongside it.')
    RETURNING id INTO v_part_id;

    -- Question 31
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 31, 'What is the main idea of the passage?', 'Technology is changing how we work. – Công nghệ đang thay đổi cách chúng ta làm việc.
A. Remote work is harmful – Làm việc từ xa có hại. → Sai vì bài đọc nêu cả lợi ích và hạn chế của làm việc từ xa.
B. Technology will end all jobs – Công nghệ sẽ xóa bỏ tất cả công việc. → Sai vì công nghệ còn tạo ra nhiều cơ hội nghề nghiệp mới.
C. Technology is changing how we work – Công nghệ đang thay đổi cách chúng ta làm việc. → Đúng vì toàn bài nói về AI, làm việc từ xa và kỹ năng nghề nghiệp.
D. AI should replace humans – AI nên thay thế con người. → Sai vì tác giả cho rằng con người cần làm việc cùng công nghệ.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Remote work is harmful', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Technology will end all jobs', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Technology is changing how we work', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'AI should replace humans', false);

    -- Question 32
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 32, 'What is one benefit of AI mentioned in the text?', 'Đáp án C
It improves efficiency. – Nó cải thiện hiệu quả.
A. It reduces creativity – Nó làm giảm sự sáng tạo. → Sai vì bài không đề cập điều này.
B. It increases stress – Nó làm tăng căng thẳng. → Sai vì không có thông tin này.
C. It improves efficiency – Nó cải thiện hiệu quả. → Đúng vì AI giúp phân tích dữ liệu, viết báo cáo và trả lời khách hàng nhanh hơn.
D. It causes errors – Nó gây ra lỗi. → Sai vì bài nhấn mạnh AI giúp nâng cao hiệu suất công việc.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'It reduces creativity', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'It increases stress', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'It improves efficiency', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'It causes errors', false);

    -- Question 33
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 33, 'What is a problem caused by remote work?', 'Feelings of isolation. – Cảm giác cô lập.
A. Long office hours – Giờ làm việc văn phòng kéo dài. → Sai vì bài không đề cập.
B. Higher travel costs – Chi phí đi lại cao hơn. → Sai vì làm việc từ xa giúp tiết kiệm chi phí đi lại.
C. Feelings of isolation – Cảm giác cô lập. → Đúng vì bài nói nhân viên có thể cảm thấy cô đơn khi làm việc từ xa.
D. Decrease in productivity – Giảm năng suất. → Sai vì bài không nêu đây là vấn đề được đề cập.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Long office hours', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Higher travel costs', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Feelings of isolation', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Decrease in productivity', false);

    -- Question 34
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 34, 'What does "reskilling" mean in this context?', 'Learning new job skills. – Học những kỹ năng nghề nghiệp mới.
A. Losing one''s skills – Mất đi kỹ năng của bản thân. → Sai vì trái nghĩa với nội dung bài.
B. Learning new job skills – Học kỹ năng nghề nghiệp mới. → Đúng vì người lao động cần cập nhật kỹ năng để đáp ứng yêu cầu công việc.
C. Forgetting digital tools – Quên các công cụ kỹ thuật số. → Sai vì bài nhấn mạnh cần nâng cao kỹ năng số.
D. Focusing only on AI – Chỉ tập trung vào AI. → Sai vì reskilling không chỉ liên quan đến AI.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Losing one''s skills', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Learning new job skills', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Forgetting digital tools', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Focusing only on AI', false);

    -- Question 35
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 35, 'According to the passage, why are training programs increasing?', 'To help people adapt to new jobs. – Giúp mọi người thích nghi với công việc mới.
A. To reduce employee salaries – Để giảm lương nhân viên. → Sai vì bài không đề cập đến tiền lương.
B. To avoid technology – Để tránh công nghệ. → Sai vì mục đích là thích nghi với sự phát triển công nghệ.
C. To help people adapt to new jobs – Giúp mọi người thích nghi với công việc mới. → Đúng vì chương trình đào tạo giúp người lao động đáp ứng thị trường việc làm mới.
D. To reduce the number of workers – Để giảm số lượng người lao động. → Sai vì bài không nói đây là mục đích đào tạo.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'To reduce employee salaries', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'To avoid technology', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'To help people adapt to new jobs', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'To reduce the number of workers', false);

    -- Question 36
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 36, 'The word "flexibility" in the last paragraph means:', 'Willingness to adapt. – Sẵn sàng thích nghi.
A. Physical strength – Sức mạnh thể chất. → Sai vì flexibility trong câu này không nói về sức khỏe.
B. Willingness to adapt – Sẵn sàng thích nghi. → Đúng vì người lao động cần linh hoạt trước những thay đổi của công nghệ.
C. Time off work – Thời gian nghỉ làm. → Sai vì không liên quan đến ngữ cảnh.
D. Attention to detail – Sự chú ý đến chi tiết. → Sai vì không diễn đạt ý linh hoạt, thích nghi.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Physical strength', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Willingness to adapt', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Time off work', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Attention to detail', false);

    -- Question 37
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 37, 'What does the word "it" refer to in "learn to work alongside it"?', 'Đáp án C
Technology. – Công nghệ.
A. Remote work – Làm việc từ xa. → Sai vì không phải đối tượng được nhắc đến trong ý này.
B. Education – Giáo dục. → Sai vì bài không nhắc đến giáo dục trong câu đó.
C. Technology – Công nghệ. → Đúng vì câu trước nhắc đến công nghệ và con người cần học cách làm việc cùng nó.
D. The internet – Internet. → Sai vì bài đang nói về công nghệ nói chung.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Remote work', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Education', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Technology', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'The internet', false);

    -- Question 38
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 38, 'How has technology helped people with disabilities?', 'Đáp án C
It has opened new job opportunities. – Công nghệ đã mở ra những cơ hội việc làm mới.
A. It has made jobs harder to find – Nó khiến việc tìm việc khó hơn. → Sai vì trái với nội dung bài.
B. It has blocked remote access – Nó đã ngăn cản khả năng truy cập từ xa. → Sai vì công nghệ giúp tăng khả năng tiếp cận công việc.
C. It has opened new job opportunities – Nó mở ra cơ hội việc làm mới. → Đúng vì người khuyết tật có thể tiếp cận nhiều công việc hơn nhờ công nghệ.
D. It has replaced their work – Nó đã thay thế công việc của họ. → Sai vì bài không nói công nghệ thay thế người khuyết tật.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'It has made jobs harder to find', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'It has blocked remote access', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'It has opened new job opportunities', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'It has replaced their work', false);

    -- Question 39
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 39, 'What can be inferred about future workers?', 'Đáp án C
They will need to keep learning. – Họ sẽ cần tiếp tục học hỏi.
A. They will only work from home – Họ sẽ chỉ làm việc tại nhà. → Sai vì tương lai công việc không chỉ có làm việc từ xa.
B. They must stop using AI – Họ phải ngừng sử dụng AI. → Sai vì tác giả khuyến khích làm việc cùng công nghệ.
C. They will need to keep learning – Họ cần tiếp tục học hỏi. → Đúng vì bài nhấn mạnh lifelong learning (học tập suốt đời).
D. They will work less – Họ sẽ làm việc ít hơn. → Sai vì bài không đưa ra nhận định này.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'They will only work from home', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'They must stop using AI', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'They will need to keep learning', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'They will work less', false);

    -- Question 40
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 40, 'What is the author''s attitude toward technology?', 'Đáp án B
Hopeful and balanced. – Lạc quan và có cái nhìn cân bằng.
A. Negative and fearful – Tiêu cực và sợ hãi. → Sai vì tác giả không phản đối công nghệ.
B. Hopeful and balanced – Lạc quan và cân bằng. → Đúng vì tác giả nhìn nhận cả lợi ích lẫn thách thức của công nghệ và tin rằng con người có thể thích nghi.
C. Confused and worried – Bối rối và lo lắng. → Sai vì tác giả thể hiện quan điểm rõ ràng.
D. Uninterested and bored – Không quan tâm và buồn chán. → Sai vì tác giả đánh giá công nghệ có vai trò quan trọng đối với tương lai.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Negative and fearful', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Hopeful and balanced', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Confused and worried', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Uninterested and bored', false);

    -- PRACTICE TEST 4
    INSERT INTO tests (title, description, time_limit_minutes, shuffle_questions, shuffle_options, is_published)
    VALUES ('Practice Test 4', 'Đề thi trắc nghiệm Kỹ năng Đọc Tiếng Anh 3 - Gồm 4 phần đọc và 40 câu hỏi.', 60, true, true, true)
    RETURNING id INTO v_test_id;

    -- Part 1: Holiday Horror Stories
    INSERT INTO test_parts (test_id, part_number, title, passage_text)
    VALUES (v_test_id, 1, 'Part 1: Holiday Horror Stories', 'It had looked great in the brochure. It''s true that there hadn''t been pictures of the cottage, but there were photographs of the sea, empty beaches next to the cottage for the children to play on, and nice long walks in the nearby forest with the dog.

We arrived late at night after a six-hour drive. It''s normally three hours from London, but there had been a delay on the motorway. The address on the booking form said "Green Tree Cottage" on the Old Farm Road. In fact, we had to drive across a field to reach the place. Inside, the cottage wasn''t very clean. In fact, it was full of furniture, books, pictures and objects in boxes. It was like someone else lived here. Anyway, it was late and we went to bed. I woke up once because I thought I heard someone in the house. In the morning, my daughter said there were clothes in her wardrobe. She was right. It was full of clothes. We emptied the wardrobe and put the clothes in a box.

Later that day we had been to the beach (which wasn''t next to the house but about two miles away) and when we got back the clothes were back in the wardrobe. My daughter''s clothes were in the box on top of the wardrobe. I wanted to leave but my husband thought there was a simple explanation.

In the evening, as it got darker, I noticed a light at the end of the field. We walked across with the dog and we saw a small shed among the trees. We knocked down on the door and a man appeared. He was the owner of the holiday cottage and lived in his shed when visitors stayed. He also asked us not to move his clothes because he needed to use the house from time to time. I couldn''t believe it! Next day, we loaded the car and we left.')
    RETURNING id INTO v_part_id;

    -- Question 1
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 1, 'What had made the woman choose the cottage?', 'Đáp án D. Great pictures in the brochure
A. Nice cottage – Ngôi nhà đẹp. → Sai vì bài đọc không có hình ảnh ngôi nhà.
B. Empty beach – Bãi biển vắng. → Sai vì đây chỉ là một trong những điểm hấp dẫn được giới thiệu.
C. Long walk in the forest – Những chuyến đi bộ dài trong rừng. → Sai vì đây cũng chỉ là một tiện ích được quảng cáo.
D. Great pictures in the brochure – Những bức ảnh đẹp trong tờ quảng cáo. → Đúng vì ngay đầu bài có câu It had looked great in the brochure (Nó trông rất tuyệt trong tờ quảng cáo).')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'nice cottage', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'empty beach', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'long walk in the forest', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'great pictures in the brochure', true);

    -- Question 2
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 2, 'Why did the journey take longer than expected?', 'Đáp án A. Because of the delay on the motorway
A. Because of the delay on the motorway – Vì sự chậm trễ trên đường cao tốc. → Đúng vì bài viết nói rõ there had been a delay on the motorway.
B. Because of the rain – Vì trời mưa. → Sai vì bài không đề cập đến mưa.
C. Because of the trees – Vì những cái cây. → Sai vì không liên quan đến thời gian di chuyển.
D. Because of the night – Vì trời tối. → Sai vì họ đến vào ban đêm nhưng nguyên nhân đi lâu hơn là do tắc nghẽn đường.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Because of the delay on the motorway', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Because of the rain', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Because of the trees', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Because of the night', false);

    -- Question 3
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 3, 'Why did it look like someone was living in the cottage?', 'Đáp án B. As it was full of furniture
A. As it was full of clothes – Vì nó đầy quần áo. → Sai vì quần áo được nhắc đến trong tủ của con gái.
B. As it was full of furniture – Vì nó có rất nhiều đồ nội thất. → Đúng vì trong nhà có đầy đồ đạc, sách, tranh ảnh và các vật dụng được đóng trong hộp.
C. As it was full of food – Vì nó đầy thức ăn. → Sai vì bài không đề cập đến thức ăn.
D. As it was full of clean things – Vì nó đầy những đồ vật sạch sẽ. → Sai vì ngôi nhà thực tế không sạch sẽ.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'As it was full of clothes.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'As it was full of furniture.', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'As it was full of food.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'As it was full of clean things.', false);

    -- Question 4
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 4, 'Why did she wake up in the first night?', 'Đáp án C. Someone was in the house
A. Someone knocked at the door – Có người gõ cửa. → Sai vì việc gõ cửa xảy ra vào buổi tối sau đó.
B. Some cats cried – Một vài con mèo kêu. → Sai vì bài không nhắc đến mèo.
C. Someone was in the house – Có ai đó ở trong nhà. → Đúng vì người phụ nữ tỉnh giấc do nghĩ rằng mình nghe thấy tiếng người trong nhà: I thought I heard someone in the house.
D. Someone called her – Có người gọi cô ấy. → Sai vì không có thông tin này trong bài.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Someone knocked at the door.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Some cats cried.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Someone was in the house.', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Someone called her.', false);

    -- Question 5
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 5, 'What was in her daughter''s bedroom wardrobe?', '·  A. Clothes – Quần áo. → Đúng vì buổi sáng, con gái phát hiện có quần áo trong tủ của mình: there were clothes in her wardrobe.
·  ·  B. Objects – Các đồ vật. → Sai vì bài không nói cụ thể có đồ vật trong tủ.
·  ·  C. Photographs – Những bức ảnh. → Sai vì ảnh chỉ được nhắc đến trong phần giới thiệu quảng cáo.
·  ·  D. Souvenirs – Đồ lưu niệm. → Sai vì bài không đề cập đến đồ lưu niệm.
·')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Clothes', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Objects', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Photographs', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Souvenirs', false);

    -- Question 6
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 6, 'What was strange when they returned from a day at the beach?', 'Đáp án D. The wardrobe
A. The door – Cánh cửa. → Sai vì cánh cửa không có thay đổi bất thường.
B. The window – Cửa sổ. → Sai vì bài không nhắc đến cửa sổ.
C. The box – Chiếc hộp. → Sai vì chiếc hộp chỉ là nơi họ cất quần áo.
D. The wardrobe – Tủ quần áo. → Đúng vì quần áo đã được chuyển vào hộp nhưng khi họ trở về, chúng lại xuất hiện trong tủ như cũ.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'The door', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'The window', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'The box', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'The wardrobe', true);

    -- Question 7
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 7, 'When did the woman see the light?', 'Đáp án B. That evening
A. Two days later – Hai ngày sau. → Sai vì không có thông tin này.
B. That evening – Vào buổi tối hôm đó. → Đúng vì bài viết nói In the evening, as it got darker, I noticed a light at the end of the field.
C. One hour later – Một giờ sau. → Sai vì bài không xác định khoảng thời gian một giờ.
D. At dinner time – Vào giờ ăn tối. → Sai vì bài chỉ nói vào buổi tối, không nói cụ thể giờ ăn tối.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Two days later', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'That evening', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'One hour later', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'At dinner time', false);

    -- Question 8
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 8, 'Who was staying across the field from them?', 'Đáp án A. A man
A. A man – Một người đàn ông. → Đúng vì khi họ đi đến căn nhà nhỏ giữa những cái cây, một người đàn ông xuất hiện.
B. A woman – Một người phụ nữ. → Sai vì người xuất hiện là đàn ông.
C. The owner of the field – Chủ sở hữu cánh đồng. → Sai vì bài nói người đàn ông là chủ ngôi nhà nghỉ dưỡng, không phải chủ cánh đồng.
D. A cowboy – Một chàng cao bồi. → Sai vì không có chi tiết nào nói người đàn ông là cao bồi.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'a man', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'a woman', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'the owner of the field', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'a cowboy', false);

    -- Question 9
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 9, 'Why was the woman surprised?', 'Đáp án A. The owner would use the cottage with them
A. The owner would use the cottage with them – Chủ nhà sẽ sử dụng chung ngôi nhà với họ. → Đúng vì người đàn ông tiết lộ mình vẫn sử dụng ngôi nhà và để quần áo cá nhân trong tủ khi có khách thuê.
B. The owner asked them to leave – Chủ nhà yêu cầu họ rời đi. → Sai vì ông ấy không trực tiếp yêu cầu họ rời đi.
C. The owner invited them for the dinner – Chủ nhà mời họ ăn tối. → Sai vì không có lời mời ăn tối.
D. The owner lowered the rent – Chủ nhà giảm tiền thuê. → Sai vì bài không đề cập đến tiền thuê.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'The owner would use the cottage with them.', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'The owner asked them to leave.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'The owner invited them for the dinner.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'The owner lowered the rent.', false);

    -- Question 10
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 10, 'When did they leave?', 'Đáp án B. The next day
A. On that day – Ngay ngày hôm đó. → Sai vì sau khi gặp chủ nhà, họ không rời đi ngay.
B. The next day – Ngày hôm sau. → Đúng vì câu cuối bài viết: Next day, we loaded the car and we left (Ngày hôm sau, chúng tôi chất đồ lên xe và rời đi).
C. On that night – Vào đêm hôm đó. → Sai vì họ vẫn ở lại qua đêm.
D. After breakfast – Sau bữa sáng. → Sai vì bài không xác định thời điểm rời đi là sau bữa sáng.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'On that day', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'The next day', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'On that night', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'After breakfast', false);

    -- Part 2: Effects of Global Warming on Wildlife
    INSERT INTO test_parts (test_id, part_number, title, passage_text)
    VALUES (v_test_id, 2, 'Part 2: Effects of Global Warming on Wildlife', 'Plants and animals will find it difficult to escape from or adjust to the effect of global warming. Scientists have already observed shifts in the lifecycles of many plants and animals, such as flowers blooming earlier and birds hatching earlier in the spring. Many species have begun shifting where they live or their annual migration patterns due to warmer temperatures.

With further warming, animals will tend to migrate toward the poles and up mountainsides toward higher elevations. Plants will also attempt to shift their ranges, seeking new areas as old habitats grow too warm. In many places, however, human development will prevent these shifts. Species that find cities or farmland blocking their way north or south may become extinct. Species living in unique ecosystems, such as those found in polar and mountaintop regions, are especially at risk because migration to new habitats is not possible. For example, polar bears and marine mammals in the Arctic are already threatened by dwindling sea ice but have nowhere farther to go.

Projecting species extinction due to global warming is extremely difficult. Some scientists have estimated that 20 to 50 percent of species could be committed to extinction with 2 to 3 degrees Celsius of further warming. The rate of warming, not just the magnitude, is extremely important for plants and animals. Some species and even entire ecosystems, such as certain types of forest, many not be able to adjust quickly enough and may disappear.

Ocean ecosystems, especially fragile ones like coral reefs, will also be affected by global warming. Warmer ocean temperatures can cause coral to "bleach", a state which if prolonged will lead to the death of the coral. Scientists estimate that even 1 degree Celsius of additional warming could lead to widespread bleaching and death of coral reefs around the world. Also increasing carbon dioxide in the atmosphere enters the ocean and increases the acidity of ocean waters. This acidification further stresses ocean ecosystems.')
    RETURNING id INTO v_part_id;

    -- Question 11
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 11, 'Scientists have observed that warmer temperatures in the spring cause flowers to……', 'Đáp án B. Bloom earlier
A. Die instantly – Chết ngay lập tức. → Sai vì bài không nói hoa chết khi nhiệt độ tăng.
B. Bloom earlier – Nở hoa sớm hơn. → Đúng vì đoạn 1 có câu flowers blooming earlier (hoa nở sớm hơn).
C. Become lighter – Trở nên nhạt màu hơn. → Sai vì bài không đề cập đến màu sắc của hoa.
D. Lose color – Mất màu. → Sai vì nội dung không nói hoa bị mất màu.
Từ khóa: Bloom earlier = Nở hoa sớm hơn.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'die instantly', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'bloom earlier', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'become lighter', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'lose color', false);

    -- Question 12
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 12, 'According to paragraph 2, when their habitats grow warmer, animals tend to move ……… elevations.', 'Đáp án D. Toward the poles and up mountainsides toward higher elevations
A. South – eastwards and down mountainsides toward lower – Về phía đông nam và xuống vùng núi thấp hơn. → Sai vì ngược với hướng di chuyển trong bài.
B. North – westwards and up mountainsides toward higher – Về phía tây bắc và lên vùng núi cao hơn. → Sai vì bài không đề cập hướng tây bắc.
C. Toward the North Pole and down mountainsides toward lower – Về phía Bắc Cực và xuống vùng núi thấp hơn. → Sai vì động vật di chuyển lên độ cao cao hơn, không phải thấp hơn.
D. Toward the poles and up mountainsides toward higher – Về phía hai cực và lên vùng núi cao hơn. → Đúng vì đoạn 2 viết rõ migrate toward the poles and up mountainsides toward higher elevations.
Từ khóa: Poles = Hai cực; higher elevations = Độ cao lớn hơn.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'south – eastwards and down mountainsides toward lower', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'north – westwards and up mountainsides toward higher', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'toward the North Pole and down mountainsides toward lower', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'toward the poles and up mountainsides toward higher', true);

    -- Question 13
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 13, 'The pronoun "those" in paragraph 2 refers to ………', 'Đáp án A. Species
A. Species – Các loài sinh vật. → Đúng vì câu trước nhắc đến Species living in unique ecosystems (các loài sống trong hệ sinh thái đặc biệt).
B. Ecosystems – Các hệ sinh thái. → Sai vì đây là nơi sinh sống của các loài.
C. Habitats – Môi trường sống. → Sai vì không phải danh từ mà đại từ đang thay thế.
D. Areas – Các khu vực. → Sai vì không phù hợp với cấu trúc và ý nghĩa câu.
Mẹo: Khi gặp câu hỏi What does "those" refer to?, hãy nhìn ngược lại câu trước để tìm danh từ phù hợp.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'species', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'eco systems', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'habitats', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Areas', false);

    -- Question 14
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 14, 'The phrase "dwindling sea ice" in paragraph 2 refers to ………', 'Đáp án C. The melting ice in the Arctic
A. The frozen water in the Arctic – Nước đóng băng ở Bắc Cực. → Sai vì chỉ mô tả băng, chưa thể hiện sự suy giảm.
B. The violent Arctic Ocean – Đại dương Bắc Cực dữ dội. → Sai vì không liên quan đến nghĩa của cụm từ.
C. The melting ice in the Arctic – Băng ở Bắc Cực đang tan chảy. → Đúng vì dwindling có nghĩa là giảm dần, thu hẹp; trong ngữ cảnh này chỉ sự suy giảm diện tích băng biển.
D. The cold ice in the Arctic – Băng lạnh ở Bắc Cực. → Sai vì không thể hiện tình trạng băng đang suy giảm.
Từ khóa: Dwindling = Giảm dần; sea ice = Băng biển.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'the frozen water in the Artic.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'the violent Arctic Ocean.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'the melting ice in the Arctic.', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'the cold ice in the Arctic.', false);

    -- Question 15
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 15, 'It is mentioned in the passage that if the global temperature rose by 2 or 3 degrees Celsius, …………', 'Đáp án D. 20 to 50 percent of species could become extinct
A. Half of the earth''s surface would be flooded – Một nửa bề mặt Trái Đất sẽ bị ngập. → Sai vì bài không đề cập đến tình trạng ngập lụt.
B. The sea level would rise by 20 – Mực nước biển sẽ tăng 20. → Sai vì không có thông tin về mực nước biển.
C. Water supply would decrease by 50 – Nguồn cung cấp nước sẽ giảm 50%. → Sai vì bài không đề cập đến nguồn nước.
D. 20 to 50 percent of species could become extinct – 20–50% số loài có thể bị tuyệt chủng. → Đúng vì đoạn 3 nêu rõ 20 to 50 percent of species could be committed to extinction.
Từ khóa: Extinction = Sự tuyệt chủng; species = Các loài.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'half of the earth''s surface would be flooded', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'the sea level would rise by 20', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'water supply would decrease by 50', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', '20 to 50 percent of species could become extinct', true);

    -- Question 16
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 16, 'According to the passage, if some species are not able to adjust quickly to warmer temperatures, …………', 'Đáp án A. They may be endangered
A. They may be endangered – Chúng có thể bị đe dọa tuyệt chủng. → Đúng vì đoạn 3 nói một số loài không thích nghi kịp có thể biến mất.
B. They can begin to develop – Chúng có thể bắt đầu phát triển. → Sai vì bài nói về nguy cơ biến mất chứ không phải phát triển.
C. They will certainly need water – Chúng chắc chắn cần nước. → Sai vì đây không phải hậu quả được đề cập.
D. They move to tropical forests – Chúng di chuyển đến rừng nhiệt đới. → Sai vì bài không nói chúng sẽ chuyển đến rừng nhiệt đới.
Từ khóa: Adjust = Thích nghi; endangered = Bị đe dọa; disappear = Biến mất.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'they may be endangered', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'they can begin to develop', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'they will certainly need water', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'they move to tropical forests', false);

    -- Question 17
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 17, 'The word "fragile" in paragraph 4 most probably means …………', 'A. Very large – Rất lớn. → Sai vì không liên quan đến nghĩa của fragile.
B. Easily damaged – Dễ bị tổn thương, dễ bị phá hủy. → Đúng vì bài sử dụng từ này để mô tả các hệ sinh thái đại dương nhạy cảm như rạn san hô.
C. Rather strong – Khá mạnh mẽ. → Sai vì trái nghĩa với fragile.
D. Pretty hard – Khá cứng. → Sai vì không phù hợp với ngữ cảnh.
Từ khóa: Fragile = Mong manh, dễ bị tổn thương.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'very large', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'easily damaged', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'rather strong', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'pretty hard', false);

    -- Question 18
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 18, 'The bleaching of coral reefs as mentioned in paragraph 4 indicates …………', 'Đáp án D. The slow death of coral reefs
A. The water absorption of coral reefs – Sự hấp thụ nước của rạn san hô. → Sai vì bài không nói về quá trình hấp thụ nước.
B. The quick growth of marine mammals – Sự phát triển nhanh của động vật có vú dưới biển. → Sai vì không liên quan đến hiện tượng tẩy trắng san hô.
C. The blooming phase of sea weeds – Giai đoạn nở hoa của rong biển. → Sai vì bài không đề cập đến rong biển.
D. The slow death of coral reefs – Sự chết dần của các rạn san hô. → Đúng vì đoạn 4 nói san hô bị tẩy trắng, nếu tình trạng kéo dài sẽ dẫn đến chết san hô.
Từ khóa: Bleaching = Hiện tượng tẩy trắng; coral reefs = Rạn san hô.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'the water absorption of coral reefs.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'the quick growth of marine mammals.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'the blooming phase of sea weeds.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'the slow death of coral reefs.', true);

    -- Question 19
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 19, 'The level of acidity in the ocean is increased by …………', 'Đáp án A. The rising amount of carbon dioxide entering the ocean
A. The rising amount of carbon dioxide entering the ocean – Lượng khí CO₂ đi vào đại dương tăng lên. → Đúng vì đoạn 4 nói CO₂ trong khí quyển đi vào đại dương và làm tăng độ axit của nước biển.
B. The decrease of acidity of the pole – Sự giảm độ axit ở vùng cực. → Sai vì bài không đề cập đến điều này.
C. The extinction of species in coastal – Sự tuyệt chủng của các loài ven biển. → Sai vì đây không phải nguyên nhân làm tăng độ axit.
D. The loss of acidity in the atmosphere around the world – Sự mất đi tính axit trong khí quyển toàn cầu. → Sai vì bài nói về CO₂ đi vào nước biển, không phải sự thay đổi độ axit khí quyển.
Từ khóa: Carbon dioxide (CO₂) = Khí cacbon đioxit; acidity = Độ axit.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'the rising amount of carbon dioxide entering the ocean', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'the decrease of acidity of the pole', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'the extinction of species in coastal', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'the loss of acidity in the atmosphere around the world', false);

    -- Question 20
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 20, 'The level of acidity in the ocean is increased by …………', 'Đáp án A. The rising amount of carbon dioxide entering the ocean
A. The rising amount of carbon dioxide entering the ocean – Lượng CO₂ đi vào đại dương tăng lên. → Đúng vì đoạn 4 nêu rõ CO₂ trong khí quyển đi vào nước biển, làm tăng tính axit.
B. The decrease of acidity of the pole – Sự giảm độ axit ở vùng cực. → Sai vì không có thông tin này trong bài.
C. The extinction of species in coastal – Sự tuyệt chủng của các loài ven biển. → Sai vì đây không phải nguyên nhân gây axit hóa đại dương.
D. The loss of acidity in the atmosphere around the world – Sự giảm tính axit trong khí quyển toàn cầu. → Sai vì không đúng nội dung đoạn văn.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'the rising amount of carbon dioxide entering the ocean', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'the decrease of acidity of the pole', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'the extinction of species in coastal', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'the loss of acidity in the atmosphere around the world', false);

    -- Part 3: Environmental Challenges and Climate Cha
    INSERT INTO test_parts (test_id, part_number, title, passage_text)
    VALUES (v_test_id, 3, 'Part 3: Environmental Challenges and Climate Change', 'In recent decades, climate change has become one of the most urgent issues facing our planet. As global temperatures rise, the effects can be seen in melting glaciers, rising sea levels, and more frequent extreme weather events such as floods, hurricanes, and heatwaves. These changes affect not only the environment but also human health, agriculture, and the global economy.

One of the main causes of climate change is the emission of greenhouse gases like carbon dioxide and methane. These gases trap heat in the Earth’s atmosphere, leading to global warming. Human activities—especially the burning of fossil fuels such as coal, oil, and gas—are responsible for a large portion of these emissions.

Governments and organizations around the world have introduced measures to reduce carbon footprints. These include promoting renewable energy sources like wind and solar power, encouraging energy-efficient buildings, and setting targets for reducing emissions. In addition, there is a growing movement among individuals to live more sustainably by recycling, using public transport, and reducing waste.

However, progress has been slow, and many scientists warn that more aggressive action is needed. Some countries are still heavily dependent on fossil fuels, and there is often resistance to change due to economic or political interests. Nevertheless, there is hope. Technological innovations, increased awareness, and international cooperation could help slow down climate change and protect the planet for future generations.

Addressing climate change requires both global collaboration and local action. Everyone has a role to play—from governments making policy decisions to individuals making eco-friendly choices in daily life. The future depends on the steps we take today.')
    RETURNING id INTO v_part_id;

    -- Question 21
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 21, 'What is the main idea of the passage?', 'Đáp án C. Climate change is a serious global issue
A. Global warming is a myth – Sự nóng lên toàn cầu là chuyện hoang đường. → Sai vì bài đọc khẳng định biến đổi khí hậu là vấn đề nghiêm trọng.
B. Climate change only affects the weather – Biến đổi khí hậu chỉ ảnh hưởng đến thời tiết. → Sai vì nó còn ảnh hưởng đến sức khỏe, nông nghiệp và kinh tế.
C. Climate change is a serious global issue – Biến đổi khí hậu là vấn đề toàn cầu nghiêm trọng. → Đúng vì toàn bài nói về nguyên nhân, hậu quả và giải pháp ứng phó với biến đổi khí hậu.
D. Fossil fuels are harmless – Nhiên liệu hóa thạch vô hại. → Sai vì việc đốt nhiên liệu hóa thạch là nguyên nhân gây phát thải khí nhà kính.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Global warming is a myth', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Climate change only affects the weather', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Climate change is a serious global issue', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Fossil fuels are harmless', false);

    -- Question 22
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 22, 'Which of the following is a result of climate change?', 'Đáp án D. More extreme weather
A. Decrease in sea levels – Mực nước biển giảm. → Sai vì bài đọc nói mực nước biển đang dâng cao.
B. Fewer storms – Ít bão hơn. → Sai vì bài đề cập các hiện tượng thời tiết cực đoan xảy ra thường xuyên hơn.
C. Stable global temperatures – Nhiệt độ toàn cầu ổn định. → Sai vì nhiệt độ toàn cầu đang tăng lên.
D. More extreme weather – Thời tiết cực đoan nhiều hơn. → Đúng vì đoạn 1 nhắc đến lũ lụt, bão và các đợt nắng nóng xảy ra thường xuyên hơn.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Decrease in sea levels', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Fewer storms', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Stable global temperatures', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'More extreme weather', true);

    -- Question 23
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 23, 'What are greenhouse gases responsible for?', 'Đáp án C. Trapping heat in the atmosphere
A. Cooling the earth – Làm Trái Đất lạnh đi. → Sai vì khí nhà kính giữ nhiệt, không làm Trái Đất lạnh đi.
B. Stopping rainfall – Ngăn chặn mưa. → Sai vì bài không đề cập đến việc khí nhà kính ngăn mưa.
C. Trapping heat in the atmosphere – Giữ nhiệt trong khí quyển. → Đúng vì đoạn 2 viết These gases trap heat in the Earth''s atmosphere.
D. Reducing pollution – Giảm ô nhiễm. → Sai vì khí nhà kính góp phần gây ra hiện tượng nóng lên toàn cầu.
Từ khóa: Greenhouse gases = Khí nhà kính; trap heat = Giữ nhiệt.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Cooling the earth', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Stopping rainfall', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Trapping heat in the atmosphere', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Reducing pollution', false);

    -- Question 24
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 24, 'What is one major source of greenhouse gas emissions?', 'Đáp án B. Burning fossil fuels
A. Fishing – Đánh bắt cá. → Sai vì bài không đề cập đây là nguồn phát thải chính.
B. Burning fossil fuels – Đốt nhiên liệu hóa thạch. → Đúng vì đoạn 2 nói hoạt động đốt than, dầu và khí đốt tạo ra phần lớn lượng khí thải.
C. Riding bicycles – Đi xe đạp. → Sai vì đi xe đạp giúp giảm lượng khí thải từ phương tiện giao thông.
D. Planting trees – Trồng cây. → Sai vì trồng cây có thể giúp hấp thụ CO₂, không phải nguồn phát thải chính.
Từ khóa: Fossil fuels = Nhiên liệu hóa thạch.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Fishing', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Burning fossil fuels', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Riding bicycles', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Planting trees', false);

    -- Question 25
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 25, 'The phrase "carbon footprint" refers to:', 'Đáp án B. The total greenhouse gases produced by an activity
A. The amount of money people spend on gas – Số tiền mọi người chi cho xăng. → Sai vì carbon footprint không nói về chi phí tiền bạc.
B. The total greenhouse gases produced by an activity – Tổng lượng khí nhà kính được tạo ra bởi một hoạt động. → Đúng vì đây là nghĩa của dấu chân carbon, thể hiện lượng phát thải khí nhà kính.
C. The damage cars do to roads – Thiệt hại ô tô gây ra cho đường sá. → Sai vì không liên quan đến lượng khí thải.
D. The carbon found in forests – Lượng carbon có trong rừng. → Sai vì không diễn đạt ý nghĩa của cụm từ này.
Từ khóa: Carbon footprint = Dấu chân carbon / Lượng phát thải khí nhà kính.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'The amount of money people spend on gas', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'The total greenhouse gases produced by an activity', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'The damage cars do to roads', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'The carbon found in forests', false);

    -- Question 26
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 26, 'What does the word "sustainably" mean in this context?', 'Đáp án C. In an environmentally responsible way
A. In a short-term way – Theo cách ngắn hạn. → Sai vì không thể hiện ý nghĩa phát triển bền vững.
B. In a violent way – Theo cách bạo lực. → Sai vì không liên quan đến môi trường.
C. In an environmentally responsible way – Theo cách có trách nhiệm với môi trường. → Đúng vì bài đề cập tái chế, sử dụng phương tiện công cộng và giảm rác thải để bảo vệ môi trường.
D. In an expensive way – Theo cách tốn kém. → Sai vì từ này không nói về chi phí.
Từ khóa: Sustainably = Một cách bền vững, thân thiện với môi trường.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'In a short-term way', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'In a violent way', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'In an environmentally responsible way', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'In an expensive way', false);

    -- Question 27
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 27, 'What is one action individuals can take to help the environment?', 'Đáp án C. Recycle and reduce waste
A. Fly more frequently – Đi máy bay thường xuyên hơn. → Sai vì có thể làm tăng lượng khí thải.
B. Use more plastic – Sử dụng nhiều nhựa hơn. → Sai vì làm tăng rác thải nhựa và gây ô nhiễm.
C. Recycle and reduce waste – Tái chế và giảm rác thải. → Đúng vì đoạn 3 trực tiếp đề cập đến việc tái chế và giảm chất thải để sống bền vững hơn.
D. Drive faster – Lái xe nhanh hơn. → Sai vì không phải hành động bảo vệ môi trường được đề cập.
Từ khóa: Recycle = Tái chế; reduce waste = Giảm rác thải.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Fly more frequently', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Use more plastic', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Recycle and reduce waste', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Drive faster', false);

    -- Question 28
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 28, 'What does "there is hope" suggest about the author''s attitude?', 'Đáp án B. Optimistic
A. Confused – Bối rối. → Sai vì tác giả có quan điểm rõ ràng về vấn đề biến đổi khí hậu.
B. Optimistic – Lạc quan. → Đúng vì tác giả tin rằng công nghệ, nhận thức và hợp tác quốc tế có thể giúp làm chậm biến đổi khí hậu.
C. Angry – Tức giận. → Sai vì tác giả không thể hiện sự tức giận.
D. Unconcerned – Không quan tâm. → Sai vì tác giả nhấn mạnh đây là vấn đề cấp bách cần hành động.
Từ khóa: Hope = Hy vọng; Optimistic = Lạc quan.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Confused', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Optimistic', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Angry', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Unconcerned', false);

    -- Question 29
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 29, 'What is a challenge in fighting climate change?', 'Đáp án C. Resistance due to economic interests
A. Too many people recycling – Quá nhiều người tái chế. → Sai vì tái chế là hành động tích cực.
B. Lack of fossil fuels – Thiếu nhiên liệu hóa thạch. → Sai vì bài nói một số quốc gia vẫn phụ thuộc nhiều vào nhiên liệu hóa thạch.
C. Resistance due to economic interests – Sự phản đối do lợi ích kinh tế. → Đúng vì đoạn 4 nói một số quốc gia và tổ chức còn chống lại sự thay đổi vì lợi ích kinh tế hoặc chính trị.
D. Too much international support – Quá nhiều sự hỗ trợ quốc tế. → Sai vì hợp tác quốc tế được xem là giải pháp tích cực.
Từ khóa: Resistance = Sự phản đối; economic interests = Lợi ích kinh tế.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Too many people recycling', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Lack of fossil fuels', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Resistance due to economic interests', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Too much international support', false);

    -- Question 30
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 30, 'What can be inferred from the passage?', 'Đáp án C. Everyone must take part in the solution
A. Only scientists can fix the problem – Chỉ các nhà khoa học mới có thể giải quyết vấn đề. → Sai vì bài nói cả chính phủ, tổ chức và cá nhân đều có vai trò.
B. Climate change is unstoppable – Biến đổi khí hậu không thể ngăn chặn. → Sai vì tác giả tin rằng con người có thể làm chậm biến đổi khí hậu.
C. Everyone must take part in the solution – Mọi người phải tham gia vào giải pháp. → Đúng vì đoạn cuối nhấn mạnh tất cả mọi người đều có vai trò, từ chính phủ đến từng cá nhân.
D. Nothing can be done – Không thể làm gì được. → Sai vì bài đưa ra nhiều biện pháp như sử dụng năng lượng tái tạo, tái chế và giảm rác thải.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Only scientists can fix the problem', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Climate change is unstoppable', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Everyone must take part in the solution', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Nothing can be done', false);

    -- Part 4: The Power of Social Media
    INSERT INTO test_parts (test_id, part_number, title, passage_text)
    VALUES (v_test_id, 4, 'Part 4: The Power of Social Media', 'Social media has transformed the way people connect, share, and communicate. Platforms like Facebook, Instagram, Twitter, and TikTok have become essential tools for both personal and professional life. They allow users to share opinions, photos, videos, and news instantly with a global audience.

One of the most powerful aspects of social media is its ability to spread information quickly. While this can be beneficial in emergencies or social movements, it also creates problems. Misinformation and fake news can spread just as easily, leading to confusion or even harm. As a result, users must learn to think critically and verify sources before sharing content.

Social media has also played a major role in shaping public opinion. Influencers, celebrities, and everyday users alike can spark debates, start trends, or bring attention to social and political issues. At the same time, algorithms on these platforms often show users content similar to what they already like, creating "echo chambers" where opposing views are rarely seen.

Businesses also benefit from social media. Through targeted advertising and brand engagement, companies can reach specific audiences and interact with customers directly. However, this also raises privacy concerns. Many users are unaware of how much personal data they share online and how that data is used for marketing or other purposes.

Despite the drawbacks, social media continues to grow and evolve. When used thoughtfully, it can be a tool for learning, activism, and global connection. But users must be aware of its influence and take responsibility for how they engage with it.')
    RETURNING id INTO v_part_id;

    -- Question 31
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 31, 'What is the main idea of the passage?', 'Đáp án đúng: C
Social media has both benefits and challenges – Mạng xã hội có cả lợi ích và thách thức.
A. Social media is only harmful – Mạng xã hội chỉ có hại. Sai vì bài đọc đề cập cả lợi ích của mạng xã hội.
B. Social media replaces real life – Mạng xã hội thay thế cuộc sống thực. Sai vì bài không nói mạng xã hội thay thế cuộc sống.
C. Social media has both benefits and challenges – Đúng vì bài nói về lợi ích như kết nối, chia sẻ thông tin và những hạn chế như tin giả, quyền riêng tư.
D. Social media should be banned – Mạng xã hội nên bị cấm. Sai vì tác giả khuyến khích sử dụng mạng xã hội có trách nhiệm.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Social media is only harmful', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Social media replaces real life', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Social media has both benefits and challenges', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Social media should be banned', false);

    -- Question 32
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 32, 'How does social media help during emergencies?', 'Đáp án đúng: B
It spreads information quickly – Nó lan truyền thông tin nhanh chóng.
A. It entertains people – Nó giải trí cho mọi người. Sai vì đây không phải lợi ích được đề cập trong tình huống khẩn cấp.
B. It spreads information quickly – Đúng vì bài đọc nói mạng xã hội có khả năng lan truyền thông tin nhanh, hữu ích trong trường hợp khẩn cấp.
C. It blocks fake news – Nó chặn tin giả. Sai vì bài nói tin giả cũng có thể lan truyền nhanh chóng.
D. It slows communication – Nó làm chậm giao tiếp. Sai vì mạng xã hội giúp truyền tải thông tin tức thời.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'It entertains people', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'It spreads information quickly', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'It blocks fake news', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'It slows communication', false);

    -- Question 33
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 33, 'What is one danger of fast information sharing?', 'Đáp án đúng: C
It can spread false information – Nó có thể lan truyền thông tin sai lệch.
A. It improves memory – Nó cải thiện trí nhớ. Sai vì bài không đề cập đến trí nhớ.
B. It increases attention – Nó làm tăng sự chú ý. Sai vì đây không phải nguy cơ được nhắc đến.
C. It can spread false information – Đúng vì bài nói thông tin sai lệch và tin giả có thể lan truyền dễ dàng.
D. It makes people read more books – Nó khiến mọi người đọc nhiều sách hơn. Sai vì không có thông tin này trong bài.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'It improves memory', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'It increases attention', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'It can spread false information', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'It makes people read more books', false);

    -- Question 34
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 34, 'What are "echo chambers"?', 'Đáp án đúng: D
Environments where only similar views are shown – Môi trường nơi chỉ hiển thị những quan điểm tương tự nhau.
A. Rooms used for interviews – Những căn phòng dùng để phỏng vấn. Sai vì đây không phải nghĩa của thuật ngữ trong bài.
B. Places to store data – Nơi lưu trữ dữ liệu. Sai vì bài không nói về kho dữ liệu.
C. Algorithms that block all news – Thuật toán chặn tất cả tin tức. Sai vì thuật toán không chặn toàn bộ tin tức.
D. Environments where only similar views are shown – Đúng vì thuật toán thường hiển thị nội dung phù hợp với sở thích sẵn có, khiến người dùng ít tiếp xúc với ý kiến trái chiều.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Rooms used for interviews', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Places to store data', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Algorithms that block all news', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Environments where only similar views are shown', true);

    -- Question 35
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 35, 'How do businesses use social media?', 'Đáp án đúng: C
To target audiences and build relationships – Để nhắm đến đối tượng khách hàng và xây dựng mối quan hệ.
A. To avoid customers – Để tránh khách hàng. Sai vì doanh nghiệp muốn tiếp cận khách hàng chứ không né tránh họ.
B. To reduce their employees – Để cắt giảm nhân viên. Sai vì bài không đề cập đến việc giảm nhân sự.
C. To target audiences and build relationships – Đúng vì doanh nghiệp sử dụng quảng cáo có mục tiêu và tương tác trực tiếp với khách hàng.
D. To replace websites – Để thay thế website. Sai vì bài không nói mạng xã hội được dùng để thay thế website.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'To avoid customers', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'To reduce their employees', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'To target audiences and build relationships', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'To replace websites', false);

    -- Question 36
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 36, 'The phrase "verify sources" means:', 'Đáp án đúng: B
Double-check where information comes from – Kiểm tra lại thông tin đến từ đâu.
A. Trust everything you read – Tin tưởng mọi thứ bạn đọc. Sai vì "verify" có nghĩa là xác minh, không phải tin tưởng ngay lập tức.
B. Double-check where information comes from – Đúng vì bài khuyên người dùng kiểm tra nguồn thông tin trước khi chia sẻ.
C. Block social media – Chặn mạng xã hội. Sai vì không liên quan đến việc xác minh nguồn tin.
D. Delete all news – Xóa tất cả tin tức. Sai vì bài không yêu cầu xóa tin tức.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Trust everything you read', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Double-check where information comes from', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Block social media', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Delete all news', false);

    -- Question 37
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 37, 'What concern is raised about data?', 'Đáp án đúng: B
People don''t understand online privacy – Mọi người không hiểu rõ về quyền riêng tư trên mạng.
A. People have too much memory – Mọi người có quá nhiều trí nhớ. Sai vì không liên quan đến dữ liệu cá nhân.
B. People don''t understand online privacy – Đúng vì bài nói nhiều người không nhận thức được lượng dữ liệu cá nhân họ chia sẻ và cách dữ liệu đó được sử dụng.
C. Companies give away personal photos – Các công ty phát tán ảnh cá nhân. Sai vì bài không khẳng định các công ty phát tán ảnh.
D. Data slows down the internet – Dữ liệu làm chậm Internet. Sai vì bài đang đề cập đến quyền riêng tư, không phải tốc độ mạng.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'People have too much memory', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'People don''t understand online privacy', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Companies give away personal photos', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Data slows down the internet', false);

    -- Question 38
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 38, 'What does "used thoughtfully" suggest about social media?', 'Đáp án đúng: A
It requires planning and care – Nó đòi hỏi sự cân nhắc và cẩn trọng khi sử dụng.
A. It requires planning and care – Đúng vì "thoughtfully" mang nghĩa sử dụng một cách có suy nghĩ, thận trọng và có trách nhiệm.
B. It should be avoided completely – Nó nên được tránh hoàn toàn. Sai vì tác giả không phản đối việc sử dụng mạng xã hội.
C. It is old-fashioned – Nó đã lỗi thời. Sai vì bài nói mạng xã hội vẫn tiếp tục phát triển.
D. It is always dangerous – Nó luôn nguy hiểm. Sai vì tác giả cho rằng mạng xã hội vẫn có nhiều lợi ích nếu sử dụng đúng cách.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'It requires planning and care', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'It should be avoided completely', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'It is old-fashioned', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'It is always dangerous', false);

    -- Question 39
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 39, 'What does "its influence" refer to in the last paragraph?', 'Đáp án đúng: C
Social media – Mạng xã hội.
A. Television – Truyền hình. Sai vì truyền hình không phải đối tượng được nhắc đến trong đoạn cuối.
B. News channels – Các kênh tin tức. Sai vì bài không nói đến ảnh hưởng của riêng các kênh tin tức.
C. Social media – Đúng vì toàn bộ đoạn cuối đang nói về mạng xã hội và cách người dùng tương tác với nó.
D. The internet – Internet. Sai vì đối tượng được nhắc xuyên suốt bài là mạng xã hội, không phải Internet nói chung.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Television', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'News channels', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Social media', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'The internet', false);

    -- Question 40
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 40, 'What can be inferred about the author''s view of social media?', 'Đáp án đúng: B
The author supports careful use of it – Tác giả ủng hộ việc sử dụng mạng xã hội một cách thận trọng.
A. The author dislikes it – Tác giả không thích mạng xã hội. Sai vì tác giả vẫn công nhận những lợi ích của nó.
B. The author supports careful use of it – Đúng vì tác giả khuyến khích sử dụng mạng xã hội có suy nghĩ và có trách nhiệm.
C. The author ignores its power – Tác giả phớt lờ sức mạnh của nó. Sai vì bài phân tích khá rõ ảnh hưởng của mạng xã hội đến xã hội và doanh nghiệp.
D. The author avoids social media – Tác giả tránh sử dụng mạng xã hội. Sai vì bài không đề cập đến thói quen cá nhân của tác giả.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'The author dislikes it', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'The author supports careful use of it', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'The author ignores its power', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'The author avoids social media', false);

    -- PRACTICE TEST 5
    INSERT INTO tests (title, description, time_limit_minutes, shuffle_questions, shuffle_options, is_published)
    VALUES ('Practice Test 5', 'Đề thi trắc nghiệm Kỹ năng Đọc Tiếng Anh 3 - Gồm 4 phần đọc và 40 câu hỏi.', 60, true, true, true)
    RETURNING id INTO v_test_id;

    -- Part 1: Coasteering
    INSERT INTO test_parts (test_id, part_number, title, passage_text)
    VALUES (v_test_id, 1, 'Part 1: Coasteering', 'Lily Carter had no idea what present she wanted for her 14th birthday. But she''d always been keen on challenging sports, especially to do with water, like surfing and sailing. So when her parents heard about an activity called coasteering – exploring rocks along the coast by climbing and swimming – they thought Lily would love it. They found a course offered at an activity centre called Porthdean, just along the coast from the family home, which was perfect. So after checking it was led by experienced instructors, they signed her up.

Lily had seen a TV show about coasteering, and was interested in doing it, although she''d thought only adults could take part. But then she discovered that on courses at Porthdean, there''d also be people her age jumping from rocks into the sea, and also exploring caves – which she was never normally allowed to do, so she really wanted to go. But she still asked her dad to go along too and, although he wondered whether he''d like coasteering himself, he knew how much Lily wanted someone to accompany her, so he agreed.

Lily and her dad drove to Porthdean, where they attended a session with their instructors to learn basic safety and techniques and be given helmets and special wetsuits to keep the cold out. The group they joined was quite small, which meant they got lots of individual attention. Says Lily, "The entire trip was awesome – although the water was freezing! But our instructors encouraged the whole group so much, we were ready to try absolutely all the challenges, even stuff we hadn''t expected at all, like jumping off high cliffs! I must admit, the one I jumped off wasn''t that high, but Dad went much higher!"

"Anyway, Dad and I hadn''t realised how hard it would be physically, so we were glad we were fit," explains Lily. "Even so, afterwards, we actually felt like we''d done loads of hard exercise in the gym! But I''ll keep the memories of that trip forever, I reckon. And the instructors are going to put a video of it onto the website, so my friends will see it. They''d never believe me otherwise!"')
    RETURNING id INTO v_part_id;

    -- Question 1
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 1, 'Why did Lily''s parents choose Porthdean for her coasteering present?', 'Đáp án đúng: C
It wasn''t too far away from where they lived. – Nơi đó không quá xa nhà họ.
A. It offered various courses in her favourite watersport. – Nơi đó cung cấp nhiều khóa học về môn thể thao dưới nước yêu thích của cô bé. Sai vì bài không nói có nhiều khóa học.
B. The instructors there were highly recommended. – Các huấn luyện viên ở đó được giới thiệu rất tốt. Sai vì bố mẹ chỉ kiểm tra rằng họ có kinh nghiệm.
C. It wasn''t too far away from where they lived. – Đúng vì Porthdean nằm ngay dọc bờ biển, gần nhà gia đình Lily.
D. She had already tried some activities there. – Cô bé đã từng thử một số hoạt động ở đó. Sai vì đây là lần đầu Lily tham gia.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'It offered various courses in her favourite watersport.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'The instructors there were highly recommended.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'It wasn''t too far away from where they lived.', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'She had already tried some activities there.', false);

    -- Question 2
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 2, 'How did Lily feel about the coasteering course?', 'Đáp án đúng: A
Pleased that it included something she''d always wanted to try. – Vui mừng vì khóa học có hoạt động mà cô bé luôn muốn thử.
A. Pleased that it included something she''d always wanted to try. – Đúng vì Lily rất muốn nhảy từ vách đá xuống biển và khám phá hang động.
B. Excited about doing the experience all on her own. – Hào hứng khi tự mình trải nghiệm. Sai vì Lily muốn bố đi cùng.
C. Keen to find out more about what it involved. – Háo hức tìm hiểu thêm về hoạt động. Sai vì cô bé đã biết về coasteering qua chương trình truyền hình.
D. Interested to see whether she was the only teenager. – Muốn biết liệu mình có phải thanh thiếu niên duy nhất không. Sai vì cô bé biết khóa học có những người cùng độ tuổi.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'pleased that it included something she''d always wanted to try', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'excited about doing the experience all on her own', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'keen to find out more about what it involved', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'interested to see whether she was the only teenager', false);

    -- Question 3
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 3, 'Lily particularly liked her instructors because they made sure everyone …', 'Đáp án đúng: B
Felt confident about the new things they would attempt. – Cảm thấy tự tin về những thử thách mới mà họ sẽ thực hiện.
A. Was comfortable with the kit they were given. – Cảm thấy thoải mái với thiết bị được phát. Sai vì bài chỉ nói họ được phát mũ bảo hiểm và đồ lặn.
B. Felt confident about the new things they would attempt. – Đúng vì các huấn luyện viên động viên cả nhóm rất nhiều, giúp mọi người sẵn sàng thử mọi thử thách.
C. Got the same amount of attention. – Nhận được sự quan tâm như nhau. Sai vì nhóm nhỏ giúp mọi người được quan tâm nhiều hơn, nhưng không nói tất cả nhận được lượng quan tâm bằng nhau.
D. Knew all the activities they would take part in. – Biết tất cả hoạt động họ sẽ tham gia. Sai vì Lily còn bất ngờ với những thử thách như nhảy từ vách đá cao.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'was comfortable with the kit they were given.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'felt confident about the new things they would attempt.', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'got the same amount of attention.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'knew all the activities they would take part in.', false);

    -- Question 4
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 4, 'Lily says that after the course, she was …', 'Đáp án đúng: D
Surprised at how exhausted she was by the activities. – Ngạc nhiên vì các hoạt động khiến cô bé kiệt sức như thế nào.
A. Happy she''d shared something so exciting with her dad. – Vui vì đã chia sẻ trải nghiệm thú vị với bố. Sai vì đây không phải điều được nhấn mạnh trong câu hỏi.
B. Sorry she hadn''t worked at getting fitter before she went. – Tiếc vì đã không rèn luyện thể lực tốt hơn trước khi tham gia. Sai vì Lily và bố đều cảm thấy may mắn vì mình có thể lực tốt.
C. Proud that her friends all thought she''d done well. – Tự hào vì bạn bè nghĩ cô bé đã làm rất tốt. Sai vì bạn bè chưa xem video.
D. Surprised at how exhausted she was by the activities. – Đúng vì Lily nói sau chuyến đi, hai bố con cảm thấy như vừa tập luyện rất nhiều bài tập nặng trong phòng gym.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'happy she''d shared something so exciting with her dad.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'sorry she hadn''t worked at getting fitter before she went.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'proud that her friends all thought she''d done well.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'surprised at how exhausted she was by the activities.', true);

    -- Question 5
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 5, 'What would Lily text to a friend while she was away on the course?', 'Đáp án đúng: A
I don''t think Dad was sure before he came that he''d enjoy it – but actually, he''s been braver than me! – Tớ nghĩ trước khi đến, bố không chắc mình có thích hoạt động này không, nhưng thực ra bố còn dũng cảm hơn tớ!
B. I wanted to do the coasteering course, and mentioned it to my parents before my birthday. But I never expected they''d let me go! – Tớ muốn tham gia khóa học và đã nói với bố mẹ trước sinh nhật, nhưng không nghĩ họ sẽ cho phép. Sai vì bố mẹ chủ động tìm khóa học làm quà sinh nhật.
C. Our session before the activities was great, although I really didn''t think I''d need a wetsuit for the cold – and I was right! – Buổi hướng dẫn trước hoạt động rất tuyệt, dù tớ không nghĩ cần đồ lặn để chống lạnh và tớ đã đúng. Sai vì bài nói nước rất lạnh và họ được phát đồ lặn đặc biệt để giữ ấm.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'I don''t think Dad was sure before he came that he''d enjoy it – but actually, he''s been braver than me!', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'I wanted to do the coasteering course, and mentioned it to my parents before my birthday. But I never expected they''d let me go!', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Our session before the activities was great, although I really didn''t think I''d need a wetsuit for the cold – and I was right!', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Đúng vì bố Lily từng phân vân không biết mình có thích coasteering không, nhưng cuối cùng bố đã nhảy từ vách đá cao hơn Lily.', true);

    -- Question 6
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 6, 'Why did Lily ask her dad to come on the course?', 'Đáp án đúng: B
She wanted someone familiar to share the experience with. – Cô bé muốn có một người thân quen cùng chia sẻ trải nghiệm.
A. She was worried the course might be too dangerous. – Cô bé lo khóa học có thể quá nguy hiểm. Sai vì bài không nói Lily sợ nguy hiểm.
B. She wanted someone familiar to share the experience with. – Đúng vì Lily rất muốn có người đi cùng và chia sẻ trải nghiệm, nên đã nhờ bố tham gia.
C. She thought her dad had always wanted to try coasteering. – Cô bé nghĩ bố luôn muốn thử coasteering. Sai vì bố cô bé còn băn khoăn liệu mình có thích hoạt động này không.
D. She needed help carrying the equipment. – Cô bé cần giúp mang thiết bị. Sai vì bài không đề cập lý do này.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'She was worried the course might be too dangerous.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'She wanted someone familiar to share the experience with.', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'She thought her dad had always wanted to try coasteering.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'She needed help carrying the equipment.', false);

    -- Question 7
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 7, 'What did Lily and her dad receive before starting the activities?', 'áp án đúng: B
Helmets and wetsuits – Mũ bảo hiểm và đồ lặn giữ ấm.
A. Surfboards and gloves – Ván lướt sóng và găng tay. Sai vì bài không đề cập đến những thiết bị này.
B. Helmets and wetsuits – Đúng vì sau buổi hướng dẫn an toàn, họ được phát mũ bảo hiểm và đồ lặn đặc biệt để giữ ấm.
C. Life jackets and boots – Áo phao và ủng. Sai vì không xuất hiện trong nội dung bài đọc.
D. Maps and cameras – Bản đồ và máy ảnh. Sai vì đây không phải những thiết bị họ được nhận trước khi tham gia.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Surfboards and gloves', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Helmets and wetsuits', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Life jackets and boots', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Maps and cameras', false);

    -- Question 8
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 8, 'What does Lily mean by saying, "They''d never believe me otherwise"?', 'Đáp án đúng: B
Her friends wouldn''t accept that she had really done those activities. – Bạn bè sẽ không tin rằng cô bé thực sự đã tham gia những hoạt động đó.
A. Her friends wouldn''t think she could convince her dad to join. – Bạn bè sẽ không nghĩ cô bé có thể thuyết phục bố tham gia. Sai vì câu nói không đề cập đến việc thuyết phục bố.
B. Her friends wouldn''t accept that she had really done those activities. – Đúng vì Lily muốn video được đăng lên website để bạn bè có bằng chứng rằng cô bé thực sự đã tham gia.
C. Her friends wouldn''t be interested in the video on the website. – Bạn bè sẽ không quan tâm đến video trên website. Sai vì cô bé mong bạn bè xem video.
D. Her friends wouldn''t know about coasteering without the TV show. – Bạn bè sẽ không biết về coasteering nếu không có chương trình truyền hình. Sai vì câu nói đề cập đến việc chứng minh trải nghiệm của Lily.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Her friends wouldn''t think she could convince her dad to join.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Her friends wouldn''t accept that she had really done those activities.', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Her friends wouldn''t be interested in the video on the website.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Her friends wouldn''t know about coasteering without the TV show.', false);

    -- Question 9
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 9, 'Which of the following best describes Lily''s overall opinion of coasteering?', 'Đáp án đúng: A
It was difficult but unforgettable. – Hoạt động này khó khăn nhưng đáng nhớ.
A. It was difficult but unforgettable. – Đúng vì Lily nói hoạt động đòi hỏi thể lực, khiến cô bé mệt mỏi nhưng sẽ lưu giữ ký ức về chuyến đi mãi mãi.
B. It was disappointing compared to her expectations. – Thất vọng so với mong đợi. Sai vì Lily rất thích chuyến đi.
C. It was easy and relaxing. – Dễ dàng và thư giãn. Sai vì cô bé nói hoạt động rất vất vả về thể chất.
D. It was enjoyable but too expensive. – Thú vị nhưng quá đắt đỏ. Sai vì bài không đề cập đến chi phí.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'It was difficult but unforgettable.', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'It was disappointing compared to her expectations.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'It was easy and relaxing.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'It was enjoyable but too expensive.', false);

    -- Question 10
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 10, 'What can be inferred about Lily''s dad from the passage?', 'Đáp án đúng: B
He was more daring than Lily during the jumps. – Ông dũng cảm hơn Lily khi thực hiện những cú nhảy.
A. He was less fit than Lily expected. – Ông có thể lực kém hơn Lily nghĩ. Sai vì cả hai đều có thể lực tốt và cảm thấy may mắn vì điều đó.
B. He was more daring than Lily during the jumps. – Đúng vì Lily nói bố đã nhảy từ vách đá cao hơn nhiều so với cô bé.
C. He had previous experience with coasteering. – Ông đã có kinh nghiệm coasteering trước đó. Sai vì bài không đề cập kinh nghiệm trước đây của bố.
D. He preferred watching rather than participating. – Ông thích đứng xem hơn là tham gia. Sai vì ông đã trực tiếp tham gia và thực hiện những cú nhảy.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'He was less fit than Lily expected.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'He was more daring than Lily during the jumps.', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'He had previous experience with coasteering.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'He preferred watching rather than participating.', false);

    -- Part 2: Continents and Ocean Basins
    INSERT INTO test_parts (test_id, part_number, title, passage_text)
    VALUES (v_test_id, 2, 'Part 2: Continents and Ocean Basins', 'Continents and ocean basins represent the largest identifiable bodies on Earth. On the solid portions of the planet, the second most prominent features are flat plains, elevated plateaus, and large mountain ranges. In geography, the term "continent" refers to the surface of continuous landmasses that together comprise about 29.2% of the planet''s surface. On the other hand, another definition is prevalent in the general use of the term that deals with extensive mainlands, such as Europe or Asia, that actually represent on every large landmass. Although all continents are bounded by waterbodies or high mountain ranges, isolated mainlands, such as Greenland and India-Pakistan areas are called subcontinents. In some circles, the distinction between continents and large islands lies almost exclusively in the size of particular landmass.

The analysis of compression and tension in the earth''s crust has determined that continental structures are composed of layers that underlie continental shelves. A great deal of disagreement among geologists surrounds the issue of exactly how many layers underlie each landmass because of their distinctive mineral and chemical composition. It is also quite possible that the ocean floor rests on the top of unknown continents that have not yet been explored. The continental crust is believed to have been formed by means of a chemical reaction when lighter materials separated from heavier ones, thus settling at various levels within the crust. Assisted by the measurements of the specifics within crust formations by means of monitoring earthquakes, geologist scan speculate that a chemical split occurred to form the atmosphere, seawater, and the crust before it solidified many centuries ago.

Although each continent has its special features, all consist of various combinations of components that include shields, mountain belts, intracratonic basins, margins, volcanic plateaus, and block vaulted belts. The basic differences among continents lie in the proportions and the composition of these features relative to the continent size. Climatic zones have crucial effect on the weathering and formation of the surface features, soil erosion, deposition, land formation, vegetation, and human activities.

Mountain belts are elongated narrow zones that have a characteristic folded sedimentary organization of layers. They are typically produced during substantial crustal movements which generate faulting and mountain building. When continental margins collide, the rise of a marginal edge leads to the formation of large mountain ranges, as explained by the plate tectonic theory. This process also accounts for the occurrence of mountain belts in coastal areas and provides evidence for the ongoing continental plate evolution.')
    RETURNING id INTO v_part_id;

    -- Question 11
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 11, 'What does this passage mainly discuss?', 'Đáp án đúng: C
Continental structure and crust – Cấu trúc lục địa và lớp vỏ Trái Đất.
A. Continental drift and division – Sự trôi dạt và phân chia lục địa. Sai vì bài không tập trung vào sự dịch chuyển hay phân chia các lục địa.
B. Various definitions of the term "continent" – Các định nghĩa khác nhau của thuật ngữ "lục địa". Sai vì đây chỉ là nội dung được đề cập ở đoạn đầu.
C. Continental structure and crust – Đúng vì bài trình bày về cấu tạo lớp vỏ lục địa, thành phần, đặc điểm và quá trình hình thành núi.
D. Scientific analyses of continental crusts – Các phân tích khoa học về lớp vỏ lục địa. Sai vì đây chỉ là một phần nội dung, chưa bao quát toàn bộ bài đọc.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Continental drift and division', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Various definitions of the term "continent"', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Continental structure and crust', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Scientific analyses of continental crusts', false);

    -- Question 12
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 12, 'According to the passage, how do scientists define continents?', 'Đáp án đúng: B
As extensive bodies of land – Là những vùng đất rộng lớn.
A. As masses of land without divisions – Là những khối đất không có sự phân chia. Sai vì bài không đưa ra định nghĩa này.
B. As extensive bodies of land – Đúng vì đoạn đầu mô tả lục địa là những vùng đất liền rộng lớn (extensive mainlands).
C. As the largest identifiable features – Là những đặc điểm lớn nhất có thể nhận diện. Sai vì đây là mô tả chung về lục địa và bồn đại dương, không phải định nghĩa cụ thể.
D. As surface composition sand ranges – Là thành phần bề mặt và các dãy núi. Sai vì phương án này không diễn đạt đúng định nghĩa trong bài.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'As masses of land without divisions', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'As extensive bodies of land', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'As the largest identifiable features', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'As surface composition sand ranges', false);

    -- Question 13
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 13, 'The word "bounded" is closest in meaning to …', 'Đáp án đúng: C
Delimited – Được giới hạn, được phân định ranh giới.
A. Covered – Được bao phủ. Sai vì covered nói về việc che phủ bề mặt.
B. Convened – Được triệu tập, được tập hợp. Sai vì từ này thường dùng cho cuộc họp hoặc hội nghị.
C. Delimited – Đúng vì bounded by waterbodies or high mountain ranges có nghĩa là được giới hạn bởi các vùng nước hoặc dãy núi cao.
D. Dominated – Bị chi phối, thống trị. Sai vì không diễn đạt ý về ranh giới địa lý.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'covered', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'convened', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'delimited', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Dominated', false);

    -- Question 14
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 14, 'The author of the passage implies that the disagreement among scientists is based on the fact that …', 'Đáp án đúng: D
Continents have different chemical make up – Các lục địa có thành phần hóa học khác nhau.
A. Each continent has several planes and shelves – Mỗi lục địa có một số đồng bằng và thềm lục địa. Sai vì đây không phải nguyên nhân gây tranh luận.
B. Continents have various underlying layers of crust – Các lục địa có nhiều lớp vỏ bên dưới. Sai vì đây là vấn đề được nghiên cứu, chưa phải lý do cụ thể của sự bất đồng.
C. Continents undergo compression and experience tension – Các lục địa chịu lực nén và lực căng. Sai vì đây là hiện tượng địa chất được đề cập ở đầu đoạn hai.
D. Continents have different chemical make up – Đúng vì bài nói các lớp có thành phần khoáng chất và hóa học riêng biệt (distinctive mineral and chemical composition), khiến các nhà địa chất bất đồng về số lượng lớp.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'each continent has several planes and shelves', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'continents have various underlying layers of crust', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'continents undergo compression and experience tension', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'continents have different chemical make up', true);

    -- Question 15
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 15, 'The word "specifics" is closest in meaning to …', 'Đáp án đúng: C
Exact details – Những chi tiết chính xác, cụ thể.
A. Specialties – Chuyên môn hoặc đặc sản. Sai vì không phù hợp với ngữ cảnh nghiên cứu cấu trúc địa chất.
B. Speculations – Những suy đoán. Sai vì từ này chỉ ý kiến phỏng đoán, không phải thông tin chi tiết.
C. Exact details – Đúng vì measurements of the specifics within crust formations nói về việc đo đạc các đặc điểm cụ thể bên trong cấu trúc lớp vỏ.
D. Precise movements – Những chuyển động chính xác. Sai vì specifics không mang nghĩa chuyển động.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'specialties', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'speculations', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'exact details', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'precise movements', false);

    -- Question 16
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 16, 'The word "it" refers to …', 'Đáp án đúng: D
The crust – Lớp vỏ Trái Đất.
A. A chemical split – Một sự phân tách hóa học. Sai vì đây là quá trình xảy ra trước khi lớp vỏ đông cứng.
B. Seawater – Nước biển. Sai vì nước biển là một trong những thành phần được hình thành.
C. The atmosphere – Khí quyển. Sai vì khí quyển cũng được nhắc đến như một kết quả của quá trình phân tách hóa học.
D. The crust – Đúng vì trong câu before it solidified, đại từ it chỉ lớp vỏ Trái Đất (the crust) được nhắc đến ngay trước đó.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'a chemical split', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'seawater', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'the atmosphere', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'the crust', true);

    -- Question 17
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 17, 'The author of the passage implies that …', 'Đáp án đúng: A
It is not known exactly how the continental crust was formed – Chưa biết chính xác lớp vỏ lục địa được hình thành như thế nào.
A. It is not known exactly how the continental crust was formed – Đúng vì bài sử dụng cụm is believed to have been formed (được cho là đã hình thành), thể hiện đây là giả thuyết khoa học chứ chưa phải kết luận hoàn toàn chắc chắn.
B. Geologists have neglected the exploration of the ocean floor – Các nhà địa chất đã bỏ qua việc khám phá đáy đại dương. Sai vì bài chỉ nói đáy đại dương có thể chứa những lục địa chưa được khám phá.
C. Scientists have concentrated on monitoring earthquakes – Các nhà khoa học tập trung vào việc theo dõi động đất. Sai vì đây chỉ là một phương pháp thu thập dữ liệu được đề cập.
D. The earth''s atmosphere split into water and solids – Khí quyển Trái Đất phân tách thành nước và chất rắn. Sai vì bài nói sự phân tách hóa học hình thành khí quyển, nước biển và lớp vỏ.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'it is not known exactly how the continental crust was formed', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'geologists have neglected the exploration of the ocean floor', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'scientists have concentrated on monitoring earthquakes', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'the earth''s atmosphere split into water and solids', false);

    -- Question 18
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 18, 'According to the passage, what are the differences in the structure of continents?', 'Đáp án đúng: B
Ratios of major components and their comparative size – Tỷ lệ của các thành phần chính và kích thước tương đối của chúng.
A. The proportional size of continents to one another – Kích thước tương quan giữa các lục địa. Sai vì bài không so sánh diện tích các lục địa với nhau.
B. Ratios of major components and their comparative size – Đúng vì bài nói sự khác biệt nằm ở tỷ lệ và thành phần của các đặc điểm địa chất so với kích thước lục địa.
C. The distinctive features of their elements – Những đặc điểm riêng biệt của các thành phần. Sai vì chưa thể hiện đầy đủ ý về tỷ lệ và kích thước.
D. Climatic zones and their effect on the surface features – Các vùng khí hậu và ảnh hưởng của chúng đến đặc điểm bề mặt. Sai vì đây là nội dung nói về tác động của khí hậu, không phải sự khác biệt trong cấu trúc lục địa.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'The proportional size of continents to one another', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Ratios of major components and their comparative size', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'The distinctive features of their elements', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Climatic zones and their effect on the surface features', false);

    -- Question 19
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 19, 'The phrase "This process" refers to …', 'Đáp án đúng: C
The rise of margins – Sự nâng lên của rìa lục địa.
A. Continental collision – Sự va chạm giữa các lục địa. Sai vì đây là điều kiện dẫn đến quá trình hình thành núi.
B. Mountain ranges – Các dãy núi lớn. Sai vì đây là kết quả của quá trình được mô tả.
C. The rise of margins – Đúng vì câu trước nói sự nâng lên của rìa lục địa dẫn đến sự hình thành các dãy núi lớn; câu sau dùng This process để nhắc lại quá trình này.
D. Plate tectonic theory – Thuyết kiến tạo mảng. Sai vì đây là lý thuyết giải thích quá trình, không phải bản thân quá trình.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'continental collision', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'mountain ranges', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'the rise of margins', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'plate tectonic theory', false);

    -- Question 20
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 20, 'The author of the passage implies that …', 'Đáp án đúng: D
The process of continent formation has not been completed – Quá trình hình thành lục địa vẫn chưa hoàn tất.
A. The process of mountain formation has not been accounted for – Quá trình hình thành núi vẫn chưa được giải thích. Sai vì bài đã giải thích bằng thuyết kiến tạo mảng.
B. Mountain ranges on the ocean floor lead to surface mountain building – Các dãy núi dưới đáy đại dương dẫn đến sự hình thành núi trên bề mặt. Sai vì bài không đề cập mối quan hệ này.
C. Faulting and continental margins are parts of plate edges – Đứt gãy và rìa lục địa là những phần của mép mảng kiến tạo. Sai vì bài không khẳng định trực tiếp điều này.
D. The process of continent formation has not been completed – Đúng vì đoạn cuối nhắc đến ongoing continental plate evolution (sự tiến hóa liên tục của các mảng lục địa), cho thấy quá trình biến đổi và hình thành vẫn đang tiếp diễn.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'the process of mountain formation has not been accounted for', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'mountain ranges on the ocean floor lead to surface mountain building', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'faulting and continental margins are parts of plate edges', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'the process of continent formation has not been completed', true);

    -- Part 3: SpeedFlatmating
    INSERT INTO test_parts (test_id, part_number, title, passage_text)
    VALUES (v_test_id, 3, 'Part 3: SpeedFlatmating', 'When you are looking for rental accommodation in a shared house, you have to think not only about the location and your budget, but also about who you are sharing with, as your housemates can make the difference between a successful or an unhappy house-share.

SpeedFlatmating is a perfect way to find the ideal house or flatmate. SpeedFlatmating events, which are organised by the website speedflatmating.co.uk, are mainly held in London. However, some events are held in other British towns and cities. They typically take place in a bar or pub. At these events, people looking for accommodation can meet people with available rooms, or other people on the lookout for accommodation who they can rent a place with.

On arrival at a SpeedFlatmating event, guests are given a sticker to wear. White stickers indicate that you have an available room. Pink stickers are for people who are looking for a room. On white stickers, people write their name, the rental cost of the room and its nearest tube station. On pink stickers, people write their name, their budget and the area where they want to live.

The website organises about 17 events per month in London. Their larger events cover the whole of central London and are geared towards people who are flexible about where they want to live. They also run local events for people who already know where they want to live.

Users enjoy SpeedFlatmating for various reasons. Firstly, it cuts out the long, boring process of advertising and showing people around a flat. Also, potential flatmates can get to meet each other in a relaxed, social setting and find out whether they would be a good match for a flatshare or not. As well as meeting potential flatmates, many people say they enjoy the friendly atmosphere and make new friends at the events.

A huge number of people have benefitted from SpeedFlatmating. Paul from London says, ''I had been having problems finding a place to live in London because I''m in my forties. Most people sharing accommodation in London are in their twenties and thirties, and I didn''t really fit in. I went to a SpeedFlatmating event and met three other people in the same situation as me, so we decided to get together and rent a place. Within a week, we had found a place within our budget.''

Melissa says, ''I was just starting to think about moving out of my parents'' home, and SpeedFlatmating seemed like a good way to find out more. I was quite nervous about attending the event on my own, but when I got there, I realised that everyone else was nervous too, and so I was able to relax, enjoy myself and meet people. I met a landlord there who was looking for tenants, and I arranged to have a look round his house. I''m moving in next week! It was as simple as that!''')
    RETURNING id INTO v_part_id;

    -- Question 21
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 21, 'What is the main purpose of SpeedFlatmating?', 'Đáp án đúng: C
To help people find compatible flatmates. – Giúp mọi người tìm được bạn cùng thuê nhà phù hợp.
A. To help landlords advertise their properties. – Giúp chủ nhà quảng cáo bất động sản. Sai vì đây không phải mục đích chính của sự kiện.
B. To find the perfect location for new houses. – Tìm vị trí hoàn hảo để xây nhà mới. Sai vì sự kiện tập trung vào việc tìm người thuê và bạn cùng nhà.
C. To help people find compatible flatmates. – Đúng vì sự kiện giúp những người tìm nhà gặp gỡ và tìm người có thể cùng thuê nhà phù hợp.
D. To organise parties in London pubs. – Tổ chức tiệc tại các quán rượu ở London. Sai vì quán rượu chỉ là địa điểm tổ chức sự kiện.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'To help landlords advertise their properties.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'To find the perfect location for new houses.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'To help people find compatible flatmates.', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'To organise parties in London pubs.', false);

    -- Question 22
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 22, 'Where do SpeedFlatmating events usually take place?', 'Đáp án đúng: B
In bars or pubs. – Trong các quán bar hoặc quán rượu.
A. In large conference halls. – Trong các hội trường lớn. Sai vì bài không đề cập đến địa điểm này.
B. In bars or pubs. – Đúng vì đoạn hai nói các sự kiện thường diễn ra tại quán bar hoặc quán rượu.
C. At university campuses. – Trong khuôn viên trường đại học. Sai vì không có thông tin về trường đại học.
D. In real estate offices. – Trong văn phòng bất động sản. Sai vì sự kiện không được tổ chức tại văn phòng môi giới nhà đất.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'In large conference halls.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'In bars or pubs.', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'At university campuses.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'In real estate offices.', false);

    -- Question 23
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 23, 'What does a pink sticker indicate at a SpeedFlatmating event?', 'Đáp án đúng: B
You are a person looking for a room. – Bạn là người đang tìm phòng.
A. You are a landlord with a free room. – Bạn là chủ nhà có phòng trống. Sai vì người có phòng trống sử dụng nhãn màu trắng.
B. You are a person looking for a room. – Đúng vì bài đọc ghi rõ nhãn màu hồng dành cho những người đang tìm phòng thuê.
C. You are flexible about your budget. – Bạn linh hoạt về ngân sách. Sai vì nhãn hồng ghi ngân sách, nhưng màu nhãn không biểu thị sự linh hoạt.
D. You are a member of the event staff. – Bạn là nhân viên tổ chức sự kiện. Sai vì bài không đề cập đến loại nhãn này.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'You are a landlord with a free room.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'You are a person looking for a room.', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'You are flexible about your budget.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'You are a member of the event staff.', false);

    -- Question 24
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 24, 'What information is written on a white sticker?', 'Đáp án đúng: C
Name, rental cost, and nearest tube station. – Tên, giá thuê phòng và ga tàu điện ngầm gần nhất.
A. The guest''s favourite areas in London. – Những khu vực yêu thích của khách tại London. Sai vì đây không phải thông tin ghi trên nhãn trắng.
B. The guest''s hobbies and interests. – Sở thích và mối quan tâm của khách. Sai vì bài không đề cập đến sở thích cá nhân.
C. Name, rental cost, and nearest tube station. – Đúng vì bài nói người có phòng trống ghi tên, giá thuê và ga tàu điện ngầm gần nhất lên nhãn trắng.
D. Name, budget, and preferred roommates'' age. – Tên, ngân sách và độ tuổi bạn cùng nhà mong muốn. Sai vì ngân sách là thông tin ghi trên nhãn màu hồng.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'The guest''s favourite areas in London.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'The guest''s hobbies and interests.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Name, rental cost, and nearest tube station.', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Name, budget, and preferred roommates'' age.', false);

    -- Question 25
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 25, 'Why are local SpeedFlatmating events organised?', 'Đáp án đúng: A
For people who already know where they want to live. – Dành cho những người đã biết mình muốn sống ở đâu.
A. For people who already know where they want to live. – Đúng vì đoạn bốn nói các sự kiện địa phương dành cho những người đã xác định được khu vực muốn sinh sống.
B. To advertise bars and pubs in London. – Để quảng cáo các quán bar và quán rượu ở London. Sai vì quán bar chỉ là địa điểm tổ chức.
C. To increase the number of stickers used. – Để tăng số lượng nhãn dán được sử dụng. Sai vì không liên quan đến mục đích tổ chức sự kiện.
D. For landlords who own multiple properties. – Dành cho chủ nhà sở hữu nhiều bất động sản. Sai vì bài không giới hạn người tham gia theo số lượng bất động sản.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'For people who already know where they want to live.', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'To advertise bars and pubs in London.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'To increase the number of stickers used.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'For landlords who own multiple properties.', false);

    -- Question 26
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 26, 'What is one benefit of SpeedFlatmating mentioned in the text?', 'Đáp án đúng: B
It allows people to avoid the long, boring advertising process. – Giúp mọi người tránh quy trình quảng cáo kéo dài và nhàm chán.
A. It guarantees cheaper rents for everyone. – Đảm bảo giá thuê rẻ hơn cho tất cả mọi người. Sai vì bài không cam kết giảm giá thuê.
B. It allows people to avoid the long, boring advertising process. – Đúng vì bài nói sự kiện giúp loại bỏ quá trình quảng cáo và dẫn khách đi xem phòng kéo dài, nhàm chán.
C. It provides free accommodation for the first month. – Cung cấp chỗ ở miễn phí trong tháng đầu tiên. Sai vì không có thông tin về nhà ở miễn phí.
D. It ensures landlords always find tenants immediately. – Đảm bảo chủ nhà luôn tìm được người thuê ngay lập tức. Sai vì bài không đưa ra sự đảm bảo này.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'It guarantees cheaper rents for everyone.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'It allows people to avoid the long, boring advertising process.', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'It provides free accommodation for the first month.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'It ensures landlords always find tenants immediately.', false);

    -- Question 27
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 27, 'What problem did Paul face before using SpeedFlatmating?', 'Đáp án đúng: B
He didn''t fit in with the typical age group of flat-sharers. – Ông không phù hợp với nhóm tuổi phổ biến của những người thuê nhà chung.
A. He couldn''t find a flat within his budget. – Ông không thể tìm được căn hộ phù hợp với ngân sách. Sai vì cuối cùng ông tìm được nhà trong mức ngân sách của mình.
B. He didn''t fit in with the typical age group of flat-sharers. – Đúng vì Paul ở độ tuổi ngoài 40, trong khi phần lớn người thuê chung nhà tại London ở độ tuổi 20–30.
C. He couldn''t find a landlord willing to rent to groups. – Ông không tìm được chủ nhà đồng ý cho nhóm thuê. Sai vì bài không nhắc đến vấn đề này.
D. He was nervous about attending events alone. – Ông lo lắng khi tham gia sự kiện một mình. Sai vì đây là cảm xúc của Melissa, không phải Paul.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'He couldn''t find a flat within his budget.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'He didn''t fit in with the typical age group of flat-sharers.', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'He couldn''t find a landlord willing to rent to groups.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'He was nervous about attending events alone.', false);

    -- Question 28
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 28, 'What happened to Melissa after attending the event?', 'Đáp án đúng: B
She quickly arranged to view a house and is moving in. – Cô nhanh chóng sắp xếp đi xem nhà và chuẩn bị chuyển vào ở.
A. She decided not to move out of her parents'' home. – Cô quyết định không rời khỏi nhà bố mẹ. Sai vì Melissa đang chuẩn bị chuyển ra ở riêng.
B. She quickly arranged to view a house and is moving in. – Đúng vì cô gặp một chủ nhà đang tìm người thuê, sau đó sắp xếp đi xem nhà và sẽ chuyển vào tuần tiếp theo.
C. She joined three people to rent a place together. – Cô tham gia cùng ba người khác để thuê nhà. Sai vì đây là câu chuyện của Paul.
D. She chose to attend another event to gain more experience. – Cô chọn tham gia sự kiện khác để tích lũy kinh nghiệm. Sai vì cô đã tìm được nhà sau sự kiện.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'She decided not to move out of her parents'' home.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'She quickly arranged to view a house and is moving in.', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'She joined three people to rent a place together.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'She chose to attend another event to gain more experience.', false);

    -- Question 29
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 29, 'What can be inferred about the atmosphere at SpeedFlatmating events?', 'Đáp án đúng: B
It is relaxed and friendly. – Không khí thoải mái và thân thiện.
A. It is formal and highly competitive. – Trang trọng và có tính cạnh tranh cao. Sai vì sự kiện diễn ra trong môi trường giao lưu xã hội thoải mái.
B. It is relaxed and friendly. – Đúng vì bài nói mọi người có thể gặp gỡ trong môi trường thân thiện, thoải mái và kết bạn mới.
C. It is stressful for most attendees. – Gây căng thẳng cho hầu hết người tham dự. Sai vì dù ban đầu Melissa lo lắng, cô nhận ra những người khác cũng lo lắng và sau đó cảm thấy thoải mái.
D. It is mainly designed for landlords. – Chủ yếu được thiết kế dành cho chủ nhà. Sai vì sự kiện phục vụ cả người có phòng trống và người đang tìm chỗ ở.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'It is formal and highly competitive.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'It is relaxed and friendly.', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'It is stressful for most attendees.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'It is mainly designed for landlords.', false);

    -- Question 30
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 30, 'What is the tone of the passage?', 'Đáp án đúng: B
Informative and positive. – Mang tính cung cấp thông tin và tích cực.
A. Critical and negative. – Mang tính phê phán và tiêu cực. Sai vì tác giả không chỉ trích SpeedFlatmating mà còn nêu nhiều lợi ích.
B. Informative and positive. – Đúng vì bài cung cấp thông tin về cách tổ chức sự kiện, lợi ích và những trải nghiệm thành công của người tham gia.
C. Humorous and casual. – Hài hước và suồng sã. Sai vì bài có cách diễn đạt gần gũi nhưng mục đích chính vẫn là cung cấp thông tin.
D. Neutral and scientific. – Trung lập và mang tính khoa học. Sai vì bài có giọng điệu tích cực, thể hiện qua các trải nghiệm tốt của Paul và Melissa.')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Critical and negative.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Informative and positive.', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Humorous and casual.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Neutral and scientific.', false);

    -- Part 4: Personality Revealed
    INSERT INTO test_parts (test_id, part_number, title, passage_text)
    VALUES (v_test_id, 4, 'Part 4: Personality Revealed', 'Have you ever been afraid of or attracted to someone just because of the way the person looks? When you first meet someone, it is not unusual to react to appearance. Most people assume it takes time to know someone, but a person''s appearance may reveal more than we realize. According to some, a person''s face, head, and body can show much about personality.

Since ancient times, people have practiced physiognomy, or reading character from physical features. The ancient Greeks compared human faces to those of animals such as the eagle and the horse. They believed people shared certain traits with the animals they resembled. A person with a horse-like face was thought to be loyal and brave. A person with an eagle-like nose was believed to be bold and courageous, as well as arrogant.

Physiognomists study features like the shape of the head, the neck, hair, nose, mouth, eyes, and chin. They say round-faced people are self-confident. Prominent cheekbones show strength of character, while a pointed nose reveals curiosity. Heavy, arched eyebrows belong to a decisive individual, while thin, arched eyebrows signal a restless personality. Almond-shaped eyes reveal an artistic nature, while round, soft eyes belong to dreamers. Down-turned lips reveal a proud character, and a long, pointed chin indicates someone who likes to give orders.

A related art is phrenology, the study of bumps on the human head. A couple of centuries ago, phrenologists identified bumps of various shapes and "read" them to discover a person''s talents. For example, a bump between the nose and forehead was said to show elegance and a love of beauty. A bump behind the ear suggested courage and adventure. They also believed a bulge in the center of the forehead showed a good memory and desire for knowledge. A small bump at the top of the head indicated strong moral character, while a bump just below this signaled generosity and kindness. A bump just above the eyebrow was thought to belong to people who loved order and discipline, and a rise at the back of the head marked those attached to their families.

Phrenology was developed in the early eighteenth century by Franz Joseph Gall, a doctor in Vienna. As a student, he noticed that boys with prominent eyes seemed to have the best memories, leading him to believe appearance was linked to ability. His research attracted interest but was ridiculed by other doctors. Gall died in 1828 poor and bitter. After his death, phrenology gained popularity in the nineteenth century, and today a few phrenologists remain, even though there is no scientific evidence to support the practice.')
    RETURNING id INTO v_part_id;

    -- Question 31
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 31, 'What is the main idea of the passage?', '·  ·  A – Đúng
·  Physical appearance can sometimes suggest aspects of a person''s personality: Ngoại hình đôi khi có thể gợi ý một số khía cạnh tính cách. Đây là nội dung xuyên suốt bài đọc.
·  ·  ·  ·  B – Sai
·  Physiognomy and phrenology are reliable sciences: Nhân tướng học và thuật xem tướng sọ là khoa học đáng tin cậy. Sai vì cuối bài khẳng định không có bằng chứng khoa học chứng minh.
·  ·  ·  ·  C – Sai
·  The Greeks disliked people with eagle-like noses: Người Hy Lạp không thích người có mũi giống đại bàng. Bài chỉ nói họ cho rằng người có mũi giống đại bàng là dũng cảm, táo bạo và kiêu ngạo.
·  ·  ·  ·  D – Sai
·  First impressions are always correct: Ấn tượng đầu tiên luôn chính xác. Bài chỉ nói con người thường đánh giá ngoại hình khi mới gặp, không khẳng định đánh giá đó luôn đúng.
·  ·')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Physical appearance can sometimes suggest aspects of a person''s personality.', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Physiognomy and phrenology are reliable sciences.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'The Greeks disliked people with eagle-like noses.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'First impressions are always correct.', false);

    -- Question 32
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 32, 'According to the passage, what did the ancient Greeks believe about a person with a horse-like face?', '·  ·  A – Sai
·  They were adventurous and arrogant: Họ thích phiêu lưu và kiêu ngạo. Đây là những đặc điểm không được gắn với khuôn mặt giống ngựa trong bài.
·  ·  ·  ·  B – Đúng
·  They were loyal, brave, and stern: Họ trung thành, dũng cảm và nghiêm nghị. Bài ghi rõ người có khuôn mặt giống ngựa được cho là trung thành và dũng cảm. Lưu ý: stern (nghiêm nghị) không được nêu trực tiếp, nhưng hai đặc điểm còn lại khớp với bài.
·  ·  ·  ·  C – Sai
·  They were artistic dreamers: Họ là những người mơ mộng, có thiên hướng nghệ thuật. Đây là những đặc điểm được liên hệ với đôi mắt trong đoạn 3, không phải khuôn mặt giống ngựa.
·  ·  ·  ·  D – Sai
·  They were indecisive: Họ thiếu quyết đoán. Bài không đề cập đặc điểm này đối với người có khuôn mặt giống ngựa.
·  ·')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'They were adventurous and arrogant.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'They were loyal, brave, and stern.', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'They were artistic dreamers.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'They were indecisive.', false);

    -- Question 33
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 33, 'The word "traits" in paragraph 2 is closest in meaning to …', '·  ·  A – Sai
·  Mistakes: Những sai lầm. Từ này nói về lỗi hoặc hành động sai, không phải đặc điểm tính cách.
·  ·  ·  ·  B – Đúng
·  Characteristics: Những đặc điểm, tính chất. Traits và characteristics đều dùng để chỉ những nét đặc trưng của một người.
·  ·  ·  ·  C – Sai
·  Traditions: Những truyền thống. Từ này nói về phong tục, tập quán được truyền lại qua nhiều thế hệ.
·  ·  ·  ·  D – Sai
·  Predictions: Những dự đoán. Từ này nói về việc dự đoán điều có thể xảy ra trong tương lai, không đồng nghĩa với traits.
·  ·')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'mistakes', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'characteristics', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'traditions', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Predictions', false);

    -- Question 34
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 34, 'Physiognomists think people with almond-shaped eyes are likely to be …', '·  ·  A – Sai
·  Proud and controlling: Kiêu hãnh và thích kiểm soát. Bài liên hệ môi trễ với tính kiêu hãnh và cằm dài, nhọn với người thích ra lệnh, không phải mắt hình hạnh nhân.
·  ·  ·  ·  B – Đúng
·  Artistic in nature: Có thiên hướng nghệ thuật. Bài viết trực tiếp: “Almond-shaped eyes reveal an artistic nature”.
·  ·  ·  ·  C – Sai
·  Adventurous and generous: Thích phiêu lưu và hào phóng. Đây là những đặc điểm được nhắc đến khi mô tả các vị trí lồi trên đầu, không liên quan đến mắt hình hạnh nhân.
·  ·  ·  ·  D – Sai
·  Disciplined and moral: Có kỷ luật và đạo đức. Bài liên hệ tính kỷ luật với chỗ nhô phía trên lông mày và phẩm chất đạo đức với chỗ lồi trên đỉnh đầu.
·  ·')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Proud and controlling.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Artistic in nature.', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Adventurous and generous.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Disciplined and moral.', false);

    -- Question 35
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 35, 'According to phrenologists, a bump at the very back of the head indicates someone who …', '·  ·  A – Sai
·  Loves beauty and elegance: Yêu cái đẹp và sự thanh lịch. Đặc điểm này được cho là liên quan đến chỗ lồi giữa mũi và trán.
·  ·  ·  ·  B – Sai
·  Has a strong moral character: Có phẩm chất đạo đức mạnh mẽ. Bài liên hệ đặc điểm này với một chỗ lồi nhỏ ở đỉnh đầu.
·  ·  ·  ·  C – Đúng
·  Is attached to their family: Là người gắn bó với gia đình. Bài viết: “a rise at the back of the head marked those attached to their families”.
·  ·  ·  ·  D – Sai
·  Enjoys giving orders: Thích ra lệnh cho người khác. Đặc điểm này được liên hệ với chiếc cằm dài và nhọn trong đoạn 3, không phải phía sau đầu.
·  ·')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Loves beauty and elegance.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Has a strong moral character.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Is attached to their family.', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Enjooys giving orders.', false);

    -- Question 36
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 36, 'Why did Franz Joseph Gall begin studying phrenology?', '·  ·  A – Sai
·  He disliked traditional medicine: Ông không thích y học truyền thống. Bài không đề cập việc Gall không thích y học truyền thống.
·  ·  ·  ·  B – Sai
·  He wanted to prove other doctors wrong: Ông muốn chứng minh các bác sĩ khác sai. Bài nói nghiên cứu của ông bị các bác sĩ khác chế giễu, chứ không nói đó là lý do ông bắt đầu nghiên cứu.
·  ·  ·  ·  C – Đúng
·  He observed that boys with prominent eyes had good memories: Ông quan sát thấy những cậu bé có đôi mắt nổi bật có trí nhớ tốt. Đây chính là quan sát khiến ông tin rằng ngoại hình có liên quan đến năng lực.
·  ·  ·  ·  D – Sai
·  He was interested in animal behavior: Ông quan tâm đến hành vi động vật. Bài có nhắc người Hy Lạp so sánh khuôn mặt với động vật, nhưng điều này không phải lý do Gall nghiên cứu phrenology.
·  ·')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'He disliked traditional medicine.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'He wanted to prove other doctors wrong.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'He observed that boys with prominent eyes had good memories.', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'He was interested in animal behavior.', false);

    -- Question 37
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 37, 'Phrenology is the study of …', '·  ·  A – Đúng
·  Bumps on the human head: Những chỗ lồi trên đầu người. Đây là định nghĩa được nêu trực tiếp ở đầu đoạn 4.
·  ·  ·  ·  B – Sai
·  The color and thickness of human hair: Màu sắc và độ dày của tóc người. Bài có nhắc đến tóc như một đặc điểm được nghiên cứu trong nhân tướng học, nhưng không phải phrenology.
·  ·  ·  ·  C – Sai
·  Ancient Greek myths and traditions: Thần thoại và truyền thống Hy Lạp cổ đại. Người Hy Lạp được nhắc đến trong bài, nhưng đây không phải đối tượng nghiên cứu của phrenology.
·  ·  ·  ·  D – Sai
·  The alignment of stars to predict personality: Sự sắp xếp của các ngôi sao để dự đoán tính cách. Đây là nội dung liên quan đến chiêm tinh học, không phải phrenology.
·  ·')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'bumps on the human head', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'the color and thickness of human hair', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'ancient Greek myths and traditions', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'the alignment of stars to predict personality', false);

    -- Question 38
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 38, 'The word "elegance" in the passage is closest in meaning to:', '·  ·  A – Sai
·  Courage: Lòng dũng cảm. Từ này nói về sự can đảm, không phải sự thanh lịch.
·  ·  ·  ·  B – Đúng
·  Beauty and grace: Vẻ đẹp và sự duyên dáng. Elegance có nghĩa là sự thanh lịch, tao nhã, phù hợp với đáp án này.
·  ·  ·  ·  C – Sai
·  Knowledge: Kiến thức. Đây là sự hiểu biết hoặc tri thức, không đồng nghĩa với elegance.
·  ·  ·  ·  D – Sai
·  Strength of character: Sự mạnh mẽ trong tính cách. Đây là phẩm chất tinh thần, không phải vẻ đẹp thanh lịch.
·  ·')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Courage', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'Beauty and grace', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Knowledge', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'Strength of character', false);

    -- Question 39
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 39, 'Why was Franz Joseph Gall ridiculed by other doctors?', '·  ·  A – Sai
·  He failed to complete his medical studies: Ông không hoàn thành việc học y khoa. Bài không nói Gall bỏ dở việc học; chỉ nói ông phát triển nghiên cứu khi còn là sinh viên.
·  ·  ·  ·  B – Đúng
·  He claimed that head bumps could reveal talents and character: Ông cho rằng những chỗ lồi trên đầu có thể tiết lộ tài năng và tính cách. Đây là nội dung cốt lõi của phrenology, và nghiên cứu của ông bị các bác sĩ khác chế giễu.
·  ·  ·  ·  C – Sai
·  He refused to share his research: Ông từ chối chia sẻ nghiên cứu. Bài không đề cập việc ông giấu hay từ chối chia sẻ nghiên cứu.
·  ·  ·  ·  D – Sai
·  He criticized ancient Greek practices: Ông chỉ trích các phương pháp của người Hy Lạp cổ đại. Bài không nói Gall chỉ trích người Hy Lạp; ông bị chế giễu vì nghiên cứu của mình.
·  ·')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'He failed to complete his medical studies.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'He claimed that head bumps could reveal talents and character.', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'He refused to share his research.', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'He criticized ancient Greek practices.', false);

    -- Question 40
    INSERT INTO questions (test_part_id, question_number, question_text, explanation)
    VALUES (v_part_id, 40, 'According to the passage, which feature is linked to curiosity?', '·  ·  A – Sai
·  Round, soft eyes: Đôi mắt tròn, mềm mại. Bài nói đôi mắt này thuộc về những người mơ mộng (dreamers), không phải người tò mò.
·  ·  ·  ·  B – Đúng
·  A pointed nose: Một chiếc mũi nhọn. Bài viết trực tiếp: “a pointed nose reveals curiosity” (mũi nhọn thể hiện sự tò mò).
·  ·  ·  ·  C – Sai
·  Down-turned lips: Đôi môi trễ xuống. Bài liên hệ đặc điểm này với tính cách kiêu hãnh (proud character).
·  ·  ·  ·  D – Sai
·  A long, pointed chin: Chiếc cằm dài và nhọn. Bài cho rằng đặc điểm này thuộc về người thích ra lệnh (likes to give orders).
·  ·')
    RETURNING id INTO v_question_id;

    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'A', 'Round, soft eyes', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'B', 'A pointed nose', true);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'C', 'Down-turned lips', false);
    INSERT INTO question_options (question_id, option_key, option_text, is_correct)
    VALUES (v_question_id, 'D', 'A long, pointed chin', false);

END $$;