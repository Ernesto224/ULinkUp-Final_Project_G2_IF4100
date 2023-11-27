CREATE TABLE University.TB_University --CREATE TABLE UNIVERSITY AND ITS ATTRIBUTES
(
	University_ID INT PRIMARY KEY IDENTITY NOT NULL 
	,University_Name VARCHAR(100) NOT NULL
	,Erased BIT DEFAULT 0 NOT NULL 
)

CREATE TABLE Campus.TB_Campus -- TABLE FOR CAMPUS AND ATTRIBUTES
(
	Campus_ID INT PRIMARY KEY IDENTITY NOT NULL
	,Campus_Name VARCHAR(100) NOT NULL
	,University_ID INT NOT NULL 
	,FOREIGN KEY(University_ID) REFERENCES University.TB_University
	,Erased BIT DEFAULT 0 NOT NULL 
)

CREATE TABLE Enclosure.TB_Enclosure --CREATION OF ENCLOSURE TABLE 
(
	Enclosure_ID INT PRIMARY KEY IDENTITY NOT NULL
	,Enclosure_Name VARCHAR(100) NOT NULL
	,Campus_ID INT NOT NULL
	,FOREIGN KEY(Campus_ID) REFERENCES Campus.TB_Campus(Campus_ID)
	,Erased BIT DEFAULT 0 NOT NULL 
)

CREATE TABLE Faculty.TB_Faculty
(
	Faculty_ID INT PRIMARY KEY IDENTITY NOT NULL,
	Faculty_Name VARCHAR(50) UNIQUE NOT NULL,
	Faculty_Description VARCHAR(500) NOT NULL
)

ALTER TABLE Faculty.TB_Faculty
ADD Erased BIT DEFAULT 0 NOT NULL ;


CREATE TABLE School.TB_School
(
    School_ID INT PRIMARY KEY IDENTITY NOT NULL, -- Unique identifier for the school
    School_Name VARCHAR(50) NOT NULL, -- Name of the school
	School_abbrev VARCHAR(10),-- Abbrev of the School
    School_Description VARCHAR(500) NOT NULL, -- Description of the school
	Faculty_ID INT NOT NULL,--Foreign from Faculty, from this School
	CONSTRAINT fk_faculty_school
	FOREIGN KEY (Faculty_ID)
	REFERENCES Faculty.TB_Faculty (Faculty_ID),
    Erased BIT DEFAULT 0 NOT NULL  -- Bit field to indicate if the record is active (1) or deleted (0)
)

CREATE TABLE Building.TB_Building
(
    Building_ID INT PRIMARY KEY IDENTITY NOT NULL, -- Unique identifier for the building
    Building_Name VARCHAR(100), -- Name of the building -- Primary key to uniquely identify each building
    Building_Location VARCHAR(100) NOT NULL, -- Location of the building
    Faculty BINARY(1), -- Indicates if the building belongs to a faculty (0 or 1)
    Enclosure_ID INT NOT NULL, -- Identifier of the enclosure where the building is located
    Faculty_ID INT, -- Identifier of the faculty the building belongs to

    FOREIGN KEY (Enclosure_ID) REFERENCES Enclosure.TB_Enclosure (Enclosure_ID), -- Foreign key to relate to enclosure
    FOREIGN KEY (Faculty_ID) REFERENCES Faculty.TB_Faculty (Faculty_ID), -- Foreign key to relate to faculty
    CONSTRAINT UNIQUE_BUILDING_NAME UNIQUE (Building_Name), -- Ensures unique building names
    CONSTRAINT CHECK_FACULTY CHECK (Faculty IN (0, 1)), -- Validates faculty value (0 or 1)
    Erased BIT DEFAULT 0 NOT NULL -- Bit field to indicate if the record is active (1) or deleted (0)
)

CREATE TABLE People.TB_People
(
	People_ID INT PRIMARY KEY IDENTITY NOT NULL,--Unique numeric identifier 
	--that identifies each person
	People_Name VARCHAR(50) NOT NULL,--Name of individual
	People_Last_Name VARCHAR(50) NOT NULL,--First and second surname of the person
	People_Address VARCHAR(100) NOT NULL,--Exact address of residence
	People_Phone VARCHAR(20) UNIQUE, --The person's phone number can be null
	People_Email VARCHAR(125) UNIQUE NOT NULL,--Person's email address
	Erased BIT DEFAULT 0 NOT NULL  --bit type value that allows you to know if the record 
	--is active or deleted,by default the value will be 1
)

