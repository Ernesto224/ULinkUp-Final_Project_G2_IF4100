-- Update the relationship between a classroom and a group
CREATE PROCEDURE Classroom.SP_Update_Classroom_Group
    @Param_Classroom_ID INT,
    @Param_Group_ID INT,
    @Param_CG_Year INT,
    @Param_CG_Semester INT
AS
BEGIN
    BEGIN TRY
        IF EXISTS (SELECT TOP 1 1 FROM CLASSROOM.TB_CLASSROOM_GROUP WHERE CLASSROOM_ID = @Param_Classroom_ID AND GROUP_ID = @Param_Group_ID)
        BEGIN
            UPDATE Classroom.TB_Classroom_Group
            SET 
                CG_YEAR = ISNULL(@Param_CG_Year, CG_YEAR),
                CG_SEMESTER = @Param_CG_Semester
            WHERE CLASSROOM_ID = @Param_Classroom_ID AND GROUP_ID = @Param_Group_ID;
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