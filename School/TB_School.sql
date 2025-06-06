-- Table to store information about schools
CREATE TABLE School.TB_School
(
    School_ID INT PRIMARY KEY IDENTITY NOT NULL, -- Unique identifier for the school
    School_Name VARCHAR(50) NOT NULL, -- Name of the school
	School_abbrev VARCHAR(10),-- Abbrev of the School
    School_Description VARCHAR(500) NOT NULL, -- Description of the school
	Faculty_ID INT NOT NULL,--Foreign from Faculty, from this School
	CONSTRAINT fk_faculty_school
	FOREIGN KEY (Faculty_ID)
	REFERENCES Faculty.TB_Faculty (Faculty_ID),
    Erased BIT DEFAULT 0 NOT NULL  -- Bit field to indicate if the record is active (1) or deleted (0)
);
--5FN