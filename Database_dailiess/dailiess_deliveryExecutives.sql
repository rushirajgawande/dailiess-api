-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 103.120.179.40    Database: dailiess
-- ------------------------------------------------------
-- Server version	5.7.29

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
-- Table structure for table `deliveryExecutives`
--

DROP TABLE IF EXISTS `deliveryExecutives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deliveryExecutives` (
  `execid` bigint(20) NOT NULL AUTO_INCREMENT,
  `fname` varchar(45) DEFAULT NULL,
  `lname` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `mobile` varchar(45) DEFAULT NULL,
  `refid` varchar(45) DEFAULT NULL,
  `refname` varchar(45) DEFAULT NULL,
  `from_ip` varchar(45) DEFAULT NULL,
  `addedon` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `aadhar_num` varchar(45) DEFAULT NULL,
  `aadhar_front_img` varchar(450) DEFAULT NULL,
  `aadhar_back_img` varchar(450) DEFAULT NULL,
  `pan_num` varchar(45) DEFAULT NULL,
  `pan_front_img` varchar(450) DEFAULT NULL,
  `aadhar_status` enum('APPROVED','PENDING') DEFAULT 'PENDING',
  `bank_acc_no` varchar(45) DEFAULT NULL,
  `bank_ifsc_code` varchar(45) DEFAULT NULL,
  `pan_status` enum('APPROVED','PENDING') DEFAULT 'PENDING',
  `bank_acc_status` enum('ACTIVE','INACTIVE') DEFAULT 'INACTIVE',
  `lat` varchar(45) DEFAULT NULL,
  `lng` varchar(45) DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE','BLOCKED') DEFAULT 'INACTIVE',
  `blocked_remark` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`execid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliveryExecutives`
--

LOCK TABLES `deliveryExecutives` WRITE;
/*!40000 ALTER TABLE `deliveryExecutives` DISABLE KEYS */;
INSERT INTO `deliveryExecutives` VALUES (1,'Bilal','Ujede','bujede@gmail.com','7276490862','TEST','TEST',NULL,'2020-03-19 22:23:00','1234567890',NULL,NULL,'1234567890',NULL,'PENDING',NULL,NULL,'PENDING','','849841981','8198198','INACTIVE','NA'),(2,'Rushi','Gawande','rushirajgawande0@gmail.com','9595880120','2','qwe','157.33.172.58','2020-03-20 11:09:23','469529814500','https://projectdailies.bilsamtech.in/images/IMG260320092930.jpg','https://projectdailies.bilsamtech.in/images/IMG260320092930.jpg','CQB123456','https://projectdailies.bilsamtech.in/images/IMG260320092930.jpg','PENDING',NULL,NULL,'PENDING','INACTIVE',NULL,NULL,'INACTIVE',NULL);
/*!40000 ALTER TABLE `deliveryExecutives` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-10 19:30:15
