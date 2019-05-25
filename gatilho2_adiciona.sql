PRAGMA foreign_keys = ON;

CREATE TRIGGER Classificacao
AFTER INSERT ON ClassificacaoPorCliente
FOR EACH ROW
BEGIN
    UPDATE Anfitriao
    SET classificacaoAnfitriao = (
        SELECT AVG(classificacaoAnfitriao)
        --FROM (ClassificacaoPorCliente NATURAL JOIN (Reserva NATURAL JOIN (Habitacao NATURAL JOIN Possui))) AS E
        --WHERE E.
        FROM ClassificacaoPorCliente
        --WHERE Anfitriao.id = (SELECT anfitriao FROM Possui WHERE Possui.habitacao = (SELECT habitacao FROM Reserva WHERE Reserva.id = New.reserva))
        WHERE ClassificacaoPorCliente.reserva = (SELECT reserva FROM Habitacao WHERE Habitacao.id = (SELECT Habitacao FROM Possui WHERE Possui.anfitriao = Anfitriao.id))
    )
    WHERE Anfitriao.id = (SELECT anfitriao FROM Possui WHERE Possui.habitacao = (SELECT habitacao FROM Reserva WHERE Reserva.id = New.reserva));
    --WHERE ClassificacaoPorCliente.reserva = (SELECT reserva FROM Habitacao WHERE Habitacao.id = (SELECT Habitacao FROM Possui WHERE Possui.anfitriao = Anfitriao.id));
END;