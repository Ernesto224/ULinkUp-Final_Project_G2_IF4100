--The entity represents all the individuals in the system
CREATE TABLE People.TB_People
(
	People_ID INT PRIMARY KEY IDENTITY NOT NULL,--Unique numeric identifier 
	--that identifies each person
	People_Name VARCHAR(50) NOT NULL,--Name of individual
	People_Last_Name VARCHAR(50) NOT NULL,--First and second surname of the person
	People_Address VARCHAR(100) NOT NULL,--Exact address of residence
	People_Phone VARCHAR(20) UNIQUE, --The person's phone number can be null
	People_Email VARCHAR(125) UNIQUE NOT NULL,--Person's email address
	Erased BIT DEFAULT 0 NOT NULL  --bit type value that allows you to know if the record 
	--is active or deleted,by default the value will be 1
);
--IN 5FN