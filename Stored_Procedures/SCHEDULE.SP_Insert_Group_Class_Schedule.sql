-- =============================================
-- Author:		Luis Ballar
-- Create date: 07/11/2023
-- Description:	SP to insert data into Group_Class table
-- =============================================
CREATE PROCEDURE SCHEDULE.SP_Insert_Group_Class_Schedule 
	-- Add the parameters for the stored procedure here
	@Param_Group_ID INT
	,@Param_Schedule_ID INT 
AS
BEGIN
	BEGIN TRY
		INSERT INTO SCHEDULE.Group_Class_Schedule
		(
			Group_ID 
			,Schedule_ID
		)
		VALUES
		(
			@Param_Group_ID
			,@Param_Schedule_ID
		)
	END TRY
	BEGIN CATCH
		SELECT ERROR_PROCEDURE AS [PROCEDURE]
		SELECT ERROR_MESSAGE AS ERROR
	END CATCH
END
GO
