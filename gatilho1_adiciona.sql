CREATE TRIGGER CLASSIFICACAO
AFTER INSERT ON ClassificacaoPorAnfitriao
FOR EACH ROW
WHEN exists (SELECT * FROM Cliente WHERE id = )
BEGIN
    UPDATE Cliente
    SET classificacaoMedia = 
    WHERE id.Cliente = cliente.reserva.ClassificacaoPorAnfitriao;
END;