-- =============================================
-- Author: Luis Ballar
-- Create date: 07/11/2023
-- Description: SP to update data into Enclosure table
-- =============================================
--REVISADO
USE IF4100_C10767;
GO

CREATE OR ALTER PROCEDURE Enclosure.SP_Update_Enclosure
    -- Add the parameters for the stored procedure here
    @Param_Enclosure_ID INT, -- IDENTIFIER FOR ENCLOSURE
    @Param_Enclosure_Name VARCHAR(100) = NULL,
    @Param_Campus_ID INT = NULL
AS
BEGIN
    BEGIN TRY
        IF EXISTS (
                SELECT TOP 1 1
                FROM Enclosure.TB_Enclosure
                WHERE Enclosure_ID = @Param_Enclosure_ID AND Erased = 0
            )
        BEGIN
            UPDATE Enclosure.TB_Enclosure
            SET
                Enclosure_Name = ISNULL(@Param_Enclosure_Name, Enclosure_Name),
                Campus_ID = ISNULL(@Param_Campus_ID, Campus_ID)
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
