BEGIN

    --The entity represents the students of the system
	CREATE TABLE People.TB_Student(
	People_ID VARCHAR(10) UNIQUE NOT NULL,
	CONSTRAINT fk_People_Student
	FOREIGN KEY (People_ID)
	REFERENCES People.TB_People (People_ID),--The student ID is a foreign key of the person as it is a generalization of this entity
	Date_Admission DATE NOT NULL);--Date the student was admitted

END