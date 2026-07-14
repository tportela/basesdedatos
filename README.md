# Sistema de Base de Datos de Estudiantes

## Descripción

Este proyecto contiene un script en **T-SQL** para la creación de una base de datos académica en **Microsoft SQL Server**. El objetivo es administrar la información de estudiantes, carreras, materias, inscripciones y calificaciones mediante un modelo relacional.

La base de datos implementa buenas prácticas de diseño, incluyendo claves primarias, claves foráneas, restricciones de integridad y datos de ejemplo para facilitar las pruebas.

---

## Tecnologías utilizadas

* Microsoft SQL Server
* Transact-SQL (T-SQL)
* SQL Server Management Studio (SSMS) o Azure Data Studio

---

## Estructura de la base de datos

La base de datos se denomina **EscuelaDB** y está compuesta por las siguientes tablas:

### Estudiantes

Almacena la información personal de cada estudiante.

**Campos principales:**

* IdEstudiante (PK)
* Matricula
* Nombre
* ApellidoPaterno
* ApellidoMaterno
* FechaNacimiento
* Sexo
* Correo
* Telefono
* FechaRegistro

---

### Carreras

Contiene el catálogo de carreras disponibles.

**Campos principales:**

* IdCarrera (PK)
* NombreCarrera
* DuracionSemestres

---

### Materias

Almacena el catálogo de materias.

**Campos principales:**

* IdMateria (PK)
* NombreMateria
* Creditos

---

### Inscripciones

Relaciona estudiantes con las carreras en las que están inscritos.

**Campos principales:**

* IdInscripcion (PK)
* IdEstudiante (FK)
* IdCarrera (FK)
* FechaInscripcion

---

### Calificaciones

Registra las calificaciones obtenidas por los estudiantes en cada materia.

**Campos principales:**

* IdCalificacion (PK)
* IdEstudiante (FK)
* IdMateria (FK)
* Calificacion

---

## Modelo relacional

```text
Estudiantes
      |
      | 1
      |
      | N
Inscripciones -------- Carreras

Estudiantes
      |
      | 1
      |
      | N
Calificaciones -------- Materias
```

---

## Funcionalidades

* Creación automática de la base de datos.
* Creación de tablas con claves primarias.
* Relaciones mediante claves foráneas.
* Restricciones de integridad (`PRIMARY KEY`, `FOREIGN KEY`, `UNIQUE`, `CHECK` y `DEFAULT`).
* Inserción de datos de prueba.
* Consultas SQL para verificar el funcionamiento.

---

## Instalación

1. Abrir **SQL Server Management Studio (SSMS)**.
2. Conectarse a una instancia de SQL Server.
3. Abrir el archivo `.sql` del proyecto.
4. Ejecutar el script completo.
5. Verificar que la base de datos **EscuelaDB** se haya creado correctamente.

---

## Datos de ejemplo

El script inserta información inicial en:

* Carreras
* Materias
* Estudiantes
* Inscripciones
* Calificaciones

Esto permite realizar pruebas inmediatamente después de ejecutar el script.

---

## Consultas incluidas

El proyecto incorpora consultas de ejemplo para:

* Listar estudiantes.
* Consultar estudiantes con su carrera.
* Mostrar las calificaciones por materia.
* Verificar las relaciones entre las tablas.

---

## Estructura del proyecto

```text
Proyecto/
│
├── EscuelaDB.sql
├── README.md
└── LICENSE (opcional)
```

---

## Posibles mejoras

* Agregar tabla de profesores.
* Administrar grupos y horarios.
* Control de asistencia.
* Gestión de periodos escolares.
* Usuarios y roles.
* Procedimientos almacenados.
* Vistas.
* Funciones.
* Triggers.
* Índices para optimización.
* Respaldos automáticos.

---

## Licencia

Este proyecto puede utilizarse con fines educativos y de aprendizaje. Se recomienda adaptar la estructura a las necesidades específicas de cada institución educativa.
