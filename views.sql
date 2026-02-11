---
-- View: Chi tiết sinh viên và ngành, trường (StudentMajor)
-- Hiển thị thông tin chi tiết của sinh viên cùng với tên ngành và tên trường.
CREATE VIEW "StudentMajor" AS
SELECT
    s."StudentID",          -- ID của sinh viên
    s."StudentFirstName",   -- Tên của sinh viên
    s."StudentLastName",    -- Họ của sinh viên
    s."StudentGender",      -- Giới tính
    s."StudentDOB",         -- Ngày sinh
    s."StudentEmail",       -- Email
    s."StudentAddress",     -- Địa chỉ
    s."StudentPhone",       -- Số điện thoại
    m."MajorName",          -- Tên ngành học
    sch."SchoolName"        -- Tên trường
FROM
    "Student" s             -- Bảng thông tin sinh viên
JOIN
    "Major" m ON s."MajorID" = m."MajorID" -- Nối với bảng Major
JOIN
    "School" sch ON m."SchoolID" = sch."SchoolID"; -- Nối với bảng School

---
-- View: Chi tiết môn học và ngành (CourseMajor)
-- Hiển thị thông tin chi tiết của các môn học cùng với tên ngành và tên trường.
CREATE VIEW "CourseMajor" AS
SELECT
    c."CourseID",           -- ID của môn học
    c."CourseName",         -- Tên môn học
    c."Credits",            -- Số tín chỉ
    c."FinalPercentage",    -- Tỷ lệ điểm cuối kỳ
    m."MajorName",          -- Tên ngành
    sch."SchoolName"        -- Tên trường
FROM
    "Course" c              -- Bảng thông tin môn học
JOIN
    "Major" m ON c."MajorID" = m."MajorID" -- Nối với bảng Major
JOIN
    "School" sch ON m."SchoolID" = sch."SchoolID"; -- Nối với bảng School

-- View: Chi tiết giảng viên và trường (LecturerSchool)
-- Hiển thị thông tin cơ bản của giảng viên cùng với tên trường mà họ đang công tác.
CREATE VIEW "LecturerSchool" AS
SELECT
    l."LecturerID",         -- ID của giảng viên
    l."LecturerFirstName",  -- Tên của giảng viên
    l."LecturerLastName",   -- Họ của giảng viên
    l."LecturerGender",     -- Giới tính
    l."LecturerDOB",        -- Ngày sinh
    l."LecturerAddress",    -- Địa chỉ
    l."LecturerEducationalLevel" AS "EduLevel", -- Trình độ học vấn
    sch."SchoolName"        -- Tên trường
FROM
    "Lecturer" l            -- Bảng thông tin giảng viên
JOIN
    "School" sch ON l."SchoolID" = sch."SchoolID"; -- Nối với bảng School

---
-- View: Phân công giảng dạy của giảng viên (LecturerTeachAssign)
-- Hiển thị các môn học và lớp học mà mỗi giảng viên được phân công giảng dạy.
CREATE VIEW "LecturerTeachAssign" AS
SELECT
    l."LecturerFirstName",  -- Tên giảng viên
    l."LecturerLastName",   -- Họ giảng viên
    c."CourseName",         -- Tên môn học đang dạy
    cc."Semester",          -- Kỳ học
    cc."Time",              -- Thời gian dạy
    cr."Address" AS "RoomAddr" -- Địa chỉ phòng học
FROM
    "Teaching" t            -- Bảng phân công giảng dạy
JOIN
    "Lecturer" l ON t."LecturerID" = l."LecturerID" -- Nối với bảng Lecturer
JOIN
    "CourseClass" cc ON t."ClassID" = cc."ClassID" -- Nối với bảng CourseClass
JOIN
    "Course" c ON cc."CourseID" = c."CourseID" -- Nối với bảng Course
JOIN
    "ClassRoom" cr ON cc."RoomID" = cr."RoomID"; -- Nối với bảng ClassRoom

