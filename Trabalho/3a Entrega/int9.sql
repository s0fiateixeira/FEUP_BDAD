.mode   columns
.headers    on
.nullvalue    NULL

-- Ver quanta adesão tem o tipo de evento favorito entre Exposições e Concertos

DROP VIEW IF EXISTS numeroBilhetesConcertos;

CREATE VIEW numeroBilhetesConcertos AS
    SELECT COUNT(Concerto.id) AS nConcertos
    FROM Bilhete, Concerto, EventoCultural
    WHERE
    (
        Bilhete.evento = EventoCultural.id
        AND EventoCultural.id = Concerto.id
    );
    
DROP VIEW IF EXISTS numeroBilhetesExposicoes;

CREATE VIEW numeroBilhetesExposicoes AS
    SELECT COUNT(Exposicao.id) AS nExposicoes
    FROM Bilhete, Exposicao, EventoCultural
    WHERE
    (
        Bilhete.evento = EventoCultural.id AND
        EventoCultural.id = Exposicao.id
    );

SELECT MAX(nExposicoes, nConcertos) AS Favorito
FROM numeroBilhetesConcertos, numeroBilhetesExposicoes;
