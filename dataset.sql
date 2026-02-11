-- 1. Bảng School (Trường/Viện chuyên ngành)
INSERT INTO "School" ("SchoolID", "SchoolName", "Address") VALUES
(1, 'Trường Công nghệ thông tin và truyền thông', '1 Đại Cồ Việt, Hai Bà Trưng, Hà Nội'),
(2, 'Trường Điện - Điện tử', '1 Đại Cồ Việt, Hai Bà Trưng, Hà Nội'),
(3, 'Trường Cơ khí', '1 Đại Cồ Việt, Hai Bà Trưng, Hà Nội'),
(4, 'Trường Vật liệu', '1 Đại Cồ Việt, Hai Bà Trưng, Hà Nội'),
(5, 'Trường Hoá và Khoa học sự sống', '1 Đại Cồ Việt, Hai Bà Trưng, Hà Nội'),
(6, 'Viện Kinh tế và Quản lý', '1 Đại Cồ Việt, Hai Bà Trưng, Hà Nội'),
(7, 'Trường Ngoại ngữ', '1 Đại Cồ Việt, Hai Bà Trưng, Hà Nội');

-- 2. Bảng ClassRoom (Phòng học)
INSERT INTO "ClassRoom" ("RoomID", "Address", "Capacity") VALUES
('D1-101', 'Tòa D1', 120), ('D3-202', 'Tòa D3', 100), ('D5-303', 'Tòa D5', 80),
('D6-404', 'Tòa D6', 100), ('D9-501', 'Tòa D9', 150), ('C1-202', 'Tòa C1', 70), 
('C2-301', 'Tòa C2', 70), ('B1-101', 'Tòa B1', 200), ('TH1-101', 'Tòa Thực hành 1', 50),
('TH2-202', 'Tòa Thực hành 2', 50), ('TC-NTĐ', 'Nhà thi đấu', 300);

-- 3. Bảng Semester (Học kỳ)
INSERT INTO "Semester" ("SemesterID", "AcademicYear", "StartDate", "EndDate", "Status", "RegisterStart", "RegisterEnd") VALUES
('20231', '2023-2024', '2023-09-04', '2024-01-07', 'Ended', '2023-08-20', '2023-09-10'),
('20232', '2023-2024', '2024-01-22', '2024-06-09', 'Ended', '2024-01-10', '2024-01-28'),
('20241', '2024-2025', '2024-09-02', '2025-01-05', 'Ended', '2024-08-18', '2024-09-08'),
('20242', '2024-2025', '2025-01-20', '2025-06-08', 'OnGoing', '2025-01-05', '2025-01-26');

