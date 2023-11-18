CREATE PROCEDURE Group.SP_Delete_Group
	-- Add the parameters for the stored procedure here
	@Param_Group_ID INT
BEGIN
	BEGIN TRY
		IF EXISTS(SELECT TOP 1 1 
			FROM Group.TB_Group
			WHERE Group_ID=@Param_Group_ID)
		--Validation to know if the faculty you want to delete exists.
		BEGIN
			UPDATE 
				Group.TB_Group 
			SET
				Erased=0
			WHERE Group_ID=@Param_Group_ID;
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