.mode columns
.headers on
.nullvalue NULL

PRAGMA foreign_keys = ON;

--Não pode existir mais que um evento
--associado a uma sala ao mesmo tempo,
--isto é, a dataFim é sempre anterior
--à dataInicio do evento seguinte, se
--este existir;

--evento id 1 começa dia 2021-05-14 e acaba dia 2021-05-19

SELECT * FROM EventoCultural;

SELECT * FROM Sala;

INSERT INTO EventoCultural(id, dataInicio, dataFim, limiteIdade, sala) VALUES (36, '2021-05-18', '2021-05-21', 0, 1);   --deve dar erro

SELECT * FROM EventoCultural;

INSERT INTO EventoCultural(id, dataInicio, dataFim, limiteIdade, sala) VALUES (36, '2021-05-21', '2021-05-22', 0, 1);   --deve adicionar evento

SELECT * FROM EventoCultural;
