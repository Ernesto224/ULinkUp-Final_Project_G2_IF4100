-- =============================================
-- Author:		<Ernesto Vaga>
-- Create date: <10/16/2023>
-- Description:	<SP to update data about 
--people into the TB_People table, belonging 
--to the person schema.>
-- =============================================
--REVISADO
CREATE OR ALTER PROCEDURE People.SP_Update_Person 
	-- Add the parameters for the stored procedure here
	@Param_People_ID INT,--Unique numeric identifier that identifies each person
	@Param_People_Name VARCHAR(50) NULL,--Name of individual
	@Param_People_Last_Name VARCHAR(50) NULL,--First and second surname of the person
	@Param_People_Address VARCHAR(100) NULL,--Exact address of residence
	@Param_People_Phone VARCHAR(20) NULL, --The person's phone number can be null
	@Param_People_Email VARCHAR(125) NULL--Person's email address
AS
BEGIN
	BEGIN TRY
		IF EXISTS(SELECT TOP 1 1 
			FROM People.TB_People 
			WHERE People_ID=@Param_People_ID AND Erased = 0)
		--Validation to know if the person you want to update exists.
		BEGIN
			UPDATE 
				People.TB_People
			SET
				People_Name=ISNULL(@Param_People_Name, People_Name),
				People_Last_Name=ISNULL(@Param_People_Last_Name, People_Last_Name),
				People_Address=ISNULL(@Param_People_Address, People_Address),
				People_Phone=ISNULL(@Param_People_Phone, People_Phone),
				People_Email=ISNULL(@Param_People_Email, People_Email)
			WHERE People_ID=@Param_People_ID;
		END
		ELSE
		BEGIN
			SELECT 'The person does not exist in the DB'
		END
	END TRY
	BEGIN CATCH
		SELECT ERROR_PROCEDURE() AS [PROCEDURE]
		SELECT ERROR_MESSAGE() AS ERROR
	END CATCH
END