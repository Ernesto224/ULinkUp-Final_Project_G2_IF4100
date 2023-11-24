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
-- Description:	<Selecting data into the table named People.TB_Career_Student>
-- =============================================
-- Create procedure for selecting data from the table named People.TB_Career_Student
CREATE PROCEDURE People.SP_Select_Career_Student
AS
BEGIN
    SELECT Career_ID, Student_ID
    FROM People.TB_Career_Student
END

GO
