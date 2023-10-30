-- Table People.TB_Employee created. People. is the SCHEMA from the Databases.

CREATE TABLE People.TB_Employee (
    Position_Employee VARCHAR(200) NOT NULL, -- Employee's position at the University.
    Job_Description_Employee VARCHAR(1000) NOT NULL, -- Description of the work performed.
    Salary_Employee FLOAT NOT NULL, -- Salary received.
    People_ID INT NOT NULL, -- Used to store the foreign key.
    FOREIGN KEY (People_ID) REFERENCES People.TB_People(People_ID) -- Foreign key that links the TB_Employee table with the TB_People table
);

