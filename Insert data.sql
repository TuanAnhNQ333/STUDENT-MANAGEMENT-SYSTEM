
BEGIN;
ALTER TABLE "Register" DISABLE TRIGGER ALL;
/*========== 1. School ==========*/
INSERT INTO "School" ("SchoolID", "SchoolName", "Address") VALUES
(1 ,'Đại học Bách Khoa Hà Nội',            'Số 1 Đại Cồ Việt, Hai Bà Trưng, Hà Nội'),
(2 ,'Đại học Quốc gia Hà Nội',             '144 Xuân Thủy, Cầu Giấy, Hà Nội'),
(3 ,'Đại học Xây dựng Hà Nội',             '55 Giải Phóng, Hai Bà Trưng, Hà Nội'),
(4 ,'Đại học Giao thông Vận tải',          'Số 3 Cầu Giấy, Hà Nội'),
(5 ,'Đại học Mỏ – Địa chất',               '18 Phố Viên, Bắc Từ Liêm, Hà Nội'),
(6 ,'Học viện Bưu chính Viễn thông',       'Km10 Nguyễn Trãi, Hà Đông, Hà Nội'),
(7 ,'Học viện Tài chính',                  '58 Lê Văn Hiến, Bắc Từ Liêm, Hà Nội'),
(8 ,'Học viện Ngân hàng',                  '12 Chùa Bộc, Đống Đa, Hà Nội'),
(9 ,'Đại học Công nghiệp Hà Nội',          '298 Cầu Diễn, Bắc Từ Liêm, Hà Nội'),
(10,'Đại học Thủy Lợi',                    '175 Tây Sơn, Đống Đa, Hà Nội');

/*========== 2. Semester ==========*/
INSERT INTO "Semester" ("SemesterID","AcademicYear","StartDate","EndDate",
                        "Status","RegisterStart","RegisterEnd") VALUES
('2021A','2021-2022','2021-08-15','2021-12-20','Ended','2021-07-01','2021-07-15'),
('2021B','2021-2022','2022-01-05','2022-05-30','Ended','2021-12-15','2021-12-31'),
('2022A','2022-2023','2022-08-15','2022-12-20','Ended','2022-07-01','2022-07-15'),
('2022B','2022-2023','2023-01-05','2023-05-30','Ended','2022-12-15','2022-12-31'),
('2023A','2023-2024','2023-08-15','2023-12-20','Ended','2023-07-01','2023-07-15'),
('2023B','2023-2024','2024-01-05','2024-05-30','Ended','2023-12-15','2023-12-31'),
('2024A','2024-2025','2024-08-15','2024-12-20','OnGoing','2024-07-01','2024-07-15'),
('2024B','2024-2025','2025-01-05','2025-05-30','OnGoing','2024-12-15','2024-12-31'),
('2025A','2025-2026','2025-08-15','2025-12-20','OnGoing','2025-07-01','2025-07-15'),
('2025B','2025-2026','2026-01-05','2026-05-30','OnGoing','2025-12-15','2025-12-31');

/*========== 3. ClassRoom ==========*/
INSERT INTO "ClassRoom" ("RoomID","Address","Capacity") VALUES
('H1-101','Tòa H1',100),('H1-102','Tòa H1',100),('H1-103','Tòa H1', 80),
('C2-201','Tòa C2',120),('C2-202','Tòa C2',120),
('D3-301','Tòa D3', 70),('D3-302','Tòa D3', 70),
('B1-401','Tòa B1', 60),('B1-402','Tòa B1', 60),('B1-403','Tòa B1', 60);

/*========== 4. Major ==========*/
INSERT INTO "Major" ("MajorID","MajorName","SchoolID") VALUES
(1,'Khoa học Máy tính',1),(2,'Kỹ thuật Điện',1),(3,'Kỹ thuật Cơ khí',1),
(4,'Kỹ thuật Môi trường',1),(5,'Kỹ thuật Hóa học',1),(6,'Kỹ thuật Xây dựng',1),
(7,'Hệ thống Thông tin',1),(8,'Cơ điện tử',1),(9,'Quản trị Công nghiệp',1),
(10,'Công nghệ Sinh học',1);

