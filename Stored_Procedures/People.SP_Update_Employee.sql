SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

USE IF4100_C10767
GO
--REVISADO
CREATE OR ALTER PROCEDURE People.SP_Update_Employee
    @param_Employee_ID INT,
    @param_Job VARCHAR(100) NULL,
    @param_Job_Description VARCHAR(500) NULL,
    @param_Administrative_Salary NUMERIC(16, 3) NULL
AS
BEGIN
    BEGIN TRY
            IF EXISTS (SELECT TOP 1 1 FROM People.TB_Employee WHERE Employee_ID = @param_Employee_ID AND Erased = 0)
            BEGIN
                UPDATE People.TB_Employee
                SET
                    Job = ISNULL(@param_Job, Job),
                    Job_Description = ISNULL(@param_Job_Description, Job_Description),
                    Administrative_Salary = ISNULL(@param_Administrative_Salary, Administrative_Salary)
                WHERE Employee_ID = @param_Employee_ID;
            END
            ELSE
            BEGIN
                SELECT 'The employee does not exist in the DB or is not marked as erased';
            END
    END TRY
    BEGIN CATCH
        SELECT ERROR_PROCEDURE() AS [PROCEDURE],
               ERROR_MESSAGE() AS [ERROR];
    END CATCH
END;
GO