CREATE TABLE People.TB_Student
(
	Student_ID VARCHAR(10) UNIQUE NOT NULL,
	PRIMARY KEY(Student_ID),--The student unique alphanumeric ID 
	Date_Admission DATE NOT NULL,--Date the student was admitted
	People_ID INT NOT NULL,
	CONSTRAINT fk_Student_People
	FOREIGN KEY (People_ID)
	REFERENCES People.TB_People (People_ID),--The people ID is a 
	--foreign key of the person as it is a generalization of this entity
	Erased BIT DEFAULT 0 NOT NULL  --bit type value that allows you to know if the record 
	--is active or deleted, by default the value will be 1
)

CREATE TABLE People.TB_Employee
(
	Employee_ID INT PRIMARY KEY IDENTITY NOT NULL, --code that identifies the employee 
	--in question within the institution
	Job VARCHAR(100) NOT NULL, --Position of the Job
	Job_Description VARCHAR(500),--Description of the Job
	Administrative_Salary NUMERIC(16,3) NOT NULL,--Salary of the Employee
	Date_Admission DATE NOT NULL,--date you started working at the institution
	People_ID INT NOT NULL,--ID for Identify it in the person table
	FOREIGN KEY (People_ID) REFERENCES People.TB_People(People_ID),
	Erased BIT DEFAULT 0 NOT NULL  --bit type value that allows you to know if the record 
	--is active or deleted,by default the value will be 1
)

CREATE TABLE Modality.TB_Modality
(
    Modality_ID INT PRIMARY KEY IDENTITY NOT NULL, -- Unique identifier for the modality
    Modality_Name VARCHAR(50) UNIQUE NOT NULL, -- Name of the modality
    Erased BIT DEFAULT 0 NOT NULL  -- Bit field to indicate if the record is active (1) or deleted (0)
)

CREATE TABLE Classroom.TB_Classroom --CREATE TABLE CLASSROOM AND ITS ATRIBUTE
(
    Classroom_ID INT PRIMARY KEY IDENTITY NOT NULL,  -- Unique identifier for the Classroom
    Classroom_Name VARCHAR(100) NOT NULL,  -- Classroom name, this can simply be c
	--lassroom number n or it can be more complex, such as laboratory, etc.
    Building_ID INT NOT NULL, --Identifier of the building 
    Erased BIT DEFAULT 0 NOT NULL ,  -- Bit field to indicate if the record is active (1) or deleted (0)
    CONSTRAINT fk_building_class
	FOREIGN KEY (Building_ID) 
	REFERENCES Building.TB_Building (Building_ID) -- Foreign key to relate to building
)

CREATE TABLE Class_Schedule.TB_Class_Schedule --TABLE WHITH ITS ATTRIBUTES
(
	Schedule_ID INT PRIMARY KEY IDENTITY NOT NULL--Primary key from Class_Schedule
	,Start_Time TIME NOT NULL--Schedule start time
	,End_Time TIME NOT NULL--Schedule end time
	,[Day] VARCHAR(10) NOT NULL--Day of the week in which that schedule occurs.
	,Erased BIT DEFAULT 0 NOT NULL --column for logical deletion of a schedule.
)

CREATE TABLE Career.TB_Career
(
	Career_ID INT PRIMARY KEY IDENTITY NOT NULL,
	Career_Name VARCHAR(100) NOT NULL,
	Career_Acronym VARCHAR(10) NOT NULL,
	Career_Description VARCHAR(500) NOT NULL,
	Faculty_ID INT FOREIGN KEY REFERENCES Faculty.TB_Faculty(Faculty_ID) NOT NULL
)

ALTER TABLE Career.TB_Career
ADD Erased BIT DEFAULT 0 NOT NULL ;

CREATE TABLE Subject.TB_Subject
(
	Subject_ID INT PRIMARY KEY IDENTITY NOT NULL,--Unique code of subject
	Subject_Name VARCHAR(50) NOT NULL,--Course name
	Subject_Acronym VARCHAR(10) NOT NULL,--Acronym that refers to 
	--the course code which is unique and alphanumeric
	Subject_Credits INT DEFAULT 0 NOT NULL,--Course credit value defaults to 0
	Subject_Description VARCHAR(500),--Course Overview
	School_ID INT NOT NULL, 
	CONSTRAINT fk_Subject_School
	FOREIGN KEY (School_ID)
	REFERENCES School.TB_School (School_ID),--Foreign key to assign 
	--a course a relationship with the school to which it belongs
	Erased BIT DEFAULT 0 NOT NULL  --bit type value that allows you to know if the record 
	--is active or deleted,by default the value will be 1
)

