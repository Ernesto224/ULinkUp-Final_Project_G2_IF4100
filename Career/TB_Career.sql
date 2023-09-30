
--Create Table Faculty
-- Nubia Brenes Valerín
CREATE TABLE Career.TB_Career
(
	Career_ID INT PRIMARY KEY IDENTITY NOT NULL,
	--Career_acronym VARCHAR(10) NOT NULL,
	Career_Abbrev VARCHAR(10) NOT NULL,
	Career_Name VARCHAR(50) NOT NULL,
	Career_Description VARCHAR(500) NOT NULL,
	Faculty_ID INT FOREIGN KEY REFERENCES Faculty(Faculty_ID)
)