---
-- View: Thông tin lớp hành chính và cán bộ lớp (StudentClassInfo)
-- Hiển thị thông tin chi tiết về các lớp hành chính, bao gồm số lượng sinh viên, lớp trưởng và giáo viên chủ nhiệm.
CREATE VIEW "StudentClassInfo" AS
SELECT
    sc."StudentClassID",    -- ID của lớp hành chính
    sc."StudentClassName",  -- Tên lớp hành chính
    sc."NumberOfStudents",  -- Số lượng sinh viên trong lớp
    s."StudentFirstName" AS "MonitorFName", -- Tên lớp trưởng
    s."StudentLastName" AS "MonitorLName",   -- Họ lớp trưởng
    l."LecturerFirstName" AS "GVCNFName", -- Tên giáo viên chủ nhiệm
    l."LecturerLastName" AS "GVCNLName"    -- Họ giáo viên chủ nhiệm
FROM
    "StudentClass" sc       -- Bảng lớp hành chính
LEFT JOIN
    "Student" s ON sc."MonitorID" = s."StudentID" -- Nối trái với bảng Student
LEFT JOIN
    "Headmaster" h ON sc."StudentClassID" = h."StudentClassID" -- Nối trái với bảng Headmaster
LEFT JOIN
    "Lecturer" l ON h."LecturerID" = l."LecturerID"; -- Nối trái với bảng Lecturer

-- View: Số lượng lớp đang dạy của giảng viên (LecturerClassLoad)
-- Hiển thị thông tin cơ bản của giảng viên và tổng số lớp học phần mà họ đang giảng dạy.
CREATE VIEW "LecturerClassLoad" AS
SELECT
    L."LecturerID",           -- ID của giảng viên
    L."LecturerFirstName",    -- Tên của giảng viên
    L."LecturerLastName",     -- Họ của giảng viên
    L."LecturerGender",       -- Giới tính
    L."LecturerDOB",          -- Ngày sinh
    L."LecturerAddress",      -- Địa chỉ
    L."LecturerEducationalLevel" AS "EduLevel", -- Trình độ học vấn
    COUNT(T."ClassID") AS "NumberOfClassesTaught" -- Tổng số lớp mà giảng viên đang dạy
FROM
    "Lecturer" L              -- Bảng thông tin giảng viên
LEFT JOIN
    "Teaching" T ON L."LecturerID" = T."LecturerID" -- Nối với bảng Teaching
GROUP BY
    L."LecturerID",
    L."LecturerFirstName",
    L."LecturerLastName",
    L."LecturerGender",
    L."LecturerDOB",
    L."LecturerAddress",
    L."LecturerEducationalLevel"; -- Gom nhóm theo thông tin giảng viên


---
-- View: Thông tin trường học (SchoolInfo)
-- Cung cấp thông tin tổng quan về các trường học, bao gồm ID, tên, địa chỉ và tổng số giảng viên.
CREATE VIEW "SchoolInfo" AS
SELECT
    S."SchoolID",           -- ID của trường
    S."SchoolName",         -- Tên trường
    S."Address" AS "SchoolAddr", -- Địa chỉ của trường
    COUNT(L."LecturerID") AS "NumberOfLecturers" -- Tổng số giảng viên thuộc trường
FROM
    "School" S              -- Bảng thông tin trường
LEFT JOIN
    "Lecturer" L ON S."SchoolID" = L."SchoolID" -- Nối với bảng Lecturer
GROUP BY
    S."SchoolID", S."SchoolName", S."Address"; -- Gom nhóm theo thông tin trường


---
-- View: Thống kê số lượng sinh viên toàn đại học (UniStudentCount)
-- Tính tổng số lượng sinh viên trên toàn hệ thống đại học.
CREATE VIEW "UniStudentCount" AS
SELECT
    COUNT(s."StudentID") AS "TotalStudents" -- Tổng số sinh viên
