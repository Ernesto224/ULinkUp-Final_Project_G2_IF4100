--This table represents the student's entire academic history
--, all courses taken and their status.
CREATE TABLE People.TB_StudentRecord
(
	Student_ID VARCHAR(10) NOT NULL,
	CONSTRAINT fk_Record_Student
	FOREIGN KEY (Student_ID)
	REFERENCES People.TB_Student(Student_ID),
	PRIMARY KEY(Student_ID),--The primary key of the record is 
	--the identifier of the student to whom the unique being belongs.
	Record_Year DATE NOT NULL,--Refers to the year in which the 
	--course was taken.
	Record_Semester INT NOT NULL,--Refers to the semester in which 
	--the course was taken.
	Record_Average FLOAT NOT NULL,--It refers to the final grade 
	--in which the course was taken.
	Record_Status VARCHAR(20) NOT NULL,--Refers to the status of 
	--the course, enrolled, approved or failed.
	Subject_ID VARCHAR(10) NOT NULL,
	CONSTRAINT fk_Record_Subject
	FOREIGN KEY (Subject_ID)
	REFERENCES Subject.TB_Subject(Subject_ID),
	--foreign key that represents the identifier of the specific course
	Group_ID INT NOT NULL,
	CONSTRAINT fk_Record_Group
	FOREIGN KEY (Group_ID)
	REFERENCES Subject.TB_Group(Group_ID)
	--foreign key that represents the identifier of the course group that was taken
);