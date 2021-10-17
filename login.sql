-- MySQL dump 10.13  Distrib 8.0.26, for Linux (x86_64)
--
-- Host: localhost    Database: login
-- ------------------------------------------------------
-- Server version	8.0.26-0ubuntu0.20.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('zain','1',1);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chair`
--

DROP TABLE IF EXISTS `chair`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chair` (
  `name` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chair`
--

LOCK TABLES `chair` WRITE;
/*!40000 ALTER TABLE `chair` DISABLE KEYS */;
INSERT INTO `chair` VALUES ('ahsan','1',1);
/*!40000 ALTER TABLE `chair` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complain`
--

DROP TABLE IF EXISTS `complain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `complain` (
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complain`
--

LOCK TABLES `complain` WRITE;
/*!40000 ALTER TABLE `complain` DISABLE KEYS */;
INSERT INTO `complain` VALUES (1);
/*!40000 ALTER TABLE `complain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complains`
--

DROP TABLE IF EXISTS `complains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `complains` (
  `name` varchar(100) DEFAULT NULL,
  `reason` varchar(100) DEFAULT NULL,
  `fot` varchar(100) DEFAULT NULL,
  `there_name` varchar(20) DEFAULT NULL,
  `complain` varchar(400) DEFAULT NULL,
  `state` varchar(20) DEFAULT 'unseen',
  `id` int NOT NULL AUTO_INCREMENT,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complains`
--

LOCK TABLES `complains` WRITE;
/*!40000 ALTER TABLE `complains` DISABLE KEYS */;
INSERT INTO `complains` VALUES ('raheel','Behaviour','Student','abdul rab','he has wasted all of our time ','varified',2,'2021-10-11 19:50:19'),('M Raza Khan','behaviour','staff','zahoor','he is not giving me transcript im going there from days and he keeps ignoring me','varified',6,'2021-10-11 19:50:19'),('waqas','methods','teacher','basit','he cant make student understand anything','rejected',7,'2021-10-11 19:50:19'),('raheel','Behaviour','Teacher','abdul rab','He doesn\'t respect us at all ','varified',9,'2021-10-11 19:50:19'),('raheel','Behaviour','Teacher','azam','he does more time pass and less study','rejected',22,'2021-10-12 14:54:40'),('kira','Behaviour','Student','abdul basit','he teacher just himself while student set there completely ignored','unseen',29,'2021-10-12 15:53:16'),('asad','Methods','Teacher','abdul basit','none of the student gets anything and the worst thing is he don\'t give a damn about students','unseen',30,NULL),('asad','Methods','Teacher','Khalifa ahmed','we dont understand a word from khalifa and the most painful thing is istead of working to make us understand sir is always busy making us realize how he will not pass a single person','Acknowladged',36,'2021-10-17 00:14:55'),('emeria','Behaviour','Student','Irfnan','he bullies me and point attack on me when ever possible ','Acknowladged',38,'2021-10-17 08:43:45');
/*!40000 ALTER TABLE `complains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fakecomplains`
--

DROP TABLE IF EXISTS `fakecomplains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fakecomplains` (
  `ids` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fakecomplains`
--

LOCK TABLES `fakecomplains` WRITE;
/*!40000 ALTER TABLE `fakecomplains` DISABLE KEYS */;
/*!40000 ALTER TABLE `fakecomplains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `RN` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `batch` varchar(100) DEFAULT NULL,
  `Semester` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`RN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'hafiz','a1','BSit','8th'),(2,'kira','a1','bscs','1th'),(3,'noor','a1','BScs','8th'),(7,'asad','a1','mcs','8th'),(37,'raheel','a1','BSit','8th'),(42,'zero','a1','Bsit','5th'),(51,'emeria','a1','mcs','2th');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'login'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-17 14:29:17
