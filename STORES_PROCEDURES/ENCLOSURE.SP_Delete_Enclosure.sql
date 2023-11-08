-- =============================================
-- Author:		Luis Ballar 
-- Create date: 06/11/2023
-- Description:	SP to apply logical deletion to Enclosure
-- =============================================
CREATE PROCEDURE ENCLOSURE.SP_Delete_Enclosure
	-- Add the parameters for the stored procedure here
	@Param_Enclosure_ID INT --IDENTIFIER FOR ENCLOSURE

AS
BEGIN
	BEGIN TRY
		-- Validation to check if the University you want to delete exists.
		IF EXISTS(
					SELECT 
						TOP 1 1
					FROM ENCLOSURE.TB_Enclosure
					WHERE Enclosure_ID = @Param_Enclosure_ID)
						BEGIN
							UPDATE ENCLOSURE.TB_Enclosure
							SET Erased = 0
							WHERE Enclosure_ID = @Param_Enclosure_ID
					-- The deletion is done by logical deletion by changing the state of the Erased column from 1 to 0.

						END
		ELSE
			BEGIN
				SELECT
					'This Enclosure does not exist in the data base'
			END
	END TRY
	BEGIN CATCH
		SELECT ERROR_PROCEDURE AS [PROCEDURE]
		SELECT ERROR_MESSAGE AS ERROR
	END CATCH
END
GO
