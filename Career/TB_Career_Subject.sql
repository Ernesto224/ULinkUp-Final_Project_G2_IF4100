--Create Table Career_Subject
-- Nubia Brenes Valer�n
CREATE TABLE Career.TB_Career_Subject
(
	Career_ID INT FOREIGN KEY REFERENCES Career(Career_ID),
	Subject_ID INT FOREIGN KEY REFERENCES Subject(Subject_ID),
	Semester INT NOT NULL,
	-- Ensure that CG_SEMESTER is a positive integer value
    CONSTRAINT CHECK_SEMESTER CHECK (Semester > 0),
	PRIMARY KEY (Career_ID, Subject_ID)
)
--IN 3FN?