-- Insert a new modality
CREATE PROCEDURE MODALITY.SP_Insert_Modality
    @Param_ID_Modality INT,
    @Param_Modality_Name VARCHAR(20)
AS
BEGIN
    BEGIN TRY
        INSERT INTO MODALITY.TB_MODALITY 
        (
            ID_MODALITY,
            MODALITY_NAME
        )
        VALUES 
        (
            @Param_ID_Modality,
            @Param_Modality_Name
        );
    END TRY
    BEGIN CATCH
        SELECT ERROR_PROCEDURE() AS [PROCEDURE];
        SELECT ERROR_MESSAGE() AS ERROR;
    END CATCH
END;