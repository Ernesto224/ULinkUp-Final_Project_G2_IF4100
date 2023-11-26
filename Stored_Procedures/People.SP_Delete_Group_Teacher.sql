
-- =============================================
-- Author:		<Jesner Melgara>
-- Create date: <20-10-2023>
-- Description:	<deleting data into the table named People.TB_Group_Teacher>
-- =============================================
-- Create procedure for deleting data from the table named People.TB_Group_Teacher
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

USE IF4100_C10767
GO

CREATE PROCEDURE People.SP_Delete_Group_Teacher
    @param_Teacher_ID VARCHAR(10)
AS
BEGIN
    BEGIN TRY
        IF @param_Teacher_ID IS NOT NULL AND LEN(@param_Teacher_ID) > 0
        BEGIN
            DECLARE @EmployeeExists BIT = 0;

            SELECT @EmployeeExists = 1
            FROM People.TB_Employee
            WHERE Employee_ID = @param_Teacher_ID;

            IF @EmployeeExists = 1
            BEGIN
                UPDATE People.TB_Employee
                SET Erased = 1
                WHERE Employee_ID = @param_Teacher_ID;

                SELECT 'Teacher deleted successfully' AS [Message];
            END
            ELSE
            BEGIN
                SELECT 'The employee does not exist in the DB';
            END
        END
        ELSE
        BEGIN
            SELECT 'Invalid input parameter. Please provide a valid value for Teacher_ID.';
        END
    END TRY
    BEGIN CATCH
        SELECT 
            ERROR_PROCEDURE() AS [PROCEDURE],
            ERROR_MESSAGE() AS [ERROR_MESSAGE],
            ERROR_NUMBER() AS [ERROR_NUMBER];
    END CATCH
END;
GO


