-- =============================================
-- Author:		Luis Ballar
-- Create date: 07/11/2023
-- Description:	SP to insert data into Class_Schedule table
-- =============================================

--REVISADO
CREATE OR ALTER PROCEDURE Class_Schedule.SP_Insert_Class_Schedule
	-- Add the parameters for the stored procedure here
	@Param_Start_Time TIME 
	,@Param_End_Time TIME 
	,@Param_Day_Number VARCHAR(10)  
AS
BEGIN
	BEGIN TRY
		INSERT INTO Class_Schedule.TB_Class_Schedule
		(
			Start_Time 
			,End_Time 
			,Day
		)
		VALUES
		(
			@Param_Start_Time  
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
