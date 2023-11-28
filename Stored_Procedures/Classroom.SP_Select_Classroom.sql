-- =============================================
-- Author:		<Kendall Sánchez>
-- Create date: <12/21/2023>
-- Description:	<SP to select 
--data from the TB_Classroom table, belonging 
--to the Subject schema.>
-- =============================================
--REVISADO
USE
IF4100_C10767
GO
CREATE OR ALTER PROCEDURE Classroom.SP_Select_Classroom
AS
BEGIN
	BEGIN TRY

		SELECT Classroom_ID, 
			Classroom_Name,
			Building_ID
		FROM Classroom.TB_Classroom
		WHERE Erased = 0

	END TRY
	BEGIN CATCH

		SELECT ERROR_PROCEDURE() AS [PROCEDURE]
		SELECT ERROR_MESSAGE() AS [ERROR]

END CATCH
END