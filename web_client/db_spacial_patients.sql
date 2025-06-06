-- MariaDB dump 10.19-11.3.2-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: db_spacial_patients
-- ------------------------------------------------------
-- Server version	11.3.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `case_data`
--

DROP TABLE IF EXISTS `case_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `case_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `case_number` varchar(20) DEFAULT NULL,
  `case_location` varchar(50) DEFAULT NULL,
  `case_location_landmark` varchar(255) DEFAULT NULL,
  `case_breathing` enum('breathe','not_breathing','unsure') DEFAULT NULL,
  `case_other_symptom` text DEFAULT NULL,
  `case_status` enum('pending','receive','process','healing','hospital','complete') DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `case_date` datetime DEFAULT NULL,
  `case_date_receive` datetime DEFAULT NULL,
  `case_status_notification` enum('self','other') DEFAULT NULL,
  `case_type` enum('accident','elderly','emergency') DEFAULT NULL,
  `case_idcard` varchar(13) DEFAULT NULL,
  `case_number_patients` varchar(255) DEFAULT NULL,
  `case_tel` varchar(10) DEFAULT NULL,
  `case_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `case_data`
--

LOCK TABLES `case_data` WRITE;
/*!40000 ALTER TABLE `case_data` DISABLE KEYS */;
INSERT INTO `case_data` VALUES
(121,'0001',NULL,'','breathe','','pending',NULL,45,'2024-08-02 14:05:55',NULL,NULL,'accident','0000000000000','5','0800000000','thananchai'),
(122,'0002',NULL,'','breathe','','pending',NULL,45,'2024-08-04 15:24:31',NULL,NULL,'accident','8888888888888','5','0800000000',NULL);
/*!40000 ALTER TABLE `case_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `case_image`
--

DROP TABLE IF EXISTS `case_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `case_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `case_image_path` varchar(255) DEFAULT NULL,
  `case_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `case_image`
--

LOCK TABLES `case_image` WRITE;
/*!40000 ALTER TABLE `case_image` DISABLE KEYS */;
INSERT INTO `case_image` VALUES
(17,'upload\\case_uploads\\1722582355743.jpg',121),
(18,'upload\\case_uploads\\1722582355814.jpg',121),
(19,'upload\\case_uploads\\1722759871743.jpg',122);
/*!40000 ALTER TABLE `case_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `case_symptom`
--

DROP TABLE IF EXISTS `case_symptom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `case_symptom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `case_id` int(11) DEFAULT NULL,
  `symptom_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id` DESC) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `case_symptom`
--

