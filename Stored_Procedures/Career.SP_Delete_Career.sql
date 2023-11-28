-- Author: Nubia Brenes Valerín
-- Create date: 10/24/2023
-- Description: SP to Delete data about Career into the TB_Career table, belonging to the Career schema.

USE
IF4100_C10767
GO
--REVISADO
CREATE OR ALTER PROCEDURE Career.SP_Delete_Career
    -- Add the parameters for the stored procedure here
    @Param_Career_ID INT -- Unique numeric identifier for the Career
AS
BEGIN
    BEGIN TRY
        IF EXISTS (SELECT TOP 1 1 FROM Career.TB_Career WHERE Career_ID = @Param_Career_ID AND Erased = 0)
        -- Validation to check if the Career you want to delete exists.
        BEGIN
            UPDATE Career.TB_Career
            SET
                Erased = 1
            WHERE Career_ID = @Param_Career_ID AND Erased = 0;
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
