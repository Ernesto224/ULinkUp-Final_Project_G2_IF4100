-- Author: Nubia Brenes Valerín
-- Create date: 10/24/2023
-- Description: SP to Select data about Career into the TB_Career table, belonging to the Career schema.
USE
IF4100_C10767
GO
--REVISADO
CREATE OR ALTER PROCEDURE Career.SP_Select_Career
AS
BEGIN
	BEGIN TRY

		SELECT [Career_ID]
			  ,[Career_Name]
			  ,[Career_Acronym]
			  ,[Career_Description]
			  ,[Faculty_ID]
			  ,[Erased]
		  FROM [Career].[TB_Career]
		  WHERE Erased =0
	
	END TRY
	BEGIN CATCH

		SELECT ERROR_PROCEDURE() AS [PROCEDURE]
		SELECT ERROR_MESSAGE() AS [ERROR]

END CATCH
END