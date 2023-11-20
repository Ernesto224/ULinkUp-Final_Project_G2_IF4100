-- =============================================
-- Author:		<Ernesto Vaga>
-- Create date: <11/10/2023>
-- Description:	<SP to delete data about 
--people into the TB_StudentRecord, belonging 
--to the person schema.>
-- =============================================

CREATE OR ALTER PROCEDURE People.SP_StudentRecord_Delete
(
	@Student_ID varchar(10),
	@Group_ID int
)
AS
BEGIN
BEGIN TRY

	IF EXISTS (SELECT TOP 1 1 FROM People.TB_StudentRecord WHERE Student_ID = @Student_ID AND Group_ID = @Group_ID)
	BEGIN

		UPDATE People.TB_StudentRecord
		SET Erased = 0
		WHERE Student_ID = @Student_ID AND Group_ID = @Group_ID;

	END
	ELSE
	BEGIN
		SELECT 'The delete data is not correct' AS [NOTIFICATION];
	END
	
END TRY
BEGIN CATCH

	SELECT ERROR_PROCEDURE() AS [PROCEDURE] 
	SELECT ERROR_MESSAGE() AS ERROR

END CATCH
END
