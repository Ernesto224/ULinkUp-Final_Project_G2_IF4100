--Table People.TB_Administrative_Employee create, People. is SCHEMA From the Data Bases.
CREATE TABLE People.TB_Employee
(
	Employee_ID INT PRIMARY KEY IDENTITY NOT NULL, --code that identifies the employee 
	--in question within the institution
	Job VARCHAR(100) NOT NULL, --Position of the Job
	Job_Description VARCHAR(500),--Description of the Job
	Administrative_Salary NUMERIC(16,3) NOT NULL,--Salary of the Employee
	Date_Admission DATE NOT NULL,--date you started working at the institution
	People_ID INT NOT NULL,--ID for Identify it in the person table
	FOREIGN KEY (People_ID) REFERENCES People.TB_People(People_ID),
	Erased BIT DEFAULT 0 NOT NULL  --bit type value that allows you to know if the record 
	--is active or deleted,by default the value will be 1
)