-- 4. Bảng Major (Chuyên ngành) - Gán SchoolID tương ứng
INSERT INTO "Major" ("MajorID", "MajorName", "SchoolID") VALUES
-- Trường Hoá và Khoa học sự sống (ID: 5)
(1, '(BF-E12) Kỹ thuật thực phẩm (CTTT)', 5), 
(2, '(BF-E19) Kỹ thuật sinh học (CTTT)', 5),
(3, '(BF1) Kỹ thuật Sinh học', 5), 
(4, '(BF2) Kỹ thuật Thực phẩm', 5),
(5, '(CH-E11) Kỹ thuật Hóa dược (CTTT)', 5), 
(6, '(CH1) Kỹ thuật Hóa học', 5),
(7, '(CH2) Hóa học', 5), 
(29, '(EV1) Kỹ thuật Môi trường', 5),
(30, '(EV2) Quản lý Tài nguyên & Môi trường', 5),
-- Viện Kinh tế và Quản lý (ID: 6)
(8, '(ED2) Công nghệ giáo dục', 6), 
(9, '(ED3) Quản lý giáo dục', 6),
(15, '(EM-E13) Phân tích kinh doanh (CTTT)', 6), 
(16, '(EM-E14) Logistics & QLCCU (CTTT)', 6),
(17, '(EM1) Quản lý năng lượng', 6), 
(18, '(EM2) Quản lý công nghiệp', 6),
(19, '(EM3) Quản trị kinh doanh', 6), 
(20, '(EM4) Kế toán', 6),
(21, '(EM5) Tài chính - Ngân hàng', 6), 
(49, '(MI2) Hệ thống thông tin quản lý', 6),
(63, '(TROY-BA) Quản trị kinh doanh - ĐH Troy', 6),
-- Trường Điện - Điện tử (ID: 2)
(10, '(EE-E18) Hệ thống điện & NL tái tạo (CTTT)', 2), 
(11, '(EE-E8) Kỹ thuật Điều khiển - TĐH (CTTT)', 2),
(12, '(EE-EP) Tin học CN & TĐH (PFIEV)', 2), 
(13, '(EE1) Kỹ thuật điện', 2),
(14, '(EE2) Kỹ thuật Điều khiển - TĐH', 2), 
(22, '(ET-E16) TT số & KT đa phương tiện (CTTT)', 2),
(23, '(ET-E4) KT Điện tử - Viễn thông (CTTT)', 2), 
(24, '(ET-E5) Kỹ thuật Y sinh (CTTT)', 2),
(25, '(ET-E9) Hệ thống nhúng & IoT (CTTT)', 2), 
(26, '(ET-LUH) ĐTVT - ĐH Leibniz Hannover', 2),
(27, '(ET1) Điện tử và Viễn thông', 2), 
(28, '(ET2) Kỹ thuật Y sinh', 2),
(55, '(PH1) Vật lý kỹ thuật', 2), 
(56, '(PH2) Kỹ thuật hạt nhân', 2), 
(57, '(PH3) Vật lý Y khoa', 2),
-- Trường Ngoại ngữ (ID: 7)
(31, '(FL1) Tiếng Anh KHKT & CN', 7), 
(32, '(FL2) Tiếng Anh Chuyên nghiệp Quốc tế', 7),
(33, '(FL3) Tiếng Trung KHKT & CN', 7),
-- Trường Cơ khí (ID: 3)
(34, '(HE1) Kỹ thuật Nhiệt', 3), 
(42, '(ME-E1) Kỹ thuật Cơ điện tử (CTTT)', 3),
(43, '(ME-GU) Cơ khí - Chế tạo máy - ĐH Griffith', 3), 
(44, '(ME-LUH) Cơ điện tử - ĐH Leibniz Hannover', 3),
(45, '(ME-NUT) Cơ điện tử - ĐH Nagaoka', 3), 
(46, '(ME1) Kỹ thuật Cơ điện tử', 3),
(47, '(ME2) Kỹ thuật Cơ khí', 3), 
(58, '(TE-E2) Kỹ thuật Ô tô (CTTT)', 3),
(59, '(TE-EP) Cơ khí hàng không (PFIEV)', 3), 
(60, '(TE1) Kỹ thuật Ô tô', 3),
(61, '(TE2) Kỹ thuật Cơ khí động lực', 3), 
(62, '(TE3) Kỹ thuật Hàng không', 3),
-- Trường Công nghệ thông tin và truyền thông (ID: 1)
(35, '(IT-E10) KH Dữ liệu & TNTT (CTTT)', 1), 
(36, '(IT-E15) An toàn không gian số (CTTT)', 1),
(37, '(IT-E6) CNTT Việt-Nhật (CTTT)', 1), 
(38, '(IT-E7) CNTT Global ICT', 1),
(39, '(IT-EP) CNTT Việt-Pháp (PFIEV)', 1), 
(40, '(IT1) CNTT: Khoa học Máy tính', 1),
(41, '(IT2) CNTT: Kỹ thuật máy tính', 1), 
(48, '(MI1) Toán - Tin', 1),
(64, '(TROY-IT) Khoa học máy tính - ĐH Troy', 1),
-- Trường Vật liệu (ID: 4)
(50, '(MS-E3) KH & KT Vật liệu (CTTT)', 4), 
(51, '(MS1) Kỹ thuật Vật liệu', 4),
(52, '(MS2) KT vi điện tử & CN Nano', 4),
(53, '(MS3) CN vật liệu polyme & compozit', 4),
(54, '(MS5) Kỹ thuật in', 4), 
(65, '(TX1) Công nghệ Dệt May', 4);


