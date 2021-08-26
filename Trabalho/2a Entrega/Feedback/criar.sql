-- falta PRAGMA foreign_keys=ON

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

CREATE TABLE IF NOT EXISTS Pessoa ( -- usando os drops em cima a tabela vai sempre ser criada, portanto o IF NOT EXISTS não acrescenta nada...
    nome TEXT NOT NULL,
    id INTEGER,
    telefone INTEGER,
    idade INTEGER NOT NULL CONSTRAINT idadeValida CHECK (idade > 0),
    CONSTRAINT PessoaPK PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Espectador (
    id INTEGER,
    nif INTEGER NOT NULL UNIQUE,
    CONSTRAINT EspectadorPK PRIMARY KEY (id),
    CONSTRAINT EspectadorFK FOREIGN KEY (id)  REFERENCES Pessoa(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Artista (
    id INTEGER, 
    areaTrabalho TEXT NOT NULL CONSTRAINT areaTrabalhoValida CHECK (areaTrabalho = "musica" OR areaTrabalho = "danca" OR areaTrabalho = "escultura" OR areaTrabalho = "pintura" OR areaTrabalho = "teatro" OR areaTrabalho = "fotografia"),
    CONSTRAINT ArtistaPK PRIMARY KEY (id),
    CONSTRAINT ArtistaFK FOREIGN KEY (id)  REFERENCES Pessoa(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Staff (
    id INTEGER,
    nif INTEGER NOT NULL UNIQUE,
    morada TEXT NOT NULL,
    iban TEXT NOT NULL UNIQUE,
    remuneracaoHora REAL NOT NULL CONSTRAINT remuneracaoHoraValida CHECK (remuneracaoHora > 0),
    CONSTRAINT StaffPK PRIMARY KEY (id),
    CONSTRAINT StaffFK FOREIGN KEY (id)  REFERENCES Pessoa(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Servico (
    id INTEGER,
    tipo TEXT CONSTRAINT tipoValido CHECK (tipo = "bengaleiro" OR tipo = "perdidosAchados" OR tipo = "bar" OR tipo = "bilheteira" OR tipo = "limpezas"),
    taxa REAL NOT NULL CONSTRAINT taxaValida CHECK ( taxa > 0 ),
    CONSTRAINT ServicoPK PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS ordenado (
    idStaff INTEGER ,
    idServico INTEGER,
    mes INTEGER NOT NULL CONSTRAINT mesValido CHECK ( mes BETWEEN 1 AND 12),
    valor REAL NOT NULL CONSTRAINT valorValido CHECK (valor > 0),
    CONSTRAINT ordenadoPK PRIMARY KEY (idStaff,idServico),
    CONSTRAINT ordenadoidFK FOREIGN KEY (idStaff) REFERENCES Pessoa(id) ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT ordenadotipoServicoFK FOREIGN KEY (idServico) REFERENCES Servico(id) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS tempoServico (
    idStaff INTEGER,
    idServico INTEGER,
    horasTrabalho INTEGER NOT NULL,
    data DATE NOT NULL,
    CONSTRAINT tempoServiçoPK PRIMARY KEY (idStaff,idServico),
    CONSTRAINT tempoServiçoidFK FOREIGN KEY (idStaff) REFERENCES Pessoa(id) ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT tempoServiçotipoServicoFK FOREIGN KEY (idServico) REFERENCES Servico(id) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Sala (
    numero INTEGER,
    lotacao INTEGER NOT NULL,
    tipologia TEXT NOT NULL CONSTRAINT tipologiaValida CHECK (tipologia = "concertos" OR tipologia = "exposicoes" ),
    dimensoes REAL NOT NULL CONSTRAINT dimensoesValidas CHECK ( dimensoes > 0),
    CONSTRAINT SalaPK PRIMARY KEY (numero)
);

CREATE TABLE IF NOT EXISTS EventoCultural (
    id INTEGER,
    dataInicio DATE NOT NULL,
    dataFim DATE NOT NULL,
    limiteIdade INTEGER NOT NULL CONSTRAINT limiteIdadeValida CHECK (limiteIdade = 0 OR limiteIdade = 1),
    CONSTRAINT dataFimValida CHECK (dataInicio < dataFim),
    CONSTRAINT EventoCulturalPK PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Concerto (
    id INTEGER,
    tipoIluminacao TEXT NOT NULL CONSTRAINT tipoIluminacaoValido CHECK ( tipoIluminacao = "monocromatica" OR tipoIluminacao = "colorida"),
    tipoSom TEXT NOT NULL CONSTRAINT tipoSomValido CHECK ( tipoSom = "mesasMistura" OR tipoSom = "instrumentos"),
    CONSTRAINT ConcertoPK PRIMARY KEY (id),
    CONSTRAINT ConcertoidFK FOREIGN KEY (id) REFERENCES EventoCultural(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Exposicao (
    id INTEGER,
    projecoes INTEGER NOT NULL CONSTRAINT projecoesValido CHECK (projecoes >= 0),
    CONSTRAINT ExposicaoPK PRIMARY KEY (id),
    CONSTRAINT ExposicaoidFK FOREIGN KEY (id) REFERENCES EventoCultural(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Bilhete (
    numero INTEGER,
    utilizado INTEGER NOT NULL CONSTRAINT utilizadoValido CHECK (utilizado = 0 OR utilizado = 1),
    CONSTRAINT BilhetePK PRIMARY KEY (numero)
);
