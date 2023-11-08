CREATE TABLE ENCLOSURE.TB_Enclosure --CREATION OF ENCLOSURE TABLE 
(
	Enclosure_ID INT PRIMARY KEY NOT NULL
	,Enclosure_Name VARCHAR(100) NOT NULL
	,Campus_ID INT
	,FOREIGN KEY(Campus_ID) REFERENCES CAMPUS.Campus(Campus_ID)
	,Erased BIT DEFAULT 1 NOT NULL
)