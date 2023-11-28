-- Author: Kendall Sanchez Chinchilla
-- Create date: 10/24/2023
-- Description: SP to perform logical deletion of Buildings in the TB_Building table, belonging to the Building schema.
USE
IF4100_C10767
GO
--REVISADO
CREATE OR ALTER PROCEDURE Building.SP_Delete_Building
    -- Add the parameters for the stored procedure here
    @Param_Building_ID INT -- Unique numeric identifier for the Building
AS
BEGIN
    BEGIN TRY
        IF EXISTS (SELECT TOP 1 1 FROM Building.TB_Building WHERE Building_ID = @Param_Building_ID AND Erased = 0)
        -- Validation to check if the Building you want to delete exists.
        BEGIN
            UPDATE Building.TB_Building
            SET
                Erased = 1
            WHERE Building_ID = @Param_Building_ID;
            -- The deletion is done by logical deletion by changing the state of the Erased column from 1 to 0.
        END
        ELSE
        BEGIN
            SELECT 'The Building does not exist in the DB';
        END
    END TRY
    BEGIN CATCH
        SELECT ERROR_PROCEDURE() AS [PROCEDURE];
        SELECT ERROR_MESSAGE() AS ERROR;
    END CATCH
END;
