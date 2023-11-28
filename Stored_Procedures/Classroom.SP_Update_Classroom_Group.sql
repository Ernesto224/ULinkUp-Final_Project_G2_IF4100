-- Update the relationship between a classroom and a group

USE IF4100_C10767;
GO
--REVISADO
CREATE OR ALTER PROCEDURE Classroom.SP_Update_Classroom_Group
    @Param_Classroom_ID INT,
    @Param_Group_ID INT,
    @Param_CG_Year INT,
    @Param_CG_Semester INT
AS
BEGIN
    BEGIN TRY
        IF EXISTS (SELECT TOP 1 1 FROM Classroom.TB_Classroom_Group WHERE Classroom_ID = @Param_Classroom_ID AND Group_ID = @Param_Group_ID AND Erased = 0)
        BEGIN
            UPDATE Classroom.TB_Classroom_Group
            SET 
                CG_Year = ISNULL(@Param_CG_Year, CG_Year),
                CG_Semester = ISNULL(@Param_CG_Semester, CG_Semester)
            WHERE Classroom_ID = @Param_Classroom_ID AND Group_ID = @Param_Group_ID AND Erased = 0;
        END
        ELSE
        BEGIN
            SELECT 'The relationship does not exist in the DB';
        END
    END TRY
    BEGIN CATCH
        SELECT 'ERROR_PROCEDURE' AS [PROCEDURE], ERROR_MESSAGE() AS ERROR;
    END CATCH
END;
