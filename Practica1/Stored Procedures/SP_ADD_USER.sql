USE [BD2]
GO

/****** Object:  StoredProcedure [dbo].[SP_ADD_USER]    Script Date: 8/27/2022 12:02:35 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


/*

Execution script:

USE [BD2]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[SP_ADD_USER]
		@FirstName = N'Kevin',
		@LastName = N'Samayoa',
		@Email = N'alejandro.sanchez@gmail.com',
		@DateOfBirt = '1992-11-18',
		@Password = N'olaKAse',
		@Credits = 207

SELECT	'Return Value' = @return_value

GO

*/

CREATE PROCEDURE [dbo].[SP_ADD_USER] 
(
	@FirstName nvarchar(max),
	@LastName nvarchar(max),
	@Email nvarchar(max),
	@DateOfBirt datetime2(7),
	@Password nvarchar(max),
	@Credits int
)
AS
 
 DECLARE @UserID uniqueidentifier
 DECLARE @RoleID uniqueidentifier

--if Email is not already linked to another user, we proceed to register it
IF NOT EXISTS ( SELECT 1 FROM practica1.Usuarios t WHERE t.Email = @Email)
BEGIN
	
	--We generate a new unique identifier for the user
	SET @UserID = NEWID()

	BEGIN TRANSACTION
		BEGIN TRY
			--Insert the record to the Usuarios table
			INSERT INTO practica1.Usuarios (Id, Firstname, LastName, Email, DateOfBirth, [Password], LastChanges, EmailConfirmed)
									values (@UserID, @FirstName, @LastName, @Email, @DateOfBirt, @Password, GETDATE(), 0)
	
			--Then we insert the ProfileStudent record
			INSERT INTO practica1.ProfileStudent (UserId, Credits)
										  values (@UserID, @Credits)

			--Then we insert the UsuarioRole record, but first we need to get the uniqueid for the student role

			SELECT @RoleID = Id 
			FROM practica1.Roles 
			WHERE RoleName = 'Student'

			INSERT INTO practica1.UsuarioRole (RoleId, UserId, IsLatestVersion)
									   values (@RoleID, @UserID, 1)

			--We insert in the TFA table

			INSERT INTO practica1.TFA (UserId, [Status], LastUpdate)
							   values (@UserID, 0, GETDATE())

			--And finally we insert the notification to be sent to the user

			INSERT INTO practica1.Notification (UserId, [Message], [Date])
										values (@UserID, 'Su proceso de registro ha sido completo satisfactoriamente.', GETDATE())

			PRINT 'Usuario creado exitosamente!'

			COMMIT TRANSACTION
		END TRY
		BEGIN CATCH
			ROLLBACK TRANSACTION
		END CATCH
END
ELSE
BEGIN
	PRINT 'Ya existe un usuario con el correo indicado'
END

GO


