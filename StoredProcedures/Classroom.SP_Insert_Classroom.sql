-- Insert a new classroom
CREATE PROCEDURE CLASSROOM.SP_Insert_Classroom
    @Param_Classroom_ID VARCHAR(10),
    @Param_Classroom_Number NUMERIC(2, 0),
    @Param_Building_ID INT
AS
BEGIN
    BEGIN TRY
        INSERT INTO CLASSROOM.TB_CLASSROOM (
            CLASSROOM_ID,
            CLASSROOM_NUMBER,
            BUILDING_ID
            )
        VALUES 
        (
            @Param_Classroom_ID,
            @Param_Classroom_Number,
            @Param_Building_ID
            
        );
    END TRY
    BEGIN CATCH
        SELECT ERROR_PROCEDURE() AS [PROCEDURE];
        SELECT ERROR_MESSAGE() AS ERROR;
    END CATCH
END;