FROM
    "Student" s; -- Bảng thông tin sinh viên


---
-- View: Thống kê số lượng sinh viên trong mỗi trường (SchoolStudentCount)
-- Tính tổng số lượng sinh viên của từng trường trong đại học.
CREATE VIEW "SchoolStudentCount" AS
SELECT
    sch."SchoolID",         -- ID của trường
    sch."SchoolName",       -- Tên trường
    COUNT(s."StudentID") AS "TotalStudents" -- Tổng số sinh viên trong trường
FROM
    "School" sch            -- Bảng thông tin trường
LEFT JOIN
    "Major" m ON sch."SchoolID" = m."SchoolID" -- Nối với bảng Major
LEFT JOIN
    "Student" s ON m."MajorID" = s."MajorID"   -- Nối với bảng Student
GROUP BY
    sch."SchoolID", sch."SchoolName"
ORDER BY
    sch."SchoolName";


---
-- View: Thống kê số lượng sinh viên trong mỗi ngành (MajorStudentCount)
-- Tính tổng số lượng sinh viên của từng ngành học (có thể hiểu là Khoa).
CREATE VIEW "MajorStudentCount" AS
SELECT
    m."MajorID",       -- ID của ngành
    m."MajorName",     -- Tên ngành
    COUNT(s."StudentID") AS "TotalStudents" -- Tổng số sinh viên trong ngành
FROM
    "Major" m          -- Bảng thông tin ngành
LEFT JOIN
    "Student" s ON m."MajorID" = s."MajorID" -- Nối với bảng Student
GROUP BY
    m."MajorID", m."MajorName"
ORDER BY
    m."MajorName";


---
-- View: Thống kê số lượng sinh viên trong mỗi lớp hành chính (ClassStudentCount)
-- Hiển thị số lượng sinh viên trong mỗi lớp hành chính (không phải lớp học phần).
CREATE VIEW "ClassStudentCount" AS
SELECT
    sc."StudentClassID",    -- ID của lớp hành chính
    sc."StudentClassName",  -- Tên của lớp hành chính
    sc."NumberOfStudents"   -- Số lượng sinh viên đã được ghi nhận trong lớp này
FROM
    "StudentClass" sc       -- Bảng thông tin lớp hành chính sinh viên
ORDER BY
    sc."StudentClassName";

---
-- View: Đăng ký môn học của sinh viên (StudentCourseReg)
-- Hiển thị thông tin đăng ký môn học của từng sinh viên, bao gồm điểm giữa kỳ và cuối kỳ.
CREATE VIEW "StudentCourseReg" AS
SELECT
    st."StudentID",         -- ID của sinh viên
    st."StudentFirstName",  -- Tên của sinh viên
    st."StudentLastName",   -- Họ của sinh viên
    c."CourseName",         -- Tên môn học
    r."Semester",           -- Kỳ học đăng ký
    r."MidtermScore",       -- Điểm giữa kỳ
    r."FinalScore"          -- Điểm cuối kỳ
FROM
    "Register" r            -- Bảng đăng ký môn học
JOIN
    "Student" st ON r."StudentID" = st."StudentID" -- Nối với bảng Student
JOIN
    "Course" c ON r."CourseID" = c."CourseID"; -- Nối với bảng Course

---
-- View: Thông tin học phí từng môn (CourseTuitionView)
-- Hiển thị các chi tiết liên quan đến học phí của mỗi môn học.
CREATE VIEW "CourseTuitionView" AS
SELECT
    c."CourseID",          -- ID của môn học
    c."CourseName",        -- Tên môn học
    t."Semester",          -- Kỳ học mà môn học được giảng dạy
    t."CreditCost",        -- Chi phí mỗi tín chỉ của môn học trong kỳ đó
    c."Credits" AS "CourseCredits", -- Số tín chỉ của môn học
    (t."CreditCost" * c."Credits") AS "CourseTuition" -- Tổng học phí ước tính cho môn học này
