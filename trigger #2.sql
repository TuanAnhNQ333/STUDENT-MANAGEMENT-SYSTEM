-- Trigger kiểm tra sinh viên đăng ký đúng thời gian của học kỳ
CREATE OR REPLACE FUNCTION trg_check_register_period()
RETURNS trigger
LANGUAGE plpgsql
AS $$
DECLARE
  reg_start DATE;
  reg_end   DATE;
BEGIN
  SELECT s."RegisterStart", s."RegisterEnd"
  INTO   reg_start, reg_end
  FROM   "CourseClass" cc
  JOIN   "Semester"    s ON s."SemesterID" = cc."Semester"
  WHERE  cc."ClassID"  = NEW."ClassID";

  IF reg_start IS NULL THEN
      RAISE EXCEPTION 'Không tìm thấy học kỳ cho ClassID = %', NEW."ClassID";
  END IF;

  IF CURRENT_DATE < reg_start OR CURRENT_DATE > reg_end THEN
      RAISE EXCEPTION
        'Hết hạn đăng ký: % – %. Hôm nay = %',
        reg_start, reg_end, CURRENT_DATE;
  END IF;

  RETURN NEW;
END;
$$;

CREATE OR REPLACE TRIGGER trg_before_register_check_period
BEFORE INSERT ON "Register"
FOR EACH ROW
EXECUTE FUNCTION trg_check_register_period();

-- Update từ Unpaid thành Paid khi trả đủ
CREATE OR REPLACE FUNCTION fn_pay_tuition()
RETURNS trigger
LANGUAGE plpgsql
AS $$
BEGIN
  IF NEW."Status" <> 'Paid' THEN
      RAISE EXCEPTION 'Chỉ được UPDATE Status thành Paid';
  END IF;

  IF NEW."Amount" <> OLD."Amount" THEN
      RAISE EXCEPTION 'Phải thanh toán đúng số tiền: %', OLD."Amount";
  END IF;

  /* Cập nhật bảng gốc */
  UPDATE "PayTuition"
  SET "PaymentDate" = COALESCE(NEW."PaymentDate", CURRENT_DATE),
      "Status"      = 'Paid'
  WHERE "StudentID" = OLD."StudentID"
    AND "Semester"  = OLD."Semester";

  RETURN NULL;  -- INSTEAD OF trigger
END;
$$;

CREATE OR REPLACE TRIGGER trg_instead_pay
INSTEAD OF UPDATE ON v_student_pay
FOR EACH ROW
EXECUTE FUNCTION fn_pay_tuition();


-- Tự động cập nhật học phí
CREATE OR REPLACE FUNCTION trg_update_pay_tuition()
RETURNS trigger
LANGUAGE plpgsql
AS $$
DECLARE
  v_student    INT;
  v_semester   VARCHAR;
  v_total      NUMERIC;
BEGIN
  v_student  := COALESCE(NEW."StudentID", OLD."StudentID");

  SELECT cc."Semester"
  INTO   v_semester
  FROM   "CourseClass" cc
  WHERE  cc."ClassID" = COALESCE(NEW."ClassID", OLD."ClassID");
  SELECT SUM(c."Credits" * t."TuitionRate")
  INTO   v_total
  FROM   "Register" r
  JOIN   "CourseClass" cc ON cc."ClassID" = r."ClassID"
  JOIN   "Course"      c  ON c."CourseID" = cc."CourseID"
  JOIN   "Tuition"     t  ON t."CourseID" = c."CourseID"
                          AND t."Semester" = cc."Semester"
  WHERE  r."StudentID" = v_student
    AND  cc."Semester" = v_semester;
  INSERT INTO "PayTuition" ("StudentID","Semester","Amount","Status")
  VALUES (v_student, v_semester, COALESCE(v_total,0), 'Unpaid'::pay_status)
  ON CONFLICT ("StudentID","Semester")             -- khóa chính
  DO UPDATE SET "Amount" = COALESCE(v_total,0);

  RETURN NULL;
END;
$$;

CREATE OR REPLACE TRIGGER trg_after_register_recalc_tuition
AFTER INSERT OR DELETE ON "Register"
FOR EACH ROW
EXECUTE FUNCTION trg_update_pay_tuition();


-- Kiểm tra môn tiên quyết
CREATE OR REPLACE FUNCTION trg_check_prerequisite()
RETURNS trigger
LANGUAGE plpgsql
AS $$
DECLARE
  v_count_missing INT;
BEGIN
  /* Đếm số môn tiên quyết SV chưa đạt */
  SELECT COUNT(*) INTO v_count_missing
  FROM   "CoursePrerequisite" cp
  JOIN   "CourseClass"        cc ON cc."CourseID" = cp."CourseID"
  WHERE  cc."ClassID" = NEW."ClassID"
  AND NOT EXISTS (
    SELECT 1
    FROM   "Register" r2
    JOIN   "CourseClass" cc2 ON cc2."ClassID" = r2."ClassID"
    WHERE  r2."StudentID" = NEW."StudentID"
    AND    cc2."CourseID" = cp."PreReqCourseID"
    AND    r2."FinalScore" >= 5                     -- đậu
  );

  IF v_count_missing > 0 THEN
     RAISE EXCEPTION
       'Sinh viên % chưa hoàn tất % môn tiên quyết của lớp %',
       NEW."StudentID", v_count_missing, NEW."ClassID";
  END IF;

  RETURN NEW;
END;
$$;

CREATE TRIGGER trg_before_register_prereq
BEFORE INSERT ON "Register"
FOR EACH ROW
EXECUTE FUNCTION trg_check_prerequisite();

-- Cập nhật CPA
CREATE OR REPLACE FUNCTION fn_update_student_cpa() 
RETURNS TRIGGER AS
$$
DECLARE
    v_id INT;          -- StudentID bị tác động
BEGIN
    -- Lấy ID của bản ghi vừa thay đổi (NEW cho INSERT/UPDATE, OLD cho DELETE)
    v_id := COALESCE(NEW."StudentID", OLD."StudentID");

    /* Tính lại CPA của sinh viên v_id dựa trên view v_student_gpa */
    UPDATE "Student" s
    SET    "CPA" = sub.new_cpa
    FROM (
        SELECT ROUND(SUM(GPA * semester_credits)
                     / NULLIF(SUM(semester_credits),0), 2) AS new_cpa
        FROM   v_student_gpa
        WHERE  "StudentID" = v_id
    ) sub
    WHERE s."StudentID" = v_id;

    RETURN NULL;   -- trigger AFTER, không cần trả bản ghi
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER trg_update_student_cpa
AFTER INSERT OR UPDATE OF "MidtermScore", "FinalScore" OR DELETE
ON "Register"
FOR EACH ROW
EXECUTE FUNCTION fn_update_student_cpa();


