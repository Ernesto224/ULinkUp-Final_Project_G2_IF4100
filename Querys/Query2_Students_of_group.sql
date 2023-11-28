DECLARE @Group_ID INT = 2;

SELECT Group_Data.*
FROM (SELECT Student.Student_ID, 
			Student_Info.People_Name, 
			Student_Info.People_Last_Name,
			Student_Info.People_Phone,
			Student_Info.People_Email,
			Student_Info.People_Address,

			((SELECT SUM(ISNULL(Record_Average,0)) 
				FROM People.TB_StudentRecord 
					WHERE Student_ID = Student_Rec.Student_ID) 
			/ (SELECT SUM(ISNULL(Subj.Subject_Credits,0)) 
				FROM People.TB_StudentRecord AS Rec 
				INNER JOIN [Group].TB_Group AS Gro 
					ON Rec.Group_ID = Gro.Group_ID 
					INNER JOIN Subject.TB_Subject AS Subj 
						ON Gro.Subject_ID = Subj.Subject_ID 
							WHERE Rec.Student_ID = Student_Rec.Student_ID)) AS Weighted_Average,

			CASE
				WHEN  0 < (SELECT
								COUNT(Rec.Student_ID)
							FROM People.TB_StudentRecord AS Rec 
										INNER JOIN [Group].TB_Group AS Gro 
											ON Rec.Group_ID = Gro.Group_ID 
											INNER JOIN Subject.TB_Subject AS Subj 
												ON Gro.Subject_ID = Subj.Subject_ID
													WHERE Rec.Student_ID = Student_Rec.Student_ID
													AND Rec.Record_Status LIKE '%Reprobate%' 
													AND Subj.Subject_ID LIKE (SELECT Sub.Subject_ID
																				FROM [Group].TB_Group AS Grou
																					INNER JOIN  Subject.TB_Subject AS Sub
																						ON Grou.Subject_ID = Sub.Subject_ID
																							WHERE Grou.Group_ID = @Group_ID) )
				THEN 'Yes'
			ELSE 'Not'
			END AS Repeated_Course
			
	FROM People.TB_People AS Student_Info 
		INNER JOIN People.TB_Student AS Student
			ON Student_Info.People_ID = Student.People_ID
			INNER JOIN People.TB_StudentRecord AS Student_Rec
				ON Student.Student_ID = Student_Rec.Student_ID
				WHERE Student_Rec.Group_ID = @Group_ID AND Student_Rec.Erased = 0) AS Group_Data