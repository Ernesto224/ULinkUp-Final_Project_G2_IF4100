-- Author: Nubia Brenes Valerín
-- Create date: 10/24/2023
-- Description: SP to Select data about Faculty into the TB_Faculty table, belonging to the Faculty schema.
--REVISADO
CREATE OR ALTER PROCEDURE Faculty.SP_Select_Faculty
AS
BEGIN
	BEGIN TRY

		SELECT [Faculty_ID]
			  ,[Faculty_Name]
			  ,[Faculty_Description]
		  FROM [Faculty].[TB_Faculty]
		  WHERE Erased =0
	
	END TRY
	BEGIN CATCH

		SELECT ERROR_PROCEDURE() AS [PROCEDURE]
		SELECT ERROR_MESSAGE() AS [ERROR]

	END CATCH
END