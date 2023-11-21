-- =============================================
-- Author:		<Ernesto Vaga>
-- Create date: <10/20/2023>
-- Description:	<SP to update data about 
--subject, into the TB_Subject table, belonging 
--to the person Subject.>
-- =============================================
CREATE OR ALTER PROCEDURE Subject.SP_Update_Subject 
	-- Add the parameters for the stored procedure here
	@Param_Subject_ID INT,--Unique numeric identifier that identifies each person
	@Param_Subject_Name VARCHAR(50) NULL,--Course name
	@Param_Subject_acronym VARCHAR(10) NULL,--subject acronym
	@Param_Subject_Credits INT NULL,--Course credit value defaults to 0
	@Param_Subject_Description VARCHAR(500) NULL,--Course Overview
	@Param_School_ID INT NULL--Foreign key to assign 
	--a course a relationship with the school to which it belongs
AS
BEGIN
	BEGIN TRY
		IF EXISTS(SELECT TOP 1 1 
			FROM Subject.TB_Subject 
			WHERE Subject_ID=@Param_Subject_ID AND Erased = 1)
		--Validation to know if the Subject you want to update exists.
		BEGIN
			IF @Param_School_ID IS NULL
			BEGIN
				--update not null values
				UPDATE 
					Subject.TB_Subject
				SET 
					Subject_Name= ISNULL(@Param_Subject_Name, Subject_Name),
					Subject_Acronym= ISNULL(@Param_Subject_acronym, Subject_Acronym),
					Subject_Credits= ISNULL(@Param_Subject_Credits, Subject_Credits),
					Subject_Description= ISNULL(@Param_Subject_Description, Subject_Description)
				WHERE Subject_ID=@Param_Subject_ID;
			END
			ELSE IF EXISTS(SELECT TOP 1 1
				FROM School.TB_school
				WHERE School_ID=@Param_School_ID AND Erased = 1)--validates the null school value
			BEGIN
				UPDATE 
					Subject.TB_Subject
				SET 
					Subject_Name= ISNULL(@Param_Subject_Name, Subject_Name),
					Subject_Acronym= ISNULL(@Param_Subject_acronym, Subject_Acronym),
					Subject_Credits= ISNULL(@Param_Subject_Credits, Subject_Credits),
					Subject_Description= ISNULL(@Param_Subject_Description, Subject_Description),
					School_ID = @Param_School_ID
				WHERE Subject_ID=@Param_Subject_ID;
			END
			ELSE
			BEGIN
				--if the school id dont exist exit from sp
				SELECT 'The school does not exist in the DB' AS [NOTIFICATION];
			END
		END
		ELSE
		BEGIN
			SELECT 'The subject does not exist in the DB' AS [NOTIFICATION];
		END
	END TRY
	BEGIN CATCH
		SELECT ERROR_PROCEDURE() AS [PROCEDURE];
		SELECT ERROR_MESSAGE() AS [ERROR];
	END CATCH
END