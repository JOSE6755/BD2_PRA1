CREATE TRIGGER Historial_TFA_Insert
ON practica1.TFA
FOR INSERT
AS
BEGIN
	INSERT INTO practica1.HistoryLog ([Date],
									  [Description])
							   values (GETDATE(),
									   'Se inserto un nuevo TFA')
END;

CREATE TRIGGER Historial_TFA_Update
ON practica1.TFA
FOR UPDATE
AS
BEGIN
	INSERT INTO practica1.HistoryLog ([Date],
									  [Description])
							   values (GETDATE(),
									   'Se actualizo un TFA')
END;

CREATE TRIGGER Historial_TFA_Delete
ON practica1.TFA
FOR DELETE
AS
BEGIN
	INSERT INTO practica1.HistoryLog ([Date],
									  [Description])
							   values (GETDATE(),
									   'Se elimino un TFA')
END