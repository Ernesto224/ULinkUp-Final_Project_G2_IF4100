-- ================================================
-- Template generated from Template Explorer using:
-- =============================================
-- Author:		Luis Ballar
-- Create date: 12/11/2023
-- Description:	Query for Schedule table 
-- =============================================
CREATE PROCEDURE CLASS_SCHEDULE.SP_Select_Class_Schedule
AS
BEGIN
	BEGIN  TRY
		SELECT 
			Schedule_ID
			,Start_Time
			,End_Time
			,Day_Number
			,Erased
		FROM CLASS_SCHEDULE.TB_Class_Schedule
	END TRY
	BEGIN CATCH
		SELECT ERROR_PROCEDURE() AS [PROCEDURE]
		SELECT ERROR_MESSAGE() AS ERROR
	END CATCH
END
GO