LOCK TABLES `case_symptom` WRITE;
/*!40000 ALTER TABLE `case_symptom` DISABLE KEYS */;
INSERT INTO `case_symptom` VALUES
(70,122,47),
(69,122,45),
(68,122,43),
(67,121,44),
(66,121,46),
(65,121,48),
(64,121,47),
(63,121,45),
(62,121,43);
/*!40000 ALTER TABLE `case_symptom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_name` varchar(255) DEFAULT NULL,
  `contact_lastname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_number` varchar(255) DEFAULT NULL,
  `member_name` varchar(255) DEFAULT NULL,
  `member_lastname` varchar(255) DEFAULT NULL,
  `member_address` varchar(255) DEFAULT NULL,
  `member_tel` varchar(20) DEFAULT NULL,
  `member_idcard` varchar(13) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `member_birthdate` date DEFAULT NULL,
  `member_image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES
(45,'0001','jo','1',NULL,'0610755564',NULL,'admin','$2a$10$F8gwmyHF1jA4j8M78J2iguqXdTm7sZe03yoQcZD0f.fEDyYu5csre','2024-06-20',NULL),
(46,'0002','admin1','1',NULL,'99',NULL,'admin1','$2a$10$Myn9voD2hHnjHX154pJX/O6sq/L34iaP6IKPTD4jGcFiN79WvFdYC','2024-06-13',NULL),
(47,'0003','funkyโ€','funkyโ€',NULL,'funkyโ€',NULL,'admin2','$2a$10$Sedr3M/6ifDF9G8jUeZS5.qzKeMsJxT97bn5IF7HTmSwoPT6sgDOm','2024-06-27','member_upload\\1718033608692.jpg'),
(48,'0004','jo','1234',NULL,'jo',NULL,'jo','$2a$10$GtTjqlhKhkPZ5HLZofJgZOfbgDy0hyanHG8HoeYerOXQdG5vUGMdG','2024-06-12','member_upload\\1718097920747.jpg'),
(49,'0005','joey','h',NULL,'0610755564',NULL,'joey1','$2a$10$SQ.4uGLCxnY.XwbePYA6B.lBN9fdLM5uciRqRipUrjyEDun54sRM6','2024-08-01','member_upload\\1722448699785.jpg');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_case`
--

DROP TABLE IF EXISTS `patient_case`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_case` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_case_name` varchar(255) DEFAULT NULL,
  `patient_case_lastname` varchar(255) DEFAULT NULL,
  `case_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_case`
--

LOCK TABLES `patient_case` WRITE;
/*!40000 ALTER TABLE `patient_case` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient_case` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `symptom`
--

DROP TABLE IF EXISTS `symptom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `symptom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `symptom_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `symptom`
--

LOCK TABLES `symptom` WRITE;
/*!40000 ALTER TABLE `symptom` DISABLE KEYS */;
INSERT INTO `symptom` VALUES
(43,'เธเธงเธเธจเธฃเธตเธฉเธฐ'),
(44,'เธเธงเธ”เธซเธฅเธฑเธ'),
(45,'เน€เธเนเธเธซเธเนเธฒเธญเธ'),
(46,'เธเธงเธ”เธ•เนเธเธเธญ'),
(47,'เธเธงเธ”เธ—เนเธญเธ'),
(48,'เธญเธงเธฑเธขเธงเธฐเธเธดเธ”เธฃเธนเธ');
/*!40000 ALTER TABLE `symptom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `symptom_tool`
--

DROP TABLE IF EXISTS `symptom_tool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `symptom_tool` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tool_id` int(11) DEFAULT NULL,
  `symptom_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `symptom_tool`
--

LOCK TABLES `symptom_tool` WRITE;
/*!40000 ALTER TABLE `symptom_tool` DISABLE KEYS */;
INSERT INTO `symptom_tool` VALUES
(96,20,45),
(97,20,46),
(98,20,47),
(105,20,43),
(106,22,43),
(107,24,43),
(108,25,43),
(109,26,43),
(115,20,48),
(116,38,48),
(117,37,48),
(118,36,48),
(119,35,48),
(120,34,48),
(121,32,48),
(122,31,48),
(123,20,44),
(124,22,44),
(125,24,44),
(126,25,44),
(127,26,44),
(128,29,44),
(129,30,44);
/*!40000 ALTER TABLE `symptom_tool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tool`
--

DROP TABLE IF EXISTS `tool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tool` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tool_name` varchar(255) DEFAULT NULL,
  `tool_description` varchar(255) DEFAULT NULL,
  `tool_img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tool`
--

LOCK TABLES `tool` WRITE;
/*!40000 ALTER TABLE `tool` DISABLE KEYS */;
INSERT INTO `tool` VALUES
(20,'เธเธธเธ”เธเนเธญเธเธเธฑเธเธเธฃเธฐเธ”เธนเธเธเธญเน€เธเธฅเธทเนเธญเธ','เธเธธเธ”เธเนเธญเธเธเธฑเธเธเธฃเธฐเธ”เธนเธเธเธญเน€เธเธฅเธทเนเธญเธ เธญเธฑเธเธเธตเนเธเนเธเธณเน€เธเนเธเนเธกเนเนเธเนเธญเธฑเธเธญเธทเนเธเน เน€เธฅเธข เน€เธเธฃเธฒเธฐเธเธฐเธเนเธงเธขเธเนเธญเธเธเธฑเธเธเธฃเธฐเธ”เธนเธเธเธญเน€เธเธฅเธทเนเธญเธ เธชเธณเธซเธฃเธฑเธเธเธนเนเธเนเธงเธขเธฃเธฒเธขเธ—เธตเนเธกเธตเธญเธฒเธเธฒเธฃเธซเธเธฑเธเนเธเธ–เธถเธเธชเธฒเธซเธฑเธช เนเธกเนเนเธซเนเน€เธเธดเธ”เธเธฃเธฐเธ”เธนเธเน€เธเธฅเธทเนเธญเธเนเธเธกเธฒเธเธเธงเนเธฒเน€เธ”เธดเธก','/uploads/1716289009836.jpg'),
(22,'เธเธธเธ”เธฅเนเธญเธเธจเธตเธฃเธฉเธฐ','เธเธฐเนเธเนเธฅเนเธญเธเธจเธฃเธตเธฉเธฐเธเธฑเธเนเธเนเธเธเธฃเธฐเธ”เธฒเธเธฃเธญเธเธซเธฅเธฑเธเธซเธฃเธทเธญเน€เธเธฅเธ•เธฑเธ เน€เธเธทเนเธญเนเธงเนเธเธฃเธฐเธเธญเธเธจเธตเธฃเธฉเธฐเธเธนเนเธเธฒเธ”เน€เธเนเธเนเธเธเธ“เธฐเธ—เธตเนเน€เธเธฅเธทเนเธญเธเธขเนเธฒเธขเธเธนเนเธเนเธงเธข','/uploads/1716367245714.jpg'),
(24,'เน€เธ•เธตเธขเธเน€เธเธฅเธทเนเธญเธเธขเนเธฒเธขเธเธนเนเธเนเธงเธข','เน€เธ•เธตเธขเธเน€เธเธฅเธทเนเธญเธเธขเนเธฒเธขเธเธนเนเธเนเธงเธขเธ—เธตเนเธชเธฒเธกเธฒเธฃเธ–เธเธฑเธเน€เธเนเธเนเธ”เน เน€เธเธทเนเธญเนเธซเนเธชเธฒเธกเธฒเธฃเธ–เธซเธขเธดเธเธขเธเธญเธญเธเธกเธฒเธฃเธฑเธเธเธนเนเธเนเธงเธขเนเธ”เนเธญเธขเนเธฒเธเธ—เธฑเธเน€เธงเธฅเธฒ เนเธฅเธฐเธชเธฒเธกเธฒเธฃเธ–เธเธฑเธเน€เธเนเธเนเธเธฃเธ–เนเธ”เนเธ”เนเธงเธขเธเธฑเนเธเน€เธญเธ','/uploads/1719311937162.jpg'),
(25,'เน€เธเธฅเธ•เธฑเธ','เน€เธเธฅเธ•เธฑเธเธกเธตเนเธงเนเธชเธณเธซเธฃเธฑเธเนเธเนเนเธขเธเธเนเธญเธเธ•เธฑเธเธ•เธฑเธงเธขเธฒเธกเน€เธเธฅเธทเนเธญเธเธขเนเธฒเธขเธเธนเนเธเนเธงเธขเธเธถเนเธเธฅเธเธเธฒเธเธฃเธ–','/uploads/1719312045300.jpg'),
(26,'เน€เธเธฅเธชเธเธฒเธก','เน€เธเธฅเธชเธเธฒเธกเธเนเธกเธตเนเธงเนเน€เธเธทเนเธญเธเธเธขเนเธฒเธขเธเธนเนเธเนเธงเธขเธ•เธญเธเธเธถเนเธเธฅเธเธฃเธ–','/uploads/1719312108073.jpg'),
(27,'เธเธธเธ”เนเธเนเธเธฃเธญเธเธซเธฅเธฑเธเธเธนเนเธเนเธงเธข','เธเธธเธ”เนเธเนเธเธฃเธญเธเธซเธฅเธฑเธเธเธนเนเธเนเธงเธข เธกเธตเธฅเธฑเธเธฉเธ“เธฐเธเธดเน€เธจเธฉเธเธทเธญ เธ—เธเนเธฃเธเธเธฃเธฐเนเธ—เธเนเธฅเธฐเธชเนเธงเธเนเธซเธเนเธเธฐเธชเธฒเธกเธฒเธฃเธ–เธเธฑเธเธเนเธณเนเธ”เน เธญเธตเธเธ—เธฑเนเธเธขเธฑเธเธกเธตเน€เธเนเธกเธเธฑเธ”เธฃเธฑเธ”เธเธนเนเธเนเธงเธข เธเธฃเนเธญเธกเธซเธฑเธงเธฅเนเธญเธเธเธฃเธฑเธเนเธ”เน เธเธถเธเน€เธซเธกเธฒเธฐเธเธฑเธเธเธฒเธฃเธเธณเธกเธฒเธเนเธงเธขเนเธเธเธฒเธฃเธเธเธขเนเธฒเธขเธเธนเนเธเนเธงเธขเนเธ”เนเน€เธเนเธเธญเธขเนเธฒเธเธ”เธต','/uploads/1719312197350.jpg'),
(28,'เธเธธเธ”เธเนเธงเธขเธซเธฒเธขเนเธเธ”เนเธงเธขเธกเธทเธญเธเธตเธ','เธ–เธธเธเธฅเธกเธชเธณเธซเธฃเธฑเธเธเธตเธเธญเธฒเธเธฒเธจเธเนเธงเธขเธซเธฒเธขเนเธเนเธเธเธกเธต Pressure Release เธงเธฒเธฅเนเธง เน€เธเธทเนเธญเธเนเธงเธขเน€เธซเธฅเธทเธญเธเธนเนเธเนเธงเธขเนเธเน€เธเธทเนเธญเธเธ•เนเธ เธเธ“เธฐเธ—เธตเนเธฅเธณเน€เธฅเธตเธขเธเนเธเธชเนเธเนเธฃเธเธเธขเธฒเธเธฒเธฅ','/uploads/1719312247638.jpg'),
(29,'เน€เธเธฃเธทเนเธญเธเธ”เธนเธ”เธเธญเธเน€เธซเธฅเธง','เธชเธณเธซเธฃเธฑเธเน€เธเธฃเธทเนเธญเธเธ”เธนเธ”เธเธญเธเน€เธซเธฅเธง เธเนเธเธฐเธกเธตเนเธงเนเธเนเธงเธขเน€เธซเธฅเธทเธญเธเธนเนเธเนเธงเธขเธ—เธตเนเธกเธตเธญเธฒเธเธฒเธฃเน€เธฅเธทเธญเธ”เธญเธญเธเธซเธฃเธทเธญเธญเธฒเน€เธเธตเธขเธ เน€เธเธทเนเธญเธเนเธงเธขเธเธนเนเธเนเธงเธขเนเธซเนเธขเธฑเธเธซเธฒเธขเนเธเธ•เนเธญเนเธ”เนเธเนเธญเธเธเธฐเธ–เธถเธเนเธฃเธเธเธขเธฒเธเธฒเธฅเน€เธเธทเนเธญเนเธกเนเนเธซเนเน€เธเธดเธ”เธเธฒเธฃเธญเธฒเธเธฒเธฃเธซเธเธฑเธเธฅเธเนเธเธกเธฒเธเธเธงเนเธฒ','/uploads/1719312359644.jpg'),
(30,'เธเธธเธ”เน€เธเธทเธญเธเธฅเธก','เธเธธเธ”เน€เธเธทเธญเธเธชเธธเธเธเธฒเธเธฒเธจ เนเธเนเธชเธณเธซเธฃเธฑเธเน€เธเนเธฒเน€เธเธทเธญเธเธเธฃเธดเน€เธงเธ“เนเธเธเธเธฒเธซเธฃเธทเธญเธฅเธณเธ•เธฑเธงเนเธกเนเนเธซเนเธเธขเธฑเธเน€เธเธขเธทเนเธญเธ เนเธ”เธขเนเธเนเน€เธงเธฅเธฒเธฃเธงเธ”เน€เธฃเนเธงเน€เธเธตเธขเธเนเธเนเธเธฑเนเธกเธ”เธนเธ”เธญเธฒเธเธฒเธจเธญเธญเธเธ•เธฑเธงเน€เธเธทเธญเธเธเนเธเธฐเนเธเนเธเธ•เธฑเธงเธ•เธฒเธกเธญเธงเธฑเธขเธงเธฐเธ—เธตเนเธ–เธนเธเธซเนเธญเธซเธธเนเธก','/uploads/1719312709411.jpg'),
(31,'เธเธธเธ”เธญเธธเธเธเธฃเธ“เนเธ”เธฒเธกเธซเธฅเธฑเธเธเธเธดเธ”เธชเธฑเนเธ','เธชเธณเธซเธฃเธฑเธเธเธธเธ”เธญเธธเธเธเธฃเธ“เนเธ”เธฒเธกเธซเธฅเธฑเธเธเธเธดเธ”เธชเธฑเนเธ เธกเธตเนเธงเนเนเธเนเธ”เธฒเธกเธซเธฅเธฑเธเธเธนเนเธเนเธงเธขเธเธ“เธฐเธเธณเธชเนเธเนเธฃเธเธเธขเธฒเธเธฒเธฅ เน€เธเธฃเธฒเธฐเนเธกเนเนเธซเนเธเธฃเธดเน€เธงเธ“เธ”เนเธฒเธเธซเธฅเธฑเธเธเธญเธเธเธนเนเธเนเธงเธขเนเธ”เนเธฃเธฑเธเธเธฒเธฃเธเธฃเธฐเธ—เธเธเธฃเธฐเน€เธ—เธทเธญเธเนเธเธกเธฒเธเธเธงเนเธฒเน€เธ”เธดเธก','/uploads/1719312761275.jpg'),
(32,'เน€เธเนเธฒเธญเธตเนเน€เธเธฅเธทเนเธญเธเธขเนเธฒเธขเธเธนเนเธเนเธงเธข','เน€เธเนเธฒเธญเธตเนเน€เธเธฅเธทเนเธญเธเธขเนเธฒเธขเธเธนเนเธเนเธงเธขเธเธถเนเธเธฅเธเธเธฑเธเนเธ” เธเธฑเธเน€เธเนเธเนเธ”เนเน€เธกเธทเนเธญเนเธกเนเนเธ”เนเนเธเนเธเธฒเธ เธชเนเธงเธเธ—เธตเนเธฃเธญเธเธฃเธฑเธเธเธนเนเธเนเธงเธขเน€เธเนเธเธเนเธฒเนเธเธเธฑเธเธเนเธณเธชเธฒเธกเธฒเธฃเธ–เธฅเนเธฒเธเธ—เธณเธเธงเธฒเธกเธชเธฐเธญเธฒเธ”เนเธ”เน เธญเธตเธเธ—เธฑเนเธเธขเธฑเธเธกเธตเธ—เธตเนเธเธฑเธเน€เธ—เนเธฒเธเธ“เธฐเธขเธเธเธถเนเธเธฅเธเธเธฑเธเนเธ” เธกเธตเธ—เธตเนเธเธฑเธเธชเธณเธซเธฃเธฑเธเธขเธเน€เธเนเธฒเธญเธตเนเธ—เธฑเนเธเธ”เนเธฒเธเธซเธเนเธฒเนเธฅเธฐเธ”เนเธฒเธเธซเธฅเธฑเธเน€เธเธทเนเธญเนเธซเนเน€เธเธฅเธทเนเธญเธเธขเนเธฒเธขเนเธ”เนเธ”เนเธงเธข','/uploads/1719312812081.jpg'),
(34,'เน€เธเธฃเธทเนเธญเธเธเนเธงเธขเธซเธฒเธขเนเธ','เน€เธเธฃเธทเนเธญเธเธเนเธงเธขเธซเธฒเธขเนเธเนเธเธเธญเธฑเธ•เนเธเธกเธฑเธ•เธดเธ—เธตเนเนเธเนเนเธ”เนเธ—เธฑเนเธเน€เธ”เนเธเน€เธฅเนเธ เน€เธ”เนเธเนเธ• เนเธฅเธฐเธเธนเนเนเธซเธเน เธชเธฒเธกเธฒเธฃเธ–เธเธงเธเธเธธเธกเธเธฒเธฃเธ—เธณเธเธฒเธเธ”เนเธงเธขเธเธงเธฒเธกเธ”เธฑเธเธฅเธก (pneumatics) เธ—เธณเธเธฒเธเธ”เนเธงเธขเธฃเธฐเธเธ Volume preset เธชเธฒเธกเธฒเธฃเธ–เธ•เธฑเนเธเธญเธฑเธ•เธฃเธฒเธเธฒเธฃเธซเธฒเธขเนเธเนเธ”เนเนเธเธเนเธงเธ 10-30 เธเธฃเธฑเนเธเธ•เนเธญเธเธฒเธ—เธต','/uploads/1719312905961.jpg'),
(35,'เน€เธเธฃเธทเนเธญเธเธ•เธฃเธงเธเธงเธฑเธ”เธชเธฑเธเธเธฒเธ“เธเธตเธ','เน€เธเนเธเน€เธเธฃเธทเนเธญเธเน€เธเนเธฒเธ•เธดเธ”เธ•เธฒเธกเธชเธฑเธเธเธฒเธ“เธเธตเธเธงเธฑเธ”เธเธงเธฒเธกเธ”เธฑเธเนเธฅเธซเธดเธ•เนเธเธเธ เธฒเธขเธเธญเธเนเธฅเธฐเธเธฃเธดเธกเธฒเธ“เธเธงเธฒเธกเธญเธดเนเธกเธ•เธฑเธงเธเธญเธเธญเธญเธเธเธดเน€เธเธเนเธเน€เธฅเธทเธญเธ” เนเธฅเธฐเธชเธฑเธเธเธฒเธ“ ECG เนเธเธ 12 เธฅเธตเธ” เธ—เธณเนเธซเนเธชเธฒเธกเธฒเธฃเธ–เธ•เธฃเธงเธเธเธฑเธเธงเธฑเธ”เธเธตเธเธเธฃเธเธนเนเธเนเธงเธขเนเธ”เนเนเธเธเธ•เธฅเธญเธ”เน€เธงเธฅเธฒเธ—เธตเนเธญเธขเธนเนเนเธเธฃเธ–เธเธนเนเธ เธฑเธขเธเธฑเธเน€เธฅเธขเธ—เธตเน€เธ”เธตเธขเธง','/uploads/1719312971502'),
(36,'เธ•เธนเนเน€เธเนเธเธ–เธฑเธเธญเธญเธเธเธดเน€เธเธ','เธ–เธฑเธเธญเนเธญเธเธเธดเน€เธเธเธเธฃเธฐเธเธญเธเธ เธฒเธขเนเธเธฃเธ–เนเธงเนเธ”เนเธงเธขเธญเธขเธนเนเนเธฅเนเธง เน€เธเธทเนเธญเนเธงเนเธเนเธงเธขเน€เธซเธฅเธทเธญเธเธนเนเธเนเธงเธขเนเธ”เนเธญเธขเนเธฒเธเธ—เธฑเธเธ—เนเธงเธเธ—เธต','/uploads/1719313044310.png'),
(37,'เน€เธเธฃเธทเนเธญเธเธงเธฑเธ”เธเธงเธฒเธกเธ”เธฑเธเนเธฅเธซเธดเธ•','เธเธญเธเธเธฒเธเธเธฐเธงเธฑเธ”เธเธตเธเธเธฃเธเธฑเธเนเธฅเนเธงเธเนเธ•เนเธญเธเธกเธตเน€เธเธฃเธทเนเธญเธเธงเธฑเธ”เธเธงเธฒเธกเธ”เธฑเธเนเธฅเธซเธดเธ•เน€เธเธทเนเธญเนเธเธเธฃเธ“เธตเธเธฒเธเธเธเธเธงเธฒเธกเธ”เธฑเธเธ•เนเธณเธเธฐเนเธ”เนเธฃเธตเธเธเนเธงเธขเน€เธซเธฅเธทเธญเนเธ”เนเธญเธขเนเธฒเธเธ–เธนเธเธ•เนเธญเธเนเธฅเธฐเธ—เธฑเธเน€เธงเธฅเธฒ','/uploads/1719313099830.jpg'),
(38,'เธญเธธเธเธเธฃเธ“เนเธ—เธณเธเธงเธฒเธกเธชเธฐเธญเธฒเธ”เนเธเธฅเธ•เนเธฒเธเน','เน€เธซเธฅเนเธฒเธญเธธเธเธเธฃเธ“เนเธ—เธณเธเธงเธฒเธกเธชเธฐเธญเธฒเธ”เนเธเธฅเธ•เนเธฒเธเน เนเธกเนเธงเนเธฒเธเธฐเน€เธเนเธเน€เธเธ•เธฒเธ”เธตเธ เธขเธฒเธเนเธฒเน€เธเธทเนเธญ เธชเธณเธฅเธต เธเนเธฒเธเนเธญเธ• เธเนเธฒเธเธฑเธเนเธเธฅ เนเธญเธฅเธเธญเธฎเธญเธฅเน เธเธฃเธฃเนเธเธฃ เธ–เธธเธเธกเธทเธญ เนเธฅเธฐเธเธฃเธฃเธ”เธฒเธเธตเธกเธ•เธฑเธ”เธ•เนเธฒเธเน เธชเธณเธซเธฃเธฑเธเธเธฃเธ“เธตเธ—เธณเธเธงเธฒเธกเธชเธฐเธญเธฒเธ”เธเนเธฒเน€เธเธทเนเธญเนเธซเนเธเธฑเธเธเธนเนเธเนเธงเธขเธเนเธญเธเธเธฐเธ–เธถเธเนเธฃเธเธเธขเธฒเธเธฒเธฅ','/uploads/1719313170180.jpg');
/*!40000 ALTER TABLE `tool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_number` varchar(10) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_lastname` varchar(255) DEFAULT NULL,
  `user_position` varchar(255) DEFAULT NULL,
  `user_role` enum('admin','user') DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES
(2,'0002','adaaaa','adad','adada','admin','adadaaaa','adad'),
(3,'0003','admin','system','admin','admin','admin','$2y$10$aIWUF5fC6P7Mr4BfDrI8GOoJ/w/mXDOTZDW5b.8.9d6TwMHeE9.nW'),
(4,'0004','jo','jo','1234','user','jo','$2a$10$HpDzV4CUoAUGWK1BTZ2rbOyqpLctooiWZ81yI7JMjz.J2d92WoU8m');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `view_case`
--

DROP TABLE IF EXISTS `view_case`;
/*!50001 DROP VIEW IF EXISTS `view_case`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_case` AS SELECT
 1 AS `id`,
  1 AS `case_number`,
  1 AS `case_location`,
  1 AS `case_location_landmark`,
  1 AS `case_breathing`,
  1 AS `case_other_symptom`,
  1 AS `case_status`,
  1 AS `user_id`,
  1 AS `member_id`,
  1 AS `case_date`,
  1 AS `case_date_receive`,
  1 AS `case_status_notification`,
  1 AS `case_type`,
  1 AS `case_idcard`,
  1 AS `case_number_patients`,
  1 AS `case_tel`,
  1 AS `case_name` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_case_symptom`
--

DROP TABLE IF EXISTS `view_case_symptom`;
/*!50001 DROP VIEW IF EXISTS `view_case_symptom`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_case_symptom` AS SELECT
 1 AS `id`,
  1 AS `case_id`,
  1 AS `symptom_id`,
  1 AS `symptom_name` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_symptom_tool`
--

DROP TABLE IF EXISTS `view_symptom_tool`;
/*!50001 DROP VIEW IF EXISTS `view_symptom_tool`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_symptom_tool` AS SELECT
 1 AS `id`,
  1 AS `tool_id`,
  1 AS `symptom_id`,
  1 AS `tool_name`,
  1 AS `symptom_name` */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `view_case`
