-- Author: Kendall Sanchez Chinchilla
-- Create date: 10/24/2023
-- Description: SP to update data about buildings in the TB_BUILDING table, belonging to the BUILDING schema.

CREATE PROCEDURE BUILDING.SP_Update_Building
    -- Add the parameters for the stored procedure here
    @Param_Building_ID INT, -- Unique numeric identifier for the building
    @Param_Building_Name VARCHAR(100) NULL, -- Name of the building
    @Param_Building_Location VARCHAR(100) NULL, -- Location of the building
    @Param_Faculty BIT NULL, -- Faculty indicator (can be null)
    @Param_Enclosure_ID INT NULL, -- Enclosure identifier (can be null)
    @Param_Faculty_ID VARCHAR(10) NULL -- Faculty identifier (can be null)
AS
BEGIN
    BEGIN TRY
        IF EXISTS (SELECT TOP 1 1 FROM BUILDING.TB_BUILDING WHERE BUILDING_ID = @Param_Building_ID)
        -- Validation to check if the building you want to update exists.
        BEGIN
            UPDATE BUILDING.TB_BUILDING
            SET
                BUILDING_NAME = ISNULL(@Param_Building_Name, BUILDING_NAME),
                BUILDING_LOCATION = ISNULL(@Param_Building_Location, BUILDING_LOCATION),
                FACULTY = ISNULL(@Param_Faculty, FACULTY),
                ENCLOSURE_ID = ISNULL(@Param_Enclosure_ID, ENCLOSURE_ID),
                FACULTY_ID = ISNULL(@Param_Faculty_ID, FACULTY_ID)
            WHERE BUILDING_ID = @Param_Building_ID;
        END
        ELSE
        BEGIN
            SELECT 'The building does not exist in the DB';
        END
    END TRY
    BEGIN CATCH
        SELECT ERROR_PROCEDURE() AS [PROCEDURE];
        SELECT ERROR_MESSAGE() AS ERROR;
    END CATCH
END;
