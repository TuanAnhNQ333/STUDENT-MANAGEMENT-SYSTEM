🎓 HUST Student Learning Management System
Hệ thống Quản Lý Học Tập Sinh Viên – Database Project

Final Project for IT3290 – Database Practice
Hanoi University of Science and Technology (HUST)
Trường Đại học Bách Khoa Hà Nội

📌 Project Overview | Giới thiệu dự án

The Student Learning Management System is a relational database project designed to simulate and manage the core academic operations inside a university environment.
Dự án được xây dựng nhằm mô phỏng và quản lý toàn bộ các nghiệp vụ học tập cơ bản của sinh viên trong môi trường đại học.

This project focuses on:

Database Analysis & Design
Entity Relationship Modeling (ERD)
Logical & Physical Schema Design
SQL Query Optimization
PostgreSQL Views, Triggers, Constraints & Indexes

Hệ thống hỗ trợ:

Quản lý sinh viên
Quản lý giảng viên
Đăng ký học phần
Quản lý học phí
Theo dõi GPA / CPA
Quản lý chương trình đào tạo
Kiểm tra môn tiên quyết
Tự động cập nhật dữ liệu học vụ
🏫 Project Information
Information	Details
University	Hanoi University of Science and Technology
Course	IT3290 – Database Practice
Project Name	Student Learning Management System
Semester	2024.2
Year	2025
Database	PostgreSQL
Language	SQL / PLpgSQL
👨‍💻 Team Members
Student ID	Full Name	Role
20235752	Đinh Ngọc Khánh	Leader
20235850	Nguyễn Tiến Trình	Member
20235770	Lê Kỳ Long	Member
20235648	Nguyễn Quốc Tuấn Anh	Member
Instructor
Thầy Trần Văn Đặng
🎯 Main Objectives | Mục tiêu chính
General Objective

Design and implement a complete relational database system capable of handling major academic management operations inside a university.

Specific Objectives
👨‍🎓 Student Features
View personal information
View schedules
View detailed grades
View GPA / CPA
Register courses
View training program
Pay tuition fees
Track academic progress
👨‍🏫 Lecturer Features
Manage teaching schedules
Upload student grades
View student lists
Publish announcements
Manage course classes
🏢 Academic Office Features
Manage semesters
Open course classes
Organize schedules
Manage tuition system
Monitor academic statistics
⚙️ Technical Objectives
Database normalization
Data integrity
Referential consistency
Scalability
Security
Performance optimization
🧠 System Architecture

The database system is designed following the Relational Database Model.

Main components include:

Tables
Relationships
Constraints
Views
Triggers
Indexes
Business Queries
🗂️ Main Entities | Các thực thể chính
1. School

Stores information about schools/faculties inside the university.

Attributes
SchoolID
SchoolName
Address
2. Major

Represents academic majors managed by each school.

Relationships
One School → Many Majors
3. Student

Central entity containing all student information.

Features
Personal information
GPA/CPA
Class assignment
Major assignment
4. Lecturer

Stores lecturer information.

Features
Academic level
Teaching assignments
Faculty information
5. Course

Represents subjects taught in the university.

Features
Credits
Final score percentage
Prerequisite courses
6. CourseClass

Represents an actual opened class in a semester.

Features
Semester
Classroom
Time schedule
Lecturer assignment
7. Register

Associative entity between Student and CourseClass.

Stores
MidtermScore
FinalScore
Enrollment information
8. Tuition & PayTuition

Handles tuition fee calculations and payment status.

🔗 Relationship Design
Important Relationships
Lecturer ↔ CourseClass
One lecturer can teach many classes.
One class belongs to one lecturer.
Student ↔ CourseClass

Many-to-many relationship resolved using:

Register(StudentID, ClassID)
Student ↔ StudentClass
One class contains many students.
Course ↔ CoursePrerequisite

Self-referencing relationship for prerequisite checking.

🛠️ Technologies Used
Technology	Purpose
PostgreSQL	Database Management System
SQL	Query Language
PL/pgSQL	Trigger & Function Development
ERD Design	Database Modeling
🧱 Database Features
✅ Constraints

