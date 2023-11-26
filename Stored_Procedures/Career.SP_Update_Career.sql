-- Author: Nubia Brenes Valerín
-- Create date: 10/24/2023
-- Description: SP to Update data about Career into the TB_Career table, belonging to the Career schema.

CREATE PROCEDURE Career.SP_Update_Career
	-- Add the parameters for the stored procedure here
	@Param_Career_ID INT,
	@Param_Career_Acronym VARCHAR(10),
	@Param_Career_Name VARCHAR(50),
	@Param_Career_Description VARCHAR(500),
	@Param_Faculty_ID INT

AS
BEGIN
	BEGIN TRY
		IF EXISTS(SELECT TOP 1 1 
			FROM Career.TB_Career 
			WHERE Career_ID=@Param_Career_ID)
		--Validation to know if the Career you want to update exists.
		BEGIN
			UPDATE 
				Career.TB_Career
			SET
				Career_acronym=@Param_Career_Acronym,
				Career_Name=@Param_Career_Name,
				Career_Description=@Param_Career_Description,
				Faculty_ID=@Param_Faculty_ID 

			WHERE Career_ID=@Param_Career_ID;
		END
		ELSE
		BEGIN
			SELECT 'The Career does not exist in the DB'
		END
	END TRY
	BEGIN CATCH
		SELECT ERROR_PROCEDURE() AS [PROCEDURE]
		SELECT ERROR_MESSAGE() AS ERROR
	END CATCH
END
