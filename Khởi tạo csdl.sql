  CREATE TABLE IF NOT EXISTS "School" (
    "SchoolID" int PRIMARY KEY,
    "SchoolName" varchar(20),
    "Address" varchar(50)
  );

  CREATE TABLE IF NOT EXISTS "Major" (
    "MajorID" int PRIMARY KEY,
    "MajorName" varchar(20),
    "SchoolID" int
  );

  CREATE TABLE IF NOT EXISTS "Course" (
    "CourseID" int PRIMARY KEY,
    "CourseName" varchar(20),
    "Credits" int,
    "FinalPercentage" float,
    "MajorID" int
  );

  CREATE TABLE IF NOT EXISTS "CourseClass" (
    "ClassID" int PRIMARY KEY,
    "CourseID" int,
    "Semester" varchar(10),
    "Time" varchar(10),
    "RoomID" varchar(10)
  );

  CREATE TABLE IF NOT EXISTS "CoursePrerequisite" (
    "CourseID"        INT NOT NULL,
    "PreReqCourseID"  INT NOT NULL,
    PRIMARY KEY ("CourseID", "PreReqCourseID"),

    --  khoá ngoại đến chính bảng Course
    FOREIGN KEY ("CourseID") REFERENCES "Course" ("CourseID"),
    FOREIGN KEY ("PreReqCourseID") REFERENCES "Course" ("CourseID"),
    --  không cho tự tham chiếu
    CHECK ("CourseID" <> "PreReqCourseID")
  );

  CREATE TABLE IF NOT EXISTS "Tuition" (
    "CourseID" int,
    "Semester" varchar(10),
    "TuitionRate" decimal,
    PRIMARY KEY ("CourseID", "Semester")
  );

  CREATE TABLE IF NOT EXISTS "ClassRoom" (
    "RoomID" varchar(10) PRIMARY KEY,
    "Address" varchar(20),
    "Capacity" int
  );

  CREATE TABLE IF NOT EXISTS "StudentClass" (
    "StudentClassID" int PRIMARY KEY,
    "StudentClassName" varchar(20),
    "MajorID" int,
    "CohortYear" int,
    "NumberOfStudents" int,
    "MonitorID" int
  );

  CREATE TABLE IF NOT EXISTS "Student" (
    "StudentID" int PRIMARY KEY,
    "StudentFirstName" varchar(10),
    "StudentLastName" varchar(20),
    "Gender" char(1),
    "DOB" date,
    "Email" varchar(30) UNIQUE,
    "Address" varchar(50),
    "Phone" varchar(10) UNIQUE,
    "StudentClassID" int,
    "CPA" numeric(10,2),
    "MajorID" int NOT NULL
  );

  CREATE TABLE IF NOT EXISTS "Lecturer" (
    "LecturerID" int PRIMARY KEY,
    "LecturerFirstName" varchar(20),
    "LecturerLastName" varchar(20),
    "Gender" varchar(20),
    "DOB" date,
    "Address" varchar(50),
    "EducationalLevel" varchar(10),
    "SchoolID" int
  );

  CREATE TABLE IF NOT EXISTS "Teaching" (
    "LecturerID" int,
    "ClassID" int,
    PRIMARY KEY ("LecturerID", "ClassID")
  );

  CREATE TABLE IF NOT EXISTS "Register" (
    "StudentID" int,
    "ClassID" int,
    "MidtermScore" float,
    "FinalScore" float,
    PRIMARY KEY ("StudentID", "ClassID")
  );

  CREATE TYPE pay_status AS ENUM ('Unpaid', 'Paid');
  CREATE TABLE IF NOT EXISTS "PayTuition" (
    "StudentID" int,
    "Semester" varchar(10),
    "Amount" decimal,
    "PaymentDate" date,
    "Status" pay_status,
    PRIMARY KEY ("StudentID", "Semester")
  );

  CREATE TABLE IF NOT EXISTS "Headmaster" (
    "LecturerID" int,
    "StudentClassID" int,
    PRIMARY KEY ("LecturerID", "StudentClassID")
  );

  -- Kỳ có 2 trạng thái là đang diễn ra và đã kết thúc
  CREATE TYPE semester_status AS ENUM ('OnGoing', 'Ended');
  CREATE TABLE IF NOT EXISTS "Semester"
  (
  	"SemesterID" VARCHAR PRIMARY KEY,
  	"AcademicYear" VARCHAR(10),
  	--  Các kỳ
  	"StartDate" DATE,
  	"EndDate" DATE,
  	"Status" semester_status,
  	--  Thời gian bắt đầu và kết thúc việc đăng ký học phần
  	"RegisterStart" DATE,
  	"RegisterEnd" DATE
  );

  COMMENT ON COLUMN "Register"."MidtermScore" IS '0-10';

  COMMENT ON COLUMN "Register"."FinalScore" IS '0-10';

  COMMENT ON COLUMN "PayTuition"."Status" IS 'Paid | Unpaid';

  ALTER TABLE "Major" ADD FOREIGN KEY ("SchoolID") REFERENCES "School" ("SchoolID");

  ALTER TABLE "Course" ADD FOREIGN KEY ("MajorID") REFERENCES "Major" ("MajorID");

  ALTER TABLE "CourseClass" ADD FOREIGN KEY ("CourseID") REFERENCES "Course" ("CourseID");

  ALTER TABLE "CourseClass" ADD FOREIGN KEY ("RoomID") REFERENCES "ClassRoom" ("RoomID");

  ALTER TABLE "Tuition" ADD FOREIGN KEY ("CourseID") REFERENCES "Course" ("CourseID");

  ALTER TABLE "StudentClass" ADD FOREIGN KEY ("MajorID") REFERENCES "Major" ("MajorID");

  ALTER TABLE "StudentClass" ADD FOREIGN KEY ("MonitorID") REFERENCES "Student" ("StudentID");

  ALTER TABLE "Student" ADD FOREIGN KEY ("MajorID") REFERENCES "Major"("MajorID");

  ALTER TABLE "Student" ADD FOREIGN KEY ("StudentClassID") REFERENCES "StudentClass" ("StudentClassID");

  ALTER TABLE "Lecturer" ADD FOREIGN KEY ("SchoolID") REFERENCES "School" ("SchoolID");

  ALTER TABLE "Teaching" ADD FOREIGN KEY ("LecturerID") REFERENCES "Lecturer" ("LecturerID");

  ALTER TABLE "Teaching" ADD FOREIGN KEY ("ClassID") REFERENCES "CourseClass" ("ClassID");

  ALTER TABLE "Register" ADD FOREIGN KEY ("StudentID") REFERENCES "Student" ("StudentID");

  ALTER TABLE "Register" ADD FOREIGN KEY ("ClassID") REFERENCES "CourseClass" ("ClassID");

  ALTER TABLE "PayTuition" ADD FOREIGN KEY ("StudentID") REFERENCES "Student" ("StudentID");

  ALTER TABLE "PayTuition" ADD FOREIGN KEY ("Semester") REFERENCES "Semester" ("SemesterID");

  ALTER TABLE "Headmaster" ADD FOREIGN KEY ("LecturerID") REFERENCES "Lecturer" ("LecturerID");

  ALTER TABLE "Headmaster" ADD FOREIGN KEY ("StudentClassID") REFERENCES "StudentClass" ("StudentClassID");

  ALTER TABLE "CourseClass" ADD FOREIGN KEY ("Semester") REFERENCES "Semester" ("SemesterID");

  ALTER TABLE "Tuition" ADD FOREIGN KEY ("Semester") REFERENCES "Semester" ("SemesterID");

  /* 1.1  Điểm phải 0–10 */
  ALTER TABLE "Register"
    ADD CONSTRAINT chk_midterm_0_10 CHECK ("MidtermScore" BETWEEN 0 AND 10),
    ADD CONSTRAINT chk_final_0_10   CHECK ("FinalScore"   BETWEEN 0 AND 10);

  /* 1.2  Số tín chỉ của môn không âm và tối thiểu 1  */
  ALTER TABLE "Course"
    ADD CONSTRAINT chk_course_credits CHECK ("Credits" >= 1);
