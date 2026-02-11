CREATE TABLE StudentClass
(
	StudentClassID VARCHAR(10) PRIMARY KEY,
	StudentClassName VARCHAR(255) NOT NULL,
	NumberOfStudents INT,
	MonitorID VARCHAR(10)
)