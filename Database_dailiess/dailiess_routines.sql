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
-- Temporary view structure for view `view_ready_order_items_master`
--

DROP TABLE IF EXISTS `view_ready_order_items_master`;
/*!50001 DROP VIEW IF EXISTS `view_ready_order_items_master`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_ready_order_items_master` AS SELECT 
 1 AS `orderitemid`,
 1 AS `quantity`,
 1 AS `priceperunit`,
 1 AS `refid`,
 1 AS `refname`,
 1 AS `itemid`,
 1 AS `custorderid`,
 1 AS `from_ip`,
 1 AS `addedon`,
 1 AS `tax`,
 1 AS `tax_details`,
 1 AS `status`,
 1 AS `accepted_by_id`,
 1 AS `delivered_by_id`,
 1 AS `delivered_addedon`,
 1 AS `accepted_addedon`,
 1 AS `customer_orders_refid`,
 1 AS `customer_orders_refname`,
 1 AS `lat`,
 1 AS `lng`,
 1 AS `custid`,
 1 AS `customer_orders_addedon`,
 1 AS `customer_orders_status`,
 1 AS `customer_orders_accepted_by_id`,
 1 AS `addrid`,
 1 AS `order_mode`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_custmer_card_master`
--

DROP TABLE IF EXISTS `view_custmer_card_master`;
/*!50001 DROP VIEW IF EXISTS `view_custmer_card_master`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_custmer_card_master` AS SELECT 
 1 AS `cartid`,
 1 AS `custid`,
 1 AS `quantity`,
 1 AS `itemid`,
 1 AS `refid`,
 1 AS `refname`,
 1 AS `from_ip`,
 1 AS `addedon`,
 1 AS `fname`,
 1 AS `lname`,
 1 AS `email`,
 1 AS `mobile`,
 1 AS `bizid`,
 1 AS `bizItemsStatus`,
 1 AS `iteminvid`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_open_order_items_master`
--

DROP TABLE IF EXISTS `view_open_order_items_master`;
/*!50001 DROP VIEW IF EXISTS `view_open_order_items_master`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_open_order_items_master` AS SELECT 
 1 AS `orderitemid`,
 1 AS `quantity`,
 1 AS `priceperunit`,
 1 AS `refid`,
 1 AS `refname`,
 1 AS `itemid`,
 1 AS `custorderid`,
 1 AS `from_ip`,
 1 AS `addedon`,
 1 AS `tax`,
 1 AS `tax_details`,
 1 AS `status`,
 1 AS `accepted_by_id`,
 1 AS `delivered_by_id`,
 1 AS `delivered_addedon`,
 1 AS `accepted_addedon`,
 1 AS `customer_orders_refid`,
 1 AS `customer_orders_refname`,
 1 AS `lat`,
 1 AS `lng`,
 1 AS `custid`,
 1 AS `customer_orders_addedon`,
 1 AS `customer_orders_status`,
 1 AS `customer_orders_accepted_by_id`,
 1 AS `addrid`,
 1 AS `order_mode`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `view_ready_order_items_master`
--

/*!50001 DROP VIEW IF EXISTS `view_ready_order_items_master`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`dailies_dev_db_user`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_ready_order_items_master` AS select `customer_orderItem`.`orderitemid` AS `orderitemid`,`customer_orderItem`.`quantity` AS `quantity`,`customer_orderItem`.`priceperunit` AS `priceperunit`,`customer_orderItem`.`refid` AS `refid`,`customer_orderItem`.`refname` AS `refname`,`customer_orderItem`.`itemid` AS `itemid`,`customer_orderItem`.`custorderid` AS `custorderid`,`customer_orderItem`.`from_ip` AS `from_ip`,`customer_orderItem`.`addedon` AS `addedon`,`customer_orderItem`.`tax` AS `tax`,`customer_orderItem`.`tax_details` AS `tax_details`,`customer_orderItem`.`status` AS `status`,`customer_orderItem`.`accepted_by_id` AS `accepted_by_id`,`customer_orderItem`.`delivered_by_id` AS `delivered_by_id`,`customer_orderItem`.`delivered_addedon` AS `delivered_addedon`,`customer_orderItem`.`accepted_addedon` AS `accepted_addedon`,`customer_orders`.`refid` AS `customer_orders_refid`,`customer_orders`.`refname` AS `customer_orders_refname`,`customer_orders`.`lat` AS `lat`,`customer_orders`.`lng` AS `lng`,`customer_orders`.`custid` AS `custid`,`customer_orders`.`addedon` AS `customer_orders_addedon`,`customer_orders`.`status` AS `customer_orders_status`,`customer_orders`.`accepted_by_id` AS `customer_orders_accepted_by_id`,`customer_orders`.`addrid` AS `addrid`,`customer_orders`.`order_mode` AS `order_mode` from (`customer_orderItem` join `customer_orders`) where ((`customer_orderItem`.`custorderid` = `customer_orders`.`custorderid`) and (`customer_orderItem`.`status` not in ('PREPARED','OUTFORDELIVERY','DELIVERED'))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_custmer_card_master`
--

/*!50001 DROP VIEW IF EXISTS `view_custmer_card_master`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`dailies_dev_db_user`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_custmer_card_master` AS select `customer_MyCart`.`cartid` AS `cartid`,`customer_MyCart`.`custid` AS `custid`,`customer_MyCart`.`quantity` AS `quantity`,`customer_MyCart`.`itemid` AS `itemid`,`customer_MyCart`.`refid` AS `refid`,`customer_MyCart`.`refname` AS `refname`,`customer_MyCart`.`from_ip` AS `from_ip`,`customer_MyCart`.`addedon` AS `addedon`,`customer`.`fname` AS `fname`,`customer`.`lname` AS `lname`,`customer`.`email` AS `email`,`customer`.`mobile` AS `mobile`,`bizItems`.`bizid` AS `bizid`,`bizItems`.`bizItemsStatus` AS `bizItemsStatus`,`bizItems`.`iteminvid` AS `iteminvid` from ((`customer_MyCart` join `customer`) join `bizItems`) where ((`customer_MyCart`.`custid` = `customer`.`custid`) and (`customer_MyCart`.`itemid` = `bizItems`.`itemid`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_open_order_items_master`
--

/*!50001 DROP VIEW IF EXISTS `view_open_order_items_master`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`dailies_dev_db_user`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_open_order_items_master` AS select `customer_orderItem`.`orderitemid` AS `orderitemid`,`customer_orderItem`.`quantity` AS `quantity`,`customer_orderItem`.`priceperunit` AS `priceperunit`,`customer_orderItem`.`refid` AS `refid`,`customer_orderItem`.`refname` AS `refname`,`customer_orderItem`.`itemid` AS `itemid`,`customer_orderItem`.`custorderid` AS `custorderid`,`customer_orderItem`.`from_ip` AS `from_ip`,`customer_orderItem`.`addedon` AS `addedon`,`customer_orderItem`.`tax` AS `tax`,`customer_orderItem`.`tax_details` AS `tax_details`,`customer_orderItem`.`status` AS `status`,`customer_orderItem`.`accepted_by_id` AS `accepted_by_id`,`customer_orderItem`.`delivered_by_id` AS `delivered_by_id`,`customer_orderItem`.`delivered_addedon` AS `delivered_addedon`,`customer_orderItem`.`accepted_addedon` AS `accepted_addedon`,`customer_orders`.`refid` AS `customer_orders_refid`,`customer_orders`.`refname` AS `customer_orders_refname`,`customer_orders`.`lat` AS `lat`,`customer_orders`.`lng` AS `lng`,`customer_orders`.`custid` AS `custid`,`customer_orders`.`addedon` AS `customer_orders_addedon`,`customer_orders`.`status` AS `customer_orders_status`,`customer_orders`.`accepted_by_id` AS `customer_orders_accepted_by_id`,`customer_orders`.`addrid` AS `addrid`,`customer_orders`.`order_mode` AS `order_mode` from (`customer_orderItem` join `customer_orders`) where ((`customer_orderItem`.`custorderid` = `customer_orders`.`custorderid`) and (`customer_orderItem`.`status` = 'OPEN')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping events for database 'dailiess'
--

--
-- Dumping routines for database 'dailiess'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-10 19:30:20
