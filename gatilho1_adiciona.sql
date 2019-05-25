PRAGMA foreign_keys = ON;

CREATE TRIGGER Alterar_Estado
BEFORE INSERT ON ClassificacaoPorAnfitriao
FOR EACH ROW
WHEN exists (SELECT * FROM Reserva WHERE Reserva.id = New.reserva AND Reserva.estado != 0)
BEGIN
    SELECT RAISE(IGNORE);
END;