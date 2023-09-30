--Create Table Career_Subject
-- Nubia Brenes Valerín
CREATE TABLE Career_Subject.TB_Career_Subject
(
	Career_ID INT FOREIGN KEY REFERENCES Career(Career_ID),
	Subject_ID INT FOREIGN KEY REFERENCES Subject(Subject_ID),
	Semester INT 	
)
