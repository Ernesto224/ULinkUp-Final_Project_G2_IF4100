-- =============================================
-- Author:		Luis Ballar
-- Create date: 07/11/2023
-- Description:	SP to apply logical deletion to Group Class
-- =============================================
CREATE PROCEDURE SCHEDULE.SP_Delete_Group_Class_Schedule 
	-- Add the parameters for the stored procedure here
	@Param_Group_ID INT -- IDENTIFIER FOR GROUP CLASS
AS
BEGIN
	BEGIN TRY
		IF EXISTS(
					SELECT
						TOP 1 1
					FROM SCHEDULE.Group_Class_Schedule
					WHERE Group_ID = @Param_Group_ID)
						BEGIN
							UPDATE SCHEDULE.Group_Class_Schedule
							SET
								Erased = 0
							WHERE Group_ID = @Param_Group_ID 
						END
		ELSE
			BEGIN
				SELECT
					'This Group Class does not exist in the data base'
			END
	END TRY
	BEGIN CATCH
		SELECT ERROR_PROCEDURE AS [PROCEDURE]
		SELECT ERROR_MESSAGE AS ERROR
	END CATCH
END
GO
