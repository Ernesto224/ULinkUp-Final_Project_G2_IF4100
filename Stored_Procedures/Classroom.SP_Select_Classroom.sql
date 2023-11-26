-- =============================================
-- Author:		<Kendall Sánchez>
-- Create date: <12/21/2023>
-- Description:	<SP to select 
--data from the TB_Classroom table, belonging 
--to the Subject schema.>
-- =============================================
CREATE PROCEDURE Classroom.SP_Select_Classroom
AS
BEGIN
	BEGIN TRY

		SELECT Classroom_ID, 
			Classroom_Number,
			Building_ID
		FROM Classroom.TB_Classroom
		WHERE Erased = 1

	END TRY
	BEGIN CATCH

		SELECT ERROR_PROCEDURE() AS [PROCEDURE]
		SELECT ERROR_MESSAGE() AS [ERROR]

END CATCH
END