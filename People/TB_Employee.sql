--Table People.TB_Administrative_Employee create, People. is SCHEMA From the Data Bases.

CREATE TABLE People.TB_Administrative_Employee(
Position VARCHAR(200) NOT NULL, --Position of the Job
Job_Description Varchar(1000) NOT NULL,--Description of the Job
Salary INT NOT NULL,--Salary of the Employee
Date_Admission DATE NOT NULL,
People_ID INT NOT NULL,--ID for Identify it
FOREIGN KEY (People_ID) REFERENCES People.People(People_ID),
Erased BIT DEFAULT 1 NOT NULL --bit type value that allows you to know if the record 
    --is active or deleted,by default the value will be 1
) 
