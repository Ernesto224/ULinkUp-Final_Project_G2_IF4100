--Table People.TB_Teacher create.

CREATE TABLE People.TB_Teacher (
    Id_Teacher VARCHAR(20) PRIMARY KEY NOT NULL, -- Unique identifier of the table
    Date_Of_Admission DATE NOT NULL, -- Teacher's admission date
    Salary FLOAT NOT NULL, -- Teacher's salary
    People_ID INT NOT NULL, -- Used to store the foreign key.
    FOREIGN KEY (People_ID) REFERENCES People.TB_People(People_ID) -- Foreign key that links the TB_Teacher table with the TB_People table
);
