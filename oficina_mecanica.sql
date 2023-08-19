-- Cria Banco de Dados
CREATE DATABASE oficina;

-- Cria Tabela Cliente
CREATE TABLE cliente(
        idCliente INT AUTO_INCREMENT PRIMARY KEY,
        Nome VARCHAR (300) NOT NULL,
        CPF CHAR(11) NOT NULL,
        Telefone VARCHAR (11) NOT NULL,
        Endereco VARCHAR (300) NOT NULL,
        CONSTRAINT unique_CPF unique (CPF)
    );

-- Cria Tabela Veículo
CREATE TABLE veiculo(
        idVeiculo INT AUTO_INCREMENT PRIMARY KEY,
        Identificacao_veiculo VARCHAR (45) NOT NULL,
        idCliente INT,
        CONSTRAINT fk_veiculo_cliente FOREIGN KEY (idCliente) REFERENCES cliente(idCliente)
    );

-- Cria Tabela Equipe de Mecânicos
CREATE TABLE equipeMecanicos(
        idEquipeMecanicos INT AUTO_INCREMENT PRIMARY KEY,
        servico VARCHAR (45) NOT NULL
    );

-- Cria Tabela Mecânico
CREATE TABLE mecanico(
        idMecanicos INT AUTO_INCREMENT PRIMARY KEY,
        CodigoMecanico INT NOT NULL,
        Nome VARCHAR (45) NOT NULL,
        Endereco VARCHAR (45) NOT NULL,
        Especialidade VARCHAR (45),
        EquipeMecanico INT,
        CONSTRAINT fk_mecanico_equipe FOREIGN KEY (EquipeMecanico) REFERENCES equipeMecanicos(idEquipeMecanicos)
    );

-- Cria Tabela Valor das Peças
CREATE TABLE valorPecas(
        idValorPecas INT AUTO_INCREMENT PRIMARY KEY,
        valorPecas VARCHAR (255) NOT NULL
    );

-- Cria Tabela Mão de Obra
CREATE TABLE maoObra(
        idMaoObra INT AUTO_INCREMENT PRIMARY KEY,
        ValorMaoObra VARCHAR (255)
    );

-- Cria Tabela Concerto e Revisão
CREATE TABLE consertoRevisao(
        equipeMecanicos INT,
        idVeiculo INT,
        os INT NOT NULL,
        idMaoObra INT,
        idValorPecas INT,
        dataOs VARCHAR (45) NOT NULL,
        valorOs VARCHAR (45) NOT NULL,
        statusOs VARCHAR (45) NOT NULL,
        diasExecucao VARCHAR (45) NOT NULL,
        CONSTRAINT fk_conserto_equipe FOREIGN KEY (equipeMecanicos) REFERENCES equipeMecanicos(idEquipeMecanicos),
        CONSTRAINT fk_conserto_veiculo FOREIGN KEY (idVeiculo) REFERENCES veiculo(idVeiculo),
        CONSTRAINT fk_conserto_mao FOREIGN KEY (idMaoObra) REFERENCES maoObra(idMaoObra),
        CONSTRAINT fk_conserto_pecas FOREIGN KEY (idValorPecas) REFERENCES valorPecas(idValorPecas)
    );

-- Cria Tabela Atorização e Negação
CREATE TABLE autorizarNegar(
        idAutorizarNegar INT AUTO_INCREMENT PRIMARY KEY,
        autorizacao VARCHAR (45),
        negacao VARCHAR (45),
        dataResposta date NOT NULL,
        idCliente INT,
        idVeiculo INT,
        idEquipeMecanicos INT,
        CONSTRAINT fk_autorizarnegar_cliente FOREIGN KEY (idCliente) REFERENCES cliente(idCliente),
        CONSTRAINT fk_autorizarnegar_veiculo FOREIGN KEY (idVeiculo) REFERENCES veiculo(idVeiculo),
        CONSTRAINT fk_autorizarnegar_equipe FOREIGN KEY (idEquipeMecanicos) REFERENCES equipeMecanicos(idEquipeMecanicos)
    );

-- Cria Tabela Autorizado
CREATE TABLE autorizado(
        idAutorizado INT AUTO_INCREMENT PRIMARY KEY,
        dataconclusao VARCHAR (45) NOT NULL,
        osautorizada INT NOT NULL,
        dataosautorizada VARCHAR (45) NOT NULL,
        statusosautorizada VARCHAR (45) NOT NULL,
        idEquipeMecanicos INT,
        idAutorizarNegar INT,
        idCliente INT,
        idVeiculo INT,
        CONSTRAINT fk_autorizado_equipe FOREIGN KEY (idEquipeMecanicos) REFERENCES equipeMecanicos(idEquipeMecanicos),
        CONSTRAINT fk_autorizado_id FOREIGN KEY (idAutorizarNegar) REFERENCES autorizarNegar(idAutorizarNegar),
        CONSTRAINT fk_autorizado_cliente FOREIGN KEY (idCliente) REFERENCES cliente(idCliente),
        CONSTRAINT fk_autorizado_veiculo FOREIGN KEY (idVeiculo) REFERENCES veiculo(idVeiculo)
    );