/*========== 5. Course ==========*/
INSERT INTO "Course" ("CourseID","CourseName","Credits","FinalPercentage","MajorID") VALUES
(1 ,'CS101 Nhập môn Lập trình',      3,0.6,1),
(2 ,'CS102 Cấu trúc Dữ liệu',        3,0.6,1),
(3 ,'EE201 Phân tích Mạch',          3,0.6,2),
(4 ,'ME301 Nhiệt động lực',          3,0.6,3),
(5 ,'CE101 Sức bền Vật liệu',        3,0.6,6),
(6 ,'CH101 Hóa hữu cơ',              4,0.6,5),
(7 ,'EN201 Khoa học Môi trường',     2,0.6,4),
(8 ,'IS101 Hệ quản trị CSDL',        3,0.6,7),
(9 ,'MT201 Robot cơ bản',            3,0.6,8),
(10,'IM301 Quản trị Vận hành',       3,0.6,9);

/*========== 6. CoursePrerequisite ==========*/
INSERT INTO "CoursePrerequisite" ("CourseID","PreReqCourseID") VALUES
(2 ,1),(3 ,1),(4 ,2),(5 ,3),(6 ,3),
(7 ,4),(8 ,2),(9 ,2),(10,4),(10,3);

/*========== 7. Tuition ==========*/
INSERT INTO "Tuition" ("CourseID","Semester","TuitionRate") VALUES
(1 ,'2024A',1500000.00),(2 ,'2024A',1500000.00),(3 ,'2024A',1500000.00),
(4 ,'2024A',1600000.00),(5 ,'2024A',1400000.00),(6 ,'2024A',1700000.00),
(7 ,'2024A',1400000.00),(8 ,'2024A',1500000.00),(9 ,'2024A',1600000.00),
(10,'2024A',1500000.00);

/*========== 8. StudentClass ==========*/
INSERT INTO "StudentClass"
("StudentClassID","StudentClassName","MajorID","CohortYear","NumberOfStudents","MonitorID")
VALUES
(1 ,'K65-CS1',1 ,2024,30,NULL),(2 ,'K65-EE1',2 ,2024,30,NULL),
(3 ,'K65-ME1',3 ,2024,30,NULL),(4 ,'K65-EN1',4 ,2024,30,NULL),
(5 ,'K65-CH1',5 ,2024,30,NULL),(6 ,'K65-CE1',6 ,2024,30,NULL),
(7 ,'K65-IS1',7 ,2024,30,NULL),(8 ,'K65-MT1',8 ,2024,30,NULL),
(9 ,'K65-IM1',9 ,2024,30,NULL),(10,'K65-BT1',10,2024,30,NULL);

/*========== 9. CourseClass ==========*/
INSERT INTO "CourseClass"
("ClassID","CourseID","Semester","Time","RoomID") VALUES
(1 ,1 ,'2024A','Mon 07:30','H1-101'),
(2 ,2 ,'2024A','Tue 09:30','H1-102'),
(3 ,3 ,'2024A','Wed 13:30','H1-103'),
(4 ,4 ,'2024A','Thu 07:30','C2-201'),
(5 ,5 ,'2024A','Fri 09:30','C2-202'),
(6 ,6 ,'2024A','Mon 13:30','D3-301'),
(7 ,7 ,'2024A','Tue 13:30','D3-302'),
(8 ,8 ,'2024A','Wed 09:30','B1-401'),
(9 ,9 ,'2024A','Thu 13:30','B1-402'),
(10,10,'2024A','Fri 13:30','B1-403');

/*========== 10. Lecturer ==========*/
INSERT INTO "Lecturer"
("LecturerID","LecturerFirstName","LecturerLastName","Gender",
 "DOB","Address","EducationalLevel","SchoolID") VALUES
(1 ,'Tuấn','Phạm','M','1980-03-15','Hà Nội','PhD',1),
(2 ,'Trang','Lê'  ,'F','1982-05-10','Hà Nội','PhD',1),
(3 ,'Hùng','Trần','M','1979-07-08','Hà Nội','PhD',1),
(4 ,'Thảo','Nguyễn','F','1983-09-21','Hà Nội','PhD',1),
(5 ,'Long','Vũ'  ,'M','1981-11-11','Hà Nội','PhD',1),
(6 ,'Quỳnh','Đào','F','1984-01-19','Hà Nội','PhD',1),
(7 ,'Sơn','Hồ'   ,'M','1978-04-30','Hà Nội','PhD',1),
(8 ,'Mai','Bùi'  ,'F','1985-06-24','Hà Nội','PhD',1),
(9 ,'Việt','Đặng','M','1980-08-12','Hà Nội','PhD',1),
(10,'Hà','Hoàng','F','1983-12-09','Hà Nội','PhD',1);

