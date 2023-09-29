--Table representing the Subject entity
CREATE TABLE Subject.TB_Subject
(
	Subject_ID VARCHAR(10) UNIQUE NOT NULL,
	PRIMARY KEY (Subject_ID),--Acronym that refers to 
	--the course code which is unique and alphanumeric
	Subject_Name VARCHAR(50) NOT NULL,--Course name
	Subject_Credits INT DEFAULT 0,--Course credit value defaults to 0
	Subject_Description VARCHAR(500),--Course Overview
	School_ID INT NOT NULL, 
	CONSTRAINT fk_Subject_School
	FOREIGN KEY (School_ID)
	REFERENCES School.TB_School (School_ID)--Foreign key to assign 
	--a course a relationship with the school to which it belongs
);