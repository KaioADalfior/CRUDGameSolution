CREATE TABLE Inimigos (
    idInimigo    INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    Nome         VARCHAR(255) NOT NULL,
    Nivel        INT NOT NULL,
    Sexo         VARCHAR(50),
    Raca         VARCHAR(255) NOT NULL,
    Subclasse    VARCHAR(255) NOT NULL,

    Forca        INT NOT NULL,
    Destreza     INT NOT NULL,
    Sabedoria    INT NOT NULL,
    Constituicao INT NOT NULL,
    Inteligencia INT NOT NULL,
    Carisma      INT NOT NULL,

    Peso         DECIMAL(12,2),
    Altura       DECIMAL(12,2),
    CorCabelo    VARCHAR(255),
    EstiloCabelo VARCHAR(255),
    CorOlho      VARCHAR(255),
    CorPele      VARCHAR(255),
    DataCriacao  DATETIME DEFAULT GETDATE()
);