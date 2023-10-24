-- Delete a school
CREATE PROCEDURE SCHOOL.SP_Delete_School
    @Param_ID_School INT
AS
BEGIN
    BEGIN TRY
        IF EXISTS (SELECT TOP 1 1 FROM SCHOOL.TB_SCHOOLS WHERE ID_School = @Param_ID_School)
        BEGIN
            DELETE FROM SCHOOL.TB_SCHOOLS WHERE ID_School = @Param_ID_School;
        END
        ELSE
        BEGIN
            SELECT 'The school does not exist in the DB';
        END
    END TRY
    BEGIN CATCH
        SELECT ERROR_PROCEDURE() AS [PROCEDURE];
        SELECT ERROR_MESSAGE() AS ERROR;
    END CATCH
END;