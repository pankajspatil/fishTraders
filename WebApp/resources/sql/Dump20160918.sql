CREATE DATABASE  IF NOT EXISTS `agri_tadka` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `agri_tadka`;
-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: localhost    Database: agri_tadka
-- ------------------------------------------------------
-- Server version	5.6.25-log

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
-- Table structure for table `main_menu_master`
--

DROP TABLE IF EXISTS `main_menu_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_menu_master` (
  `main_menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(250) NOT NULL,
  `menu_description` varchar(2000) DEFAULT NULL,
  `is_veg` char(1) NOT NULL COMMENT 'veg = 1, Non Veg = 0',
  `is_active` char(1) NOT NULL DEFAULT '1',
  `created_by` int(11) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`main_menu_id`),
  UNIQUE KEY `main_menu` (`menu_name`),
  KEY `created_main_menu_idx` (`created_by`),
  CONSTRAINT `created_main_menu` FOREIGN KEY (`created_by`) REFERENCES `user_master` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='''''';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_menu_master`
--

LOCK TABLES `main_menu_master` WRITE;
/*!40000 ALTER TABLE `main_menu_master` DISABLE KEYS */;
INSERT INTO `main_menu_master` VALUES (1,'Roti Ki Bahar',NULL,'1','1',1,'2016-09-18 13:00:46'),(2,'Basmati Ka Khazana (Veg)',NULL,'1','1',1,'2016-09-18 13:00:46'),(3,'Basmati Ka Khazana (Non Veg)',NULL,'0','1',1,'2016-09-18 13:00:46'),(4,'Papad',NULL,'1','1',1,'2016-09-18 13:00:46'),(5,'Chinese Starter (Veg)',NULL,'1','1',1,'2016-09-18 13:00:46'),(6,'Chinese Starter (Non Veg)',NULL,'0','1',1,'2016-09-18 13:00:46');
/*!40000 ALTER TABLE `main_menu_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_sub_menu_map`
--

DROP TABLE IF EXISTS `main_sub_menu_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_sub_menu_map` (
  `main_sub_menu_map_id` int(11) NOT NULL AUTO_INCREMENT,
  `main_menu_id` int(11) NOT NULL,
  `sub_menu_id` int(11) NOT NULL,
  `is_active` char(1) NOT NULL DEFAULT '1',
  `created_by` int(11) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`main_sub_menu_map_id`),
  KEY `main_menu` (`main_menu_id`),
  KEY `sub_menu` (`sub_menu_id`),
  KEY `created_ms_map_idx` (`created_by`),
  CONSTRAINT `created_ms_map` FOREIGN KEY (`created_by`) REFERENCES `user_master` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ms_main_id` FOREIGN KEY (`main_menu_id`) REFERENCES `main_menu_master` (`main_menu_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='''''';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_sub_menu_map`
--

LOCK TABLES `main_sub_menu_map` WRITE;
/*!40000 ALTER TABLE `main_sub_menu_map` DISABLE KEYS */;
INSERT INTO `main_sub_menu_map` VALUES (1,1,1,'1',1,'2016-09-18 13:11:39'),(2,1,2,'1',1,'2016-09-18 13:11:39'),(3,1,3,'1',1,'2016-09-18 13:11:39'),(4,1,4,'1',1,'2016-09-18 13:11:39'),(5,1,5,'1',1,'2016-09-18 13:11:39'),(6,1,6,'1',1,'2016-09-18 13:11:39'),(7,1,7,'1',1,'2016-09-18 13:11:39');
/*!40000 ALTER TABLE `main_sub_menu_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_master`
--

DROP TABLE IF EXISTS `order_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_master` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `table_id` int(11) DEFAULT NULL,
  `waiter_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT '0',
  `unit_price` float NOT NULL,
  `tax` varchar(10) DEFAULT NULL,
  `customer_name` varchar(250) DEFAULT NULL,
  `cusrtomer_address` varchar(2000) DEFAULT NULL,
  `mobile_number` int(11) DEFAULT NULL,
  `status_id` int(11) NOT NULL,
  `is_active` char(1) NOT NULL DEFAULT '1',
  `created_by` int(11) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`),
  KEY `created_order_idx` (`created_by`),
  KEY `order_status_idx` (`status_id`),
  CONSTRAINT `created_order` FOREIGN KEY (`created_by`) REFERENCES `user_master` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `order_status` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`status_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_master`
--

LOCK TABLES `order_master` WRITE;
/*!40000 ALTER TABLE `order_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_menu_map`
--

DROP TABLE IF EXISTS `order_menu_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_menu_map` (
  `order_menu_map_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `main_sub_menu_map_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` float NOT NULL DEFAULT '0',
  `status_id` int(11) DEFAULT NULL,
  `notes` varchar(2000) DEFAULT NULL,
  `is_active` char(1) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_menu_map_id`),
  KEY `order_ms_id_idx` (`main_sub_menu_map_id`),
  KEY `quantity` (`quantity`) USING BTREE,
  KEY `orderm_orderid_idx` (`order_id`),
  KEY `orderm_status_idx` (`status_id`),
  CONSTRAINT `order_ms_id` FOREIGN KEY (`main_sub_menu_map_id`) REFERENCES `main_sub_menu_map` (`main_sub_menu_map_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `orderm_orderid` FOREIGN KEY (`order_id`) REFERENCES `order_master` (`order_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `orderm_status` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`status_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_menu_map`
--

LOCK TABLES `order_menu_map` WRITE;
/*!40000 ALTER TABLE `order_menu_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_menu_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_master`
--

DROP TABLE IF EXISTS `status_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status_master` (
  `status_id` int(11) NOT NULL AUTO_INCREMENT,
  `status_name` varchar(100) NOT NULL,
  `is_active` char(1) NOT NULL DEFAULT '1',
  `created_by` int(11) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_master`
--

LOCK TABLES `status_master` WRITE;
/*!40000 ALTER TABLE `status_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `status_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_menu_master`
--

DROP TABLE IF EXISTS `sub_menu_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sub_menu_master` (
  `sub_menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(250) NOT NULL,
  `menu_description` varchar(2000) DEFAULT NULL,
  `is_active` char(1) NOT NULL DEFAULT '1',
  `created_by` int(11) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_veg` char(1) NOT NULL COMMENT '1 = veg, 0 = non Veg',
  PRIMARY KEY (`sub_menu_id`),
  KEY `fmenu_user_id_idx` (`created_by`),
  CONSTRAINT `fmenu_user_id` FOREIGN KEY (`created_by`) REFERENCES `user_master` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_menu_master`
--

LOCK TABLES `sub_menu_master` WRITE;
/*!40000 ALTER TABLE `sub_menu_master` DISABLE KEYS */;
INSERT INTO `sub_menu_master` VALUES (1,'Roti',NULL,'1',1,'2016-09-18 13:10:49','1'),(2,'Butter Roti',NULL,'1',1,'2016-09-18 13:10:49','1'),(3,'Missi Roti',NULL,'1',1,'2016-09-18 13:10:49','1'),(4,'Missi Butte Roti',NULL,'1',1,'2016-09-18 13:10:50','1'),(5,'Nan',NULL,'1',1,'2016-09-18 13:10:50','1'),(6,'Butter Nan',NULL,'1',1,'2016-09-18 13:10:50','1'),(7,'Garlic Nan',NULL,'1',1,'2016-09-18 13:10:50','1');
/*!40000 ALTER TABLE `sub_menu_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table_master`
--

DROP TABLE IF EXISTS `table_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `table_master` (
  `table_id` int(11) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(45) NOT NULL,
  `is_active` char(1) NOT NULL DEFAULT '1',
  `created_by` int(11) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`table_id`),
  KEY `table_created_by_idx` (`created_by`),
  CONSTRAINT `table_created_by` FOREIGN KEY (`created_by`) REFERENCES `user_master` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_master`
--

LOCK TABLES `table_master` WRITE;
/*!40000 ALTER TABLE `table_master` DISABLE KEYS */;
INSERT INTO `table_master` VALUES (1,'Table 1','1',1,'2016-09-17 19:07:19'),(2,'Table 2','1',1,'2016-09-17 19:07:19'),(3,'Table 3','1',1,'2016-09-17 19:07:19'),(4,'Table 4','1',1,'2016-09-17 19:07:19'),(5,'Table 5','1',1,'2016-09-17 19:07:19'),(6,'Table 6','1',1,'2016-09-17 19:07:19'),(7,'Table 7','1',1,'2016-09-17 19:07:19'),(8,'Table 8','1',1,'2016-09-17 19:07:19'),(9,'Table 9','1',1,'2016-09-17 19:07:19'),(10,'Table 10','1',1,'2016-09-17 19:07:19'),(11,'Table 11','1',1,'2016-09-17 21:03:54');
/*!40000 ALTER TABLE `table_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table_type_master`
--

DROP TABLE IF EXISTS `table_type_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `table_type_master` (
  `table_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `table_type` varchar(200) DEFAULT NULL,
  `is_active` char(1) NOT NULL DEFAULT '1',
  `created_by` int(11) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`table_type_id`),
  KEY `created_table_type_id_idx` (`created_by`),
  CONSTRAINT `created_table_type_id` FOREIGN KEY (`created_by`) REFERENCES `user_master` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_type_master`
--

LOCK TABLES `table_type_master` WRITE;
/*!40000 ALTER TABLE `table_type_master` DISABLE KEYS */;
INSERT INTO `table_type_master` VALUES (1,'Non A/C','1',1,'2016-09-17 19:05:31'),(2,'Garden with A/A','1',1,'2016-09-17 19:05:31');
/*!40000 ALTER TABLE `table_type_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table_type_name_map`
--

DROP TABLE IF EXISTS `table_type_name_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `table_type_name_map` (
  `table_type_name_map_id` int(11) NOT NULL AUTO_INCREMENT,
  `table_type_id` int(11) NOT NULL,
  `table_id` int(11) NOT NULL,
  `is_active` char(1) NOT NULL DEFAULT '1',
  `created_by` int(11) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`table_type_name_map_id`),
  KEY `table_type_idx` (`table_type_id`),
  KEY `tbl_name_idx` (`table_id`),
  KEY `tbl_created_idx` (`created_by`),
  CONSTRAINT `table_type` FOREIGN KEY (`table_type_id`) REFERENCES `table_type_master` (`table_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tbl_created` FOREIGN KEY (`created_by`) REFERENCES `user_master` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tbl_name` FOREIGN KEY (`table_id`) REFERENCES `table_master` (`table_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_type_name_map`
--

LOCK TABLES `table_type_name_map` WRITE;
/*!40000 ALTER TABLE `table_type_name_map` DISABLE KEYS */;
INSERT INTO `table_type_name_map` VALUES (1,1,1,'1',1,'2016-09-17 19:13:31'),(2,1,2,'1',1,'2016-09-17 19:13:31'),(3,1,3,'1',1,'2016-09-17 19:13:31'),(4,1,4,'1',1,'2016-09-17 19:13:31'),(5,1,5,'1',1,'2016-09-17 19:13:31'),(6,1,6,'1',1,'2016-09-17 19:13:31'),(7,1,7,'1',1,'2016-09-17 19:13:31'),(8,1,8,'1',1,'2016-09-17 19:13:31'),(9,1,9,'1',1,'2016-09-17 19:13:31'),(10,1,10,'1',1,'2016-09-17 19:13:31'),(11,2,1,'1',1,'2016-09-17 19:13:31'),(12,2,2,'1',1,'2016-09-17 19:13:31'),(13,2,3,'1',1,'2016-09-17 19:13:31'),(14,2,4,'1',1,'2016-09-17 19:13:31'),(15,2,5,'1',1,'2016-09-17 19:13:31'),(16,2,6,'1',1,'2016-09-17 19:13:31'),(17,2,7,'1',1,'2016-09-17 19:13:31'),(18,2,8,'1',1,'2016-09-17 19:13:31'),(19,2,9,'1',1,'2016-09-17 19:13:31'),(20,2,10,'1',1,'2016-09-17 19:13:31'),(22,2,11,'1',1,'2016-09-17 21:04:11');
/*!40000 ALTER TABLE `table_type_name_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_master`
--

DROP TABLE IF EXISTS `user_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_master` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(200) NOT NULL,
  `user_name` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `new_password` varchar(45) NOT NULL DEFAULT '',
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  `created_by` int(11) DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_master`
--

LOCK TABLES `user_master` WRITE;
/*!40000 ALTER TABLE `user_master` DISABLE KEYS */;
INSERT INTO `user_master` VALUES (1,'admin',NULL,'admin','kadav.kiran@gmail.com','admin','admin','',1,NULL,'2016-09-17 16:19:12');
/*!40000 ALTER TABLE `user_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waiter_master`
--

DROP TABLE IF EXISTS `waiter_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waiter_master` (
  `waiter_id` int(11) NOT NULL AUTO_INCREMENT,
  `wfirst_name` varchar(250) NOT NULL,
  `wlast_name` varchar(250) NOT NULL,
  `wmiddle_name` varchar(250) DEFAULT NULL,
  `email_address` varchar(250) DEFAULT NULL,
  `mobile_number` int(11) NOT NULL,
  `is_active` char(1) NOT NULL DEFAULT '1',
  `created_by` int(11) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`waiter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waiter_master`
--

LOCK TABLES `waiter_master` WRITE;
/*!40000 ALTER TABLE `waiter_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `waiter_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'agri_tadka'
--

--
-- Dumping routines for database 'agri_tadka'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-18 20:45:38
