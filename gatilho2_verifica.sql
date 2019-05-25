.mode       columns
.headers    on
.nullvalue  NULL
PRAGMA foreign_keys = ON;

SELECT classificacaoAnfitriao FROM Anfitriao WHERE idAnfitriao = 2;
SELECT classificacaoHabitacao FROM Habitacao WHERE idHabitacao = 1;
insert into ClassificacaoPorCliente(limpeza, valor, checkIn, localizacao, outros, classificacaoAnfitriao, descricaoAnfitriao, idReserva, idCliente) values (5,4,4,3,NULL,5,"Anfitriao bastante atencioso, acompanhou de perto a nossa estadia tendo-nos feito sentir confortaveis e em casa. Recomendo vivamente.", 1, 3);
SELECT classificacaoAnfitriao FROM Anfitriao WHERE idAnfitriao = 2;
SELECT classificacaoHabitacao FROM Habitacao WHERE idHabitacao = 1;
insert into ClassificacaoPorCliente(limpeza, valor, checkIn, localizacao, outros, classificacaoAnfitriao, descricaoAnfitriao, idReserva, idCliente) values (3,5,5,2,NULL,2,"Anfitriao bastante conflituoso, não regressarei a nenhuma das suas habitações.", 4, 5);
SELECT classificacaoAnfitriao FROM Anfitriao WHERE idAnfitriao = 2;
SELECT classificacaoHabitacao FROM Habitacao WHERE idHabitacao = 1;
--insert into ClassificacaoPorCliente(limpeza, valor, checkIn, localizacao, outros, classificacaoAnfitriao, descricaoAnfitriao, idReserva, idCliente) values (5,4,4,3,NULL,3,"Anfitriao pouco atencioso em local pouco amigável o que levou a alguns problemas", 5, 6);
--SELECT classificacaoAnfitriao FROM Anfitriao WHERE idAnfitriao = 2;
