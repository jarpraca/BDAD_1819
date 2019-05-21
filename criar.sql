PRAGMA foreign_keys = ON;
BEGIN TRANSACTION;

-- Table: Agenda
DROP TABLE IF EXISTS Agenda;

CREATE TABLE Agenda (
    data DATE PRIMARY KEY 
);

-- Table: Pais
DROP TABLE IF EXISTS Pais;

CREATE TABLE Pais (
    id      INTEGER PRIMARY KEY,
    nome    VARCHAR(15) UNIQUE NOT NULL 
);

-- Table: Cidade
DROP TABLE IF EXISTS Cidade;

CREATE TABLE Cidade (
    id      INTEGER PRIMARY KEY,
    nome    VARCHAR(15) NOT NULL, 
    pais    INTEGER REFERENCES Pais (id) 
);

-- Table: Utilizador
DROP TABLE IF EXISTS Utilizador;

CREATE TABLE Utilizador (
    id              INTEGER PRIMARY KEY,
    nome            VARCHAR(30) NOT NULL, 
    dataNascimento  DATE        NOT NULL, 
    email           VARCHAR(30) NOT NULL, 
    telefone        VARCHAR(15) NOT NULL, 
    morada          VARCHAR(250) NOT NULL, 
    codigoPostal    VARCHAR(10) NOT NULL, 
    classificacaoMedia INTEGER CHECK(classificacaoMedia >= 1 AND classificacaoMedia <= 5),
    pais            INTEGER REFERENCES Pais (id) ON DELETE SET NULL ON UPDATE CASCADE
);

-- Table: Cliente
DROP TABLE IF EXISTS Cliente;

CREATE TABLE Cliente (
    id  INTEGER REFERENCES Utilizador(id)  ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY(id)
);


-- Table: Anfitriao
DROP TABLE IF EXISTS Anfitriao;

CREATE TABLE Anfitriao (
    id INTEGER REFERENCES Utilizador(id)  ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY(id)
);

-- Table: MetodoDePagamento
DROP TABLE IF EXISTS MetodoDePagamento;

CREATE TABLE MetodoDePagamento (
    id      INTEGER PRIMARY KEY,
    nome    VARCHAR(25)  NOT NULL
);

-- Table: Aceita
DROP TABLE IF EXISTS Aceita;

CREATE TABLE Aceita ( 
    anfitriao   INTEGER REFERENCES Anfitriao (id) ON DELETE CASCADE ON UPDATE CASCADE, 
    metodo      INTEGER  REFERENCES MetodoDePagamento(id) ON DELETE CASCADE ON UPDATE CASCADE, 
    PRIMARY KEY (anfitriao, metodo)
);

-- Table: Reserva
DROP TABLE IF EXISTS Reserva;

CREATE TABLE Reserva (
    id          INTEGER PRIMARY KEY, 
    dataCheckIn DATE    NOT NULL, 
    dataCheckOut DATE   NOT NULL, 
    numHospedes INTEGER CHECK (numHospedes > 0), 
    precoTotal  REAL    CHECK (precoTotal > 0), 
    habitacao   INTEGER REFERENCES Habitacao (id)
);

-- Table: Estado
DROP TABLE IF EXISTS Estado;

