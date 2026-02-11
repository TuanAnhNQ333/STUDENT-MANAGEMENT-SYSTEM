/* 1. Thông tin cơ bản sinh viên */
CREATE OR REPLACE VIEW v_student_basic AS
SELECT "StudentID", "StudentFirstName", "StudentLastName", "Gender", "DOB", "StudentClassID"
FROM "Student";

/* 2. Thông tin lớp sinh viên */
CREATE OR REPLACE VIEW v_student_class_info AS
SELECT sc."StudentClassID", sc."StudentClassName",
       CONCAT(l."LecturerLastName", ' ', l."LecturerFirstName") AS homeroom_teacher, CONCAT(m."StudentLastName", ' ', m."StudentFirstName")    AS monitor_name, sc."NumberOfStudents"
FROM "StudentClass" sc
LEFT JOIN "Headmaster" hm ON hm."StudentClassID" = sc."StudentClassID"
LEFT JOIN "Lecturer" l ON l."LecturerID" = hm."LecturerID"
LEFT JOIN "Student" m ON m."StudentID" = sc."MonitorID";

/* 3. Số môn SV đăng ký theo kỳ */
CREATE OR REPLACE VIEW v_student_course_count AS
SELECT s."StudentID", CONCAT(s."StudentLastName", ' ', s."StudentFirstName") AS student_name, cc."Semester", COUNT(*)::INT AS course_count
FROM "Register" r
JOIN "Student" s ON s."StudentID" = r."StudentID"
JOIN "CourseClass" cc ON cc."ClassID"  = r."ClassID"
GROUP BY s."StudentID", student_name, cc."Semester";

/* 4. Học phí SV theo kỳ */
CREATE OR REPLACE VIEW v_student_tuition AS
SELECT pt."StudentID", CONCAT(s."StudentLastName", ' ', s."StudentFirstName") AS student_name, pt."Semester", pt."Amount", pt."Status"
FROM "PayTuition" pt
JOIN "Student" s ON s."StudentID" = pt."StudentID";

/* 5. View cho sinh viên trả tiền  (chỉ UPDATE status) */
CREATE OR REPLACE VIEW v_student_pay AS
SELECT "StudentID", "Semester", "Amount", "Status"
FROM "PayTuition"
WHERE "Status" = 'Unpaid';

/* 6. Thông tin CourseClass */
CREATE OR REPLACE VIEW v_course_class_info AS
SELECT cc."ClassID", cc."CourseID", cc."Semester", cc."Time", COUNT(r."StudentID")::INT AS student_count, cr."Address"
FROM   "CourseClass" cc
LEFT  JOIN "ClassRoom" cr ON cr."RoomID"  = cc."RoomID"
LEFT  JOIN "Register"  r  ON r."ClassID"  = cc."ClassID"
GROUP BY cc."ClassID", cc."CourseID", cc."Semester", cc."Time", cr."Address";

/* 7. Học phí của từng Course */
CREATE OR REPLACE VIEW v_course_tuition AS
SELECT c."CourseID", c."CourseName", t."Semester", t."TuitionRate", c."Credits", (c."Credits" * t."TuitionRate")::NUMERIC(12,2) AS total
FROM "Course" c
JOIN "Tuition" t ON t."CourseID" = c."CourseID";

/* 8. Thông tin chi tiết Course + danh sách tiên quyết */
CREATE OR REPLACE VIEW v_course_detail AS
SELECT c.*, STRING_AGG(cp_req."CourseName", ', ') AS prerequisites
FROM   "Course" c
LEFT JOIN "CoursePrerequisite" cp ON cp."CourseID" = c."CourseID"
LEFT JOIN "Course" cp_req         ON cp_req."CourseID" = cp."PreReqCourseID"
GROUP BY c."CourseID";

/* 9. Thông tin ngành */
CREATE OR REPLACE VIEW v_major_info AS
SELECT m."MajorID", m."MajorName", s."SchoolName", COUNT(st."StudentID")::INT AS student_count
FROM   "Major"  m
JOIN   "School" s  ON s."SchoolID" = m."SchoolID"
LEFT  JOIN "StudentClass" sc ON sc."MajorID" = m."MajorID"
LEFT  JOIN "Student"      st ON st."StudentClassID" = sc."StudentClassID"
GROUP BY m."MajorID", m."MajorName", s."SchoolName";

