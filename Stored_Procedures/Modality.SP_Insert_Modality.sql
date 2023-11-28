-- Insert a new modality
CREATE OR ALTER PROCEDURE Modality.SP_Insert_Modality
    @Param_Modality_Name VARCHAR(50)
AS
BEGIN
    BEGIN TRY
        INSERT INTO Modality.TB_Modality 
        (
            Modality_Name
        )
        VALUES 
        (
            @Param_Modality_Name
        );
    END TRY
    BEGIN CATCH
        SELECT ERROR_PROCEDURE() AS [PROCEDURE];
        SELECT ERROR_MESSAGE() AS ERROR;
    END CATCH
END;
