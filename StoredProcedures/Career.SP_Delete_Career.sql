-- Author: Nubia Brenes Valerín
CREATE PROCEDURE Career.SP_Delete_Career
    -- Add the parameters for the stored procedure here
    @Param_Career_ID INT -- Unique numeric identifier for the Career
AS
BEGIN
    BEGIN TRY
        IF EXISTS (SELECT TOP 1 1 FROM Career.TB_Career WHERE Career_ID = @Param_Career_ID)
        -- Validation to check if the building you want to delete exists.
        BEGIN
            UPDATE Career.TB_Career
            SET
                Erased = 0
            WHERE Career_ID = @Param_Career_ID;
            -- The deletion is done by logical deletion by changing the state of the Erased column from 1 to 0.
        END
        ELSE
        BEGIN
            SELECT 'The Career does not exist in the DB';
        END
    END TRY
    BEGIN CATCH
        SELECT ERROR_PROCEDURE() AS [PROCEDURE];
        SELECT ERROR_MESSAGE() AS ERROR;
    END CATCH
END