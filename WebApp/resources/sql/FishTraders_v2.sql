CREATE DATABASE  IF NOT EXISTS `fishtrader` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `fishtrader`;
-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: localhost    Database: fishtrader
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
-- Table structure for table `boat_master`
--

DROP TABLE IF EXISTS `boat_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boat_master` (
  `boat_id` int(11) NOT NULL AUTO_INCREMENT,
  `boat_name` varchar(45) NOT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `is_active` char(1) NOT NULL DEFAULT '1',
  `created_by` int(11) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`boat_id`),
  KEY `boat_created_by_idx` (`created_by`),
  KEY `vendoridfk_idx` (`vendor_id`),
  CONSTRAINT `vendoridfk` FOREIGN KEY (`vendor_id`) REFERENCES `vendor_master` (`vendor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boat_master`
--

LOCK TABLES `boat_master` WRITE;
/*!40000 ALTER TABLE `boat_master` DISABLE KEYS */;
INSERT INTO `boat_master` VALUES (1,'Boat 1',1,'1',1,'2017-01-14 19:07:19'),(2,'Boat 2',1,'1',1,'2017-01-14 19:07:19'),(3,'Boat 3',1,'1',1,'2017-01-14 19:07:19'),(4,'Boat 4',1,'1',1,'2017-01-14 19:07:19'),(5,'Boat 5',2,'1',1,'2017-01-14 19:07:19'),(6,'Boat 6',2,'1',1,'2017-01-14 19:07:19'),(7,'Boat 7',2,'1',1,'2017-01-14 19:07:19');
/*!40000 ALTER TABLE `boat_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_master`
--

DROP TABLE IF EXISTS `customer_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_master` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `middle_name` varchar(100) NOT NULL DEFAULT '',
  `last_name` varchar(100) NOT NULL,
  `email` varchar(200) DEFAULT NULL,
  `contact_no` varchar(15) NOT NULL,
  `sex` char(1) NOT NULL,
  `address` varchar(2000) DEFAULT NULL,
  `dob` varchar(12) NOT NULL,
  `is_active` char(1) NOT NULL DEFAULT '1',
  `created_by` int(11) DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_master`
--

LOCK TABLES `customer_master` WRITE;
/*!40000 ALTER TABLE `customer_master` DISABLE KEYS */;
INSERT INTO `customer_master` VALUES (1,'kiran','','kadav',NULL,'9773290290','M',NULL,'1988-10-06','1',1,'2017-02-13 13:52:44');
/*!40000 ALTER TABLE `customer_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expenses`
--

DROP TABLE IF EXISTS `expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expenses` (
  `expense_id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) NOT NULL,
  `boat_id` int(11) NOT NULL,
  `fish_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `expense_amount` double NOT NULL,
  `expense_remark` varchar(45) DEFAULT NULL,
  `is_active` char(1) NOT NULL DEFAULT '1',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`expense_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expenses`
--

LOCK TABLES `expenses` WRITE;
/*!40000 ALTER TABLE `expenses` DISABLE KEYS */;
INSERT INTO `expenses` VALUES (1,1,1,1,1,1000,'sASas','1','2017-02-13 13:59:23',2),(2,2,5,1,1,3000,'qweqweqw','1','2017-02-18 16:17:54',2),(3,1,1,2,1,1500,'Test Expense','1','2017-02-18 18:20:46',2),(4,1,2,3,1,1200,'Expense For Testing','1','2017-02-18 18:56:08',2);
/*!40000 ALTER TABLE `expenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fish_master`
--

DROP TABLE IF EXISTS `fish_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fish_master` (
  `fish_id` int(11) NOT NULL AUTO_INCREMENT,
  `fish_code` varchar(45) DEFAULT NULL,
  `fish_name` varchar(45) NOT NULL,
  `is_active` char(1) NOT NULL DEFAULT '1',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`fish_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fish_master`
--

LOCK TABLES `fish_master` WRITE;
/*!40000 ALTER TABLE `fish_master` DISABLE KEYS */;
INSERT INTO `fish_master` VALUES (1,'BOMBIL','Bombil','1','2017-02-12 16:04:03',1),(2,'SURMAI','Surmai','1','2017-02-12 16:04:03',1),(3,'HALWA','Halwa','1','2017-02-12 16:04:03',1),(4,'PRAWNS','Prawns','1','2017-02-12 16:04:03',1);
/*!40000 ALTER TABLE `fish_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_expense_map`
--

DROP TABLE IF EXISTS `invoice_expense_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_expense_map` (
  `invoice_expense_map_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) NOT NULL,
  `expense_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `is_active` char(1) NOT NULL DEFAULT '1',
  `created_by` int(11) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`invoice_expense_map_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_expense_map`
--

LOCK TABLES `invoice_expense_map` WRITE;
/*!40000 ALTER TABLE `invoice_expense_map` DISABLE KEYS */;
INSERT INTO `invoice_expense_map` VALUES (1,1,1,10,'1',2,'2017-02-13 15:49:29'),(2,2,1,20,'1',2,'2017-02-13 16:02:07'),(3,3,1,30,'1',2,'2017-02-13 16:07:12'),(4,4,1,50,'1',2,'2017-02-13 16:10:32'),(5,5,2,200,'1',2,'2017-02-18 16:32:20'),(6,6,2,3000,'1',2,'2017-02-18 16:45:04'),(7,7,3,100,'1',2,'2017-02-18 18:32:25'),(8,8,3,200,'1',2,'2017-02-18 18:32:59'),(9,9,3,400,'1',2,'2017-02-18 18:37:31'),(10,10,4,100,'1',2,'2017-02-18 18:57:37'),(11,11,4,200,'1',2,'2017-02-18 18:58:41'),(12,12,4,1300,'1',2,'2017-02-18 19:03:24'),(13,13,3,100,'1',2,'2017-02-18 19:17:24');
/*!40000 ALTER TABLE `invoice_expense_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_master`
--

DROP TABLE IF EXISTS `invoice_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_master` (
  `invoice_id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) NOT NULL DEFAULT '0',
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `comments` varchar(1000) DEFAULT NULL,
  `expense_exist` char(1) NOT NULL DEFAULT '1',
  `amount` double NOT NULL DEFAULT '0',
  `is_active` char(1) NOT NULL DEFAULT '1',
  `created_by` int(11) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`invoice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_master`
--

LOCK TABLES `invoice_master` WRITE;
/*!40000 ALTER TABLE `invoice_master` DISABLE KEYS */;
INSERT INTO `invoice_master` VALUES (1,1,0,'','1',0,'1',2,'2017-02-13 15:49:29'),(2,1,0,'','1',0,'1',2,'2017-02-13 16:02:07'),(3,1,0,'','1',0,'1',2,'2017-02-13 16:07:12'),(4,1,0,'','1',0,'1',2,'2017-02-13 16:10:31'),(5,0,1,'Customer invoice','1',0,'1',2,'2017-02-18 16:32:19'),(6,0,1,'','1',0,'1',2,'2017-02-18 16:45:04'),(7,1,0,'','1',0,'1',2,'2017-02-18 18:32:25'),(8,1,0,'','1',0,'1',2,'2017-02-18 18:32:59'),(9,0,1,'','1',0,'1',2,'2017-02-18 18:37:31'),(10,1,0,'100 Test','1',0,'1',2,'2017-02-18 18:57:37'),(11,0,1,'','1',0,'1',2,'2017-02-18 18:58:41'),(12,1,0,'','1',0,'1',2,'2017-02-18 19:03:24'),(13,1,0,'','1',0,'1',2,'2017-02-18 19:17:24');
/*!40000 ALTER TABLE `invoice_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_master`
--

DROP TABLE IF EXISTS `role_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_master` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_description` varchar(45) DEFAULT NULL,
  `created_by` varchar(20) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_active` char(1) DEFAULT '1',
  PRIMARY KEY (`role_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_master`
--

LOCK TABLES `role_master` WRITE;
/*!40000 ALTER TABLE `role_master` DISABLE KEYS */;
INSERT INTO `role_master` VALUES (1,'Admin','1','2017-01-19 17:58:14','1'),(2,'Customer','1','2017-01-19 17:58:14','1'),(3,'Vendor','1','2017-01-19 17:58:14','1');
/*!40000 ALTER TABLE `role_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_menu_map`
--

DROP TABLE IF EXISTS `role_menu_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_menu_map` (
  `role_menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `created_by` varchar(20) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `is_active` char(1) DEFAULT NULL,
  PRIMARY KEY (`role_menu_id`),
  KEY `RoleId_idx` (`role_id`),
  KEY `MenuId_idx` (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_menu_map`
--

LOCK TABLES `role_menu_map` WRITE;
/*!40000 ALTER TABLE `role_menu_map` DISABLE KEYS */;
INSERT INTO `role_menu_map` VALUES (1,1,1,'1','2017-01-21 17:44:50','1'),(2,1,2,'1','2017-01-21 17:44:50','1'),(3,1,4,'1',NULL,NULL);
/*!40000 ALTER TABLE `role_menu_map` ENABLE KEYS */;
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
  `user_salutation` varchar(10) DEFAULT NULL,
  `user_address_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_master`
--

LOCK TABLES `user_master` WRITE;
/*!40000 ALTER TABLE `user_master` DISABLE KEYS */;
INSERT INTO `user_master` VALUES (2,'Ramakant',NULL,'Koli','ramakant','ramakant','ramakant','',1,1,'2017-01-14 19:07:19','Mr',NULL);
/*!40000 ALTER TABLE `user_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_menu_master`
--

DROP TABLE IF EXISTS `user_menu_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_menu_master` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_description` varchar(45) DEFAULT NULL,
  `created_by` varchar(20) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `is_active` char(1) DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_menu_master`
--

LOCK TABLES `user_menu_master` WRITE;
/*!40000 ALTER TABLE `user_menu_master` DISABLE KEYS */;
INSERT INTO `user_menu_master` VALUES (1,'Home','1','2017-01-19 17:58:14','1'),(2,'Master','1','2017-01-19 17:58:14','1'),(3,'Report','1','2017-01-19 17:58:14','1'),(4,'Transaction','1',NULL,NULL);
/*!40000 ALTER TABLE `user_menu_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor_master`
--

DROP TABLE IF EXISTS `vendor_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendor_master` (
  `vendor_id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_name` varchar(250) NOT NULL,
  `contact_no` varchar(45) NOT NULL,
  `address` varchar(2000) DEFAULT NULL,
  `is_active` char(1) NOT NULL DEFAULT '1',
  `created_by` int(11) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`vendor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor_master`
--

LOCK TABLES `vendor_master` WRITE;
/*!40000 ALTER TABLE `vendor_master` DISABLE KEYS */;
INSERT INTO `vendor_master` VALUES (1,'Kiran Koli','8888888888','vasai','1',1,'2017-01-19 12:28:14'),(2,'Pankaj Koli','9999999999','vasai','1',1,'2017-01-19 12:28:14');
/*!40000 ALTER TABLE `vendor_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'fishtrader'
--

--
-- Dumping routines for database 'fishtrader'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-19 10:05:12
