
CREATE TABLE CLASSROOM.TB_CLASSROOM --CREATE TABLE CLASSROOM AND ITS ATRIBUTE
(
    Classroom_ID VARCHAR(10) PRIMARY KEY,  -- Unique identifier for the Classroom
    Classroom_Number NUMERIC(2, 0),  -- Number of the building
    Building_ID INT NOT NULL, --Identifier of the building 
    Erased BIT DEFAULT 1 NOT NULL,  -- Bit field to indicate if the record is active (1) or deleted (0)
    FOREIGN KEY (Building_ID) REFERENCES BUILDING.TB_BUILDING (Building_ID)  -- Foreign key to relate to building
)