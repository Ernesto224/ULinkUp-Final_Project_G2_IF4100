--The entity represents all the individuals in the system
CREATE TABLE People.TB_People
(
	People_ID INT PRIMARY KEY IDENTITY NOT NULL,--Unique numeric identifier 
	--that identifies each person
	People_Name VARCHAR(50) NOT NULL,--Name of individual
	People_Last_Name VARCHAR(50) NOT NULL,--First and second surname of the person
	People_Address VARCHAR(500) NOT NULL,--Exact address of residence
	People_Phone VARCHAR(15), --The person's phone number can be null
	People_Email VARCHAR(320)NOT NULL,--Person's email address
	Erased BIT DEFAULT 1 NOT NULL --bit type value that allows you to know if the record 
	--is active or deleted,by default the value will be 1
);