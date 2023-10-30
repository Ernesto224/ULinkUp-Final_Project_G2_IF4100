CREATE PROCEDURE Subject.SP_Requisite_Insert
(
    @Param_Associated_Subject VARCHAR(10),
    @Param_Required_Subject VARCHAR(10)
)
AS
BEGIN
    BEGIN TRY

        -- Validate that Associated_Subject exists in the Subject.TB_Subject table
        IF NOT EXISTS(SELECT TOP 1 1 FROM Subject.TB_Subject WHERE Subject_ID = @Param_Associated_Subject)
        BEGIN
            SELECT ERROR_PROCEDURE() AS [PROCEDURE], 
			ERROR_MESSAGE() AS ERROR;
            RETURN;
        END

        -- Validate that Required_Subject exists in the Subject.TB_Subject table
        IF NOT EXISTS(SELECT TOP 1 1 FROM Subject.TB_Subject WHERE Subject_ID = @Param_Required_Subject)
        BEGIN
            SELECT ERROR_PROCEDURE() AS [PROCEDURE], 
			ERROR_MESSAGE() AS ERROR;
            RETURN;
        END

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

    END TRY
    BEGIN CATCH
        SELECT ERROR_PROCEDURE() AS [PROCEDURE], 
		ERROR_MESSAGE() AS ERROR;
    END CATCH;
END;
