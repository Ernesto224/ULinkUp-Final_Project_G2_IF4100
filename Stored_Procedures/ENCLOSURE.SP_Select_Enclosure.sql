-- =============================================
-- Author:		Luis Ballar
-- Create date: 12/11/2023
-- Description:	Query for Enclosure table 
-- =============================================
CREATE PROCEDURE ENCLOSURE.SP_Select_Enclosure 
AS
BEGIN
	BEGIN  TRY
		SELECT 
			Enclosure_ID
			,Enclosure_Name
			,Campus_ID
			,Erased
		FROM ENCLOSURE.TB_Enclosure
	END TRY
	BEGIN CATCH
		SELECT ERROR_PROCEDURE() AS [PROCEDURE]
		SELECT ERROR_MESSAGE() AS ERROR
	END CATCH
END
GO
