SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
USE
IF4100_C10767
GO
-- =============================================
-- Author:		<Jesner Melgara>
-- Create date: <05-11-2023>
-- Description:	<selecting data into the table named People.SP_Select_Employee>
-- =============================================
CREATE PROCEDURE People.SP_Select_Employee
AS
BEGIN
    BEGIN TRY
        SELECT
        Job,
        Job_Description,
        Administrative_Salary,
        Date_Admission
    FROM
        People.TB_Employee
	
    END TRY
    BEGIN CATCH
        SELECT ERROR_PROCEDURE() AS [PROCEDURE],
               ERROR_MESSAGE() AS [ERROR];
    END CATCH
END;
GO