/* 10. Thông tin học kỳ */
CREATE OR REPLACE VIEW v_semester_info AS
SELECT "SemesterID", "AcademicYear", "StartDate", "EndDate", COALESCE(TO_CHAR("RegisterStart",'YYYY-MM-DD'),'Chưa có lịch') AS "RegisterStart", 
		COALESCE(TO_CHAR("RegisterEnd",'YYYY-MM-DD'),'Chưa có lịch')   AS "RegisterEnd", "Status"
FROM "Semester";

/* 11. Thông tin giảng viên */
CREATE OR REPLACE VIEW v_lecturer_info AS
SELECT CONCAT("LecturerLastName",' ', "LecturerFirstName") AS lecturer_name, "Gender", "DOB", "EducationalLevel", sch."SchoolName"
FROM   "Lecturer" l
LEFT  JOIN "School" sch ON sch."SchoolID" = l."SchoolID";

/* 12. Điểm từng môn + quy đổi */
CREATE OR REPLACE VIEW v_course_score AS
SELECT  q."StudentID", q.student_name, q."Semester", q."CourseID", q."CourseName", q."MidtermScore", q."FinalScore", q.course_score10,
	-- Quy đổi sang chữ
        CASE
          WHEN q.course_score10 < 4   THEN 'F'
          WHEN q.course_score10 < 5   THEN 'D'
          WHEN q.course_score10 < 5.5 THEN 'D+'
          WHEN q.course_score10 < 6.5 THEN 'C'
          WHEN q.course_score10 < 7   THEN 'C+'
          WHEN q.course_score10 < 8   THEN 'B'
          WHEN q.course_score10 < 8.5 THEN 'B+'
          WHEN q.course_score10 < 9.5 THEN 'A'
          ELSE 'A+'
        END AS letter_grade,
	-- Quy đổi sang hệ 4
        CASE
          WHEN q.course_score10 < 4   THEN 0
          WHEN q.course_score10 < 5   THEN 1
          WHEN q.course_score10 < 5.5 THEN 1.5
          WHEN q.course_score10 < 6.5 THEN 2
          WHEN q.course_score10 < 7   THEN 2.5
          WHEN q.course_score10 < 8   THEN 3
          WHEN q.course_score10 < 8.5 THEN 3.5
          ELSE 4
        END AS grade4
FROM (
    SELECT s."StudentID", CONCAT(s."StudentLastName",' ',s."StudentFirstName") AS student_name, cc."Semester", c."CourseID", c."CourseName", r."MidtermScore", r."FinalScore",
           ROUND( (r."MidtermScore" * (1 - c."FinalPercentage") + r."FinalScore"   * c."FinalPercentage")::NUMERIC , 2) AS course_score10
    FROM "Register" r
    JOIN "Student" s  ON s."StudentID" = r."StudentID"
    JOIN "CourseClass" cc ON cc."ClassID"  = r."ClassID"
    JOIN "Course" c  ON c."CourseID"  = cc."CourseID"
) q;



/* 13. GPA theo kỳ */
CREATE OR REPLACE VIEW v_student_gpa AS
SELECT v."StudentID", v.student_name, v."Semester",
       ROUND( SUM(v.grade4 * c."Credits")::NUMERIC / NULLIF(SUM(c."Credits"),0), 2) AS GPA,
       SUM(c."Credits")::INT AS semester_credits
FROM   v_course_score   v
JOIN   "Course" c ON c."CourseID" = v."CourseID"
WHERE  v.letter_grade <> 'F'
GROUP  BY v."StudentID", v.student_name, v."Semester";

