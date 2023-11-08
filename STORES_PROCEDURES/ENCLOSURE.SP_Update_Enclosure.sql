-- =============================================
-- Author:		Luis Ballar
-- Create date: 07/11/2023
-- Description:	SP to update data into Enclosure table
-- =============================================
CREATE PROCEDURE ENCLOSURE.SP_Update_Enclosure
	-- Add the parameters for the stored procedure here
	@Param_Enclosure_ID	INT -- IDENTIFIER FOR ENLOSURE
	,@Param_Enclosure_Name VARCHAR(100)  NULL
	,@Param_Campus_ID INT NULL
	
BEGIN
	BEGIN TRY
		IF EXISTS(
					SELECT 
						TOP 1 1
					FROM ENCLOSURE.TB_Enclosure
					WHERE Enclosure_ID = @Param_Enclosure_ID)
						BEGIN
							UPDATE ENCLOSURE.TB_Enclosure
							SET
								Enclosure_Name = ISNULL(@Param_Enclosure_Name)
								,Campus_ID = ISNULL(@Param_Campus_ID)
							WHERE Enclosure_ID = @Param_Enclosure_ID)
						END
		ELSE
			BEGIN
				SELECT
					'This Enclosure does not exist in the data base'
			END
	END TRY
	BEGIN CATCH
		SELECT ERROR_PROCEDURE() AS [PROCEDURE]
		SELECT ERROR_MESSAGE() AS ERROR
	END CATCH
END
GO
