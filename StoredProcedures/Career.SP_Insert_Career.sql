-- Author: Nubia Brenes Valerín
CREATE PROCEDURE Career.SP_Insert_Career 
	-- Add the parameters for the stored procedure here
	@Param_Career_ID           INT NOT NULL,
	--@Param_Career_acronym    VARCHAR(10) NOT NULL,
	@Param_Career_Abbrev       VARCHAR(10) NOT NULL,
	@Param_Career_Name         VARCHAR(50) NOT NULL,
	@Param_Career_Description  VARCHAR(500) NOT NULL,
	@Param_Faculty_ID          INT

AS
BEGIN
	BEGIN TRY
		INSERT INTO Career.TB_Career
		(		
			Career_ID,
			--Career_acronym,
			Career_Abbrev,
			Career_Name,
			Career_Description,
			Faculty_ID 
		)VALUES
		(      
			@Param_Career_ID,
			--@Param_Career_acronym,
			@Param_Career_Abbrev,
			@Param_Career_Name,
			@Param_Career_Description,
			@Param_Faculty_ID 
		);
	END TRY
	BEGIN CATCH
		SELECT ERROR_PROCEDURE() AS [PROCEDURE]
		SELECT ERROR_MESSAGE() AS ERROR
	END CATCH
END