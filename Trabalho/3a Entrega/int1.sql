.mode	columns
.headers	on
.nullvalue	NULL

-- Ver os artistas que têm a área de trabalho de pintura

SELECT DISTINCT Pessoa.nome
FROM Pessoa, Artista
WHERE Pessoa.id = Artista.id AND Artista.areaTrabalho = 'pintura';
