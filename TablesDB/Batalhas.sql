CREATE TABLE Batalhas (
    idBatalha     INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    idPersonagem  INT NOT NULL FOREIGN KEY REFERENCES Personagens(idPersonagem),
    idInimigo     INT NOT NULL FOREIGN KEY REFERENCES Inimigos(idInimigo),
    Resultado     VARCHAR(10) NOT NULL,  
    Turnos        INT NOT NULL DEFAULT 0,
    DataBatalha   DATETIME DEFAULT GETDATE()
);