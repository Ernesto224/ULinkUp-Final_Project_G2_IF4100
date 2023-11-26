-- Author: Nubia Brenes Valerín
-- Create date: 10/24/2023
-- Description: SP to insert new data about Faculty into the TB_Faculty table, belonging to the Faculty schema.

CREATE PROCEDURE Faculty.SP_Insert_Faculty 
	-- Add the parameters for the stored procedure here
	 @Param_Faculty_Name         VARCHAR(50),
	 @Param_Faculty_Description  VARCHAR(500)
AS
BEGIN
	BEGIN TRY
		INSERT INTO Faculty.TB_Faculty 
		(		
			Faculty_Name,
			Faculty_Description
		)VALUES
		(
			@Param_Faculty_Name,
			@Param_Faculty_Description
		)
	END TRY
	BEGIN CATCH
		SELECT ERROR_PROCEDURE() AS [PROCEDURE]
		SELECT ERROR_MESSAGE() AS ERROR
	END CATCH
END
