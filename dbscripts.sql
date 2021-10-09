--El presente script tiene los scripts de los objetos de la base de datos
--Crear las tablas

CREATE DATABASE  IF NOT EXISTS `cassatta` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cassatta`;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: cassatta
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `idclientes` int NOT NULL AUTO_INCREMENT,
  `nombre_cli` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `tel` int DEFAULT NULL,
  `cel` int DEFAULT NULL,
  PRIMARY KEY (`idclientes`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'cosme','roldanius',1234,56789),(2,'franco','racing',5432,17809);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `envasados`
--

DROP TABLE IF EXISTS `envasados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `envasados` (
  `idenvasados` int NOT NULL AUTO_INCREMENT,
  `nombre_env` varchar(150) NOT NULL,
  `desc_env` varchar(900) DEFAULT NULL,
  `costo_extra` int DEFAULT NULL,
  `cant_limite` int DEFAULT NULL,
  `tipo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idenvasados`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `envasados`
--

LOCK TABLES `envasados` WRITE;
/*!40000 ALTER TABLE `envasados` DISABLE KEYS */;
INSERT INTO `envasados` VALUES (1,'caja carton','caja de carton prensado mediana',3,8,1),(2,'bolsa papel','bolsa de papel de 300 cc',1,6,2);
/*!40000 ALTER TABLE `envasados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `envios`
--

DROP TABLE IF EXISTS `envios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `envios` (
  `idenvios` int NOT NULL AUTO_INCREMENT,
  `idventa` int DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `direccion` varchar(150) DEFAULT NULL COMMENT 'puede o no ser la del cliente',
  `tel` int DEFAULT NULL COMMENT 'tel de contacto',
  `cel` int DEFAULT NULL COMMENT 'Cel de contacto ',
  PRIMARY KEY (`idenvios`),
  KEY `envios_venta_idx` (`idventa`),
  CONSTRAINT `envios_venta` FOREIGN KEY (`idventa`) REFERENCES `ventas` (`idventa`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `envios`
--

LOCK TABLES `envios` WRITE;
/*!40000 ALTER TABLE `envios` DISABLE KEYS */;
INSERT INTO `envios` VALUES (1,1,'2021-09-16 00:00:00','calle falsa 123',5432,NULL);
/*!40000 ALTER TABLE `envios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `idproductos` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(900) DEFAULT NULL,
  `tipo` tinyint(1) DEFAULT NULL,
  `foto` blob,
  `precio_unit` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`idproductos`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'alfajor','alfajor de chocolate con dulce de leche',1,NULL,75.00),(2,'pan lactal','pan lactal bajo en grasa sin TACC',2,NULL,120.00),(3,'alfacookie','alfajor con galleta con chispas de chocolate',1,NULL,80.00);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `idventa` int NOT NULL AUTO_INCREMENT,
  `idcliente` int DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `confirmado` tinyint DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`idventa`),
  KEY `venta_cliente_fk_idx` (`idcliente`),
  CONSTRAINT `venta_cliente_fk` FOREIGN KEY (`idcliente`) REFERENCES `clientes` (`idclientes`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,2,'2021-09-16',1,200.00);
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas_detalles`
--

DROP TABLE IF EXISTS `ventas_detalles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas_detalles` (
  `idproducto` int NOT NULL,
  `idventa` int NOT NULL,
  `precio_unit` decimal(10,2) DEFAULT NULL,
  `cant_prod` int DEFAULT NULL,
  `envasados_idenvasados` int NOT NULL,
  PRIMARY KEY (`idproducto`,`idventa`,`envasados_idenvasados`),
  KEY `vendet_venta_idx` (`idventa`),
  KEY `fk_ventas_detalles_envasados1_idx` (`envasados_idenvasados`),
  CONSTRAINT `fk_ventas_detalles_envasados1` FOREIGN KEY (`envasados_idenvasados`) REFERENCES `envasados` (`idenvasados`),
  CONSTRAINT `vendet_prod` FOREIGN KEY (`idproducto`) REFERENCES `productos` (`idproductos`),
  CONSTRAINT `vendet_venta_fk` FOREIGN KEY (`idventa`) REFERENCES `ventas` (`idventa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas_detalles`
--

LOCK TABLES `ventas_detalles` WRITE;
/*!40000 ALTER TABLE `ventas_detalles` DISABLE KEYS */;
INSERT INTO `ventas_detalles` VALUES (2,1,120.00,1,1),(3,1,80.00,1,1);
/*!40000 ALTER TABLE `ventas_detalles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-16 17:59:33
