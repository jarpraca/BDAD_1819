PRAGMA foreign_keys = ON;

.mode	columns
.headers	on
.nullvalue	NULL

SELECT Habitacao.idHabitacao, (Habitacao.precoNoite*DATEDIFF(day, Habitacao.dataCheckIn, Habitacao.dataCheckOut)+Habitacao.taxalimpeza)
FROM  Habitacao
WHERE ( Habitacao.idCidade = 1 AND Habitacao.maxHospedes>4  AND Habitacao.numQuartos= 2)
order by Habitacao.idHabitacao;