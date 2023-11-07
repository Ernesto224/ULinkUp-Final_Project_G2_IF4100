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
-- Create date: <23-10-2023>
-- Description:	<Deleting data into the table named People.TB_Career_Student>
-- =============================================
-- Create procedure for deleting data from the table named People.TB_Career_Student
CREATE PROCEDURE People.SP_Delete_Career_Student
    @param_Career_ID INT,
    @param_Student_ID VARCHAR(10)
AS
BEGIN
    DELETE FROM People.TB_Career_Student
    WHERE Career_ID = @param_Career_ID AND Student_ID = @param_Student_ID
END
GO
