CREATE TRIGGER Historial_TutorProfile_Insert
ON practica1.TutorProfile
FOR INSERT
AS
BEGIN
	INSERT INTO practica1.HistoryLog ([Date],
									  [Description])
							   values (GETDATE(),
									   'Se inserto un nuevo perfil de tutor')
END;

CREATE TRIGGER Historial_TutorProfile_Update
ON practica1.TutorProfile
FOR UPDATE
AS
BEGIN
	INSERT INTO practica1.HistoryLog ([Date],
									  [Description])
							   values (GETDATE(),
									   'Se actualizo un perfil de tutor')
END;

CREATE TRIGGER Historial_TutorProfile_Delete
ON practica1.TutorProfile
FOR DELETE
AS
BEGIN
	INSERT INTO practica1.HistoryLog ([Date],
									  [Description])
							   values (GETDATE(),
									   'Se elimino un perfil de tutor')
END