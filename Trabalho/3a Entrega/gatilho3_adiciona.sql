.mode columns
.headers on
.nullvalue NULL

PRAGMA foreign_keys = ON;

-- Certificar que a condição de disjoint,
--ao adicionar um concerto, está a ser
--cumprida, isto é, que o evento não é uma
--exposição em simultâneo

CREATE TRIGGER disjoint
BEFORE INSERT ON Concerto
WHEN
(
    SELECT Concerto.id
    FROM Concerto, Exposicao
    WHERE(
        NEW.id = Exposicao.id
    )
)
BEGIN
    SELECT RAISE(ABORT, 'Já é uma exposição!');
END;
