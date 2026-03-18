CREATE TABLE Personagens(
    idPersonagem INT PRIMARY KEY IDENTITY(1,1) NOT NULL,

    Nome VARCHAR(255) NOT NULL,
    Nivel INT NOT NULL,
    Sexo VARCHAR(50),

    idRaca INT NOT NULL,
    idSubclasse INT NOT NULL,

    idAtributo INT NOT NULL,
    idAparencia INT NOT NULL,

    DataCriacao DATETIME DEFAULT GETDATE(),

    FOREIGN KEY (idRaca) REFERENCES Racas(idRaca),
    FOREIGN KEY (idSubclasse) REFERENCES Subclasses(idSubclasse),
    FOREIGN KEY (idAtributo) REFERENCES Atributos(idAtributo),
    FOREIGN KEY (idAparencia) REFERENCES Aparencias(idAparencia)
);