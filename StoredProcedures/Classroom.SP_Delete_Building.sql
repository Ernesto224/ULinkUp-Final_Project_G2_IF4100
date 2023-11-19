-- Perform logical deletion of a Classroom
CREATE PROCEDURE Classroom.SP_Delete_Classroom
    @Param_Classroom_ID VARCHAR(10)
AS
BEGIN
    BEGIN TRY
        IF EXISTS (SELECT TOP 1 1 FROM Classroom.TB_Classroom WHERE Classroom_ID = @Param_Classroom_ID)
        BEGIN
            UPDATE Classroom.TB_Classroom
            SET Erased = 0
            WHERE Classroom_ID = @Param_Classroom_ID;
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