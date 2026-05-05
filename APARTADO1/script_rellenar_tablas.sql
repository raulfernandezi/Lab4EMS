USE `gestionasignaturas`;

-- 1. TABLAS MAESTRAS (Nivel 1)
-- -----------------------------------------------------

INSERT INTO `ALUMNO` (`DNI`, `N_Mat`, `Nombre`, `Apellidos`) VALUES 
('12345678A', 'M2401', 'Juan', 'García Pérez'),
('87654321B', 'M2402', 'María', 'López Martínez'),
('11223344C', 'M2403', 'Andrés', 'Castro Soler');

INSERT INTO `GRUPO_CLASE` (`Cod_GC`) VALUES 
('GC_MAÑANA_A'), 
('GC_TARDE_B');

INSERT INTO `PROFESOR` (`Cod_P`, `Nombre`, `Apellidos`, `activo`) VALUES 
(1, 'Roberto', 'Jiménez Sanz', 1),
(2, 'Elena', 'Belmonte Rey', 1);

INSERT INTO `CURSO` (`Cod_CURSO`, `actual`) VALUES 
(2023, b'0'),
(2024, b'1'),
(2025, b'0');

INSERT INTO `GRUPO_PRACTICA` (`Cod_GP`, `activo`) VALUES 
(101, b'1'),
(102, b'1');

INSERT INTO `PRACTICA` (`Cod_Practica`) VALUES 
('PRAC_SQL_BASICA'), 
('PRAC_JDBC_AVANZADA');

INSERT INTO `EXAMEN` (`Cod_Ex`) VALUES 
('EX_PARCIAL_1'), 
('EX_FINAL_JUNIO');

INSERT INTO `CONVOCATORIA` (`idCONVOCATORIA`, `actual`) VALUES 
('ORDINARIA', b'1'),
('EXTRAORDINARIA', b'0');

-- 2. TABLAS DE CONFIGURACIÓN (Nivel 2)
-- -----------------------------------------------------

-- Ev_Continua es PK, el resto son pesos (flotantes)
INSERT INTO `TIPO_EVALUACION` (`Ev_Continua`, `Peso_Ex`, `Peso_Pr`, `Peso_Ev_C`) VALUES 
(1, 0.40, 0.30, 0.30), -- Evaluación Continua
(0, 0.70, 0.30, 0.00); -- Evaluación Final

-- 3. TABLAS DE RELACIÓN (Nivel 3)
-- -----------------------------------------------------

-- Tabla imparte
INSERT INTO `imparte` (`PROFESOR_Cod_P`, `GRUPO_CLASE_Cod_GC`, `CURSO_Cod_CURSO`) VALUES 
(1, 'GC_MAÑANA_A', 2024),
(2, 'GC_TARDE_B', 2024);

-- Tabla MATRICULA
INSERT INTO `MATRICULA` (`Cod_MATRICULA`, `ALUMNO_DNI`, `GRUPO_CLASE_Cod_GC`, `CURSO_Cod_CURSO`) VALUES 
(1, '12345678A', 'GC_MAÑANA_A', 2024),
(2, '87654321B', 'GC_TARDE_B', 2024);

-- Tabla TUTORIA
INSERT INTO `TUTORIA` (`Cod_TUTORIA`, `PROFESOR_Cod_P`, `GRUPO_PRACTICA_Cod_GP`, `CURSO_Cod_CURSO`, `CONVOCATORIA_idCONVOCATORIA`) VALUES 
(10, 1, 101, 2024, 'ORDINARIA'),
(20, 2, 102, 2024, 'EXTRAORDINARIA');

-- 4. TABLA FINAL (EVALUACION - Todas las columnas)
-- -----------------------------------------------------

INSERT INTO `EVALUACION` (
  `Cod_Evaluacion`, `ALUMNO_DNI`, `GRUPO_PRACTICA_Cod_GP`, `TIPO_EVALUACION_Ev_Continua`, 
  `PRACTICA_Cod_Practica`, `EXAMEN_Cod_Ex`, `Nota_Pr`, `Nota_Ev_C`, `Nota_P1`, `Nota_P2`, 
  `Nota_P3`, `Nota_P4`, `Nota_Final`, `CURSO_Cod_CURSO`, `CONVOCATORIA_idCONVOCATORIA`, 
  `Practica_convalidada`, `Examen_convalidado`
) VALUES 
(1, '12345678A', 101, 1, 'PRAC_SQL_BASICA', 'EX_PARCIAL_1', 8.5, 7.0, 9.0, 8.0, 7.5, 8.0, 8.1, 2024, 'ORDINARIA', 0, 0),
(2, '87654321B', 102, 0, 'PRAC_JDBC_AVANZADA', 'EX_FINAL_JUNIO', 6.0, 0.0, 5.0, 6.0, 6.5, 7.0, 6.2, 2024, 'ORDINARIA', 0, 0);
