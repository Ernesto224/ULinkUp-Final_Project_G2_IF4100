-- =============================================
-- Author:		<Ernesto Vaga>
-- Create date: <10/16/2023>
-- Description:	<SP to update data about 
--people into the TB_People table, belonging 
--to the person schema.>
-- =============================================
CREATE PROCEDURE People.SP_Update_Person 
	-- Add the parameters for the stored procedure here
	@Param_People_ID INT,--Unique numeric identifier that identifies each person
	@Param_People_Name VARCHAR(50),--Name of individual
	@Param_People_Last_Name VARCHAR(50),--First and second surname of the person
	@Param_People_Address VARCHAR(500),--Exact address of residence
	@Param_People_Phone VARCHAR(15) NULL, --The person's phone number can be null
	@Param_People_Email VARCHAR(320),--Person's email address
	@Param_Erased BIT NULL --bit type value that allows you to know if the record is active or deleted
AS
BEGIN
	BEGIN TRY
		IF EXISTS(SELECT TOP 1 1 
			FROM People.TB_People 
			WHERE People_ID=@Param_People_ID)
		--Validation to know if the person you want to update exists.
		BEGIN
			UPDATE 
				People.TB_People
			SET
				People_Name=@Param_People_Name,
				People_Last_Name=@Param_People_Last_Name,
				People_Address=@Param_People_Address,
				People_Phone=@Param_People_Phone,
				People_Email=@Param_People_Email,
				Erased=@Param_Erased
			WHERE People_ID=@Param_People_ID;
		END
		ELSE
		BEGIN
			SELECT 'The person does not exist in the DB'
		END
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE()
	END CATCH
END