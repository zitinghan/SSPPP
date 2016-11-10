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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (4,'Switch Alpha 12','Acer','2','1284','Processor	\r\nIntel Core i5-6200U (2.3GHz with Turbo Boost up to 2.8GHz, 3MB L3 Cache, 2C4T)\r\nChipset	\r\nMemory	\r\n8GB LPDDR3 RAM \r\nHard Disk Drive	\r\n128GD SSD\r\n\r\nDisplay	\r\n12\" Quad-HD IPS with 10-pt Multi-Touch\r\n\r\nGraphics	\r\nIntel HD Graphics 520\r\n\r\nCommunication	\r\n802.11a/b/g/n/ac, Wireless LAN, Bluetooth 4.0\r\n\r\nOptical Drive	\r\nI/O Interface	\r\n1xUSB Type-C, 1xUSB3.0, Type.C-to-HDMI converter\r\n\r\nAudio	\r\nIntegrated\r\n\r\nOperating System	\r\nWindows 10 Home 64-bit\r\n\r\nAdditional Software	\r\nMouse/Pointer	\r\nUSB Mouse & Active Stylus Pen bundled\r\n\r\nOther	\r\nFolio Snap Case bundled\r\n\r\nWarranty	\r\n3 Years Local On-site (includes 1st Year International Warranty) with parts and labor \r\n\r\nWeight & Battery	\r\n1.25kg \r\n\r\nSupplier	\r\nAcer Computer (Singapore) Pte Ltd','http://cdn1.swzone.it/news/1417957ceeef53bdb4-sa1.jpg,http://static.acer.com/up/Resource/Acer/Laptops/Switch_Alpha_12/Photogallery/20160309/Acer_Switch_Alpha_12-photogallery-06.png,https://img.netzwelt.de/dw1018_dh573_sw1920_sh1080_sx0_sy0_sr16x9_nu1/picture/original/2016/06/acer-switch-12-1-195040.jpg','public','{\"specs_warranty\":\"3 Years Local On-site (includes 1st Year International Warranty) with parts and labor\",\"specs_additionalsoftware\":\"\",\"specs_other\":\"Folio Snap Case bundled\",\"specs_operatingsystem\":\"Windows 10 Home 64-bit\",\"specs_audio\":\"Integrated\",\"specs_supplier\":\"Acer Computer (Singapore) Pte Ltd\",\"specs_memory\":\"8GB LPDDR3 RAM\",\"specs_graphics\":\"Intel HD Graphics 520\",\"specs_mousepointer\":\"USB Mouse & Active Stylus Pen bundled\",\"specs_chipset\":\"\",\"specs_harddiskdrive\":\"128GD SSD\",\"specs_processor\":\"Intel Core i5-6200U (2.3GHz with Turbo Boost up to 2.8GHz, 3MB L3 Cache, 2C4T)\",\"specs_iointerface\":\"1xUSB Type-C, 1xUSB3.0, Type.C-to-HDMI converter\",\"specs_opticaldrive\":\"\",\"specs_weightbattery\":\"1.25kg\",\"specs_communication\":\"802.11a/b/g/n/ac, Wireless LAN, Bluetooth 4.0\",\"specs_sdisplay\":\"12\\\" Quad-HD IPS with 10-pt Multi-Touch\"}','Others;\r\nActive Stylus Pen\r\n+ S$53.50;\r\nIntegrated Headphone with Microphone\r\n+ S$21.40;\r\nSecurity Lock via USB and of key-lock type\r\n+ S$26.75;\r\nUniversal Docking Station\r\n+ S$235.40;\r\nUSB3.0 1TB Portable Hard Drive\r\n+ S$107.00;','on','2016-10-29 00:28:59','2016-11-09 13:05:31'),(6,'G501','Asus','5','1770.85','Processor	\r\nIntel Core i7-6700HQ (2.6GHz with Turbo Boost up to 3.5GHz, 4C8T, 6MB Cache)\r\nChipset	\r\nMemory	\r\n16GB DDR4 RAM \r\nHard Disk Drive	\r\n256GB SSD\r\n\r\nDisplay	\r\n15.6\" FHD (1920x1080) 16:9\r\n\r\nGraphics	\r\nNVIDIA GeForce GTX960M with 2GB (N16P-GX)\r\n\r\nCommunication	\r\nUSB3.0 to LAN, Wireless 802.11 ac Dual Band, Bluetooth 4.0\r\n\r\nOptical Drive	\r\nExternal USB DVD RW Drive\r\n\r\nI/O Interface	\r\n2xUSB3.1 Type-C, 3xUSB3.0, HDMI-to-VGA adapter\r\n\r\nAudio	\r\nIntegrated\r\n\r\nOperating System	\r\nWindows 10 Pro 64-bit\r\n\r\nAdditional Software	\r\nMouse/Pointer	\r\nOptical Mouse\r\n\r\nOther	\r\nCarrying Case\r\n\r\nWarranty	\r\n3 Years Local on-site (includes 1st Year International Warranty) with parts and labor \r\n\r\nWeight & Battery	\r\n2.06kg \r\n\r\nSupplier	\r\nNewstead Technologies','http://im.ziffdavisinternational.com/ign_ap/screenshot/default/g501-left-open135-top_s5tv.jpg,http://www.technobuffalo.com/wp-content/uploads/2015/03/G501_Front-Open135-1280x889.jpg,https://s.aolcdn.com/hss/storage/midas/b87d9a887b1b48b83b511bc5c892ea3c/201682649/asus-g501.jpg','public','{\"specs_warranty\":\"3 Years Local on-site (includes 1st Year International Warranty) with parts and labor\",\"specs_additionalsoftware\":\"\",\"specs_other\":\"Carrying Case\",\"specs_operatingsystem\":\"Windows 10 Pro 64-bit\",\"specs_audio\":\"Integrated\",\"specs_supplier\":\"\",\"specs_memory\":\"16GB DDR4 RAM\",\"specs_graphics\":\"NVIDIA GeForce GTX960M with 2GB (N16P-GX)\",\"specs_mousepointer\":\"Optical Mouse\",\"specs_chipset\":\"\",\"specs_harddiskdrive\":\"256GB SSD\",\"specs_processor\":\"Intel Core i7-6700HQ (2.6GHz with Turbo Boost up to 3.5GHz, 4C8T, 6MB Cache)\",\"specs_iointerface\":\"2xUSB3.1 Type-C, 3xUSB3.0, HDMI-to-VGA adapter\",\"specs_opticaldrive\":\"External USB DVD RW Drive\",\"specs_weightbattery\":\"2.06kg\",\"specs_communication\":\"USB3.0 to LAN, Wireless 802.11 ac Dual Band, Bluetooth 4.0\",\"specs_sdisplay\":\"15.6\\\" FHD (1920x1080) 16:9\"}','Additional Battery Pack\r\n+ S$117.70;\r\nExternal Rechargeable Power Bank\r\n+ S$235.40;\r\nIntegrated Headphone with Microphone\r\n+ S$17.12;\r\nMetal Asset Tag\r\n+ S$26.75;\r\nPC Security Cable Lock\r\n+ S$37.45;\r\nPort Replicator / Docking Station\r\n+ S$176.55;\r\nSecond AC Adapter\r\n+ S$85.60;\r\nUSB3.0 1TB Portable Hard Drive','on','2016-10-30 02:42:25','2016-11-08 23:35:10'),(10,'iPad Mini 4 32GB Wifi','Apple','1','537.14','The iPad Mini 4 (stylized and marketed as iPad mini 4) is the fourth-generation iPad Mini tablet computer designed, developed and marketed by Apple Inc. It was announced along with the iPad Pro on September 9, 2015, and released the same day. The iPad Mini 4, which replaced the iPad mini 3, is also the flagship of the two iPad Mini models currently sold by Apple, along with the iPad Mini 2.','http://ipadwiki.com/wp-content/uploads/2015/06/apple-ipad-mini-A1432-1st-generation-tech-specs-1.jpg,http://store.storeimages.cdn-apple.com/4973/as-images.apple.com/is/image/AppleInc/aos/published/images/i/pa/ipad/mini4/ipad-mini4-step1-wifi-gold_GEO_US?wid=1200&hei=630&fmt=jpeg&qlt=95&op_sharpen=0&resMode=bicub&op_usm=0.5,http://trungtambaohanhsuachua.vn/wp-content/uploads/2016/06/mobile-ipad-mini-4-hero-2015.jpg','public','{\"specs_warranty\":\"1 Year LocaWarranty (including parts and labor)\",\"specs_additionalsoftware\":\"\",\"specs_other\":\"Bundled with Book case and Screen Protector (Anti-Glare)\",\"specs_operatingsystem\":\"iOS 9\",\"specs_audio\":\"Integrated\",\"specs_supplier\":\"Newstead Technologies\",\"specs_memory\":\"32GB\",\"specs_graphics\":\"\",\"specs_mousepointer\":\"Multitouch screen\",\"specs_chipset\":\"\",\"specs_harddiskdrive\":\"\",\"specs_processor\":\"A8 chip with 64-bit architecture and M8 motion coprocessor\",\"specs_iointerface\":\"1 x Lightning port, Fingerprint identity sensor\",\"specs_opticaldrive\":\"\",\"specs_weightbattery\":\"331g\",\"specs_communication\":\"Wireless 802.11 a/b/g/n, Bluetooth 4.0\",\"specs_sdisplay\":\"7.9 LED 2048x1536\"}','(1) iPad Mini 4 Wi-Fi 128GB\r\n+ S$136.96;\r\n(2) iPad Mini 4 Wi-Fi+Cellular 32GB\r\n+ S$169.06;\r\n(3) iPad Mini 4 Wi-Fi+Cellular 128GB\r\n+ S$318.86;','on','2016-11-09 13:11:15','2016-11-09 13:13:22'),(11,'TravelMate P238 (i5)','Acer','2','995.10','','https://www.laptopsg.com/wp-content/uploads/2016/02/TravelMate-1.png,http://static.acer.com/up/Resource/Acer/Professional/Product/Notebook/Extensa_15/Images/20151014/Extensa-2511-preview.png,http://lab-kuzniewski.pl/wp-content/gallery/aceryp_main1/img_2D_0001.jpg','public','{\"specs_warranty\":\"3 Years Local On-site (includes 1st Year International Warranty) with parts and labor\",\"specs_additionalsoftware\":\"\",\"specs_other\":\"Laptop Bag\",\"specs_operatingsystem\":\"Windows 10 Home 64-bit\",\"specs_audio\":\"Integrated\",\"specs_supplier\":\"Acer Computer (Singapore) Pte Ltd\",\"specs_memory\":\"\",\"specs_graphics\":\"Intel HD Graphics 520\",\"specs_mousepointer\":\"USB Mouse\",\"specs_chipset\":\"\",\"specs_harddiskdrive\":\"8GB DDR3 RAM\",\"specs_processor\":\"Intel Core i5-6200U (2.3GHz with Turbo Boost up to 2.8GHz, 3MB L3 Cache, 2C4T)\",\"specs_iointerface\":\"1xUSB Type-C USB3.1, 1xUSB3.0, 2xUSB2.0, 1xHDMI, 1xHDMI-to-VGA converter\",\"specs_opticaldrive\":\"External USB DVD RW Drive\",\"specs_weightbattery\":\"1.5kg\",\"specs_communication\":\"Gigabit Ethernet, Intel Dual Band Wireless-AC, Wireless 802.11 ac/a/b/g/n, Bluetooth 4.0\",\"specs_sdisplay\":\"13.3\\\" HD (1366x768)\"}','','on','2016-11-09 20:07:37','2016-11-09 21:05:55'),(12,'iPad Pro 9.7 32GB Wifi','Apple','1','797.15','','http://i.amz.mshcdn.com/z5HgPgYD8AYAiR1P1Gwn5mH6EbQ=/http%3A%2F%2Fa.amz.mshcdn.com%2Fwp-content%2Fuploads%2F2015%2F11%2F110915-iPad-Pro-No-Watermark-4.jpg,http://cdn.gsmarena.com/imgroot/news/15/11/ipad-pro-pre-orders/-728xw3/gsmarena_001.jpg,https://cdn2.pcadvisor.co.uk/cmsdata/reviews/3630076/surface_pro_4_vs_ipad_pro_10.jpg','public','{\"specs_warranty\":\"1 Year Local Warranty (including parts and labor)\",\"specs_additionalsoftware\":\"\",\"specs_other\":\"Bundled with Screen Protector (Anti-Glare)\",\"specs_operatingsystem\":\"\",\"specs_audio\":\"iOS 9\",\"specs_supplier\":\"Newstead Technologies\",\"specs_memory\":\"\",\"specs_graphics\":\"\",\"specs_mousepointer\":\"Multitouch screen\",\"specs_chipset\":\"\",\"specs_harddiskdrive\":\"32GB\",\"specs_processor\":\"A9X chip with 64-bit architecture and M9 coprocessor\",\"specs_iointerface\":\"\",\"specs_opticaldrive\":\"Integrated\",\"specs_weightbattery\":\"437g\",\"specs_communication\":\"Wireless 802.11 a/b/g/n, Bluetooth 4.0\",\"specs_sdisplay\":\"9.7 LED 2048x1536\"}','','on','2016-11-09 20:12:32','2016-11-09 21:02:32'),(13,'Elite x2 1012 G1','HP','2','1719','','','public','{\"specs_warranty\":\"3 Years Local On-site (includes 1st Year International Warranty) with parts and labor\",\"specs_additionalsoftware\":\"\",\"specs_other\":\"14\\\" Carrying Case\",\"specs_operatingsystem\":\"Windows 10 Home 64-bit High-end\",\"specs_audio\":\"Integrated\",\"specs_supplier\":\"Delteq Pte Ltd\",\"specs_memory\":\"8GB DDR3 RAM\",\"specs_graphics\":\"Intel HD Graphics 515\",\"specs_mousepointer\":\"Bluetooth Mouse, Wacom AES Pen\",\"specs_chipset\":\"\",\"specs_harddiskdrive\":\"128GB SATA-3 SSD\",\"specs_processor\":\"Intel Core M5-6Y54 (1.1GHz with Turbo Boost up to 2.7GHz, 2C4T, 4MB L3 Cache)\",\"specs_iointerface\":\"1xUSB Type C, 1xUSB Type A, USB C-to-VGA adapter\",\"specs_opticaldrive\":\"\",\"specs_weightbattery\":\"1205g\",\"specs_communication\":\"Intel Dual Band 8260 ac 2x2 non vPro, Bluetooth 4.2\",\"specs_sdisplay\":\"12\\\" LED WUXGA+UWVA BrightView (1920x1280) Touchscreen\"}','','on','2016-11-09 20:17:41','2016-11-09 20:17:41'),(14,'Surface Pro 4','Microsoft','2','1605','','https://compass-ssl.surface.com/assets/4a/85/4a85d889-a6e1-404b-bacf-ec681e64bcfb.jpg?n=Peregrine_glamour_web_Desk.jpg,http://cdn01.androidauthority.net/wp-content/uploads/2015/10/Microsoft-Surface-Pro-4.png,https://dri1.img.digitalrivercontent.net/Storefront/Company/msintl/images/English/en-INTL-Surface-Pro4-SU3-00001/PDP/en-INTL-PDP0-Surface-Pro4-SU3-00001-P1.jpg','public','{\"specs_warranty\":\"3 Years Local On-site Warranty\",\"specs_additionalsoftware\":\"\",\"specs_other\":\"Type Cover and Pen Included\",\"specs_operatingsystem\":\"Windows 10 Pro\",\"specs_audio\":\"Integrated\",\"specs_supplier\":\"AsiaPac Distribution Pte Ltd\",\"specs_memory\":\"4GB RAM\",\"specs_graphics\":\"Intel HD Graphics 5000\",\"specs_mousepointer\":\"\",\"specs_chipset\":\"\",\"specs_harddiskdrive\":\"128GB Flash Drive\",\"specs_processor\":\"Intel Core m3 (1.7GHz with Turbo Boost up to 3.3GHz, 2C4T, 4MB Shared L3 Cache)\",\"specs_iointerface\":\"1xUSB3.0, 1xmicroSD slot, 1xmini Display Port, 1xcover port\",\"specs_opticaldrive\":\"\",\"specs_weightbattery\":\"766g\",\"specs_communication\":\"802.11ac WiFi Wireless Networking; IEEE 802.11 a/b/g/n compatible, Bluetooth 4.0\",\"specs_sdisplay\":\"12.3\\\" PixelSense 2763x1824 (267PPI), Aspect Ratio 3:2 with 10pt Multi-touch\"}','','on','2016-11-09 20:21:18','2016-11-10 09:20:30'),(15,'','Acer','1','','',',,','public','{\"specs_warranty\":\"\",\"specs_additionalsoftware\":\"\",\"specs_other\":\"\",\"specs_operatingsystem\":\"\",\"specs_audio\":\"\",\"specs_supplier\":\"\",\"specs_memory\":\"\",\"specs_graphics\":\"\",\"specs_mousepointer\":\"\",\"specs_chipset\":\"\",\"specs_harddiskdrive\":\"\",\"specs_processor\":\"\",\"specs_iointerface\":\"\",\"specs_opticaldrive\":\"\",\"specs_weightbattery\":\"\",\"specs_communication\":\"\",\"specs_sdisplay\":\"\"}','',NULL,'2016-11-10 09:48:45','2016-11-10 10:01:33');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-10 23:00:53
