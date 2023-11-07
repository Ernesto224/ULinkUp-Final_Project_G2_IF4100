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
-- Description:	<updating data into the table named People.TB_Group_Teacher>
-- =============================================
-- Create procedure for updating data in the table named People.TB_Group_Teacher
CREATE PROCEDURE People.SP_Update_Group_Teacher
    @param_Id_Teacher VARCHAR(20),
    @param_Group_ID INT
AS
BEGIN
    UPDATE People.TB_Group_Teacher
    SET Group_ID = @param_Group_ID
    WHERE Id_Teacher = @param_Id_Teacher
END

GO