FROM
    "Tuition" t            -- Bảng chứa thông tin học phí theo kỳ và môn
JOIN
    "Course" c ON t."CourseID" = c."CourseID"; -- Nối với bảng Course

---
-- View: Tổng quan học phí sinh viên theo kỳ (SemTuitionSum)
-- Cung cấp cái nhìn tổng quát về học phí của mỗi sinh viên trong từng kỳ học,
-- bao gồm tổng số tiền cần đóng, số tiền đã thanh toán và số tiền còn nợ.
CREATE VIEW "SemTuitionSum" AS
SELECT
    s."StudentID",         -- ID của sinh viên
    s."StudentFirstName",  -- Tên của sinh viên
    s."StudentLastName",   -- Họ của sinh viên
    r."Semester",          -- Kỳ học đang xét
    SUM(t."CreditCost" * c."Credits") AS "TotalRequired", -- Tổng học phí cần đóng
    COALESCE(SUM(pt."Amount"), 0) AS "TotalPaid", -- Tổng số tiền đã thanh toán
    (SUM(t."CreditCost" * c."Credits") - COALESCE(SUM(pt."Amount"), 0)) AS "TotalOutstanding" -- Số tiền còn dư nợ
FROM
    "Student" s            -- Bảng thông tin sinh viên
JOIN
    "Register" r ON s."StudentID" = r."StudentID" -- Nối để biết sinh viên đã đăng ký môn nào
JOIN
    "Course" c ON r."CourseID" = c."CourseID"     -- Nối để lấy thông tin tín chỉ của môn
JOIN
    "Tuition" t ON r."CourseID" = t."CourseID" AND r."Semester" = t."Semester" -- Nối để lấy chi phí tín chỉ
LEFT JOIN
    "PayTuition" pt ON s."StudentID" = pt."StudentID"
                    AND r."CourseID" = pt."CourseID"
                    AND r."Semester" = pt."Semester" -- Nối trái với bảng PayTuition
GROUP BY
    s."StudentID",
    s."StudentFirstName",
    s."StudentLastName",
    r."Semester"
ORDER BY
    s."StudentID", r."Semester"; -- Sắp xếp kết quả


---
-- View: Lịch trình lớp học phần (CourseClassSch)
-- Hiển thị lịch trình chi tiết của các lớp học phần, bao gồm thời gian, phòng học và sức chứa.
CREATE VIEW "CourseClassSch" AS
SELECT
    cc."ClassID",           -- ID của lớp học phần
    c."CourseName",         -- Tên môn học
    cc."Semester",          -- Kỳ học
    cc."Time",              -- Thời gian học
    cr."RoomID",            -- ID phòng học
    cr."Address" AS "RoomAddr", -- Địa chỉ phòng học
    cr."Capacity" AS "RoomCap" -- Sức chứa của phòng học
FROM
    "CourseClass" cc        -- Bảng lớp học phần
JOIN
    "Course" c ON cc."CourseID" = c."CourseID" -- Nối với bảng Course
JOIN
    "ClassRoom" cr ON cc."RoomID" = cr."RoomID"; -- Nối với bảng ClassRoom


---
-- View: Điều kiện tiên quyết của môn học (CoursePreReq)
-- Liệt kê các môn học cùng với các môn học tiền đề (tiên quyết) của chúng.
CREATE VIEW "CoursePreReq" AS
SELECT
    c."CourseName",         -- Tên môn học
    c."CourseID",           -- ID môn học
    prc."CourseName" AS "PreReqCourse", -- Tên môn tiên quyết
    prc."CourseID" AS "PreReqID"      -- ID môn tiên quyết
FROM
    "Condition" cond        -- Bảng điều kiện tiên quyết
JOIN
    "Course" c ON cond."CourseID" = c."CourseID" -- Nối với bảng Course (môn học chính)
