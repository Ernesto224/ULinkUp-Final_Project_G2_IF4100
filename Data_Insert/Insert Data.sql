-----University
insert into [University].[TB_University] (University_Name) values ('Institute of Science and Technology');
insert into [University].[TB_University] (University_Name) values ('Kaunas University of Technology');
insert into [University].[TB_University] (University_Name) values ('College of Education Oju');
insert into [University].[TB_University] (University_Name) values ('University of New Hampshire');
insert into [University].[TB_University] (University_Name) values ('Universidad de San Miguel');
insert into [University].[TB_University] (University_Name) values ('Albany College of Pharmacy');
insert into [University].[TB_University] (University_Name) values ('Marquette University');
insert into [University].[TB_University] (University_Name) values ('University of Fiji');
insert into [University].[TB_University] (University_Name) values ('University of Tennessee - Chattanooga');
insert into [University].[TB_University] (University_Name) values ('Harbin University');

-------Campus
insert into [Campus].[TB_Campus] (Campus_Name, University_ID) values ('Sunset Campus', 9);
insert into [Campus].[TB_Campus] (Campus_Name, University_ID) values ('Central Campus', 5);
insert into [Campus].[TB_Campus] (Campus_Name, University_ID) values ('Lakeview Campus', 9);
insert into [Campus].[TB_Campus] (Campus_Name, University_ID) values ('Willow Creek Campus', 6);
insert into [Campus].[TB_Campus] (Campus_Name, University_ID) values ('Meadowbrook Campus', 1);
insert into [Campus].[TB_Campus] (Campus_Name, University_ID) values ('Willow Creek Campus', 7);
insert into [Campus].[TB_Campus] (Campus_Name, University_ID) values ('South Campus', 4);
insert into [Campus].[TB_Campus] (Campus_Name, University_ID) values ('Briarwood Campus', 1);
insert into [Campus].[TB_Campus] (Campus_Name, University_ID) values ('Briarwood Campus', 5);
insert into [Campus].[TB_Campus] (Campus_Name, University_ID) values ('Maplewood Campus', 9);
insert into [Campus].[TB_Campus] (Campus_Name, University_ID) values ('South Campus', 3);
insert into [Campus].[TB_Campus] (Campus_Name, University_ID) values ('Highland Campus', 4);
insert into [Campus].[TB_Campus] (Campus_Name, University_ID) values ('Cedar Ridge Campus', 4);
insert into [Campus].[TB_Campus] (Campus_Name, University_ID) values ('Sunset Campus', 8);
insert into [Campus].[TB_Campus] (Campus_Name, University_ID) values ('Central Campus', 6);
insert into [Campus].[TB_Campus] (Campus_Name, University_ID) values ('South Campus', 1);
insert into [Campus].[TB_Campus] (Campus_Name, University_ID) values ('East Campus', 1);
insert into [Campus].[TB_Campus] (Campus_Name, University_ID) values ('Briarwood Campus', 2);
insert into [Campus].[TB_Campus] (Campus_Name, University_ID) values ('Sycamore Campus', 5);
insert into [Campus].[TB_Campus] (Campus_Name, University_ID) values ('Riverside Campus', 5);

--------Enclosure
insert into [Enclosure].[TB_Enclosure] (Enclosure_Name, Campus_ID) values ('Oakwood Enclosure', 6);
insert into [Enclosure].[TB_Enclosure] (Enclosure_Name, Campus_ID) values ('Maple Grove Enclosure', 3);
insert into [Enclosure].[TB_Enclosure] (Enclosure_Name, Campus_ID) values ('Cedar Ridge Enclosure', 1);
insert into [Enclosure].[TB_Enclosure] (Enclosure_Name, Campus_ID) values ('Willow Creek Enclosure', 1);
insert into [Enclosure].[TB_Enclosure] (Enclosure_Name, Campus_ID) values ('Pinehurst Enclosure', 7);
insert into [Enclosure].[TB_Enclosure] (Enclosure_Name, Campus_ID) values ('Birchwood Enclosure', 7);
insert into [Enclosure].[TB_Enclosure] (Enclosure_Name, Campus_ID) values ('Sycamore Heights Enclosure', 2);
insert into [Enclosure].[TB_Enclosure] (Enclosure_Name, Campus_ID) values ('Aspen Valley Enclosure', 8);
insert into [Enclosure].[TB_Enclosure] (Enclosure_Name, Campus_ID) values ('Hickory Hollow Enclosure', 9);
insert into [Enclosure].[TB_Enclosure] (Enclosure_Name, Campus_ID) values ('Juniper Ridge Enclosure', 9);
insert into [Enclosure].[TB_Enclosure] (Enclosure_Name, Campus_ID) values ('Magnolia Gardens Enclosure', 4);
insert into [Enclosure].[TB_Enclosure] (Enclosure_Name, Campus_ID) values ('Cypress Point Enclosure', 5);
insert into [Enclosure].[TB_Enclosure] (Enclosure_Name, Campus_ID) values ('Spruce Meadows Enclosure', 10);
insert into [Enclosure].[TB_Enclosure] (Enclosure_Name, Campus_ID) values ('Elmwood Estates Enclosure', 1);
insert into [Enclosure].[TB_Enclosure] (Enclosure_Name, Campus_ID) values ('Redwood Ridge Enclosure', 2);
insert into [Enclosure].[TB_Enclosure] (Enclosure_Name, Campus_ID) values ('Oakwood Enclosure', 6);
insert into [Enclosure].[TB_Enclosure] (Enclosure_Name, Campus_ID) values ('Maple Grove Enclosure', 10);
insert into [Enclosure].[TB_Enclosure] (Enclosure_Name, Campus_ID) values ('Cedar Ridge Enclosure', 4);
insert into [Enclosure].[TB_Enclosure] (Enclosure_Name, Campus_ID) values ('Willow Creek Enclosure', 4);
insert into [Enclosure].[TB_Enclosure] (Enclosure_Name, Campus_ID) values ('Pinehurst Enclosure', 2);

