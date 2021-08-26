PRAGMA foreign_keys = ON;

INSERT INTO Pessoa(nome, id, telefone, idade)
VALUES
    ("José Carlos", 1, 910000001,19),
    ("Zulmira Antonieta", 2, NULL, 93),
    ("Mónica Gomes", 3, 921773464, 24),
    ("Nelson Nogueira", 4, 96339468,45),
    ("Renato Melo", 5, 934757383, 70),
    ("Iris Rocha", 6, 912345438, 80),
    ("Jorge Andrade", 7, 922701006, 13),
    ("Vitória Torres", 8, 918819776, 41),
    ("Emanuel Assunção", 9, 918445905, 53),
    ("Carolina Freitas", 10, 969364114, 37),
    ("Rodrigo Neves", 11, 927042056, 21),
    ("Mariana Rodrigues", 12, 914508039, 31);

INSERT INTO Espectador(id,nif)
VALUES
    (2, 217512593),
    (5, 279729782),
    (6, 218989792),
    (9, 270611860),
    (11, 237957710);

INSERT INTO Artista(id, areaTrabalho)
VALUES
    (1, "escultura"),
    (7, "pintura"),
    (3, "danca");

INSERT INTO Staff(id, nif, morada, iban, remuneracaoHora)
VALUES
    (2, 217512593, "Rua do Heroísmo 43 4349-001 Porto", "PT50000785602773188546037", 3.5),
    (4, 205460500, "Rua Escola do Exército Pares de 2 a 18 1150-144 Lisboa", "PT50000756807039403851026", 4.0),
    (8, 263356620, "Rua do Assento 4800-870 São Torcato", "PT50000798605129865023761", 5.5),
    (10, 229076793, "Rua Comandante Eugénio Conceição Silva 2809-005 Almada", "PT50000777984339569867580", 2.5),
    (12, 280748035, "Rua G Zona Industrial 1ª Fase 6004-001 Castelo Branco", "PT50000779228286471166136", 3.0);

INSERT INTO Servico(id, tipo, taxa)
VALUES
    (1, "bengaleiro", 2.0),
    (2, "bar", 1.0),
    (3, "limpezas", 1.5),
    (4, "bilheteira", 1.75),
    (5, "perdidosAchados", 3.0),
    (6, "limpezas", 1.5),
    (7, "bilheteira", 1.75),
    (8, "bar", 1.0),
    (9, "bar", 1.0),
    (10, "limpezas", 1.5),
    (11, "bar", 1.0),
    (12, "limpezas", 1.5);

INSERT INTO ordenado(idStaff, idServico, mes, valor)
VALUES
    (2, 6, 1, 5.25),
    (4, 3, 1, 6),
    (8, 2, 1, 5.5),
    (10, 4, 1, 4.375),
    (12, 7, 1, 5.25);
    
INSERT INTO tempoServico(idStaff, idServico, horasTrabalho, data)
VALUES
    (2, 6, 2, '2021-01-03'),
    (4, 3, 5, '2021-01-09'),
    (8, 2, 4, '2021-01-10'),
    (10, 4, 2, '2021-01-04'),
    (12, 7, 3, '2021-01-25');

INSERT INTO Sala(numero, lotacao, tipologia, dimensoes)
VALUES
    (1, 100, "concertos", 450),
    (2, 250, "exposicoes", 459),
    (3, 1000, "concertos", 9854),
    (4, 750, "concertos", 1320),
    (5, 50, "exposicoes", 49),
    (6, 100, "exposicoes", 500);

INSERT INTO EventoCultural(id, dataInicio, dataFim, limiteIdade)
VALUES
    (1, '2021-03-12', '2021-03-15', 0),
    (2, '2021-02-10', '2021-02-15', 1),
    (3, '2021-01-12', '2021-01-18', 1),
    (4, '2021-03-01', '2021-03-05', 0),
    (5, '2021-04-11', '2021-04-19', 0),
    (6, '2021-01-10', '2021-01-17', 0);

INSERT INTO Concerto(id, tipoIluminacao, tipoSom)
VALUES
    (1, "monocromatica", "instrumentos"),
    (4, "colorida", "instrumentos"),
    (5, "colorida", "instrumentos");

INSERT INTO Exposicao(id, projecoes)
VALUES
    (2, 1),
    (3, 0),
    (6, 1);

INSERT INTO Bilhete(numero, utilizado)
VALUES
    (1, 1),
    (2, 1),
    (3, 1),
    (4, 1),
    (5, 1),
    (6, 1),
    (7, 0),
    (8, 0);
