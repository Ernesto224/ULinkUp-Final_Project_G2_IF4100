-- =============================================
-- Author: Luis Ballar
-- Create date: 07/11/2023
-- Description: SP to update data into Campus table
-- =============================================
USE IF4100_C10767;
GO

--REVISADO
CREATE OR ALTER PROCEDURE Campus.SP_Update_Campus
	-- Add the parameters for the stored procedure here
	@Param_Campus_ID INT,
	@Param_Campus_Name VARCHAR(250) = NULL,
	@Param_University_ID INT = NULL
AS
BEGIN
	BEGIN TRY
		IF EXISTS (
				SELECT TOP 1 1
				FROM Campus.TB_Campus
				WHERE Campus_ID = @Param_Campus_ID AND Erased = 0
			)
		BEGIN
			UPDATE Campus.TB_Campus
			SET
				Campus_Name = ISNULL(@Param_Campus_Name, Campus_Name),
				University_ID = ISNULL(@Param_University_ID, University_ID)
			WHERE Campus_ID = @Param_Campus_ID AND Erased = 0;
		END
		ELSE
		BEGIN
			SELECT 'This Campus does not exist in the database';
		END
	END TRY
	BEGIN CATCH
		SELECT 'ERROR_PROCEDURE' AS [PROCEDURE], ERROR_MESSAGE() AS ERROR;
	END CATCH
END;
GO
