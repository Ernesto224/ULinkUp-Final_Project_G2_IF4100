CREATE PROCEDURE Faculty.SP_Delete_Faculty 
	-- Add the parameters for the stored procedure here
	@Param_Faculty_ID INT
BEGIN
	BEGIN TRY
		IF EXISTS(SELECT TOP 1 1 
			FROM Faculty.TB_Faculty 
			WHERE Faculty_ID=@Param_Faculty_ID)
		--Validation to know if the faculty you want to delete exists.
		BEGIN
			UPDATE 
				Faculty.TB_Faculty 
			SET
				Erased = 1
			WHERE Faculty_ID=@Param_Faculty_ID;
			--The deletion is done by logical deletion by changing the state of the deletion column from 1 to 0.
		END
		ELSE
		BEGIN
			SELECT 'The faculty does not exist in the DB'
		END
	END TRY
	BEGIN CATCH
		SELECT ERROR_PROCEDURE() AS [PROCEDURE]
		SELECT ERROR_MESSAGE() AS ERROR
	END CATCH
END