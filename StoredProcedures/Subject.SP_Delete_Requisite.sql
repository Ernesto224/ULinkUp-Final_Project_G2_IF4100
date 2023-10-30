CREATE PROCEDURE Subject.SP_Requisite_Delete
(
    @Param_Requisite_ID INT
)
AS
BEGIN
    BEGIN TRY
		--validate if requisite_id exists
		IF EXISTS(SELECT TOP 1 1 FROM Subject.TB_Requisite WHERE Requisite_ID = @Param_Requisite_ID)
		BEGIN
			UPDATE 
				Subject.TB_Requisite
			SET 
				Erased = 0
			WHERE Requisite_ID = @Param_Requisite_ID;
		END
    END TRY
    BEGIN CATCH
        SELECT ERROR_PROCEDURE() AS [PROCEDURE], 
		ERROR_MESSAGE() AS ERROR;
    END CATCH;
END;
