-- Table to store building information
CREATE TABLE Building.TB_Building
(
    Building_ID INT PRIMARY KEY IDENTITY NOT NULL, -- Unique identifier for the building
    Building_Name VARCHAR(100), -- Name of the building -- Primary key to uniquely identify each building
    Building_Location VARCHAR(100), -- Location of the building
    Faculty BINARY(1), -- Indicates if the building belongs to a faculty (0 or 1)
    Enclosure_ID INT NOT NULL, -- Identifier of the enclosure where the building is located
    Faculty_ID INT NOT NULL, -- Identifier of the faculty the building belongs to

    FOREIGN KEY (Enclosure_ID) REFERENCES Enclosure.TB_Enclosure (Enclosure_ID), -- Foreign key to relate to enclosure
    FOREIGN KEY (Faculty_ID) REFERENCES Faculty.TB_Faculty (Faculty_ID), -- Foreign key to relate to faculty
    CONSTRAINT UNIQUE_BUILDING_NAME UNIQUE (Building_Name), -- Ensures unique building names
    CONSTRAINT CHECK_FACULTY CHECK (Faculty IN (0, 1)), -- Validates faculty value (0 or 1)
    Erased BIT DEFAULT 1 NOT NULL-- Bit field to indicate if the record is active (1) or deleted (0)
);
--IN 3FN AND 4FN, NOT 5FN BUT 5FN MAKE DE DB MORE COMPLEX