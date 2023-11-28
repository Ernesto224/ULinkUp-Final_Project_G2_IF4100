-- =============================================
-- Author:		Luis Ballar
-- Create date: 07/11/2023
-- Description:	SP to apply logical deletion to Group Class
-- =============================================
--REVISADO
CREATE OR ALTER PROCEDURE [Class_Schedule].SP_Delete_Group_Class_Schedule 
	-- Add the parameters for the stored procedure here
	@Param_Group_ID INT, -- IDENTIFIER FOR GROUP CLASS
	@Param_Schedule_ID INT
AS
BEGIN
	BEGIN TRY
		IF EXISTS(
					SELECT
						TOP 1 1
					FROM Class_Schedule.TB_Group_Class_Schedule
					WHERE Group_ID = @Param_Group_ID
					AND Schedule_ID = @Param_Schedule_ID
					AND Erased = 0)
						BEGIN
							UPDATE Class_Schedule.TB_Group_Class_Schedule
							SET
								Erased = 1
							WHERE Group_ID = @Param_Group_ID
							AND Schedule_ID = @Param_Schedule_ID
							AND Erased = 0 
						END
		ELSE
			BEGIN
				SELECT
					'This Group Class does not exist in the data base'
			END
	END TRY
	BEGIN CATCH
		SELECT ERROR_PROCEDURE() AS [PROCEDURE];
		SELECT ERROR_MESSAGE() AS ERROR;
	END CATCH
END
GO
