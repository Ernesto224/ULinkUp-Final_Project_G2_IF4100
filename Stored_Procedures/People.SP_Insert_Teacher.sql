-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Jesner Melgara>
-- Create date: <25-10-2023>
-- Description:	<Store procedure for insert datas>
-- =============================================
-- Store procedure for insert data into the table named People.TB_Teacher
CREATE PROCEDURE People.SP_Insert_Teacher
    @param_ID_Teacher VARCHAR(10),
    @param_Date_Admission DATE,
    @param_Salary_Teacher INT,
    @param_ID_People INT,
    @param_Erased BIT
AS
BEGIN
    INSERT INTO People.TB_Teacher (
        ID_Teacher,
        Date_Admission,
        Salary_Teacher,
        ID_People,
        Erased
    )
    VALUES (
        @param_ID_Teacher,
        @param_Date_Admission,
        @param_Salary_Teacher,
        @param_ID_People,
        @param_Erased
    )
END
GO
