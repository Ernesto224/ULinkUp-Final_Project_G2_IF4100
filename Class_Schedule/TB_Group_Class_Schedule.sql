CREATE TABLE Class_Schedule.Group_Class_Schedule --TABLE WITH ITS ATTRIBUTES
(
	Group_ID INT
	,FOREIGN KEY(Group_ID) REFERENCES [Group].TB_Group(Group_ID)
	,Schedule_ID INT
	,FOREIGN KEY(Schedule_ID) REFERENCES Class_Schedule.TB_Class_Schedule(Schedule_ID)
	,Erased BIT DEFAULT 1 NOT NULL
)