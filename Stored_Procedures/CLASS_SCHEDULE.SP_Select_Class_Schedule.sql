-- ================================================
-- Template generated from Template Explorer using:
-- =============================================
-- Author:		Luis Ballar
-- Create date: 12/11/2023
-- Description:	Query for Schedule table 
-- =============================================
--REVISADO
USE
IF4100_C10767
GO
CREATE OR ALTER PROCEDURE CLASS_SCHEDULE.SP_Select_Class_Schedule
AS
BEGIN
	BEGIN  TRY
		SELECT 
			Schedule_ID
			,Start_Time
			,End_Time
			,Day
			,Erased
		FROM CLASS_SCHEDULE.TB_Class_Schedule
		WHERE Erased = 0
	END TRY
	BEGIN CATCH
		SELECT ERROR_PROCEDURE() AS [PROCEDURE]
		SELECT ERROR_MESSAGE() AS ERROR
	END CATCH
END
GO
