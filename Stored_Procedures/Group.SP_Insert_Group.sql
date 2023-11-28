-- Author: Nubia Brenes Valerín
-- Create date: 10/24/2023
-- Description: SP to Insert data about Group into the TB_Group table, belonging to the Group schema.
--REVISADO
CREATE OR ALTER PROCEDURE [Group].SP_Insert_Group 
	-- Add the parameters for the stored procedure here
	@Param_Group_Number           INT,
	@Param_Students_Enrolled      INT NULL,
	@Param_Subject_ID             INT,
	@Param_Modality_ID            INT

AS
BEGIN
	BEGIN TRY
		IF EXISTS(SELECT TOP 1 1 FROM Subject.TB_Subject WHERE Subject_ID = @Param_Subject_ID AND Erased = 0)
		AND EXISTS(SELECT TOP 1 1 FROM Modality.TB_Modality WHERE Modality_ID = @Param_Modality_ID AND Erased = 0)
		BEGIN

			IF @Param_Students_Enrolled IS NULL
			BEGIN
				INSERT INTO [Group].TB_Group
				(		
					Group_Number,
					Subject_ID,
					Modality_ID 
				)VALUES
				(
					@Param_Group_Number,
					@Param_Subject_ID,
					@Param_Modality_ID         
				);
			END
			ELSE
			BEGIN
				INSERT INTO [Group].TB_Group
				(		
					Group_Number,
					Students_Enrolled,
					Subject_ID,
					Modality_ID 
				)VALUES
				(
					@Param_Group_Number,
					@Param_Students_Enrolled,
					@Param_Subject_ID,
					@Param_Modality_ID         
				);
			END
			
		END
		ELSE
		BEGIN
			SELECT 'The Subject_ID or Modality_ID invalid'
		END
	END TRY
	BEGIN CATCH
		SELECT ERROR_PROCEDURE() AS [PROCEDURE]
		SELECT ERROR_MESSAGE() AS ERROR
	END CATCH
END