--------Faculty
insert into [Faculty].[TB_Faculty] (Faculty_Name, Faculty_Description) values ('Engineering', 'A faculty consists of professors and instructors who teach various subjects to students.');
insert into [Faculty].[TB_Faculty] (Faculty_Name, Faculty_Description) values ('Business', 'A faculty consists of experts in their respective fields who impart knowledge and guidance to students.');
insert into [Faculty].[TB_Faculty] (Faculty_Name, Faculty_Description) values ('Medicine', 'A faculty consists of dedicated educators who are passionate about teaching and mentoring students.');
insert into [Faculty].[TB_Faculty] (Faculty_Name, Faculty_Description) values ('Law', 'A faculty consists of experienced professionals who bring real-world expertise to the classroom.');
insert into [Faculty].[TB_Faculty] (Faculty_Name, Faculty_Description) values ('Arts', 'A faculty consists of individuals with advanced degrees who are committed to academic excellence.');
insert into [Faculty].[TB_Faculty] (Faculty_Name, Faculty_Description) values ('Science', 'A faculty consists of researchers and scholars who contribute to the advancement of knowledge.');
insert into [Faculty].[TB_Faculty] (Faculty_Name, Faculty_Description) values ('Education', 'A faculty consists of diverse individuals with different backgrounds and areas of expertise.');
insert into [Faculty].[TB_Faculty] (Faculty_Name, Faculty_Description) values ('Social Sciences', 'A faculty consists of faculty members who collaborate to create a dynamic learning environment.');
insert into [Faculty].[TB_Faculty] (Faculty_Name, Faculty_Description) values ('Information Technology', 'A faculty consists of supportive mentors who guide students in their academic and career journeys.');
insert into [Faculty].[TB_Faculty] (Faculty_Name, Faculty_Description) values ('Humanities', 'A faculty consists of individuals who foster a culture of intellectual curiosity and critical thinking.');

---------School
insert into [School].[TB_School] (School_Name, School_abbrev, School_Description, Faculty_ID) values ('School of Engineering', 'ENG', 'The academic school consists of various departments offering undergraduate and graduate programs.', 1);
insert into [School].[TB_School] (School_Name, School_abbrev, School_Description, Faculty_ID) values ('School of Medicine', 'MED', 'It is a place where students engage in rigorous academic coursework and research.', 3);
insert into [School].[TB_School] (School_Name, School_abbrev, School_Description, Faculty_ID) values ('School of Business', 'BUS', 'The academic school provides a supportive learning environment for students to excel in their chosen fields.', 2);
insert into [School].[TB_School] (School_Name, School_abbrev, School_Description, Faculty_ID) values ('School of Arts', 'ART', 'It offers state-of-the-art facilities and resources for students.', 5);
insert into [School].[TB_School] (School_Name, School_abbrev, School_Description, Faculty_ID) values ('School of Education', 'EDU', 'The academic school promotes interdisciplinary collaboration among faculty and students.', 7);
insert into [School].[TB_School] (School_Name, School_abbrev, School_Description, Faculty_ID) values ('School of Law', 'LAW', 'Students in the academic school have access to internships and experiential learning opportunities.', 4);
insert into [School].[TB_School] (School_Name, School_abbrev, School_Description, Faculty_ID) values ('School of Science', 'SCI', 'The school organizes seminars', 6);

