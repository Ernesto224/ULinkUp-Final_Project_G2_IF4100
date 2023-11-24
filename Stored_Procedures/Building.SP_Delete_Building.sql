-- Author: Kendall Sanchez Chinchilla
-- Create date: 10/24/2023
-- Description: SP to perform logical deletion of buildings in the TB_BUILDING table, belonging to the BUILDING schema.

CREATE PROCEDURE BUILDING.SP_Delete_Building
    -- Add the parameters for the stored procedure here
    @Param_Building_ID INT -- Unique numeric identifier for the building
AS
BEGIN
    BEGIN TRY
        IF EXISTS (SELECT TOP 1 1 FROM BUILDING.TB_BUILDING WHERE BUILDING_ID = @Param_Building_ID)
        -- Validation to check if the building you want to delete exists.
        BEGIN
            UPDATE BUILDING.TB_BUILDING
            SET
                Erased = 0
            WHERE BUILDING_ID = @Param_Building_ID;
            -- The deletion is done by logical deletion by changing the state of the Erased column from 1 to 0.
        END
        ELSE
        BEGIN
            SELECT 'The building does not exist in the DB';
        END
    END TRY
    BEGIN CATCH
        SELECT ERROR_PROCEDURE() AS [PROCEDURE];
        SELECT ERROR_MESSAGE() AS ERROR;
    END CATCH
END;
