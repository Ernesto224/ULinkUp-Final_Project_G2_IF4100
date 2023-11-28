-- =============================================
-- Author:	Luis Ballar
-- Create date: 31/10/2023
-- Description:	SP to apply logical deletion to University
-- =============================================
--REVISADO
CREATE OR ALTER PROCEDURE University.SP_Delete_University
	-- Add the parameters for the stored procedure here
	@Param_University_ID INT 
AS
BEGIN
	BEGIN TRY
		-- Validation to check if the University you want to delete exists.
		IF EXISTS(
				SELECT 
					TOP 1 1
				FROM University.TB_University
				WHERE University_ID = @Param_University_ID AND Erased = 0)
					BEGIN
						UPDATE University.TB_University
						SET 
							Erased = 1
						WHERE University_ID = @Param_University_ID
					-- The deletion is done by logical deletion by changing the state of the Erased column from 1 to 0.
					END
		ELSE
			BEGIN
				SELECT
					'This University does not exist in the data base'
			END
	END TRY
	BEGIN CATCH
		SELECT ERROR_PROCEDURE() AS [PROCEDURE]
		SELECT ERROR_MESSAGE() AS ERROR
	END CATCH
END
GO
