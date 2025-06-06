SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

USE IF4100_C10767
GO
---REVISADO
CREATE OR ALTER PROCEDURE People.SP_Delete_Employee
    @param_Teacher_ID INT
AS
BEGIN
    BEGIN TRY
        IF (
            @param_Teacher_ID IS NOT NULL AND
            LEN(ISNULL(@param_Teacher_ID, '')) > 0
        )
        BEGIN
            IF EXISTS (SELECT TOP 1 1 FROM People.TB_Employee WHERE Employee_ID = @param_Teacher_ID AND Erased = 0)
            BEGIN

				DECLARE @Person_ID INT = (SELECT People_ID FROM People.TB_Employee WHERE Employee_ID = @param_Teacher_ID AND Erased = 0)
                
				UPDATE People.TB_Employee
                SET Erased = 1
                WHERE Employee_ID = @param_Teacher_ID;
				
				EXEC People.SP_Delete_Person @Person_ID;

			END
            ELSE
            BEGIN
                SELECT 'The employee does not exist in the DB';
            END
        END
        ELSE
        BEGIN
            SELECT 'Invalid input parameter. Please provide a valid value for Teacher_ID.'
        END
    END TRY
    BEGIN CATCH
        SELECT ERROR_PROCEDURE() AS [PROCEDURE],
               ERROR_MESSAGE() AS [ERROR];
    END CATCH
END;
GO
