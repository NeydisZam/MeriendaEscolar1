-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.30 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para bdcolegio
DROP DATABASE IF EXISTS `bdcolegio`;
CREATE DATABASE IF NOT EXISTS `bdcolegio` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bdcolegio`;

-- Volcando estructura para tabla bdcolegio.docente
DROP TABLE IF EXISTS `docente`;
CREATE TABLE IF NOT EXISTS `docente` (
  `idDocente` int NOT NULL,
  `PrimerNombre` varchar(45) NOT NULL,
  `SegundoNombre` varchar(45) NOT NULL,
  `PrimerApellido` varchar(45) NOT NULL,
  `SegundoApellido` varchar(45) NOT NULL,
  `Genero` enum('Femenino','Masculino') NOT NULL,
  PRIMARY KEY (`idDocente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla bdcolegio.entrega
DROP TABLE IF EXISTS `entrega`;
CREATE TABLE IF NOT EXISTS `entrega` (
  `identrega` varchar(45) NOT NULL,
  `merienda_idMerienda` int NOT NULL,
  `estudiante_idEstudiante` int NOT NULL,
  KEY `FK_MERIENDA` (`merienda_idMerienda`),
  KEY `FK_ESTUDI` (`estudiante_idEstudiante`),
  CONSTRAINT `FK_ESTUDI` FOREIGN KEY (`estudiante_idEstudiante`) REFERENCES `estudiante` (`idEstudiante`),
  CONSTRAINT `FK_MERIENDA` FOREIGN KEY (`merienda_idMerienda`) REFERENCES `merienda` (`idMerienda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla bdcolegio.estudiante
DROP TABLE IF EXISTS `estudiante`;
CREATE TABLE IF NOT EXISTS `estudiante` (
  `idEstudiante` int NOT NULL AUTO_INCREMENT,
  `PrimerNombre` varchar(45) NOT NULL,
  `SegundoNombre` varchar(45) NOT NULL,
  `PrimerApellido` varchar(45) NOT NULL,
  `SegundoApellido` varchar(45) NOT NULL,
  `Fecha_Nacimiento` date NOT NULL,
  `Genero` enum('Femenino','Masculino') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `tutor_idTutor` int NOT NULL,
  PRIMARY KEY (`idEstudiante`),
  KEY `FK_TUTOR` (`tutor_idTutor`),
  CONSTRAINT `FK_TUTOR` FOREIGN KEY (`tutor_idTutor`) REFERENCES `tutor` (`idTutor`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para procedimiento bdcolegio.getEstudiantes
DROP PROCEDURE IF EXISTS `getEstudiantes`;
DELIMITER //
CREATE PROCEDURE `getEstudiantes`(
    IN p_PrimerNombre VARCHAR(50),
    IN p_SegundoNombre VARCHAR(50),
    IN p_PrimerApellido VARCHAR(50),
    IN p_SegundoApellido VARCHAR(50),
    IN p_Fecha_Nacimiento DATE,
    IN p_Genero CHAR(1),
    IN p_tutor_idTutor INT
)
BEGIN
    INSERT INTO estudiante (
        PrimerNombre, 
        SegundoNombre, 
        PrimerApellido, 
        SegundoApellido, 
        Fecha_Nacimiento, 
        Genero, 
        tutor_idTutor
    ) VALUES (
        p_PrimerNombre, 
        p_SegundoNombre, 
        p_PrimerApellido, 
        p_SegundoApellido, 
        p_Fecha_Nacimiento, 
        p_Genero, 
        p_tutor_idTutor
    );
END//
DELIMITER ;

-- Volcando estructura para tabla bdcolegio.grado
DROP TABLE IF EXISTS `grado`;
CREATE TABLE IF NOT EXISTS `grado` (
  `idGrado` int NOT NULL,
  `Descripcion` varchar(45) NOT NULL,
  KEY `idGrado` (`idGrado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para procedimiento bdcolegio.insertar_estudiante
DROP PROCEDURE IF EXISTS `insertar_estudiante`;
DELIMITER //
CREATE PROCEDURE `insertar_estudiante`(
    IN p_PrimerNombre VARCHAR(50),
    IN p_SegundoNombre VARCHAR(50),
    IN p_PrimerApellido VARCHAR(50),
    IN p_SegundoApellido VARCHAR(50),
    IN p_Fecha_Nacimiento DATE,
    IN p_Genero CHAR(1),
    IN p_tutor_idTutor INT
)
BEGIN
    INSERT INTO estudiante (
        PrimerNombre, 
        SegundoNombre, 
        PrimerApellido, 
        SegundoApellido, 
        Fecha_Nacimiento, 
        Genero, 
        tutor_idTutor
    ) VALUES (
        p_PrimerNombre, 
        p_SegundoNombre, 
        p_PrimerApellido, 
        p_SegundoApellido, 
        p_Fecha_Nacimiento, 
        p_Genero, 
        p_tutor_idTutor
    );
END//
DELIMITER ;

-- Volcando estructura para tabla bdcolegio.merienda
DROP TABLE IF EXISTS `merienda`;
CREATE TABLE IF NOT EXISTS `merienda` (
  `idMerienda` int NOT NULL,
  `Detalle_del_paquete` varchar(45) NOT NULL,
  KEY `idMerienda` (`idMerienda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla bdcolegio.paquete
DROP TABLE IF EXISTS `paquete`;
CREATE TABLE IF NOT EXISTS `paquete` (
  `idPaquete` int NOT NULL,
  `DetallePaquete` varchar(45) NOT NULL,
  `Unidad_Medida` varchar(45) NOT NULL,
  `Existencia` int NOT NULL,
  `Merienda_idMerienda` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla bdcolegio.productos
DROP TABLE IF EXISTS `productos`;
CREATE TABLE IF NOT EXISTS `productos` (
  `idProductos` int NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla bdcolegio.seccion
DROP TABLE IF EXISTS `seccion`;
CREATE TABLE IF NOT EXISTS `seccion` (
  `idSeccion` int NOT NULL,
  `Descripcion` varchar(45) NOT NULL,
  `grado_idGrado` int NOT NULL,
  `docente_idDocente` int NOT NULL,
  `estudiante_idEstudiante` int NOT NULL,
  KEY `FK_ESTUD` (`estudiante_idEstudiante`),
  KEY `FK_DOCENTE` (`docente_idDocente`),
  KEY `FK_GRADO` (`grado_idGrado`),
  CONSTRAINT `FK_DOCENTE` FOREIGN KEY (`docente_idDocente`) REFERENCES `docente` (`idDocente`),
  CONSTRAINT `FK_ESTUD` FOREIGN KEY (`estudiante_idEstudiante`) REFERENCES `estudiante` (`idEstudiante`),
  CONSTRAINT `FK_GRADO` FOREIGN KEY (`grado_idGrado`) REFERENCES `grado` (`idGrado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para procedimiento bdcolegio.select_estudiante
DROP PROCEDURE IF EXISTS `select_estudiante`;
DELIMITER //
CREATE PROCEDURE `select_estudiante`()
BEGIN
    SELECT
        estudiante.idEstudiante, 
        estudiante.PrimerNombre, 
        estudiante.SegundoNombre, 
        estudiante.PrimerApellido, 
        estudiante.SegundoApellido, 
        estudiante.Fecha_Nacimiento, 
        estudiante.Genero, 
        estudiante.tutor_idTutor
    FROM
        estudiante;
END//
DELIMITER ;

-- Volcando estructura para tabla bdcolegio.tutor
DROP TABLE IF EXISTS `tutor`;
CREATE TABLE IF NOT EXISTS `tutor` (
  `idTutor` int NOT NULL,
  `Primer_Nombre` varchar(45) NOT NULL,
  `Segundo_Nombre` varchar(45) DEFAULT NULL,
  `Primer_Apellido` varchar(45) NOT NULL,
  `Segundo_Apellido` varchar(45) DEFAULT NULL,
  KEY `idTutor` (`idTutor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla bdcolegio.usuarios
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) NOT NULL,
  `usuario` varchar(250) NOT NULL,
  `contrasena` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
