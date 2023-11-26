SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

USE
IF4100_C10767
GO
-- =============================================
-- Author:		<Jesner Melgara>
-- Create date: <20-10-2023>
-- Description:	<inserting data into the table named People.TB_Group_Teacher>
-- =============================================
-- Create procedure for inserting data into the table named People.TB_Group_Teacher
CREATE PROCEDURE People.SP_Insert_Group_Teacher
    @param_Teacher_ID VARCHAR(20),
    @param_Group_ID INT
AS
BEGIN
    BEGIN TRY
        IF (
            LEN(ISNULL(@param_Teacher_ID, '')) > 0 AND
            @param_Group_ID IS NOT NULL
        )
        BEGIN
            INSERT INTO People.TB_Group_Teacher (Teacher_ID, Group_ID)
            VALUES (@param_Teacher_ID, @param_Group_ID);
        END
        ELSE
        BEGIN
            SELECT 'Invalid input parameters. Please provide valid values for Id_Teacher and Group_ID.'
        END
    END TRY
    BEGIN CATCH
        SELECT ERROR_PROCEDURE() AS [PROCEDURE],
               ERROR_MESSAGE() AS [ERROR];
    END CATCH
END;
GO
