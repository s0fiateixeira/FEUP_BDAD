.mode   columns
.headers	on
.nullvalue	NULL

-- Taxa de ocupação das salas por cada evento

SELECT EventoCultural.id, COUNT(Bilhete.evento) AS 'Bilhetes vendidos', Sala.lotacao,
    COUNT(Bilhete.evento) / CAST(Sala.lotacao AS REAL) AS 'Taxa de ocupação das salas'
FROM EventoCultural, Bilhete, Sala
WHERE EventoCultural.id = Bilhete.evento AND EventoCultural.sala = Sala.numero
GROUP BY evento;
