CREATE PROCEDURE Classroom.SP_Select_Classroom_Group
AS
BEGIN
    BEGIN TRY
        SELECT 
            Classroom_ID,
            Group_ID,
            CG_Year,
            CG_Semester
        FROM Classroom.TB_Classroom_Group
        WHERE Erased = 1; -- Only select active records (Erased = 1)
    END TRY
    BEGIN CATCH
        SELECT ERROR_PROCEDURE() AS [PROCEDURE];
        SELECT ERROR_MESSAGE() AS ERROR;
    END CATCH
END;
