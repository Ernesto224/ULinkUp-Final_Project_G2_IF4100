
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
USE
IF4100_C10767
GO
-- =============================================
-- Author:		<Jesner Melgara>
-- Create date: <25-10-2023>
-- Description:	<Store procedure for insert datas>
-- =============================================
-- Store procedure for insert data into the table named People.TB_Employee
CREATE PROCEDURE People.SP_Insert_Employee
    @param_Job VARCHAR(100),
    @param_Job_Description VARCHAR(500),
    @param_Date_Admission DATE,
    @param_Administrative_Salary NUMERIC(16, 6)
AS
BEGIN
    BEGIN TRY
        IF (
            LEN(ISNULL(@param_Job, '')) > 0 AND
            LEN(ISNULL(@param_Job_Description, '')) > 0 AND
            @param_Date_Admission IS NOT NULL AND
            @param_Administrative_Salary IS NOT NULL
        )
        BEGIN
            INSERT INTO People.TB_Employee (
                Job,
                Job_Description,
                Date_Admission,
                Administrative_Salary
            )
            VALUES (
                @param_Job,
                @param_Job_Description,
                @param_Date_Admission,
                @param_Administrative_Salary
            );
        END
        ELSE
        BEGIN
            SELECT 'Invalid input parameters. Please provide valid values for Job, Job_Description, Date_Admission, and Administrative_Salary.'
        END
    END TRY
    BEGIN CATCH
        SELECT ERROR_PROCEDURE() AS [PROCEDURE],
               ERROR_MESSAGE() AS [ERROR];
    END CATCH
END;
GO


