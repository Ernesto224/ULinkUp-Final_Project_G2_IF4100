-- Table to store information about schools
CREATE TABLE SCHOOL.TB_SCHOOLS
(
    ID_School INT NOT NULL PRIMARY KEY, -- Unique identifier for the school
    Name_School VARCHAR(20), -- Name of the school
    Description_School VARCHAR(100) -- Description of the school
    Erased BIT DEFAULT 1 NOT NULL -- Bit field to indicate if the record is active (1) or deleted (0)
);
