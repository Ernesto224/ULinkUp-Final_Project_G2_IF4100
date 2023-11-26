-- =============================================
-- Author:		Ernesto Vega
-- Create date: 11/16/2023
-- Description:	stored procedure to enroll a Student in a course [Group] and add this to the academic record
-- =============================================
CREATE OR ALTER PROCEDURE People.SP_Student_Enrollment 
	-- Add the parameters for the stored procedure here
	@Group_ID INT,
	@Student_ID VARCHAR(10) 
AS
BEGIN
	BEGIN TRY
		BEGIN
			--max admit Students
			DECLARE @Max_Enrollment INT = 30,
					@Subject_ID INT,
					@Carrer_ID INT;
	
			IF EXISTS (SELECT TOP 1 1 FROM [Group].[TB_Group] WHERE Group_ID = @Group_ID AND Erased = 0) 
				AND EXISTS (SELECT TOP 1 1 FROM [People].[TB_Student] WHERE Student_ID = @Student_ID AND Erased = 0)
			BEGIN

				SET @Subject_ID = (SELECT Subject_ID FROM [Group].[TB_Group] WHERE Group_ID = @Group_ID AND Erased = 0);
				SET @Carrer_ID = (SELECT Career_ID FROM [Career].[TB_Career_Subject] WHERE Subject_ID = @Subject_ID AND Erased = 0);
			
				IF EXISTS(SELECT TOP 1 1 FROM [People].[TB_Career_Student] WHERE Student_ID = @Student_ID AND Career_ID = @Carrer_ID AND Erased = 0) 
				BEGIN

					IF (SELECT [Students_Enrolled] FROM [Group].[TB_Group] WHERE Group_ID = @Group_ID AND Erased = 0) < @Max_Enrollment
					BEGIN

						DECLARE @Exists_Requirement INT,
								@Requirements_met INT;

						SELECT 
							@Exists_Requirement = COUNT(ISNULL(Requerit_Subjects.Required_Subject, '')), --Requerit_Subjects
							@Requirements_met = COUNT (ISNULL(Aprove_Subjects_Of_Student.Subject_ID, '')) --aprove_subjects
						FROM [Subject].TB_Subject AS [Subject] 
						LEFT JOIN [Subject].TB_Requisite AS Requerit_Subjects 
							ON [Subject].Subject_ID = Requerit_Subjects.Associated_Subject
							LEFT JOIN (SELECT 
											[Subject].Subject_ID
										FROM [People].[TB_Student] AS Student
										JOIN [People].[TB_StudentRecord] AS Student_REC
											ON Student.Student_ID = Student_REC.Student_ID
											JOIN [Group].[TB_Group] AS [Group]
												ON Student_REC.Group_ID = [Group].Group_ID
												JOIN [Subject].[TB_Subject] AS [Subject]
													ON [Group].Subject_ID = [Subject].Subject_ID
										WHERE Student_REC.Student_ID = @Student_ID AND Student_REC.Erased = 0) AS Aprove_Subjects_Of_Student
								ON Requerit_Subjects.Required_Subject = Aprove_Subjects_Of_Student.Subject_ID
						WHERE [Subject].Subject_ID = @Subject_ID AND [Subject].Erased = 0

						IF @Exists_Requirement > 0
						BEGIN 
							
							IF @Exists_Requirement = @Requirements_met
							BEGIN

								IF EXISTS(SELECT TOP 1 1 
												FROM [People].[TB_StudentRecord] 
												WHERE Student_ID = @Student_ID 
												AND Group_ID = @Group_ID 
												AND LOWER(Record_Status) LIKE 'reprobate'
												AND Erased = 0)
								BEGIN
									INSERT INTO [People].[TB_StudentRecord]
											([Student_ID]
											,[Record_Year]
											,[Record_Semester]
											,[Group_ID])
										VALUES
											(@Student_ID
											,YEAR(GETDATE())
											,(SELECT CG_Semester FROM Classroom.TB_Classroom_Group WHERE Group_ID = @Group_ID)
											,@Group_ID)

									UPDATE [Group].[TB_Group]
										SET [Students_Enrolled] = ([Students_Enrolled] + 1)
										WHERE Group_ID = @Group_ID;
								END
								ELSE IF NOT EXISTS(SELECT TOP 1 1 
												FROM [People].[TB_StudentRecord] 
												WHERE Student_ID = @Student_ID 
												AND Group_ID = @Group_ID
												AND Erased = 0)
								BEGIN
									INSERT INTO [People].[TB_StudentRecord]
											([Student_ID]
											,[Record_Year]
											,[Record_Semester]
											,[Group_ID])
										VALUES
											(@Student_ID
											,YEAR(GETDATE())
											,(SELECT CG_Semester FROM Classroom.TB_Classroom_Group WHERE Group_ID = @Group_ID)
											,@Group_ID)

									UPDATE [Group].[TB_Group]
										SET [Students_Enrolled] = ([Students_Enrolled] + 1)
										WHERE Group_ID = @Group_ID;
								END
								ELSE
								BEGIN
									SELECT 'THE STUDENT HAS ALREADY REGISTERED OR PASSED THE COURSE' AS [NOTIFICATION];
								END

							END
							ELSE
							BEGIN
								SELECT 'THE STUDENT DOES NOT MEET THE NECESSARY REQUIREMENTS TO TAKE THIS COURSE' AS [NOTIFICATION];
							END

						END
						ELSE 
						BEGIN

							IF EXISTS(SELECT TOP 1 1 
												FROM [People].[TB_StudentRecord] 
												WHERE Student_ID = @Student_ID 
												AND Group_ID = @Group_ID 
												AND LOWER(Record_Status) LIKE 'reprobate'
												AND Erased = 0)
								BEGIN
									INSERT INTO [People].[TB_StudentRecord]
											([Student_ID]
											,[Record_Year]
											,[Record_Semester]
											,[Group_ID])
										VALUES
											(@Student_ID
											,(SELECT CG_Year FROM Classroom.TB_Classroom_Group WHERE Group_ID = @Group_ID)
											,(SELECT CG_Semester FROM Classroom.TB_Classroom_Group WHERE Group_ID = @Group_ID)
											,@Group_ID)

									UPDATE [Group].[TB_Group]
										SET [Students_Enrolled] = ([Students_Enrolled] + 1)
										WHERE Group_ID = @Group_ID;
								END
								ELSE IF NOT EXISTS(SELECT TOP 1 1 
												FROM [People].[TB_StudentRecord] 
												WHERE Student_ID = @Student_ID 
												AND Group_ID = @Group_ID
												AND Erased = 0)
								BEGIN
									INSERT INTO [People].[TB_StudentRecord]
											([Student_ID]
											,[Record_Year]
											,[Record_Semester]
											,[Group_ID])
										VALUES
											(@Student_ID
											,YEAR(GETDATE())
											,(SELECT CG_Semester FROM Classroom.TB_Classroom_Group WHERE Group_ID = @Group_ID)
											,@Group_ID)

									UPDATE [Group].[TB_Group]
										SET [Students_Enrolled] = ([Students_Enrolled] + 1)
										WHERE Group_ID = @Group_ID;
								END
								ELSE
								BEGIN
									SELECT 'THE STUDENT HAS ALREADY REGISTERED OR PASSED THE COURSE' AS [NOTIFICATION];
								END

						END

					END
					ELSE
					BEGIN
						SELECT 'COURSE QUOTE IS FULL YOU CANNOT ENROLL' AS [NOTIFICATION];
					END
						
				END
				ELSE
				BEGIN
					SELECT 'THE STUDENT IS NOT PART OF THE COURSE' AS [NOTIFICATION];
				END

			END
			ELSE
			BEGIN
				SELECT 'THE DATA MAY BE INCORRECT SINCE THE STUDENT OR GROUP DOES NOT EXIST' AS [NOTIFICATION];
			END
		END
	END TRY
	BEGIN CATCH
		SELECT ERROR_PROCEDURE() AS [PROCEDURE];
		SELECT ERROR_MESSAGE() AS [ERROR];
	END CATCH
END