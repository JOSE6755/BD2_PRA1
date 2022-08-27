CREATE TRIGGER Historial_CourseAssignment_Insert
ON practica1.CourseAssignment
FOR INSERT
AS
BEGIN
	INSERT INTO practica1.HistoryLog ([Date],
									  [Description])
							   values (GETDATE(),
									   'Se inserto una nueva asignacion de curso')
END;

CREATE TRIGGER Historial_CourseAssignment_Update
ON practica1.CourseAssignment
FOR UPDATE
AS
BEGIN
	INSERT INTO practica1.HistoryLog ([Date],
									  [Description])
							   values (GETDATE(),
									   'Se actualizo una asignacion de curso')
END;

CREATE TRIGGER Historial_CourseAssignment_Delete
ON practica1.CourseAssignment
FOR DELETE
AS
BEGIN
	INSERT INTO practica1.HistoryLog ([Date],
									  [Description])
							   values (GETDATE(),
									   'Se elimino una asignacion de curso')
END