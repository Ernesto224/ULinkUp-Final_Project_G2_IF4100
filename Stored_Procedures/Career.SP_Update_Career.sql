-- Author: Nubia Brenes Valerín
-- Create date: 10/24/2023
-- Description: SP to Update data about Career into the TB_Career table, belonging to the Career schema.
USE IF4100_C10767;
GO
--REVISADO
CREATE OR ALTER PROCEDURE Career.SP_Update_Career
	-- Add the parameters for the stored procedure here
	@Param_Career_ID INT,
	@Param_Career_Acronym VARCHAR(10),
	@Param_Career_Name VARCHAR(50),
	@Param_Career_Description VARCHAR(500),
	@Param_Faculty_ID INT
AS
BEGIN
	BEGIN TRY
		IF EXISTS (SELECT TOP 1 1 
			FROM Career.TB_Career 
			WHERE Career_ID = @Param_Career_ID AND Erased = 0)
		BEGIN
			--Validation to know if the Career you want to update exists.
			UPDATE Career.TB_Career
			SET
				Career_acronym = ISNULL(@Param_Career_Acronym, Career_acronym),
				Career_Name = ISNULL(@Param_Career_Name, Career_Name),
				Career_Description = ISNULL(@Param_Career_Description, Career_Description),
				Faculty_ID = ISNULL((SELECT Faculty_ID FROM Faculty.TB_Faculty WHERE Faculty_ID = @Param_Faculty_ID), Faculty_ID)
			WHERE Career_ID = @Param_Career_ID AND Erased = 0;
		END
		ELSE
		BEGIN
			SELECT 'The Career does not exist in the DB';
		END
	END TRY
	BEGIN CATCH
		SELECT 'ERROR_PROCEDURE' AS [PROCEDURE], ERROR_MESSAGE() AS ERROR;
	END CATCH
END;
GO
