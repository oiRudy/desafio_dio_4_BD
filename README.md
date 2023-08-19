# Construção um Projeto Lógico de Banco de Dados do Zero

## Descrição do Desafio
Para este cenário você irá utilizar seu esquema conceitual, criado no desafio do módulo de modelagem de BD com modelo ER, para criar o esquema lógico para o contexto de uma oficina. Neste desafio, você definirá todas as etapas. Desde o esquema até a implementação do banco de dados. Sendo assim, neste projeto você será o protagonista. Tenha os mesmos cuidados, apontados no desafio anterior, ao modelar o esquema utilizando o modelo relacional.

Após a criação do esquema lógico, realize a criação do Script SQL para criação do esquema do banco de dados. Posteriormente, realize a persistência de dados para realização de testes. Especifique ainda queries mais complexas do que apresentadas durante a explicação do desafio. Sendo assim, crie queries SQL com as cláusulas abaixo:

 - Recuperações simples com SELECT Statement;
 - Filtros com WHERE Statement;
 - Crie expressões para gerar atributos derivados;
 - Defina ordenações dos dados com ORDER BY;
 - Condições de filtros aos grupos – HAVING Statement;
 - Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados;

## Diretrizes
 - Não há um mínimo de queries a serem realizadas;
 - Os tópicos supracitados devem estar presentes nas queries;
 - Elabore perguntas que podem ser respondidas pelas consultas
 - As cláusulas podem estar presentes em mais de uma query
 - O projeto deverá ser adicionado a um repositório do Github para futura avaliação do desafio de projeto. Adicione ao Readme a descrição do projeto lógico para fornecer o contexto sobre seu esquema lógico apresentado.

## Resolução

#### > Mapeamento do esquema ERRelacional
![Dio4](https://github.com/oiRudy/desafio_dio_4_BD/assets/139499341/d93c2ad8-ce35-48ea-9e64-70cc092183de)

#### > Definição do script SQL para criação do esquema de banco de dados
![script SQL DDL](https://github.com/oiRudy/desafio_dio_4_BD/blob/main/oficina_mecanica.sql))
Criação do banco de dados para cenário de Oficina Mecânica e criação das tabelas 

#### > Persistência de dados para teste
![script SQL DML](https://github.com/oiRudy/desafio_dio_4_BD/blob/main/inserts_oficina_mecanica.sql))

#### > Recuperação de informação com queries SQL
![script SQL DQL](https://github.com/oiRudy/desafio_dio_4_BD/blob/main/querys_oficina_mecanica.sql)

Pergunta 1: Quantos clientes possuem autorizações concedidas?
```sql
SELECT COUNT(*) FROM autorizado WHERE statusosautorizada = 'Concluído';
```
Resposta: 3

Pergunta 2: Qual a especialidade do mecânico responsável pela os 1003?
```sql
SELECT m.Especialidade FROM mecanico m
JOIN consertoRevisao c ON m.idMecanicos = c.equipeMecanicos
WHERE c.os = 1003;
```
Resposta: Suspensão

Pergunta 3: Qual é o total gasto em mão de obra?
```sql
SELECT SUM(CAST(ValorMaoObra AS DECIMAL(10, 2))) FROM maoObra;
```
Resposta: 650.00

Pergunta 4: Quais são os veículos com status "Aguardando Peças"?
```sql
SELECT v.Identificacao_veiculo FROM veiculo v
JOIN autorizarNegar an ON v.idVeiculo = an.idVeiculo
WHERE an.statusOs = 'Aguardando Peças';
```
Resposta: ABC123, DEF456

Pergunta 5: Quais são os clientes que possuem pelo menos uma negação?
```sql
SELECT DISTINCT c.Nome FROM cliente c
JOIN autorizarNegar an ON c.idCliente = an.idCliente
WHERE an.negacao IS NOT NULL;
```
Resposta: João Santos, Pedro Oliveira

## Aprendizados

A criação desse banco de dados proporcionou insights sobre a estruturação de sistemas. Isso inclui a importância da modelagem de dados, a definição de relações entre tabelas e a utilização de consultas SQL para extrair informações relevantes. A experiência também revelou a necessidade de balancear normalização e eficiência, além de demonstrar como as junções entre tabelas ampliam a visão dos dados. 

![SQL](https://img.shields.io/badge/MySQL-005C84?style=for-the-badge&logo=mysql&logoColor=white) 
![Git](https://img.shields.io/badge/Git-000?style=for-the-badge&logo=git&logoColor=E94D5F) 

## Referência

 - [Potência Tech powered by iFood: Ciência de Dados com Python](https://web.dio.me/track/potencia-tech-powered-ifood-ciencias-de-dados-com-python)
