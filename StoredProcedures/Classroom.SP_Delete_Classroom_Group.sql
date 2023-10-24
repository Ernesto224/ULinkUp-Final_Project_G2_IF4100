-- Delete the relationship between a classroom and a group (logical deletion)
CREATE PROCEDURE CLASSROOM.SP_Delete_Classroom_Group
    @Param_Classroom_ID INT,
    @Param_Group_ID INT
AS
BEGIN
    BEGIN TRY
        IF EXISTS (SELECT TOP 1 1 FROM CLASSROOM.TB_CLASSROOM_GROUP WHERE CLASSROOM_ID = @Param_Classroom_ID AND GROUP_ID = @Param_Group_ID)
        BEGIN
            DELETE FROM CLASSROOM.TB_CLASSROOM_GROUP WHERE CLASSROOM_ID = @Param_Classroom_ID AND GROUP_ID = @Param_Group_ID;
        END
        ELSE
        BEGIN
            SELECT 'The relationship does not exist in the DB';
        END
    END TRY
    BEGIN CATCH
        SELECT ERROR_PROCEDURE() AS [PROCEDURE];
        SELECT ERROR_MESSAGE() AS ERROR;
    END CATCH
END;