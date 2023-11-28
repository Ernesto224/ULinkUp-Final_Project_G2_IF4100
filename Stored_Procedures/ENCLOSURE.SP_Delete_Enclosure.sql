-- =============================================
-- Author: Luis Ballar 
-- Create date: 06/11/2023
-- Description: SP to apply logical deletion to Enclosure
-- =============================================

--REVISADO
USE IF4100_C10767;
GO

CREATE OR ALTER PROCEDURE Enclosure.SP_Delete_Enclosure
    -- Add the parameters for the stored procedure here
    @Param_Enclosure_ID INT --IDENTIFIER FOR ENCLOSURE
AS
BEGIN
    BEGIN TRY
        -- Validation to check if the Enclosure you want to delete exists.
        IF EXISTS (
                SELECT TOP 1 1
                FROM Enclosure.TB_Enclosure
                WHERE Enclosure_ID = @Param_Enclosure_ID AND Erased = 0
            )
        BEGIN
            -- The deletion is done by logical deletion by changing the state of the Erased column from 1 to 0.
            UPDATE Enclosure.TB_Enclosure
            SET Erased = 1
            WHERE Enclosure_ID = @Param_Enclosure_ID AND Erased = 0;
        END
        ELSE
        BEGIN
            SELECT 'This Enclosure does not exist in the database';
        END
    END TRY
    BEGIN CATCH
        SELECT 'ERROR_PROCEDURE' AS [PROCEDURE], ERROR_MESSAGE() AS ERROR;
    END CATCH
END;
GO
