-- Quantos clientes possuem autorizações concedidas?
SELECT COUNT(*) FROM autorizado WHERE statusosautorizada = 'Concluído';
-- Resposta: 3

-- Qual a especialidade do mecânico responsável pela os 1003?
SELECT m.Especialidade FROM mecanico m
JOIN consertoRevisao c ON m.idMecanicos = c.equipeMecanicos
WHERE c.os = 1003;
-- Resposta: Suspensão

-- Qual é o total gasto em mão de obra?
SELECT SUM(CAST(ValorMaoObra AS DECIMAL(10, 2))) FROM maoObra;
-- Resposta: 650.00


-- Quais são os veículos com status "Aguardando Peças"?
SELECT v.Identificacao_veiculo FROM veiculo v
JOIN autorizarNegar an ON v.idVeiculo = an.idVeiculo
WHERE an.statusOs = 'Aguardando Peças';
-- Resposta: ABC123, DEF456

-- Quais são os clientes que possuem pelo menos uma negação?
SELECT DISTINCT c.Nome FROM cliente c
JOIN autorizarNegar an ON c.idCliente = an.idCliente
WHERE an.negacao IS NOT NULL;
-- Resposta: João Santos, Pedro Oliveira