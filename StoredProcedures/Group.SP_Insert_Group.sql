-- Author: Nubia Brenes Valerín
CREATE PROCEDURE Group.SP_Insert_Group 
	-- Add the parameters for the stored procedure here
	@Param_Group_ID               INT NOT NULL,
	@Param_Group_Number           INT NOT NULL,
	@Param_Students_Enrolled      INT NOT NULL,
	@Param_Subject_ID             INT NOT NULL,
	@Param_Modality_ID            INT NOT NULL

AS
BEGIN
	BEGIN TRY
		INSERT INTO Group.TB_Group
		(		
			Group_ID,
			Group_Number,
			Students_Enrolled,
			Subject_ID,
			Modality_ID 
		)VALUES
		(
			@Param_Group_ID,
			@Param_Group_Number,
			@Param_Students_Enrolled,
			@Param_Subject_ID,
			@Param_Modality_ID         
		);
	END TRY
	BEGIN CATCH
		SELECT ERROR_PROCEDURE() AS [PROCEDURE]
		SELECT ERROR_MESSAGE() AS ERROR
	END CATCH
END