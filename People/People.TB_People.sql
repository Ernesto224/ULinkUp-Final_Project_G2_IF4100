BEGIN
    
	--The entity represents all the individuals in the system
	CREATE TABLE People.TB_People(
	People_ID VARCHAR(10) UNIQUE NOT NULL,
	PRIMARY KEY (People_ID),--Unique alphanumeric identifier that identifies each person
	Name VARCHAR(50) NOT NULL,--Name of individual
	Last_Name VARCHAR(50) NOT NULL,--First and second surname of the person
	Address_Line VARCHAR(200) NOT NULL,--Exact address of residence
	Phone VARCHAR(15), --The person's phone number can be null
	Mail VARCHAR(320)NOT NULL);--Person's email address

END