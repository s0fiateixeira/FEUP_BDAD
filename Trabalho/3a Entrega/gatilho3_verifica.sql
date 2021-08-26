.mode columns
.headers on
.nullvalue NULL

PRAGMA foreign_keys = ON;

-- Certificar que a condição de disjoint,
--ao adicionar um concerto, está a ser
--cumprida, isto é, que o evento não é uma
--exposição em simultâneo

--evento cultural com id = 8 é uma exposição
--evento cultural com id = 32 ainda não é nenhum dos dois


SELECT * FROM EventoCultural;

SELECT * FROM Concerto;

INSERT INTO Concerto(id, tipoIluminacao, tipoSom) VALUES (8, "monocromatica", "mesasMistura"); -- deve dar erro

SELECT * FROM Concerto;

INSERT INTO Concerto(id, tipoIluminacao, tipoSom) VALUES (32, "monocromatica", "mesasMistura"); -- deve adicionar o concerto 

SELECT * FROM Concerto;
