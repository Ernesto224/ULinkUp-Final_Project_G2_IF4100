--This intermediate table represents the requirements and therefore the 
--corequisites to enroll a subject
CREATE TABLE Subject.TB_Requisite
(
	Requisite_ID INT PRIMARY KEY IDENTITY NOT NULL,--Numeric identifier for 
	--a course requirement.
	Associated_Subject INT NOT NULL,
	CONSTRAINT fk_Requisite_SubjectA
	FOREIGN KEY (Associated_Subject)
	REFERENCES Subject.TB_Subject(Subject_ID),--This foreign key that refers 
	--to the course that needs the requirement
	Required_Subject INT NOT NULL,
	CONSTRAINT fk_Requisite_SubjectR
	FOREIGN KEY (Required_Subject)
	REFERENCES Subject.TB_Subject(Subject_ID),--This foreign key that refers 
	--to the course that is the requirement as such
	Erased BIT DEFAULT 1 NOT NULL --bit type value that allows you to know if the record 
	--is active or deleted,by default the value will be 1
);
--IN 5FN