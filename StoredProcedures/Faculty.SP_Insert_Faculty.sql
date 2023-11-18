CREATE PROCEDURE Faculty.SP_Insert_Faculty 
	-- Add the parameters for the stored procedure here
	Faculty_ID           INT PRIMARY KEY IDENTITY NOT NULL,
	Faculty_Name         VARCHAR(50) NOT NULL,
	Faculty_Description  VARCHAR(500) NOT NULL
AS
BEGIN
	BEGIN TRY
		INSERT INTO Faculty.TB_Faculty 
		(		
			Faculty_Name,
			Faculty_Description
		)VALUES
		(
			@Param_Faculty_Name,
			@Param_Faculty_Description
		)
	END TRY
	BEGIN CATCH
		SELECT ERROR_PROCEDURE() AS [PROCEDURE]
		SELECT ERROR_MESSAGE() AS ERROR
	END CATCH
END