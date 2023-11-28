-- =============================================
-- Author:		Luis Ballar
-- Create date: 07/11/2023
-- Description:	SP to update data into Group_Class table
-- =============================================
--REVISAR
CREATE PROCEDURE SCHEDULE.SP_Update_Group_Class_Schedule 
	-- Add the parameters for the stored procedure here
	@Param_Group_ID INT
	,@Param_Schedule_ID INT NULL
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
								Schedule_ID = ISNULL(@Param_Schedule_ID)
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
