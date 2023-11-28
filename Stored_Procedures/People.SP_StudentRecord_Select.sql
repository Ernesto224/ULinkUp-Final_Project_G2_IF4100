-- =============================================
-- Author:		<Ernesto Vaga>
-- Create date: <11/10/2023>
-- Description:	<SP to select data about 
--people into the TB_StudentRecord, belonging 
--to the person schema.>
-- =============================================
--REVISADO
CREATE OR ALTER PROCEDURE People.SP_StudentRecord_Select
AS
BEGIN
BEGIN TRY

	SELECT
		Studen_Record.Student_ID,
		Studen_Record.Record_Year,
		Studen_Record.Record_Semester,
		Studen_Record.Record_Average,
		Studen_Record.Record_Status,
		Studen_Record.Group_ID
	FROM People.TB_StudentRecord AS Studen_Record
	WHERE Erased = 0

END TRY
BEGIN CATCH

	SELECT ERROR_PROCEDURE() AS [PROCEDURE]
	SELECT ERROR_MESSAGE() AS ERROR

END CATCH
END


