-- Author: Nubia Brenes Valerín
-- Create date: 10/24/2023
-- Description: SP to Select data about Group into the TB_Group table, belonging to the Group schema.

CREATE OR ALTER PROCEDURE [Group].SP_Select_Group
AS
BEGIN
	BEGIN TRY

		SELECT [Group_ID]
			  ,[Group_Number]
			  ,[Students_Enrolled]
			  ,[Subject_ID]
			  ,[Modality_ID]
		  FROM [Group].[TB_Group]
	
		  WHERE Erased =0
	
	END TRY
	BEGIN CATCH

		SELECT ERROR_PROCEDURE() AS [PROCEDURE]
		SELECT ERROR_MESSAGE() AS [ERROR]

END CATCH
END