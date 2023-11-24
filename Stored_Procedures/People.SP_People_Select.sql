-- =============================================
-- Author:		<Ernesto Vaga>
-- Create date: <10/16/2023>
-- Description:	<SP to select data about 
--people into the TB_People table, belonging 
--to the person schema.>
-- =============================================

CREATE PROCEDURE People.SP_People_Select
AS
BEGIN
	BEGIN TRY

		SELECT People_ID, 
			People_Name, 
			People_Last_Name, 
			People_Address, 
			People_Phone, 
			People_Email
		FROM People.TB_People
		WHERE Erased = 1

	END TRY
	BEGIN CATCH

		SELECT ERROR_PROCEDURE() AS [PROCEDURE]
		SELECT ERROR_MESSAGE() AS ERROR

	END CATCH
END