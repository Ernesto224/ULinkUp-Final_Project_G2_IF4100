-- Author: Kendall Sanchez Chinchilla
-- Create date: 10/24/2023
-- Description: SP to insert new data about Buildings into the TB_Building table, belonging to the Building schema.

CREATE PROCEDURE Building.SP_Insert_Building
    -- Add the parameters for the stored procedure here
    @Param_Building_Name VARCHAR(100),
    @Param_Building_Location VARCHAR(100),
    @Param_Faculty BIT NULL,
    @Param_Enclosure_ID INT,
    @Param_Faculty_ID VARCHAR(10) NULL
AS
BEGIN
    BEGIN TRY
	
		IF @Param_Faculty != NULL AND NOT EXISTS(SELECT TOP 1 1 FROM Faculty.TB_Faculty WHERE Faculty_ID = @Param_Faculty_ID)
		BEGIN 
			SELECT ERROR_PROCEDURE() AS [PROCEDURE]
			SELECT ERROR_MESSAGE() AS ERROR
			RETURN;
		END
		
		INSERT INTO Building.TB_Building
		(
			Building_NAME,
			Building_LOCATION,
			FACULTY,
			ENCLOSURE_ID,
			FACULTY_ID
		)
		VALUES
		(
			@Param_Building_Name,
			@Param_Building_Location,
			@Param_Faculty,
			@Param_Enclosure_ID,
			@Param_Faculty_ID
		);
        
    END TRY
    BEGIN CATCH
        SELECT ERROR_PROCEDURE() AS [PROCEDURE]
        SELECT ERROR_MESSAGE() AS ERROR
    END CATCH
END;
