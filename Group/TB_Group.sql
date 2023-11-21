--Create Table Group
-- Nubia Brenes Valerín
CREATE TABLE [Group].TB_Group
(
	Group_ID INT PRIMARY KEY IDENTITY NOT NULL,
	Group_Number INT NOT NULL,
	Students_Enrolled INT DEFAULT 0 NOT NULL,
	Subject_ID INT FOREIGN KEY REFERENCES Subject.TB_Subject(Subject_ID) NOT NULL,
	Modality_ID INT FOREIGN KEY REFERENCES Modality.TB_Modality(Modality_ID) NOT NULL
)