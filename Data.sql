/*============================================================
  1. SCHOOL
  ============================================================*/
INSERT INTO "School" ("SchoolID","SchoolName","Address","NumberOfTeachers") VALUES
  (1,'Trường Công nghệ Thông tin & Truyền thông','B1',120),
  (2,'Khoa Toán - Tin','D3',80),
  (3,'Viện Vật lý Kỹ thuật','D3',65),
  (4,'Trường Hoá & Khoa học Sự sống','D6',70),
  (5,'Trường Điện - Điện tử','D7',90);

/*============================================================
  2. MAJOR
  ============================================================*/
INSERT INTO "Major" ("MajorID","MajorName","SchoolID") VALUES
  (1,'Khoa học máy tính',1),
  (2,'Công nghệ thông tin Việt - Nhật',1),
  (3,'Trí tuệ nhân tạo',1),
  (4,'Toán - Tin',2),
  (5,'Hệ thống quản lý',2),
  (6,'Vật lý kỹ thuật',3),
  (7,'Kỹ thuật hoá học',4),
  (8,'Kỹ thuật sinh học',4),
  (9,'Điện tử viễn thông',5),
  (10,'Truyền thông số',5);

/*============================================================
  3. COURSE
  ============================================================*/
INSERT INTO "Course" ("CourseID","CourseName","Credits","FinalPercentage","MajorID") VALUES
  -- Khoa học máy tính
  (1 ,'Cơ sở dữ liệu',            4,0.50,1),
  (2 ,'Hệ điều hành',             4,0.60,1),
  (3 ,'Phương pháp tối ưu',       3,0.70,1),
  -- CNTT Việt-Nhật
  (4 ,'Tiếng Nhật',               3,0.50,2),
  (5 ,'ITSS',                     4,0.60,2),
  (6 ,'Lập trình hướng đối tượng',5,0.70,2),
  -- Trí tuệ nhân tạo
  (7 ,'Nhập môn Trí tuệ nhân tạo',3,0.50,3),
  (8 ,'Học máy',                  4,0.60,3),
  (9 ,'Thị giác máy tính',        4,0.70,3),
  -- Toán-Tin
  (10,'Giải tích số',             3,0.50,4),
  (11,'Đại số',                   4,0.60,4),
  -- Hệ thống quản lý
  (12,'Quản trị học đại cương',   3,0.70,5),
  -- Vật lý kỹ thuật
  (13,'Vật lý đại cương',         4,0.50,6),
  (14,'Vật lý lượng tử',          4,0.60,6),
  -- Kỹ thuật hoá học
  (15,'Hoá đại cương',            4,0.70,7),
  (16,'Hoá công',                 3,0.50,7),
  -- Kỹ thuật sinh học
  (17,'Hoá sinh',                 4,0.60,8),
  (18,'Sinh học đại cương',       3,0.70,8),
  -- Điện tử viễn thông
  (19,'Kỹ thuật điện',            4,0.50,9),
  (20,'Vật lý điện tử',           3,0.60,9),
  -- Truyền thông số
  (21,'Xử lý tín hiệu',           4,0.70,10),
  (22,'Giao tiếp không dây',      4,0.50,10);

/*============================================================
  4. TUITION  (đơn giá/tín chỉ kỳ 2025A)
  ============================================================*/
INSERT INTO "Tuition" ("CourseID","Semester","CreditCost") VALUES
  (1 ,'2025A',650000),(2 ,'2025A',650000),(3 ,'2025A',650000),
  (4 ,'2025A',620000),(5 ,'2025A',620000),(6 ,'2025A',620000),
  (7 ,'2025A',800000),(8 ,'2025A',800000),(9 ,'2025A',800000),
  (10,'2025A',600000),(11,'2025A',600000),
  (12,'2025A',600000),
  (13,'2025A',700000),(14,'2025A',700000),
  (15,'2025A',680000),(16,'2025A',680000),
  (17,'2025A',650000),(18,'2025A',650000),
  (19,'2025A',850000),(20,'2025A',850000),
  (21,'2025A',820000),(22,'2025A',820000);

/*============================================================
  5. CLASSROOM
  ============================================================*/
INSERT INTO "ClassRoom" ("RoomID","Address","Capacity") VALUES
  (1,'Tòa B1',60),
  (2,'Tòa D3',55),
  (3,'Tòa D5',55),
  (4,'Liên thông D3-5',40),
  (5,'Tòa D7',50),
  (6,'Tòa D9',45),
  (7,'Tòa C7',60);

/*============================================================
  6. COURSECLASS (10 lớp học phần)
  ============================================================*/
INSERT INTO "CourseClass" ("ClassID","CourseID","Semester","Time","NumberOfStudents","RoomID") VALUES
  (1 ,1 ,'2025A','Mon 08:00-10:00',2 ,1),  -- CSDL
  (2 ,2 ,'2025A','Tue 10:00-12:00',2 ,2),  -- HĐH
  (3 ,4 ,'2025A','Wed 13:00-15:00',2 ,3),  -- Tiếng Nhật
  (4 ,5 ,'2025A','Thu 08:00-11:00',2 ,4),  -- ITSS
  (5 ,7 ,'2025A','Fri 10:00-12:00',2 ,5),  -- NM AI
  (6 ,8 ,'2025A','Mon 13:00-15:00',2 ,6),  -- Học máy
  (7 ,10,'2025A','Tue 08:00-10:00',2 ,7),  -- Giải tích số
  (8 ,12,'2025A','Wed 15:00-17:00',2 ,1),  -- Quản trị
  (9 ,19,'2025A','Thu 13:00-16:00',2 ,5),  -- Kỹ thuật điện
  (10,21,'2025A','Fri 08:00-11:00',2 ,6);  -- Xử lý tín hiệu

