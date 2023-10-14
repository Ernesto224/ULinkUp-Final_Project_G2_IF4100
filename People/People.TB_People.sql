--The entity represents all the individuals in the system
CREATE TABLE People.TB_People
(
	ID_People INT PRIMARY KEY IDENTITY NOT NULL,--Unique numeric identifier 
	--that identifies each person
	Name_People VARCHAR(50) NOT NULL,--Name of individual
	Last_Name_People VARCHAR(50) NOT NULL,--First and second surname of the person
	Address_People VARCHAR(500) NOT NULL,--Exact address of residence
	Phone_People VARCHAR(15), --The person's phone number can be null
	Email_People VARCHAR(320)NOT NULL,--Person's email address
	Erased BIT DEFAULT 1 NOT NULL --bit type value that allows you to know if the record 
	--is active or deleted,by default the value will be 1
);