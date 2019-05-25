.mode       columns
.headers    on
.nullvalue  NULL
PRAGMA foreign_keys = ON;

SELECT data FROM Disponivel WHERE habitacao = 1;
INSERT INTO Reserva(id, dataCheckIn, dataCheckOut, numHospedes, precoTotal, habitacao, estado) VALUES (100, '2019-07-20', '2019-07-27', 6, 260, 1, 1);
SELECT data FROM Disponivel WHERE habitacao = 1; 
