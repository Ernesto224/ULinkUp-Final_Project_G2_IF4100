-- Author: Nubia Brenes Valerín
-- Create date: 10/24/2023
-- Description: SP to Update data about Group into the TB_Group table, belonging to the Group schema.

CREATE PROCEDURE [Group].SP_Update_Group
	-- Add the parameters for the stored procedure here
	@Param_Group_ID INT,
	@Param_Group_Number INT,
	@Param_Students_Enrolled INT,
	@Param_Subject_ID INT,
	@Param_Modality_ID INT  
AS
BEGIN
	BEGIN TRY
		IF EXISTS(SELECT TOP 1 1 
			FROM [Group].TB_Group 
			WHERE Group_ID=@Param_Group_ID)
		--Validation to know if the Group you want to update exists.
		BEGIN
			UPDATE 
				[Group].TB_Group
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
