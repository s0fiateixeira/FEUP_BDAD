.mode   columns
.headers	on
.nullvalue	NULL

-- Membros do staff com ordenado com valor superior à média

SELECT Pessoa.nome, ordenado.valor    
FROM Pessoa JOIN ordenado
ON Pessoa.id = ordenado.idStaff
WHERE ordenado.valor > (SELECT AVG(valor) FROM ordenado);
