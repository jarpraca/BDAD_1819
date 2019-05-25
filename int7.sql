PRAGMA foreign_keys = ON;

.mode	columns
.headers	on
.nullvalue	NULL

SELECT mes , cidade, max(sum) AS numReservas
FROM (SELECT strftime('%m', Reserva.dataCheckIn) mes, Cidade.nome cidade, count(*) sum
      FROM  Cidade, Reserva, Habitacao
      WHERE (Reserva.idHabitacao = Habitacao.idHabitacao AND Habitacao.idCidade = Cidade.idCidade) 
      GROUP BY  mes, cidade)
GROUP BY mes;
