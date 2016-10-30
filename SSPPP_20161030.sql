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
  PRIMARY KEY (`idlogin`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,'abc','123','Administrator',NULL,NULL,NULL),(4,'g122','g122','Student','g122','123456','g122@gmail.com'),(5,'g123','g123','Student','g123 name','1234567','g123@gmail.com'),(6,'ss1','ss1','Staff','ss1 name','1234567','ss1@gmail.com'),(8,'ss5','ss5','Staff','ss5','3333','errr'),(10,'8flags','8flags','Supplier','8 flags computer system pte Ltd','1234567','8flag@postmaster.com'),(11,'pp','pp','Student','pppp','88888','nnnn'),(12,'g200','g200','Student','g200 ','222222','1111111111111');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `idorder` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) DEFAULT NULL,
  `Picturename` varchar(45) DEFAULT NULL,
  `Qty` int(11) DEFAULT NULL,
  `Price` double DEFAULT NULL,
  `Amount` double DEFAULT NULL,
  `Ordstatus` varchar(50) DEFAULT NULL,
  `Userid` varchar(45) DEFAULT NULL,
  `Orddate` datetime DEFAULT NULL,
  PRIMARY KEY (`idorder`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (18,'dell','dell.png',1,1500,1500,'Ready','ss1','2016-10-11 16:42:58'),(19,'acer','acer.png',1,1600,1600,'Confirmed','g122','2016-10-11 23:42:22'),(20,'dell','dell.png',1,1500,1500,'Confirmed','g123','2016-10-13 17:45:26');
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
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (4,'Switch Alpha 12','Acer','2','1284','Processor	\r\nIntel Core i5-6200U (2.3GHz with Turbo Boost up to 2.8GHz, 3MB L3 Cache, 2C4T)\r\nChipset	\r\nMemory	\r\n8GB LPDDR3 RAM \r\nHard Disk Drive	\r\n128GD SSD\r\n\r\nDisplay	\r\n12\" Quad-HD IPS with 10-pt Multi-Touch\r\n\r\nGraphics	\r\nIntel HD Graphics 520\r\n\r\nCommunication	\r\n802.11a/b/g/n/ac, Wireless LAN, Bluetooth 4.0\r\n\r\nOptical Drive	\r\nI/O Interface	\r\n1xUSB Type-C, 1xUSB3.0, Type.C-to-HDMI converter\r\n\r\nAudio	\r\nIntegrated\r\n\r\nOperating System	\r\nWindows 10 Home 64-bit\r\n\r\nAdditional Software	\r\nMouse/Pointer	\r\nUSB Mouse & Active Stylus Pen bundled\r\n\r\nOther	\r\nFolio Snap Case bundled\r\n\r\nWarranty	\r\n3 Years Local On-site (includes 1st Year International Warranty) with parts and labor \r\n\r\nWeight & Battery	\r\n1.25kg \r\n\r\nSupplier	\r\nAcer Computer (Singapore) Pte Ltd','http://www3.ntu.edu.sg/CITS2/computerdeals/images/2016/switchalpha.png','public',NULL,NULL,'2016-10-29 00:28:59','2016-10-29 00:28:59'),(6,'G501','Asus','5','1770.85','Processor	\r\nIntel Core i7-6700HQ (2.6GHz with Turbo Boost up to 3.5GHz, 4C8T, 6MB Cache)\r\nChipset	\r\nMemory	\r\n16GB DDR4 RAM \r\nHard Disk Drive	\r\n256GB SSD\r\n\r\nDisplay	\r\n15.6\" FHD (1920x1080) 16:9\r\n\r\nGraphics	\r\nNVIDIA GeForce GTX960M with 2GB (N16P-GX)\r\n\r\nCommunication	\r\nUSB3.0 to LAN, Wireless 802.11 ac Dual Band, Bluetooth 4.0\r\n\r\nOptical Drive	\r\nExternal USB DVD RW Drive\r\n\r\nI/O Interface	\r\n2xUSB3.1 Type-C, 3xUSB3.0, HDMI-to-VGA adapter\r\n\r\nAudio	\r\nIntegrated\r\n\r\nOperating System	\r\nWindows 10 Pro 64-bit\r\n\r\nAdditional Software	\r\nMouse/Pointer	\r\nOptical Mouse\r\n\r\nOther	\r\nCarrying Case\r\n\r\nWarranty	\r\n3 Years Local on-site (includes 1st Year International Warranty) with parts and labor \r\n\r\nWeight & Battery	\r\n2.06kg \r\n\r\nSupplier	\r\nNewstead Technologies','http://www3.ntu.edu.sg/CITS2/computerdeals/images/2016/asus-g501.jpg,data:image/jpeg;base64,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,data:image/jpeg;base64,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','public','{\"specs_warranty\":\"3 Years Local on-site (includes 1st Year International Warranty) with parts and labor\",\"specs_additionalsoftware\":\"\",\"specs_other\":\"Carrying Case\",\"specs_operatingsystem\":\"Windows 10 Pro 64-bit\",\"specs_audio\":\"Integrated\",\"specs_supplier\":\"\",\"specs_memory\":\"16GB DDR4 RAM\",\"specs_graphics\":\"NVIDIA GeForce GTX960M with 2GB (N16P-GX)\",\"specs_mousepointer\":\"Optical Mouse\",\"specs_chipset\":\"\",\"specs_harddiskdrive\":\"256GB SSD\",\"specs_processor\":\"Intel Core i7-6700HQ (2.6GHz with Turbo Boost up to 3.5GHz, 4C8T, 6MB Cache)\",\"specs_iointerface\":\"2xUSB3.1 Type-C, 3xUSB3.0, HDMI-to-VGA adapter\",\"specs_opticaldrive\":\"External USB DVD RW Drive\",\"specs_weightbattery\":\"2.06kg\",\"specs_communication\":\"USB3.0 to LAN, Wireless 802.11 ac Dual Band, Bluetooth 4.0\",\"specs_sdisplay\":\"15.6\\\" FHD (1920x1080) 16:9\"}','Additional Battery Pack\r\n+ S$117.70\r\nExternal Rechargeable Power Bank\r\n+ S$235.40\r\nIntegrated Headphone with Microphone\r\n+ S$17.12\r\nMetal Asset Tag\r\n+ S$26.75\r\nPC Security Cable Lock\r\n+ S$37.45\r\nPort Replicator / Docking Station\r\n+ S$176.55\r\nSecond AC Adapter\r\n+ S$85.60\r\nUSB3.0 1TB Portable Hard Drive','2016-10-30 02:42:25','2016-10-30 21:46:31');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_back`
--

DROP TABLE IF EXISTS `product_back`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_back` (
  `idproduct` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) DEFAULT NULL,
  `Type` varchar(45) DEFAULT NULL,
  `Picturename` varchar(45) DEFAULT NULL,
  `Price` double DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idproduct`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_back`
--

LOCK TABLES `product_back` WRITE;
/*!40000 ALTER TABLE `product_back` DISABLE KEYS */;
INSERT INTO `product_back` VALUES (5,'dell','Notebook','dell.png',1500,'dell  vvvv 111'),(6,'acer','Notebook','acer.png',1600,'acer acer 11'),(9,'surface','Notebook','surface.png',1200.12,'surface ');
/*!40000 ALTER TABLE `product_back` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-30 21:48:10
