.mode   columns
.headers	on
.nullvalue	NULL

-- artistas que trabalharam menos vezes

DROP VIEW IF EXISTS trabalhar;

CREATE VIEW trabalhar AS
    SELECT DISTINCT Pessoa.nome AS nomes, EventoCultural.id, COUNT(*) AS conta
    FROM Pessoa, Artista, artistaEventoCultural, EventoCultural
    WHERE Pessoa.id = Artista.id AND artistaEventoCultural.artista = Artista.id AND artistaEventoCultural.evento = EventoCultural.id
    GROUP BY Pessoa.id;

SELECT nomes, MIN(conta) AS 'Vezes que trabalhou'
FROM trabalhar;