-- 5. Bảng Course (Môn học)
INSERT INTO "Course" ("CourseID", "CourseName", "Credits", "FinalPercentage", "MajorID") VALUES
-- 100-series: đại cương – cơ sở
(101, 'Giải tích I',                                3, 0.70, 48),
(102, 'Đại số',                                     3, 0.70, 48),
(103, 'Tin học đại cương',                          3, 0.60, 40),
(104, 'Tiếng Anh I',                                3, 0.70, 31),
(105, 'Hình học họa hình',                          2, 0.70, 47),
(106, 'Lịch sử Đảng CSVN',                          2, 0.70, 19),
(107, 'Giáo dục thể chất A',                        1, 1.00, 19),
(108, 'Giải tích II',                               3, 0.70, 48),
(109, 'Phương trình vi phân & chuỗi',               2, 0.70, 48),
(110, 'Vật lý đại cương I',                         4, 0.70, 55),
(111, 'Tiếng Anh II',                               3, 0.70, 31),
(112, 'Vẽ kỹ thuật',                                2, 0.70, 47),
(113, 'Triết học Mác-Lênin',                        4, 0.70, 19),
(114, 'Giáo dục thể chất B',                        1, 1.00, 19),
(115, 'Giáo dục quốc phòng I',                      1, 1.00, 19),
(116, 'Kinh tế chính trị',                          3, 0.70, 19),
(117, 'CNXH khoa học',                              2, 0.70, 19),
(118, 'Tư tưởng HCM',                               2, 0.50, 19),
(119, 'Tiếng Anh KHKT',                             2, 0.70, 31),
(120, 'Giáo dục thể chất C',                        1, 1.00, 19),
(121, 'Giáo dục thể chất E',                        1, 1.00, 19),
(122, 'Giáo dục quốc phòng II',                     1, 1.00, 19),
(123, 'Vật lý đại cương II',                        4, 0.70, 55),
(124, 'Hoá học đại cương',                          3, 0.50, 6),
(125, 'Quản trị học đại cương',                     2, 0.50, 19),
(126, 'Phương pháp tính',                           2, 0.50, 48),
(127, 'Xác suất thống kê',                          3, 0.50, 48),
(128, 'Kỹ thuật điện',                              3, 0.70, 13),
(129, 'Kỹ thuật nhiệt',                             3, 0.70, 34),
(130, 'Cơ khí đại cương',                           2, 0.70, 47),
(131, 'Cơ học kỹ thuật',                            3, 0.70, 47),

-- 140-series: kỹ năng ngoại ngữ
(140, 'Kỹ năng nói tiếng Anh I',                    2, 0.50, 31),
(141, 'Kỹ năng nghe tiếng Anh I',                   2, 0.60, 31),
(142, 'Kỹ năng đọc tiếng Anh I',                    2, 0.60, 31),
(143, 'Cơ sở văn hoá Việt Nam',                     2, 0.60, 31),
(144, 'Tin học đại cương (IT-1020)',                3, 0.60, 40),
(145, 'Kỹ năng nói tiếng Anh II',                   2, 0.50, 31),
(146, 'Kỹ năng nghe tiếng Anh II',                  3, 0.60, 31),
(147, 'Kỹ năng đọc tiếng Anh II',                   3, 0.60, 31),
(148, 'Tiếng Việt thực hành',                       2, 0.60, 31),
(149, 'Dẫn luận ngôn ngữ',                          2, 0.60, 31),
(150, 'Kỹ năng nghe tiếng Anh III',                 3, 0.60, 31),
(151, 'Kỹ năng nói tiếng Anh III',                  3, 0.50, 31),
(152, 'Kỹ năng đọc tiếng Anh III',                  3, 0.60, 31),
(153, 'Kỹ năng viết tiếng Anh III',                 3, 0.50, 31),
(154, 'Tiếng Nga I',                                3, 0.70, 31),
(155, 'Tiếng Pháp I',                               3, 0.60, 31),
(156, 'Tiếng Nhật I',                               3, 0.60, 31),
(157, 'Kỹ năng nghe tiếng Anh IV',                  3, 0.65, 31),
(158, 'Kỹ năng nói tiếng Anh IV',                   3, 0.50, 31),
(159, 'Kỹ năng đọc tiếng Anh IV',                   3, 0.65, 31),
(160, 'Kỹ năng viết tiếng Anh IV',                  3, 0.50, 31),
(161, 'Văn hóa xã hội Anh',                         2, 0.60, 31),
(162, 'Tiếng Nga II',                               3, 0.70, 31),
(163, 'Tiếng Pháp II',                              3, 0.60, 31),
(164, 'Tiếng Nhật II',                              3, 0.60, 31),
(165, 'Tiếng Pháp AUF1',                            3, 0.70, 31),
(166, 'Tiếng Pháp AUF2',                            3, 0.70, 31),

