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
-- Description:	<Selecting data into the table named People.TB_Career_Student>
-- =============================================
-- Create procedure for selecting data from the table named People.TB_Career_Student
--REVISADO
CREATE OR ALTER PROCEDURE People.SP_Select_Career_Student
AS
BEGIN
    BEGIN TRY
        SELECT Career_ID, Student_ID
        FROM People.TB_Career_Student
		WHERE Erased = 0;
    END TRY
    BEGIN CATCH
        SELECT ERROR_PROCEDURE() AS [PROCEDURE],
               ERROR_MESSAGE() AS [ERROR];
    END CATCH
END;
GO

