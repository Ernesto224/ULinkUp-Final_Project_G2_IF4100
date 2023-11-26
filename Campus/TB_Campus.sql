CREATE TABLE Campus.TB_Campus -- TABLE FOR CAMPUS AND ATTRIBUTES
(
	Campus_ID INT PRIMARY KEY IDENTITY NOT NULL
	,Campus_Name VARCHAR(100) NOT NULL
	,University_ID INT NOT NULL 
	,FOREIGN KEY(University_ID) REFERENCES University.TB_University
	,Erased BIT DEFAULT 0 NOT NULL 
)