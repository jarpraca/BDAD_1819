PRAGMA foreign_keys = ON;

.mode	columns
.headers	on
.nullvalue	NULL

SELECT ClassificacaoPorCliente.idCliente, ClassificacaoPorCliente.limpeza, ClassificacaoPorCliente.valor, ClassificacaoPorCliente.checkIn, ClassificacaoPorCliente.localizacao, ClassificacaoPorCliente.outros
FROM  ClassificacaoPorCliente, Reserva
WHERE ( ClassificacaoPorCliente.idReserva = Reserva.idReserva AND Reserva.idHabitacao = 4)
order by ClassificacaoPorCliente.idCliente