---------Building
insert into [Building].[TB_Building] (Building_Name, Building_Location, Faculty, Enclosure_ID, Faculty_ID) values ('Central Plaza', '6539 Declaration Center', 1, 1, 1);
insert into [Building].[TB_Building] (Building_Name, Building_Location, Faculty, Enclosure_ID, Faculty_ID) values ('Sunset Towers', '66219 West Hill', 1, 2, 2);
insert into [Building].[TB_Building] (Building_Name, Building_Location, Faculty, Enclosure_ID, Faculty_ID) values ('Maple Heights', '708 Mitchell Court', 1, 4, 8);
insert into [Building].[TB_Building] (Building_Name, Building_Location, Faculty, Enclosure_ID, Faculty_ID) values ('Riverside Manor', '04 Stephen Junction', 1, 4, 5);
insert into [Building].[TB_Building] (Building_Name, Building_Location, Faculty, Enclosure_ID, Faculty_ID) values ('Oakwood Apartments', '7 Algoma Terrace', 1, 5, 3);
insert into [Building].[TB_Building] (Building_Name, Building_Location, Faculty, Enclosure_ID, Faculty_ID) values ('Golden Gate Residences', '408 Nancy Lane', 1, 5, 9);
insert into [Building].[TB_Building] (Building_Name, Building_Location, Faculty, Enclosure_ID, Faculty_ID) values ('Pineview Gardens', '8692 Beilfuss Circle', 1, 2, 9);
insert into [Building].[TB_Building] (Building_Name, Building_Location, Faculty, Enclosure_ID, Faculty_ID) values ('Harbor View Condos', '8 Melrose Avenue', 1, 2, 1);
insert into [Building].[TB_Building] (Building_Name, Building_Location, Faculty, Enclosure_ID, Faculty_ID) values ('Meadowbrook Villas', '51 Northland Drive', 1, 5, 3);
insert into [Building].[TB_Building] (Building_Name, Building_Location, Faculty, Enclosure_ID, Faculty_ID) values ('Hillside Estates', '57 Burning Wood Court', 1, 2, 5);


