.mode	columns
.headers	on
.nullvalue	NULL

PRAGMA foreign_keys = ON;


--Liste o nome de cada estudante inscrito no 3ºano curricular, seguido do nome do curso em que está inscrito
/*
Estudante    Curso     
-----------  ----------
Carla Silva  MIEIC
Joana Teixe  MIEEC
Carlos Rodr  MIEIC
Sergio Carv  MIEEC
*/

/*
SELECT Estudante.nome AS Estudante, Curso.nome AS Curso
FROM Estudante, Curso
WHERE (anoCurricular == 3 AND Curso.ID == Estudante.curso);
*/

--------------------------------------------------------------------------------------------------------------------------

--Indique o nome e ano curricular do(s) estudante(s) que tem maior número de amigos
/*
nome           anoCurricular
-------------  -------------
Gabriel Maria  1
*/
/*
SELECT nome, anoCurricular
FROM Estudante, Amizade
WHERE Estudante.id = Amizade.ID1
GROUP BY Estudante.nome
HAVING count(Amizade.ID2) = 
(
    SELECT max(numeroAmizades)
    FROM (
        SELECT id, nome, count(*) as numeroAmizades
        FROM Estudante, Amizade
        WHERE Estudante.id = Amizade.ID1
        GROUP BY Estudante.id
    )
);*/

-------------------------------------------------------------------------------------------------------------------------
--Crie um gatilho que, na inserção de um estudante, o torne amigo de todos os outros estudantes do mesmo curso. Não se esqueça que as amizades são mútuas. As amizades inseridas devem ser apenas entre pessoas distintas, ou seja, um estudante não pode ser considerado amigo de si próprio

/*
CREATE TRIGGER oitopontotres
AFTER INSERT ON Estudante
WHEN
(

)
BEGIN

END;
*/


------------------------------------------------------------------------------------------------------------------------

--Liste o nome e ano curricular dos estudantes que só têm amigos do mesmo ano curricular. Devolva os resultados ordenados por ano curricular e depois por nome dentro de cada ano curricular. Não devem ser devolvidos os estudantes que não têm amigos
/*
SELECT nome, anoCurricular
FROM Estudante
WHERE (


) ORDER BY anoCurricular, nome*/
/*
SELECT nome, anoCurricular
FROM Estudante, Amizade
WHERE (
    (Estudante.ID = Amizade.ID1 OR Estudante.ID = Amizade.ID2)
    AND Estudante.anoCurricular = (
        SELECT anoCurricular
        FROM Estudante, Amizade
        WHERE Estudante.ID = Amizade.ID1 OR Estudante.ID = Amizade.ID2
    )
);
*/

-----------------------------------------------------------------------------------------------------------------------

--Liste o nome dos estudantes com mais de 3 amigos
/*nome       
-----------
Carla Silva
Mafalda Pim
Gabriel Mar
*/
/*
SELECT nome
FROM (
    SELECT nome, count(*) AS numeroAmizades
    FROM Estudante, Amizade
    WHERE (Estudante.ID = Amizade.ID1)
    GROUP BY Estudante.nome
)
WHERE numeroAmizades > 3
ORDER BY numeroAmizades;
*/

----------------------------------------------------------------------------------------------------------------------

--Liste os identificadores dos amigos em 3º grau do Miguel Sampaio. Um amigo em 3º grau é um amigo de um amigo de um amigo. A listagem não deve ter tuplos repetidos
