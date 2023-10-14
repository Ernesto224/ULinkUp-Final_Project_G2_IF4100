--The entity represents the students of the system
CREATE TABLE People.TB_Student
(
	ID_Student VARCHAR(10) UNIQUE NOT NULL,
	PRIMARY KEY(Student_ID),--The student unique alphanumeric ID 
	Date_Admission DATE NOT NULL,--Date the student was admitted
	ID_People INT NOT NULL,
	CONSTRAINT fk_Student_People
	FOREIGN KEY (ID_People)
	REFERENCES People.TB_People (ID_People),--The people ID is a 
	--foreign key of the person as it is a generalization of this entity
	Erased BIT DEFAULT 1 NOT NULL --bit type value that allows you to know if the record 
	--is active or deleted, by default the value will be 1
);