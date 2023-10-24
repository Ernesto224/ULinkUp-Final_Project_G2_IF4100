-- Author: Kendall Sanchez Chinchilla
-- Create date: 10/24/2023
-- Description: SP to insert new data about buildings into the TB_BUILDING table, belonging to the BUILDING schema.

CREATE PROCEDURE BUILDING.SP_Insert_Building
    -- Add the parameters for the stored procedure here
    @Param_Building_ID INT,
    @Param_Building_Name VARCHAR(100),
    @Param_Building_Location VARCHAR(100),
    @Param_Faculty BIT,
    @Param_Enclosure_ID INT,
    @Param_Faculty_ID VARCHAR(10)
AS
BEGIN
    BEGIN TRY
        INSERT INTO BUILDING.TB_BUILDING
        (
            BUILDING_ID,
            BUILDING_NAME,
            BUILDING_LOCATION,
            FACULTY,
            ENCLOSURE_ID,
            FACULTY_ID
        )
        VALUES
        (
            @Param_Building_ID,
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
