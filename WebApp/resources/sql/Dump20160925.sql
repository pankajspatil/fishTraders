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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='''''';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_menu_master`
--

LOCK TABLES `main_menu_master` WRITE;
/*!40000 ALTER TABLE `main_menu_master` DISABLE KEYS */;
INSERT INTO `main_menu_master` VALUES (1,'EGG',NULL,'0','1',1,'2016-09-21 17:44:13'),(2,'ROTI KI BAHAR',NULL,'1','1',1,'2016-09-21 17:44:13'),(3,'BASAMATI KA KHAZANA (VEG)',NULL,'1','1',1,'2016-09-21 17:44:13'),(4,'BASAMATI KA KHAZANA (NON-VEG)',NULL,'0','1',1,'2016-09-21 17:44:13'),(5,'PAPAD',NULL,'1','1',1,'2016-09-21 17:44:13'),(6,'CHINESE STARTER (VEG)',NULL,'1','1',1,'2016-09-21 17:44:13'),(7,'CHINESE STARTER NON-VEG)',NULL,'0','1',1,'2016-09-21 17:44:13'),(8,'CHINESE GRAVY & DRY (VEG.)',NULL,'1','1',1,'2016-09-21 17:44:13'),(9,'CHINESE GRAVY & DRY (NON-VEG.)',NULL,'0','1',1,'2016-09-21 17:44:13'),(10,'CHINESE SEA FOOD',NULL,'0','1',1,'2016-09-21 17:44:13'),(11,'NOODLES & RICE (VEG.)',NULL,'1','1',1,'2016-09-21 17:44:13'),(12,'NOODLES & RICE (NON-VEG.)',NULL,'0','1',1,'2016-09-21 17:44:14');
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
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COMMENT='''''';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_sub_menu_map`
--

