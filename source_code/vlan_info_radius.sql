-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: 10.2.0.4    Database: radius
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.18.04.2

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
-- Dumping data for table `radgroupreply`
--

LOCK TABLES `radgroupreply` WRITE;
/*!40000 ALTER TABLE `radgroupreply` DISABLE KEYS */;
INSERT INTO `radgroupreply` VALUES (1,'server','Tunnel-Type',':=','13'),(2,'server','Tunnel-Medium-Type',':=','6'),(3,'server','Tunnel-Private-Group-Id',':=','2'),(4,'administrative','Tunnel-Type',':=','13'),(5,'administrative','Tunnel-Medium-Type',':=','6'),(6,'administrative','Tunnel-Private-Group-Id',':=','3'),(7,'privileged','Tunnel-Type',':=','13'),(8,'privileged','Tunnel-Medium-Type',':=','6'),(9,'privileged','Tunnel-Private-Group-Id',':=','4'),(10,'internal','Tunnel-Type',':=','13'),(11,'internal','Tunnel-Medium-Type',':=','6'),(12,'internal','Tunnel-Private-Group-Id',':=','5'),(13,'guest','Tunnel-Type',':=','13'),(14,'guest','Tunnel-Medium-Type',':=','6'),(15,'guest','Tunnel-Private-Group-Id',':=','6'),(16,'printer','Tunnel-Type',':=','13'),(17,'printer','Tunnel-Medium-Type',':=','6'),(18,'printer','Tunnel-Private-Group-Id',':=','7');
/*!40000 ALTER TABLE `radgroupreply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'radius'
--

--
-- Dumping routines for database 'radius'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-21 21:12:05