/* 14. CPA */
CREATE OR REPLACE VIEW v_student_cpa AS
SELECT  s."StudentID", CONCAT(s."StudentLastName",' ',s."StudentFirstName") AS student_name, s."CPA" AS current_cpa, COALESCE(SUM(passed."Credits"),0)::INT AS total_credits
FROM    "Student" s
LEFT JOIN (
        SELECT  v."StudentID", c."Credits"
        FROM v_course_score v
        JOIN "Course"  c  ON c."CourseID" = v."CourseID"
        WHERE v.letter_grade <> 'F'
) passed ON passed."StudentID" = s."StudentID"
GROUP BY s."StudentID", student_name, s."CPA";

/* 15. Thời khóa biểu */
CREATE OR REPLACE VIEW v_student_schedule AS
SELECT s."StudentID", CONCAT(s."StudentLastName", ' ', s."StudentFirstName") AS student_name, cc."Semester", cc."ClassID",
       c."CourseID", c."CourseName", cc."Time", cc."RoomID", cr."Address" AS room_address
FROM "Register" r
JOIN "Student" s  ON s."StudentID" = r."StudentID"
JOIN "CourseClass" cc ON cc."ClassID"  = r."ClassID"
JOIN "Course"  c  ON c."CourseID"  = cc."CourseID"
LEFT JOIN "ClassRoom" cr ON cr."RoomID" = cc."RoomID";

/* 16. Danh sách lớp giảng viên phụ trách */
CREATE OR REPLACE VIEW v_lecturer_classes AS
SELECT l."LecturerID", CONCAT(l."LecturerLastName",' ', l."LecturerFirstName") AS lecturer_name, cc."ClassID",
    c."CourseID", c."CourseName", cc."Semester",
    cc."Time", cc."RoomID", cr."Address" AS room_address, COUNT(r."StudentID")::INT AS student_count
FROM "Teaching" t
JOIN "Lecturer" l  ON l."LecturerID" = t."LecturerID"
JOIN "CourseClass"  cc ON cc."ClassID"   = t."ClassID"
JOIN "Course" c  ON c."CourseID"   = cc."CourseID"
LEFT JOIN "ClassRoom" cr ON cr."RoomID"  = cc."RoomID"
LEFT JOIN "Register"  r  ON r."ClassID"  = cc."ClassID"
GROUP BY l."LecturerID", lecturer_name, cc."ClassID", c."CourseID", c."CourseName", cc."Semester", cc."Time", cc."RoomID", cr."Address";

/* 17. Xem danh sách sinh viên trong từng lớp của giảng viên*/
CREATE OR REPLACE VIEW v_lecturer_class_students AS
SELECT l."LecturerID", CONCAT(l."LecturerLastName",' ', l."LecturerFirstName") AS lecturer_name, cc."ClassID",
       cc."Semester", c."CourseID", c."CourseName", s."StudentID",
       CONCAT(s."StudentLastName",' ', s."StudentFirstName") AS student_name, sc."StudentClassName" AS student_class, s."Gender", s."DOB"
FROM "Teaching" t
JOIN "Lecturer" l ON l."LecturerID" = t."LecturerID"
JOIN "CourseClass" cc ON cc."ClassID" = t."ClassID"
JOIN "Course" c ON c."CourseID" = cc."CourseID"
JOIN "Register" r ON r."ClassID" = cc."ClassID"
JOIN "Student" s ON s."StudentID" = r."StudentID"
LEFT JOIN "StudentClass" sc ON sc."StudentClassID" = s."StudentClassID"
ORDER BY l."LecturerID", cc."ClassID", s."StudentID";

/* 18. Xem tiến trinh của sinh viên*/
CREATE OR REPLACE VIEW v_student_progress AS
SELECT s."StudentID", CONCAT(s."StudentLastName", ' ', s."StudentFirstName") AS student_name,
       m."MajorName",COALESCE(SUM(CASE WHEN vcs.letter_grade <> 'F' THEN c."Credits" ELSE 0 END), 0)::INT  AS accumulated_credits
FROM "Student"      s
LEFT JOIN "Major" m ON m."MajorID" = s."MajorID"
LEFT JOIN v_course_score vcs ON vcs."StudentID" = s."StudentID"
LEFT JOIN "Course" c ON c."CourseID" = vcs."CourseID"
GROUP BY s."StudentID", student_name, m."MajorName"
ORDER BY m."MajorName", student_name;
