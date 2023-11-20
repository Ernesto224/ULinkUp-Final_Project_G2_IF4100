CREATE TABLE Class_Schedule.TB_Class_Schedule --TABLE WHITH ITS ATTRIBUTES
(
	Schedule_ID INT PRIMARY KEY IDENTITY NOT NULL--Primary key from Class_Schedule
	,Start_Time TIME NOT NULL--Schedule start time
	,End_Time TIME NOT NULL--Schedule end time
	,[Day] VARCHAR(10) NOT NULL--Day of the week in which that schedule occurs.
	,Erased BIT DEFAULT 1 NOT NULL--column for logical deletion of a schedule.
)