CREATE OR ALTER PROCEDURE Subject.SP_Requisite_Select
AS
BEGIN
	BEGIN TRY

		SELECT Associated_Subject, 
			Required_Subject
		FROM Subject.TB_Requisite
		WHERE Erased = 0

	END TRY
	BEGIN CATCH

		SELECT ERROR_PROCEDURE() AS [PROCEDURE]
		SELECT ERROR_MESSAGE() AS ERROR

	END CATCH
END