-----------People
insert into  People.TB_People (People_Name, People_Last_Name, People_Address, People_Phone, People_Email) values ('Stephenie', 'Goater', '538 Drewry Lane', '509-920-7622', 'sgoater0@vistaprint.com');
insert into  People.TB_People (People_Name, People_Last_Name, People_Address, People_Phone, People_Email) values ('Modesta', 'Upstell', '306 Melrose Plaza', '751-244-6874', 'mupstell1@4shared.com');
insert into  People.TB_People (People_Name, People_Last_Name, People_Address, People_Phone, People_Email) values ('Robinet', 'Pozzi', '34 Holmberg Point', '542-661-1224', 'rpozzi2@boston.com');
insert into  People.TB_People (People_Name, People_Last_Name, People_Address, People_Phone, People_Email) values ('Ava', 'Henkmann', '93 Summit Road', '106-519-9772', 'ahenkmann3@bbb.org');
insert into  People.TB_People (People_Name, People_Last_Name, People_Address, People_Phone, People_Email) values ('Morris', 'Sonnenschein', '581 Hagan Way', '325-373-6815', 'msonnenschein4@fotki.com');
insert into  People.TB_People (People_Name, People_Last_Name, People_Address, People_Phone, People_Email) values ('Deina', 'Cleaton', '3773 Moland Plaza', '774-785-4072', 'dcleaton5@chicagotribune.com');
insert into  People.TB_People (People_Name, People_Last_Name, People_Address, People_Phone, People_Email) values ('Floris', 'McComish', '74605 Manley Road', '448-800-6542', 'fmccomish6@alexa.com');
insert into  People.TB_People (People_Name, People_Last_Name, People_Address, People_Phone, People_Email) values ('Kipper', 'Pass', '577 Hoepker Junction', '305-189-3795', 'kpass7@mail.ru');
insert into  People.TB_People (People_Name, People_Last_Name, People_Address, People_Phone, People_Email) values ('Carolyne', 'Lambrook', '3 Loeprich Crossing', '894-185-9315', 'clambrook8@flickr.com');
insert into  People.TB_People (People_Name, People_Last_Name, People_Address, People_Phone, People_Email) values ('Deeyn', 'Backshall', '33500 Quincy Drive', '850-268-9292', 'dbackshall9@flickr.com');
insert into  People.TB_People (People_Name, People_Last_Name, People_Address, People_Phone, People_Email) values ('Emilio', 'Carren', '21268 Maple Wood Trail', '391-504-0641', 'ecarrena@mayoclinic.com');
insert into  People.TB_People (People_Name, People_Last_Name, People_Address, People_Phone, People_Email) values ('Karmen', 'Sands', '5982 Nobel Way', '734-377-5146', 'ksandsb@squarespace.com');
insert into  People.TB_People (People_Name, People_Last_Name, People_Address, People_Phone, People_Email) values ('Robina', 'Titchmarsh', '52864 Tennyson Park', '719-397-2079', 'rtitchmarshc@examiner.com');
insert into  People.TB_People (People_Name, People_Last_Name, People_Address, People_Phone, People_Email) values ('Vanya', 'Van der Daal', '4247 Anderson Pass', '925-350-4269', 'vvanderdaald@ihg.com');
insert into  People.TB_People (People_Name, People_Last_Name, People_Address, People_Phone, People_Email) values ('Dianna', 'Lifsey', '7265 Forest Dale Place', '987-734-5776', 'dlifseye@discuz.net');
insert into  People.TB_People (People_Name, People_Last_Name, People_Address, People_Phone, People_Email) values ('Burk', 'Masurel', '1 Carey Drive', '894-956-4894', 'bmasurelf@tripod.com');
insert into  People.TB_People (People_Name, People_Last_Name, People_Address, People_Phone, People_Email) values ('Valene', 'Bottomore', '339 Orin Trail', '477-729-6759', 'vbottomoreg@boston.com');
insert into  People.TB_People (People_Name, People_Last_Name, People_Address, People_Phone, People_Email) values ('Nike', 'Tiffany', '080 Luster Pass', '261-391-9810', 'ntiffanyh@hugedomains.com');
insert into  People.TB_People (People_Name, People_Last_Name, People_Address, People_Phone, People_Email) values ('Gwendolyn', 'Hollingshead', '00 Elmside Drive', '251-908-6213', 'ghollingsheadi@w3.org');
insert into  People.TB_People (People_Name, People_Last_Name, People_Address, People_Phone, People_Email) values ('Darrelle', 'de Castelain', '2 Orin Pass', '496-978-4534', 'ddecastelainj@discovery.com');
insert into  People.TB_People (People_Name, People_Last_Name, People_Address, People_Phone, People_Email) values ('Laverna', 'Gonoude', '01969 Rusk Terrace', '132-875-4820', 'lgonoudek@163.com');
insert into  People.TB_People (People_Name, People_Last_Name, People_Address, People_Phone, People_Email) values ('Analiese', 'Aynold', '4584 Harbort Plaza', '747-283-8278', 'aaynoldl@dyndns.org');
insert into  People.TB_People (People_Name, People_Last_Name, People_Address, People_Phone, People_Email) values ('Rory', 'Comusso', '1 Magdeline Plaza', '528-740-0702', 'rcomussom@cdbaby.com');
insert into  People.TB_People (People_Name, People_Last_Name, People_Address, People_Phone, People_Email) values ('Kelli', 'Pynn', '25 Linden Alley', '585-768-3657', 'kpynnn@salon.com');
insert into  People.TB_People (People_Name, People_Last_Name, People_Address, People_Phone, People_Email) values ('Hewitt', 'Bourley', '42450 Crest Line Pass', '555-302-0658', 'hbourleyo@geocities.com');
insert into  People.TB_People (People_Name, People_Last_Name, People_Address, People_Phone, People_Email) values ('Walden', 'Hanwell', '5 Victoria Court', '972-440-6493', 'whanwellp@addthis.com');
insert into  People.TB_People (People_Name, People_Last_Name, People_Address, People_Phone, People_Email) values ('Marcelia', 'Sidebottom', '391 Troy Park', '440-417-8630', 'msidebottomq@icq.com');
insert into  People.TB_People (People_Name, People_Last_Name, People_Address, People_Phone, People_Email) values ('Letti', 'Armes', '0854 Red Cloud Terrace', '892-814-5249', 'larmesr@is.gd');
insert into  People.TB_People (People_Name, People_Last_Name, People_Address, People_Phone, People_Email) values ('Trumann', 'Moff', '83712 Linden Crossing', '611-646-4226', 'tmoffs@mapquest.com');
insert into  People.TB_People (People_Name, People_Last_Name, People_Address, People_Phone, People_Email) values ('Lyle', 'Aviss', '47 6th Terrace', '273-564-2330', 'lavisst@smh.com.au');
insert into  People.TB_People (People_Name, People_Last_Name, People_Address, People_Phone, People_Email) values ('Nonnah', 'Powe', '81 Emmet Place', '841-761-4216', 'npoweu@ehow.com');
insert into  People.TB_People (People_Name, People_Last_Name, People_Address, People_Phone, People_Email) values ('Milka', 'Dassindale', '0 Porter Trail', '897-904-1321', 'mdassindalev@google.ru');
insert into  People.TB_People (People_Name, People_Last_Name, People_Address, People_Phone, People_Email) values ('Lorilyn', 'Cottu', '57 Spenser Court', '467-347-3545', 'lcottuw@msn.com');
insert into  People.TB_People (People_Name, People_Last_Name, People_Address, People_Phone, People_Email) values ('Gilberta', 'Chidler', '421 Cardinal Park', '131-647-3224', 'gchidlerx@wp.com');
insert into  People.TB_People (People_Name, People_Last_Name, People_Address, People_Phone, People_Email) values ('Ricky', 'Hallihan', '7575 Bayside Terrace', '983-249-1141', 'rhallihany@mediafire.com');
insert into  People.TB_People (People_Name, People_Last_Name, People_Address, People_Phone, People_Email) values ('Wylie', 'Clemett', '068 Barnett Alley', '288-202-6803', 'wclemettz@imdb.com');
insert into  People.TB_People (People_Name, People_Last_Name, People_Address, People_Phone, People_Email) values ('Giulietta', 'Semble', '34079 Coolidge Pass', '976-574-1245', 'gsemble10@sohu.com');
insert into  People.TB_People (People_Name, People_Last_Name, People_Address, People_Phone, People_Email) values ('Myrtle', 'Blaiklock', '7 Steensland Street', '620-409-4968', 'mblaiklock11@techcrunch.com');
insert into  People.TB_People (People_Name, People_Last_Name, People_Address, People_Phone, People_Email) values ('Wolf', 'Middlemist', '00 Kropf Drive', '578-139-1283', 'wmiddlemist12@bandcamp.com');
insert into  People.TB_People (People_Name, People_Last_Name, People_Address, People_Phone, People_Email) values ('Diarmid', 'Rosoman', '80620 Lillian Terrace', '919-550-6649', 'drosoman13@java.com');


