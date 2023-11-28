-- =============================================
-- Author: Luis Ballar
-- Create date: 06/11/2023
-- Description: SP to apply logical deletion to Schedule
-- =============================================
--REVISADO
USE IF4100_C10767;
GO

CREATE OR ALTER PROCEDURE Class_Schedule.SP_Delete_Class_Schedule 
	-- Add the parameters for the stored procedure here
	@Param_Schedule_ID INT
AS
BEGIN
	BEGIN TRY
		IF EXISTS (
			SELECT TOP 1 1
			FROM Class_Schedule.TB_Class_Schedule
			WHERE Schedule_ID = @Param_Schedule_ID AND Erased = 0
		)
		BEGIN
			-- The deletion is done by logical deletion by changing the state of the Erased column from 1 to 0.
			UPDATE Class_Schedule.TB_Class_Schedule
			SET Erased = 1
			WHERE Schedule_ID = @Param_Schedule_ID AND Erased = 0;
		END
		ELSE
		BEGIN
			SELECT 'This Schedule does not exist in the database';
		END
	END TRY
	BEGIN CATCH
		SELECT 'ERROR_PROCEDURE' AS [PROCEDURE], ERROR_MESSAGE() AS ERROR;
	END CATCH
END;
GO
