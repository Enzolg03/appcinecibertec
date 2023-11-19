CREATE DATABASE  IF NOT EXISTS `bdcine` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bdcine`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: bdcine
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `asiento`
--

DROP TABLE IF EXISTS `asiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asiento` (
  `IdAsiento` int NOT NULL AUTO_INCREMENT,
  `NroAsiento` int NOT NULL,
  `IdSala` int NOT NULL,
  `IdEstado` int NOT NULL,
  PRIMARY KEY (`IdAsiento`),
  KEY `FK_ASIENTO_SALA` (`IdSala`),
  KEY `FK_ASIENTO_ESTADO` (`IdEstado`),
  CONSTRAINT `FK_ASIENTO_ESTADO` FOREIGN KEY (`IdEstado`) REFERENCES `estado` (`IdEstado`),
  CONSTRAINT `FK_ASIENTO_SALA` FOREIGN KEY (`IdSala`) REFERENCES `sala` (`IdSala`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asiento`
--

LOCK TABLES `asiento` WRITE;
/*!40000 ALTER TABLE `asiento` DISABLE KEYS */;
INSERT INTO `asiento` VALUES (1,1,1,1),(2,2,1,1),(3,3,1,1),(4,4,1,1),(5,5,1,1),(6,6,1,1),(7,7,1,1),(8,8,1,1),(9,9,1,1),(10,10,1,1),(11,11,1,1),(12,12,1,1),(13,13,1,1),(14,14,1,1),(15,1,2,1),(16,2,2,1),(17,3,2,1),(18,4,2,1),(19,5,2,1),(20,6,2,1),(21,7,2,1),(22,8,2,1),(23,9,2,1),(24,10,2,1),(25,11,2,1),(26,12,2,1),(27,13,2,1),(28,14,2,1);
/*!40000 ALTER TABLE `asiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asientocliente`
--

DROP TABLE IF EXISTS `asientocliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asientocliente` (
  `IdAcliente` int NOT NULL AUTO_INCREMENT,
  `IdRasiento` int NOT NULL,
  `IdCliente` int NOT NULL,
  PRIMARY KEY (`IdAcliente`),
  KEY `FK_ACLIENTE_RCLIENTE` (`IdRasiento`),
  KEY `FK_ACLIENTE_CLIENTE` (`IdCliente`),
  CONSTRAINT `FK_ACLIENTE_CLIENTE` FOREIGN KEY (`IdCliente`) REFERENCES `cliente` (`IdCliente`),
  CONSTRAINT `FK_ACLIENTE_RCLIENTE` FOREIGN KEY (`IdRasiento`) REFERENCES `registroasiento` (`IdRasiento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asientocliente`
--

LOCK TABLES `asientocliente` WRITE;
/*!40000 ALTER TABLE `asientocliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `asientocliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartelera`
--

DROP TABLE IF EXISTS `cartelera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cartelera` (
  `IdCartelera` int NOT NULL AUTO_INCREMENT,
  `IdPelicula` int NOT NULL,
  `IdSala` int NOT NULL,
  `HoraInicio` time NOT NULL,
  `HoraFin` time NOT NULL,
  `Fecha` date NOT NULL,
  `IdEstado` int NOT NULL,
  PRIMARY KEY (`IdCartelera`),
  KEY `FK_CARTELERA_PELICULA` (`IdPelicula`),
  KEY `FK_CARTELERA_SALA` (`IdSala`),
  KEY `FK_CARTELERA_ESTADO` (`IdEstado`),
  CONSTRAINT `FK_CARTELERA_ESTADO` FOREIGN KEY (`IdEstado`) REFERENCES `estado` (`IdEstado`),
  CONSTRAINT `FK_CARTELERA_PELICULA` FOREIGN KEY (`IdPelicula`) REFERENCES `pelicula` (`IdPelicula`),
  CONSTRAINT `FK_CARTELERA_SALA` FOREIGN KEY (`IdSala`) REFERENCES `sala` (`IdSala`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartelera`
--

LOCK TABLES `cartelera` WRITE;
/*!40000 ALTER TABLE `cartelera` DISABLE KEYS */;
INSERT INTO `cartelera` VALUES (1,1,1,'18:00:00','19:30:00','2023-10-22',1);
/*!40000 ALTER TABLE `cartelera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `IdCliente` int NOT NULL AUTO_INCREMENT,
  `NomCliente` varchar(50) NOT NULL,
  `ApeCliente` varchar(50) NOT NULL,
  `DniCliente` char(8) DEFAULT NULL,
  PRIMARY KEY (`IdCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'JUAN','PEREZ','88888888');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalleventa`
--

DROP TABLE IF EXISTS `detalleventa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalleventa` (
  `IdDventa` int NOT NULL AUTO_INCREMENT,
  `IdVenta` int NOT NULL,
  `Descripcion` varchar(100) NOT NULL,
  `Cantidad` int NOT NULL,
  `Precio` decimal(10,2) NOT NULL,
  PRIMARY KEY (`IdDventa`),
  KEY `FK_DVENTA_VENTA` (`IdVenta`),
  CONSTRAINT `FK_DVENTA_VENTA` FOREIGN KEY (`IdVenta`) REFERENCES `venta` (`IdVenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalleventa`
--

LOCK TABLES `detalleventa` WRITE;
/*!40000 ALTER TABLE `detalleventa` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalleventa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `IdEmpleado` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `FechaContrat` date NOT NULL,
  `IdEstado` int NOT NULL,
  PRIMARY KEY (`IdEmpleado`),
  KEY `FK_EMPLEADO_ESTADO` (`IdEstado`),
  CONSTRAINT `FK_EMPLEADO_ESTADO` FOREIGN KEY (`IdEstado`) REFERENCES `estado` (`IdEstado`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'JOSE','HERNANDEZ','2023-10-22',1);
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado` (
  `IdEstado` int NOT NULL AUTO_INCREMENT,
  `DescEstado` varchar(50) NOT NULL,
  PRIMARY KEY (`IdEstado`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (1,'ACTIVO'),(2,'INACTIVO'),(3,'OCUPADO'),(4,'LIBRE'),(5,'REALIZADA'),(6,'CANCELADA'),(18,'anibal');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelicula`
--

DROP TABLE IF EXISTS `pelicula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pelicula` (
  `IdPelicula` int NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(50) NOT NULL,
  `Duracion` int NOT NULL,
  `Genero` varchar(50) NOT NULL,
  `Clasificacion` varchar(50) NOT NULL,
  `Formato` varchar(40) NOT NULL,
  `IdEstado` int NOT NULL,
  PRIMARY KEY (`IdPelicula`),
  KEY `FK_PELICULA_ESTADO` (`IdEstado`),
  CONSTRAINT `FK_PELICULA_ESTADO` FOREIGN KEY (`IdEstado`) REFERENCES `estado` (`IdEstado`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula`
--

LOCK TABLES `pelicula` WRITE;
/*!40000 ALTER TABLE `pelicula` DISABLE KEYS */;
INSERT INTO `pelicula` VALUES (1,'THE MOVIE 1',2,'ACCIÓN','APTO PARA TODOS','3D',1),(2,'THE MOVIE 2',4,'COMEDIA','APTO PARA TODOS','2D',1),(3,'THE MOVIE 3',3,'TRILLER','APTO PARA TODOS','2D',1),(4,'THE MOVIE 4',3,'ACCIÓN','APTO PARA TODOS','3D',1),(5,'THE MOVIE 5',3,'TERROR','APTO PARA TODOS','3D',1);
/*!40000 ALTER TABLE `pelicula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `progrpromocion`
--

DROP TABLE IF EXISTS `progrpromocion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `progrpromocion` (
  `IdPpromocion` int NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `Promocion` varchar(80) NOT NULL,
  `IdEstado` int NOT NULL,
  PRIMARY KEY (`IdPpromocion`),
  KEY `FK_PPROMOCION_ESTADO` (`IdEstado`),
  CONSTRAINT `FK_PPROMOCION_ESTADO` FOREIGN KEY (`IdEstado`) REFERENCES `estado` (`IdEstado`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `progrpromocion`
--

LOCK TABLES `progrpromocion` WRITE;
/*!40000 ALTER TABLE `progrpromocion` DISABLE KEYS */;
INSERT INTO `progrpromocion` VALUES (1,'2023-10-22','DESCUENTO 30%',1),(2,'2023-10-22','PROMOCION 3x2',1);
/*!40000 ALTER TABLE `progrpromocion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promocion`
--

DROP TABLE IF EXISTS `promocion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promocion` (
  `IdPromocion` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(80) NOT NULL,
  `Descuento` decimal(10,2) NOT NULL,
  `BaseTicket` bit(1) NOT NULL,
  `IdEstado` int NOT NULL,
  PRIMARY KEY (`IdPromocion`),
  KEY `FK_PROMOCION_ESTADO` (`IdEstado`),
  CONSTRAINT `FK_PROMOCION_ESTADO` FOREIGN KEY (`IdEstado`) REFERENCES `estado` (`IdEstado`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promocion`
--

LOCK TABLES `promocion` WRITE;
/*!40000 ALTER TABLE `promocion` DISABLE KEYS */;
INSERT INTO `promocion` VALUES (1,'PROMOCION 3X2',1.00,_binary '',1),(2,'DESCUENTO 30%',0.30,_binary '\0',1);
/*!40000 ALTER TABLE `promocion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registroasiento`
--

DROP TABLE IF EXISTS `registroasiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registroasiento` (
  `IdRasiento` int NOT NULL AUTO_INCREMENT,
  `IdCartelera` int NOT NULL,
  `NroAsiento` int NOT NULL,
  PRIMARY KEY (`IdRasiento`),
  KEY `FK_RASIENTO_CARTELERA` (`IdCartelera`),
  CONSTRAINT `FK_RASIENTO_CARTELERA` FOREIGN KEY (`IdCartelera`) REFERENCES `cartelera` (`IdCartelera`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registroasiento`
--

LOCK TABLES `registroasiento` WRITE;
/*!40000 ALTER TABLE `registroasiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `registroasiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `idrol` int NOT NULL AUTO_INCREMENT,
  `nomrol` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`idrol`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'ADMIN'),(2,'USER');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sala`
--

DROP TABLE IF EXISTS `sala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sala` (
  `IdSala` int NOT NULL AUTO_INCREMENT,
  `DescSala` varchar(50) NOT NULL,
  `Asientos` int NOT NULL,
  `IdEstado` int NOT NULL,
  PRIMARY KEY (`IdSala`),
  KEY `FK_SALA_ESTADO` (`IdEstado`),
  CONSTRAINT `FK_SALA_ESTADO` FOREIGN KEY (`IdEstado`) REFERENCES `estado` (`IdEstado`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sala`
--

LOCK TABLES `sala` WRITE;
/*!40000 ALTER TABLE `sala` DISABLE KEYS */;
INSERT INTO `sala` VALUES (1,'SALA 1',14,4),(2,'SALA 2',14,4),(3,'SALA 3',14,1),(4,'SALA 4',14,3),(5,'SALA 5',16,6),(6,'SALA 6',14,1),(7,'SALA 7',20,2),(8,'SALA 8',16,1),(9,'SALA 9',20,4);
/*!40000 ALTER TABLE `sala` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `IdTicket` int NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(80) NOT NULL,
  `Descripcion` varchar(200) NOT NULL,
  `Precio` decimal(10,2) NOT NULL,
  `IdEstado` int NOT NULL,
  PRIMARY KEY (`IdTicket`),
  KEY `FK_TICKET_ESTADO` (`IdEstado`),
  CONSTRAINT `FK_TICKET_ESTADO` FOREIGN KEY (`IdEstado`) REFERENCES `estado` (`IdEstado`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1,'ENTRADA GENERAL','ENTRADA PARA LAS PERSONAS MAYORES DE 18 ANIOS',10.00,1),(2,'ENTRADA NINOS','ENTRADA PARA LOS NINOS',5.00,1);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idusuario` int NOT NULL AUTO_INCREMENT,
  `nomusuario` varchar(100) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `password` varchar(300) DEFAULT NULL,
  `nombres` varchar(100) DEFAULT NULL,
  `apellidos` varchar(100) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Enzolg','enzol@gmail.com','$2a$10$B7n0JVILSXNaZgltwLS39e3u/Z5G/PVR0l68NOzLNGDzVUn3TWBFO','Enzo','Limay',1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_rol`
--

DROP TABLE IF EXISTS `usuario_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_rol` (
  `idusuario` int NOT NULL,
  `idrol` int NOT NULL,
  PRIMARY KEY (`idusuario`,`idrol`),
  KEY `user_role_FK_1` (`idrol`),
  CONSTRAINT `user_role_FK` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`),
  CONSTRAINT `user_role_FK_1` FOREIGN KEY (`idrol`) REFERENCES `rol` (`idrol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_rol`
--

LOCK TABLES `usuario_rol` WRITE;
/*!40000 ALTER TABLE `usuario_rol` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `IdVenta` int NOT NULL AUTO_INCREMENT,
  `IdCliente` int NOT NULL,
  `IdCartelera` int NOT NULL,
  `IdEmpleado` int NOT NULL,
  `Fecha` date NOT NULL,
  `Asientos` varchar(20) NOT NULL,
  `Tpago` varchar(50) NOT NULL,
  `Promocion` varchar(80) NOT NULL,
  `Descuento` decimal(10,2) NOT NULL,
  `IdEstado` int NOT NULL,
  PRIMARY KEY (`IdVenta`),
  KEY `FK_VENTA_CLIENTE` (`IdCliente`),
  KEY `FK_VENTA_CARTELERA` (`IdCartelera`),
  KEY `FK_VENTA_EMPLEADO` (`IdEmpleado`),
  KEY `FK_VENTA_ESTADO` (`IdEstado`),
  CONSTRAINT `FK_VENTA_CARTELERA` FOREIGN KEY (`IdCartelera`) REFERENCES `cartelera` (`IdCartelera`),
  CONSTRAINT `FK_VENTA_CLIENTE` FOREIGN KEY (`IdCliente`) REFERENCES `cliente` (`IdCliente`),
  CONSTRAINT `FK_VENTA_EMPLEADO` FOREIGN KEY (`IdEmpleado`) REFERENCES `empleado` (`IdEmpleado`),
  CONSTRAINT `FK_VENTA_ESTADO` FOREIGN KEY (`IdEstado`) REFERENCES `estado` (`IdEstado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'bdcine'
--

--
-- Dumping routines for database 'bdcine'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-19 12:26:55
