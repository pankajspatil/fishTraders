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
  `vendorid` int(11) DEFAULT NULL,
  `is_active` char(1) NOT NULL DEFAULT '1',
  `created_by` int(11) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`boat_id`),
  KEY `boat_created_by_idx` (`created_by`),
  KEY `vendoridfk_idx` (`vendorid`),
  CONSTRAINT `vendoridfk` FOREIGN KEY (`vendorid`) REFERENCES `vendor_master` (`vendor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `sex` char(1) DEFAULT NULL,
  `bloodGroup` varchar(45) DEFAULT NULL,
  `address` varchar(2000) DEFAULT NULL,
  `dob` varchar(12) DEFAULT NULL,
  `is_active` char(1) NOT NULL DEFAULT '1',
  `created_by` int(11) DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_master`
--

LOCK TABLES `customer_master` WRITE;
/*!40000 ALTER TABLE `customer_master` DISABLE KEYS */;
INSERT INTO `customer_master` VALUES (1,'Prerna','','patil',NULL,'8097188292','F','A','Diwanmaan',NULL,'1',1,'2017-01-22 05:25:22'),(2,'Ruddhav','','patil',NULL,'9987031082','M','A','Diwanmaan',NULL,'1',1,'2017-01-22 05:26:11');
/*!40000 ALTER TABLE `customer_master` ENABLE KEYS */;
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
  `fish_name` varchar(45) DEFAULT NULL,
  `is_active` char(1) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`fish_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fish_master`
--

LOCK TABLES `fish_master` WRITE;
/*!40000 ALTER TABLE `fish_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `fish_master` ENABLE KEYS */;
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

-- Dump completed on 2017-01-30  0:36:37
