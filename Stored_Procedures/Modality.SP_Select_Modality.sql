-- =============================================
-- Author:		<Kendall Sánchez>
-- Modified date: <11/18/2023>
-- Description:	<SP to select 
--data from the TB_Modality table, belonging 
--to the Subject schema.>
-- =============================================
--REVISADO
CREATE OR ALTER PROCEDURE Modality.SP_Select_Modality
AS
BEGIN
	BEGIN TRY
		SELECT Modality_ID, 
			Modality_Name
		FROM Modality.TB_Modality
		WHERE Erased = 0
	END TRY
	BEGIN CATCH
		SELECT ERROR_PROCEDURE() AS [PROCEDURE], ERROR_MESSAGE() AS [ERROR]
	END CATCH
END;
