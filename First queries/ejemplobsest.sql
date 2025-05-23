-- ======================================
-- 1. CREAR UNA BASE DE DATOS
-- ======================================
CREATE DATABASE EscuelaDB;
USE EscuelaDB;

-- ======================================
-- 2. CREAR TABLAS
-- ======================================
CREATE TABLE Estudiantes (
    EstudianteID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    FechaNacimiento DATE,
    Email VARCHAR(100)
);

CREATE TABLE Cursos (
    CursoID INT AUTO_INCREMENT PRIMARY KEY,
    NombreCurso VARCHAR(100) NOT NULL,
    Creditos INT NOT NULL
);

CREATE TABLE Inscripciones (
    InscripcionID INT AUTO_INCREMENT PRIMARY KEY,
    EstudianteID INT NOT NULL,
    CursoID INT NOT NULL,
    FechaInscripcion DATE DEFAULT CURRENT_DATE,

    FOREIGN KEY (EstudianteID) REFERENCES Estudiantes(EstudianteID),
    FOREIGN KEY (CursoID) REFERENCES Cursos(CursoID)
);

-- ======================================
-- 3. INSERTAR DATOS
-- ======================================
INSERT INTO Estudiantes (Nombre, Apellido, FechaNacimiento, Email)
VALUES
('Ana', 'Pérez', '2000-05-12', 'ana.perez@email.com'),
('Luis', 'Gómez', '1998-11-23', 'luis.gomez@email.com');

INSERT INTO Cursos (NombreCurso, Creditos)
VALUES
('Matemáticas', 5),
('Historia', 3);

INSERT INTO Inscripciones (EstudianteID, CursoID)
VALUES
(1, 1), -- Ana en Matemáticas
(2, 2); -- Luis en Historia

-- ======================================
-- 4. CONSULTAS BÁSICAS
-- ======================================
SELECT * FROM Estudiantes;

SELECT Nombre, Apellido FROM Estudiantes;

SELECT 
    CONCAT(e.Nombre, ' ', e.Apellido) AS Estudiante,
    c.NombreCurso,
    i.FechaInscripcion
FROM Inscripciones i
JOIN Estudiantes e ON i.EstudianteID = e.EstudianteID
JOIN Cursos c ON i.CursoID = c.CursoID;

-- ======================================
-- 5. ACTUALIZAR DATOS
-- ======================================
UPDATE Estudiantes
SET Email = 'ana.perez123@email.com'
WHERE EstudianteID = 1;

-- ======================================
-- 6. ELIMINAR DATOS
-- ======================================
DELETE FROM Inscripciones
WHERE InscripcionID = 2;

-- ======================================
-- 7. ELIMINAR TABLAS
-- ======================================
DROP TABLE IF EXISTS Inscripciones;
DROP TABLE IF EXISTS Cursos;
DROP TABLE IF EXISTS Estudiantes;

-- ======================================
-- 8. ELIMINAR BASE DE DATOS
-- ======================================
DROP DATABASE IF EXISTS EscuelaDB;