/*============================================================
  7. STUDENTCLASS  (MonitorID để NULL tạm thời)
  ============================================================*/
INSERT INTO "StudentClass" ("StudentClassID","StudentClassName","NumberOfStudents","MonitorID") VALUES
  (1,'CNTT 01',4,NULL),
  (2,'AI 01',  2,NULL),
  (3,'VT 01',  1,NULL),
  (4,'DTVT 01',1,NULL);

/*============================================================
  8. STUDENT
  ============================================================*/
INSERT INTO "Student" (
  "StudentID","StudentFirstName","StudentLastName","StudentGender",
  "StudentDOB","StudentEmail","StudentAddress","StudentPhone",
  "StudentClassID","MajorID"
) VALUES
  (1,'Minh','Nguyen','M','2004-03-12','minh1@stu.edu','Hà Nội','0901000001',1,1),
  (2,'Lan','Tran','F','2004-07-19','lan2@stu.edu','Hà Nội','0901000002',1,2),
  (3,'An','Pham','M','2005-01-25','an3@stu.edu','Hà Nội','0901000003',2,3),
  (4,'Bình','Hoang','F','2005-05-30','binh4@stu.edu','Hà Nội','0901000004',1,4),
  (5,'Châu','Vo','M','2005-11-11','chau5@stu.edu','Hà Nội','0901000005',3,6),
  (6,'Dung','Le','F','2004-09-02','dung6@stu.edu','Hà Nội','0901000006',3,7),
  (7,'Hà','Do','M','2005-04-18','ha7@stu.edu','Hà Nội','0901000007',4,9),
  (8,'Khánh','Bui','F','2004-12-27','khanh8@stu.edu','Hà Nội','0901000008',4,10);

/*--- Gán monitor cho từng lớp ---*/
UPDATE "StudentClass" SET "MonitorID" = 1 WHERE "StudentClassID" = 1;
UPDATE "StudentClass" SET "MonitorID" = 3 WHERE "StudentClassID" = 2;
UPDATE "StudentClass" SET "MonitorID" = 5 WHERE "StudentClassID" = 3;
UPDATE "StudentClass" SET "MonitorID" = 7 WHERE "StudentClassID" = 4;

/*============================================================
  9. REGISTER  (đăng ký theo ClassID, kỳ 2025A)
  ============================================================*/
INSERT INTO "Register" ("StudentID","ClassID","Semester","MidtermScore","FinalScore") VALUES
  (1,1,'2025A',7.5,8.0),
  (1,2,'2025A',NULL,NULL),
  (2,3,'2025A',8.0,8.3),
  (2,4,'2025A',7.2,7.9),
  (3,5,'2025A',NULL,NULL),
  (3,6,'2025A',NULL,NULL),
  (4,7,'2025A',6.8,7.4),
  (4,8,'2025A',6.9,7.1),
  (5,9,'2025A',7.1,7.8),
  (5,9,'2025A',NULL,NULL),  -- chỉ 1 lớp (ClassID 9)
  (6,6,'2025A',NULL,NULL),  -- ClassID 6
  (7,10,'2025A',8.2,8.6),
  (8,10,'2025A',NULL,NULL);

/*============================================================
 10. PAYTUITION  (quy tắc: trả hết hoặc chưa trả gì)
  ============================================================*/
-- Minh (SV 1) - ĐÃ thanh toán cả hai môn
INSERT INTO "PayTuition" VALUES
  (1,1 ,'2025A',2600000,'2025-06-03','PAID'),
  (1,2 ,'2025A',2600000,'2025-06-03','PAID');

-- Lan (SV 2) - ĐÃ thanh toán cả hai môn
INSERT INTO "PayTuition" VALUES
  (2,4 ,'2025A',1860000,'2025-06-04','PAID'),
  (2,5 ,'2025A',2480000,'2025-06-04','PAID');

-- An (SV 3) - CHƯA thanh toán môn nào
INSERT INTO "PayTuition" VALUES
  (3,7 ,'2025A',2400000,NULL,'UNPAID'),
  (3,8 ,'2025A',3200000,NULL,'UNPAID');

-- Bình (SV 4) - ĐÃ thanh toán cả hai môn
INSERT INTO "PayTuition" VALUES
  (4,10,'2025A',1800000,'2025-06-05','PAID'),
  (4,12,'2025A',1800000,'2025-06-05','PAID');

-- Châu (SV 5) - CHƯA thanh toán môn nào
INSERT INTO "PayTuition" VALUES
  (5,13,'2025A',2800000,NULL,'UNPAID'),
  (5,14,'2025A',2800000,NULL,'UNPAID');

-- Dung (SV 6) - CHƯA thanh toán môn nào
INSERT INTO "PayTuition" VALUES
  (6,15,'2025A',2380000,NULL,'UNPAID'),
  (6,16,'2025A',2040000,NULL,'UNPAID');

-- Hà & Khánh (SV 7,8) - CHƯA thanh toán môn nào
INSERT INTO "PayTuition" VALUES
  (7,19,'2025A',3400000,NULL,'UNPAID'),
  (7,21,'2025A',3280000,NULL,'UNPAID'),
  (8,19,'2025A',3400000,NULL,'UNPAID'),
  (8,21,'2025A',3280000,NULL,'UNPAID');
