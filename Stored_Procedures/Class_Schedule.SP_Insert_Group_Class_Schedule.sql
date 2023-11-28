-- =============================================
-- Author:		Luis Ballar
-- Create date: 07/11/2023
-- Description:	SP to insert data into Group_Class table
-- =============================================
--REVISAR
CREATE OR ALTER PROCEDURE [Class_Schedule].SP_Insert_Group_Class_Schedule 
	-- Add the parameters for the stored procedure here
	@Param_Group_ID INT
	,@Param_Schedule_ID INT 
AS
BEGIN
	BEGIN TRY

		IF EXISTS(SELECT TOP 1 1 FROM [Group].TB_Group WHERE Group_ID = @Param_Group_ID AND Erased = 0)
		AND EXISTS(SELECT TOP 1 1 FROM Class_Schedule.TB_Class_Schedule WHERE Schedule_ID = @Param_Schedule_ID AND Erased = 0)
		BEGIN
			INSERT INTO Class_Schedule.TB_Group_Class_Schedule
			(
				Group_ID 
				,Schedule_ID
			)
			VALUES
			(
				@Param_Group_ID
				,@Param_Schedule_ID
			)
		END
		ELSE
		BEGIN
			SELECT 'Data insert is bad' AS [NOTIFICATION];
		END
	END TRY
	BEGIN CATCH
		SELECT ERROR_PROCEDURE() AS [PROCEDURE]
		SELECT ERROR_MESSAGE() AS ERROR
	END CATCH
END
GO
