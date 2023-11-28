-- =============================================
-- Author:		<Ernesto Vaga>
-- Create date: <10/16/2023>
-- Description:	<SP to insert new data about 
--people into the TB_People table, belonging 
--to the person schema.>
-- =============================================
---REVISADO
CREATE OR ALTER PROCEDURE People.SP_Insert_Person 
	-- Add the parameters for the stored procedure here
	@Param_People_Name VARCHAR(50),--Name of individual
	@Param_People_Last_Name VARCHAR(50),--First and second surname of the person
	@Param_People_Address VARCHAR(100),--Exact address of residence
	@Param_People_Phone VARCHAR(20) NULL, --The person's phone number can be null
	@Param_People_Email VARCHAR(125)--Person's email address
AS
BEGIN
	BEGIN TRY
		INSERT INTO People.TB_People
		(	People_Name,
			People_Last_Name,
			People_Address,
			People_Phone,
			People_Email
		)VALUES
		(
			@Param_People_Name,
			@Param_People_Last_Name,
			@Param_People_Address,
			@Param_People_Phone,
			@Param_People_Email
		)
	END TRY
	BEGIN CATCH
		SELECT ERROR_PROCEDURE() AS [PROCEDURE]
		SELECT ERROR_MESSAGE() AS ERROR
	END CATCH
END
