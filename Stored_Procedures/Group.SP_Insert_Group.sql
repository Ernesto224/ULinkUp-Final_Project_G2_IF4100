-- Author: Nubia Brenes Valerín
-- Create date: 10/24/2023
-- Description: SP to Insert data about Group into the TB_Group table, belonging to the Group schema.

CREATE PROCEDURE [Group].SP_Insert_Group 
	-- Add the parameters for the stored procedure here
	@Param_Group_ID               INT,
	@Param_Group_Number           INT,
	@Param_Students_Enrolled      INT,
	@Param_Subject_ID             INT,
	@Param_Modality_ID            INT

AS
BEGIN
	BEGIN TRY
		INSERT INTO [Group].TB_Group
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
