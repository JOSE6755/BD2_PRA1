CREATE TRIGGER Historial_ProfileStudent_Insert
ON practica1.ProfileStudent
FOR INSERT
AS
BEGIN
	INSERT INTO practica1.HistoryLog ([Date],
									  [Description])
							   values (GETDATE(),
									   'Se inserto un nuevo perfil de estudiante')
END;

CREATE TRIGGER Historial_ProfileStudent_Update
ON practica1.ProfileStudent
FOR UPDATE
AS
BEGIN
	INSERT INTO practica1.HistoryLog ([Date],
									  [Description])
							   values (GETDATE(),
									   'Se actualizo un perfil de estudiante')
END;

CREATE TRIGGER Historial_ProfileStudent_Delete
ON practica1.ProfileStudent
FOR DELETE
AS
BEGIN
	INSERT INTO practica1.HistoryLog ([Date],
									  [Description])
							   values (GETDATE(),
									   'Se elimino un perfil de estudiante')
END