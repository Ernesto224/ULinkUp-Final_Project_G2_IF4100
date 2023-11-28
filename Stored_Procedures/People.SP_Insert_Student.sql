-- =============================================
-- Author:		<Ernesto Vaga>
-- Create date: <10/20/2023>
-- Description:	<SP to insert new data about 
--student, into the TB_Student table, belonging 
--to the person schema.>
-- =============================================
--REVISADO
CREATE OR ALTER PROCEDURE People.SP_Insert_Student
	-- Add the parameters for the stored procedure here
	@param_Student_ID VARCHAR(10),
	@Param_People_ID INT,--Unique numeric identifier that identifies each person
	@Param_Date_Admission DATE--Date the student was admitted
AS
BEGIN
	BEGIN TRY
		IF EXISTS(SELECT TOP 1 1 
				FROM People.TB_People
				WHERE People_ID=@Param_People_ID
				AND Erased = 0)
		BEGIN
			--It validates if the person exists in the system
			--, if not, it enters it first through another stored procedure.
			INSERT INTO People.TB_Student
			(
				Student_ID,
				Date_Admission,
				People_ID
			)VALUES
			(
				@param_Student_ID,
				@Param_Date_Admission,
				@Param_People_ID
			)
		END
		
	END TRY
	BEGIN CATCH
		SELECT ERROR_PROCEDURE() AS [PROCEDURE]
		SELECT ERROR_MESSAGE() AS ERROR
	END CATCH
END