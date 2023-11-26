-- =============================================
-- Author:		<Ernesto Vaga>
-- Create date: <10/21/2023>
-- Description:	<SP to select 
--data from the TB_Subject table, belonging 
--to the Subject schema.>
-- =============================================

CREATE OR ALTER PROCEDURE Subject.SP_Subject_Select
AS
BEGIN
	BEGIN TRY

		SELECT [Subject_ID]
		  ,[Subject_Name]
		  ,[Subject_acronym]
		  ,[Subject_Credits]
		  ,[Subject_Description]
		  ,[School_ID]
		FROM [Subject].[TB_Subject]
		WHERE Erased = 0

	END TRY
	BEGIN CATCH

		SELECT ERROR_PROCEDURE() AS [PROCEDURE]
		SELECT ERROR_MESSAGE() AS ERROR

END CATCH
END