JOIN
    "Course" prc ON cond."PreReqCourseID" = prc."CourseID"; -- Nối với bảng Course (môn tiên quyết)

---
-- View: Môn không yêu cầu học phần tiên quyết (NoPreReqCourseView)
-- Liệt kê các môn học không có học phần tiên quyết.
CREATE VIEW "NoPreReqCourseView" AS
SELECT
    C."CourseID",          -- ID của môn học
    C."CourseName",        -- Tên môn học
    C."Credits",           -- Số tín chỉ của môn học
    C."FinalPercentage",   -- Tỷ lệ điểm cuối kỳ
    C."MajorID"            -- ID ngành học mà môn này thuộc về
FROM
    "Course" C             -- Bảng chứa thông tin các môn học
LEFT JOIN
    "Condition" Cond ON C."CourseID" = Cond."CourseID" -- Nối với bảng Condition để kiểm tra các điều kiện tiên quyết
WHERE
    Cond."PreReqCourseID" IS NULL; -- Chọn những môn không có ID học phần tiên quyết

---
-- View: Điểm môn học của sinh viên (StudentCourseGrades)
-- Tính toán điểm cuối cùng của sinh viên cho từng môn học dựa trên điểm giữa kỳ và cuối kỳ.
CREATE VIEW "StudentCourseGrades" AS
SELECT
    s."StudentID",          -- ID của sinh viên
    s."StudentFirstName",   -- Tên của sinh viên
    s."StudentLastName",    -- Họ của sinh viên
    c."CourseName",         -- Tên môn học
    r."Semester",           -- Kỳ học
    r."MidtermScore",       -- Điểm giữa kỳ
    r."FinalScore",         -- Điểm cuối kỳ
    (r."MidtermScore" * (1 - c."FinalPercentage") + r."FinalScore" * c."FinalPercentage") AS "FinalGrade" -- Điểm cuối cùng
FROM
    "Register" r            -- Bảng đăng ký
JOIN
    "Student" s ON r."StudentID" = s."StudentID" -- Nối với bảng Student
JOIN
    "Course" c ON r."CourseID" = c."CourseID"; -- Nối với bảng Course

