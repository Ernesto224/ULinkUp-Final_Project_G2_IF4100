-- =============================================
-- Author:		<Ernesto Vaga>
-- Create date: <10/21/2023>
-- Description:	<SP to insert new data about 
--subject, into the TB_Subject table, belonging 
--to the Subject schema.>
-- =============================================
CREATE PROCEDURE Subject.SP_Insert_Subject
	-- Add the parameters for the stored procedure here
	@Param_Subject_ID VARCHAR(10),--Acronym that refers to 
	--the course code which is unique and alphanumeric
	@Param_Subject_Name VARCHAR(50),--Course name
	@Param_Subject_Credits INT NULL,--Course credit value defaults to 0
	@Param_Subject_Description VARCHAR(500),--Course Overview
	@Param_School_ID INT--Foreign key to assign 
	--a course a relationship with the school to which it belongs
AS
BEGIN
	BEGIN TRY
		IF NOT EXISTS(SELECT TOP 1 1 
				FROM School.TB_School
				WHERE School_ID=@Param_School_ID)
		BEGIN
			
		END
		--It validates if the school exists in the system
		--, if not, it enters it first through	 another stored procedure.
		INSERT INTO Subject.TB_Subject
		(
			Subject_ID,
			Subject_Name,
			Subject_Credits,
			Subject_Description,
			School_ID
		)VALUES
		(
			@Param_School_ID,
			@Param_Subject_Name,
			@Param_Subject_Credits,
			@Param_Subject_Description,
			@Param_School_ID
		)
	END TRY
	BEGIN CATCH
		SELECT ERROR_PROCEDURE() AS [PROCEDURE]
		SELECT ERROR_MESSAGE() AS ERROR
	END CATCH
END