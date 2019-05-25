PRAGMA foreign_keys = ON;

CREATE TRIGGER Disponibilidade
AFTER INSERT ON Reserva
FOR EACH ROW
BEGIN
    DELETE FROM Disponivel
    WHERE Disponivel.habitacao = New.habitacao AND Disponivel.data >= New.dataCheckIn AND Disponivel.data <= New.dataCheckOut;
END;