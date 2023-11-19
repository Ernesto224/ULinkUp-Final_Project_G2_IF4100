-- Delete a school (logical deletion)
CREATE PROCEDURE School.SP_Delete_School
    @Param_ID_School INT
AS
BEGIN
    BEGIN TRY
        IF EXISTS (SELECT TOP 1 1 FROM School.TB_School WHERE School_ID = @Param_ID_School)
        BEGIN
            UPDATE School.TB_School
            SET Erased = 0
            WHERE School_ID = @Param_ID_School;
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
