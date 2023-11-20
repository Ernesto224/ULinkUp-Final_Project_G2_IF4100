SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

USE IF4100_C10767
GO

CREATE PROCEDURE People.SP_Update_Employee
    @param_Employee_ID INT,
    @param_Job VARCHAR(100),
    @param_Job_Description VARCHAR(500),
    @param_Date_Admission DATE,
    @param_Administrative_Salary NUMERIC(16, 6)
AS
BEGIN
    BEGIN TRY
        IF (
            @param_Employee_ID IS NOT NULL AND
            @param_Job IS NOT NULL AND
            @param_Job_Description IS NOT NULL AND
            @param_Date_Admission IS NOT NULL AND
            @param_Administrative_Salary IS NOT NULL
        )
        BEGIN
            IF EXISTS (SELECT 1 FROM People.TB_Employee WHERE Employee_ID = @param_Employee_ID AND Erased = 1)
            BEGIN
                UPDATE People.TB_Employee
                SET
                    Job = @param_Job,
                    Job_Description = @param_Job_Description,
                    Date_Admission = @param_Date_Admission,
                    Administrative_Salary = @param_Administrative_Salary
                WHERE Employee_ID = @param_Employee_ID;
            END
            ELSE
            BEGIN
                SELECT 'The employee does not exist in the DB or is not marked as erased';
            END
        END
        ELSE
        BEGIN
            SELECT 'Invalid input parameters. Please provide valid values for Employee_ID, Job, Job_Description, Date_Admission, and Administrative_Salary.';
        END
    END TRY
    BEGIN CATCH
        SELECT ERROR_PROCEDURE() AS [PROCEDURE],
               ERROR_MESSAGE() AS [ERROR];
    END CATCH
END;
GO
