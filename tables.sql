USE pracabd1;

DROP TABLE IF EXISTS Clientes_Juegos;
DROP TABLE IF EXISTS Juegos;
DROP TABLE IF EXISTS Clientes;

CREATE TABLE Clientes (
    ClienteID       INT PRIMARY KEY,
    DNI             VARCHAR(9) NOT NULL UNIQUE,
    Nombre          VARCHAR(20) NOT NULL,
    Apellidos       VARCHAR(30) NOT NULL,
    Genero          CHAR(1) CHECK (Genero IN ('H','M')),
    Direccion       VARCHAR(60),
    Localidad       VARCHAR(50),
    Provincia       VARCHAR(30),
    CodPostal       VARCHAR(5),
    Telefono        VARCHAR(9),
    Canal           INT CHECK (Canal IN (0,1,2,3,4)),
    FechaNacimiento DATE,
    FechaContacto   DATE,
    Email           VARCHAR(60)
);

CREATE TABLE Juegos (
    JuegoID     INT PRIMARY KEY,
    Titulo      VARCHAR(64) NOT NULL,
    Consola     VARCHAR(12) NOT NULL,
    Tamano      INT,
    Editor      VARCHAR(32)
);

CREATE TABLE Clientes_Juegos (
    ClienteID      INT,
    JuegoID        INT,
    FechaAlquiler  DATE,
    Comentarios    VARCHAR(500),

    CONSTRAINT PK_Clientes_Juegos
        PRIMARY KEY (ClienteID, JuegoID, FechaAlquiler),

    CONSTRAINT FK_CJ_Cliente
        FOREIGN KEY (ClienteID)
        REFERENCES Clientes(ClienteID),

    CONSTRAINT FK_CJ_Juego
        FOREIGN KEY (JuegoID)
        REFERENCES Juegos(JuegoID)
);