
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
---REVISADO
CREATE OR ALTER PROCEDURE People.SP_Insert_Employee
    @param_Job VARCHAR(100),
    @param_Job_Description VARCHAR(500) NULL,
	@param_Administrative_Salary NUMERIC(16, 3),
    @param_Date_Admission DATE,
    @param_People_ID INT
AS
BEGIN
    BEGIN TRY
        IF EXISTS(SELECT TOP 1 1 FROM People.TB_People WHERE People_ID = @param_People_ID AND Erased = 0)
        BEGIN
            INSERT INTO People.TB_Employee (
                Job,
                Job_Description,
                Administrative_Salary,
				Date_Admission,
                People_ID
            )
            VALUES (
                @param_Job,
                @param_Job_Description,
                @param_Administrative_Salary,
				@param_Date_Admission,
                @param_People_ID
            );
        END
        ELSE
        BEGIN
            SELECT 'Invalid input parameters. Please provide valid values for People_ID.'
        END
    END TRY
    BEGIN CATCH
        SELECT ERROR_PROCEDURE() AS [PROCEDURE],
               ERROR_MESSAGE() AS [ERROR];
    END CATCH
END;
GO


