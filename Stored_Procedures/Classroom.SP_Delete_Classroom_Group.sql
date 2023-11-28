-- Delete the relationship between a classroom and a group (logical deletion)

--REVISADO
CREATE OR ALTER PROCEDURE Classroom.SP_Delete_Classroom_Group
    @Param_Classroom_ID INT,
    @Param_Group_ID INT
AS
BEGIN
    BEGIN TRY
        IF EXISTS (SELECT TOP 1 1 FROM Classroom.TB_Classroom_Group WHERE Classroom_ID = @Param_Classroom_ID AND Group_ID = @Param_Group_ID AND Erased = 0)
        BEGIN
            UPDATE Classroom.TB_Classroom_Group
            SET Erased = 1
            WHERE Classroom_ID = @Param_Classroom_ID AND GROUP_ID = @Param_Group_ID AND Erased = 0;
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
