-- Table People.TB_Employee created. People. is the SCHEMA from the Databases.

CREATE TABLE People.TB_Employee (
    Position VARCHAR(200) NOT NULL, -- Employee's position at the University.
    Job_Description VARCHAR(1000) NOT NULL, -- Description of the work performed.
    Salary FLOAT NOT NULL, -- Salary received.
    Id_People INT NOT NULL, -- Used to store the foreign key.
    FOREIGN KEY (Id_People) REFERENCES People.TB_People(Id_People) -- Foreign key that links the TB_Employee table with the TB_People table
);

