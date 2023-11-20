-- =============================================
-- Author:		Luis Ballar
-- Create date: 12/11/2023
-- Description:	Query for Group_Class_Schedule table 
-- ==============================================
CREATE PROCEDURE SCHEDULE.SP_Select_Group_Class_Schedule 
AS
BEGIN
	BEGIN  TRY
		SELECT 
			Group_ID
			,Schedule_ID
			,Erased
		FROM SCHEDULE.Group_Class_Schedule
	END TRY
	BEGIN CATCH
		SELECT ERROR_PROCEDURE() AS [PROCEDURE]
		SELECT ERROR_MESSAGE() AS ERROR
	END CATCH
END
GO
