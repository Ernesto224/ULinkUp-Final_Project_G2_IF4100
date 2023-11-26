CREATE OR ALTER PROCEDURE Subject.SP_Requisite_Insert
(
    @Param_Associated_Subject INT,
    @Param_Required_Subject INT
)
AS
BEGIN
    BEGIN TRY

        -- Validate that Associated_Subject exists in the Subject.TB_Subject table
        IF EXISTS(SELECT TOP 1 1 FROM Subject.TB_Subject WHERE Subject_ID = @Param_Associated_Subject AND Erased = 0) AND
			EXISTS(SELECT TOP 1 1 FROM Subject.TB_Subject WHERE Subject_ID = @Param_Required_Subject AND Erased = 0 ) AND 
			NOT EXISTS (SELECT TOP 1 1 FROM Subject.TB_Requisite WHERE Associated_Subject = @Param_Associated_Subject
				AND Required_Subject = @Param_Required_Subject AND Erased = 0)
        BEGIN
             -- Insert the new requirement record
			INSERT INTO Subject.TB_Requisite
			(
				Associated_Subject,
				Required_Subject
			)
			VALUES
			(
				@Param_Associated_Subject,
				@Param_Required_Subject
			);
        END
		ELSE
		BEGIN
			SELECT 'Invalid values' AS [NOTIFICATION];
		END

    END TRY
    BEGIN CATCH
        SELECT ERROR_PROCEDURE() AS [PROCEDURE]; 
		SELECT ERROR_MESSAGE() AS [ERROR];
    END CATCH;
END;
