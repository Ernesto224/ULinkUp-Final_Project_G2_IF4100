--Table People.TB_Administrative_Employee create, People. is SCHEMA From the Data Bases.

CREATE TABLE People.TB_Administrative_Employee(
Position VARCHAR(200) NOT NULL, --Position of the Job
Job_Description Varchar(1000) NOT NULL,--Description of the Job
Salary INT NOT NULL,--Salary of the Employee
People_ID INT NOT NULL,--ID for Identify it
FOREIGN KEY (People_ID) REFERENCES People.People(People_ID),
Erased_Administrative_Employee INT NOT NULL
) 
