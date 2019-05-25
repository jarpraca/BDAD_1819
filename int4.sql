PRAGMA foreign_keys = ON;

.mode	columns
.headers	on
.nullvalue	NULL

--SELECT DISTINCT Habitacao.idHabitacao, Habitacao.precoNoite*('2019-07-30'- '2019-07-02')+Habitacao.taxaLimpeza AS precoTotal
SELECT DISTINCT Habitacao.idHabitacao, Habitacao.precoNoite*7+Habitacao.taxaLimpeza AS precoTotal
FROM  Habitacao, Reserva, Disponivel
WHERE ( Habitacao.idCidade = 7 AND Habitacao.maxHospedes>2  AND Habitacao.numQuartos= 3 AND (Disponivel.idHabitacao= Habitacao.idHabitacao AND Disponivel.data>='2019-07-23' AND Disponivel.data<='2019-07-30'))
order by precoTotal;
