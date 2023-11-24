-- Update school information
CREATE PROCEDURE SCHOOL.SP_Update_School
    @Param_ID_School INT,
    @Param_Name_School VARCHAR(20),
    @Param_Description_School VARCHAR(100)
AS
BEGIN
    BEGIN TRY
        IF EXISTS (SELECT TOP 1 1 FROM SCHOOL.TB_SCHOOLS WHERE ID_School = @Param_ID_School)
        BEGIN
            UPDATE SCHOOL.TB_SCHOOLS
            SET
                Name_School = @Param_Name_School,
                Description_School = @Param_Description_School
            WHERE ID_School = @Param_ID_School;
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