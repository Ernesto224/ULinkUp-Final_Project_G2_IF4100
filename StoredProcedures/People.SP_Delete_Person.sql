-- =============================================
-- Author:		<Ernesto Vaga>
-- Create date: <10/16/2023>
-- Description:	<SP to delete data about 
--people into the TB_People table, belonging 
--to the person schema.>
-- =============================================
CREATE PROCEDURE People.SP_Delete_Person 
	-- Add the parameters for the stored procedure here
	@Param_People_ID INT--Unique numeric identifier that identifies each person
AS
BEGIN
	BEGIN TRY
		IF EXISTS(SELECT TOP 1 1 
			FROM People.TB_People 
			WHERE People_ID=@Param_People_ID)
		--Validation to know if the person you want to delete exists.
		BEGIN
			UPDATE 
				People.TB_People
			SET
				Erased=0
			WHERE People_ID=@Param_People_ID;
			--The deletion is done by logical deletion by changing the state of the deletion column from 1 to 0.
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