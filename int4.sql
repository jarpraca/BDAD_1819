PRAGMA foreign_keys = ON;

.mode	columns
.headers	on
.nullvalue	NULL

SELECT DISTINCT idHabitacao, precoNoite*(JulianDay('2019-07-30') - JulianDay('2019-07-25'))+taxaLimpeza AS precoT
FROM (Habitacao NATURAL JOIN Disponivel) AS P
WHERE idCidade = 7 AND maxHospedes >= 2 AND data >= '2019-07-25' AND data <= '2019-07-30'
ORDER BY precoT;