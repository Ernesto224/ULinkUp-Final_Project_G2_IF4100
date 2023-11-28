-- Insert a new relationship between a classroom and a group
--REVISADO
USE
IF4100_C10767
GO
CREATE OR ALTER PROCEDURE Classroom.SP_Insert_Classroom_Group
    @Param_Classroom_ID INT,
    @Param_Group_ID INT,
    @Param_CG_Year DATE = NULL,
    @Param_CG_Semester INT
AS
BEGIN
    BEGIN TRY
        INSERT INTO Classroom.TB_Classroom_Group
        (
            Classroom_ID,
            Group_ID,
            CG_Year,
            CG_Semester

        )
        VALUES 
        (
            @Param_Classroom_ID,
            @Param_Group_ID,
            @Param_CG_Year,
            @Param_CG_Semester    
        );
    END TRY
    BEGIN CATCH
        SELECT ERROR_PROCEDURE() AS [PROCEDURE];
        SELECT ERROR_MESSAGE() AS ERROR;
    END CATCH
END;
