-- Table to store information about schools
CREATE TABLE School.TB_School
(
    School_ID INT NOT NULL PRIMARY KEY, -- Unique identifier for the school
    School_Name VARCHAR(50) NOT NULL, -- Name of the school
	School_abbrev VARCHAR(10),-- Abbrev of the School
    School_Description VARCHAR(100), -- Description of the school
	Faculty_ID INT,--Foreign from Faculty, from this School
	CONSTANT fk_faculty_school
	FOREIGN KEY (Faculty_ID)
	REFERENCES Faculty.TB_Faculty (Faculty_ID),
    Erased BIT DEFAULT 1 NOT NULL -- Bit field to indicate if the record is active (1) or deleted (0)
);
--5FN