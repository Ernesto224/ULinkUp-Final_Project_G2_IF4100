-- =============================================
-- Author:		<Ernesto Vaga>
-- Create date: <10/20/2023>
-- Description:	<SP to update data about 
--subject, into the TB_Subject table, belonging 
--to the person Subject.>
-- =============================================
CREATE PROCEDURE Subject.SP_Update_Subject 
	-- Add the parameters for the stored procedure here
	@Param_Subject_ID INT,--Unique numeric identifier that identifies each person
	@Param_Subject_Name VARCHAR(50) NULL,--Course name
	@Param_Subject_Credits INT NULL,--Course credit value defaults to 0
	@Param_Subject_Description VARCHAR(500) NULL,--Course Overview
	@Param_School_ID INT NULL--Foreign key to assign 
	--a course a relationship with the school to which it belongs
AS
BEGIN
	BEGIN TRY
		IF EXISTS(SELECT TOP 1 1 
			FROM Subject.TB_Subject 
			WHERE Subject_ID=@Param_Subject_ID)
		--Validation to know if the Subject you want to update exists.
		BEGIN
			UPDATE 
				Subject.TB_Subject
			SET 
				Subject_Name=@Param_Subject_Name,
				Subject_Credits=@Param_Subject_Credits,
				Subject_Description=@Param_Subject_Description
			WHERE Subject_ID=@Param_Subject_ID;
			IF EXISTS(SELECT TOP 1 1
				FROM School.TB_school
				WHERE School_ID=@Param_School_ID)
			BEGIN
				UPDATE 
					Subject.TB_Subject
				SET 
					School_ID=@Param_School_ID,
				WHERE Subject_ID=@Param_Subject_ID;
			END
		END
		ELSE
		BEGIN
			SELECT 'The subject does not exist in the DB'
		END
	END TRY
	BEGIN CATCH
		SELECT ERROR_PROCEDURE() AS [PROCEDURE]
		SELECT ERROR_MESSAGE() AS ERROR
	END CATCH
END