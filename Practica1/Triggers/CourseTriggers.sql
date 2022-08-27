CREATE TRIGGER Historial_Course_Insert
ON practica1.Course
FOR INSERT
AS
BEGIN
	INSERT INTO practica1.HistoryLog ([Date],
									  [Description])
							   values (GETDATE(),
									   'Se inserto un nuevo curso')
END;

CREATE TRIGGER Historial_Course_Update
ON practica1.Course
FOR UPDATE
AS
BEGIN
	INSERT INTO practica1.HistoryLog ([Date],
									  [Description])
							   values (GETDATE(),
									   'Se actualizo un curso')
END;

CREATE TRIGGER Historial_Course_Delete
ON practica1.Course
FOR DELETE
AS
BEGIN
	INSERT INTO practica1.HistoryLog ([Date],
									  [Description])
							   values (GETDATE(),
									   'Se elimino un curso')
END;