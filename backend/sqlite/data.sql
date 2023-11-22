-- MySQL dump 10.16  Distrib 10.1.48-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: db
-- ------------------------------------------------------
-- Server version	10.1.48-MariaDB-0+deb9u2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `endereco` (
  `idendereco` tinyint(4) DEFAULT NULL,
  `cep` int(11) DEFAULT NULL,
  `rua` varchar(19) DEFAULT NULL,
  `bairro` varchar(35) DEFAULT NULL,
  `cidade` varchar(9) DEFAULT NULL,
  `uf` varchar(2) DEFAULT NULL,
  `ibge` varchar(0) DEFAULT NULL,
  `iduser` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
INSERT INTO `endereco` VALUES (7,1122000,'Rua Ribeiro de Lima','Bom Retiro','São Paulo','SP','',19),(8,1122000,'Rua Ribeiro de Lima','Bom Retiro','São Paulo','SP','',20),(9,1122000,'Rua Ribeiro de Lima','Bom Retiro','São Paulo','SP','',21),(10,1122000,'Rua Ribeiro de Lima','Bom Retiro','São Paulo','SP','',22),(11,1122000,'Rua Ribeiro de Lima','Bom Retiro','São Paulo','SP','',23),(12,8253510,'Rua Folhas Caidas','Conjunto Residencial José Bonifácio','São Paulo','SP','',24),(13,8253510,'Rua Folhas Caidas','Conjunto Residencial José Bonifácio','São Paulo','SP','',25),(14,8253210,'Rua Isabel Urbina','Conjunto Residencial José Bonifácio','São Paulo','SP','',26),(15,1001000,'Praça da Sé','Sé','São Paulo','SP','',27),(16,1001000,'Praça da Sé','Sé','São Paulo','SP','',28);
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idades`
--

DROP TABLE IF EXISTS `idades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idades` (
  `idades` varchar(11) DEFAULT NULL,
  `pessoas` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idades`
--

LOCK TABLES `idades` WRITE;
/*!40000 ALTER TABLE `idades` DISABLE KEYS */;
INSERT INTO `idades` VALUES ('Adolescente',1),('Adulto',2),('Bêbe',0),('criança',4);
/*!40000 ALTER TABLE `idades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produtos` (
  `id` tinyint(4) DEFAULT NULL,
  `nome` varchar(10) DEFAULT NULL,
  `preco` smallint(6) DEFAULT NULL,
  `quantidade` tinyint(4) DEFAULT NULL,
  `criado` varchar(19) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (12,'ddd',7,4,'2023-10-12 18:56:09'),(13,'Feijao',14,2,'2023-10-25 16:00:37'),(14,'Arroz',15,2,'2023-10-25 16:10:14'),(15,'Celular',1700,1,'2023-10-25 16:16:54'),(16,'Computador',2500,1,'2023-10-25 16:22:23');
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos_por_usuario`
--

DROP TABLE IF EXISTS `produtos_por_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produtos_por_usuario` (
  `id` tinyint(4) DEFAULT NULL,
  `nome` varchar(8) DEFAULT NULL,
  `quantidade_produtos` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos_por_usuario`
--

LOCK TABLES `produtos_por_usuario` WRITE;
/*!40000 ALTER TABLE `produtos_por_usuario` DISABLE KEYS */;
INSERT INTO `produtos_por_usuario` VALUES (19,'adrielly',0),(20,'rodrigo',1),(21,'adam',0),(22,'adam',0),(23,'rodrigo',0),(25,'a',1),(26,'b',3),(27,'aloiso',1),(28,'c',0);
/*!40000 ALTER TABLE `produtos_por_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sqlite_sequence`
--

DROP TABLE IF EXISTS `sqlite_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sqlite_sequence` (
  `name` varchar(8) DEFAULT NULL,
  `seq` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sqlite_sequence`
--

LOCK TABLES `sqlite_sequence` WRITE;
/*!40000 ALTER TABLE `sqlite_sequence` DISABLE KEYS */;
INSERT INTO `sqlite_sequence` VALUES ('produtos',16),('endereco',16),('users',28),('vendas',6);
/*!40000 ALTER TABLE `sqlite_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` tinyint(4) DEFAULT NULL,
  `nome` varchar(8) DEFAULT NULL,
  `email` varchar(24) DEFAULT NULL,
  `senha` varchar(60) DEFAULT NULL,
  `criado` varchar(19) DEFAULT NULL,
  `datanascimento` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (19,'adrielly','adrielly','$2y$10$XrrzNeoQlePfrAz0NGfzOuktUW7ejHOA/Ix7kYvpG0LOsCtu2E9pW','2023-10-12 17:15:30','2013-02-19'),(20,'rodrigo','rodrigo','$2y$10$iVPej3tOD8lG5m1/5e0obek5GlM.Vo2rOLJ2iirMhR59lQTXSTepu','2023-10-12 17:16:29','1983-06-30'),(21,'adam','adam','$2y$10$Neoe/7INPuuLSmqYOIrcS.16P1pi8m1Qxd5J58KASHjMrXn7hGyEO','2023-10-12 18:06:33','2007-05-05'),(22,'adam','adam','$2y$10$ym3DevEbvh/dUjrsE9Fy8.CuuzTds/OMkoWoW8NuUFiPnZhX1sx6W','2023-10-12 18:07:49','1988-05-05'),(23,'rodrigo','rodrigohipnose@gmail.com','$2y$10$AvPeZMiI2txx8sOoryVutOmgQHuUoFpuvCvtSebEzUAZuSEzh2LD6','2023-10-12 18:58:24','2023-10-18'),(25,'a','a@a','$2y$10$ltEtSP9E7F0CouOnzovEruxKT2IGe8898VBshZWp09Z0bQ.0.AptS','2023-10-17 15:40:05',''),(26,'b','b@b','$2y$10$jVBfoPiY4LGc3cgOJrfc8.G3aWZdujVQ35KbACNUWfySOZnI7WbcC','2023-10-17 15:41:24',''),(27,'aloiso','a@adara','$2y$10$OgK3AsmiAyQpINL2Ml7wBu7rv1oGJHh1F.PYJR8JCOyzLxavTwSNu','2023-10-23 16:03:16','2023-10-23'),(28,'c','c@c','$2y$10$ABXL1IQaFGI7CzAeFcg7zOfiw.zQGCpUZjMZiDndrGMDm6JDP4Ra6','2023-11-08 03:32:27','2023-11-08');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usersx`
--

DROP TABLE IF EXISTS `usersx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usersx` (
  `id` varchar(0) DEFAULT NULL,
  `name` varchar(0) DEFAULT NULL,
  `email` varchar(0) DEFAULT NULL,
  `password` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usersx`
--

LOCK TABLES `usersx` WRITE;
/*!40000 ALTER TABLE `usersx` DISABLE KEYS */;
/*!40000 ALTER TABLE `usersx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendas`
--

DROP TABLE IF EXISTS `vendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendas` (
  `id` tinyint(4) DEFAULT NULL,
  `id_usuario` tinyint(4) DEFAULT NULL,
  `id_produto` tinyint(4) DEFAULT NULL,
  `data_cadastro` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendas`
--

LOCK TABLES `vendas` WRITE;
/*!40000 ALTER TABLE `vendas` DISABLE KEYS */;
INSERT INTO `vendas` VALUES (1,27,12,''),(2,26,13,''),(3,26,13,''),(4,26,13,''),(5,25,15,''),(6,20,16,'');
/*!40000 ALTER TABLE `vendas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-18 10:46:27