--

/*!50001 DROP VIEW IF EXISTS `view_case`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_case` AS select `case_data`.`id` AS `id`,`case_data`.`case_number` AS `case_number`,`case_data`.`case_location` AS `case_location`,`case_data`.`case_location_landmark` AS `case_location_landmark`,`case_data`.`case_breathing` AS `case_breathing`,`case_data`.`case_other_symptom` AS `case_other_symptom`,`case_data`.`case_status` AS `case_status`,`case_data`.`user_id` AS `user_id`,`case_data`.`member_id` AS `member_id`,`case_data`.`case_date` AS `case_date`,`case_data`.`case_date_receive` AS `case_date_receive`,`case_data`.`case_status_notification` AS `case_status_notification`,`case_data`.`case_type` AS `case_type`,`case_data`.`case_idcard` AS `case_idcard`,`case_data`.`case_number_patients` AS `case_number_patients`,`case_data`.`case_tel` AS `case_tel`,`case_data`.`case_name` AS `case_name` from `case_data` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_case_symptom`
--

/*!50001 DROP VIEW IF EXISTS `view_case_symptom`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_case_symptom` AS select `case_symptom`.`id` AS `id`,`case_symptom`.`case_id` AS `case_id`,`case_symptom`.`symptom_id` AS `symptom_id`,`symptom`.`symptom_name` AS `symptom_name` from (`case_symptom` left join `symptom` on(`case_symptom`.`symptom_id` = `symptom`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_symptom_tool`
--

/*!50001 DROP VIEW IF EXISTS `view_symptom_tool`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_symptom_tool` AS select `symptom_tool`.`id` AS `id`,`symptom_tool`.`tool_id` AS `tool_id`,`symptom_tool`.`symptom_id` AS `symptom_id`,`tool`.`tool_name` AS `tool_name`,`symptom`.`symptom_name` AS `symptom_name` from ((`symptom_tool` left join `tool` on(`symptom_tool`.`tool_id` = `tool`.`id`)) left join `symptom` on(`symptom_tool`.`symptom_id` = `symptom`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-28 22:19:05
