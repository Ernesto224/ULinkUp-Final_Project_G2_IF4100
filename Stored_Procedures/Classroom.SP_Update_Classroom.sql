-- Update classroom data
CREATE PROCEDURE CLASSROOM.SP_Update_Classroom
 -- Add the parameters for the stored procedure here
    @Param_Classroom_ID VARCHAR(10), -- Unique numeric identifier for the classroom
    @Param_Classroom_Number NUMERIC(2, 0) NULL,
    @Param_Building_ID INT NULL --Building identifier
AS
BEGIN
    BEGIN TRY
        IF EXISTS (SELECT TOP 1 1 FROM CLASSROOM.TB_CLASSROOM WHERE CLASSROOM_ID = @Param_Classroom_ID)
        -- Validation to check if the classroom you want to update exists.
        BEGIN
            UPDATE CLASSROOM.TB_CLASSROOM
            SET
                CLASSROOM_NUMBER = ISNULL(@Param_Classroom_Number, CLASSROOM_NUMBER),
                BUILDING_ID = ISNULL(@Param_Building_ID, BUILDING_ID)
            WHERE CLASSROOM_ID = @Param_Classroom_ID;
        END
        ELSE
        BEGIN
            SELECT 'The classroom does not exist in the DB';
        END
    END TRY
    BEGIN CATCH
        SELECT ERROR_PROCEDURE() AS [PROCEDURE];
        SELECT ERROR_MESSAGE() AS ERROR;
    END CATCH
END;