The project includes many validation constraints:

Score Validation
CHECK ("MidtermScore" BETWEEN 0 AND 10)
Credit Validation
CHECK ("Credits" >= 1)
Unique Constraints
Email
Phone Number
Foreign Keys

Ensuring referential integrity between all entities.

👁️ Database Views

The system contains multiple useful views for simplifying business logic.

Main Views
View	Purpose
v_student_basic	Student information
v_student_schedule	Student timetable
v_course_score	Course scores
v_student_gpa	GPA calculation
v_student_cpa	CPA calculation
v_student_progress	Academic progress
v_lecturer_classes	Lecturer teaching classes
v_student_tuition	Tuition information
⚡ Trigger System

The project implements advanced triggers to automate important operations.

1️⃣ Registration Time Validation Trigger
Purpose

Prevent students from registering outside the allowed registration period.

Business Logic
Compare current date with semester registration dates.
Raise exception if invalid.
2️⃣ Tuition Payment Trigger
Purpose

Automatically update payment status from:

Unpaid → Paid

Only when:

Correct amount is paid
Valid update operation
3️⃣ Automatic Tuition Calculation Trigger
Purpose

Automatically recalculate tuition fees whenever:

Student registers a course
Student drops a course
Formula
Tuition = Credits × TuitionRate
4️⃣ Prerequisite Checking Trigger
Purpose

Prevent students from registering courses without completing prerequisite subjects.

Logic

Check:

Passed prerequisite course
FinalScore >= 5
5️⃣ Automatic CPA Update Trigger
Purpose

Automatically update cumulative CPA whenever:

Scores change
New scores inserted
Course deleted
🚀 Performance Optimization

Indexes are implemented to improve query performance.

Important Indexes
Index	Purpose
idx_register_student	Fast student lookup
idx_register_class	Fast class lookup
idx_courseclass_semester	Semester filtering
idx_paytuition_student	Tuition searching
📊 GPA & CPA Calculation

The system supports:

GPA (Semester GPA)

Calculated based on:

Grade scale 4
Credits
CPA (Cumulative GPA)

Calculated using:

Weighted GPA average
Total accumulated credits
🔐 Data Integrity

The database ensures integrity through:

Primary Keys
Foreign Keys
Check Constraints
Unique Constraints
Triggers
ENUM Types
📚 Academic Features
Supported Academic Operations
Students
Register courses
View grades
View schedule
View tuition
Track progress
Lecturers
Manage teaching classes
View students
Update scores
Administration
Open semesters
Manage tuition
Monitor learning progress
🧪 Example Business Queries
Example: Student GPA
SELECT *
FROM v_student_gpa
WHERE "StudentID" = 20235648;
Example: Student Schedule
SELECT *
FROM v_student_schedule
WHERE "StudentID" = 20235648;
Example: Lecturer Classes
SELECT *
FROM v_lecturer_classes
WHERE "LecturerID" = 1001;
📂 Suggested Project Structure
Student-Learning-Management-System/
│
├── README.md
├── schema.sql
├── views.sql
├── triggers.sql
├── indexes.sql
├── sample_data.sql
├── queries.sql
├── ERD/
│   └── erd_diagram.png
└── docs/
    └── project_report.pdf
📈 Future Improvements

Possible future extensions:

Web Application Integration
Authentication System
REST API Development
Real-time Notifications
Attendance Management
AI-based Academic Recommendation
Mobile Application
🏁 Conclusion

This project demonstrates a complete relational database design for a university academic management system.

The project successfully applies:

Database normalization
ERD modeling
SQL programming
Trigger automation
Query optimization
Business rule implementation

Dự án không chỉ giúp nhóm hiểu sâu hơn về thiết kế cơ sở dữ liệu mà còn mô phỏng tương đối đầy đủ một hệ thống quản lý học tập thực tế trong môi trường đại học.

❤️ Acknowledgements

Special thanks to:

Hanoi University of Science and Technology
IT3290 Course
Instructor: Thầy Trần Văn Đặng

for providing the opportunity and guidance throughout this project.

📜 License

This project is developed for educational purposes only.