/*========== 11. Student ==========*/
INSERT INTO "Student"
("StudentID","StudentFirstName","StudentLastName","Gender","DOB",
 "Email","Address","Phone","StudentClassID","CPA","MajorID") VALUES
(1 ,'Nam'  ,'Nguyễn','M','2004-05-12','nam1@example.com','Hà Nội','0123456781',1,7.50,1),
(2 ,'Anh'  ,'Trần'  ,'F','2004-06-23','anh2@example.com','Hà Nội','0123456782',2,8.20,2),
(3 ,'Bình' ,'Lê'    ,'M','2004-07-11','binh3@example.com','Hà Nội','0123456783',3,7.90,3),
(4 ,'Chi'  ,'Phạm'  ,'F','2004-08-02','chi4@example.com','Hà Nội','0123456784',4,8.10,4),
(5 ,'Dũng' ,'Hoàng' ,'M','2004-09-19','dung5@example.com','Hà Nội','0123456785',5,7.60,5),
(6 ,'Hiền' ,'Vũ'    ,'F','2004-10-20','hien6@example.com','Hà Nội','0123456786',6,8.30,6),
(7 ,'Khánh','Đỗ'    ,'M','2004-11-14','khanh7@example.com','Hà Nội','0123456787',7,7.80,7),
(8 ,'Lan'  ,'Ngô'   ,'F','2004-12-25','lan8@example.com','Hà Nội','0123456788',8,8.50,8),
(9 ,'Minh' ,'Vương' ,'M','2005-01-30','minh9@example.com','Hà Nội','0123456789',9,7.70,9),
(10,'Oanh' ,'Đặng' ,'F','2005-02-22','oanh10@example.com','Hà Nội','0123456790',10,8.40,10);

/*========== 12. Headmaster ==========*/
INSERT INTO "Headmaster" ("LecturerID","StudentClassID") VALUES
(1 ,1),(2 ,2),(3 ,3),(4 ,4),(5 ,5),
(6 ,6),(7 ,7),(8 ,8),(9 ,9),(10,10);

/*========== 13. Teaching ==========*/
INSERT INTO "Teaching" ("LecturerID","ClassID") VALUES
(1 ,1),(2 ,2),(3 ,3),(4 ,4),(5 ,5),
(6 ,6),(7 ,7),(8 ,8),(9 ,9),(10,10);

/*========== 14. Register ==========*/
INSERT INTO "Register"
("StudentID","ClassID","MidtermScore","FinalScore") VALUES
(1 ,1 ,7.5,8.0),(2 ,2 ,8.0,8.5),(3 ,3 ,7.0,7.5),
(4 ,4 ,8.0,8.2),(5 ,5 ,6.5,7.0),(6 ,6 ,8.2,8.7),
(7 ,7 ,7.5,7.8),(8 ,8 ,8.5,9.0),(9 ,9 ,7.2,7.4),(10,10,8.0,8.6);

/*========== 15. PayTuition ==========*/
INSERT INTO "PayTuition"
("StudentID","Semester","Amount","PaymentDate","Status") VALUES
(1 ,'2024A',1500000.00,'2024-08-10','Paid'),
(2 ,'2024A',1500000.00,'2024-08-11','Paid'),
(3 ,'2024A',1500000.00,'2024-08-12','Paid'),
(4 ,'2024A',1600000.00,'2024-08-13','Paid'),
(5 ,'2024A',1400000.00,'2024-08-14','Paid'),
(6 ,'2024A',1500000.00,            NULL,'Unpaid'),
(7 ,'2024A',1500000.00,            NULL,'Unpaid'),
(8 ,'2024A',1500000.00,            NULL,'Unpaid'),
(9 ,'2024A',1600000.00,            NULL,'Unpaid'),
(10,'2024A',1500000.00,            NULL,'Unpaid');

ALTER TABLE "Register" ENABLE TRIGGER ALL;

COMMIT;