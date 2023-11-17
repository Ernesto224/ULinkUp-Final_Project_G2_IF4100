-- =============================================
-- Author:		<Ernesto Vaga>
-- Create date: <10/20/2023>
-- Description:	<SP to delete data about 
--student into the TB_Student table, belonging 
--to the person schema.>
-- =============================================
CREATE PROCEDURE People.SP_Delete_Student 
	-- Add the parameters for the stored procedure here
	@Param_Student_ID INT--Unique numeric identifier that identifies each person
AS
BEGIN
	BEGIN TRY
		IF EXISTS(SELECT TOP 1 1 
			FROM People.TB_Student 
			WHERE Student_ID=@Param_Student_ID)
		--Validation to know if the Student you want to delete exists.
		BEGIN
			DECLARE @People_ID INT
			SET @People_ID = (SELECT TOP (1)
							People_ID
							FROM People.TB_Student 
							WHERE People_ID = @Param_Student_ID)
			--A variable is declared to retrieve the person's identity and delete it using a stored procedure.
			UPDATE 
				People.TB_Student
			SET
				Erased=0
			WHERE Student_ID=@Param_Student_ID;
			--The deletion is done by logical deletion by changing the state of the deletion column from 1 to 0.
			EXEC People.SP_Delete_Person @People_ID
			--The person is removed from the registry
		END
		ELSE
		BEGIN
			SELECT 'The person does not exist in the DB'
		END
	END TRY
	BEGIN CATCH
		SELECT ERROR_PROCEDURE() AS [PROCEDURE]
		SELECT ERROR_MESSAGE() AS ERROR
	END CATCH
END