-- 170-series: mở rộng cho MI/IT/EE/ME …
(170, 'Giải tích I (hệ 4TC)',                       4, 0.70, 48),
(171, 'Đại số (hệ 4TC)',                            4, 0.70, 48),
(172, 'Toán I (hệ 5TC)',                            5, 0.50, 48),
(173, 'Giải tích II (3TC)',                         3, 0.70, 48),
(174, 'Toán II (5TC)',                              5, 0.50, 48),
(175, 'Giải tích III',                              3, 0.70, 48),
(176, 'Toán rời rạc',                               2, 0.70, 48),
(177, 'Tin học đại cương (4TC)',                    4, 1.00, 40),
(178, 'Hình họa',                                   2, 1.00, 47),
(179, 'Vật lý (PH-1027)',                           4, 0.70, 55),

-- 180-series: ME (Cơ khí) chuyên ngành
(180, 'Đồ họa kỹ thuật',                            2, 0.60, 47),
(181, 'Cơ học kỹ thuật I',                          3, 0.70, 47),
(182, 'Cơ học kỹ thuật II',                         3, 0.70, 47),
(183, 'Sức bền vật liệu I',                         2, 0.60, 47),
(184, 'Nguyên lý máy',                              3, 0.60, 47),
(185, 'Kỹ thuật thủy khí',                           3, 0.70, 47),
(186, 'Chi tiết máy',                               3, 0.60, 47),
(187, 'Kỹ thuật điều khiển tự động',                3, 0.70, 46),
(188, 'Đồ án chi tiết máy',                         2, 1.00, 47),
(189, 'Công nghệ chế tạo máy',                      4, 0.70, 47),
(190, 'Đồ án công nghệ chế tạo máy',                2, 1.00, 47),

-- 200-series: EE (Điện – ĐKTĐ)
(200, 'Lý thuyết mạch điện I',                      4, 0.70, 13),
(201, 'Lý thuyết mạch điện II',                     2, 0.75, 13),
(202, 'Lý thuyết trường điện từ',                   2, 0.75, 13),
(203, 'Mạch điện tử tương tự',                      2, 0.75, 13),
(204, 'Kỹ thuật điện tử số',                        2, 0.75, 13),
(205, 'Máy điện I',                                 2, 0.70, 13),
(206, 'Máy điện II',                                3, 0.75, 13),
(207, 'Khí cụ điện',                                3, 0.75, 13),
(208, 'Lý thuyết điều khiển tự động I',             2, 0.75, 14),
(209, 'Lý thuyết điều khiển tuyến tính',            4, 0.70, 14),
(210, 'Lý thuyết điều khiển phi tuyến',             4, 0.70, 14),
(211, 'Lý thuyết điều khiển tự động',               3, 0.50, 14);

-- 6. Bảng CoursePrerequisite (Môn tiên quyết)
INSERT INTO "CoursePrerequisite" ("CourseID", "PreReqCourseID") VALUES
(182, 181), (206, 205), (164, 156), (166, 165);

-- 7. Bảng Tuition (Học phí)
INSERT INTO "Tuition" ("CourseID", "Semester", "TuitionRate")
SELECT c."CourseID", s."SemesterID", c."Credits" * 700000.0
FROM "Course" c, "Semester" s;

-- 8. Bảng Lecturer (Giảng viên) - Phân bổ vào các trường
INSERT INTO "Lecturer" ("LecturerID", "LecturerFirstName", "LecturerLastName", "Gender", "DOB", "Address", "EducationalLevel", "SchoolID") VALUES
(1, 'An', 'Nguyễn Văn', 'Nam', '1980-05-20', 'Ba Đình, Hà Nội', 'PGS.TS', 1), -- CNTT&TT
(2, 'Bình', 'Trần Thị', 'Nữ', '1985-11-15', 'Cầu Giấy, Hà Nội', 'ThS', 2), -- Điện - Điện tử
(3, 'Cường', 'Lê Minh', 'Nam', '1978-02-10', 'Tây Hồ, Hà Nội', 'TS', 3), -- Cơ khí
(4, 'Dung', 'Phạm Thu', 'Nữ', '1982-09-30', 'Đống Đa, Hà Nội', 'PGS.TS', 6), -- Kinh tế & Quản lý
(5, 'Giang', 'Hoàng Thị', 'Nữ', '1988-07-07', 'Thanh Xuân, Hà Nội', 'TS', 5), -- Hóa & KTS
(6, 'Hải', 'Vũ Đình', 'Nam', '1975-12-25', 'Hoàng Mai, Hà Nội', 'TS', 4), -- Vật liệu
(7, 'Khanh', 'Đỗ Thúy', 'Nữ', '1983-01-01', 'Hai Bà Trưng, Hà Nội', 'ThS', 7); -- Ngoại ngữ

