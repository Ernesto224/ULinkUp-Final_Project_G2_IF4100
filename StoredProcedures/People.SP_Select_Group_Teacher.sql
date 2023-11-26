SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
USE
IF4100_C10767
GO
-- Author:		<Jesner Melgara>
-- Create date: <10-11-2023>
-- Description:	<Selecting data into the table named People.TB_Career_Student>
-- Create procedure for selecting data from the table named People.TB_Group_Teacher
CREATE PROCEDURE People.SP_Select_Group_Teacher
AS
BEGIN
    BEGIN TRY
        SELECT Teacher_ID, Group_ID
        FROM People.TB_Group_Teacher
		WHERE Erased = 0;
    END TRY
    BEGIN CATCH
        SELECT ERROR_PROCEDURE() AS [PROCEDURE],
               ERROR_MESSAGE() AS [ERROR];
    END CATCH
END;
GO


