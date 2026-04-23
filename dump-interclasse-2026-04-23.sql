CREATE DATABASE  IF NOT EXISTS `db_interclasse` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_interclasse`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: db_interclasse
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `tbl_boletim`
--

DROP TABLE IF EXISTS `tbl_boletim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_boletim` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `mencao` tinyint NOT NULL,
  `ocorrencia` tinyint NOT NULL,
  `frequencia` float NOT NULL,
  `tbl_jogadores_id` smallint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tbl_boletim_tbl_jogadores1_idx` (`tbl_jogadores_id`),
  CONSTRAINT `fk_tbl_boletim_tbl_jogadores1` FOREIGN KEY (`tbl_jogadores_id`) REFERENCES `tbl_jogadores` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_boletim`
--

LOCK TABLES `tbl_boletim` WRITE;
/*!40000 ALTER TABLE `tbl_boletim` DISABLE KEYS */;
INSERT INTO `tbl_boletim` VALUES (1,2,0,76.5,1),(2,0,7,74,7),(3,5,12,54.8,8),(4,0,23,87.9,9),(5,0,0,98.7,10),(6,0,1,78.9,11),(7,0,0,98.7,12);
/*!40000 ALTER TABLE `tbl_boletim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_jogadores`
--

DROP TABLE IF EXISTS `tbl_jogadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_jogadores` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_jogadores`
--

LOCK TABLES `tbl_jogadores` WRITE;
/*!40000 ALTER TABLE `tbl_jogadores` DISABLE KEYS */;
INSERT INTO `tbl_jogadores` VALUES (1,'Ronaldo'),(7,'Lucas'),(8,'Ramon'),(9,'Leonardo'),(10,'Raí'),(11,'Zagallo'),(12,'Henry'),(14,'Josué'),(15,'Nathan Francisco');
/*!40000 ALTER TABLE `tbl_jogadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_modalidade`
--

DROP TABLE IF EXISTS `tbl_modalidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_modalidade` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `modalidade` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_modalidade`
--

LOCK TABLES `tbl_modalidade` WRITE;
/*!40000 ALTER TABLE `tbl_modalidade` DISABLE KEYS */;
INSERT INTO `tbl_modalidade` VALUES (1,'Futebol'),(2,'Futsal'),(3,'Basquete'),(4,'Vôlei'),(5,'Xadrez');
/*!40000 ALTER TABLE `tbl_modalidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_times`
--

DROP TABLE IF EXISTS `tbl_times`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_times` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `tbl_modalidade_id` tinyint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tbl_times_tbl_modalidade1_idx` (`tbl_modalidade_id`),
  CONSTRAINT `fk_tbl_times_tbl_modalidade1` FOREIGN KEY (`tbl_modalidade_id`) REFERENCES `tbl_modalidade` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_times`
--

LOCK TABLES `tbl_times` WRITE;
/*!40000 ALTER TABLE `tbl_times` DISABLE KEYS */;
INSERT INTO `tbl_times` VALUES (1,'Sem-Time',0),(2,'Falcões',4),(3,'Verdes Musgos',2),(5,'XPTO',2),(7,'Chigago Bulls',3);
/*!40000 ALTER TABLE `tbl_times` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_times_has_tbl_jogadores`
--

DROP TABLE IF EXISTS `tbl_times_has_tbl_jogadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_times_has_tbl_jogadores` (
  `tbl_times_id` tinyint unsigned NOT NULL,
  `tbl_jogadores_id` smallint unsigned NOT NULL,
  PRIMARY KEY (`tbl_times_id`,`tbl_jogadores_id`),
  KEY `fk_tbl_times_has_tbl_jogadores_tbl_jogadores1_idx` (`tbl_jogadores_id`),
  KEY `fk_tbl_times_has_tbl_jogadores_tbl_times1_idx` (`tbl_times_id`),
  CONSTRAINT `fk_tbl_times_has_tbl_jogadores_tbl_jogadores1` FOREIGN KEY (`tbl_jogadores_id`) REFERENCES `tbl_jogadores` (`id`),
  CONSTRAINT `fk_tbl_times_has_tbl_jogadores_tbl_times1` FOREIGN KEY (`tbl_times_id`) REFERENCES `tbl_times` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_times_has_tbl_jogadores`
--

LOCK TABLES `tbl_times_has_tbl_jogadores` WRITE;
/*!40000 ALTER TABLE `tbl_times_has_tbl_jogadores` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_times_has_tbl_jogadores` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-23 12:40:44
