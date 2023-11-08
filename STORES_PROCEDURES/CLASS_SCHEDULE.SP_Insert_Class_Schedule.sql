-- =============================================
-- Author:		Luis Ballar
-- Create date: 07/11/2023
-- Description:	SP to insert data into Class_Schedule table
-- =============================================
CREATE PROCEDURE CLASS_SCHEDULE.SP_Insert_Class_Schedule
	-- Add the parameters for the stored procedure here
	@Param_Schedule_ID INT
	,@Param_Start_Time TIME 
	,@Param_End_Time TIME 
	,@Param_Day_Number INT  
AS
BEGIN
	BEGIN TRY
		INSERT INTO CLASS_SCHEDULE.TB_Class_Schedule
		(
			Schedule_ID 
			,Start_Time 
			,End_Time 
			,Day_Number 
		)
		VALUES
		(
			@Param_Schedule_ID 
			,@Param_Start_Time  
			,@Param_End_Time  
			,@Param_Day_Number   
		)
	END TRY
	BEGIN CATCH
		SELECT ERROR_PROCEDURE() AS [PROCEDURE]
		SELECT ERROR_MESSAGE() AS ERROR
	END CATCH

END
GO
