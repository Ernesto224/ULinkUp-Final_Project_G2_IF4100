SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
USE
IF4100_C10767
GO
-- =============================================
-- Author:		<Jesner Melgara>
-- Create date: <23-10-2023>
-- Description:	<Updating data into the table named People.TB_Career_Student>
-- =============================================
-- Create procedure for updating data in the table named People.TB_Career_Student
CREATE PROCEDURE People.SP_Update_Career_Student
    @param_Career_ID INT,
    @param_Student_ID VARCHAR(10)
AS
BEGIN
    BEGIN TRY
        IF (
            @param_Career_ID IS NOT NULL AND
            LEN(ISNULL(@param_Student_ID, '')) > 0
        )
        BEGIN
            UPDATE People.TB_Career_Student
            SET Student_ID = ISNULL(@param_Student_ID, Student_ID)
            WHERE Career_ID = @param_Career_ID;
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
END;
GO

