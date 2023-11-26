--This table represents the student's entire academic history
--, all courses taken and their status.
CREATE TABLE People.TB_StudentRecord
(
	Student_ID VARCHAR(10) NOT NULL,
	CONSTRAINT fk_Record_Student
	FOREIGN KEY (Student_ID)
	REFERENCES People.TB_Student(Student_ID), 
	--the identifier of the student to whom the unique being belongs.
	Record_Year INT NOT NULL,--Refers to the year in which the 
	--course was taken.
	Record_Semester INT CHECK(Record_Semester < 3 AND Record_Semester > 0)NOT NULL,--Refers to the semester in which 
	--the course was taken.
	Record_Average FLOAT,--It refers to the final grade 
	--in which the course was taken.
	Record_Status VARCHAR(50) DEFAULT 'Registered',--Refers to the status of 
	--the course, enrolled, approved or failed.
	Group_ID INT NOT NULL,
	CONSTRAINT fk_Record_Group
	FOREIGN KEY (Group_ID)
	REFERENCES [Group].TB_Group(Group_ID),
	PRIMARY KEY(Student_ID, Group_ID),--The primary key of the record is
	--foreign key that represents the identifier of the course group that was taken
	Erased BIT DEFAULT 0 NOT NULL--bit type value that allows you to know if the record 
	--is active or deleted, by default the value will be 1
);