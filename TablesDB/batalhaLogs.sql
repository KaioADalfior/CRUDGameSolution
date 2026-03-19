CREATE TABLE BatalhaLogs (
    idLog        INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    idBatalha    INT NOT NULL FOREIGN KEY REFERENCES Batalhas(idBatalha),
    Turno        INT NOT NULL,
    Descricao    VARCHAR(500) NOT NULL
);