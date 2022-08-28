CREATE FUNCTION FUNC_COURSE_USUARIOS 
(@CODCOURSE INT)
RETURNS TABLE
AS
RETURN(
SELECT u.id, u.Firstname, u.Lastname
FROM practica1.Usuarios u 
INNER JOIN practica1.CourseAssignment c on c.StudentId = u.Id
INNER JOIN practica1.Course co on co.CodCourse = c.CourseCodCourse
WHERE c.CourseCodCourse = @CODCOURSE
);
GO
CREATE FUNCTION FUNC_TUTOR_COURSE
(@TUTORID INT)
RETURNS TABLE
AS
RETURN(
SELECT u.Id, u.Firstname, u.Lastname, co.CodCourse, co.Name
FROM practica1.Usuarios u 
INNER JOIN practica1.TutorProfile tp on tp.UserId = u.Id
INNER JOIN practica1.CourseTutor c on c.TutorId = tp.UserId
INNER JOIN practica1.Course co on co.CodCourse = c.CourseCodCourse
WHERE tp.Id = @TUTORID 
);
GO

CREATE FUNCTION FUNC_NOTIFICATION_USUARIOS
(@PR UNIQUEIDENTIFIER)
RETURNS TABLE
AS
RETURN(

SELECT n.*
FROM practica1.Notification n 
INNER JOIN practica1.Usuarios u on n.UserId = u.Id
WHERE n.UserId = @PR
);
GO

CREATE FUNCTION FUNC_LOGGER()
RETURNS TABLE
AS
RETURN(
SELECT * FROM practica1.HistoryLog
);
GO

CREATE FUNCTION FUNC_USUARIOS()
RETURNS TABLE
AS RETURN(
SELECT Firstname, Lastname, Email, DateOfBirth,Credits, RoleName 
FROM practica1.Usuarios as usuarios INNER JOIN practica1.ProfileStudent AS PF ON PF.UserId=usuarios.Id
INNER JOIN practica1.UsuarioRole AS UR ON UR.UserId=usuarios.Id
INNER JOIN practica1.Roles AS R ON R.Id=UR.RoleId
);
GO