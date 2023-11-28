-- Update school information
--REVISADO
CREATE OR ALTER PROCEDURE School.SP_Update_School
    @Param_ID_School INT,
    @Param_Name_School VARCHAR(20) NULL,
	@Param_School_abbrev VARCHAR(10) NULL,
    @Param_Description_School VARCHAR(100) NULL,
	@Param_FacultyID INT
AS
BEGIN
    BEGIN TRY
        IF EXISTS (SELECT TOP 1 1 FROM School.TB_School WHERE School_ID = @Param_ID_School AND Erased = 0)
        BEGIN
            UPDATE School.TB_School
            SET
                School_Name = ISNULL(@Param_Name_School, School_Name),
				School_abbrev = ISNULL(@Param_School_abbrev, School_abbrev),
				School_Description = ISNULL(@Param_Description_School, School_Description),
				Faculty_ID = ISNULL(@Param_FacultyID,Faculty_ID)
            WHERE School_ID = @Param_ID_School;
        END
        ELSE
        BEGIN
            SELECT 'The school does not exist in the DB';
        END
    END TRY
    BEGIN CATCH
        SELECT ERROR_PROCEDURE() AS [PROCEDURE];
        SELECT ERROR_MESSAGE() AS ERROR;
    END CATCH
END;
