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
-- Create date: <20-10-2023>
-- Description:	<inserting data into the table named People.TB_Group_Teacher>
-- =============================================
-- Create procedure for inserting data into the table named People.TB_Group_Teacher
CREATE PROCEDURE People.SP_Insert_Group_Teacher
    @param_Id_Teacher VARCHAR(20),
    @param_Group_ID INT
AS
BEGIN
    INSERT INTO People.TB_Group_Teacher (Id_Teacher, Group_ID)
    VALUES (@param_Id_Teacher, @param_Group_ID)
END

GO
