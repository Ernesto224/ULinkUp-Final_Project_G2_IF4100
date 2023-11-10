-- =============================================
-- Author:		Luis Ballar
-- Create date: 06/11/2023
-- Description:	SP to apply logical deletion to Schedule
-- =============================================
CREATE PROCEDURE CLASS_SCHEDULE.SP_Delete_Class_Schedule 
	-- Add the parameters for the stored procedure here
	@Param_Schedule_ID 
AS
BEGIN
	BEGIN TRY
		IF EXISTS(
					SELECT 
						TOP 1 1
					FROM CLASS_SCHEDULE.TB_Class_Schedule
					WHERE Schedule_ID = @Param_Schedule_ID)
						BEGIN
							UPDATE CLASS_SCHEDULE.TB_Class_Schedule
							SET Erased = 0
							WHERE Schedule_ID = @Param_Schedule_ID
							-- The deletion is done by logical deletion by changing the state of the Erased column from 1 to 0.

						END
		ELSE
			BEGIN
				SELECT
					'This Schedule does not exist in the data base'

			END
	END TRY
	BEGIN CATCH
	SELECT ERROR_PROCEDURE AS [PROCEDURE]
	SELECT ERROR_MESSAGE AS ERROR
	END CATCH
END
GO
