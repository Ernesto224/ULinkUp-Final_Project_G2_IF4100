-- Author: Nubia Brenes Valerín
-- Create date: 10/24/2023
-- Description: SP to Update new data about Faculty into the TB_Faculty table, belonging to the Faculty schema.
--REVISADO
CREATE OR ALTER PROCEDURE Faculty.SP_Update_Faculty
	-- Add the parameters for the stored procedure here
	@Param_Faculty_ID                  INT,
	@Param_Faculty_Name         VARCHAR(50) NULL,
	@Param_Faculty_Description  VARCHAR(100) NULL
AS
BEGIN
	BEGIN TRY
		IF EXISTS(SELECT TOP 1 1 
			FROM Faculty.TB_Faculty 
			WHERE Faculty_ID=@Param_Faculty_ID AND Erased = 0)
		--Validation to know if the faculty you want to update exists.
		BEGIN
			UPDATE 
				Faculty.TB_Faculty 
			SET
				Faculty_Name=ISNULL(@Param_Faculty_Name, Faculty_Name),
				Faculty_Description=ISNULL(@Param_Faculty_Description, Faculty_Description)
			WHERE Faculty_ID=@Param_Faculty_ID;
		END
		ELSE
		BEGIN
			SELECT 'The Faculty does not exist in the DB'
		END
	END TRY
	BEGIN CATCH
		SELECT ERROR_PROCEDURE() AS [PROCEDURE]
		SELECT ERROR_MESSAGE() AS ERROR
	END CATCH
END
