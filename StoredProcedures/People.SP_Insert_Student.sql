-- =============================================
-- Author:		<Ernesto Vaga>
-- Create date: <10/20/2023>
-- Description:	<SP to insert new data about 
--student, into the TB_Student table, belonging 
--to the person schema.>
-- =============================================
CREATE PROCEDURE People.SP_Insert_Student
	-- Add the parameters for the stored procedure here
	@Param_People_ID INT,--Unique numeric identifier that identifies each person
	@Param_People_Name VARCHAR(50),--Name of individual
	@Param_People_Last_Name VARCHAR(50),--First and second surname of the person
	@Param_People_Address VARCHAR(500),--Exact address of residence
	@Param_People_Phone VARCHAR(15) NULL, --The person's phone number can be null
	@Param_People_Email VARCHAR(320),--Person's email address
	@Param_Date_Admission DATE--Date the student was admitted
AS
BEGIN
	BEGIN TRY
		IF NOT EXISTS(SELECT TOP 1 1 
				FROM People.TB_People
				WHERE People_ID=@Param_People_ID)
		BEGIN
			EXEC People.SP_Insert_Person 
			@Param_People_Name,
			@Param_People_Last_Name,
			@Param_People_Address,
			@Param_People_Phone,
			@Param_People_Email
		END
		--It validates if the person exists in the system
		--, if not, it enters it first through another stored procedure.
		INSERT INTO People.TB_Student
		(
			Date_Admission,
			People_ID
		)VALUES
		(
			@Param_Date_Admission,
			(SELECT TOP(1) People_ID 
				FROM People.TB_People
				ORDER BY People_ID DESC)
		)
	END TRY
	BEGIN CATCH
		SELECT ERROR_PROCEDURE() AS [PROCEDURE]
		SELECT ERROR_MESSAGE() AS ERROR
	END CATCH
END