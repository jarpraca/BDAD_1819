.mode       columns
.headers    on
.nullvalue  NULL
PRAGMA foreign_keys = ON;

SELECT *
FROM (Reserva NATURAL JOIN Efetua) AS P
WHERE P.idCliente = 1 AND P.idEstado = 1
ORDER BY P.dataCheckIn;