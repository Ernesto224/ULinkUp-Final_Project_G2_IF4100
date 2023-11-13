--Create Table Group
-- Nubia Brenes Valerín
CREATE TABLE [Group].TB_Group
(
	Group_ID INT PRIMARY KEY IDENTITY NOT NULL,--unique identity
	Group_Number INT NOT NULL,--group number
	Students_Enrolled INT NOT NULL,
	Faculty_Description VARCHAR(500) NOT NULL
)
