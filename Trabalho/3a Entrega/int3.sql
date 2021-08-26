.mode	columns
.headers	on
.nullvalue	NULL

-- Ver quantas vezes trabalhou cada membro do staff e mostrar as horas totais de trabalho

SELECT Pessoa.nome, COUNT(Staff.id) as 'número de vezes que trabalhou', tempoServico.horasTrabalho as 'horas totais de trabalho'
FROM Pessoa, Staff, staffEventoCultural, tempoServico
WHERE Pessoa.id = Staff.id AND Staff.id = staffEventoCultural.staff AND tempoServico.idStaff = Staff.id
GROUP BY Staff.id;
