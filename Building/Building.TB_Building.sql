-- Table to store building information
CREATE TABLE BUILDING.TB_BUILDING
(
    Building_ID INT NOT NULL, -- Unique identifier for the building
    Building_Name VARCHAR(100), -- Name of the building
    Building_Location VARCHAR(100), -- Location of the building
    Faculty BINARY(1), -- Indicates if the building belongs to a faculty (0 or 1)
    Enclosure_ID INT NOT NULL, -- Identifier of the enclosure where the building is located
    Faculty_ID VARCHAR(10), -- Identifier of the faculty the building belongs to

    PRIMARY KEY (Building_ID), -- Primary key to uniquely identify each building
    FOREIGN KEY (Enclosure_ID) REFERENCES ENCLOSURE.TB_ENCLOSURE (Enclosure_ID), -- Foreign key to relate to enclosure
    FOREIGN KEY (Faculty_ID) REFERENCES ENCLOSURE.TB_FACULTY (Faculty_ID), -- Foreign key to relate to faculty
    CONSTRAINT UNIQUE_BUILDING_NAME UNIQUE (BUILDING_NAME), -- Ensures unique building names
    CONSTRAINT CHECK_FACULTY CHECK (FACULTY IN (0, 1)), -- Validates faculty value (0 or 1)
    Erased BIT DEFAULT 1 NOT NULL -- Bit field to indicate if the record is active (1) or deleted (0)
);
