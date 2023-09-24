BEGIN
    --Table representing the course entity
	CREATE TABLE Course.TB_Courses(
	Course_Acronym VARCHAR(10) UNIQUE NOT NULL,
	PRIMARY KEY (Course_Acronym),--Acrónimo que se refiere al código del curso el cual único
	Name VARCHAR(50) NOT NULL,--Course name
	Credits INT DEFAULT 0,--Course credit value defaults to 0
	Description VARCHAR(1000) NOT NULL,--Course Overview
	School_ID VARCHAR(10) 
	CONSTRAINT fk_School_Course
	FOREIGN KEY (School_ID)
	REFERENCES School.TB_School (School_ID));--Foreign key to assign a course a relationship with the school to which it belongs

END