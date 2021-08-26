.mode   columns
.headers	on
.nullvalue	NULL

-- Mostrar os eventos que ocorrem em dias que coincidem (em salas diferentes)

WITH dataComparar AS
(
    SELECT dataInicio, id, dataFim
    FROM EventoCultural
)


SELECT DISTINCT 'Evento ' || Ev1.id || ' e evento ' || Ev2.id AS 'Começam no mesmo dia'
FROM dataComparar AS Ev1
    JOIN dataComparar AS Ev2
    ON Ev1.id <> Ev2.id
WHERE ( (
            Ev1.dataInicio > Ev2.dataInicio
            AND
            Ev1.dataInicio < Ev2.dataFim
        ) OR
        (
            Ev1.dataFim > Ev2.dataInicio
            AND
            Ev1.dataFim < Ev2.dataFim
        ) OR
        (
            Ev1.dataInicio < Ev2.dataInicio
            AND
            Ev1.dataFim > Ev2.dataFim
        ) OR
        (
            Ev1.dataInicio > Ev2.dataInicio
            AND
            Ev1.dataFim < Ev2.dataFim
        ) OR 
        (
            Ev1.dataInicio = Ev2.dataInicio
            AND
            Ev1.dataFim = Ev2.dataFim
        )
);
