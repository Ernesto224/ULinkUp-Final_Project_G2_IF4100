-- =============================================
-- Author:		Luis Ballar
-- Create date: 06/11/2023
-- Description:	UNIVERSITY.SP_Update_University
-- =============================================
--REVISADO
CREATE OR ALTER PROCEDURE University.SP_Update_University
	@Param_University_ID INT,
	@Param_Universty_Name VARCHAR(100)
AS
BEGIN
	BEGIN TRY
		IF EXISTS(
					SELECT 
						TOP 1 1
					FROM University.TB_University
					WHERE University_ID = @Param_University_ID
					AND Erased = 0)
						BEGIN 
							UPDATE University.TB_University
							SET
								University_Name = @Param_Universty_Name
							WHERE University_ID = @Param_University_ID
						END
		ELSE
			BEGIN
				SELECT 
					'This University does not exist in the data base'
			END
	END TRY
	BEGIN CATCH
		SELECT	ERROR_PROCEDURE() AS [PROCEDURE]
		SELECT ERROR_MESSAGE() AS ERROR
	END CATCH
END
GO
