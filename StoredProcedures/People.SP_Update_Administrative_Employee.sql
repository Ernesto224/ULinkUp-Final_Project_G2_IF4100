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
-- Create date: <06/11/2023>
-- Description:	<Stored procedure to update data into the Administrative_Employee table>
-- =============================================
	--Store procedure for update datas in the table named People.TB_Administrative_Employee
	CREATE PROCEDURE SP_UPDATE_Administrative_Employee
		@param_Position VARCHAR(200) NULL,
		@param_Job_Description Varchar(1000) NULL,
		@param_Salary INT NULL,
		@param_People_ID INT NULL,
		@param_Erased BIT NULL
	AS
	BEGIN
		IF EXISTS(SELECT TOP 1 1 FROM People.TB_Administrative_Employee WHERE People_ID = @param_People_ID)
		BEGIN
			UPDATE FROM People.TB_Administrative_Employee SET Position = @param_Position,
			Job_Description = @param_Job_Description ,
			Salary = @param_Salary,
			Erased = @param_Erased
			WHERE People_ID = @param_People_ID
		END
	
	END
GO
