-- =============================================
-- Author:		Luis Ballar
-- Create date: 12/11/2023
-- Description:	Query for Enclosure table 
-- =============================================
--REVISADO

USE
IF4100_C10767
GO
CREATE OR ALTER PROCEDURE Enclosure.SP_Select_Enclosure 
AS
BEGIN
	BEGIN  TRY
		SELECT 
			Enclosure_ID
			,Enclosure_Name
			,Campus_ID
			,Erased
		FROM Enclosure.TB_Enclosure
		WHERE Erased = 0
	END TRY
	BEGIN CATCH
		SELECT ERROR_PROCEDURE() AS [PROCEDURE]
		SELECT ERROR_MESSAGE() AS ERROR
	END CATCH
END
GO
