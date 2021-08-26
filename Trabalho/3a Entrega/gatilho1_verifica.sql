.mode columns
.headers on
.nullvalue NULL

PRAGMA foreign_keys = ON;

--O bilhete apenas poderá ser adquirido no caso do
--espectador cumprir com o limite de idade imposto
--pelo evento associado


--Pessoa id 3 tem < 18 anos
--Pessoa id 1 tem > 18 anos
--Evento 3 tem limite de idade

SELECT * FROM Bilhete;

SELECT * FROM EventoCultural;

INSERT INTO Bilhete(numero, utilizado, espectadorId, evento) VALUES (101, 0, 3, 3);   --deve dar erro

SELECT * FROM Bilhete;

INSERT INTO Bilhete(numero, utilizado, espectadorId, evento) VALUES (101, 0, 1, 3);   --deve adicionar bilhete

SELECT * FROM Bilhete;
