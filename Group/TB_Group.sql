--Create Table Group
-- Nubia Brenes Valerín
CREATE TABLE Group.TB_Group
(
	Group_ID INT PRIMARY KEY IDENTITY NOT NULL,
	Group_Number INT NOT NULL,
	Students_Enrolled INT NOT NULL,
	Subject_ID INT FOREIGN KEY REFERENCES Subject(Subject_ID),
	Modality_ID INT FOREIGN KEY REFERENCES Modality(Modality_ID)
)
