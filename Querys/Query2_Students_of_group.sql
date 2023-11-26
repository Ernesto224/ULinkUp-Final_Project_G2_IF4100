DECLARE @Group_ID INT = 2;


SELECT Student.Student_ID, 
		People.People_Name, 
		People.People_Last_Name,
		People.People_Phone,
		People.People_Email,
		People.People_Address,
		CASE
			WHEN  THEN 'Yes'
			ELSE 'Not'
		END AS Repeated_Course
FROM People.TB_People AS People 
	INNER JOIN People.TB_Student AS Student
		ON People.People_ID = Student.People_ID
		INNER JOIN People.TB_StudentRecord AS Student_Rec
			ON Student.Student_ID = Student_Rec.Student_ID
				WHERE Student_Rec.Group_ID = @Group_ID