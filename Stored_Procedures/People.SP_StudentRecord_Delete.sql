-- =============================================
-- Author:		<Ernesto Vaga>
-- Create date: <11/10/2023>
-- Description:	<SP to delete data about 
--people into the TB_StudentRecord, belonging 
--to the person schema.>
-- =============================================

CREATE PROCEDURE People.SP_StudentRecord_Delete
(
	@Student_ID varchar(10)
)
AS
BEGIN
BEGIN TRY

	IF NOT EXISTS (SELECT 1 FROM People.TB_StudentRecord WHERE Student_ID = @Student_ID)
	BEGIN
		SELECT ERROR_PROCEDURE() AS [PROCEDURE], SELECT ERROR_MESSAGE() AS ERROR
		RETURN
	END

	UPDATE People.TB_StudentRecord
	SET Erased = 0
	WHERE Student_ID = @Student_ID

END TRY
BEGIN CATCH

	SELECT ERROR_PROCEDURE() AS [PROCEDURE] 
	SELECT ERROR_MESSAGE() AS ERROR

END CATCH
END
