-- Insert a new relationship between a classroom and a group
CREATE PROCEDURE CLASSROOM.SP_Insert_Classroom_Group
    @Param_Classroom_ID INT,
    @Param_Group_ID INT,
    @Param_CG_Year DATE = NULL,
    @Param_CG_Semester INT
AS
BEGIN
    BEGIN TRY
        INSERT INTO CLASSROOM.TB_CLASSROOM_GROUP 
        (
            CLASSROOM_ID,
            GROUP_ID,
            CG_YEAR,
            CG_SEMESTER

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
