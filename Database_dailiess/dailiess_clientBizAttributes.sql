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
-- Table structure for table `clientBizAttributes`
--

DROP TABLE IF EXISTS `clientBizAttributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientBizAttributes` (
  `bizAttributeId` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL COMMENT 'KYC_AADHAR\nKYC_PAN\nKYC_SHOP_ACT\nKYC_INC_CERT',
  `details` varchar(45) DEFAULT NULL,
  `value` blob,
  `addedon` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `refid` varchar(45) DEFAULT NULL,
  `refname` varchar(45) DEFAULT NULL,
  `bizid` bigint(20) DEFAULT NULL,
  `kyc_status` enum('PENDING','VERIFIED','REJECTED','PROCESSING') DEFAULT 'PENDING',
  PRIMARY KEY (`bizAttributeId`),
  KEY `attr_2_biz_details_idx` (`bizid`),
  CONSTRAINT `attr_2_biz_details` FOREIGN KEY (`bizid`) REFERENCES `clientBizDetails` (`bizid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=214 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientBizAttributes`
--

LOCK TABLES `clientBizAttributes` WRITE;
/*!40000 ALTER TABLE `clientBizAttributes` DISABLE KEYS */;
INSERT INTO `clientBizAttributes` VALUES (1,NULL,NULL,NULL,'2020-03-07 13:01:06',NULL,NULL,NULL,''),(2,NULL,NULL,NULL,'2020-03-07 13:07:09',NULL,NULL,NULL,''),(3,NULL,NULL,NULL,'2020-03-07 13:07:35',NULL,NULL,NULL,''),(4,NULL,NULL,NULL,'2020-03-07 13:09:51',NULL,NULL,NULL,''),(5,NULL,NULL,NULL,'2020-03-07 13:12:05',NULL,NULL,NULL,''),(6,'IMAGE','abcd',_binary 'https://projectdailies.bilsamtech.in/images/I','2020-03-17 13:34:32','1',NULL,1000003,'PENDING'),(7,'IMAGE','abcd',_binary 'https://projectdailies.bilsamtech.in/images/I','2020-03-17 13:37:19','1',NULL,1000003,'PENDING'),(8,'TAG','abcd',_binary 'COW Milk','2020-03-17 13:41:12','1',NULL,1000003,'PENDING'),(9,'TAG','abcd',NULL,'2020-03-17 13:41:42','1',NULL,1000003,'PENDING'),(10,'TAG','abcd',NULL,'2020-03-17 13:42:36','1',NULL,1000003,'PENDING'),(11,'IMAGE','abcd',_binary 'https://projectdailies.bilsamtech.in/images/IMG170320071302.jpg','2020-03-17 13:43:02','1',NULL,1000003,'PENDING'),(12,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG170320085030.jpg','2020-03-17 15:20:30','1000004',NULL,1000003,'PENDING'),(13,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG170320085257.jpg','2020-03-17 15:22:57','1000004',NULL,1000003,'PENDING'),(14,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG170320085703.jpg','2020-03-17 15:27:03','1000004',NULL,1000003,'PENDING'),(15,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG170320085806.jpg','2020-03-17 15:28:06','1000004',NULL,1000003,'PENDING'),(16,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG170320090019.jpg','2020-03-17 15:30:19','1000004',NULL,1000003,'PENDING'),(17,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG170320090340.jpg','2020-03-17 15:33:40','1000004',NULL,1000003,'PENDING'),(18,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG170320090416.jpg','2020-03-17 15:34:16','1000004',NULL,1000003,'PENDING'),(19,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG170320091030.jpg','2020-03-17 15:40:30','1000004',NULL,1000003,'PENDING'),(20,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG170320091335.jpg','2020-03-17 15:43:35','1000004',NULL,1000003,'PENDING'),(21,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG170320091349.jpg','2020-03-17 15:43:49','1000004',NULL,1000003,'PENDING'),(22,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG170320091423.jpg','2020-03-17 15:44:23','1000004',NULL,1000003,'PENDING'),(23,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG170320091531.jpg','2020-03-17 15:45:31','1000004',NULL,1000003,'PENDING'),(24,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG170320091600.jpg','2020-03-17 15:46:00','1000004',NULL,1000003,'PENDING'),(25,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG170320091625.jpg','2020-03-17 15:46:25','1000004',NULL,1000003,'PENDING'),(26,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG170320092113.jpg','2020-03-17 15:51:13','1000004',NULL,1000003,'PENDING'),(27,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG170320092212.jpg','2020-03-17 15:52:12','1000004',NULL,1000003,'PENDING'),(28,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG170320092249.jpg','2020-03-17 15:52:49','1000004',NULL,1000003,'PENDING'),(29,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG170320092411.jpg','2020-03-17 15:54:11','1000004',NULL,1000003,'PENDING'),(30,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG170320092435.jpg','2020-03-17 15:54:35','1000004',NULL,1000003,'PENDING'),(31,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG190320020044.jpg','2020-03-19 08:30:44','1000004',NULL,1000003,'PENDING'),(32,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG190320020624.jpg','2020-03-19 08:36:24','1000004',NULL,1000003,'PENDING'),(33,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG190320031001.jpg','2020-03-19 09:40:01','1000004',NULL,1000003,'PENDING'),(34,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG190320031344.jpg','2020-03-19 09:43:44','1000004',NULL,1000003,'PENDING'),(35,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG190320032526.jpg','2020-03-19 09:55:26','1000004',NULL,1000003,'PENDING'),(36,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG190320033447.jpg','2020-03-19 10:04:47','1000004',NULL,1000003,'PENDING'),(37,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG190320040255.jpg','2020-03-19 10:32:55','1000004',NULL,1000003,'PENDING'),(38,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG190320040912.jpg','2020-03-19 10:39:12','1000004',NULL,1000003,'PENDING'),(39,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG190320042541.jpg','2020-03-19 10:55:41','1000004',NULL,1000003,'PENDING'),(40,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG190320042656.jpg','2020-03-19 10:56:56','1000004',NULL,1000003,'PENDING'),(41,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG190320043254.jpg','2020-03-19 11:02:54','1000004',NULL,1000003,'PENDING'),(42,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG190320043507.jpg','2020-03-19 11:05:07','1000004',NULL,1000003,'PENDING'),(43,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG190320044057.jpg','2020-03-19 11:10:57','1000004',NULL,1000003,'PENDING'),(44,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG190320044400.jpg','2020-03-19 11:14:00','1000004',NULL,1000003,'PENDING'),(45,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG190320060759.jpg','2020-03-19 12:37:59','1000004',NULL,1000003,'PENDING'),(46,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG190320065551.jpg','2020-03-19 13:25:51','1000004',NULL,1000003,'PENDING'),(47,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG190320065914.jpg','2020-03-19 13:29:14','1000004',NULL,1000003,'PENDING'),(48,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG190320070048.jpg','2020-03-19 13:30:48','1000004',NULL,1000003,'PENDING'),(49,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG190320070638.jpg','2020-03-19 13:36:38','1000004',NULL,1000003,'PENDING'),(50,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG190320071235.jpg','2020-03-19 13:42:35','1000004',NULL,1000003,'PENDING'),(51,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG190320071620.jpg','2020-03-19 13:46:20','1000004',NULL,1000003,'PENDING'),(52,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG190320071747.jpg','2020-03-19 13:47:47','1000004',NULL,1000003,'PENDING'),(53,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG190320073322.jpg','2020-03-19 14:03:22','1000004',NULL,1000003,'PENDING'),(54,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG190320073535.jpg','2020-03-19 14:05:35','1000004',NULL,1000003,'PENDING'),(55,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG190320073609.jpg','2020-03-19 14:06:09','1000004',NULL,1000003,'PENDING'),(56,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG190320073705.jpg','2020-03-19 14:07:05','1000004',NULL,1000003,'PENDING'),(57,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG190320075707.jpg','2020-03-19 14:27:07','1000004',NULL,1000003,'PENDING'),(58,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG190320080009.jpg','2020-03-19 14:30:09','1000004',NULL,1000003,'PENDING'),(59,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG190320080150.jpg','2020-03-19 14:31:50','1000004',NULL,1000003,'PENDING'),(60,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG190320080332.jpg','2020-03-19 14:33:32','1000004',NULL,1000003,'PENDING'),(61,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG190320080616.jpg','2020-03-19 14:36:16','1000004',NULL,1000003,'PENDING'),(62,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG190320085820.jpg','2020-03-19 15:28:20','1000004',NULL,1000003,'PENDING'),(63,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG190320085900.jpg','2020-03-19 15:29:00','1000004',NULL,1000003,'PENDING'),(64,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG190320091754.jpg','2020-03-19 15:47:54','1000004',NULL,1000003,'PENDING'),(65,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG190320091828.jpg','2020-03-19 15:48:28','1000004',NULL,1000003,'PENDING'),(66,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG190320091924.jpg','2020-03-19 15:49:24','1000004',NULL,1000003,'PENDING'),(67,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG190320114506.jpg','2020-03-19 18:15:06','1000004',NULL,1000003,'PENDING'),(68,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG190320114648.jpg','2020-03-19 18:16:48','1000004',NULL,1000003,'PENDING'),(69,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG190320114725.jpg','2020-03-19 18:17:25','1000004',NULL,1000003,'PENDING'),(70,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG190320114800.jpg','2020-03-19 18:18:00','1000004',NULL,1000003,'PENDING'),(71,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG190320114900.jpg','2020-03-19 18:19:00','1000004',NULL,1000003,'PENDING'),(72,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG200320120725.jpg','2020-03-19 18:37:25','1000004',NULL,1000003,'PENDING'),(73,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG200320120833.jpg','2020-03-19 18:38:33','1000004',NULL,1000003,'PENDING'),(74,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG200320121004.jpg','2020-03-19 18:40:04','1000004',NULL,1000003,'PENDING'),(75,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG200320121116.jpg','2020-03-19 18:41:16','1000004',NULL,1000003,'PENDING'),(76,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG200320121240.jpg','2020-03-19 18:42:40','1000004',NULL,1000003,'PENDING'),(77,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG200320084641.jpg','2020-03-20 03:16:41','1000004',NULL,1000003,'PENDING'),(78,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG200320084943.jpg','2020-03-20 03:19:43','1000004',NULL,1000003,'PENDING'),(79,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG200320085219.jpg','2020-03-20 03:22:19','1000004',NULL,1000003,'PENDING'),(80,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG200320085500.jpg','2020-03-20 03:25:00','1000004',NULL,1000003,'PENDING'),(81,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG200320085914.jpg','2020-03-20 03:29:14','1000004',NULL,1000003,'PENDING'),(82,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG200320091038.jpg','2020-03-20 03:40:38','1000004',NULL,1000003,'PENDING'),(83,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG200320091212.jpg','2020-03-20 03:42:12','1000004',NULL,1000003,'PENDING'),(84,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG200320092259.jpg','2020-03-20 03:52:59','1000004',NULL,1000003,'PENDING'),(85,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG200320092416.jpg','2020-03-20 03:54:16','1000004',NULL,1000003,'PENDING'),(86,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG200320092515.jpg','2020-03-20 03:55:15','1000004',NULL,1000003,'PENDING'),(87,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG200320114312.jpg','2020-03-20 06:13:12','1000004',NULL,1000003,'PENDING'),(88,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG200320114457.jpg','2020-03-20 06:14:57','1000004',NULL,1000003,'PENDING'),(89,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG200320114623.jpg','2020-03-20 06:16:23','1000004',NULL,1000003,'PENDING'),(90,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG200320114843.jpg','2020-03-20 06:18:43','1000004',NULL,1000003,'PENDING'),(91,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG200320115235.jpg','2020-03-20 06:22:35','1000004',NULL,1000003,'PENDING'),(92,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG200320121633.jpg','2020-03-20 06:46:33','1000004',NULL,1000003,'PENDING'),(93,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG200320121709.jpg','2020-03-20 06:47:09','1000004',NULL,1000003,'PENDING'),(94,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG200320121748.jpg','2020-03-20 06:47:48','1000004',NULL,1000003,'PENDING'),(95,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG200320121904.jpg','2020-03-20 06:49:04','1000004',NULL,1000003,'PENDING'),(96,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG200320021338.jpg','2020-03-20 08:43:38','1000004',NULL,1000003,'PENDING'),(97,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG200320044256.jpg','2020-03-20 11:12:56','1000004',NULL,1000003,'PENDING'),(98,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG200320044818.jpg','2020-03-20 11:18:18','1000004',NULL,1000003,'PENDING'),(99,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG200320044939.jpg','2020-03-20 11:19:39','1000004',NULL,1000003,'PENDING'),(100,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG200320045515.jpg','2020-03-20 11:25:15','1000004',NULL,1000003,'PENDING'),(101,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG200320053122.jpg','2020-03-20 12:01:22','1000004',NULL,1000003,'PENDING'),(102,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG200320053231.jpg','2020-03-20 12:02:31','1000004',NULL,1000003,'PENDING'),(103,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG200320053530.jpg','2020-03-20 12:05:30','1000004',NULL,1000003,'PENDING'),(104,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG200320054139.jpg','2020-03-20 12:11:39','1000004',NULL,1000003,'PENDING'),(105,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG200320054750.jpg','2020-03-20 12:17:50','1000004',NULL,1000003,'PENDING'),(106,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG200320055645.jpg','2020-03-20 12:26:45','1000004',NULL,1000003,'PENDING'),(107,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG200320055752.jpg','2020-03-20 12:27:52','1000004',NULL,1000003,'PENDING'),(108,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG200320055900.jpg','2020-03-20 12:29:00','1000004',NULL,1000003,'PENDING'),(109,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG200320073012.jpg','2020-03-20 14:00:12','1000004',NULL,1000003,'PENDING'),(110,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG200320073049.jpg','2020-03-20 14:00:49','1000004',NULL,1000003,'PENDING'),(111,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG200320073229.jpg','2020-03-20 14:02:29','1000004',NULL,1000003,'PENDING'),(112,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG200320073321.jpg','2020-03-20 14:03:21','1000004',NULL,1000003,'PENDING'),(113,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG200320073536.jpg','2020-03-20 14:05:36','1000004',NULL,1000003,'PENDING'),(114,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG200320073719.jpg','2020-03-20 14:07:19','1000004',NULL,1000003,'PENDING'),(115,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG200320073845.jpg','2020-03-20 14:08:45','1000004',NULL,1000003,'PENDING'),(116,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG200320074041.jpg','2020-03-20 14:10:41','1000004',NULL,1000003,'PENDING'),(117,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG200320074423.jpg','2020-03-20 14:14:23','1000004',NULL,1000003,'PENDING'),(118,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG200320074752.jpg','2020-03-20 14:17:52','1000004',NULL,1000003,'PENDING'),(119,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG200320074952.jpg','2020-03-20 14:19:52','1000004',NULL,1000003,'PENDING'),(120,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG200320075108.jpg','2020-03-20 14:21:08','1000004',NULL,1000003,'PENDING'),(121,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG200320075430.jpg','2020-03-20 14:24:30','1000004',NULL,1000003,'PENDING'),(122,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG200320075538.jpg','2020-03-20 14:25:38','1000004',NULL,1000003,'PENDING'),(123,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG200320075848.jpg','2020-03-20 14:28:48','1000004',NULL,1000003,'PENDING'),(124,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG200320080804.jpg','2020-03-20 14:38:04','1000004',NULL,1000003,'PENDING'),(125,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG200320082703.jpg','2020-03-20 14:57:03','1000004',NULL,1000003,'PENDING'),(126,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG200320084327.jpg','2020-03-20 15:13:27','1000004',NULL,1000003,'PENDING'),(127,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG200320084516.jpg','2020-03-20 15:15:16','1000004',NULL,1000003,'PENDING'),(128,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG200320084618.jpg','2020-03-20 15:16:18','1000004',NULL,1000003,'PENDING'),(129,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG200320084838.jpg','2020-03-20 15:18:38','1000004',NULL,1000003,'PENDING'),(130,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG200320085010.jpg','2020-03-20 15:20:10','1000004',NULL,1000003,'PENDING'),(131,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG210320035755.jpg','2020-03-21 10:27:55','1000004',NULL,1000003,'PENDING'),(132,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG210320040043.jpg','2020-03-21 10:30:43','1000004',NULL,1000003,'PENDING'),(133,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG210320042108.jpg','2020-03-21 10:51:08','1000004',NULL,1000003,'PENDING'),(134,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG210320042313.jpg','2020-03-21 10:53:13','1000004',NULL,1000003,'PENDING'),(135,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG210320042431.jpg','2020-03-21 10:54:31','1000004',NULL,1000003,'PENDING'),(136,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG210320042456.jpg','2020-03-21 10:54:56','1000004',NULL,1000003,'PENDING'),(137,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG210320042554.jpg','2020-03-21 10:55:54','1000004',NULL,1000003,'PENDING'),(138,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG210320042819.jpg','2020-03-21 10:58:19','1000004',NULL,1000003,'PENDING'),(139,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG210320043017.jpg','2020-03-21 11:00:17','1000004',NULL,1000003,'PENDING'),(140,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG210320043520.jpg','2020-03-21 11:05:20','1000004',NULL,1000003,'PENDING'),(141,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG210320043551.jpg','2020-03-21 11:05:51','1000004',NULL,1000003,'PENDING'),(142,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG210320045316.jpg','2020-03-21 11:23:16','1000004',NULL,1000003,'PENDING'),(143,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG210320045433.jpg','2020-03-21 11:24:33','1000004',NULL,1000003,'PENDING'),(144,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG210320045521.jpg','2020-03-21 11:25:21','1000004',NULL,1000003,'PENDING'),(145,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG210320045631.jpg','2020-03-21 11:26:31','1000004',NULL,1000003,'PENDING'),(146,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG210320045824.jpg','2020-03-21 11:28:24','1000004',NULL,1000003,'PENDING'),(147,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG210320053624.jpg','2020-03-21 12:06:24','1000004',NULL,1000003,'PENDING'),(148,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG210320053745.jpg','2020-03-21 12:07:45','1000004',NULL,1000003,'PENDING'),(149,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG210320054057.jpg','2020-03-21 12:10:57','1000004',NULL,1000003,'PENDING'),(150,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG210320054235.jpg','2020-03-21 12:12:35','1000004',NULL,1000003,'PENDING'),(151,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG210320054944.jpg','2020-03-21 12:19:44','1000004',NULL,1000003,'PENDING'),(152,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG210320055021.jpg','2020-03-21 12:20:21','1000004',NULL,1000003,'PENDING'),(153,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG210320055153.jpg','2020-03-21 12:21:53','1000004',NULL,1000003,'PENDING'),(154,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG210320061247.jpg','2020-03-21 12:42:47','1000004',NULL,1000003,'PENDING'),(155,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG230320020723.jpg','2020-03-23 08:37:23','1000004',NULL,1000003,'PENDING'),(156,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG230320021010.jpg','2020-03-23 08:40:10','1000004',NULL,1000003,'PENDING'),(157,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG230320021214.jpg','2020-03-23 08:42:14','1000004',NULL,1000003,'PENDING'),(158,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG230320021648.jpg','2020-03-23 08:46:48','1000004',NULL,1000003,'PENDING'),(159,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG230320021751.jpg','2020-03-23 08:47:51','1000004',NULL,1000003,'PENDING'),(160,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG230320022500.jpg','2020-03-23 08:55:00','1000004',NULL,1000003,'PENDING'),(161,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG230320022622.jpg','2020-03-23 08:56:22','1000004',NULL,1000003,'PENDING'),(162,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG230320022923.jpg','2020-03-23 08:59:23','1000004',NULL,1000003,'PENDING'),(163,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG230320030216.jpg','2020-03-23 09:32:16','1000004',NULL,1000003,'PENDING'),(164,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG230320030253.jpg','2020-03-23 09:32:53','1000004',NULL,1000003,'PENDING'),(165,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG230320031031.jpg','2020-03-23 09:40:31','1000004',NULL,1000003,'PENDING'),(166,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG230320050258.jpg','2020-03-23 11:32:58','1000004',NULL,1000003,'PENDING'),(167,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG230320051956.jpg','2020-03-23 11:49:56','1000004',NULL,1000003,'PENDING'),(168,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG230320052936.jpg','2020-03-23 11:59:36','1000004',NULL,1000003,'PENDING'),(169,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG230320062208.jpg','2020-03-23 12:52:08','1000004',NULL,1000003,'PENDING'),(170,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG230320062332.jpg','2020-03-23 12:53:32','1000004',NULL,1000003,'PENDING'),(171,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG230320062704.jpg','2020-03-23 12:57:04','1000004',NULL,1000003,'PENDING'),(172,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG230320062747.jpg','2020-03-23 12:57:47','1000004',NULL,1000003,'PENDING'),(173,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG230320095406.jpg','2020-03-23 16:24:06','1000004',NULL,1000003,'PENDING'),(174,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG230320095832.jpg','2020-03-23 16:28:32','1000004',NULL,1000003,'PENDING'),(175,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG230320100247.jpg','2020-03-23 16:32:47','1000004',NULL,1000003,'PENDING'),(176,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG240320082812.jpg','2020-03-24 02:58:12','1000004',NULL,1000003,'PENDING'),(177,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG240320085710.jpg','2020-03-24 03:27:10','1000004',NULL,1000003,'PENDING'),(178,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG240320085755.jpg','2020-03-24 03:27:55','1000004',NULL,1000003,'PENDING'),(179,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG240320090050.jpg','2020-03-24 03:30:50','1000004',NULL,1000003,'PENDING'),(180,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG240320090134.jpg','2020-03-24 03:31:34','1000004',NULL,1000003,'PENDING'),(181,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG240320090532.jpg','2020-03-24 03:35:32','1000004',NULL,1000003,'PENDING'),(182,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG240320090950.jpg','2020-03-24 03:39:50','1000004',NULL,1000003,'PENDING'),(183,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG240320092612.jpg','2020-03-24 03:56:12','1000004',NULL,1000003,'PENDING'),(184,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG240320092917.jpg','2020-03-24 03:59:17','1000004',NULL,1000003,'PENDING'),(185,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG240320093207.jpg','2020-03-24 04:02:07','1000004',NULL,1000003,'PENDING'),(186,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG240320095034.jpg','2020-03-24 04:20:34','1000004',NULL,1000003,'PENDING'),(187,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG240320095124.jpg','2020-03-24 04:21:24','1000004',NULL,1000003,'PENDING'),(188,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG240320095240.jpg','2020-03-24 04:22:40','1000004',NULL,1000003,'PENDING'),(189,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG240320095433.jpg','2020-03-24 04:24:33','1000004',NULL,1000003,'PENDING'),(190,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG240320095543.jpg','2020-03-24 04:25:43','1000004',NULL,1000003,'PENDING'),(191,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG240320095622.jpg','2020-03-24 04:26:22','1000004',NULL,1000003,'PENDING'),(192,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG240320095828.jpg','2020-03-24 04:28:28','1000004',NULL,1000003,'PENDING'),(193,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG240320100513.jpg','2020-03-24 04:35:13','1000004',NULL,1000003,'PENDING'),(194,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG240320100740.jpg','2020-03-24 04:37:40','1000004',NULL,1000003,'PENDING'),(195,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG240320100851.jpg','2020-03-24 04:38:51','1000004',NULL,1000003,'PENDING'),(196,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG240320101012.jpg','2020-03-24 04:40:12','1000004',NULL,1000003,'PENDING'),(197,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG240320101144.jpg','2020-03-24 04:41:44','1000004',NULL,1000003,'PENDING'),(198,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG250320105543.jpg','2020-03-25 17:25:43','1000004',NULL,1000003,'PENDING'),(199,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG250320110548.jpg','2020-03-25 17:35:48','1000004',NULL,1000003,'PENDING'),(200,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG250320112011.jpg','2020-03-25 17:50:11','1000004',NULL,1000003,'PENDING'),(201,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG250320112108.jpg','2020-03-25 17:51:08','1000004',NULL,1000003,'PENDING'),(202,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG250320112236.jpg','2020-03-25 17:52:36','1000004',NULL,1000003,'PENDING'),(203,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG250320113055.jpg','2020-03-25 18:00:55','1000004',NULL,1000003,'PENDING'),(204,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG250320113209.jpg','2020-03-25 18:02:09','1000004',NULL,1000003,'PENDING'),(205,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG260320085416.jpg','2020-03-26 03:24:16','1000004',NULL,1000003,'PENDING'),(206,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG260320085500.jpg','2020-03-26 03:25:00','1000004',NULL,1000003,'PENDING'),(207,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG260320111907.jpg','2020-03-26 05:49:07','1000004',NULL,1000003,'PENDING'),(208,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG260320112408.jpg','2020-03-26 05:54:08','1000004',NULL,1000003,'PENDING'),(209,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG260320064817.jpg','2020-03-26 13:18:17','1000004',NULL,1000003,'PENDING'),(210,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG260320092352.jpg','2020-03-26 15:53:52','1000004',NULL,1000003,'PENDING'),(211,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG260320092623.jpg','2020-03-26 15:56:23','1000004',NULL,1000003,'PENDING'),(212,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG260320092757.jpg','2020-03-26 15:57:57','1000004',NULL,1000003,'PENDING'),(213,'IMAGE','This is in details',_binary 'https://projectdailies.bilsamtech.in/images/IMG260320092922.jpg','2020-03-26 15:59:22','1000004',NULL,1000003,'PENDING');
/*!40000 ALTER TABLE `clientBizAttributes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-10 19:24:44