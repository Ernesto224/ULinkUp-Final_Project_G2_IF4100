--Table representing the Subject entity
CREATE TABLE Subject.TB_Subject
(
	ID_Subject VARCHAR(10) UNIQUE NOT NULL,
	PRIMARY KEY (ID_Subject),--Acronym that refers to 
	--the course code which is unique and alphanumeric
	Name_Subject VARCHAR(50) NOT NULL,--Course name
	Credits_Subject INT DEFAULT 0,--Course credit value defaults to 0
	Description_Subject VARCHAR(500),--Course Overview
	ID_School INT NOT NULL, 
	CONSTRAINT fk_Subject_School
	FOREIGN KEY (ID_School)
	REFERENCES School.TB_School (ID_School),--Foreign key to assign 
	--a course a relationship with the school to which it belongs
	Erased BIT DEFAULT 1 NOT NULL --bit type value that allows you to know if the record 
	--is active or deleted,by default the value will be 1
);