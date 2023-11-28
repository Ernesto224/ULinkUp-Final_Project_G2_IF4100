-- =============================================
-- Author: Luis Ballar
-- Create date: 06/11/2023
-- Description: SP to insert data into Enclosure table
-- =============================================

--REVISADO
USE IF4100_C10767;
GO

CREATE OR ALTER PROCEDURE Enclosure.SP_Insert_Enclosure 
    -- Add the parameters for the stored procedure here
    @Param_Enclosure_Name VARCHAR(100),
    @Param_Campus_ID INT
AS
BEGIN
    BEGIN TRY
        INSERT INTO Enclosure.TB_Enclosure
        (
            Enclosure_Name,
            Campus_ID
        )
        VALUES
        (
            @Param_Enclosure_Name,
            @Param_Campus_ID
        );
    END TRY
    BEGIN CATCH
        SELECT 'ERROR_PROCEDURE' AS [PROCEDURE], ERROR_MESSAGE() AS ERROR;
    END CATCH
END;
GO