-- 9. Bảng StudentClass (Lớp sinh viên) - Mẫu cho một số ngành
INSERT INTO "StudentClass" ("StudentClassID", "StudentClassName", "MajorID", "CohortYear", "NumberOfStudents", "MonitorID") VALUES
(101, 'IT1.01-K67', 40, 2022, 100, NULL), (102, 'IT2.01-K67', 41, 2022, 100, NULL),
(103, 'IT-E10.01-K68', 35, 2023, 60, NULL), (104, 'EE2.01-K67', 14, 2022, 80, NULL),
(105, 'ME1.01-K66', 46, 2021, 120, NULL), (106, 'EM3.01-K68', 19, 2023, 90, NULL),
(107, 'CH1.01-K66', 6, 2021, 70, NULL), (108, 'TE1.01-K67', 60, 2022, 110, NULL),
(109, 'FL1.01-K68', 31, 2023, 50, NULL);

-- 10. Bảng Student (Sinh viên) - Dữ liệu tĩnh 1000 sinh viên
DO $$
DECLARE
    first_names_male TEXT[] := ARRAY['Anh', 'Bảo', 'Cường', 'Dũng', 'Hiếu', 'Huy', 'Khánh', 'Long', 'Minh', 'Nam', 'Phúc', 'Quân', 'Sơn', 'Thành', 'Tuấn', 'Việt'];
    first_names_female TEXT[] := ARRAY['An', 'Chi', 'Dung', 'Giang', 'Hà', 'Hương', 'Lan', 'Linh', 'Mai', 'Nga', 'Oanh', 'Phương', 'Quỳnh', 'Thảo', 'Trang', 'Yến'];
    last_names TEXT[] := ARRAY['Nguyễn', 'Trần', 'Lê', 'Phạm', 'Hoàng', 'Vũ', 'Đặng', 'Bùi', 'Đỗ', 'Hồ', 'Ngô', 'Dương', 'Lý', 'Đoàn'];
    student_class_id INT; student_major_id INT; cohort_year INT; dob_year INT;
BEGIN
    FOR i IN 1..1000 LOOP
        SELECT sc."StudentClassID", sc."MajorID", sc."CohortYear" INTO student_class_id, student_major_id, cohort_year
        FROM "StudentClass" sc ORDER BY random() LIMIT 1;
        dob_year := cohort_year - 18;
        IF random() > 0.4 THEN
            INSERT INTO "Student" ("StudentID", "StudentFirstName", "StudentLastName", "Gender", "DOB", "Email", "Address", "Phone", "StudentClassID", "CPA", "MajorID")
            VALUES (i, first_names_male[1+floor(random()*16)], last_names[1+floor(random()*14)] || ' ' || 'Văn', 'M', make_date(dob_year, 1+floor(random()*12)::int, 1+floor(random()*28)::int),
            'student.' || (20000000 + i) || '@sis.hust.edu.vn', 'Hà Nội', '09' || lpad(floor(random()*100000000)::text, 8, '0'), student_class_id, round((1.8+random()*2.1)::numeric,2), student_major_id);
        ELSE
            INSERT INTO "Student" ("StudentID", "StudentFirstName", "StudentLastName", "Gender", "DOB", "Email", "Address", "Phone", "StudentClassID", "CPA", "MajorID")
            VALUES (i, first_names_female[1+floor(random()*16)], last_names[1+floor(random()*14)] || ' ' || 'Thị', 'F', make_date(dob_year, 1+floor(random()*12)::int, 1+floor(random()*28)::int),
            'student.' || (20000000 + i) || '@sis.hust.edu.vn', 'Hà Nội', '03' || lpad(floor(random()*100000000)::text, 8, '0'), student_class_id, round((2.0+random()*1.9)::numeric,2), student_major_id);
        END IF;
    END LOOP;
END $$;

-- 11. Cập nhật MonitorID cho StudentClass
UPDATE "StudentClass" sc SET "MonitorID" = (SELECT s."StudentID" FROM "Student" s WHERE s."StudentClassID" = sc."StudentClassID" ORDER BY random() LIMIT 1);

