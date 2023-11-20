--Create Table Faculty
-- Nubia Brenes Valerín
CREATE TABLE Career.TB_Career
(
	Career_ID INT PRIMARY KEY IDENTITY NOT NULL,
	Career_Name VARCHAR(50) NOT NULL,
	Career_Acronym VARCHAR(10) NOT NULL,
	Career_Description VARCHAR(500),
	Faculty_ID INT FOREIGN KEY REFERENCES Faculty.TB_Faculty(Faculty_ID)
)
--IN 3FN