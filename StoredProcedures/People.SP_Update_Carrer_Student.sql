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
-- Description:	<Updating data into the table named People.TB_Career_Student>
-- =============================================
-- Create procedure for updating data in the table named People.TB_Career_Student
CREATE PROCEDURE People.SP_Update_Career_Student
    @param_Career_ID INT,
    @param_Student_ID VARCHAR(10)
AS
BEGIN
    UPDATE People.TB_Career_Student
    SET Student_ID = @param_Student_ID
    WHERE Career_ID = @param_Career_ID
END

GO
