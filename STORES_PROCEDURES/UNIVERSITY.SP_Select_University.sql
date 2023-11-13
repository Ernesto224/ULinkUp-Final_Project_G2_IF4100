-- =============================================
-- Author:		Luis Ballar
-- Create date: 12/11/2023
-- Description:	Query for University table 
-- =============================================
CREATE PROCEDURE UNIVERSITY.SP_Select_University 
AS
BEGIN
	BEGIN  TRY
		SELECT 
			University_ID
			,University_Name
			,Erased
		FROM UNIVERSITY.TB_University
	END TRY
	BEGIN CATCH
		SELECT ERROR_PROCEDURE() AS [PROCEDURE]
		SELECT ERROR_MESSAGE() AS ERROR
	END CATCH
END
GO
