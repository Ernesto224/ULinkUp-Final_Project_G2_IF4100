-- =============================================
-- Author: Luis Ballar
-- Create date: 07/11/2023
-- Description: SP to update data into Campus table
-- =============================================
USE IF4100_C10767;
GO
--REVISADO
CREATE OR ALTER PROCEDURE Campus.SP_Insert_Campus
	-- Add the parameters for the stored procedure here
	@Param_Campus_Name VARCHAR(250),
	@Param_University_ID INT
AS
BEGIN
	BEGIN TRY
		IF NOT EXISTS (SELECT TOP 1 1 FROM Campus.TB_Campus WHERE Campus_Name = @Param_Campus_Name AND University_ID = @Param_University_ID AND Erased = 0)
		BEGIN
			INSERT INTO Campus.TB_Campus
			(
				Campus_Name,
				University_ID
			)
			VALUES
			(
				@Param_Campus_Name,
				@Param_University_ID
			);
		END
	END TRY
	BEGIN CATCH
		SELECT 'ERROR_PROCEDURE' AS [PROCEDURE], ERROR_MESSAGE() AS ERROR;
	END CATCH
END;
GO
