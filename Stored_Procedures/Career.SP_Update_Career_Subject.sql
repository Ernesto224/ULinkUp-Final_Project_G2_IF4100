-- Author: Nubia Brenes Valerín
-- Create date: 10/24/2023
-- Description: SP to Update data about Career into the TB_Career_Subject table, belonging to the Career schema.
--REVISADO

USE IF4100_C10767;
GO

CREATE OR ALTER PROCEDURE Career.SP_Update_Career_Subject
	-- Add the parameters for the stored procedure here
	@Param_Career_ID   INT,
	@Param_Subject_ID  INT,
	@Param_Semester    INT
AS
BEGIN
	BEGIN TRY
		IF EXISTS (SELECT TOP 1 1 
			FROM Career.TB_Career_Subject
			WHERE Career_ID = @Param_Career_ID AND Subject_ID = @Param_Subject_ID AND Erased = 0)
		BEGIN
			--Validation to know if the Career_Subject you want to update exists.
			UPDATE Career.TB_Career_Subject
			SET
				Semester = ISNULL(@Param_Semester, Semester)
			WHERE Career_ID = @Param_Career_ID AND Subject_ID = @Param_Subject_ID AND Erased = 0;
		END
		ELSE
		BEGIN
			SELECT 'The Career_Subject does not exist in the DB';
		END
	END TRY
	BEGIN CATCH
		SELECT 'ERROR_PROCEDURE' AS [PROCEDURE], ERROR_MESSAGE() AS ERROR;
	END CATCH
END;
GO
