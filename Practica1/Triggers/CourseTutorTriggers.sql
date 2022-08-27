CREATE TRIGGER Historial_CourseTutor_Insert
ON practica1.CourseTutor
FOR INSERT
AS
BEGIN
	INSERT INTO practica1.HistoryLog ([Date],
									  [Description])
							   values (GETDATE(),
									   'Se inserto un nuevo tutor')
END;

CREATE TRIGGER Historial_CourseTutor_Update
ON practica1.CourseTutor
FOR UPDATE
AS
BEGIN
	INSERT INTO practica1.HistoryLog ([Date],
									  [Description])
							   values (GETDATE(),
									   'Se actualizo un tutor')
END;

CREATE TRIGGER Historial_CourseTutor_Delete
ON practica1.CourseTutor
FOR DELETE
AS
BEGIN
	INSERT INTO practica1.HistoryLog ([Date],
									  [Description])
							   values (GETDATE(),
									   'Se elimino un tutor')
END