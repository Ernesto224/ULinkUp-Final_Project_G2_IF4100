-- ================================================
-- =============================================
-- Author:		Luis Ballar
-- Create date: 07/11/2023
-- Description:	SP to apply logical deletion to Campus
-- =============================================
USE
IF4100_C10767
GO

--REVISADO
CREATE OR ALTER PROCEDURE Campus.SP_Delete_Campus
	-- Add the parameters for the stored procedure here
	@Param_Campus_ID INT
AS
BEGIN
	BEGIN TRY
		IF EXISTS(
				SELECT
					TOP 1 1
				FROM CAMPUS.TB_Campus
				WHERE Campus_ID = @Param_Campus_ID AND Erased = 0)
					BEGIN
						UPDATE CAMPUS.TB_Campus
						SET 
							Erased = 1
						WHERE Campus_ID = @Param_Campus_ID AND Erased = 0
					-- The deletion is done by logical deletion by changing the state of the Erased column from 1 to 0.
					END
		ELSE
			BEGIN
				SELECT
					'This Campus does not exist in the data base'
			END
	END TRY
	BEGIN CATCH
		SELECT ERROR_PROCEDURE() AS [PROCEDURE]
		SELECT ERROR_MESSAGE() AS ERROR
	END CATCH
END
GO
