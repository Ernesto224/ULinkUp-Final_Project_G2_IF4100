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
-- Description:	<Inserting data into the table named People.TB_Career_Student>
-- =============================================
-- Create procedure for inserting data into the table named People.TB_Career_Student
CREATE PROCEDURE People.SP_Insert_Career_Student
    @param_Career_ID INT,
    @param_Student_ID VARCHAR(10)
AS
BEGIN
    BEGIN TRY
        IF (ISNULL(@param_Career_ID, 0) <> 0) AND (ISNULL(@param_Student_ID, '') <> '')
        BEGIN
            INSERT INTO People.TB_Career_Student (Career_ID, Student_ID)
            VALUES (@param_Career_ID, @param_Student_ID);
        END
        ELSE
        BEGIN
            SELECT  'The Career_Student does not exist in the DB'
        END
    END TRY
    BEGIN CATCH
        SELECT ERROR_PROCEDURE() AS [PROCEDURE],
               ERROR_MESSAGE() AS [ERROR];
    END CATCH
END;
GO


