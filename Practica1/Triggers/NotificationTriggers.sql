CREATE TRIGGER Historial_Notification_Insert
ON practica1.Notification
FOR INSERT
AS
BEGIN
	INSERT INTO practica1.HistoryLog ([Date],
									  [Description])
							   values (GETDATE(),
									   'Se inserto una nueva notificacion')
END;

CREATE TRIGGER Historial_Notification_Update
ON practica1.Notification
FOR UPDATE
AS
BEGIN
	INSERT INTO practica1.HistoryLog ([Date],
									  [Description])
							   values (GETDATE(),
									   'Se actualizo una notificacion')
END;

CREATE TRIGGER Historial_Notification_Delete
ON practica1.Notification
FOR DELETE
AS
BEGIN
	INSERT INTO practica1.HistoryLog ([Date],
									  [Description])
							   values (GETDATE(),
									   'Se elimino una notification')
END