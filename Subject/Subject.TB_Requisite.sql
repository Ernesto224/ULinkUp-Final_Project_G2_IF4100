--This intermediate table represents the requirements and therefore the 
--corequisites to enroll a subject
CREATE TABLE Subject.TB_Requisite
(
	ID_Requisite INT PRIMARY KEY IDENTITY NOT NULL,--Numeric identifier for 
	--a course requirement.
	Associated_Subject VARCHAR(10) NOT NULL,
	CONSTRAINT fk_Requisite_SubjectA
	FOREIGN KEY (Associated_Subject)
	REFERENCES Subject.TB_Subject(ID_Subject),--This foreign key that refers 
	--to the course that needs the requirement
	Required_Subject VARCHAR(10) NOT NULL,
	CONSTRAINT fk_Requisite_SubjectR
	FOREIGN KEY (Required_Subject)
	REFERENCES Subject.TB_Subject(ID_Subject),--This foreign key that refers 
	--to the course that is the requirement as such
	Erased BIT DEFAULT 1 NOT NULL --bit type value that allows you to know if the record 
	--is active or deleted,by default the value will be 1
);