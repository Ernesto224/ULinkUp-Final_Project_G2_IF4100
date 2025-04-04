-- =============================================
-- Author:		<Kendall Sánchez>
-- Create date: <12/21/2023>
-- Description:	<SP to select 
--data from the TB_Building table, belonging 
--to the Subject schema.>
-- =============================================
USE
IF4100_C10767
GO
--REVISADO
CREATE OR ALTER PROCEDURE Building.SP_Select_Building
AS
BEGIN
	BEGIN TRY

		SELECT Building_ID, 
			Building_Name,
			Building_Location, 
			Faculty, 
			Enclosure_ID,
            Faculty_ID
		FROM Building.TB_Building
		WHERE Erased = 0

	END TRY
	BEGIN CATCH

		SELECT ERROR_PROCEDURE() AS [PROCEDURE]
		SELECT ERROR_MESSAGE() AS ERROR

END CATCH
END