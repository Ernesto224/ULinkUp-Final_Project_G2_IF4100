CREATE OR ALTER PROCEDURE Subject.SP_Requisite_Delete
(
    @Param_Associated_Subject INT,
    @Param_Required_Subject INT
)
AS
BEGIN
    BEGIN TRY
		--validate if requisite_id exists
		IF EXISTS (SELECT TOP 1 1 FROM Subject.TB_Requisite WHERE Associated_Subject = @Param_Associated_Subject
				AND Required_Subject = @Param_Required_Subject AND Erased = 0)
		BEGIN
			UPDATE 
				Subject.TB_Requisite
			SET 
				Erased = 1
			WHERE Associated_Subject = @Param_Associated_Subject
				AND Required_Subject = @Param_Required_Subject;
		END
    END TRY
    BEGIN CATCH
        SELECT ERROR_PROCEDURE() AS [PROCEDURE]; 
		SELECT ERROR_MESSAGE() AS ERROR;
    END CATCH;
END;
