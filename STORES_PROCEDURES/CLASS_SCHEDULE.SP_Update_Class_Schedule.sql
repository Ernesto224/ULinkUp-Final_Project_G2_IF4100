-- =============================================
-- Author:		Luis Ballar
-- Create date: 07/11/2023
-- Description:	SP to update data into Class_Schedule table
-- =============================================
CREATE PROCEDURE CLASS_SCHEDULE.SP_Update_Class_Schedule
	-- Add the parameters for the stored procedure here
	@Param_Schedule_ID INT
	,@Param_Start_Time TIME NULL
	,@Param_End_Time TIME NULL
	,@Param_Day_Number INT NULL 

AS
BEGIN
	BEGIN TRY
		IF EXISTS(
					SELECT 
						TOP 1 1
					FROM CLASS_SCHEDULE.TB_Class_Schedule
					WHERE SCHEDULE_ID = @Param_Schedule_ID)
						BEGIN
							UPDATE CLASS_SCHEDULE.TB_Class_Schedule
							SET
								Start_Time = ISNULL(@Param_Start_Time)
								,End_Time = ISNULL(@Param_End_Time)
								,Day_Number = ISNULL(@Param_Day_Number)
							WHERE SCHEDULE_ID = @Param_Schedule_ID
						END
		ELSE
			BEGIN
				SELECT 
					'This Schedule does not exist in the data base'
			END
	END TRY
	BEGIN CATCH
		SELECT ERROR_PROCEDURE() AS [PROCEDURE]
		SELECT ERROR_MESSAGE AS ERROR
	END CATCH
END
GO
