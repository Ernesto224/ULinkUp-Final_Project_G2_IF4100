-- Author: Kendall Sanchez Chinchilla
-- Create date: 10/24/2023
-- Description: SP to insert new data about Buildings into the TB_Building table, belonging to the Building schema.
USE
IF4100_C10767
GO
--En revision
CREATE OR ALTER PROCEDURE Building.SP_Insert_Building
    -- Add the parameters for the stored procedure here
    @Param_Building_Name VARCHAR(100),
    @Param_Building_Location VARCHAR(100),
    @Param_Faculty BIT NULL,
    @Param_Enclosure_ID INT,
    @Param_Faculty_ID INT NULL
AS
BEGIN
    BEGIN TRY
	--PENDIENTE, cuando el  @Param_Faculty es 0, entonces no se debe poder agregar el id de faculty.
		IF @Param_Faculty != NULL AND NOT EXISTS(SELECT TOP 1 1 FROM Faculty.TB_Faculty WHERE Faculty_ID = @Param_Faculty_ID AND Erased = 0)
		BEGIN 
			SELECT ERROR_PROCEDURE() AS [PROCEDURE]
			SELECT ERROR_MESSAGE() AS ERROR
			RETURN;
		END
		
		IF @Param_Faculty = 0
			INSERT INTO Building.TB_Building
			(
				Building_Name,
				Building_Location,
				Faculty,
				Enclosure_ID,
				Faculty_ID
			)
			VALUES
			(
				@Param_Building_Name,
				@Param_Building_Location,
				@Param_Faculty,
				@Param_Enclosure_ID,
				NULL
			);
		ELSE
		BEGIN
			INSERT INTO Building.TB_Building
			(
				Building_Name,
				Building_Location,
				Faculty,
				Enclosure_ID,
				Faculty_ID
			)
			VALUES
			(
				@Param_Building_Name,
				@Param_Building_Location,
				@Param_Faculty,
				@Param_Enclosure_ID,
				@Param_Faculty_ID
			);
		END;
        
    END TRY
    BEGIN CATCH
        SELECT ERROR_PROCEDURE() AS [PROCEDURE]
        SELECT ERROR_MESSAGE() AS ERROR
    END CATCH
END;
