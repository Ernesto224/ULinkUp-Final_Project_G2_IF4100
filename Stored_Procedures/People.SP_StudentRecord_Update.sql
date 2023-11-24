-- =============================================
-- Author:		<Ernesto Vaga>
-- Create date: <11/10/2023>
-- Description:	<SP to update data about 
--people into the TB_StudentRecord, belonging 
--to the person schema.>
-- =============================================

CREATE PROCEDURE People.SP_StudentRecord_Update
(
	@Student_ID varchar(10),
	@Record_Year date,
	@Record_Semester int,
	@Record_Average float,
	@Record_Status varchar(20),
	@Group_ID int
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
		SET Record_Year = @Record_Year
		, Record_Semester = @Record_Semester
		, Record_Average = @Record_Average
		, Record_Status = @Record_Status
		, Group_ID = @Group_ID
		WHERE Student_ID = @Student_ID
		
	END TRY
	BEGIN CATCH

		SELECT ERROR_PROCEDURE() AS [PROCEDURE]
		SELECT ERROR_MESSAGE() AS ERROR
		
	END CATCH
END