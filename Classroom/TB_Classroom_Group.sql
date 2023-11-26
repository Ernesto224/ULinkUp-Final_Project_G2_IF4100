-- Table to represent the relationship between classrooms and groups
CREATE TABLE Classroom.TB_Classroom_Group
(
    Classroom_ID INT NOT NULL, -- Identifier of the classroom associated with a group
    Group_ID INT NOT NULL, -- Identifier of the group using the classroom
    CG_Year INT NOT NULL, -- Year when the classroom is used by the group (optional)
    CG_Semester INT NOT NULL, -- Semester when the classroom is used by the group
    FOREIGN KEY (Classroom_ID) REFERENCES Classroom.TB_Classroom (Classroom_ID), -- Foreign key linking to the classroom table
    FOREIGN KEY (Group_ID) REFERENCES [Group].TB_Group (Group_ID), -- Foreign key linking to the group table
    -- Constraints:
    -- The combination of CLASSROOM_ID and GROUP_ID should be unique
    CONSTRAINT UNIQUE_CLASSROOM_GROUP UNIQUE (Classroom_ID, Group_ID),
    -- Ensure that CG_SEMESTER is a positive integer value
    CONSTRAINT CHECK_SEMESTER CHECK (CG_Semester > 0),
    Erased BIT DEFAULT 0 NOT NULL -- Bit field to indicate if the record is active (1) or deleted (0)
	PRIMARY KEY (Classroom_ID, Group_ID)
);
--IN 3FN