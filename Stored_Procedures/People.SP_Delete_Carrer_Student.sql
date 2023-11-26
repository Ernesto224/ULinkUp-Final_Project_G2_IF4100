SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

USE IF4100_C10767
GO

CREATE OR ALTER PROCEDURE People.SP_Delete_Career_Student
    @param_Career_ID INT,
    @param_Student_ID VARCHAR(10)
AS
BEGIN
	BEGIN TRY
		IF (
            @param_Career_ID IS NOT NULL AND
            @param_Student_ID IS NOT NULL AND
            LEN(ISNULL(@param_Student_ID, '')) > 0
        )
		BEGIN
			IF EXISTS(SELECT TOP 1 1 
					FROM People.TB_Career_Student
					WHERE Career_ID = @param_Career_ID AND Student_ID = @param_Student_ID)
			BEGIN
				UPDATE People.TB_Career_Student
				SET
					Erased = 1
				WHERE Career_ID = @param_Career_ID AND Student_ID = @param_Student_ID;
			END
			ELSE
			BEGIN
				SELECT 'The Student does not exist in the Career';
			END
		END
		ELSE
		BEGIN
			SELECT 'Invalid input parameters. Please provide valid values for Career_ID and Student_ID.'
		END
	END TRY
	BEGIN CATCH
		SELECT ERROR_PROCEDURE() AS [PROCEDURE],
               ERROR_MESSAGE() AS [ERROR];
	END CATCH
END
GO
