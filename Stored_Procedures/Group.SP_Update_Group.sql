-- Author: Nubia Brenes Valerín
-- Create date: 10/24/2023
-- Description: SP to Update data about Group into the TB_Group table, belonging to the Group schema.
--REVISADO
CREATE OR ALTER PROCEDURE [Group].SP_Update_Group
	-- Add the parameters for the stored procedure here
	@Param_Group_ID INT,
	@Param_Group_Number INT NULL,
	@Param_Students_Enrolled INT NULL,
	@Param_Modality_ID INT NULL 
AS
BEGIN
	BEGIN TRY
		IF EXISTS(SELECT TOP 1 1 
			FROM [Group].TB_Group 
			WHERE Group_ID=@Param_Group_ID AND Erased = 0)
		--Validation to know if the Group you want to update exists.
		BEGIN

			IF @Param_Modality_ID IS NULL
			BEGIN
				UPDATE 
					[Group].TB_Group
				SET
					Group_Number=ISNULL(@Param_Group_Number,Group_Number),
					Students_Enrolled=ISNULL(@Param_Students_Enrolled, Students_Enrolled)
				WHERE Group_ID=@Param_Group_ID
			END
			ELSE IF EXISTS(SELECT TOP 1 1 FROM Modality.TB_Modality WHERE Modality_ID = @Param_Modality_ID AND Erased = 0)
			BEGIN
				UPDATE 
					[Group].TB_Group
				SET
					Group_Number=ISNULL(@Param_Group_Number,Group_Number),
					Students_Enrolled=ISNULL(@Param_Students_Enrolled, Students_Enrolled),
					Modality_ID=ISNULL(@Param_Modality_ID,Modality_ID)
				WHERE Group_ID=@Param_Group_ID
			END
	
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
