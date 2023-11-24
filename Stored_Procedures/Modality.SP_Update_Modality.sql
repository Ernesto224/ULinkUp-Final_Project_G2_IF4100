-- Update modality information
CREATE PROCEDURE MODALITY.SP_Update_Modality
    @Param_ID_Modality INT,
    @Param_Modality_Name VARCHAR(20)
AS
BEGIN
    BEGIN TRY
        IF EXISTS (SELECT TOP 1 1 FROM MODALITY.TB_MODALITY WHERE ID_MODALITY = @Param_ID_Modality)
        BEGIN
            UPDATE MODALITY.TB_MODALITY
            SET MODALITY_NAME = @Param_Modality_Name
            WHERE ID_MODALITY = @Param_ID_Modality;
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
