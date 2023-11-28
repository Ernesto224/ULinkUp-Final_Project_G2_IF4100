-- Insert a new Classroom
--REVISADO
USE
IF4100_C10767
GO

CREATE OR ALTER PROCEDURE Classroom.SP_Insert_Classroom
    @Param_Classroom_Name VARCHAR(50),
    @Param_Building_ID INT
AS
BEGIN
    BEGIN TRY
        INSERT INTO Classroom.TB_Classroom (
            Classroom_Name,
            Building_ID
            )
        VALUES 
        (
            @Param_Classroom_Name,
            @Param_Building_ID
        );
    END TRY
    BEGIN CATCH
        SELECT ERROR_PROCEDURE() AS [PROCEDURE];
        SELECT ERROR_MESSAGE() AS ERROR;
    END CATCH
END;

