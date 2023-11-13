-- =============================================
-- Author:		<Kendall Sánchez>
-- Create date: <12/21/2023>
-- Description:	<SP to select 
--data from the TB_Modality table, belonging 
--to the Subject schema.>
-- =============================================

CREATE PROCEDURE Modality.SP_Select_Modality
AS
BEGIN
	BEGIN TRY

		SELECT Modality_ID, 
			Modality_Name
		FROM Modality.TB_Modality
		WHERE Erased = 1

	END TRY
	BEGIN CATCH

		SELECT ERROR_PROCEDURE() AS [PROCEDURE], SELECT ERROR_MESSAGE() AS ERROR

END CATCH
END