USE [BD2]
GO

/****** Object:  StoredProcedure [dbo].[SP_ADD_TUTOR]    Script Date: 8/27/2022 12:05:09 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


/*

Execution script:

USE [BD2]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[SP_ADD_TUTOR]
		@Email = N'alejandro.sanchez@gmail.com',
		@CourseCodCourse = 1

SELECT	'Return Value' = @return_value

GO

*/

CREATE PROCEDURE [dbo].[SP_ADD_TUTOR] 
(
	@Email nvarchar(max),
	@CourseCodCourse int
)
AS
 
 DECLARE @UserID uniqueidentifier
 DECLARE @RoleID uniqueidentifier
 DECLARE @EmailConfirmed bit

--if Email is linked to a user, we proceed
IF EXISTS ( SELECT 1 FROM practica1.Usuarios t WHERE t.Email = @Email)
BEGIN

	--We get the id for the user based on the Email
	SELECT @UserID = Id, @EmailConfirmed = EmailConfirmed
	FROM practica1.Usuarios
	WHERE Email = @Email
	
	--If the email is valid, we validate if it has been confirmed
	IF @EmailConfirmed = 1
	BEGIN
		--finally, if the course exists we proceed with the assignment
		IF EXISTS (SELECT 1 FROM practica1.Course WHERE CodCourse = @CourseCodCourse)
		BEGIN
			
			BEGIN TRANSACTION
			BEGIN TRY
				--Then we insert the TutorProfile record
				INSERT INTO practica1.TutorProfile (UserId, TutorCode)
											values (@UserID, NEWID())

				--Then we insert the UsuarioRole record, but first we need to get the uniqueid for the student role

				SELECT @RoleID = Id 
				FROM practica1.Roles 
				WHERE RoleName = 'Tutor'

				INSERT INTO practica1.UsuarioRole (RoleId, UserId, IsLatestVersion)
										   values (@RoleID, @UserID, 1)

				--Then we insert the CourseTutor record
				INSERT INTO practica1.CourseTutor (TutorId, CourseCodCourse)
										   values (@UserID, @CourseCodCourse)

				--And finally we insert the notification to be sent to the user

				INSERT INTO practica1.Notification (UserId, [Message], [Date])
											values (@UserID, 'Su proceso de registro como tutor ha sido completo satisfactoriamente.', GETDATE())

				PRINT 'Tutor creado exitosamente!'

				COMMIT TRANSACTION
			END TRY
			BEGIN CATCH
				ROLLBACK TRANSACTION
			END CATCH
		END
		ELSE
		BEGIN
			PRINT 'No existe un curso asociado al codigo de curso proporcionado.'
		END
	END
	ELSE
	BEGIN
		PRINT 'El correo del usuario a registrar como tutor no ha sido confirmado, porfavor confirmarlo primero.'
	END
END
ELSE
BEGIN
	PRINT 'El correo electronico proporcionado no pertenece a un usuario valido.'
END

GO


