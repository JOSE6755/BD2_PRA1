CREATE TRIGGER Historial_Roles_Insert
ON practica1.Roles
FOR INSERT
AS
BEGIN
	INSERT INTO practica1.HistoryLog ([Date],
									  [Description])
							   values (GETDATE(),
									   'Se inserto un nuevo rol')
END;

CREATE TRIGGER Historial_Roles_Update
ON practica1.Roles
FOR UPDATE
AS
BEGIN
	INSERT INTO practica1.HistoryLog ([Date],
									  [Description])
							   values (GETDATE(),
									   'Se actualizo un rol')
END;

CREATE TRIGGER Historial_Roles_Delete
ON practica1.Roles
FOR DELETE
AS
BEGIN
	INSERT INTO practica1.HistoryLog ([Date],
									  [Description])
							   values (GETDATE(),
									   'Se elimino un rol')
END