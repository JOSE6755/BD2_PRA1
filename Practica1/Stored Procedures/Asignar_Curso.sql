CREATE PROCEDURE PRACTICA1.ASIGNACION
@STUDENT NVARCHAR(MAX), @COURSECODE INT
AS
BEGIN
DECLARE @CREDITOS INT;
DECLARE @PROFE UNIQUEIDENTIFIER;
DECLARE @ID UNIQUEIDENTIFIER;
IF (SELECT COUNT(*) FROM practica1.Usuarios WHERE @STUDENT=Email)<1 BEGIN PRINT 'NO EXISTE EL ESTUDIANTE INDICADO' END;
ELSE
    BEGIN
	    IF(SELECT EmailConfirmed FROM practica1.Usuarios WHERE @STUDENT=Email)=0 BEGIN PRINT 'EL USUARIO NO ESTA ACTIVO' END;
	    ELSE
            BEGIN
		        SET @ID=(SELECT Id FROM practica1.Usuarios WHERE @STUDENT=Email);
		        SET @CREDITOS=(SELECT Credits from practica1.ProfileStudent WHERE UserId=@ID);
		        IF(SELECT CreditsRequired FROM practica1.Course WHERE @COURSECODE=CodCourse)>@CREDITOS BEGIN PRINT 'NO CUENTA CON LOS CREDITOS NECESARIOS' END;
		        ELSE
                    BEGIN
                        INSERT INTO PRACTICA1.CourseAssignment(StudentId,CourseCodCourse) VALUES(@ID,@COURSECODE);
                        INSERT INTO practica1.Notification(Date,UserId,Message) VALUES(GETDATE(),@ID,'ASIGNACION EXITOSA!');
                        SET @PROFE=(SELECT TutorId FROM practica1.CourseTutor WHERE CourseCodCourse=@COURSECODE);
                        INSERT INTO practica1.Notification(Date,UserId,Message) VALUES(GETDATE(),@PROFE,'NUEVO ESTUDIANTE ASIGNADO!');
                    END;
            END;
	END;
END;

