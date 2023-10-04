CREATE TABLE People.TB.Group_Teacher(
	 Id_Teacher VARCHAR(20) NOT NULL,
	 FOREIGN KEY (Id_Teacher) REFERENCES People.Teacher(Id_Teacher),
)