-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: dbRestaurante
-- ------------------------------------------------------
-- Server version	5.7.28-0ubuntu0.16.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tCliente`
--

DROP TABLE IF EXISTS `tCliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tCliente` (
  `idCliente` int(11) NOT NULL,
  `nomeCliente` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tCliente`
--

LOCK TABLES `tCliente` WRITE;
/*!40000 ALTER TABLE `tCliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `tCliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tItemConsumo`
--

DROP TABLE IF EXISTS `tItemConsumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tItemConsumo` (
  `idItem` int(11) NOT NULL,
  `nomeItem` varchar(90) DEFAULT NULL,
  `precoUnit` decimal(10,0) DEFAULT NULL,
  `descricao` varchar(200) DEFAULT NULL,
  `categoria` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`idItem`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tItemConsumo`
--

LOCK TABLES `tItemConsumo` WRITE;
/*!40000 ALTER TABLE `tItemConsumo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tItemConsumo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tMesa`
--

DROP TABLE IF EXISTS `tMesa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tMesa` (
  `idMesa` int(11) NOT NULL,
  `numeroMesas` int(11) DEFAULT NULL,
  PRIMARY KEY (`idMesa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tMesa`
--

LOCK TABLES `tMesa` WRITE;
/*!40000 ALTER TABLE `tMesa` DISABLE KEYS */;
/*!40000 ALTER TABLE `tMesa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tNota`
--

DROP TABLE IF EXISTS `tNota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tNota` (
  `numeroNota` int(11) NOT NULL,
  `dtPagamento` datetime NOT NULL,
  `idPedido` int(11) DEFAULT NULL,
  PRIMARY KEY (`numeroNota`,`dtPagamento`),
  KEY `idPedido` (`idPedido`),
  CONSTRAINT `tNota_ibfk_1` FOREIGN KEY (`idPedido`) REFERENCES `tPedido` (`idPedido`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tNota`
--

LOCK TABLES `tNota` WRITE;
/*!40000 ALTER TABLE `tNota` DISABLE KEYS */;
/*!40000 ALTER TABLE `tNota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tPedido`
--

DROP TABLE IF EXISTS `tPedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tPedido` (
  `idPedido` int(11) NOT NULL,
  `dtPedido` datetime DEFAULT NULL,
  `motivoCancel` varchar(90) DEFAULT NULL,
  `situacao` varchar(90) DEFAULT NULL,
  `idCliente` int(11) DEFAULT NULL,
  `idMesa` int(11) DEFAULT NULL,
  PRIMARY KEY (`idPedido`),
  KEY `idCliente` (`idCliente`),
  KEY `idMesa` (`idMesa`),
  CONSTRAINT `tPedido_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `tCliente` (`idCliente`),
  CONSTRAINT `tPedido_ibfk_2` FOREIGN KEY (`idMesa`) REFERENCES `tMesa` (`idMesa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tPedido`
--

LOCK TABLES `tPedido` WRITE;
/*!40000 ALTER TABLE `tPedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `tPedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tPedidoItem`
--

DROP TABLE IF EXISTS `tPedidoItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tPedidoItem` (
  `idPedido` int(11) NOT NULL,
  `idItem` int(11) NOT NULL,
  `quantidade` int(11) DEFAULT NULL,
  PRIMARY KEY (`idPedido`,`idItem`),
  KEY `idItem` (`idItem`),
  CONSTRAINT `tPedidoItem_ibfk_1` FOREIGN KEY (`idPedido`) REFERENCES `tPedido` (`idPedido`),
  CONSTRAINT `tPedidoItem_ibfk_2` FOREIGN KEY (`idItem`) REFERENCES `tItemConsumo` (`idItem`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tPedidoItem`
--

LOCK TABLES `tPedidoItem` WRITE;
/*!40000 ALTER TABLE `tPedidoItem` DISABLE KEYS */;
/*!40000 ALTER TABLE `tPedidoItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tTelefone`
--

DROP TABLE IF EXISTS `tTelefone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tTelefone` (
  `idCliente` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  PRIMARY KEY (`idCliente`,`numero`),
  CONSTRAINT `tTelefone_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `tCliente` (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tTelefone`
--

LOCK TABLES `tTelefone` WRITE;
/*!40000 ALTER TABLE `tTelefone` DISABLE KEYS */;
/*!40000 ALTER TABLE `tTelefone` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-10 10:18:07
