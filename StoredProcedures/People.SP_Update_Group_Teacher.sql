
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
-- Description:	<updating data into the table named People.TB_Group_Teacher>
-- =============================================
-- Create procedure for updating data in the table named People.TB_Group_Teacher
CREATE PROCEDURE People.SP_Update_Group_Teacher
    @param_Teacher_ID INT,
    @param_Group_ID INT
AS
BEGIN
    BEGIN TRY
        IF (
            @param_Group_ID IS NOT NULL AND
            @param_Teacher_ID IS NOT NULL AND
            LEN(ISNULL(@param_Teacher_ID, '')) > 0
        )
        BEGIN
            IF EXISTS (SELECT 1 FROM People.TB_Group_Teacher WHERE Group_ID = @param_Group_ID AND Teacher_ID = @param_Teacher_ID AND Erased = 0)
            BEGIN
                UPDATE People.TB_Group_Teacher
                SET Group_ID = ISNULL(@param_Group_ID, Group_ID),
                    Teacher_ID = ISNULL(@param_Teacher_ID, Teacher_ID)
                WHERE Teacher_ID = @param_Teacher_ID AND Group_ID = @param_Group_ID;
            END
            ELSE
            BEGIN
                SELECT 'The group teacher relationship does not exist in the DB or is not marked as erased';
            END
        END
        ELSE
        BEGIN
            SELECT 'Invalid input parameters. Please provide valid values for Teacher_ID and Group_ID.'
        END
    END TRY
    BEGIN CATCH
        SELECT ERROR_PROCEDURE() AS [PROCEDURE],
               ERROR_MESSAGE() AS [ERROR];
    END CATCH
END;
GO
