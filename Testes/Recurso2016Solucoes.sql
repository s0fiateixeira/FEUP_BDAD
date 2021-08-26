.mode	columns
.headers	on
.nullvalue	NULL

PRAGMA foreign_keys = ON;


--15
/*
SELECT E1.nome
FROM Estudante E1, Estudante E2, Amizade
WHERE E2.ID <> E1.ID AND E2.ID = Amizade.ID2 AND E1.ID = Amizade.ID1 AND E2.nome LIKE 'GabrieL %'
*/

--16
/*
SELECT E1.nome
FROM Estudante E1, Estudante E2, Amizade
WHERE E2.ID <> E1.ID AND
E2.ID = Amizade.ID2 AND
E1.ID = Amizade.ID1 
GROUP BY E1.nome
HAVING count(DISTINCT E2.anoCurricular) = 5;
*/

DROP VIEW IF EXISTS AmizadeTransitiva;

CREATE VIEW AmizadeTransitiva AS

SELECT A.ID AS ID1, C.ID AS ID2
FROM Estudante A, Estudante B, Estudante C, Amizade A1, Amizade A2
WHERE
(
    A1.ID1 = A.ID AND A1.ID2 = B.ID
    AND A2.ID1 = B.ID AND A2.ID2 = C.ID
);


SELECT * FROM AmizadeTransitiva;