PRAGMA foreign_keys = ON;

.mode	columns
.headers	on
.nullvalue	NULL

DECLARE mes  = (SELECT strftime('%m', Reserva.dataCheckIn) 
                                    FROM Reserva)
                                    
SELECT Reserva.idReserva, Ciade.nome, mes 
FROM  Cidade, Reserva, Habitacao
WHERE ( Reserva.idHabitacao = Habitacao.idHabitacao AND Habitacao.idCidade = Cidade.idCidade)
GROUP BY mes