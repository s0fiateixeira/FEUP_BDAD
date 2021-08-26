.mode	columns
.headers	on
.nullvalue	NULL

-- Duração de cada evento, por ordem decrescente

SELECT id,
CAST(strftime('%J', dataFim) - strftime('%J', dataInicio) as INTEGER) as 'Duração'
FROM EventoCultural
ORDER BY Duração DESC;
