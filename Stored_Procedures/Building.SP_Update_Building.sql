-- Author: Kendall Sanchez Chinchilla
-- Create date: 10/24/2023
-- Description: SP to update data about Buildings in the TB_Building table, belonging to the Building schema.

CREATE PROCEDURE Building.SP_Update_Building
    -- Add the parameters for the stored procedure here
    @Param_Building_ID INT, -- Unique numeric identifier for the Building
    @Param_Building_Name VARCHAR(100) NULL, -- Name of the Building
    @Param_Building_Location VARCHAR(100) NULL, -- Location of the Building
    @Param_Faculty BIT NULL, -- Faculty indicator (can be null)
    @Param_Enclosure_ID INT NULL, -- Enclosure identifier (can be null)
    @Param_Faculty_ID VARCHAR(10) NULL -- Faculty identifier (can be null)
AS
BEGIN
    BEGIN TRY
        IF EXISTS (SELECT TOP 1 1 FROM Building.TB_Building WHERE Building_ID = @Param_Building_ID)
        -- Validation to check if the Building you want to update exists.
        BEGIN
            UPDATE Building.TB_Building
            SET
                Building_Name = ISNULL(@Param_Building_Name, Building_Name),
                Building_Location = ISNULL(@Param_Building_Location, Building_Location),
                Faculty = ISNULL(@Param_Faculty, FACULTY),
                Enclosure_ID = ISNULL((SELECT Enclosure_ID FROM Enclosure.TB_Enclosure WHERE Enclosure_ID = @Param_Enclosure_ID), Enclosure_ID),
                Faculty_ID = ISNULL((SELECT Faculty_ID FROM Faculty.TB_Faculty WHERE Faculty_ID = @Param_Faculty_ID), Faculty_ID)
            WHERE Building_ID = @Param_Building_ID;
        END
        ELSE
        BEGIN
            SELECT 'The Building does not exist in the DB';
        END
    END TRY
    BEGIN CATCH
        SELECT ERROR_PROCEDURE() AS [PROCEDURE];
        SELECT ERROR_MESSAGE() AS ERROR;
    END CATCH
END;