-------Student
insert into People.TB_Student (Student_ID, Date_Admission, People_ID) values ('A00001', '2010-05-28', 1);
insert into People.TB_Student (Student_ID, Date_Admission, People_ID) values ('A00002', '2001-09-03', 2);
insert into People.TB_Student (Student_ID, Date_Admission, People_ID) values ('A00003', '2004-07-05', 3);
insert into People.TB_Student (Student_ID, Date_Admission, People_ID) values ('A00004', '2007-09-27', 4);
insert into People.TB_Student (Student_ID, Date_Admission, People_ID) values ('A00005', '2006-07-04', 5);
insert into People.TB_Student (Student_ID, Date_Admission, People_ID) values ('A00006', '2010-11-05', 6);
insert into People.TB_Student (Student_ID, Date_Admission, People_ID) values ('A00007', '2019-12-15', 7);
insert into People.TB_Student (Student_ID, Date_Admission, People_ID) values ('A00008', '2015-09-21', 8);
insert into People.TB_Student (Student_ID, Date_Admission, People_ID) values ('A00009', '2018-09-05', 9);
insert into People.TB_Student (Student_ID, Date_Admission, People_ID) values ('A00010', '2015-07-25', 10);
insert into People.TB_Student (Student_ID, Date_Admission, People_ID) values ('A00011', '2004-04-26', 11);
insert into People.TB_Student (Student_ID, Date_Admission, People_ID) values ('A00012', '2006-07-14', 12);
insert into People.TB_Student (Student_ID, Date_Admission, People_ID) values ('A00013', '2012-06-18', 13);
insert into People.TB_Student (Student_ID, Date_Admission, People_ID) values ('A00014', '2002-02-19', 14);
insert into People.TB_Student (Student_ID, Date_Admission, People_ID) values ('A00015', '2009-02-15', 15);
insert into People.TB_Student (Student_ID, Date_Admission, People_ID) values ('A00016', '2006-03-18', 16);
insert into People.TB_Student (Student_ID, Date_Admission, People_ID) values ('A00017', '2014-08-04', 17);
insert into People.TB_Student (Student_ID, Date_Admission, People_ID) values ('A00018', '2005-01-23', 18);
insert into People.TB_Student (Student_ID, Date_Admission, People_ID) values ('A00019', '2002-03-08', 19);
insert into People.TB_Student (Student_ID, Date_Admission, People_ID) values ('A00020', '2006-04-16', 20);
insert into People.TB_Student (Student_ID, Date_Admission, People_ID) values ('A00021', '2019-08-06', 21);
insert into People.TB_Student (Student_ID, Date_Admission, People_ID) values ('A00022', '2018-05-13', 22);
insert into People.TB_Student (Student_ID, Date_Admission, People_ID) values ('A00023', '2021-12-05', 23);
insert into People.TB_Student (Student_ID, Date_Admission, People_ID) values ('A00024', '2002-10-22', 24);
insert into People.TB_Student (Student_ID, Date_Admission, People_ID) values ('A00025', '2015-01-28', 25);
insert into People.TB_Student (Student_ID, Date_Admission, People_ID) values ('A00026', '2006-05-20', 26);
insert into People.TB_Student (Student_ID, Date_Admission, People_ID) values ('A00027', '2013-05-23', 27);
insert into People.TB_Student (Student_ID, Date_Admission, People_ID) values ('A00028', '2008-07-25', 28);
insert into People.TB_Student (Student_ID, Date_Admission, People_ID) values ('A00029', '2014-12-21', 29);
insert into People.TB_Student (Student_ID, Date_Admission, People_ID) values ('A00030', '2009-06-11', 30);

