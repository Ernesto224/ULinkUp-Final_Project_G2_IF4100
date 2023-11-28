-- =============================================
-- Author:		<Ernesto Vaga>
-- Create date: <10/20/2023>
-- Description:	<SP to select data about 
--student, into the TB_Student table, belonging 
--to the person schema.>
-- =============================================
--REVISADO
CREATE OR ALTER PROCEDURE People.SP_Student_Select
AS
BEGIN
	BEGIN TRY

		SELECT Student_ID, Date_Admission, People_ID
		FROM People.TB_Student
		WHERE Erased = 0

	END TRY
	BEGIN CATCH

		SELECT ERROR_PROCEDURE() AS [PROCEDURE]
		SELECT ERROR_MESSAGE() AS ERROR

	END CATCH
END
