
-- Table to represent the relationship between classrooms and groups
CREATE TABLE CLASSROOM.TB_CLASSROOM_GROUP
(
    CLASSROOM_ID INT NOT NULL, -- Identifier of the classroom associated with a group
    GROUP_ID INT NOT NULL, -- Identifier of the group using the classroom
    CG_YEAR DATE NULL, -- Year when the classroom is used by the group (optional)
    CG_SEMESTER INTEGER, -- Semester when the classroom is used by the group

    FOREIGN KEY (CLASSROOM_ID) REFERENCES CLASSROOM.TB_CLASSROOM, -- Foreign key linking to the classroom table
    FOREIGN KEY (GROUP_ID) REFERENCES GROUP.TB_GROUP, -- Foreign key linking to the group table

    -- Constraints:
    -- The combination of CLASSROOM_ID and GROUP_ID should be unique
    CONSTRAINT UNIQUE_CLASSROOM_GROUP UNIQUE (CLASSROOM_ID, GROUP_ID),
    -- Ensure that CG_SEMESTER is a positive integer value
    CONSTRAINT CHECK_SEMESTER CHECK (CG_SEMESTER > 0)
    Erased BIT DEFAULT 1 NOT NULL -- Bit field to indicate if the record is active (1) or deleted (0)
);
