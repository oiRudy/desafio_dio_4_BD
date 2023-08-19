-- Inserções fictícias para cada tabela (5 registros cada)
USE ofincinaM;

-- Clientes
INSERT INTO cliente (Nome, CPF, Telefone, Endereco)
VALUES
    ('Maria da Silva', '12345678900', '11987654321', 'Rua das Flores, 123'),
    ('João Santos', '98765432100', '1199998888', 'Av. Principal, 456'),
    ('Pedro Oliveira', '45678912300', '11988776655', 'Rua da Esperança, 789'),
    ('Ana Pereira', '78901234500', '11966778899', 'Rua do Sol, 101'),
    ('Carlos Fernandes', '56789012300', '11999887766', 'Travessa da Lua, 55');

-- Veículos
INSERT INTO veiculo (Identificacao_veiculo, idCliente)
VALUES
    ('ABC123', 1),
    ('XYZ789', 2),
    ('DEF456', 3),
    ('JKL987', 4),
    ('MNO654', 5);

-- Equipes de Mecânicos
INSERT INTO equipeMecanicos (servico)
VALUES
    ('Motor'),
    ('Freios'),
    ('Suspensão'),
    ('Transmissão'),
    ('Eletrônica');

-- Mecânicos
INSERT INTO mecanico (CodigoMecanico, Nome, Endereco, Especialidade, EquipeMecanico)
VALUES
    (101, 'Marcos Santos', 'Rua das Oficinas', 'Motor', 1),
    (102, 'Ana Oliveira', 'Av. das Ferramentas', 'Freios', 2),
    (103, 'Carlos Silva', 'Rua das Engrenagens', 'Suspensão', 1),
    (104, 'Luiza Pereira', 'Rua das Peças', 'Transmissão', 3),
    (105, 'Fernando Almeida', 'Travessa dos Sensores', 'Eletrônica', 2);

-- Valores de Peças
INSERT INTO valorPecas (valorPecas)
VALUES
    ('100.00'),
    ('50.00'),
    ('200.00'),
    ('30.00'),
    ('80.00');

-- Mão de Obra
INSERT INTO maoObra (ValorMaoObra)
VALUES
    ('150.00'),
    ('120.00'),
    ('100.00'),
    ('200.00'),
    ('80.00');

-- Consertos e Revisões
INSERT INTO consertoRevisao (equipeMecanicos, idVeiculo, os, idMaoObra, idValorPecas, dataOs, valorOs, statusOs, diasExecucao)
VALUES
    (1, 1, 1001, 1, 1, '2023-08-18', '300.00', 'Concluído', '3'),
    (2, 2, 1002, 2, 2, '2023-08-19', '250.00', 'Em Andamento', '2'),
    (3, 3, 1003, 3, 3, '2023-08-20', '400.00', 'Aguardando Peças', '5'),
    (1, 4, 1004, 4, 4, '2023-08-21', '450.00', 'Em Andamento', '4'),
    (2, 5, 1005, 5, 5, '2023-08-22', '280.00', 'Concluído', '2');

-- Autorizações/Negações
INSERT INTO autorizarNegar (autorizacao, negacao, dataResposta, idCliente, idVeiculo, idEquipeMecanicos)
VALUES
    ('Autorizado', 'Aguardando Peças', '2023-08-18', 1, 1, 1),
    ('Negado', 'Peças Indisponíveis', '2023-08-19', 2, 2, 2),
    ('Autorizado', 'Peças em Estoque', '2023-08-20', 3, 3, 3),
    ('Negado', 'Orçamento Elevado', '2023-08-21', 4, 4, 1),
    ('Autorizado', 'Aguardando Aprovação', '2023-08-22', 5, 5, 2);

-- Autorizações Efetuadas
INSERT INTO autorizado (dataconclusao, osautorizada, dataosautorizada, statusosautorizada, idEquipeMecanicos, idAutorizarNegar, idCliente, idVeiculo)
VALUES
    ('2023-08-18', 1001, '2023-08-15', 'Concluído', 1, 1, 1, 1),
    ('2023-08-19', 1002, '2023-08-16', 'Em Andamento', 2, 2, 2, 2),
    ('2023-08-20', 1003, '2023-08-17', 'Aguardando Aprovação', 3, 3, 3, 3),
    ('2023-08-21', 1004, '2023-08-18', 'Concluído', 1, 4, 4, 4),
    ('2023-08-22', 1005, '2023-08-19', 'Concluído', 2, 5, 5, 5);