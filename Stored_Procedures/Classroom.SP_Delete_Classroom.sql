-- Perform logical deletion of a Classroom

--REVISADO

USE
IF4100_C10767
GO
CREATE OR ALTER PROCEDURE Classroom.SP_Delete_Classroom
    @Param_Classroom_ID VARCHAR(10)
AS
BEGIN
    BEGIN TRY
        IF EXISTS (SELECT TOP 1 1 FROM Classroom.TB_Classroom WHERE Classroom_ID = @Param_Classroom_ID AND Erased =0)
        BEGIN
            UPDATE Classroom.TB_Classroom
            SET Erased = 1
            WHERE Classroom_ID = @Param_Classroom_ID AND Erased = 0;
        END
        ELSE
        BEGIN
            SELECT 'The Classroom does not exist in the DB';
        END
    END TRY
    BEGIN CATCH
        SELECT ERROR_PROCEDURE() AS [PROCEDURE];
        SELECT ERROR_MESSAGE() AS ERROR;
    END CATCH
END;