CREATE TABLE Subject.TB_Requisite
(
	Associated_Subject INT NOT NULL,
	CONSTRAINT fk_Requisite_SubjectA
	FOREIGN KEY (Associated_Subject)
	REFERENCES Subject.TB_Subject(Subject_ID),--This foreign key that refers 
	--to the course that needs the requirement
	Required_Subject INT NOT NULL,
	CONSTRAINT fk_Requisite_SubjectR
	FOREIGN KEY (Required_Subject)
	REFERENCES Subject.TB_Subject(Subject_ID),--This foreign key that refers 
	--to the course that is the requirement as such
	PRIMARY KEY (Associated_Subject, Required_Subject),
	Erased BIT DEFAULT 0 NOT NULL  --bit type value that allows you to know if the record 
	--is active or deleted,by default the value will be 1
)

CREATE TABLE Career.TB_Career_Subject
(
	Career_ID INT FOREIGN KEY REFERENCES Career.TB_Career(Career_ID) NOT NULL,
	Subject_ID INT FOREIGN KEY REFERENCES Subject.TB_Subject(Subject_ID) NOT NULL,
	Semester INT NOT NULL,
	-- Ensure that CG_SEMESTER is a positive integer value
    CONSTRAINT CHECK_SEMESTER CHECK (Semester > 0),
	PRIMARY KEY (Career_ID, Subject_ID)
)
ALTER TABLE Career.TB_Career_Subject
ADD Erased BIT DEFAULT 0 NOT NULL ;


CREATE TABLE [Group].TB_Group
(
	Group_ID INT PRIMARY KEY IDENTITY NOT NULL,
	Group_Number INT NOT NULL,
	Students_Enrolled INT DEFAULT 0 NOT NULL,
	Subject_ID INT FOREIGN KEY REFERENCES Subject.TB_Subject(Subject_ID) NOT NULL,
	Modality_ID INT FOREIGN KEY REFERENCES Modality.TB_Modality(Modality_ID) NOT NULL
)
ALTER TABLE [Group].TB_Group
ADD Erased BIT DEFAULT 0 NOT NULL ;

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
)

CREATE TABLE Class_Schedule.TB_Group_Class_Schedule --TABLE WITH ITS ATTRIBUTES
(
	Group_ID INT NOT NULL
	,FOREIGN KEY(Group_ID) REFERENCES [Group].TB_Group(Group_ID)
	,Schedule_ID INT NOT NULL
	,PRIMARY KEY (Group_ID, Schedule_ID)
	,FOREIGN KEY(Schedule_ID) REFERENCES Class_Schedule.TB_Class_Schedule(Schedule_ID)
	,Erased BIT DEFAULT 0 NOT NULL 
)

CREATE TABLE People.TB_Career_Student--intermediate table to relate a career to a student
(
	Career_ID INT NOT NULL,--foreign key to relate to a career
	FOREIGN KEY (Career_ID) REFERENCES Career.TB_Career(Career_ID),
	Student_ID VARCHAR(10) NOT NULL,--foreign key to relate a student
	FOREIGN KEY (Student_ID) REFERENCES People.TB_Student(Student_ID),
	PRIMARY KEY (Career_ID, Student_ID),
	Erased BIT DEFAULT 0 NOT NULL  --bit type value that allows you to know if the record 
	--is active or deleted,by default the value will be 1
)

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
	 Erased BIT DEFAULT 0 NOT NULL  --bit type value that allows you to know if the record 
	--is active or deleted,by default the value will be 1
)

CREATE TABLE People.TB_StudentRecord
(
	Student_ID VARCHAR(10) NOT NULL,
	CONSTRAINT fk_Record_Student
	FOREIGN KEY (Student_ID)
	REFERENCES People.TB_Student(Student_ID), 
	--the identifier of the student to whom the unique being belongs.
	Record_Year INT NOT NULL,--Refers to the year in which the 
	--course was taken.
	Record_Semester INT CHECK(Record_Semester < 3 AND Record_Semester > 0)NOT NULL,--Refers to the semester in which 
	--the course was taken.
	Record_Average FLOAT,--It refers to the final grade 
	--in which the course was taken.
	Record_Status VARCHAR(50) DEFAULT 'Registered',--Refers to the status of 
	--the course, enrolled, approved or failed.
	Group_ID INT NOT NULL,
	CONSTRAINT fk_Record_Group
	FOREIGN KEY (Group_ID)
	REFERENCES [Group].TB_Group(Group_ID),
	PRIMARY KEY(Student_ID, Group_ID),--The primary key of the record is
	--foreign key that represents the identifier of the course group that was taken
	Erased BIT DEFAULT 0 NOT NULL--bit type value that allows you to know if the record 
	--is active or deleted, by default the value will be 1
)