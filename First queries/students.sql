create database academy;
use academy;

CREATE TABLE Estudiantes (
    EstudianteID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    FechaNacimiento DATE,
    Email VARCHAR(100)
);

CREATE TABLE Cursos (
    CursoID INT PRIMARY KEY AUTO_INCREMENT,
    NombreCurso VARCHAR(100),
    Creditos INT
);

CREATE TABLE Inscripciones (
    InscripcionID INT PRIMARY KEY AUTO_INCREMENT,
    EstudianteID INT NOT NULL,
    CursoID INT NOT NULL,
    FechaInscripcion DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (EstudianteID) REFERENCES Estudiantes(EstudianteID),
    FOREIGN KEY (CursoID) REFERENCES Cursos(CursoID)
);



SHOW TABLES;

DESCRIBE Estudiantes;
DESCRIBE Cursos;

-- Database > Reverse Engineer



