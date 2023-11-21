--Create Table Faculty
-- Nubia Brenes Valerín
CREATE TABLE Career.TB_Career
(
	Career_ID INT PRIMARY KEY IDENTITY NOT NULL,
	Career_Name VARCHAR(100) NOT NULL,
	Career_Acronym VARCHAR(10) NOT NULL,
	Career_Description VARCHAR(500) NOT NULL,
	Faculty_ID INT FOREIGN KEY REFERENCES Faculty.TB_Faculty(Faculty_ID) NOT NULL
)
--IN 3FN