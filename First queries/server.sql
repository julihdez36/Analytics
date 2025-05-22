-- ======================================
-- 1. CREAR UNA BASE DE DATOS
-- ======================================
CREATE DATABASE EscuelaDB;
GO

-- Seleccionar la base de datos para usarla
USE EscuelaDB;
GO

-- ======================================
-- 2. CREAR TABLAS
-- ======================================
CREATE TABLE Estudiantes (
    EstudianteID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(50) NOT NULL,
    Apellido NVARCHAR(50) NOT NULL,
    FechaNacimiento DATE,
    Email NVARCHAR(100)
);
GO

CREATE TABLE Cursos (
    CursoID INT PRIMARY KEY IDENTITY(1,1),
    NombreCurso NVARCHAR(100) NOT NULL,
    Creditos INT NOT NULL
);
GO

CREATE TABLE Inscripciones (
    InscripcionID INT PRIMARY KEY IDENTITY(1,1),
    EstudianteID INT NOT NULL,
    CursoID INT NOT NULL,
    FechaInscripcion DATE DEFAULT GETDATE(),

    CONSTRAINT FK_Inscripciones_Estudiantes FOREIGN KEY (EstudianteID)
        REFERENCES Estudiantes(EstudianteID),

    CONSTRAINT FK_Inscripciones_Cursos FOREIGN KEY (CursoID)
        REFERENCES Cursos(CursoID)
);
GO

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
GO

INSERT INTO Inscripciones (EstudianteID, CursoID)
VALUES
(1, 1), -- Ana en Matemáticas
(2, 2); -- Luis en Historia
GO

-- ======================================
-- 4. CONSULTAS BÁSICAS (SELECT)
-- ======================================
-- Seleccionar todos los estudiantes
SELECT * FROM Estudiantes;

-- Seleccionar nombre y apellido de estudiantes
SELECT Nombre, Apellido FROM Estudiantes;

-- Consultar inscripciones con nombres
SELECT 
    e.Nombre + ' ' + e.Apellido AS Estudiante,
    c.NombreCurso,
    i.FechaInscripcion
FROM Inscripciones i
JOIN Estudiantes e ON i.EstudianteID = e.EstudianteID
JOIN Cursos c ON i.CursoID = c.CursoID;
GO

-- ======================================
-- 5. ACTUALIZAR DATOS (UPDATE)
-- ======================================
UPDATE Estudiantes
SET Email = 'ana.perez123@email.com'
WHERE EstudianteID = 1;
GO

-- ======================================
-- 6. ELIMINAR DATOS (DELETE)
-- ======================================
DELETE FROM Inscripciones
WHERE InscripcionID = 2; -- Eliminar inscripción de Luis en Historia
GO

-- ======================================
-- 7. ELIMINAR TABLAS
-- ======================================
DROP TABLE Inscripciones;
DROP TABLE Cursos;
DROP TABLE Estudiantes;
GO

-- ======================================
-- 8. ELIMINAR BASE DE DATOS
-- ======================================
USE master;
GO
DROP DATABASE EscuelaDB;
GO
