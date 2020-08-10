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
-- Table structure for table `custWalleTxn`
--

DROP TABLE IF EXISTS `custWalleTxn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custWalleTxn` (
  `txnid` bigint(20) NOT NULL AUTO_INCREMENT,
  `custid` bigint(20) DEFAULT NULL,
  `amount` varchar(45) DEFAULT NULL,
  `mode` enum('CR','WD') DEFAULT NULL COMMENT 'CR ==> Credied\nWD ==> Withdraw\n',
  `addedon` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `from_ip` varchar(45) DEFAULT NULL,
  `refid` varchar(45) DEFAULT NULL,
  `refname` varchar(45) DEFAULT NULL,
  `details` varchar(450) NOT NULL,
  PRIMARY KEY (`txnid`),
  KEY `wal_2_cust_idx` (`custid`),
  CONSTRAINT `wal_2_cust` FOREIGN KEY (`custid`) REFERENCES `customer` (`custid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=100048 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custWalleTxn`
--

LOCK TABLES `custWalleTxn` WRITE;
/*!40000 ALTER TABLE `custWalleTxn` DISABLE KEYS */;
INSERT INTO `custWalleTxn` VALUES (100000,1,'100','CR','2020-03-13 17:20:12','103.195.83.25','qwe','123','about my purchased order'),(100001,1,'500','WD','2020-03-23 09:41:08','49.35.33.141','3',NULL,'JEllo Text deafaukt'),(100002,1,'500','WD','2020-03-23 11:33:11','49.35.62.78','3',NULL,'JEllo Text deafaukt'),(100003,1,'500','WD','2020-03-23 11:50:07','49.35.62.78','3',NULL,'JEllo Text deafaukt'),(100004,1,'500','WD','2020-03-23 11:59:46','49.35.62.78','3',NULL,'JEllo Text deafaukt'),(100005,1,'500','WD','2020-03-23 12:52:17','49.35.62.78','3',NULL,'JEllo Text deafaukt'),(100006,1,'500','WD','2020-03-23 12:53:42','49.35.62.78','3',NULL,'JEllo Text deafaukt'),(100007,1,'500','WD','2020-03-23 12:57:56','49.35.62.78','3',NULL,'JEllo Text deafaukt'),(100008,1,'500','WD','2020-03-23 16:24:16','157.33.208.193','3',NULL,'JEllo Text deafaukt'),(100009,1,'500','WD','2020-03-23 16:28:42','157.33.208.193','3',NULL,'JEllo Text deafaukt'),(100010,1,'500','WD','2020-03-23 16:32:57','157.33.208.193','3',NULL,'JEllo Text deafaukt'),(100011,1,'500','WD','2020-03-24 02:58:19','157.33.203.74','3',NULL,'JEllo Text deafaukt'),(100012,1,'500','WD','2020-03-24 03:28:04','157.33.203.74','3',NULL,'JEllo Text deafaukt'),(100013,1,'500','WD','2020-03-24 03:30:59','157.33.203.74','3',NULL,'JEllo Text deafaukt'),(100014,1,'500','WD','2020-03-24 03:31:44','157.33.203.74','3',NULL,'JEllo Text deafaukt'),(100015,1,'500','WD','2020-03-24 03:35:41','157.33.203.74','3',NULL,'JEllo Text deafaukt'),(100016,1,'500','WD','2020-03-24 03:39:59','157.33.203.74','3',NULL,'JEllo Text deafaukt'),(100017,1,'500','WD','2020-03-24 03:56:20','157.33.203.74','3',NULL,'JEllo Text deafaukt'),(100018,1,'500','WD','2020-03-24 03:59:25','157.33.203.74','3',NULL,'JEllo Text deafaukt'),(100019,1,'500','WD','2020-03-24 04:02:16','157.33.203.74','3',NULL,'JEllo Text deafaukt'),(100020,1,'500','WD','2020-03-24 04:20:43','157.33.203.74','3',NULL,'JEllo Text deafaukt'),(100021,1,'500','WD','2020-03-24 04:21:34','157.33.203.74','3',NULL,'JEllo Text deafaukt'),(100022,1,'500','WD','2020-03-24 04:22:50','157.33.203.74','3',NULL,'JEllo Text deafaukt'),(100023,1,'500','WD','2020-03-24 04:24:42','157.33.203.74','3',NULL,'JEllo Text deafaukt'),(100024,1,'500','WD','2020-03-24 04:25:52','157.33.203.74','3',NULL,'JEllo Text deafaukt'),(100025,1,'500','WD','2020-03-24 04:26:37','157.33.203.74','3',NULL,'JEllo Text deafaukt'),(100026,1,'500','WD','2020-03-24 04:28:37','157.33.203.74','3',NULL,'JEllo Text deafaukt'),(100027,1,'500','WD','2020-03-24 04:35:23','157.33.203.74','3',NULL,'JEllo Text deafaukt'),(100028,1,'500','WD','2020-03-24 04:37:49','157.33.203.74','3',NULL,'JEllo Text deafaukt'),(100029,1,'500','WD','2020-03-24 04:39:00','157.33.203.74','3',NULL,'JEllo Text deafaukt'),(100030,1,'500','WD','2020-03-24 04:40:22','157.33.203.74','3',NULL,'JEllo Text deafaukt'),(100031,1,'500','WD','2020-03-24 04:41:59','157.33.203.74','3',NULL,'JEllo Text deafaukt'),(100032,1,'500','WD','2020-03-25 17:25:54','157.33.207.230','3',NULL,'JEllo Text deafaukt'),(100033,1,'500','WD','2020-03-25 17:36:00','157.33.207.230','3',NULL,'JEllo Text deafaukt'),(100034,1,'500','WD','2020-03-25 17:50:22','157.33.207.230','3',NULL,'JEllo Text deafaukt'),(100035,1,'500','WD','2020-03-25 17:51:18','157.33.207.230','3',NULL,'JEllo Text deafaukt'),(100036,1,'500','WD','2020-03-25 17:52:45','157.33.207.230','3',NULL,'JEllo Text deafaukt'),(100037,1,'500','WD','2020-03-25 18:01:05','157.33.207.230','3',NULL,'JEllo Text deafaukt'),(100038,1,'500','WD','2020-03-25 18:02:18','157.33.207.230','3',NULL,'JEllo Text deafaukt'),(100039,1,'500','WD','2020-03-26 03:24:27','157.33.146.64','3',NULL,'JEllo Text deafaukt'),(100040,1,'500','WD','2020-03-26 03:25:11','157.33.146.64','3',NULL,'JEllo Text deafaukt'),(100041,1,'500','WD','2020-03-26 05:49:20','157.33.160.26','3',NULL,'JEllo Text deafaukt'),(100042,1,'500','WD','2020-03-26 05:54:19','157.33.160.26','3',NULL,'JEllo Text deafaukt'),(100043,1,'500','WD','2020-03-26 13:18:28','157.33.160.144','3',NULL,'JEllo Text deafaukt'),(100044,1,'500','WD','2020-03-26 15:54:02','157.33.172.58','3',NULL,'JEllo Text deafaukt'),(100045,1,'500','WD','2020-03-26 15:56:33','157.33.172.58','3',NULL,'JEllo Text deafaukt'),(100046,1,'500','WD','2020-03-26 15:58:06','157.33.172.58','3',NULL,'JEllo Text deafaukt'),(100047,1,'500','WD','2020-03-26 15:59:33','157.33.172.58','3',NULL,'JEllo Text deafaukt');
/*!40000 ALTER TABLE `custWalleTxn` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-10 19:28:19
