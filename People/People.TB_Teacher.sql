--Table People.Teacher create.

CREATE TABLE People.TB_Teacher(
ID_Teacher VARCHAR(10) PRIMARY KEY NOT NULL,
Date_Admission DATE NOT NULL,
Salary_Teacher INT NOT NULL,
ID_People INT NOT NULL,
FOREIGN KEY (PeopleID) REFERENCES People.TB_People(ID_People)
)
 