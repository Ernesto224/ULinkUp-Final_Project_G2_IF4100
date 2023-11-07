CREATE TABLE People.TB.Group_Teacher(
	 Id_Teacher VARCHAR(20) NOT NULL,
	 FOREIGN KEY (Id_Teacher) REFERENCES People.Teacher(Id_Teacher),
	 Group_ID INT NOT NULL, 
	 FOREIGN KEY (Group_ID) REFERENCES Group.TB_Group(Group_ID)
)