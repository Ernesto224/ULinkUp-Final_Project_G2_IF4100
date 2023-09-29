--This intermediate table represents the requirements and therefore the 
--corequisites to enroll a subject
CREATE TABLE Subject.TB_Requisite
(
	Requisite_ID INT PRIMARY KEY IDENTITY NOT NULL,--Numeric identifier for 
	--a course requirement.
	Subject_Associated VARCHAR(10) NOT NULL,
	CONSTRAINT fk_Requisite_SubjectA
	FOREIGN KEY (Subject_Associated)
	REFERENCES Subject.TB_Subject(Subject_ID),--This foreign key that refers 
	--to the course that needs the requirement
	Subject_Required VARCHAR(10) NOT NULL,
	CONSTRAINT fk_Requisite_SubjectR
	FOREIGN KEY (Subject_Required)
	REFERENCES Subject.TB_Subject(Subject_ID)--This foreign key that refers 
	--to the course that is the requirement as such
);