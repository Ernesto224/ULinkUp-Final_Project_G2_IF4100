-- =============================================
-- Author:		<Ernesto Vaga>
-- Create date: <11/10/2023>
-- Description:	<SP to select data about 
--people into the TB_StudentRecord, belonging 
--to the person schema.>
-- =============================================

CREATE PROCEDURE People.SP_StudentRecord_Select
AS
BEGIN
BEGIN TRY

	SELECT
		sr.Student_ID,
		sr.Record_Year,
		sr.Record_Semester,
		sr.Record_Average,
		sr.Record_Status,
		sr.Group_ID
	FROM People.TB_StudentRecord AS sr
	WHERE Erased = 1

END TRY
BEGIN CATCH

	SELECT ERROR_PROCEDURE() AS [PROCEDURE]
	SELECT ERROR_MESSAGE() AS ERROR

END CATCH
END


