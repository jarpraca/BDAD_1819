.mode       columns
.headers    on
.nullvalue  NULL
PRAGMA foreign_keys = ON;

SELECT * FROM ClassificacaoPorAnfitriao WHERE reserva = 3;
insert into ClassificacaoPorAnfitriao(classificacao, descricao, reserva, anfitriao) values (2, "Cliente pouco simpatico e compreensivo. Algumas queixas de barulho", 3, 3);
SELECT * FROM ClassificacaoPorAnfitriao WHERE reserva = 3;
