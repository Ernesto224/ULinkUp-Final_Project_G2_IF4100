-- =============================================
-- Author:		<Ernesto Vaga>
-- Create date: <10/20/2023>
-- Description:	<SP to update data about 
--student, into the TB_Student table, belonging 
--to the person schema.>
-- =============================================
CREATE PROCEDURE People.SP_Update_Student 
	-- Add the parameters for the stored procedure here
	@Param_Student_ID VARCHAR(10),--Unique numeric identifier that identifies each person
	@Param_People_Name VARCHAR(50) NULL,--Name of individual
	@Param_People_Last_Name VARCHAR(50) NULL,--First and second surname of the person
	@Param_People_Address VARCHAR(500) NULL,--Exact address of residence
	@Param_People_Phone VARCHAR(15) NULL, --The person's phone number can be null
	@Param_People_Email VARCHAR(320) NULL--Person's email address
AS
BEGIN
	BEGIN TRY
		IF EXISTS(SELECT TOP 1 1 
			FROM People.TB_Student 
			WHERE Student_ID = @Param_Student_ID)
		--Validation to know if the person you want to update exists.
		BEGIN
			DECLARE @People_ID INT
			SET @People_ID = (SELECT
							People_ID
							FROM People.TB_Student 
							WHERE Student_ID = @Param_Student_ID)
			EXEC People.SP_Update_Person
				@People_ID,
				@Param_People_Name,
				@Param_People_Last_Name,
				@Param_People_Address,
				@Param_People_Phone,
				@Param_People_Email
		END
		ELSE
		BEGIN
			SELECT 'The student does not exist in the DB'
		END
	END TRY
	BEGIN CATCH
		SELECT ERROR_PROCEDURE() AS [PROCEDURE]
		SELECT ERROR_MESSAGE() AS ERROR
	END CATCH
END