LOCK TABLES `main_sub_menu_map` WRITE;
/*!40000 ALTER TABLE `main_sub_menu_map` DISABLE KEYS */;
INSERT INTO `main_sub_menu_map` VALUES (1,1,1,'1',1,'2016-09-21 17:59:35'),(2,1,2,'1',1,'2016-09-21 18:00:03'),(3,1,3,'1',1,'2016-09-21 18:00:04'),(4,1,4,'1',1,'2016-09-21 18:00:04'),(5,1,5,'1',1,'2016-09-21 18:00:04'),(6,1,6,'1',1,'2016-09-21 18:00:04'),(7,2,7,'1',1,'2016-09-21 18:00:04'),(8,2,8,'1',1,'2016-09-21 18:00:04'),(9,2,9,'1',1,'2016-09-21 18:00:04'),(10,2,10,'1',1,'2016-09-21 18:00:04'),(11,2,11,'1',1,'2016-09-21 18:00:04'),(12,2,12,'1',1,'2016-09-21 18:00:04'),(13,2,13,'1',1,'2016-09-21 18:00:04'),(14,2,14,'1',1,'2016-09-21 18:00:04'),(15,2,15,'1',1,'2016-09-21 18:00:04'),(16,2,16,'1',1,'2016-09-21 18:00:04'),(17,2,17,'1',1,'2016-09-21 18:00:05'),(18,2,18,'1',1,'2016-09-21 18:00:05'),(19,2,19,'1',1,'2016-09-21 18:00:05'),(20,2,20,'1',1,'2016-09-21 18:00:05'),(21,3,21,'1',1,'2016-09-21 18:00:05'),(22,3,22,'1',1,'2016-09-21 18:00:05'),(23,3,23,'1',1,'2016-09-21 18:00:05'),(24,3,24,'1',1,'2016-09-21 18:00:05'),(25,3,25,'1',1,'2016-09-21 18:00:05'),(26,3,26,'1',1,'2016-09-21 18:00:05'),(27,3,27,'1',1,'2016-09-21 18:00:05'),(28,3,28,'1',1,'2016-09-21 18:00:05'),(29,3,29,'1',1,'2016-09-21 18:00:05'),(30,3,30,'1',1,'2016-09-21 18:00:05'),(31,4,31,'1',1,'2016-09-21 18:00:05'),(32,4,32,'1',1,'2016-09-21 18:00:05'),(33,4,33,'1',1,'2016-09-21 18:00:05'),(34,4,34,'1',1,'2016-09-21 18:00:05'),(35,4,35,'1',1,'2016-09-21 18:00:06'),(36,4,36,'1',1,'2016-09-21 18:00:06'),(37,4,37,'1',1,'2016-09-21 18:00:06'),(38,4,38,'1',1,'2016-09-21 18:00:06'),(39,4,39,'1',1,'2016-09-21 18:00:06'),(40,4,40,'1',1,'2016-09-21 18:00:06'),(41,4,41,'1',1,'2016-09-21 18:00:06'),(42,4,42,'1',1,'2016-09-21 18:00:06'),(43,4,43,'1',1,'2016-09-21 18:00:06'),(44,5,44,'1',1,'2016-09-21 18:00:06'),(45,5,45,'1',1,'2016-09-21 18:00:06'),(46,5,46,'1',1,'2016-09-21 18:00:06'),(47,6,47,'1',1,'2016-09-21 18:00:06'),(48,6,48,'1',1,'2016-09-21 18:00:06'),(49,6,49,'1',1,'2016-09-21 18:00:06'),(50,6,50,'1',1,'2016-09-21 18:00:06'),(51,7,51,'1',1,'2016-09-21 18:00:06'),(52,7,52,'1',1,'2016-09-21 18:00:06'),(53,7,53,'1',1,'2016-09-21 18:00:07'),(54,8,54,'1',1,'2016-09-21 18:00:07'),(55,8,55,'1',1,'2016-09-21 18:00:07'),(56,8,56,'1',1,'2016-09-21 18:00:07'),(57,8,57,'1',1,'2016-09-21 18:00:07'),(58,8,58,'1',1,'2016-09-21 18:00:07'),(59,8,59,'1',1,'2016-09-21 18:00:07'),(60,8,60,'1',1,'2016-09-21 18:00:07'),(61,8,61,'1',1,'2016-09-21 18:00:07'),(62,8,62,'1',1,'2016-09-21 18:00:07'),(63,8,63,'1',1,'2016-09-21 18:00:08'),(64,8,64,'1',1,'2016-09-21 18:00:08'),(65,8,65,'1',1,'2016-09-21 18:00:08'),(66,8,66,'1',1,'2016-09-21 18:00:08'),(67,9,67,'1',1,'2016-09-21 18:00:08'),(68,9,68,'1',1,'2016-09-21 18:00:08'),(69,9,69,'1',1,'2016-09-21 18:00:08'),(70,9,70,'1',1,'2016-09-21 18:00:08'),(71,9,71,'1',1,'2016-09-21 18:00:08'),(72,9,72,'1',1,'2016-09-21 18:00:08'),(73,9,73,'1',1,'2016-09-21 18:00:08'),(74,10,74,'1',1,'2016-09-21 18:00:08'),(75,10,75,'1',1,'2016-09-21 18:00:08'),(76,10,76,'1',1,'2016-09-21 18:00:08'),(77,10,77,'1',1,'2016-09-21 18:00:08'),(78,10,78,'1',1,'2016-09-21 18:00:08'),(79,10,79,'1',1,'2016-09-21 18:00:08'),(80,10,80,'1',1,'2016-09-21 18:00:08'),(81,11,81,'1',1,'2016-09-21 18:00:09'),(82,11,82,'1',1,'2016-09-21 18:00:09'),(83,11,83,'1',1,'2016-09-21 18:00:09'),(84,11,84,'1',1,'2016-09-21 18:00:09'),(85,11,85,'1',1,'2016-09-21 18:00:09'),(86,11,86,'1',1,'2016-09-21 18:00:09'),(87,11,87,'1',1,'2016-09-21 18:00:09'),(88,12,88,'1',1,'2016-09-21 18:00:09'),(89,12,89,'1',1,'2016-09-21 18:00:09'),(90,12,90,'1',1,'2016-09-21 18:00:09'),(91,12,91,'1',1,'2016-09-21 18:00:09'),(92,12,92,'1',1,'2016-09-21 18:00:09'),(93,12,93,'1',1,'2016-09-21 18:00:09'),(94,12,94,'1',1,'2016-09-21 18:00:09'),(95,12,95,'1',1,'2016-09-21 18:00:09'),(96,12,96,'1',1,'2016-09-21 18:00:10'),(97,12,97,'1',1,'2016-09-21 18:00:10'),(98,12,98,'1',1,'2016-09-21 18:00:10'),(99,12,99,'1',1,'2016-09-21 18:00:10'),(100,12,100,'1',1,'2016-09-21 18:00:10');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_master`
--

LOCK TABLES `order_master` WRITE;
/*!40000 ALTER TABLE `order_master` DISABLE KEYS */;
INSERT INTO `order_master` VALUES (1,3,1,'1',NULL,NULL,NULL,1,'1',1,'2016-09-24 12:57:59'),(2,1,NULL,NULL,NULL,NULL,NULL,1,'1',1,'2016-09-24 19:20:32'),(3,2,NULL,NULL,NULL,NULL,NULL,1,'1',1,'2016-09-24 20:07:37'),(4,12,NULL,NULL,NULL,NULL,NULL,1,'1',1,'2016-09-24 20:13:48'),(5,12,NULL,NULL,NULL,NULL,NULL,1,'1',1,'2016-09-24 20:15:51'),(6,13,NULL,NULL,NULL,NULL,NULL,1,'1',1,'2016-09-24 20:18:06'),(7,11,NULL,NULL,NULL,NULL,NULL,1,'1',1,'2016-09-24 20:22:15');
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
  `is_active` char(1) NOT NULL DEFAULT '1',
  `created_by` int(11) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `order_price` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_menu_map_id`),
  KEY `order_ms_id_idx` (`main_sub_menu_map_id`),
  KEY `quantity` (`quantity`) USING BTREE,
  KEY `orderm_orderid_idx` (`order_id`),
  KEY `orderm_status_idx` (`status_id`),
  CONSTRAINT `order_ms_id` FOREIGN KEY (`main_sub_menu_map_id`) REFERENCES `main_sub_menu_map` (`main_sub_menu_map_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `orderm_orderid` FOREIGN KEY (`order_id`) REFERENCES `order_master` (`order_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `orderm_status` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`status_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_menu_map`
--

LOCK TABLES `order_menu_map` WRITE;
/*!40000 ALTER TABLE `order_menu_map` DISABLE KEYS */;
INSERT INTO `order_menu_map` VALUES (9,1,35,1,170,1,'Notes Added','1',1,'2016-09-24 12:58:11',0),(10,1,32,1,160,1,'Notes Added','1',1,'2016-09-24 12:58:11',0),(11,1,34,1,160,1,'Notes Added','1',1,'2016-09-24 12:58:11',0),(12,1,33,1,170,1,'Notes Added','1',1,'2016-09-24 12:58:11',0),(13,1,31,1,140,1,'','1',1,'2016-09-24 16:24:02',0),(14,1,32,1,160,1,'','1',1,'2016-09-24 16:24:02',0),(15,1,34,1,160,1,'','1',1,'2016-09-24 16:24:02',0),(16,1,35,1,170,1,'','1',1,'2016-09-24 16:24:02',0),(17,1,32,1,160,1,'','1',1,'2016-09-24 16:35:40',0),(18,1,31,4,140,1,'','1',1,'2016-09-24 16:35:40',0),(19,2,34,1,160,1,'','1',1,'2016-09-24 19:21:08',0),(20,2,33,1,170,1,'','1',1,'2016-09-24 19:21:08',0),(21,2,35,1,170,1,'','1',1,'2016-09-24 19:21:08',0),(22,3,33,1,170,1,'','1',1,'2016-09-24 20:07:55',0),(23,3,34,4,160,1,'','1',1,'2016-09-24 20:07:56',640),(24,5,32,1,160,1,'','1',1,'2016-09-24 20:16:19',160),(25,5,33,5,170,1,'','1',1,'2016-09-24 20:16:19',850),(26,5,34,1,160,1,'','1',1,'2016-09-24 20:16:19',160),(27,7,38,1,200,1,'','1',1,'2016-09-24 20:22:30',200),(28,7,38,6,200,1,'','1',1,'2016-09-24 20:22:37',1200);
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
  `status_code` varchar(25) NOT NULL,
  `status_name` varchar(100) NOT NULL,
  `is_active` char(1) NOT NULL DEFAULT '1',
  `created_by` int(11) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_master`
--

LOCK TABLES `status_master` WRITE;
/*!40000 ALTER TABLE `status_master` DISABLE KEYS */;
INSERT INTO `status_master` VALUES (1,'INPROGRESS','In Progress','1',1,'2016-09-24 12:28:14'),(2,'COOKING','Cooking','1',1,'2016-09-24 12:28:14'),(3,'COOKED','Cooked','1',1,'2016-09-24 12:28:14'),(4,'COMPLETED','Completed','1',1,'2016-09-24 12:28:14'),(5,'CANCELLED','Cancelled','1',1,'2016-09-24 12:28:14');
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
  `is_veg` char(1) NOT NULL COMMENT '1 = veg, 0 = non Veg',
  `unit_price` float NOT NULL DEFAULT '0',
  `is_active` char(1) NOT NULL DEFAULT '1',
  `created_by` int(11) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`sub_menu_id`),
  KEY `fmenu_user_id_idx` (`created_by`),
  CONSTRAINT `fmenu_user_id` FOREIGN KEY (`created_by`) REFERENCES `user_master` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_menu_master`
--

LOCK TABLES `sub_menu_master` WRITE;
/*!40000 ALTER TABLE `sub_menu_master` DISABLE KEYS */;
INSERT INTO `sub_menu_master` VALUES (1,'Boiled Egg Fry',NULL,'0',30,'1',1,'2016-09-21 17:44:50'),(2,'Boiled Egg',NULL,'0',25,'1',1,'2016-09-21 17:44:51'),(3,'Egg Masala',NULL,'0',60,'1',1,'2016-09-21 17:44:51'),(4,'Egg Omlet',NULL,'0',40,'1',1,'2016-09-21 17:44:51'),(5,'Egg Bhurji',NULL,'0',50,'1',1,'2016-09-21 17:44:51'),(6,'Half Fry',NULL,'0',30,'1',1,'2016-09-21 17:44:51'),(7,'Roti',NULL,'1',12,'1',1,'2016-09-21 17:44:51'),(8,'Butter Roti ',NULL,'1',15,'1',1,'2016-09-21 17:44:51'),(9,'Missi Roti',NULL,'1',30,'1',1,'2016-09-21 17:44:51'),(10,'Missi Butter Roti',NULL,'1',40,'1',1,'2016-09-21 17:44:51'),(11,'Nan',NULL,'1',20,'1',1,'2016-09-21 17:44:51'),(12,'Butter Nan',NULL,'1',25,'1',1,'2016-09-21 17:44:51'),(13,'Garlic Nan',NULL,'1',30,'1',1,'2016-09-21 17:44:51'),(14,'Butter Garlic Nan',NULL,'1',35,'1',1,'2016-09-21 17:44:52'),(15,'Chees Nan',NULL,'1',30,'1',1,'2016-09-21 17:44:52'),(16,'Kulcha',NULL,'1',25,'1',1,'2016-09-21 17:44:52'),(17,'Butter Kulcha',NULL,'1',30,'1',1,'2016-09-21 17:44:52'),(18,'Paratha',NULL,'1',40,'1',1,'2016-09-21 17:44:52'),(19,'Stuffed Paratha',NULL,'1',50,'1',1,'2016-09-21 17:44:52'),(20,'Butter Paratha',NULL,'1',45,'1',1,'2016-09-21 17:44:52'),(21,'Steam Rice',NULL,'1',60,'1',1,'2016-09-21 17:44:52'),(22,'Jira Rice',NULL,'1',80,'1',1,'2016-09-21 17:44:52'),(23,'Dahi Bhath',NULL,'1',80,'1',1,'2016-09-21 17:44:52'),(24,'Dal Khichadi',NULL,'1',100,'1',1,'2016-09-21 17:44:53'),(25,'Palak Khichadi',NULL,'1',100,'1',1,'2016-09-21 17:44:53'),(26,'Veg. Dum Biryani',NULL,'1',100,'1',1,'2016-09-21 17:44:53'),(27,'Veg. Hyderabadi Biryani',NULL,'1',110,'1',1,'2016-09-21 17:44:53'),(28,'Veg. Biryani',NULL,'1',90,'1',1,'2016-09-21 17:44:53'),(29,'Veg. Pulao',NULL,'1',90,'1',1,'2016-09-21 17:44:53'),(30,'Kashmiri Pulao',NULL,'1',120,'1',1,'2016-09-21 17:44:53'),(31,'Chicken Biryani',NULL,'0',140,'1',1,'2016-09-21 17:44:53'),(32,'Chicken Dum Biryani',NULL,'0',160,'1',1,'2016-09-21 17:44:53'),(33,'Chicken Tikka Biryani',NULL,'0',170,'1',1,'2016-09-21 17:44:53'),(34,'Chicken Hyderabadi Biryani',NULL,'0',160,'1',1,'2016-09-21 17:44:53'),(35,'Chicken Pulao',NULL,'0',170,'1',1,'2016-09-21 17:44:53'),(36,'Mutton Pulao',NULL,'0',200,'1',1,'2016-09-21 17:44:54'),(37,'Mutton Biryani',NULL,'0',190,'1',1,'2016-09-21 17:44:54'),(38,'Mutton Dum Biryani',NULL,'0',200,'1',1,'2016-09-21 17:44:54'),(39,'Mutton Hyderabadi Biryani',NULL,'0',190,'1',1,'2016-09-21 17:44:54'),(40,'Egg Pulao',NULL,'0',100,'1',1,'2016-09-21 17:44:54'),(41,'Egg Biryani',NULL,'0',100,'1',1,'2016-09-21 17:44:54'),(42,'Kheema Pulao',NULL,'0',200,'1',1,'2016-09-21 17:44:54'),(43,'Prawns Biryani',NULL,'0',220,'1',1,'2016-09-21 17:44:54'),(44,'Papad Fry',NULL,'1',15,'1',1,'2016-09-21 17:44:54'),(45,'Papad Roasted',NULL,'1',10,'1',1,'2016-09-21 17:44:55'),(46,'Papad Masala',NULL,'1',35,'1',1,'2016-09-21 17:44:55'),(47,'Veg. Crispy',NULL,'1',100,'1',1,'2016-09-21 17:44:55'),(48,'Veg. Lolly Pop',NULL,'1',100,'1',1,'2016-09-21 17:44:55'),(49,'Veg. Sechzwan Finger',NULL,'1',120,'1',1,'2016-09-21 17:44:55'),(50,'Veg. Spring Roll',NULL,'1',120,'1',1,'2016-09-21 17:44:55'),(51,'Chicken Satey',NULL,'0',130,'1',1,'2016-09-21 17:44:55'),(52,'Chicken Lolly Pop',NULL,'0',130,'1',1,'2016-09-21 17:44:55'),(53,'Chicken Spring Roll',NULL,'0',140,'1',1,'2016-09-21 17:44:55'),(54,'Veg. Manchurian / Chilly',NULL,'1',100,'1',1,'2016-09-21 17:44:55'),(55,'Veg. Garlic / Ginger',NULL,'1',110,'1',1,'2016-09-21 17:44:56'),(56,'Veg. In Hot Garlic Souce',NULL,'1',120,'1',1,'2016-09-21 17:44:56'),(57,'Veg. Sechzwan',NULL,'1',120,'1',1,'2016-09-21 17:44:56'),(58,'Paneer Manchurian / Chilly',NULL,'1',120,'1',1,'2016-09-21 17:44:56'),(59,'Paneer Ginger / Garlic',NULL,'1',120,'1',1,'2016-09-21 17:44:56'),(60,'Paneer In Hot Garlic Sauce',NULL,'1',130,'1',1,'2016-09-21 17:44:56'),(61,'Paneer Sechzwan',NULL,'1',140,'1',1,'2016-09-21 17:44:56'),(62,'Mushroom Sechzwan',NULL,'1',120,'1',1,'2016-09-21 17:44:56'),(63,'Mushroom Garlic / Ginger',NULL,'1',120,'1',1,'2016-09-21 17:44:56'),(64,'Mushroom Manchurian / Chilly',NULL,'1',110,'1',1,'2016-09-21 17:44:56'),(65,'Mushroom In Hot Garlic Sauce',NULL,'1',130,'1',1,'2016-09-21 17:44:56'),(66,'Baby Corn Manchurian / Chilly',NULL,'1',120,'1',1,'2016-09-21 17:44:57'),(67,'Chicken Chilly',NULL,'0',120,'1',1,'2016-09-21 17:44:57'),(68,'Chicken Manchurian',NULL,'0',120,'1',1,'2016-09-21 17:44:57'),(69,'Chicken In Hot Garlic Sauce',NULL,'0',140,'1',1,'2016-09-21 17:44:57'),(70,'Chicken Chilly With Bone',NULL,'0',150,'1',1,'2016-09-21 17:44:57'),(71,'Chicken Ginger Garlic',NULL,'0',140,'1',1,'2016-09-21 17:44:57'),(72,'Chicken Sechzwan',NULL,'0',140,'1',1,'2016-09-21 17:44:57'),(73,'Chicken65',NULL,'0',140,'1',1,'2016-09-21 17:44:57'),(74,'Fish Chilly',NULL,'0',180,'1',1,'2016-09-21 17:44:57'),(75,'Prawns Manchurian / Chilly',NULL,'0',180,'1',1,'2016-09-21 17:44:57'),(76,'Prawns In Hot Garlic Sauce',NULL,'0',180,'1',1,'2016-09-21 17:44:57'),(77,'Prawns Ginger / Garlic',NULL,'0',180,'1',1,'2016-09-21 17:44:58'),(78,'Prawns Sechzwan',NULL,'0',190,'1',1,'2016-09-21 17:44:58'),(79,'Prawns Salt & Pepper',NULL,'0',190,'1',1,'2016-09-21 17:44:58'),(80,'Bombil Chilly',NULL,'0',100,'1',1,'2016-09-21 17:44:58'),(81,'Veg. Fried Rice',NULL,'1',80,'1',1,'2016-09-21 17:44:58'),(82,'Veg. Noodles',NULL,'1',80,'1',1,'2016-09-21 17:44:58'),(83,'Veg. Sechzwan Fried Rice',NULL,'1',90,'1',1,'2016-09-21 17:44:58'),(84,'Veg. Sechzwan Noodles',NULL,'1',90,'1',1,'2016-09-21 17:44:58'),(85,'Veg. Tripple Fried Rice',NULL,'1',120,'1',1,'2016-09-21 17:44:58'),(86,'Veg. American Choupsy',NULL,'1',120,'1',1,'2016-09-21 17:44:58'),(87,'Mushroom Fried Rice',NULL,'1',90,'1',1,'2016-09-21 17:44:58'),(88,'Chicken Fried Rice',NULL,'0',100,'1',1,'2016-09-21 17:44:58'),(89,'Chicken Noodles',NULL,'0',100,'1',1,'2016-09-21 17:44:59'),(90,'Chicken Sechzwan Fried Rice',NULL,'0',120,'1',1,'2016-09-21 17:44:59'),(91,'Chicken Sechzwan Noodles',NULL,'0',120,'1',1,'2016-09-21 17:44:59'),(92,'Chicken Triple Fried Rice',NULL,'0',140,'1',1,'2016-09-21 17:44:59'),(93,'Chicken Hong Kong Fried Rice',NULL,'0',120,'1',1,'2016-09-21 17:44:59'),(94,'Chicken Singapore Fried Rice',NULL,'0',120,'1',1,'2016-09-21 17:44:59'),(95,'Egg Fried Rice',NULL,'0',100,'1',1,'2016-09-21 17:44:59'),(96,'Prawns Fried Rice',NULL,'0',170,'1',1,'2016-09-21 17:44:59'),(97,'Prawns Noodles',NULL,'0',170,'1',1,'2016-09-21 17:45:00'),(98,'Prawns Sechzwan Fried Rice',NULL,'0',180,'1',1,'2016-09-21 17:45:00'),(99,'Prawns Sechzwan Noodles',NULL,'0',180,'1',1,'2016-09-21 17:45:00'),(100,'Chicken American Choupsy',NULL,'0',120,'1',1,'2016-09-21 17:45:00');
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

-- Dump completed on 2016-09-25  1:54:30
