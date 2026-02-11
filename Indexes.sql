 /* - FK / truy vấn phổ biến - */
 CREATE INDEX idx_courseclass_course   ON "CourseClass" ("CourseID");
 CREATE INDEX idx_courseclass_semester ON "CourseClass" ("Semester");

 CREATE INDEX idx_register_student     ON "Register"    ("StudentID");
 CREATE INDEX idx_register_class       ON "Register"    ("ClassID");

 CREATE INDEX idx_paytuition_student   ON "PayTuition"  ("StudentID");
 CREATE INDEX idx_paytuition_semester  ON "PayTuition"  ("Semester");

 CREATE INDEX idx_courseprereq_prereq  ON "CoursePrerequisite" ("PreReqCourseID");
 CREATE INDEX idx_courseprereq_course  ON "CoursePrerequisite" ("CourseID");

 CREATE INDEX idx_tuition_course_sem   ON "Tuition" ("CourseID", "Semester");

 CREATE INDEX idx_student_name ON "Student"("StudentFirstName");
