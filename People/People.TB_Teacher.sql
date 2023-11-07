--Table People.Teacher create.

CREATE TABLE People.TB_Teacher(
ID_Teacher VARCHAR(10) PRIMARY KEY NOT NULL,
Date_Admission DATE NOT NULL,
Salary_Teacher INT NOT NULL,
ID_People INT NOT NULL,
FOREIGN KEY (PeopleID) REFERENCES People.TB_People(ID_People),
Erased BIT DEFAULT 1 NOT NULL --bit type value that allows you to know if the record 
    --is active or deleted,by default the value will be 1
)
 