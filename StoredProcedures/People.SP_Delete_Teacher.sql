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
-- Description:	<Store procedure for delete datas>
-- =============================================
-- Store procedure for deleting data in the table named People.TB_Teacher
CREATE PROCEDURE People.SP_Delete_Teacher
    @param_ID_Teacher VARCHAR(10)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM People.TB_Teacher WHERE ID_Teacher = @param_ID_Teacher)
    BEGIN
        DELETE FROM People.TB_Teacher WHERE ID_Teacher = @param_ID_Teacher
    END
END
GO
