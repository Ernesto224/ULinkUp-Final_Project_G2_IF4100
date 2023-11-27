CREATE TABLE Class_Schedule.TB_Group_Class_Schedule --TABLE WITH ITS ATTRIBUTES
(
	Group_ID INT NOT NULL
	,FOREIGN KEY(Group_ID) REFERENCES [Group].TB_Group(Group_ID)
	,Schedule_ID INT NOT NULL
	,PRIMARY KEY (Group_ID, Schedule_ID)
	,FOREIGN KEY(Schedule_ID) REFERENCES Class_Schedule.TB_Class_Schedule(Schedule_ID)
	,Erased BIT DEFAULT 0 NOT NULL 
)


