-- =============================================
-- Author:		<Ernesto Vaga>
-- Create date: <11/10/2023>
-- Description:	<SP to update data about 
--people into the TB_StudentRecord, belonging 
--to the person schema.>
-- =============================================

CREATE OR ALTER PROCEDURE People.SP_StudentRecord_Update
(
	@Student_ID varchar(10),
	@Group_ID int,
	@Record_Year int NULL,
	@Record_Semester int NULL,
	@Record_Average float NULL,
	@Record_Status varchar(20) NULL
)
AS
BEGIN
	BEGIN TRY

		IF EXISTS (SELECT TOP 1 1 FROM People.TB_StudentRecord WHERE Student_ID = @Student_ID AND Group_ID = @Group_ID AND Erased = 1)
		BEGIN
			
			UPDATE 
				People.TB_StudentRecord
			SET Record_Year = ISNULL(@Record_Year, Record_Year)
				, Record_Semester = ISNULL(@Record_Semester, Record_Semester)
				, Record_Average = ISNULL(@Record_Average, Record_Average)
				, Record_Status = ISNULL(@Record_Status, Record_Status)
			WHERE Student_ID = @Student_ID AND Group_ID = @Group_ID;

		END
		ELSE
		BEGIN
			SELECT 'The update data is not correct' AS [NOTIFICATION];
		END

	END TRY
	BEGIN CATCH

		SELECT ERROR_PROCEDURE() AS [PROCEDURE];
		SELECT ERROR_MESSAGE() AS [ERROR];
		
	END CATCH
END