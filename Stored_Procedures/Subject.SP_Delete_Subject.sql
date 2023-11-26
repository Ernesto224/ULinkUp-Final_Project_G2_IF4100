-- =============================================
-- Author:		<Ernesto Vaga>
-- Create date: <10/21/2023>
-- Description:	<SP to delete data about 
--subject, into the TB_Subject table, belonging 
--to the Subject schema.>
-- =============================================
CREATE OR ALTER PROCEDURE Subject.SP_Delete_Subject
	-- Add the parameters for the stored procedure here
	@Param_Subject_ID INT--Acronym that refers to 
	--the course code which is unique and alphanumeric
AS
BEGIN
	BEGIN TRY
		IF EXISTS(SELECT TOP 1 1 
				FROM Subject.TB_Subject
				WHERE Subject_ID=@Param_Subject_ID
				AND Erased = 0)
		--Validation to know if the subject you want to delete exists.
		BEGIN
			UPDATE 
				Subject.TB_Subject
			SET
				Erased = 1
			WHERE Subject_ID=@Param_Subject_ID;
			--The deletion is done by logical deletion by changing the state of the deletion column from 1 to 0.
		END
		ELSE
		BEGIN
			SELECT 'The subject does not exist in the DB'
		END
	END TRY
	BEGIN CATCH
		SELECT ERROR_PROCEDURE() AS [PROCEDURE]
		SELECT ERROR_MESSAGE() AS ERROR
	END CATCH
END