--------Employee
insert into People.TB_Employee (Job, Administrative_Salary, Date_Admission, People_ID, Job_Description) values ('teacher', 189543.84, '2010-11-07', 31, 'Mathematics teacher');
insert into People.TB_Employee (Job, Administrative_Salary, Date_Admission, People_ID, Job_Description) values ('teacher', 173188.70, '2022-01-29', 32, 'English teacher');
insert into People.TB_Employee (Job, Administrative_Salary, Date_Admission, People_ID, Job_Description) values ('teacher', 172131.39, '2023-02-25', 33, 'Science teacher');
insert into People.TB_Employee (Job, Administrative_Salary, Date_Admission, People_ID, Job_Description) values ('professor', 162588.13, '2020-03-20', 36, 'History teacher');
insert into People.TB_Employee (Job, Administrative_Salary, Date_Admission, People_ID, Job_Description) values ('professor', 193294.88, '2021-09-17', 35, 'Art teacher');
insert into People.TB_Employee (Job, Administrative_Salary, Date_Admission, People_ID, Job_Description) values ('professor', 161887.75, '2008-02-10', 37, 'Physical Education teacher');

insert into People.TB_Employee (Job, Administrative_Salary, Date_Admission, People_ID, Job_Description) values ('administrative assistant', 168714.37, '2002-07-25', 40, 'Research Assistant in Biology');
insert into People.TB_Employee (Job, Administrative_Salary, Date_Admission, People_ID, Job_Description) values ('librarian', 181184.72, '2007-07-15', 39, 'Administrative Assistant in the Registrar''s Office');
insert into People.TB_Employee (Job, Administrative_Salary, Date_Admission, People_ID, Job_Description) values ('janitor', 164055.55, '2003-06-26', 38, 'Janitorial Staff in the Facilities Department');


--------Modality
INSERT INTO Modality.TB_Modality (Modality_Name)
VALUES ('Presencial'), ('Virtual'), ('Híbrida');

--------Subject
insert into [Subject].TB_Subject (Subject_Name, Subject_acronym, Subject_Credits, Subject_Description, School_ID) values ('Introduction to Engineering', 'MATH101', 4, 'The course consists of lectures', 1);
insert into [Subject].TB_Subject (Subject_Name, Subject_acronym, Subject_Credits, Subject_Description, School_ID) values ('Mechanical Engineering', 'ENG201', 5, 'assignments', 1);
insert into [Subject].TB_Subject (Subject_Name, Subject_acronym, Subject_Credits, Subject_Description, School_ID) values ('Electrical Engineering', 'HIST301', 1, 'and practical exercises.', 1);
insert into [Subject].TB_Subject (Subject_Name, Subject_acronym, Subject_Credits, Subject_Description, School_ID) values ('Civil Engineering', 'SCI401', 1, 'The course includes hands-on projects and group discussions.', 1);
insert into [Subject].TB_Subject (Subject_Name, Subject_acronym, Subject_Credits, Subject_Description, School_ID) values ('Computer Science', 'ART501', 3, 'Students will learn through case studies and real-world examples.', 1);
insert into [Subject].TB_Subject (Subject_Name, Subject_acronym, Subject_Credits, Subject_Description, School_ID) values ('Chemical Engineering', 'PHYS601', 6, 'The course focuses on theoretical concepts and their practical applications.', 1);
insert into [Subject].TB_Subject (Subject_Name, Subject_acronym, Subject_Credits, Subject_Description, School_ID) values ('Biomedical Engineering', 'CHEM701', 2, 'Participants will engage in interactive workshops and simulations.', 1);
insert into [Subject].TB_Subject (Subject_Name, Subject_acronym, Subject_Credits, Subject_Description, School_ID) values ('Environmental Engineering', 'PSYC801', 4, 'The curriculum covers both theoretical knowledge and practical skills.', 1);
insert into [Subject].TB_Subject (Subject_Name, Subject_acronym, Subject_Credits, Subject_Description, School_ID) values ('Materials Science', 'SOC901', 1, 'Students will have access to online resources and learning materials.', 1);
insert into [Subject].TB_Subject (Subject_Name, Subject_acronym, Subject_Credits, Subject_Description, School_ID) values ('Robotics and Automation', 'BIOL1001', 5, 'The course offers a combination of self-paced learning and live sessions.', 1);

