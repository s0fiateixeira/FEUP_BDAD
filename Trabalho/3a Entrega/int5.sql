.mode   columns
.headers	on
.nullvalue	NULL

-- Número máximo de bilhetes vendidos para um evento cultural

DROP VIEW IF EXISTS numeroBilhetes;

CREATE VIEW numeroBilhetes AS
    SELECT evento, COUNT(*) as 'NMax'
    FROM Bilhete, Espectador
    WHERE Bilhete.espectadorId = Espectador.id
    GROUP BY evento;


SELECT MAX(NMax) as 'Nº Máximo de Bilhetes' FROM numeroBilhetes;
