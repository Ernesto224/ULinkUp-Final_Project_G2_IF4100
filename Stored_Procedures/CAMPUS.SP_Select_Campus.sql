-- =============================================
-- Author:		Luis Ballar
-- Create date: 12/11/2023
-- Description:	Query for Campus table 
-- =============================================
CREATE PROCEDURE CAMPUS.SP_Select_Campus 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	BEGIN  TRY
		SELECT 
			Campus_ID
			,Campus_Name
			,University_ID
			,Erased
		FROM CAMPUS.TB_Campus
	END TRY
	BEGIN CATCH
		SELECT ERROR_PROCEDURE() AS [PROCEDURE]
		SELECT ERROR_MESSAGE() AS ERROR
	END CATCH
END
GO