--------Requisite
INSERT INTO Subject.TB_Requisite (Associated_Subject, Required_Subject)
VALUES (1, 3), (2, 4), (3, 5), (4, 1), (5, 2);

--------Class_Schedule
insert into Class_Schedule.TB_Class_Schedule (Start_Time, End_Time, [Day]) values ('16:30:00', '03:00:00', 'Friday');
insert into Class_Schedule.TB_Class_Schedule (Start_Time, End_Time, [Day]) values ('11:15:00', '11:00:00', 'Saturday');
insert into Class_Schedule.TB_Class_Schedule (Start_Time, End_Time, [Day]) values ('11:15:00', '03:00:00', 'Tuesday');
insert into Class_Schedule.TB_Class_Schedule (Start_Time, End_Time, [Day]) values ('07:30:00', '19:00:00', 'Friday');
insert into Class_Schedule.TB_Class_Schedule (Start_Time, End_Time, [Day]) values ('07:15:00', '03:00:00', 'Thursday');
insert into Class_Schedule.TB_Class_Schedule (Start_Time, End_Time, [Day]) values ('09:45:00', '11:00:00', 'Monday');
insert into Class_Schedule.TB_Class_Schedule (Start_Time, End_Time, [Day]) values ('10:00:00', '11:00:00', 'Tuesday');
insert into Class_Schedule.TB_Class_Schedule (Start_Time, End_Time, [Day]) values ('07:15:00', '07:00:00', 'Tuesday');
insert into Class_Schedule.TB_Class_Schedule (Start_Time, End_Time, [Day]) values ('09:45:00', '15:00:00', 'Friday');
insert into Class_Schedule.TB_Class_Schedule (Start_Time, End_Time, [Day]) values ('08:30:00', '11:00:00', 'Saturday');
insert into Class_Schedule.TB_Class_Schedule (Start_Time, End_Time, [Day]) values ('07:30:00', '19:00:00', 'Thursday');
insert into Class_Schedule.TB_Class_Schedule (Start_Time, End_Time, [Day]) values ('16:30:00', '11:00:00', 'Wednesday');
insert into Class_Schedule.TB_Class_Schedule (Start_Time, End_Time, [Day]) values ('15:15:00', '19:00:00', 'Sunday');
insert into Class_Schedule.TB_Class_Schedule (Start_Time, End_Time, [Day]) values ('13:45:00', '19:00:00', 'Sunday');
insert into Class_Schedule.TB_Class_Schedule (Start_Time, End_Time, [Day]) values ('10:00:00', '23:00:00', 'Saturday');


---------Career
insert into Career.TB_Career (Career_Name, Career_acronym, Career_Description, Faculty_ID) values ('Mechanical Engineer', 'HRM', 'Experienced professional with a strong background in the field', 1);
insert into Career.TB_Career (Career_Name, Career_acronym, Career_Description, Faculty_ID) values ('Civil Engineer', 'ITC', 'Passionate about making a positive impact through my work', 1);
insert into Career.TB_Career (Career_Name, Career_acronym, Career_Description, Faculty_ID) values ('Electrical Engineer', 'MKT', 'Detail-oriented and highly organized', 1);
insert into Career.TB_Career (Career_Name, Career_acronym, Career_Description, Faculty_ID) values ('Software Engineer', 'FIN', 'Excellent communication and interpersonal skills', 1);
insert into Career.TB_Career (Career_Name, Career_acronym, Career_Description, Faculty_ID) values ('Chemical Engineer', 'ENG', 'Proven track record of exceeding targets and goals', 1);
insert into Career.TB_Career (Career_Name, Career_acronym, Career_Description, Faculty_ID) values ('Aerospace Engineer', 'ADM', 'Adaptable and quick to learn new technologies', 1);
insert into Career.TB_Career (Career_Name, Career_acronym, Career_Description, Faculty_ID) values ('Environmental Engineer', 'OPS', 'Strong problem-solving and analytical abilities', 1);
insert into Career.TB_Career (Career_Name, Career_acronym, Career_Description, Faculty_ID) values ('Biomedical Engineer', 'PRD', 'Team player with a collaborative mindset', 1);
insert into Career.TB_Career (Career_Name, Career_acronym, Career_Description, Faculty_ID) values ('Industrial Engineer', 'RND', 'Creative thinker with a knack for innovation', 1);
insert into Career.TB_Career (Career_Name, Career_acronym, Career_Description, Faculty_ID) values ('Petroleum Engineer', 'SAF', 'Highly motivated and self-driven individual', 1);


