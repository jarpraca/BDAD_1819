PRAGMA foreign_keys = ON;

.mode	columns
.headers	on
.nullvalue	NULL

SELECT Habitacao.idHabitacao, Cidade.nome AS cidade
FROM Possui, Habitacao, Cidade
WHERE (Cidade.idCidade = Habitacao.idCidade AND Possui.idHabitacao = Habitacao.idHabitacao AND Possui.idAnfitriao = 1)
order by Habitacao.idHabitacao;