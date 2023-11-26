-- =============================================
-- Author:		<Ernesto Vaga>
-- Create date: <11/10/2023>
-- Description:	<SP to insert data about 
--people into the TB_StudentRecord table, belonging 
--to the person schema.>
-- =============================================
CREATE OR ALTER PROCEDURE People.SP_StudentRecord_Insert
(
	@Student_ID varchar(10),
	@Record_Year int,
	@Record_Semester int,
	@Record_Average float,
	@Record_Status varchar(20),
	@Group_ID int
)
AS
BEGIN
	BEGIN TRY

		IF EXISTS (SELECT TOP 1 1 FROM [Group].TB_Group WHERE Group_ID = @Group_ID AND Erased = 1)
		BEGIN
	
			INSERT INTO People.TB_StudentRecord (Student_ID, Record_Year, Record_Semester, Record_Average, Record_Status, Group_ID)
			VALUES (@Student_ID, @Record_Year, @Record_Semester, @Record_Average, @Record_Status, @Group_ID)

		END
		BEGIN
			SELECT 'Data is not correct' AS [NOTIFICATION];
		END

	END TRY
	BEGIN CATCH

		SELECT ERROR_PROCEDURE() AS [PROCEDURE] 
		SELECT ERROR_MESSAGE() AS ERROR

	END CATCH
END