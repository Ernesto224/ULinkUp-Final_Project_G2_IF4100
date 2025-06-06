
-- Author: Nubia Brenes Valerín
-- Create date: 10/24/2023
-- Description: SP to Select data about Career_Subject into the TB_Career_Subject table, belonging to the Career schema.
--REVISADO
USE
IF4100_C10767
GO
CREATE OR ALTER PROCEDURE Career.SP_Select_Career_Subject
AS
BEGIN
	BEGIN TRY

		SELECT [Career_ID]
			  ,[Subject_ID]
			  ,[Semester]
			  ,[Erased]
		  FROM [Career].[TB_Career_Subject]
		  WHERE Erased =0
	
	END TRY
	BEGIN CATCH

		SELECT ERROR_PROCEDURE() AS [PROCEDURE]
		SELECT ERROR_MESSAGE() AS [ERROR]

END CATCH
END