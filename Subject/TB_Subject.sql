--Table representing the Subject entity
CREATE TABLE Subject.TB_Subject
(
	Subject_ID INT PRIMARY KEY IDENTITY NOT NULL,--Unique code of subject
	Subject_Name VARCHAR(50) NOT NULL,--Course name
	Subject_Acronym VARCHAR(10) NOT NULL,--Acronym that refers to 
	--the course code which is unique and alphanumeric
	Subject_Credits INT DEFAULT 0 NOT NULL,--Course credit value defaults to 0
	Subject_Description VARCHAR(500),--Course Overview
	School_ID INT NOT NULL, 
	CONSTRAINT fk_Subject_School
	FOREIGN KEY (School_ID)
	REFERENCES School.TB_School (School_ID),--Foreign key to assign 
	--a course a relationship with the school to which it belongs
	Erased BIT DEFAULT 1 NOT NULL --bit type value that allows you to know if the record 
	--is active or deleted,by default the value will be 1
);
--IN 5FN