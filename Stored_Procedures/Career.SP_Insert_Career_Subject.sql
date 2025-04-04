-- Author: Nubia Brenes Valerín
-- Create date: 10/24/2023
-- Description: SP to Insert data about Career_Subject into the TB_Career_Subject  table, belonging to the Career schema.

-- Author: Nubia Brenes Valerín
--REVISADO
CREATE OR ALTER PROCEDURE Career.SP_Insert_Career_Subject 
	-- Add the parameters for the stored procedure here
	@Param_Career_ID   INT,
	@Param_Subject_ID  INT,
	@Param_Semester    INT 	

AS
BEGIN
	BEGIN TRY
		IF NOT EXISTS(SELECT TOP 1 1 FROM Career.TB_Career_Subject WHERE Career_ID = @Param_Career_ID AND @Param_Subject_ID = Subject_ID AND Erased = 0)
			BEGIN
				INSERT INTO Career.TB_Career_Subject 
					(		
						Career_ID,
						Subject_ID,
						Semester   	  	
				)VALUES(      
						@Param_Career_ID,
						@Param_Subject_ID,
						@Param_Semester  	
				);
			END
	END TRY
	BEGIN CATCH
		SELECT ERROR_PROCEDURE() AS [PROCEDURE]
		SELECT ERROR_MESSAGE() AS ERROR
	END CATCH
END