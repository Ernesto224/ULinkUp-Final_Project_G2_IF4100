-- Author: Nubia Brenes Valerín
CREATE PROCEDURE Group.SP_Update_Group
	-- Add the parameters for the stored procedure here
	@Param_Group_ID INT NOT NULL,
	@Param_Group_Number INT NOT NULL,
	@Param_Students_Enrolled INT NOT NULL,
	@Param_Subject_ID INT NOT NULL,
	@Param_Modality_ID INT NOT NULL 
AS
BEGIN
	BEGIN TRY
		IF EXISTS(SELECT TOP 1 1 
			FROM Group.TB_Group 
			WHERE Group_ID=@Param_Group_ID)
		--Validation to know if the faculty you want to update exists.
		BEGIN
			UPDATE 
				Group.TB_Group
			SET
				Group_Number=@Param_Group_Number,
				Students_Enrolled=@Param_Students_Enrolled,
				Subject_ID=@Param_Subject_ID,
				Modality_ID=@Param_Modality_ID
			WHERE Group_ID=@Param_Group_ID;
		END
		ELSE
		BEGIN
			SELECT 'The Group does not exist in the DB'
		END
	END TRY
	BEGIN CATCH
		SELECT ERROR_PROCEDURE() AS [PROCEDURE]
		SELECT ERROR_MESSAGE() AS ERROR
	END CATCH
END