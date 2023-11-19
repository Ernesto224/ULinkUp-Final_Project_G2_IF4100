CREATE TABLE People.TB_Group_Teacher
(
	 Group_ID INT NOT NULL, --references from one group
	 CONSTRAINT FK_GROUP_GT
	 FOREIGN KEY (Group_ID) 
	 REFERENCES [Group].TB_Group(Group_ID),
	 Teacher_ID INT NOT NULL,--employee id references from the one teacher
	 CONSTRAINT FK_TEACHER_GT
	 FOREIGN KEY (Teacher_ID) 
	 REFERENCES People.TB_Employee(Employee_ID),
	 PRIMARY KEY (Group_ID,Teacher_ID),--The primary key of the table is composed of 
	 --the 2 foreign keys to indicate that a group does not appear twice associated 
	 --with the same master, to avoid repeated data.
	 Erased BIT DEFAULT 1 NOT NULL --bit type value that allows you to know if the record 
	--is active or deleted,by default the value will be 1
)