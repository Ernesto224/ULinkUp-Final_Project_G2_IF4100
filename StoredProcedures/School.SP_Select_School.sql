-- =============================================
-- Author:		<Kendall Sánchez>
-- Create date: <12/21/2023>
-- Description:	<SP to select 
--data from the TB_School, belonging 
--to the Subject schema.>
-- =============================================

CREATE PROCEDURE School.SP_Select_School
AS
BEGIN
	BEGIN TRY

		SELECT School_ID, 
			School_Name,
            School_abbrev,
            School_Description,
            Faculty_ID
		FROM School.TB_School
		WHERE Erased = 1

	END TRY
	BEGIN CATCH

		SELECT ERROR_PROCEDURE() AS [PROCEDURE], SELECT ERROR_MESSAGE() AS ERROR

END CATCH
END