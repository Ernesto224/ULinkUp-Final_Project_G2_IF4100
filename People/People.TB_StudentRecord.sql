--This table represents the student's entire academic history
--, all courses taken and their status.
CREATE TABLE People.TB_StudentRecord
(
	ID_Student VARCHAR(10) NOT NULL,
	CONSTRAINT fk_Record_Student
	FOREIGN KEY (ID_Student)
	REFERENCES People.TB_Student(ID_Student),
	PRIMARY KEY(ID_Student),--The primary key of the record is 
	--the identifier of the student to whom the unique being belongs.
	Record_Year DATE NOT NULL,--Refers to the year in which the 
	--course was taken.
	Record_Semester INT NOT NULL,--Refers to the semester in which 
	--the course was taken.
	Record_Average FLOAT NOT NULL,--It refers to the final grade 
	--in which the course was taken.
	Record_Status VARCHAR(20) NOT NULL,--Refers to the status of 
	--the course, enrolled, approved or failed.
	ID_Subject VARCHAR(10) NOT NULL,
	CONSTRAINT fk_Record_Subject
	FOREIGN KEY (ID_Subject)
	REFERENCES Subject.TB_Subject(ID_Subject),
	--foreign key that represents the identifier of the specific course
	ID_Group INT NOT NULL,
	CONSTRAINT fk_Record_Group
	FOREIGN KEY (ID_Group)
	REFERENCES Subject.TB_Group(ID_Group),
	--foreign key that represents the identifier of the course group that was taken
	Erased BIT DEFAULT 1 NOT NULL --bit type value that allows you to know if the record 
	--is active or deleted, by default the value will be 1
);