-- Table to store information about schools
CREATE TABLE SCHOOL.TB_SCHOOLS
(
    ID_School INT NOT NULL PRIMARY KEY, -- Unique identifier for the school
    Name_School VARCHAR(20), -- Name of the school
    Description_School VARCHAR(100) -- Description of the school
);
