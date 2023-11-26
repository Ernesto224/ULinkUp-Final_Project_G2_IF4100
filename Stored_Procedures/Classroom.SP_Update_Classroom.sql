-- Update Classroom data
CREATE PROCEDURE Classroom.SP_Update_Classroom
 -- Add the parameters for the stored procedure here
    @Param_Classroom_ID INT, -- Unique numeric identifier for the Classroom
    @Param_Classroom_Name VARCHAR(50) NULL,--Name from the Classroom
    @Param_Building_ID INT NULL --Building identifier
AS
BEGIN
    BEGIN TRY
        IF EXISTS (SELECT TOP 1 1 FROM Classroom.TB_Classroom WHERE Classroom_ID = @Param_Classroom_ID)
        -- Validation to check if the Classroom you want to update exists.
        BEGIN
            UPDATE Classroom.TB_Classroom
            SET
                Classroom_Name = ISNULL(@Param_Classroom_Name, Classroom_Name),
                Building_ID = ISNULL((SELECT Building_ID FROM Building.TB_Building WHERE Building_ID = @Param_Building_ID), Building_ID)
            WHERE Classroom_ID = @Param_Classroom_ID;
        END
        ELSE
        BEGIN
            SELECT 'The Classroom does not exist in the DB';
        END
    END TRY
    BEGIN CATCH
        SELECT ERROR_PROCEDURE() AS [PROCEDURE];
        SELECT ERROR_MESSAGE() AS ERROR;
    END CATCH
END;