CREATE TABLE Estado (
    id      INTEGER PRIMARY KEY,                 
    estado  CHAR(9), 
    reserva INTEGER REFERENCES Reserva(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Table: Cancelamento
DROP TABLE IF EXISTS Cancelamento;

CREATE TABLE Cancelamento (
    reembolso   INTEGER     NOT NULL, 
    cliente     INTEGER REFERENCES Cliente (id)  ON DELETE CASCADE ON UPDATE CASCADE, 
    reserva     INTEGER REFERENCES Reserva (id)  ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY(reserva)
);

-- Table: ClassificacaoPorAnfitriao
DROP TABLE IF EXISTS ClassificacaoPorAnfitriao;

CREATE TABLE ClassificacaoPorAnfitriao (
    classificacao   INTEGER CHECK(classificacao >= 1 AND classificacao <= 5), 
    descricao       VARCHAR(500) DEFAULT 'Nao preenchido', 
    reserva         INTEGER REFERENCES Reserva (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
    anfitriao       INTEGER REFERENCES Anfitriao (id) ON DELETE RESTRICT ON UPDATE RESTRICT, 
    PRIMARY KEY (reserva)
);

-- Table: ClassificacaoPorCliente
DROP TABLE IF EXISTS ClassificacaoPorCliente;

CREATE TABLE ClassificacaoPorCliente (
    limpeza     INTEGER CHECK(limpeza >= 1 AND limpeza <= 5), 
    valor       INTEGER CHECK(valor >= 1 AND valor <= 5),
    checkIn     INTEGER CHECK(checkIn >= 1 AND checkIn <= 5),
    localizacao INTEGER CHECK(localizacao >= 1 AND localizacao <= 5),
    outros      VARCHAR(500), 
    classificacaoAnfitriao  INTEGER CHECK(classificacaoAnfitriao >= 1 AND classificacaoAnfitriao <= 5),
    descricaoAnfitriao      VARCHAR(500) DEFAULT 'Nao preenchido', 
    cliente INTEGER REFERENCES Cliente (id)  ON DELETE RESTRICT ON UPDATE RESTRICT,
    reserva INTEGER REFERENCES Reserva (id) ON DELETE RESTRICT ON UPDATE RESTRICT, 
    PRIMARY KEY (reserva)
);

-- Table: Comodidade
DROP TABLE IF EXISTS Comodidade;

CREATE TABLE Comodidade (
    id      INTEGER PRIMARY KEY,
    nome    VARCHAR(15)  NOT NULL
);

-- Table: Efetua
DROP TABLE IF EXISTS Efetua;

CREATE TABLE Efetua (
    cliente INTEGER REFERENCES Cliente(id) ON DELETE CASCADE ON UPDATE CASCADE, 
    reserva INTEGER REFERENCES Reserva(id) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY(reserva)
);

-- Table: EscolhidoPelocliente
DROP TABLE IF EXISTS EscolhidoPelocliente;

CREATE TABLE EscolhidoPelocliente (
    metodo  INTEGER REFERENCES MetodoDePagamento(id) ON DELETE CASCADE ON UPDATE CASCADE, 
    reserva INTEGER REFERENCES Reserva(id) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (reserva)
);

-- Table: TipoDeHabitacao
DROP TABLE IF EXISTS TipoDeHabitacao;

CREATE TABLE TipoDeHabitacao (
    id   INTEGER PRIMARY KEY,
    nome VARCHAR(30) NOT NULL
);

-- Table: PoliticaDeCancelamento
DROP TABLE IF EXISTS PoliticaDeCancelamento;

CREATE TABLE PoliticaDeCancelamento (
    id          INTEGER PRIMARY KEY,
    nome        VARCHAR(25) NOT NULL, 
    descricao   VARCHAR(500) NOT NULL, 
    percentagemReembolso INTEGER CHECK (percentagemReembolso >= 0 AND percentagemReembolso <= 1)
);

-- Table: Habitacao
DROP TABLE IF EXISTS Habitacao;

CREATE TABLE Habitacao (
    id INTEGER PRIMARY KEY,
    numQuartos  INTEGER CHECK (numQuartos > 0), 
    maxHospedes INTEGER CHECK (maxHospedes > 0), 
    morada      VARCHAR(250) UNIQUE, 
    distCentro  INTEGER CHECK (distCentro >= 0), 
    precoNoite  REAL    CHECK (precoNoite > 0), 
    taxaLimpeza REAL CHECK (taxaLimpeza >= 0), 
    classificacaoMedia INTEGER  CHECK(classificacaoMedia >= 1 AND classificacaoMedia <= 5), 
    cidade      INTEGER REFERENCES Cidade (id) ON DELETE CASCADE ON UPDATE CASCADE, 
    tipo        INTEGER REFERENCES TipoDeHabitacao (id) ON DELETE SET NULL ON UPDATE CASCADE, 
    politica    INTEGER REFERENCES PoliticaDeCancelamento (id) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- Table: Disponivel
DROP TABLE IF EXISTS Disponivel;

CREATE TABLE Disponivel (
    habitacao   INTEGER REFERENCES Habitacao (id)  ON DELETE CASCADE ON UPDATE CASCADE, 
    data        DATE REFERENCES Agenda (data)  ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (habitacao, data)
);

-- Table: Dispoe
DROP TABLE IF EXISTS Dispoe;

CREATE TABLE Dispoe (
    comodidade  INTEGER REFERENCES Comodidade (id) ON DELETE CASCADE ON UPDATE CASCADE, 
    habitacao   INTEGER REFERENCES Habitacao (id) ON DELETE CASCADE ON UPDATE CASCADE, 
    PRIMARY KEY (comodidade, habitacao)
);

-- Table: Favorito
DROP TABLE IF EXISTS Favorito;

CREATE TABLE Favorito (
    cliente     INTEGER REFERENCES Cliente (id) ON DELETE CASCADE ON UPDATE CASCADE, 
    habitacao   INTEGER REFERENCES Habitacao (id) ON DELETE CASCADE ON UPDATE CASCADE, 
    PRIMARY KEY (cliente, habitacao)
);

-- Table: Fotografia
DROP TABLE IF EXISTS Fotografia;

CREATE TABLE Fotografia (
    urlImagem   VARCHAR(20) PRIMARY KEY, 
    legenda     VARCHAR(250) DEFAULT NULL, 
    habitacao   INTEGER REFERENCES Habitacao(id) ON DELETE CASCADE ON UPDATE CASCADE
);


-- Table: Possui
DROP TABLE IF EXISTS Possui;

CREATE TABLE Possui (
    anfitriao   INTEGER REFERENCES Anfitriao (id) ON DELETE CASCADE ON UPDATE CASCADE, 
    habitacao   INTEGER REFERENCES Habitacao (id) ON DELETE CASCADE ON UPDATE CASCADE, 
    PRIMARY KEY (habitacao)
);

COMMIT TRANSACTION;