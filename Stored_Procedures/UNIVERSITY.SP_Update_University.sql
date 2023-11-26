-- =============================================
-- Author:		Luis Ballar
-- Create date: 06/11/2023
-- Description:	UNIVERSITY.SP_Update_University
-- =============================================
CREATE PROCEDURE UNIVERSITY.SP_Update_University 
	@Param_University_ID INT --IDENTIFIER FOR UNIVERSITY
	@Param_Universty_Name VARCHAR(50) NULL
AS
BEGIN
	BEGIN TRY
		IF EXISTS(
					SELECT 
						TOP 1 1
					FROM UNIVERSITY.University_TB
					WHERE UNIVERSITY_ID = @Param_University_ID)
						BEGIN 
							UPDATE UNIVERSITY.TB_University
							SET
								University_ID = ISNULL(@Param_Universty_Name)
							WHERE UNIVERSITY_ID = @Param_University_ID
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
