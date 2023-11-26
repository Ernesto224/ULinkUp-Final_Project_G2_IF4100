--The entity represents the students of the system
CREATE TABLE People.TB_Student
(
	Student_ID VARCHAR(10) UNIQUE NOT NULL,
	PRIMARY KEY(Student_ID),--The student unique alphanumeric ID 
	Date_Admission DATE NOT NULL,--Date the student was admitted
	People_ID INT NOT NULL,
	CONSTRAINT fk_Student_People
	FOREIGN KEY (People_ID)
	REFERENCES People.TB_People (People_ID),--The people ID is a 
	--foreign key of the person as it is a generalization of this entity
	Erased BIT DEFAULT 0 NOT NULL  --bit type value that allows you to know if the record 
	--is active or deleted, by default the value will be 1
);
--5FN