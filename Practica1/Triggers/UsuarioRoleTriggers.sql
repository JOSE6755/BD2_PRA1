CREATE TRIGGER Historial_UsuarioRole_Insert
ON practica1.UsuarioRole
FOR INSERT
AS
BEGIN
	INSERT INTO practica1.HistoryLog ([Date],
									  [Description])
							   values (GETDATE(),
									   'Se inserto un nuevo rol a un usuario')
END;

CREATE TRIGGER Historial_UsuarioRole_Update
ON practica1.UsuarioRole
FOR UPDATE
AS
BEGIN
	INSERT INTO practica1.HistoryLog ([Date],
									  [Description])
							   values (GETDATE(),
									   'Se actualizo el rol a un usuario')
END;

CREATE TRIGGER Historial_UsuarioRole_Delete
ON practica1.UsuarioRole
FOR DELETE
AS
BEGIN
	INSERT INTO practica1.HistoryLog ([Date],
									  [Description])
							   values (GETDATE(),
									   'Se elimino un rol a un usuario')
END