CREATE TABLE Classroom.TB_Classroom --CREATE TABLE CLASSROOM AND ITS ATRIBUTE
(
    Classroom_ID INT PRIMARY KEY NOT NULL,  -- Unique identifier for the Classroom
    Classroom_Name VARCHAR(50) NOT NULL,  -- Classroom name, this can simply be c
	--lassroom number n or it can be more complex, such as laboratory, etc.
    Building_ID INT NOT NULL, --Identifier of the building 
    Erased BIT DEFAULT 1 NOT NULL,  -- Bit field to indicate if the record is active (1) or deleted (0)
    CONSTRAINT fk_building_class
	FOREIGN KEY (Building_ID) 
	REFERENCES Building.TB_Building (Building_ID) -- Foreign key to relate to building
)
--IN 5FN