-- Insert a new school
CREATE PROCEDURE SCHOOL.SP_Insert_School
    @Param_ID_School INT,
    @Param_Name_School VARCHAR(20),
    @Param_Description_School VARCHAR(100)
AS
BEGIN
    BEGIN TRY
        INSERT INTO SCHOOL.TB_SCHOOLS 
        (
            ID_School,
            Name_School,
            Description_School
        )
        VALUES 
        (
        @Param_ID_School,
        @Param_Name_School,
        @Param_Description_School
        );
    END TRY
    BEGIN CATCH
        SELECT ERROR_PROCEDURE() AS [PROCEDURE];
        SELECT ERROR_MESSAGE() AS ERROR;
    END CATCH
END;


