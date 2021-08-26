PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS Pessoa;
DROP TABLE IF EXISTS Espectador;
DROP TABLE IF EXISTS Artista;
DROP TABLE IF EXISTS Staff;
DROP TABLE IF EXISTS Servico;
DROP TABLE IF EXISTS ordenado;
DROP TABLE IF EXISTS tempoServico;
DROP TABLE IF EXISTS Sala;
DROP TABLE IF EXISTS EventoCultural;
DROP TABLE IF EXISTS Concerto;
DROP TABLE IF EXISTS Exposicao;
DROP TABLE IF EXISTS Bilhete;

CREATE TABLE Pessoa (
    id INTEGER,
    nome TEXT NOT NULL,
    telefone INTEGER,
    idade INTEGER NOT NULL CONSTRAINT idadeValida CHECK (idade > 0),
    CONSTRAINT PessoaPK PRIMARY KEY (id)
);

CREATE TABLE Espectador (
    id INTEGER,
    nif INTEGER NOT NULL UNIQUE,
    CONSTRAINT EspectadorPK PRIMARY KEY (id),
    CONSTRAINT EspectadorFK FOREIGN KEY (id)  REFERENCES Pessoa(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Artista (
    id INTEGER, 
    areaTrabalho TEXT NOT NULL CONSTRAINT areaTrabalhoValida CHECK (areaTrabalho = "musica" OR areaTrabalho = "danca" OR areaTrabalho = "escultura" OR areaTrabalho = "pintura" OR areaTrabalho = "teatro" OR areaTrabalho = "fotografia"),
    CONSTRAINT ArtistaPK PRIMARY KEY (id),
    CONSTRAINT ArtistaFK FOREIGN KEY (id)  REFERENCES Pessoa(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Staff (
    id INTEGER,
    nif INTEGER NOT NULL UNIQUE,
    morada TEXT NOT NULL,
    iban TEXT NOT NULL UNIQUE,
    remuneracaoHora REAL NOT NULL CONSTRAINT remuneracaoHoraValida CHECK (remuneracaoHora > 0),
    CONSTRAINT StaffPK PRIMARY KEY (id),
    CONSTRAINT StaffFK FOREIGN KEY (id)  REFERENCES Pessoa(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Servico (
    id INTEGER,
    tipo TEXT NOT NULL CONSTRAINT tipoValido CHECK (tipo = "bengaleiro" OR tipo = "perdidosAchados" OR tipo = "bar" OR tipo = "bilheteira" OR tipo = "limpezas"),
    taxa REAL NOT NULL CONSTRAINT taxaValida CHECK ( taxa > 0 ),
    CONSTRAINT ServicoPK PRIMARY KEY (id)
);

CREATE TABLE ordenado (
    idStaff INTEGER ,
    idServico INTEGER,
    mes INTEGER NOT NULL CONSTRAINT mesValido CHECK ( mes BETWEEN 1 AND 12),
    valor REAL NOT NULL CONSTRAINT valorValido CHECK (valor > 0),
    CONSTRAINT ordenadoPK PRIMARY KEY (idStaff,idServico),
    CONSTRAINT ordenadoidFK FOREIGN KEY (idStaff) REFERENCES Pessoa(id) ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT ordenadotipoServicoFK FOREIGN KEY (idServico) REFERENCES Servico(id) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE tempoServico (
    idStaff INTEGER,
    idServico INTEGER,
    horasTrabalho INTEGER NOT NULL,
    data DATE NOT NULL,
    CONSTRAINT tempoServicoPK PRIMARY KEY (idStaff,idServico),
    CONSTRAINT tempoServicoidFK FOREIGN KEY (idStaff) REFERENCES Pessoa(id) ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT tempoServicotipoServicoFK FOREIGN KEY (idServico) REFERENCES Servico(id) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE Sala (
    numero INTEGER,
    lotacao INTEGER NOT NULL,
    tipologia TEXT NOT NULL CONSTRAINT tipologiaValida CHECK (tipologia = "concertos" OR tipologia = "exposicoes" ),
    dimensoes REAL NOT NULL CONSTRAINT dimensoesValidas CHECK ( dimensoes > 0),
    servicoId INTEGER,
    CONSTRAINT SalaPK PRIMARY KEY (numero),
    CONSTRAINT servicoFK FOREIGN KEY (servicoId) REFERENCES Servico(id) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE EventoCultural (
    id INTEGER,
    dataInicio DATE NOT NULL,
    dataFim DATE NOT NULL,
    limiteIdade INTEGER NOT NULL CONSTRAINT limiteIdadeValida CHECK (limiteIdade = 0 OR limiteIdade = 1),
    sala INTEGER,
    CONSTRAINT dataFimValida CHECK (dataInicio < dataFim),
    CONSTRAINT EventoCulturalPK PRIMARY KEY (id),
    CONSTRAINT numeroSala FOREIGN KEY (sala) REFERENCES Sala(numero) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE artistaEventoCultural (
    evento INTEGER,
    artista INTEGER,
    CONSTRAINT artistaEventoCulturalPK PRIMARY KEY (evento, artista),
    CONSTRAINT eventoFK FOREIGN KEY (evento) REFERENCES EventoCultural(id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT artistaFK FOREIGN KEY (artista) REFERENCES Artista(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE staffEventoCultural (
    evento INTEGER,
    staff INTEGER,
    CONSTRAINT staffEventoCulturalPK PRIMARY KEY (evento, staff),
    CONSTRAINT eventoFK FOREIGN KEY (evento) REFERENCES EventoCultural(id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT staffFK FOREIGN KEY (staff) REFERENCES Staff(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Concerto (
    id INTEGER,
    tipoIluminacao TEXT NOT NULL CONSTRAINT tipoIluminacaoValido CHECK ( tipoIluminacao = "monocromatica" OR tipoIluminacao = "colorida"),
    tipoSom TEXT NOT NULL CONSTRAINT tipoSomValido CHECK ( tipoSom = "mesasMistura" OR tipoSom = "instrumentos"),
    CONSTRAINT ConcertoPK PRIMARY KEY (id),
    CONSTRAINT ConcertoidFK FOREIGN KEY (id) REFERENCES EventoCultural(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Exposicao (
    id INTEGER,
    projecoes INTEGER NOT NULL CONSTRAINT projecoesValido CHECK (projecoes >= 0),
    CONSTRAINT ExposicaoPK PRIMARY KEY (id),
    CONSTRAINT ExposicaoidFK FOREIGN KEY (id) REFERENCES EventoCultural(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Bilhete (
    numero INTEGER,
    utilizado INTEGER NOT NULL CONSTRAINT utilizadoValido CHECK (utilizado = 0 OR utilizado = 1),
    espectadorId INTEGER,
    evento INTEGER,
    CONSTRAINT BilhetePK PRIMARY KEY (numero),
    CONSTRAINT espectadorIdFK FOREIGN KEY (espectadorId) REFERENCES Espectador(id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT eventoFK FOREIGN KEY (evento) REFERENCES EventoCultural(id) ON DELETE CASCADE ON UPDATE CASCADE
);
