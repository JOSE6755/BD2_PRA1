USE [BD2]
GO

/****** Object:  StoredProcedure [dbo].[SP_ADD_ROLE]    Script Date: 8/27/2022 11:59:58 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


/*

Execution script:

USE [BD2]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[SP_ADD_ROLE]
		@RoleName = N'Tutor2'

SELECT	'Return Value' = @return_value

GO
*/

CREATE PROCEDURE [dbo].[SP_ADD_ROLE] 
(
	@RoleName nvarchar(max)
)
AS
 
 DECLARE @RoleID uniqueidentifier

--if role doesn´t exist, we proceed to create it
IF NOT EXISTS (SELECT 1 FROM practica1.Roles t WHERE t.RoleName = @RoleName)
BEGIN
	SET @RoleID = NEWID()

	BEGIN TRANSACTION
	BEGIN TRY
		INSERT INTO practica1.Roles (Id, RoleName)
							 values (@RoleID, @RoleName)

		PRINT 'Rol creado exitosamente!'

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
	END CATCH

END
ELSE
BEGIN
	PRINT 'Ya existe un rol con el mismo nombre'
END

GO


