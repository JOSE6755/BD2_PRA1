CREATE TRIGGER Historial_Usuarios_Insert
ON practica1.Usuarios
FOR INSERT
AS
BEGIN
	INSERT INTO practica1.HistoryLog ([Date],
									  [Description])
							   values (GETDATE(),
									   'Se inserto un nuevo usuario')
END;

CREATE TRIGGER Historial_Usuarios_Update
ON practica1.Usuarios
FOR UPDATE
AS
BEGIN
	INSERT INTO practica1.HistoryLog ([Date],
									  [Description])
							   values (GETDATE(),
									   'Se actualizo un usuario')
END;

CREATE TRIGGER Historial_Usuarios_Delete
ON practica1.Usuarios
FOR DELETE
AS
BEGIN
	INSERT INTO practica1.HistoryLog ([Date],
									  [Description])
							   values (GETDATE(),
									   'Se elimino un usuario')
END