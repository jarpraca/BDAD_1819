.mode       columns
.headers    on
.nullvalue  NULL
PRAGMA foreign_keys = ON;

SELECT classificacaoAnfitriao FROM Anfitriao WHERE id = 2;
insert into ClassificacaoPorCliente(limpeza, valor, checkIn, localizacao, outros, classificacaoAnfitriao, descricaoAnfitriao, reserva, cliente) values (5,4,4,3,NULL,5,"Anfitriao bastante atencioso, acompanhou de perto a nossa estadia tendo-nos feito sentir confortaveis e em casa. Recomendo vivamente.", 1, 3);
SELECT classificacaoAnfitriao FROM Anfitriao WHERE id = 2;
insert into ClassificacaoPorCliente(limpeza, valor, checkIn, localizacao, outros, classificacaoAnfitriao, descricaoAnfitriao, reserva, cliente) values (3,5,5,3,NULL,2,"Anfitriao bastante conflituoso, não regressarei a nenhuma das suas habitações.", 4, 5);
SELECT classificacaoAnfitriao FROM Anfitriao WHERE id = 2;
insert into ClassificacaoPorCliente(limpeza, valor, checkIn, localizacao, outros, classificacaoAnfitriao, descricaoAnfitriao, reserva, cliente) values (5,4,4,3,NULL,3,"Anfitriao pouco atencioso em local pouco amigável o que levou a alguns problemas", 5, 6);
SELECT classificacaoAnfitriao FROM Anfitriao WHERE id = 2;

--SELECT id FROM Reserva WHERE Reserva.habitacao = 1;
--SELECT classificacaoAnfitriao FROM ClassificacaoPorCliente WHERE ClassificacaoPorCliente.reserva = (SELECT id FROM Reserva WHERE Reserva.habitacao = 1);

SELECT anfitriao FROM Possui WHERE Possui.habitacao = (SELECT habitacao FROM Reserva WHERE Reserva.id = 1);
--SELECT anfitriao FROM Possui WHERE Possui.habitacao = (SELECT habitacao FROM Reserva WHERE Reserva.id = 2);
--SELECT anfitriao FROM Possui WHERE Possui.habitacao = (SELECT habitacao FROM Reserva WHERE Reserva.id = 3);
SELECT anfitriao FROM Possui WHERE Possui.habitacao = (SELECT habitacao FROM Reserva WHERE Reserva.id = 4);
SELECT anfitriao FROM Possui WHERE Possui.habitacao = (SELECT habitacao FROM Reserva WHERE Reserva.id = 5);
