
CREATE TABLE People.TB.Career_Student(
	Career_ID INT NOT NULL,
	FOREIGN KEY (Career_ID) REFERENCES Career.TB_Career(Career_ID),
	Student_ID VARCHAR(10) NOT NULL,
	FOREIGN KEY (Student_ID) REFERENCES People.TB_Student(Student_ID)
)