---
-- View: GPA và CPA của sinh viên (StudentGPACPA)
-- Tính toán điểm trung bình học kỳ (GPA) và điểm trung bình tích lũy (CPA) cho mỗi sinh viên.
-- Quy đổi điểm:
-- Tổng điểm thành phần < 4.0: 0.0 GPA (F)
-- Tổng điểm thành phần >= 4.0 và < 5.0: 1.0 GPA (D)
-- Tổng điểm thành phần >= 5.0 và < 5.5: 1.5 GPA (D+)
-- Tổng điểm thành phần >= 5.5 và < 6.5: 2.0 GPA (C)
-- Tổng điểm thành phần >= 6.5 và < 7.0: 2.5 GPA (C+)
-- Tổng điểm thành phần >= 7.0 và < 8.0: 3.0 GPA (B)
-- Tổng điểm thành phần >= 8.0 và < 8.5: 3.5 GPA (B+)
-- Tổng điểm thành phần >= 8.5: 4.0 GPA (A/A+)
CREATE VIEW "StudentGPACPA" AS
SELECT
    s."StudentID",          -- ID của sinh viên
    s."StudentFirstName",   -- Tên của sinh viên
    s."StudentLastName",    -- Họ của sinh viên
    sg."Semester",          -- Kỳ học
    SUM(CASE
        WHEN sg."FinalGrade" >= 8.5 THEN 4.0
        WHEN sg."FinalGrade" >= 8.0 THEN 3.5
        WHEN sg."FinalGrade" >= 7.0 THEN 3.0
        WHEN sg."FinalGrade" >= 6.5 THEN 2.5
        WHEN sg."FinalGrade" >= 5.5 THEN 2.0
        WHEN sg."FinalGrade" >= 5.0 THEN 1.5
        WHEN sg."FinalGrade" >= 4.0 THEN 1.0
        ELSE 0.0 -- Bao gồm tất cả điểm < 4.0, tương ứng với F
    END * c."Credits") / SUM(c."Credits") AS "GPA", -- GPA cho học kỳ hiện tại
    SUM(CASE
        WHEN sg."FinalGrade" >= 8.5 THEN 4.0
        WHEN sg."FinalGrade" >= 8.0 THEN 3.5
        WHEN sg."FinalGrade" >= 7.0 THEN 3.0
        WHEN sg."FinalGrade" >= 6.5 THEN 2.5
        WHEN sg."FinalGrade" >= 5.5 THEN 2.0
        WHEN sg."FinalGrade" >= 5.0 THEN 1.5
        WHEN sg."FinalGrade" >= 4.0 THEN 1.0
        ELSE 0.0 -- Bao gồm tất cả điểm < 4.0, tương ứng với F
    END * c."Credits") OVER (PARTITION BY s."StudentID" ORDER BY sg."Semester" ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) / SUM(c."Credits") OVER (PARTITION BY s."StudentID" ORDER BY sg."Semester" ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS "CPA" -- CPA tích lũy
FROM
    "StudentCourseGrades" sg -- Sử dụng view StudentCourseGrades
JOIN
    "Student" s ON sg."StudentID" = s."StudentID" -- Nối với bảng Student
JOIN
    "Course" c ON sg."CourseID" = c."CourseID" -- Nối với bảng Course
GROUP BY
    s."StudentID", s."StudentFirstName", s."StudentLastName", sg."Semester"
ORDER BY
    s."StudentID", sg."Semester"; -- Sắp xếp kết quả

---
-- View: Điểm rèn luyện của sinh viên (StudentDisciplinaryScores)
-- Hiển thị điểm rèn luyện của từng sinh viên theo kỳ học.
CREATE VIEW "StudentDisciplinaryScores" AS
SELECT
    s."StudentID",          -- ID của sinh viên
    s."StudentFirstName",   -- Tên của sinh viên
    s."StudentLastName",    -- Họ của sinh viên
    ds."Semester",          -- Kỳ học của điểm rèn luyện
    ds."Score"              -- Điểm rèn luyện
FROM
    "Student" s             -- Bảng thông tin sinh viên
JOIN
    "DisciplinaryScore" ds ON s."StudentID" = ds."StudentID" -- Nối với bảng điểm rèn luyện
ORDER BY
    s."StudentID", ds."Semester"; -- Sắp xếp theo sinh viên và kỳ học

---
-- View: Thời khóa biểu cá nhân của sinh viên (StudentTimetable)
-- Hiển thị thời khóa biểu chi tiết của từng sinh viên.
CREATE VIEW "StudentTimetable" AS
SELECT
    s."StudentID",          -- ID của sinh viên
    s."StudentFirstName",   -- Tên của sinh viên
    s."StudentLastName",    -- Họ của sinh viên
    c."CourseID",           -- ID của môn học
    c."CourseName",         -- Tên môn học
    cc."ClassID",           -- ID của lớp học phần
    cc."Semester",          -- Kỳ học
    cc."Time",              -- Thời gian học
    cr."RoomID",            -- ID phòng học
    cr."Address" AS "RoomAddr", -- Địa chỉ phòng học
    l."LecturerID",         -- ID của giảng viên
    l."LecturerFirstName",  -- Tên của giảng viên
    l."LecturerLastName"    -- Họ của giảng viên
FROM
    "Register" r            -- Bảng đăng ký
JOIN
    "Student" s ON r."StudentID" = s."StudentID" -- Nối với bảng Student
JOIN
    "Course" c ON r."CourseID" = c."CourseID" -- Nối với bảng Course
JOIN
    "CourseClass" cc ON r."CourseID" = cc."CourseID" AND r."Semester" = cc."Semester" -- Nối với bảng CourseClass
LEFT JOIN
    "ClassRoom" cr ON cc."RoomID" = cr."RoomID" -- Nối trái với bảng ClassRoom
LEFT JOIN
    "Teaching" t ON cc."ClassID" = t."ClassID" -- Nối trái với bảng Teaching
LEFT JOIN
    "Lecturer" l ON t."LecturerID" = l."LecturerID"; -- Nối trái với bảng Lecturer

---
-- View: Tình trạng đăng ký môn học của giảng viên (LecturerEnrollStatus)
-- Hiển thị thông tin về các môn học, lớp học và sinh viên mà mỗi giảng viên đang phụ trách.
CREATE VIEW "LecturerEnrollStatus" AS
SELECT
    l."LecturerID",         -- ID của giảng viên
    l."LecturerFirstName",  -- Tên của giảng viên
    l."LecturerLastName",   -- Họ của giảng viên
    c."CourseID",           -- ID của môn học
    c."CourseName",         -- Tên môn học
    cc."ClassID",           -- ID của lớp học phần
    cc."Semester",          -- Kỳ học
    s."StudentID",          -- ID của sinh viên
    s."StudentFirstName",   -- Tên của sinh viên
    s."StudentLastName",    -- Họ của sinh viên
    'Enrolled' AS "EnrollStatus" -- Trạng thái đăng ký
FROM
    "Teaching" t            -- Bảng phân công giảng dạy
JOIN
    "Lecturer" l ON t."LecturerID" = l."LecturerID" -- Nối với bảng Lecturer
JOIN
    "CourseClass" cc ON t."ClassID" = cc."ClassID" -- Nối với bảng CourseClass
JOIN
    "Course" c ON cc."CourseID" = c."CourseID" -- Nối với bảng Course
JOIN
    "Register" r ON cc."CourseID" = r."CourseID" AND cc."Semester" = r."Semester" -- Nối với bảng Register
JOIN
    "Student" s ON r."StudentID" = s."StudentID"; -- Nối với bảng Student

---
-- View: Điểm số có thể cập nhật (GradesForUpdate)
-- Cung cấp thông tin về điểm số của sinh viên cho từng môn học trong mỗi kỳ.
CREATE VIEW "GradesForUpdate" AS
SELECT
    r."StudentID",          -- ID của sinh viên
    st."StudentFirstName",  -- Tên của sinh viên
    st."StudentLastName",   -- Họ của sinh viên
    r."CourseID",           -- ID của môn học
    c."CourseName",         -- Tên môn học
    r."Semester",           -- Kỳ học
    r."MidtermScore",       -- Điểm giữa kỳ
    r."FinalScore"          -- Điểm cuối kỳ
FROM
    "Register" r            -- Bảng đăng ký
JOIN
    "Student" st ON r."StudentID" = st."StudentID" -- Nối với bảng Student
JOIN
    "Course" c ON r."CourseID" = c."CourseID"; -- Nối với bảng Course

---
-- View: Thông tin học bổng (ScholarshipView)
-- Hiển thị thông tin cơ bản về các loại học bổng có sẵn.
CREATE VIEW "ScholarshipView" AS
SELECT
    "ScholarshipID",       -- ID của học bổng
    "ScholarshipName",     -- Tên học bổng
    "Amount",              -- Giá trị học bổng
    "Criteria",            -- Tiêu chí để đạt học bổng
    "ApplicationDeadline"  -- Hạn chót nộp đơn
FROM
    "Scholarship";         -- Bảng thông tin học bổng


---
---
-- View: Thông tin xét cấp học bổng sinh viên (StudentScholarshipAwards)
-- Xác định loại học bổng (A, B, C) và số tiền học bổng khuyến khích học tập (KKHT)
-- cho mỗi sinh viên dựa trên thành tích học tập (GPA) và điểm rèn luyện trong từng học kỳ.
-- Học bổng được tính dựa trên tổng học phí cần đóng của học kỳ xét cấp điểm.
CREATE VIEW "StudentScholarshipAwards" AS
SELECT
    gpa."StudentID",          -- ID của sinh viên
    gpa."StudentFirstName",   -- Tên của sinh viên
    gpa."StudentLastName",    -- Họ của sinh viên
    gpa."Semester",           -- Kỳ học đang xét (mà điểm và học phí được lấy để xét học bổng)
    gpa."GPA",                -- Điểm trung bình học kỳ (GPA)
    -- Thay thế COALESCE bằng CASE WHEN để lấy điểm rèn luyện (mặc định 0 nếu không có)
    CASE WHEN dis."Score" IS NULL THEN 0 ELSE dis."Score" END AS "DisciplinaryScore",
    -- Thay thế COALESCE bằng CASE WHEN để lấy tổng học phí cần đóng (mặc định 0 nếu không có)
    CASE WHEN tuit."TotalRequired" IS NULL THEN 0 ELSE tuit."TotalRequired" END AS "BaseTuitionAmount",
    CASE
        -- Học bổng loại A (Xuất sắc)
        WHEN gpa."GPA" >= 3.6 AND (CASE WHEN dis."Score" IS NULL THEN 0 ELSE dis."Score" END) >= 90 THEN 'Loại A'
        -- Học bổng loại B (Giỏi)
        WHEN gpa."GPA" >= 3.2 AND (CASE WHEN dis."Score" IS NULL THEN 0 ELSE dis."Score" END) >= 80 THEN 'Loại B'
        -- Học bổng loại C (Khá)
        WHEN gpa."GPA" >= 2.5 AND (CASE WHEN dis."Score" IS NULL THEN 0 ELSE dis."Score" END) >= 65 THEN 'Loại C'
        -- Không đủ điều kiện nhận học bổng
        ELSE 'Không đủ điều kiện'
    END AS "ScholarshipType",
    CASE
        -- Số tiền học bổng loại A (1.5 lần mức loại khá)
        WHEN gpa."GPA" >= 3.6 AND (CASE WHEN dis."Score" IS NULL THEN 0 ELSE dis."Score" END) >= 90 THEN (CASE WHEN tuit."TotalRequired" IS NULL THEN 0 ELSE tuit."TotalRequired" END) * 1.5
        -- Số tiền học bổng loại B (1.2 lần mức loại khá)
        WHEN gpa."GPA" >= 3.2 AND (CASE WHEN dis."Score" IS NULL THEN 0 ELSE dis."Score" END) >= 80 THEN (CASE WHEN tuit."TotalRequired" IS NULL THEN 0 ELSE tuit."TotalRequired" END) * 1.2
        -- Số tiền học bổng loại C (1.0 lần mức loại khá)
        WHEN gpa."GPA" >= 2.5 AND (CASE WHEN dis."Score" IS NULL THEN 0 ELSE dis."Score" END) >= 65 THEN (CASE WHEN tuit."TotalRequired" IS NULL THEN 0 ELSE tuit."TotalRequired" END) * 1.0
        -- 0 nếu không đủ điều kiện
        ELSE 0.0
    END AS "ScholarshipAmount"
FROM
    "StudentGPACPA" gpa -- Lấy GPA của sinh viên
LEFT JOIN
    "StudentDisciplinaryScores" dis ON gpa."StudentID" = dis."StudentID" AND gpa."Semester" = dis."Semester" -- Nối để lấy điểm rèn luyện
LEFT JOIN
    "StudentSemTuitionSummary" tuit ON gpa."StudentID" = tuit."StudentID" AND gpa."Semester" = tuit."Semester" -- Nối để lấy tổng học phí làm cơ sở
ORDER BY
    gpa."Semester" DESC, gpa."GPA" DESC, (CASE WHEN dis."Score" IS NULL THEN 0 ELSE dis."Score" END) DESC, gpa."StudentID"; -- Sắp xếp để dễ dàng xem xét

---
