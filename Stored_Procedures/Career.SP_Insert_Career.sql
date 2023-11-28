-- Author: Nubia Brenes Valerín
-- Create date: 10/24/2023
-- Description: SP to Insert data about Career into the TB_Career table, belonging to the Career schema.

-- Author: Nubia Brenes Valerín
USE
IF4100_C10767
GO
--REVISADO
CREATE OR ALTER PROCEDURE Career.SP_Insert_Career 
	-- Add the parameters for the stored procedure here
	@Param_Career_Acronym    VARCHAR(10),
	@Param_Career_Name         VARCHAR(50),
	@Param_Career_Description  VARCHAR(500),
	@Param_Faculty_ID          INT

AS
BEGIN
	BEGIN TRY
		IF NOT EXISTS(SELECT TOP 1 1 FROM Career.TB_Career WHERE Career_Acronym = @Param_Career_Acronym AND Erased = 0)
			INSERT INTO Career.TB_Career
			(		
				Career_Acronym,
				Career_Name,
				Career_Description,
				Faculty_ID 
			)VALUES
			(      
				@Param_Career_Acronym,
				@Param_Career_Name,
				@Param_Career_Description,
				@Param_Faculty_ID 
			);
	END TRY
	BEGIN CATCH
		SELECT ERROR_PROCEDURE() AS [PROCEDURE]
		SELECT ERROR_MESSAGE() AS ERROR
	END CATCH
END
