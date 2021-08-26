.mode columns
.headers on
.nullvalue NULL

PRAGMA foreign_keys = ON;

--Não pode existir mais que um evento
--associado a uma sala ao mesmo tempo,
--isto é, a dataFim é sempre anterior
--à dataInicio do evento seguinte, se
--este existir;


CREATE TRIGGER eventos_sobrepostos
BEFORE INSERT ON EventoCultural
WHEN
(
    NEW.dataInicio <
    (       
        SELECT MAX(dataFim)
        FROM EventoCultural, Sala
        WHERE sala = NEW.sala AND sala = Sala.numero
    )
)
BEGIN
    SELECT RAISE(ABORT, 'A Sala já tem um evento a ocorrer nessa altura');
END;
