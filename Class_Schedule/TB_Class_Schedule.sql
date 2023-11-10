CREATE TABLE Class_Schedule.TB_Class_Schedule --TABLE WHITH ITS ATTRIBUTES
(
	Schedule_ID INT PRIMARY KEY NOT NULL
	,Start_Time TIME 
	,End_Time TIME 
	,Day_Number INT 
	,Erased BIT DEFAULT 1 NOT NULL
)