-- =============================================
-- Author:		Luis Ballar
-- Create date: 07/11/2023
-- Description:	SP to update data into Campus table
-- =============================================
CREATE PROCEDURE CAMPUS.SP_Update_Campus
	-- Add the parameters for the stored procedure here
	@Param_Campus_ID INT 
	,@Param_Campus_Name VARCHAR(250) NULL
	,@Param_University_ID INT NULL 
AS
BEGIN
	BEGIN TRY
		IF EXISTS(
					SELECT
						TOP 1 1
					FROM CAMPUS.TB_Campus
					WHERE Campus_ID = @Param_Campus_ID)
						BEGIN
							UPDATE CAMPUS.TB_Campus
							SET
								Campus_Name = ISNULL(@Param_Campus_Name)
								,University_ID = ISNULL(@Param_University_ID)
							WHERE Campus_ID = @Param_Campus_ID
						END
		ELSE
			BEGIN 
				SELECT
					'This Campus does not exist in the data base'
			END
	END TRY
	BEGIN CATCH
		SELECT ERROR_PROCEDURE() AS [PROCEDURE]
		SELECT ERROR_MESSAGE AS ERROR	
	END CATCH
END
GO
