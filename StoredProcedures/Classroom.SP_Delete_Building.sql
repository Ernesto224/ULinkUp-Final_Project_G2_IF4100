-- Perform logical deletion of a classroom
CREATE PROCEDURE CLASSROOM.SP_Delete_Classroom
    @Param_Classroom_ID VARCHAR(10)
AS
BEGIN
    BEGIN TRY
        IF EXISTS (SELECT TOP 1 1 FROM CLASSROOM.TB_CLASSROOM WHERE CLASSROOM_ID = @Param_Classroom_ID)
        BEGIN
            UPDATE CLASSROOM.TB_CLASSROOM
            SET Erased = 0
            WHERE CLASSROOM_ID = @Param_Classroom_ID;
        END
        ELSE
        BEGIN
            SELECT 'The classroom does not exist in the DB';
        END
    END TRY
    BEGIN CATCH
        SELECT ERROR_PROCEDURE() AS [PROCEDURE];
        SELECT ERROR_MESSAGE() AS ERROR;
    END CATCH
END;