----------Classroom
insert into  [Classroom].[TB_Classroom] (Classroom_Name, Building_ID) values ('Classroom A', 1);
insert into  [Classroom].[TB_Classroom] (Classroom_Name, Building_ID) values ('Classroom B', 2);
insert into  [Classroom].[TB_Classroom] (Classroom_Name, Building_ID) values ('Classroom C', 5);
insert into  [Classroom].[TB_Classroom] (Classroom_Name, Building_ID) values ('Classroom D', 9);
insert into  [Classroom].[TB_Classroom] (Classroom_Name, Building_ID) values ('Classroom E', 1);
insert into  [Classroom].[TB_Classroom] (Classroom_Name, Building_ID) values ('Classroom F', 2);
insert into  [Classroom].[TB_Classroom] (Classroom_Name, Building_ID) values ('Classroom G', 5);
insert into  [Classroom].[TB_Classroom] (Classroom_Name, Building_ID) values ('Classroom H', 9);
insert into  [Classroom].[TB_Classroom] (Classroom_Name, Building_ID) values ('Classroom I', 1);
insert into  [Classroom].[TB_Classroom] (Classroom_Name, Building_ID) values ('Classroom J', 2);


-----------Career_Student
INSERT INTO People.TB_Career_Student (Career_ID, Student_ID)
VALUES
  (1, 'A00001'), (1, 'A00002'), (1, 'A00003'),
  (2, 'A00004'), (2, 'A00005'), (2, 'A00006'),
  (3, 'A00007'), (3, 'A00008'), (3, 'A00009'),
  (4, 'A00010'), (4, 'A00011'), (4, 'A00012'),
  (5, 'A00013'), (5, 'A00014'), (5, 'A00015'),
  (6, 'A00016'), (6, 'A00017'), (6, 'A00018'),
  (7, 'A00019'), (7, 'A00020'), (7, 'A00021'),
  (8, 'A00022'), (8, 'A00023'), (8, 'A00024'),
  (9, 'A00025'), (9, 'A00026'), (9, 'A00027'),
  (10, 'A00028'), (10, 'A00029'), (10, 'A00030')

------------Group
INSERT INTO [Group].TB_Group (Group_Number, Subject_ID, Modality_ID)
VALUES (1, 1, 2),
       (2, 1, 2),
       (1, 2, 2),
       (2, 2, 2),
       (1, 3, 2);

-----------Group_Class_Schedule
INSERT INTO Class_Schedule.TB_Group_Class_Schedule (Group_ID, Schedule_ID)
VALUES (1, 1), (2, 1), (3, 1), (4, 1), (5, 1), (1, 2), (2, 2), (3, 2), (4, 2), (5, 2);

-----------Group_Teacher
INSERT INTO People.TB_Group_Teacher (Group_ID, Teacher_ID)
VALUES (1, 1), (2, 2), (3, 3), (4, 4), (5, 5);

------------TB_Classroom_Group
INSERT INTO [Classroom].[TB_Classroom_Group]
           ([Classroom_ID]
           ,[Group_ID]
           ,[CG_Year]
           ,[CG_Semester])
     VALUES
		   (2, 2, 2023, 1),
		   (3, 3, 2023, 2),
		   (4, 4, 2023, 2),
		   (5, 5, 2024, 1),
		   (1, 1, 2024, 1)

------------People.TB_StudentRecord
INSERT INTO People.TB_StudentRecord
    (
        Student_ID,
        Record_Year,
        Record_Semester,
        Record_Average,
        Record_Status,
        Group_ID,
        Erased
    )
    VALUES
    (
        'A00005',
        2023,
        1,
        80,
        'Registered',
        5,
        0
    );

	INSERT INTO People.TB_StudentRecord
    (
        Student_ID,
        Record_Year,
        Record_Semester,
        Record_Average,
        Record_Status,
        Group_ID,
        Erased
    )
    VALUES
    (
        'A00006',
        2023,
        1,
        80,
        'Registered',
        2,
        0
    );


-------Career_Subject
DECLARE @Career_ID INT;
DECLARE @Subject_ID INT;
DECLARE @Semester INT;
SET @Career_ID = 3;
SET @Semester = 1;

INSERT INTO Career.TB_Career_Subject (Career_ID, Subject_ID, Semester)
VALUES (@Career_ID, 10, @Semester);

INSERT INTO Career.TB_Career_Subject (Career_ID, Subject_ID, Semester)
VALUES (@Career_ID, 1, @Semester);

INSERT INTO Career.TB_Career_Subject (Career_ID, Subject_ID, Semester)
VALUES (@Career_ID, 3, @Semester);

SET @Semester = 2;

INSERT INTO Career.TB_Career_Subject (Career_ID, Subject_ID, Semester)
VALUES (@Career_ID, 5, @Semester);
