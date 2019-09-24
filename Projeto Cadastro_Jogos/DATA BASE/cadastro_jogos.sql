-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: cadastro_jogos
-- ------------------------------------------------------
-- Server version	5.7.14

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
-- Table structure for table `desenvolvedor`
--

DROP TABLE IF EXISTS `desenvolvedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `desenvolvedor` (
  `nome` char(50) DEFAULT NULL,
  `id_desenvolvedor` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_desenvolvedor`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `desenvolvedor`
--

LOCK TABLES `desenvolvedor` WRITE;
/*!40000 ALTER TABLE `desenvolvedor` DISABLE KEYS */;
INSERT INTO `desenvolvedor` VALUES ('Betesda',1);
/*!40000 ALTER TABLE `desenvolvedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genero` (
  `nome` char(50) DEFAULT NULL,
  `id_genero` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_genero`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` VALUES ('Terror',1),('Ação',5);
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jogo`
--

DROP TABLE IF EXISTS `jogo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jogo` (
  `jogo_nome` varchar(50) DEFAULT NULL,
  `Imagen` blob,
  `data_lancamento` date DEFAULT NULL,
  `fk_desenvolvedor` int(4) DEFAULT NULL,
  `id_jogo` int(11) NOT NULL AUTO_INCREMENT,
  `caminho` char(80) DEFAULT NULL,
  `fk_id_genero` int(11) DEFAULT NULL,
  `fk_id_genero1` int(11) DEFAULT NULL,
  `fk_id_genero2` int(11) DEFAULT NULL,
  `descricao` char(255) DEFAULT NULL,
  PRIMARY KEY (`id_jogo`),
  KEY `fk_desenvolvedor` (`fk_desenvolvedor`),
  KEY `fk_id_genero` (`fk_id_genero`),
  KEY `fk_id_genro1` (`fk_id_genero1`),
  KEY `fk_id_genero2` (`fk_id_genero2`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jogo`
--

LOCK TABLES `jogo` WRITE;
/*!40000 ALTER TABLE `jogo` DISABLE KEYS */;
INSERT INTO `jogo` VALUES (NULL,NULL,NULL,NULL,39,'C:\\Projeto Cadastro_Jogos\\Imagens\\Cadastro\\sem-foto.jpg',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `jogo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jogo_genero`
--

DROP TABLE IF EXISTS `jogo_genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jogo_genero` (
  `fk_jogo` int(4) DEFAULT NULL,
  `fk_genero` int(4) DEFAULT NULL,
  KEY `fk_jogo` (`fk_jogo`),
  KEY `fk_genero` (`fk_genero`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jogo_genero`
--

LOCK TABLES `jogo_genero` WRITE;
/*!40000 ALTER TABLE `jogo_genero` DISABLE KEYS */;
/*!40000 ALTER TABLE `jogo_genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'cadastro_jogos'
--

--
-- Dumping routines for database 'cadastro_jogos'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-23 21:51:27
