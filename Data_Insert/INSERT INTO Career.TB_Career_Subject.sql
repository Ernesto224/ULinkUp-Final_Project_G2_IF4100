--DECLARE @Career_ID INT;
--DECLARE @Subject_ID INT;
--DECLARE @Semester INT;

-- Insert data for Career 1
SET @Career_ID = 1;
SET @Semester = 1;

INSERT INTO Career.TB_Career_Subject (Career_ID, Subject_ID, Semester)
VALUES (@Career_ID, 1, @Semester);

INSERT INTO Career.TB_Career_Subject (Career_ID, Subject_ID, Semester)
VALUES (@Career_ID, 2, @Semester);

INSERT INTO Career.TB_Career_Subject (Career_ID, Subject_ID, Semester)
VALUES (@Career_ID, 3, @Semester);

SET @Semester = 2;

INSERT INTO Career.TB_Career_Subject (Career_ID, Subject_ID, Semester)
VALUES (@Career_ID, 4, @Semester);

INSERT INTO Career.TB_Career_Subject (Career_ID, Subject_ID, Semester)
VALUES (@Career_ID, 5, @Semester);

-- Insert data for Career 2
SET @Career_ID = 2;
SET @Semester = 1;

INSERT INTO Career.TB_Career_Subject (Career_ID, Subject_ID, Semester)
VALUES (@Career_ID, 6, @Semester);

INSERT INTO Career.TB_Career_Subject (Career_ID, Subject_ID, Semester)
VALUES (@Career_ID, 7, @Semester);

INSERT INTO Career.TB_Career_Subject (Career_ID, Subject_ID, Semester)
VALUES (@Career_ID, 8, @Semester);

SET @Semester = 2;

INSERT INTO Career.TB_Career_Subject (Career_ID, Subject_ID, Semester)
VALUES (@Career_ID, 9, @Semester);

INSERT INTO Career.TB_Career_Subject (Career_ID, Subject_ID, Semester)
VALUES (@Career_ID, 10, @Semester);

-- Insert data for Career 3
DECLARE @Career_ID INT;
DECLARE @Subject_ID INT;
DECLARE @Semester INT;
SET @Career_ID = 3;
SET @Semester = 1;

INSERT INTO Career.TB_Career_Subject (Career_ID, Subject_ID, Semester)
VALUES (@Career_ID, 10, @Semester);

INSERT INTO Career.TB_Career_Subject (Career_ID, Subject_ID, Semester)
VALUES (@Career_ID, 1, @Semester);

INSERT INTO Career.TB_Career_Subject (Career_ID, Subject_ID, Semester)
VALUES (@Career_ID, 3, @Semester);

SET @Semester = 2;

INSERT INTO Career.TB_Career_Subject (Career_ID, Subject_ID, Semester)
VALUES (@Career_ID, 5, @Semester);
