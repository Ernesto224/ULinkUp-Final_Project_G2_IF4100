-- =============================================
-- Author:		Luis Ballar
-- Create date: 06/11/2023
-- Description:	SP to insert data into University table
-- =============================================
--REVISADO
CREATE OR ALTER PROCEDURE University.SP_Insert_University
	-- Add the parameters for the stored procedure here
	@Param_University_Name VARCHAR(100)
AS
BEGIN
	BEGIN TRY
		INSERT INTO UNIVERSITY.TB_University
		(
			University_Name
		)
		VALUES
		(
			@Param_University_Name
		)
	END TRY
	BEGIN CATCH
		SELECT ERROR_PROCEDURE() AS [PROCEDURE]
		SELECT ERROR_MESSAGE() AS ERROR
	END CATCH
END
