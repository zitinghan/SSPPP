-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ssppp
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.16-MariaDB

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
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `idlogin` int(11) NOT NULL AUTO_INCREMENT,
  `Userid` varchar(45) DEFAULT NULL,
  `Password` varchar(45) DEFAULT NULL,
  `UserType` varchar(20) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Contact` varchar(10) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Brand` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idlogin`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,'admin','admin','Administrator','admin',NULL,NULL,NULL),(2,'supplier','supplier','Supplier','supplier',NULL,NULL,'Asus'),(3,'student','student','Student','student',NULL,NULL,NULL);
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(45) DEFAULT NULL,
  `price` varchar(45) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `collected_date` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `review_rating` varchar(45) DEFAULT NULL,
  `review_desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,'student','1770.85','6','Ordered','2016-11-09 02:23:44',NULL,'2016-11-09 02:23:44','2016-11-09 02:23:44',NULL,NULL),(2,'student','1770.85','6','Ordered','2016-11-09 02:23:46',NULL,'2016-11-09 02:23:46','2016-11-09 02:23:46',NULL,NULL),(3,'student','1770.85','6','Ordered','2016-11-09 02:25:24',NULL,'2016-11-09 02:25:24','2016-11-09 02:25:24','',''),(4,'student','1770.85','6','Ordered','2016-11-09 02:26:09',NULL,'2016-11-09 02:26:09','2016-11-09 02:26:09',NULL,NULL);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(255) DEFAULT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `price` varchar(45) DEFAULT NULL,
  `product_desc` longtext,
  `imageUrl` longtext,
  `display` varchar(45) DEFAULT NULL,
  `specs` longtext,
  `others_desc` longtext,
  `featured` varchar(45) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (4,'Switch Alpha 12','Acer','2','1284','Processor	\r\nIntel Core i5-6200U (2.3GHz with Turbo Boost up to 2.8GHz, 3MB L3 Cache, 2C4T)\r\nChipset	\r\nMemory	\r\n8GB LPDDR3 RAM \r\nHard Disk Drive	\r\n128GD SSD\r\n\r\nDisplay	\r\n12\" Quad-HD IPS with 10-pt Multi-Touch\r\n\r\nGraphics	\r\nIntel HD Graphics 520\r\n\r\nCommunication	\r\n802.11a/b/g/n/ac, Wireless LAN, Bluetooth 4.0\r\n\r\nOptical Drive	\r\nI/O Interface	\r\n1xUSB Type-C, 1xUSB3.0, Type.C-to-HDMI converter\r\n\r\nAudio	\r\nIntegrated\r\n\r\nOperating System	\r\nWindows 10 Home 64-bit\r\n\r\nAdditional Software	\r\nMouse/Pointer	\r\nUSB Mouse & Active Stylus Pen bundled\r\n\r\nOther	\r\nFolio Snap Case bundled\r\n\r\nWarranty	\r\n3 Years Local On-site (includes 1st Year International Warranty) with parts and labor \r\n\r\nWeight & Battery	\r\n1.25kg \r\n\r\nSupplier	\r\nAcer Computer (Singapore) Pte Ltd','http://www3.ntu.edu.sg/CITS2/computerdeals/images/2016/switchalpha.png,,','public','{\"specs_warranty\":\"\",\"specs_additionalsoftware\":\"\",\"specs_other\":\"\",\"specs_operatingsystem\":\"\",\"specs_audio\":\"\",\"specs_supplier\":\"\",\"specs_memory\":\"\",\"specs_graphics\":\"\",\"specs_mousepointer\":\"\",\"specs_chipset\":\"\",\"specs_harddiskdrive\":\"\",\"specs_processor\":\"\",\"specs_iointerface\":\"\",\"specs_opticaldrive\":\"\",\"specs_weightbattery\":\"\",\"specs_communication\":\"\",\"specs_sdisplay\":\"\"}','','on','2016-10-29 00:28:59','2016-11-08 20:10:15'),(6,'G501','Asus','5','1770.85','Processor	\r\nIntel Core i7-6700HQ (2.6GHz with Turbo Boost up to 3.5GHz, 4C8T, 6MB Cache)\r\nChipset	\r\nMemory	\r\n16GB DDR4 RAM \r\nHard Disk Drive	\r\n256GB SSD\r\n\r\nDisplay	\r\n15.6\" FHD (1920x1080) 16:9\r\n\r\nGraphics	\r\nNVIDIA GeForce GTX960M with 2GB (N16P-GX)\r\n\r\nCommunication	\r\nUSB3.0 to LAN, Wireless 802.11 ac Dual Band, Bluetooth 4.0\r\n\r\nOptical Drive	\r\nExternal USB DVD RW Drive\r\n\r\nI/O Interface	\r\n2xUSB3.1 Type-C, 3xUSB3.0, HDMI-to-VGA adapter\r\n\r\nAudio	\r\nIntegrated\r\n\r\nOperating System	\r\nWindows 10 Pro 64-bit\r\n\r\nAdditional Software	\r\nMouse/Pointer	\r\nOptical Mouse\r\n\r\nOther	\r\nCarrying Case\r\n\r\nWarranty	\r\n3 Years Local on-site (includes 1st Year International Warranty) with parts and labor \r\n\r\nWeight & Battery	\r\n2.06kg \r\n\r\nSupplier	\r\nNewstead Technologies','http://im.ziffdavisinternational.com/ign_ap/screenshot/default/g501-left-open135-top_s5tv.jpg,http://www.technobuffalo.com/wp-content/uploads/2015/03/G501_Front-Open135-1280x889.jpg,https://s.aolcdn.com/hss/storage/midas/b87d9a887b1b48b83b511bc5c892ea3c/201682649/asus-g501.jpg','public','{\"specs_warranty\":\"3 Years Local on-site (includes 1st Year International Warranty) with parts and labor\",\"specs_additionalsoftware\":\"\",\"specs_other\":\"Carrying Case\",\"specs_operatingsystem\":\"Windows 10 Pro 64-bit\",\"specs_audio\":\"Integrated\",\"specs_supplier\":\"\",\"specs_memory\":\"16GB DDR4 RAM\",\"specs_graphics\":\"NVIDIA GeForce GTX960M with 2GB (N16P-GX)\",\"specs_mousepointer\":\"Optical Mouse\",\"specs_chipset\":\"\",\"specs_harddiskdrive\":\"256GB SSD\",\"specs_processor\":\"Intel Core i7-6700HQ (2.6GHz with Turbo Boost up to 3.5GHz, 4C8T, 6MB Cache)\",\"specs_iointerface\":\"2xUSB3.1 Type-C, 3xUSB3.0, HDMI-to-VGA adapter\",\"specs_opticaldrive\":\"External USB DVD RW Drive\",\"specs_weightbattery\":\"2.06kg\",\"specs_communication\":\"USB3.0 to LAN, Wireless 802.11 ac Dual Band, Bluetooth 4.0\",\"specs_sdisplay\":\"15.6\\\" FHD (1920x1080) 16:9\"}','Additional Battery Pack\r\n+ S$117.70;\r\nExternal Rechargeable Power Bank\r\n+ S$235.40;\r\nIntegrated Headphone with Microphone\r\n+ S$17.12;\r\nMetal Asset Tag\r\n+ S$26.75;\r\nPC Security Cable Lock\r\n+ S$37.45;\r\nPort Replicator / Docking Station\r\n+ S$176.55;\r\nSecond AC Adapter\r\n+ S$85.60;\r\nUSB3.0 1TB Portable Hard Drive','on','2016-10-30 02:42:25','2016-11-08 23:35:10');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'ssppp'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-09  3:51:36
