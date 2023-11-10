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
-- Description:	<deleting data into the table named People.TB_Group_Teacher>
-- =============================================
-- Create procedure for deleting data from the table named People.TB_Group_Teacher
CREATE PROCEDURE People.SP_Delete_Group_Teacher
    @param_Id_Teacher VARCHAR(20)
AS
BEGIN
    DELETE FROM People.TB_Group_Teacher
    WHERE Id_Teacher = @param_Id_Teacher
END

GO
