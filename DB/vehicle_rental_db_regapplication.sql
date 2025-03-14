CREATE DATABASE  IF NOT EXISTS `vehicle_rental_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `vehicle_rental_db`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: vehicle_rental_db
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `regapplication`
--

DROP TABLE IF EXISTS `regapplication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `regapplication` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vType` varchar(45) DEFAULT NULL,
  `vModelName` varchar(45) DEFAULT NULL,
  `regapplicationcol` varchar(45) DEFAULT NULL,
  `vBrand` varchar(45) DEFAULT NULL,
  `noOfSeats` int DEFAULT NULL,
  `price` double DEFAULT NULL,
  `ownerId` varchar(45) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regapplication`
--

LOCK TABLES `regapplication` WRITE;
/*!40000 ALTER TABLE `regapplication` DISABLE KEYS */;
INSERT INTO `regapplication` VALUES (1,'car','maruti',NULL,'susuki',5,25000,'null',NULL),(2,'car','maruti',NULL,'susuki',5,25000,'null',NULL),(3,'car','maruti',NULL,'susuki',5,25000,'null',NULL),(19,'car','wagon R',NULL,'susuki',5,6500,'3','not reviewed yet'),(20,'car','vitz',NULL,'toyota',5,6000,'3','not reviewed yet'),(21,'car','Prius',NULL,'toyota',5,9000,'3','approved');
/*!40000 ALTER TABLE `regapplication` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-21 18:21:09
