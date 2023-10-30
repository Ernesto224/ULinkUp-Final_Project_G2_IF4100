CREATE PROCEDURE Subject.SP_Requisite_Update
(
    @Requisite_ID INT,
    @Associated_Subject VARCHAR(10),
    @Required_Subject VARCHAR(10)
)
AS
BEGIN
    BEGIN TRY

        -- Validate that Associated_Subject exists in the Subject.TB_Subject table
        IF NOT EXISTS(SELECT TOP 1 1 FROM Subject.TB_Subject WHERE Subject_ID = @Associated_Subject)
        BEGIN
            SELECT ERROR_PROCEDURE() AS [PROCEDURE], 
			ERROR_MESSAGE() AS ERROR;
            RETURN;
        END

        -- Validate that Required_Subject exists in the Subject.TB_Subject table
        IF NOT EXISTS(SELECT TOP 1 1 FROM Subject.TB_Subject WHERE Subject_ID = @Required_Subject)
        BEGIN
            SELECT ERROR_PROCEDURE() AS [PROCEDURE], 
			ERROR_MESSAGE() AS ERROR;
            RETURN;
        END

        -- Update the existing requirement record
        UPDATE 
			Subject.TB_Requisite
        SET
            Associated_Subject = @Associated_Subject,
            Required_Subject = @Required_Subject
        WHERE Requisite_ID = @Requisite_ID;

    END TRY
    BEGIN CATCH
        SELECT ERROR_PROCEDURE() AS [PROCEDURE], 
		ERROR_MESSAGE() AS ERROR;
    END CATCH;
END;
