.mode	columns
.headers	on
.nullvalue	NULL

PRAGMA foreign_keys = ON;

/*SELECT hostname, Pessoa.nome
FROM Servidor, Pessoa
WHERE idResponsavel = Pessoa.idPessoa AND vulneravel = 'sim';*/

/*
SELECT hostname, descricao, Pessoa.nome
FROM Servidor, Pessoa, Bug
WHERE Servidor.idResponsavel = Pessoa.idPessoa AND
--vulneravel = 'sim' AND
Bug.idResponsavel = Pessoa.idPessoa
ORDER BY hostname;
*/

/*
SELECT hostname
FROM Servidor, Pessoa, Bug
WHERE Servidor.idResponsavel = Pessoa.idPessoa
AND Bug.idResponsavel = Pessoa.idPessoa AND hostname LIKE 'alu%'
AND Pessoa.mail = 'joao.almeida@cica.pt';
*/

SELECT Aplicacao.nome
FROM Bug, Aplicacao
WHERE
;



