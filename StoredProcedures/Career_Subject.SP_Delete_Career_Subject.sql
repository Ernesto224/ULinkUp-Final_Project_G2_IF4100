-- Author: Nubia Brenes Valerín
CREATE PROCEDURE Career_Subject.SP_Delete_Career_Subject
    -- Add the parameters for the stored procedure here
    @Param_Career_ID    INT,
	@Param_Subject_ID   INT,

AS
BEGIN
    BEGIN TRY
        IF EXISTS (SELECT TOP 1 1 FROM Career_Subject.TB_Career_Subject WHERE Career_ID = @Param_Career_ID AND Subject_ID = @Param_Subject_ID)
        -- Validation to check if the Career_Subject you want to delete exists.
        BEGIN
            UPDATE Career_Subject.TB_Career_Subject
            SET
                Erased = 0
            WHERE Career_ID = @Param_Career_ID AND Subject_ID=@Param_Subject_ID;
            -- The deletion is done by logical deletion by changing the state of the Erased column from 1 to 0.
        END
        ELSE
        BEGIN
            SELECT 'The Career_Subject does not exist in the DB';
        END
    END TRY
    BEGIN CATCH
        SELECT ERROR_PROCEDURE() AS [PROCEDURE];
        SELECT ERROR_MESSAGE() AS ERROR;
    END CATCH
END