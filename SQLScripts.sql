-- Crear la base de datos
CREATE DATABASE EscuelaDB;
GO

-- Seleccionar la base de datos
USE EscuelaDB;
GO

-- ==========================
-- Tabla: Estudiantes
-- ==========================
CREATE TABLE Estudiantes (
    IdEstudiante INT IDENTITY(1,1) PRIMARY KEY,
    Matricula VARCHAR(15) NOT NULL UNIQUE,
    Nombre VARCHAR(50) NOT NULL,
    ApellidoPaterno VARCHAR(50) NOT NULL,
    ApellidoMaterno VARCHAR(50),
    FechaNacimiento DATE,
    Sexo CHAR(1) CHECK (Sexo IN ('M', 'F')),
    Correo VARCHAR(100) UNIQUE,
    Telefono VARCHAR(15),
    FechaRegistro DATETIME DEFAULT GETDATE()
);
GO

-- ==========================
-- Tabla: Carreras
-- ==========================
CREATE TABLE Carreras (
    IdCarrera INT IDENTITY(1,1) PRIMARY KEY,
    NombreCarrera VARCHAR(100) NOT NULL,
    DuracionSemestres INT NOT NULL
);
GO

-- ==========================
-- Tabla: Materias
-- ==========================
CREATE TABLE Materias (
    IdMateria INT IDENTITY(1,1) PRIMARY KEY,
    NombreMateria VARCHAR(100) NOT NULL,
    Creditos INT NOT NULL
);
GO

-- ==========================
-- Tabla: Inscripciones
-- ==========================
CREATE TABLE Inscripciones (
    IdInscripcion INT IDENTITY(1,1) PRIMARY KEY,
    IdEstudiante INT NOT NULL,
    IdCarrera INT NOT NULL,
    FechaInscripcion DATE DEFAULT GETDATE(),

    CONSTRAINT FK_Inscripcion_Estudiante
        FOREIGN KEY (IdEstudiante)
        REFERENCES Estudiantes(IdEstudiante),

    CONSTRAINT FK_Inscripcion_Carrera
        FOREIGN KEY (IdCarrera)
        REFERENCES Carreras(IdCarrera)
);
GO

-- ==========================
-- Tabla: Calificaciones
-- ==========================
CREATE TABLE Calificaciones (
    IdCalificacion INT IDENTITY(1,1) PRIMARY KEY,
    IdEstudiante INT NOT NULL,
    IdMateria INT NOT NULL,
    Calificacion DECIMAL(4,2)
        CHECK (Calificacion BETWEEN 0 AND 100),

    CONSTRAINT FK_Calificacion_Estudiante
        FOREIGN KEY (IdEstudiante)
        REFERENCES Estudiantes(IdEstudiante),

    CONSTRAINT FK_Calificacion_Materia
        FOREIGN KEY (IdMateria)
        REFERENCES Materias(IdMateria)
);
GO

-- ==========================
-- Datos de ejemplo
-- ==========================

INSERT INTO Carreras (NombreCarrera, DuracionSemestres)
VALUES
('Ingeniería en Sistemas', 9),
('Administración', 8),
('Contabilidad', 8);

INSERT INTO Materias (NombreMateria, Creditos)
VALUES
('Bases de Datos', 8),
('Programación', 10),
('Matemáticas', 7),
('Redes', 8);

INSERT INTO Estudiantes
(Matricula, Nombre, ApellidoPaterno, ApellidoMaterno,
 FechaNacimiento, Sexo, Correo, Telefono)
VALUES
('2026001', 'Juan', 'Pérez', 'López',
 '2004-03-15', 'M', 'juan@correo.com', '5551234567'),

('2026002', 'María', 'García', 'Ruiz',
 '2005-08-20', 'F', 'maria@correo.com', '5559876543');

INSERT INTO Inscripciones (IdEstudiante, IdCarrera)
VALUES
(1,1),
(2,2);

INSERT INTO Calificaciones
(IdEstudiante, IdMateria, Calificacion)
VALUES
(1,1,95),
(1,2,88),
(2,1,92),
(2,3,85);
GO

-- ==========================
-- Consultas de prueba
-- ==========================

-- Lista de estudiantes
SELECT * FROM Estudiantes;

-- Estudiantes con su carrera
SELECT
    E.Nombre,
    E.ApellidoPaterno,
    C.NombreCarrera
FROM Estudiantes E
INNER JOIN Inscripciones I
    ON E.IdEstudiante = I.IdEstudiante
INNER JOIN Carreras C
    ON I.IdCarrera = C.IdCarrera;

-- Calificaciones de los estudiantes
SELECT
    E.Nombre,
    M.NombreMateria,
    C.Calificacion
FROM Calificaciones C
INNER JOIN Estudiantes E
    ON C.IdEstudiante = E.IdEstudiante
INNER JOIN Materias M
    ON C.IdMateria = M.IdMateria;