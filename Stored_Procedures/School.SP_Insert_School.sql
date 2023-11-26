-- Insert a new school
CREATE PROCEDURE School.SP_Insert_School
    @Param_Name_School VARCHAR(50),
	@Param_School_abbrev VARCHAR(10) NULL,
    @Param_Description_School VARCHAR(100)
AS
BEGIN
    BEGIN TRY
        INSERT INTO School.TB_School 
        (
            School_Name,
			School_abbrev,
            School_Description
        )
        VALUES 
        (
			@Param_Name_School,
			ISNULL(@Param_School_abbrev, NULL),
			@Param_Description_School
        );
    END TRY
    BEGIN CATCH
        SELECT ERROR_PROCEDURE() AS [PROCEDURE];
        SELECT ERROR_MESSAGE() AS ERROR;
    END CATCH
END;


