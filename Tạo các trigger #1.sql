-- Trigger cũng như các chức năng cụ thể

-- Function cập nhật số lượng sinh viên vào bảng CourseClass
CREATE OR REPLACE FUNCTION f_total_number_student_course_class ()
RETURNS TRIGGER
AS
$$
BEGIN
	UPDATE "CourseClass"
	SET "NumberOfStudent" =
	(
		SELECT COUNT(*) FROM "Register"
		WHERE "ClassID" = NEW."ClassID"
		AND "Semester" = NEW."Semester"
	)
	WHERE "ClassID" = NEW."ClassID"
	AND "Semester" = NEW."Semester";

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger gọi function trên
CREATE OR REPLACE TRIGGER trg_update_courseclass_number_student
AFTER INSERT OR DELETE OR UPDATE ON "Register"
FOR EACH ROW
EXECUTE FUNCTION f_total_number_student_course_class ();



-- Function cập nhật số lượng giảng viên vào bảng School
CREATE OR REPLACE FUNCTION f_total_number_lecturer_school ()
RETURNS TRIGGER
AS
$$
BEGIN
	UPDATE "School"
	SET "NumberOfTeachers" =
	(
		SELECT COUNT(*) FROM "Lecturer"
		WHERE "SchoolID" = NEW."SchoolID"
	)
	WHERE "SchoolID" = NEW."SchoolID";

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger gọi function trên
CREATE OR REPLACE TRIGGER trg_update_school_number_lecturer
AFTER INSERT OR DELETE OR UPDATE ON "Lecturer"
FOR EACH ROW
EXECUTE FUNCTION f_total_number_lecturer_school ();





