-- =============================================
-- Author:		Luis Ballar
-- Create date: 07/11/2023
-- Description:	SP to update data into Campus table
-- =============================================
CREATE PROCEDURE CAMPUS.SP_Insert_Campus
	-- Add the parameters for the stored procedure here
	@Param_Campus_ID INT 
	,@Param_Campus_Name VARCHAR(250)
	,@Param_University_ID INT
AS
BEGIN
	BEGIN TRY
		INSERT INTO CAMPUS.TB_Campus
		(
			Campus_ID
			,Campus_Name VARCHAR(250) 
			,University_ID 
		)
		VALUES
		(
			@Param_Campus_ID 
			,@Param_Campus_Name
			,@Param_University_ID
		)
	END TRY
	BEGIN CATCH
		SELECT ERROR_PROCEDURE() AS [PROCEDURE]
		SELECT ERROR_MESSAGE AS ERROR	
	END CATCH
END
GO
