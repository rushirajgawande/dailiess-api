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
-- Table structure for table `customer_orders`
--

DROP TABLE IF EXISTS `customer_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_orders` (
  `custorderid` bigint(20) NOT NULL AUTO_INCREMENT,
  `refid` varchar(45) DEFAULT NULL,
  `refname` varchar(45) DEFAULT NULL,
  `lat` varchar(45) DEFAULT NULL,
  `lng` varchar(45) DEFAULT NULL,
  `custid` bigint(20) DEFAULT NULL,
  `from_ip` varchar(45) DEFAULT NULL,
  `addedon` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('ACCEPTED','OPEN','PREPARED','OUTFORDELIVERY','DELIVERED','CANCELLED','RETURNED','REFUNDED') DEFAULT 'OPEN',
  `accepted_by_id` bigint(20) DEFAULT NULL,
  `addrid` bigint(20) DEFAULT NULL,
  `order_mode` enum('COD','ONLINE') DEFAULT NULL,
  `delivered_by_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`custorderid`),
  KEY `cord_2_cust_idx` (`custid`),
  KEY `cord_2_addr_idx` (`addrid`),
  CONSTRAINT `cord_2_addr` FOREIGN KEY (`addrid`) REFERENCES `customer_address` (`addrid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `cord_2_cust` FOREIGN KEY (`custid`) REFERENCES `customer` (`custid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=260320112412 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_orders`
--

LOCK TABLES `customer_orders` WRITE;
/*!40000 ALTER TABLE `customer_orders` DISABLE KEYS */;
INSERT INTO `customer_orders` VALUES (150320022055,'321','abc','12121','343434',1,'103.195.83.25','2020-03-14 20:50:55','OPEN',NULL,1,NULL,NULL),(190320071624,'3',NULL,'321321','546564654',3,'223.235.12.75','2020-03-19 13:46:24','OPEN',NULL,1,NULL,NULL),(190320071752,'3',NULL,'321321','546564654',3,'223.235.12.75','2020-03-19 13:47:52','OPEN',NULL,27,NULL,NULL),(190320073325,'3',NULL,'321321','546564654',3,'223.235.12.75','2020-03-19 14:03:25','OPEN',NULL,28,NULL,NULL),(190320073538,'3',NULL,'321321','546564654',3,'223.235.12.75','2020-03-19 14:05:38','OPEN',NULL,29,NULL,NULL),(190320073614,'3',NULL,'321321','546564654',3,'223.235.12.75','2020-03-19 14:06:14','OPEN',NULL,30,NULL,NULL),(190320073710,'3',NULL,'321321','546564654',3,'223.235.12.75','2020-03-19 14:07:10','OPEN',NULL,31,NULL,NULL),(190320075716,'3',NULL,'321321','546564654',3,'106.220.185.17','2020-03-19 14:27:16','OPEN',NULL,32,NULL,NULL),(190320080018,'3',NULL,'321321','546564654',3,'106.220.185.17','2020-03-19 14:30:18','OPEN',NULL,33,NULL,NULL),(190320080154,'3',NULL,'321321','546564654',3,'106.220.185.17','2020-03-19 14:31:54','OPEN',NULL,34,NULL,NULL),(190320080341,'3',NULL,'321321','546564654',3,'106.220.185.17','2020-03-19 14:33:41','OPEN',NULL,35,NULL,NULL),(190320080622,'3',NULL,'321321','546564654',3,'106.220.185.17','2020-03-19 14:36:22','OPEN',NULL,36,NULL,NULL),(190320085823,'3',NULL,'321321','546564654',3,'110.227.214.2','2020-03-19 15:28:23','OPEN',NULL,37,NULL,NULL),(190320085903,'3',NULL,'321321','546564654',3,'110.227.214.2','2020-03-19 15:29:03','OPEN',NULL,38,NULL,NULL),(190320091758,'3',NULL,'321321','546564654',3,'110.227.214.2','2020-03-19 15:47:58','OPEN',NULL,39,NULL,NULL),(190320091830,'3',NULL,'321321','546564654',3,'110.227.214.2','2020-03-19 15:48:30','OPEN',NULL,40,NULL,NULL),(190320091927,'3',NULL,'321321','546564654',3,'110.227.214.2','2020-03-19 15:49:27','OPEN',NULL,41,NULL,NULL),(190320114516,'3',NULL,'321321','546564654',3,'49.35.50.145','2020-03-19 18:15:16','OPEN',NULL,42,NULL,NULL),(190320114656,'3',NULL,'321321','546564654',3,'49.35.50.145','2020-03-19 18:16:56','OPEN',NULL,43,NULL,NULL),(190320114732,'3',NULL,'321321','546564654',3,'49.35.50.145','2020-03-19 18:17:32','OPEN',NULL,44,NULL,NULL),(190320114809,'3',NULL,'321321','546564654',3,'49.35.50.145','2020-03-19 18:18:09','OPEN',NULL,45,NULL,NULL),(190320114908,'3',NULL,'321321','546564654',3,'49.35.50.145','2020-03-19 18:19:08','OPEN',NULL,46,NULL,NULL),(200320014034,'3',NULL,'321321','546564654',3,'171.50.255.157','2020-03-20 08:10:34','OPEN',NULL,71,NULL,NULL),(200320021340,'3',NULL,'321321','546564654',3,'171.50.255.157','2020-03-20 08:43:40','OPEN',NULL,72,NULL,NULL),(200320044258,'3',NULL,'321321','546564654',3,'171.50.255.157','2020-03-20 11:12:58','OPEN',NULL,73,NULL,NULL),(200320044820,'3',NULL,'321321','546564654',3,'171.50.255.157','2020-03-20 11:18:20','OPEN',NULL,74,NULL,NULL),(200320044942,'3',NULL,'321321','546564654',3,'171.50.255.157','2020-03-20 11:19:42','OPEN',NULL,75,NULL,NULL),(200320045517,'3',NULL,'321321','546564654',3,'171.50.255.157','2020-03-20 11:25:17','OPEN',NULL,76,NULL,NULL),(200320053124,'3',NULL,'321321','546564654',3,'122.179.162.155','2020-03-20 12:01:24','OPEN',NULL,77,NULL,NULL),(200320053233,'3',NULL,'321321','546564654',3,'122.179.162.155','2020-03-20 12:02:33','OPEN',NULL,78,NULL,NULL),(200320053532,'3',NULL,'321321','546564654',3,'122.179.162.155','2020-03-20 12:05:32','OPEN',NULL,79,NULL,NULL),(200320054143,'3',NULL,'321321','546564654',3,'106.193.239.129','2020-03-20 12:11:43','OPEN',NULL,80,NULL,NULL),(200320054800,'3',NULL,'321321','546564654',3,'106.193.239.129','2020-03-20 12:18:00','OPEN',NULL,81,NULL,NULL),(200320055647,'3',NULL,'321321','546564654',3,'122.169.73.22','2020-03-20 12:26:47','OPEN',NULL,82,NULL,NULL),(200320055754,'3',NULL,'321321','546564654',3,'122.169.73.22','2020-03-20 12:27:54','OPEN',NULL,83,NULL,NULL),(200320055902,'3',NULL,'321321','546564654',3,'122.169.73.22','2020-03-20 12:29:02','OPEN',NULL,84,NULL,NULL),(200320073014,'3',NULL,'321321','546564654',3,'223.229.227.49','2020-03-20 14:00:14','OPEN',NULL,85,NULL,NULL),(200320073051,'3',NULL,'321321','546564654',3,'223.229.227.49','2020-03-20 14:00:51','OPEN',NULL,86,NULL,NULL),(200320073231,'3',NULL,'321321','546564654',3,'223.229.227.49','2020-03-20 14:02:31','OPEN',NULL,87,NULL,NULL),(200320073324,'3',NULL,'321321','546564654',3,'223.229.227.49','2020-03-20 14:03:24','OPEN',NULL,88,NULL,NULL),(200320073538,'3',NULL,'321321','546564654',3,'223.229.227.49','2020-03-20 14:05:38','OPEN',NULL,89,NULL,NULL),(200320073722,'3',NULL,'321321','546564654',3,'223.229.227.49','2020-03-20 14:07:22','OPEN',NULL,90,NULL,NULL),(200320073847,'3',NULL,'321321','546564654',3,'223.229.227.49','2020-03-20 14:08:47','OPEN',NULL,91,NULL,NULL),(200320074044,'3',NULL,'321321','546564654',3,'223.229.227.49','2020-03-20 14:10:44','OPEN',NULL,92,NULL,NULL),(200320074425,'3',NULL,'321321','546564654',3,'223.229.227.49','2020-03-20 14:14:25','OPEN',NULL,93,NULL,NULL),(200320074753,'3',NULL,'321321','546564654',3,'223.229.227.49','2020-03-20 14:17:53','OPEN',NULL,94,NULL,NULL),(200320074954,'3',NULL,'321321','546564654',3,'223.229.227.49','2020-03-20 14:19:54','OPEN',NULL,95,NULL,NULL),(200320075110,'3',NULL,'321321','546564654',3,'223.229.227.49','2020-03-20 14:21:10','OPEN',NULL,96,NULL,NULL),(200320075432,'3',NULL,'321321','546564654',3,'223.229.227.49','2020-03-20 14:24:32','OPEN',NULL,97,NULL,NULL),(200320075540,'3',NULL,'321321','546564654',3,'223.229.227.49','2020-03-20 14:25:40','OPEN',NULL,98,NULL,NULL),(200320075850,'3',NULL,'321321','546564654',3,'223.229.227.49','2020-03-20 14:28:50','OPEN',NULL,99,NULL,NULL),(200320080807,'3',NULL,'321321','546564654',3,'223.229.227.49','2020-03-20 14:38:07','OPEN',NULL,100,NULL,NULL),(200320082705,'3',NULL,'321321','546564654',3,'223.229.227.49','2020-03-20 14:57:05','OPEN',NULL,101,NULL,NULL),(200320084329,'3',NULL,'321321','546564654',3,'223.229.227.49','2020-03-20 15:13:29','OPEN',NULL,102,NULL,NULL),(200320084518,'3',NULL,'321321','546564654',3,'223.229.227.49','2020-03-20 15:15:18','OPEN',NULL,103,NULL,NULL),(200320084620,'3',NULL,'321321','546564654',3,'223.229.227.49','2020-03-20 15:16:20','OPEN',NULL,104,NULL,NULL),(200320084646,'3',NULL,'321321','546564654',3,'49.35.38.55','2020-03-20 03:16:46','OPEN',NULL,52,NULL,NULL),(200320084841,'3',NULL,'321321','546564654',3,'223.229.227.49','2020-03-20 15:18:41','OPEN',NULL,105,NULL,NULL),(200320084951,'3',NULL,'321321','546564654',3,'49.35.38.55','2020-03-20 03:19:51','OPEN',NULL,53,NULL,NULL),(200320085012,'3',NULL,'321321','546564654',3,'223.229.227.49','2020-03-20 15:20:12','OPEN',NULL,106,NULL,NULL),(200320085227,'3',NULL,'321321','546564654',3,'49.35.38.55','2020-03-20 03:22:27','OPEN',NULL,54,NULL,NULL),(200320085508,'3',NULL,'321321','546564654',3,'49.35.38.55','2020-03-20 03:25:08','OPEN',NULL,55,NULL,NULL),(200320085919,'3',NULL,'321321','546564654',3,'49.35.38.55','2020-03-20 03:29:19','OPEN',NULL,56,NULL,NULL),(200320091046,'3',NULL,'321321','546564654',3,'49.35.38.55','2020-03-20 03:40:46','OPEN',NULL,57,NULL,NULL),(200320091220,'3',NULL,'321321','546564654',3,'49.35.38.55','2020-03-20 03:42:20','OPEN',NULL,58,NULL,NULL),(200320092307,'3',NULL,'321321','546564654',3,'49.35.38.55','2020-03-20 03:53:07','OPEN',NULL,59,NULL,NULL),(200320092424,'3',NULL,'321321','546564654',3,'49.35.38.55','2020-03-20 03:54:24','OPEN',NULL,60,NULL,NULL),(200320092522,'3',NULL,'321321','546564654',3,'49.35.38.55','2020-03-20 03:55:22','OPEN',NULL,61,NULL,NULL),(200320114317,'3',NULL,'321321','546564654',3,'171.50.255.157','2020-03-20 06:13:17','OPEN',NULL,62,NULL,NULL),(200320114503,'3',NULL,'321321','546564654',3,'171.50.255.157','2020-03-20 06:15:03','OPEN',NULL,63,NULL,NULL),(200320114629,'3',NULL,'321321','546564654',3,'171.50.255.157','2020-03-20 06:16:29','OPEN',NULL,64,NULL,NULL),(200320114849,'3',NULL,'321321','546564654',3,'171.50.255.157','2020-03-20 06:18:49','OPEN',NULL,65,NULL,NULL),(200320115241,'3',NULL,'321321','546564654',3,'171.50.255.157','2020-03-20 06:22:41','OPEN',NULL,66,NULL,NULL),(200320120732,'3',NULL,'321321','546564654',3,'49.35.50.145','2020-03-19 18:37:32','OPEN',NULL,47,NULL,NULL),(200320120841,'3',NULL,'321321','546564654',3,'49.35.50.145','2020-03-19 18:38:41','OPEN',NULL,48,NULL,NULL),(200320121013,'3',NULL,'321321','546564654',3,'49.35.50.145','2020-03-19 18:40:13','OPEN',NULL,49,NULL,NULL),(200320121124,'3',NULL,'321321','546564654',3,'49.35.50.145','2020-03-19 18:41:24','OPEN',NULL,50,NULL,NULL),(200320121248,'3',NULL,'321321','546564654',3,'49.35.50.145','2020-03-19 18:42:48','OPEN',NULL,51,NULL,NULL),(200320121634,'3',NULL,'321321','546564654',3,'171.50.255.157','2020-03-20 06:46:34','OPEN',NULL,67,NULL,NULL),(200320121711,'3',NULL,'321321','546564654',3,'171.50.255.157','2020-03-20 06:47:11','OPEN',NULL,68,NULL,NULL),(200320121749,'3',NULL,'321321','546564654',3,'171.50.255.157','2020-03-20 06:47:49','OPEN',NULL,69,NULL,NULL),(200320121905,'3',NULL,'321321','546564654',3,'171.50.255.157','2020-03-20 06:49:05','OPEN',NULL,70,NULL,NULL),(210320035759,'3',NULL,'321321','546564654',3,'49.35.38.180','2020-03-21 10:27:59','OPEN',NULL,107,NULL,NULL),(210320040045,'3',NULL,'321321','546564654',3,'49.35.38.180','2020-03-21 10:30:45','OPEN',NULL,108,NULL,NULL),(210320042111,'3',NULL,'321321','546564654',3,'49.35.38.180','2020-03-21 10:51:11','OPEN',NULL,109,NULL,NULL),(210320042316,'3',NULL,'321321','546564654',3,'49.35.38.180','2020-03-21 10:53:16','OPEN',NULL,110,NULL,NULL),(210320042434,'3',NULL,'321321','546564654',3,'49.35.38.180','2020-03-21 10:54:34','OPEN',NULL,111,NULL,NULL),(210320042459,'3',NULL,'321321','546564654',3,'49.35.38.180','2020-03-21 10:54:59','OPEN',NULL,112,NULL,NULL),(210320042558,'3',NULL,'321321','546564654',3,'49.35.38.180','2020-03-21 10:55:58','OPEN',NULL,113,NULL,NULL),(210320042821,'3',NULL,'321321','546564654',3,'49.35.38.180','2020-03-21 10:58:21','OPEN',NULL,114,NULL,NULL),(210320043020,'3',NULL,'321321','546564654',3,'49.35.38.180','2020-03-21 11:00:20','OPEN',NULL,115,NULL,NULL),(210320043523,'3',NULL,'321321','546564654',3,'49.35.38.180','2020-03-21 11:05:23','RETURNED',NULL,116,NULL,2),(210320043554,'3',NULL,'321321','546564654',3,'49.35.38.180','2020-03-21 11:05:54','OPEN',NULL,117,NULL,NULL),(210320045319,'3',NULL,'321321','546564654',3,'49.35.38.180','2020-03-21 11:23:19','OPEN',NULL,118,NULL,NULL),(210320045436,'3',NULL,'321321','546564654',3,'49.35.38.180','2020-03-21 11:24:36','OPEN',NULL,119,NULL,NULL),(210320045523,'3',NULL,'321321','546564654',3,'49.35.38.180','2020-03-21 11:25:23','OPEN',NULL,120,NULL,NULL),(210320045633,'3',NULL,'321321','546564654',3,'49.35.38.180','2020-03-21 11:26:33','OPEN',NULL,121,NULL,NULL),(210320045827,'3',NULL,'321321','546564654',3,'49.35.38.180','2020-03-21 11:28:27','OPEN',NULL,122,NULL,NULL),(210320053626,'3',NULL,'321321','546564654',3,'49.35.38.180','2020-03-21 12:06:26','OPEN',NULL,123,NULL,NULL),(210320053748,'3',NULL,'321321','546564654',3,'49.35.38.180','2020-03-21 12:07:48','OPEN',NULL,124,NULL,NULL),(210320054101,'3',NULL,'321321','546564654',3,'49.35.38.180','2020-03-21 12:11:01','OPEN',NULL,125,NULL,NULL),(210320054238,'3',NULL,'321321','546564654',3,'49.35.38.180','2020-03-21 12:12:38','OPEN',NULL,126,NULL,NULL),(210320054946,'3',NULL,'321321','546564654',3,'49.35.38.180','2020-03-21 12:19:46','OPEN',NULL,127,NULL,NULL),(210320055023,'3',NULL,'321321','546564654',3,'49.35.38.180','2020-03-21 12:20:23','OPEN',NULL,128,NULL,NULL),(210320055156,'3',NULL,'321321','546564654',3,'49.35.38.180','2020-03-21 12:21:56','OPEN',NULL,129,NULL,NULL),(210320061251,'3',NULL,'321321','546564654',3,'49.35.59.32','2020-03-21 12:42:51','OPEN',NULL,130,NULL,NULL),(230320021754,'3',NULL,'321321','546564654',3,'49.35.33.141','2020-03-23 08:47:54','OPEN',NULL,135,NULL,NULL),(230320022505,'3',NULL,'321321','546564654',3,'49.35.33.141','2020-03-23 08:55:05','OPEN',NULL,136,NULL,NULL),(230320022626,'3',NULL,'321321','546564654',3,'49.35.33.141','2020-03-23 08:56:26','OPEN',NULL,137,NULL,NULL),(230320022926,'3',NULL,'321321','546564654',3,'49.35.33.141','2020-03-23 08:59:26','OPEN',NULL,138,NULL,NULL),(230320030220,'3',NULL,'321321','546564654',3,'49.35.33.141','2020-03-23 09:32:20','OPEN',NULL,139,NULL,NULL),(230320030257,'3',NULL,'321321','546564654',3,'49.35.33.141','2020-03-23 09:32:57','OPEN',NULL,140,NULL,NULL),(230320031039,'3',NULL,'321321','546564654',3,'49.35.33.141','2020-03-23 09:40:39','OPEN',NULL,141,NULL,NULL),(230320050304,'3',NULL,'321321','546564654',3,'49.35.62.78','2020-03-23 11:33:04','OPEN',NULL,142,NULL,NULL),(230320051959,'3',NULL,'321321','546564654',3,'49.35.62.78','2020-03-23 11:49:59','OPEN',NULL,143,NULL,NULL),(230320052939,'3',NULL,'321321','546564654',3,'49.35.62.78','2020-03-23 11:59:39','OPEN',NULL,144,NULL,NULL),(230320062211,'3',NULL,'321321','546564654',3,'49.35.62.78','2020-03-23 12:52:11','OPEN',NULL,145,NULL,NULL),(230320062335,'3',NULL,'321321','546564654',3,'49.35.62.78','2020-03-23 12:53:35','OPEN',NULL,146,NULL,NULL),(230320062750,'3',NULL,'321321','546564654',3,'49.35.62.78','2020-03-23 12:57:50','OPEN',NULL,148,NULL,NULL),(230320095409,'3',NULL,'321321','546564654',3,'157.33.208.193','2020-03-23 16:24:09','OPEN',NULL,149,NULL,NULL),(230320095835,'3',NULL,'321321','546564654',3,'157.33.208.193','2020-03-23 16:28:35','OPEN',NULL,150,NULL,NULL),(230320100250,'3',NULL,'321321','546564654',3,'157.33.208.193','2020-03-23 16:32:50','OPEN',NULL,151,NULL,NULL),(240320082814,'3',NULL,'321321','546564654',3,'157.33.203.74','2020-03-24 02:58:14','OPEN',NULL,152,NULL,NULL),(240320085758,'3',NULL,'321321','546564654',3,'157.33.203.74','2020-03-24 03:27:58','OPEN',NULL,153,NULL,NULL),(240320090053,'3',NULL,'321321','546564654',3,'157.33.203.74','2020-03-24 03:30:53','OPEN',NULL,154,NULL,NULL),(240320090137,'3',NULL,'321321','546564654',3,'157.33.203.74','2020-03-24 03:31:37','OPEN',NULL,155,NULL,NULL),(240320090535,'3',NULL,'321321','546564654',3,'157.33.203.74','2020-03-24 03:35:35','OPEN',NULL,156,NULL,NULL),(240320090953,'3',NULL,'321321','546564654',3,'157.33.203.74','2020-03-24 03:39:53','OPEN',NULL,157,NULL,NULL),(240320092615,'3',NULL,'321321','546564654',3,'157.33.203.74','2020-03-24 03:56:15','OPEN',NULL,158,NULL,NULL),(240320092920,'3',NULL,'321321','546564654',3,'157.33.203.74','2020-03-24 03:59:20','OPEN',NULL,159,NULL,NULL),(240320093210,'3',NULL,'321321','546564654',3,'157.33.203.74','2020-03-24 04:02:10','OPEN',NULL,160,NULL,NULL),(240320095037,'3',NULL,'321321','546564654',3,'157.33.203.74','2020-03-24 04:20:37','OPEN',NULL,161,NULL,NULL),(240320095128,'3',NULL,'321321','546564654',3,'157.33.203.74','2020-03-24 04:21:28','OPEN',NULL,162,NULL,NULL),(240320095243,'3',NULL,'321321','546564654',3,'157.33.203.74','2020-03-24 04:22:43','OPEN',NULL,163,NULL,NULL),(240320095436,'3',NULL,'321321','546564654',3,'157.33.203.74','2020-03-24 04:24:36','OPEN',NULL,164,NULL,NULL),(240320095546,'3',NULL,'321321','546564654',3,'157.33.203.74','2020-03-24 04:25:46','OPEN',NULL,165,NULL,NULL),(240320095626,'3',NULL,'321321','546564654',3,'157.33.203.74','2020-03-24 04:26:26','OPEN',NULL,166,NULL,NULL),(240320095831,'3',NULL,'321321','546564654',3,'157.33.203.74','2020-03-24 04:28:31','OPEN',NULL,167,NULL,NULL),(240320100516,'3',NULL,'321321','546564654',3,'157.33.203.74','2020-03-24 04:35:16','OPEN',NULL,168,NULL,NULL),(240320100743,'3',NULL,'321321','546564654',3,'157.33.203.74','2020-03-24 04:37:43','OPEN',NULL,169,NULL,NULL),(240320100854,'3',NULL,'321321','546564654',3,'157.33.203.74','2020-03-24 04:38:54','OPEN',NULL,170,NULL,NULL),(240320101015,'3',NULL,'321321','546564654',3,'157.33.203.74','2020-03-24 04:40:15','OPEN',NULL,171,NULL,NULL),(240320101149,'3',NULL,'321321','546564654',3,'157.33.203.74','2020-03-24 04:41:49','OPEN',NULL,172,NULL,NULL),(250320105547,'3',NULL,'321321','546564654',3,'157.33.207.230','2020-03-25 17:25:47','OPEN',NULL,173,NULL,NULL),(250320110552,'3',NULL,'321321','546564654',3,'157.33.207.230','2020-03-25 17:35:52','OPEN',NULL,174,NULL,NULL),(250320112014,'3',NULL,'321321','546564654',3,'157.33.207.230','2020-03-25 17:50:14','OPEN',NULL,175,NULL,NULL),(250320112111,'3',NULL,'321321','546564654',3,'157.33.207.230','2020-03-25 17:51:11','OPEN',NULL,176,NULL,NULL),(250320112239,'3',NULL,'321321','546564654',3,'157.33.207.230','2020-03-25 17:52:39','OPEN',NULL,177,NULL,NULL),(250320113058,'3',NULL,'321321','546564654',3,'157.33.207.230','2020-03-25 18:00:58','OPEN',NULL,178,NULL,NULL),(250320113211,'3',NULL,'321321','546564654',3,'157.33.207.230','2020-03-25 18:02:11','OPEN',NULL,179,NULL,NULL),(260320064821,'3',NULL,'321321','546564654',3,'157.33.160.144','2020-03-26 13:18:21','OPEN',NULL,184,NULL,NULL),(260320085421,'3',NULL,'321321','546564654',3,'157.33.146.64','2020-03-26 03:24:21','OPEN',NULL,180,NULL,NULL),(260320085504,'3',NULL,'321321','546564654',3,'157.33.146.64','2020-03-26 03:25:04','OPEN',NULL,181,NULL,NULL),(260320092355,'3',NULL,'321321','546564654',3,'157.33.172.58','2020-03-26 15:53:55','OPEN',NULL,185,NULL,NULL),(260320092627,'3',NULL,'321321','546564654',3,'157.33.172.58','2020-03-26 15:56:27','OPEN',NULL,186,NULL,NULL),(260320092801,'3',NULL,'321321','546564654',3,'157.33.172.58','2020-03-26 15:58:01','OPEN',NULL,187,NULL,NULL),(260320092925,'3',NULL,'321321','546564654',3,'157.33.172.58','2020-03-26 15:59:25','OPEN',NULL,188,NULL,NULL),(260320111911,'3',NULL,'321321','546564654',3,'157.33.160.26','2020-03-26 05:49:11','OPEN',NULL,182,NULL,NULL),(260320112411,'3',NULL,'321321','546564654',3,'157.33.160.26','2020-03-26 05:54:11','OPEN',NULL,183,NULL,NULL);
/*!40000 ALTER TABLE `customer_orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-10 19:25:49