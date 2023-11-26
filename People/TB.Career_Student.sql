CREATE TABLE People.TB_Career_Student--intermediate table to relate a career to a student
(
	Career_ID INT NOT NULL,--foreign key to relate to a career
	FOREIGN KEY (Career_ID) REFERENCES Career.TB_Career(Career_ID),
	Student_ID VARCHAR(10) NOT NULL,--foreign key to relate a student
	FOREIGN KEY (Student_ID) REFERENCES People.TB_Student(Student_ID),
	PRIMARY KEY (Career_ID, Student_ID),
	Erased BIT DEFAULT 0 NOT NULL  --bit type value that allows you to know if the record 
	--is active or deleted,by default the value will be 1
)