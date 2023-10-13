CREATE PROCEDURE SP_DeletePerson
(
    @People_ID VARCHAR(10)
)
AS
BEGIN--Try to eliminate the person if not throw an error
    BEGIN TRY
        DELETE FROM People.TB_People
        WHERE People_ID = @People_ID
    END TRY
    BEGIN CATCH
        RAISERROR
        ('Error deleting person.',
            19,
            1)
        RETURN
    END CATCH
END