CREATE SCHEMA BUILDING --CREATE BUILDING SCHEMA

CREATE TABLE BUILDING.TB_BUILDING  --CREATE BUILDING TABLE AND ITS ATTRIBUTES
(
BUILDING_ID INT NOT NULL PRIMARY KEY,
BUILDING_NAME VARCHAR(100),
BUILDING_LOCATION VARCHAR(100),
FACULTY BINARY(1),
ENCLOSURE_ID INT NOT NULL FOREIGN KEY REFERENCES ENCLOSURE.TB_ENCLOSURE,
FACULTY_ID VARCHAR(10) NOT NULL FOREIGN KEY REFERENCES ENCLOSURE.TB_FACULTY
)