-- 12. Bảng CourseClass (Lớp học phần)
ALTER TABLE "CourseClass"
  ALTER COLUMN "ClassID" DROP DEFAULT,
  ALTER COLUMN "ClassID" ADD GENERATED ALWAYS AS IDENTITY;

-- Nạp dữ liệu – KHÔNG khai ClassID nữa
INSERT INTO "CourseClass" ("CourseID","Semester","Time","RoomID")
SELECT c."CourseID",
       s."SemesterID",
       CASE floor(random()*5)
            WHEN 0 THEN 'Sáng T2' WHEN 1 THEN 'Chiều T3'
            WHEN 2 THEN 'Sáng T4' WHEN 3 THEN 'Chiều T5'
            ELSE 'Sáng T6' END,
       cr."RoomID"
FROM (SELECT "CourseID" FROM "Course" ORDER BY random() LIMIT 50) c
CROSS JOIN "Semester" s
CROSS JOIN LATERAL (SELECT "RoomID" FROM "ClassRoom" ORDER BY random() LIMIT 1) cr;

-- 13. Bảng Teaching (Giảng dạy) - Gán GV đúng chuyên ngành
INSERT INTO "Teaching" ("LecturerID", "ClassID")
SELECT l."LecturerID", cc."ClassID"
FROM "CourseClass" cc
JOIN "Course" c ON cc."CourseID" = c."CourseID"
JOIN "Major" m ON c."MajorID" = m."MajorID"
JOIN "Lecturer" l ON m."SchoolID" = l."SchoolID"
WHERE random() < 0.5
GROUP BY l."LecturerID", cc."ClassID"
LIMIT 250;

-- 14. Bảng Register
ALTER TABLE "Register" DISABLE TRIGGER ALL;     -- tạm tắt mọi trigger
INSERT INTO "Register" ("StudentID","ClassID","MidtermScore","FinalScore")
SELECT DISTINCT ON (s."StudentID",cc."ClassID")
       s."StudentID",
       cc."ClassID",
       CASE WHEN cc."Semester" = '20242' THEN NULL
            ELSE round((random()*10)::numeric,1) END,
       CASE WHEN cc."Semester" = '20242' THEN NULL
            ELSE round((random()*10)::numeric,1) END
FROM   "Student" s
JOIN   "Course"  c  ON c."MajorID"  = s."MajorID"
JOIN   "CourseClass" cc ON TRUE
WHERE  random() < 0.1
ON CONFLICT DO NOTHING;        -- an toàn nếu lỡ còn trùng

ALTER TABLE "Register" ENABLE TRIGGER ALL;

-- 15. Bảng PayTuition (Thanh toán học phí)
INSERT INTO "PayTuition" ("StudentID", "Semester", "Amount", "PaymentDate", "Status")
SELECT "StudentID", "Semester", SUM("TuitionRate"),
    (CASE WHEN "Semester" <> '20242' AND random() > 0.2 THEN (SELECT "StartDate" FROM "Semester" WHERE "SemesterID" = r."Semester") + interval '1 month' ELSE NULL END),
    (CASE WHEN "Semester" = '20242' THEN 'Unpaid'::pay_status WHEN random() > 0.2 THEN 'Paid'::pay_status ELSE 'Unpaid'::pay_status END)
FROM (
    SELECT reg."StudentID", cc."Semester", t."TuitionRate"
    FROM "Register" reg
    JOIN "CourseClass" cc ON reg."ClassID" = cc."ClassID"
    JOIN "Tuition" t ON cc."CourseID" = t."CourseID" AND cc."Semester" = t."Semester"
) as r GROUP BY "StudentID", "Semester" ON CONFLICT ("StudentID", "Semester") DO NOTHING;

-- 16. Bảng Headmaster (Chủ nhiệm lớp) - Gán GV đúng chuyên ngành
INSERT INTO "Headmaster" ("LecturerID", "StudentClassID")
SELECT (SELECT l."LecturerID" FROM "Lecturer" l WHERE l."SchoolID" = m."SchoolID" ORDER BY random() LIMIT 1),
    sc."StudentClassID"
FROM "StudentClass" sc
JOIN "Major" m ON sc."MajorID" = m."MajorID"
ON CONFLICT ("LecturerID", "StudentClassID") DO NOTHING;

