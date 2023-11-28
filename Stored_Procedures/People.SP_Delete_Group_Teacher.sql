-- =============================================
-- Author:		<Jesner Melgara>
-- Create date: <20-10-2023>
-- Description:	<deleting data into the table named People.TB_Group_Teacher>
-- =============================================
-- Create procedure for deleting data from the table named People.TB_Group_Teacher
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

USE IF4100_C10767
GO
---REVISADO
CREATE OR ALTER PROCEDURE People.SP_Delete_Group_Teacher
    @param_Group_ID INT,
	@param_Teacher_ID INT
AS
BEGIN
    BEGIN TRY
        IF EXISTS (SELECT TOP 1 1
				FROM People.TB_Group_Teacher
				WHERE Group_ID = @param_Group_ID AND  Teacher_ID = @param_Teacher_ID AND Erased = 0)
        BEGIN
            UPDATE People.TB_Group_Teacher
            SET Erased = 1
            WHERE Group_ID = @param_Group_ID AND  Teacher_ID = @param_Teacher_ID AND Erased = 0;

            SELECT 'Teacher deleted successfully' AS [Message];
        END
        ELSE
        BEGIN
            SELECT 'Invalid input parameter. Please provide a valid value for Teacher_ID.' AS [NOTIFICATION];
        END
    END TRY
    BEGIN CATCH
        SELECT 
            ERROR_PROCEDURE() AS [PROCEDURE],
            ERROR_MESSAGE() AS [ERROR_MESSAGE];
    END CATCH
END;
GO


