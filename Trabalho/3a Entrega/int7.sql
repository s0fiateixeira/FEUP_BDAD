.mode   columns
.headers	on
.nullvalue	NULL

-- mostrar espectadores que foram a todos os eventos do tipo exposição fotográfica

SELECT DISTINCT EventoCultural.id AS Evento, Pessoa.nome AS Espectador
FROM Pessoa, Artista, EventoCultural, Bilhete, Espectador, artistaEventoCultural
WHERE
(
    Pessoa.id = Espectador.id AND
    Bilhete.espectadorId = Pessoa.id AND
    Bilhete.evento = EventoCultural.id AND
    Artista.areaTrabalho = "fotografia" AND
    artistaEventoCultural.evento = EventoCultural.id AND
    artistaEventoCultural.artista = Artista.id
);
