-- Insert a new school
--REVISADO
CREATE OR ALTER PROCEDURE [School].[SP_Insert_School]
    @Param_Name_School VARCHAR(50),
	@Param_School_abbrev VARCHAR(10) NULL,
    @Param_Description_School VARCHAR(100),
	@Param_Faculty_ID INT
AS
BEGIN
    BEGIN TRY
        INSERT INTO School.TB_School 
        (
            School_Name,
			School_abbrev,
            School_Description,
			Faculty_ID
        )
        VALUES 
        (
			@Param_Name_School,
			ISNULL(@Param_School_abbrev, NULL),
			@Param_Description_School,
			@Param_Faculty_ID
        );
    END TRY
    BEGIN CATCH
        SELECT ERROR_PROCEDURE() AS [PROCEDURE];
        SELECT ERROR_MESSAGE() AS ERROR;
    END CATCH
END;


