-- Delete a modality (logical deletion)
--REVISADO
CREATE OR ALTER PROCEDURE Modality.SP_Delete_Modality
    @Param_ID_Modality INT
AS
BEGIN
    BEGIN TRY
        IF EXISTS (SELECT TOP 1 1 FROM Modality.TB_Modality WHERE Modality_ID = @Param_ID_Modality AND Erased = 0)
        BEGIN
            UPDATE Modality.TB_Modality
            SET Erased = 1
            WHERE Modality_ID = @Param_ID_Modality;
        END
        ELSE
        BEGIN
            SELECT 'The modality does not exist in the DB';
        END
    END TRY
    BEGIN CATCH
        SELECT ERROR_PROCEDURE() AS [PROCEDURE];
        SELECT ERROR_MESSAGE() AS ERROR;
    END CATCH
END;

