CREATE TABLE "School" (
  "SchoolID" int PRIMARY KEY,
  "SchoolName" varchar,
  "Address" varchar
);

CREATE TABLE "Major" (
  "MajorID" int PRIMARY KEY,
  "MajorName" varchar,
  "SchoolID" int
);

CREATE TABLE "Course" (
  "CourseID" int PRIMARY KEY,
  "CourseName" varchar,
  "Credits" int,
  "FinalPercentage" float,
  "MajorID" int
);

CREATE TABLE "CourseClass" (
  "ClassID" int PRIMARY KEY,
  "CourseID" int,
  "Semester" varchar,
  "Time" varchar,
  "RoomID" int
);

CREATE TABLE "Tuition" (
  "CourseID" int,
  "Semester" varchar,
  "CreditCost" decimal,
  PRIMARY KEY ("CourseID", "Semester")
);

CREATE TABLE "ClassRoom" (
  "RoomID" varchar PRIMARY KEY,
  "Address" varchar,
  "Capacity" int
);

CREATE TABLE "StudentClass" (
  "StudentClassID" int PRIMARY KEY,
  "StudentClassName" varchar,
  "MajorID" int,
  "CohortYear" int,
  "NumberOfStudents" int,
  "MonitorID" int
);

CREATE TABLE "Student" (
  "StudentID" int PRIMARY KEY,
  "StudentFirstName" varchar,
  "StudentLastName" varchar,
  "Gender" varchar,
  "DOB" date,
  "Email" varchar,
  "Address" varchar,
  "Phone" varchar,
  "StudentClassID" int
);

CREATE TABLE "Lecturer" (
  "LecturerID" int PRIMARY KEY,
  "LecturerFirstName" varchar,
  "LecturerLastName" varchar,
  "Gender" varchar,
  "DOB" date,
  "Address" varchar,
  "EducationalLevel" varchar,
  "SchoolID" int
);

CREATE TABLE "Teaching" (
  "LecturerID" int,
  "ClassID" int,
  PRIMARY KEY ("LecturerID", "ClassID")
);

CREATE TABLE "Register" (
  "StudentID" int,
  "ClassID" int,
  "MidtermScore" float,
  "FinalScore" float,
  PRIMARY KEY ("StudentID", "ClassID")
);

CREATE TABLE "PayTuition" (
  "StudentID" int,
  "ClassID" int,
  "Amount" decimal,
  "PaymentDate" date,
  "Status" varchar,
  PRIMARY KEY ("StudentID", "ClassID")
);

CREATE TABLE "Headmaster" (
  "LecturerID" int,
  "StudentClassID" int,
  PRIMARY KEY ("LecturerID", "StudentClassID")
);

CREATE TABLE "Condition" (
  "CourseID" int,
  "PreReqCourseID" int,
  PRIMARY KEY ("CourseID", "PreReqCourseID")
);

COMMENT ON COLUMN "Register"."MidtermScore" IS '0-10';

COMMENT ON COLUMN "Register"."FinalScore" IS '0-10';

COMMENT ON COLUMN "PayTuition"."Status" IS 'Paid | Unpaid | Pending';

ALTER TABLE "Major" ADD FOREIGN KEY ("SchoolID") REFERENCES "School" ("SchoolID");

ALTER TABLE "Course" ADD FOREIGN KEY ("MajorID") REFERENCES "Major" ("MajorID");

ALTER TABLE "CourseClass" ADD FOREIGN KEY ("CourseID") REFERENCES "Course" ("CourseID");

ALTER TABLE "CourseClass" ADD FOREIGN KEY ("RoomID") REFERENCES "ClassRoom" ("RoomID");

ALTER TABLE "Tuition" ADD FOREIGN KEY ("CourseID") REFERENCES "Course" ("CourseID");

ALTER TABLE "StudentClass" ADD FOREIGN KEY ("MajorID") REFERENCES "Major" ("MajorID");

ALTER TABLE "StudentClass" ADD FOREIGN KEY ("MonitorID") REFERENCES "Student" ("StudentID");

ALTER TABLE "Student" ADD FOREIGN KEY ("StudentClassID") REFERENCES "StudentClass" ("StudentClassID");

ALTER TABLE "Lecturer" ADD FOREIGN KEY ("SchoolID") REFERENCES "School" ("SchoolID");

ALTER TABLE "Teaching" ADD FOREIGN KEY ("LecturerID") REFERENCES "Lecturer" ("LecturerID");

ALTER TABLE "Teaching" ADD FOREIGN KEY ("ClassID") REFERENCES "CourseClass" ("ClassID");

ALTER TABLE "Register" ADD FOREIGN KEY ("StudentID") REFERENCES "Student" ("StudentID");

ALTER TABLE "Register" ADD FOREIGN KEY ("ClassID") REFERENCES "CourseClass" ("ClassID");

ALTER TABLE "PayTuition" ADD FOREIGN KEY ("StudentID") REFERENCES "Student" ("StudentID");

ALTER TABLE "PayTuition" ADD FOREIGN KEY ("ClassID") REFERENCES "CourseClass" ("ClassID");

ALTER TABLE "Headmaster" ADD FOREIGN KEY ("LecturerID") REFERENCES "Lecturer" ("LecturerID");

ALTER TABLE "Headmaster" ADD FOREIGN KEY ("StudentClassID") REFERENCES "StudentClass" ("StudentClassID");

ALTER TABLE "Condition" ADD FOREIGN KEY ("CourseID") REFERENCES "Course" ("CourseID");

ALTER TABLE "Condition" ADD FOREIGN KEY ("PreReqCourseID") REFERENCES "Course" ("CourseID");
