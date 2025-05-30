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
-- Table structure for table `ambulance`
--

DROP TABLE IF EXISTS `ambulance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ambulance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ambulance_registration` varchar(255) DEFAULT NULL,
  `driver_name` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `lat` varchar(255) DEFAULT NULL,
  `lng` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `case_lat` varchar(255) DEFAULT NULL,
  `case_lng` varchar(255) DEFAULT NULL,
  `case_type` varchar(255) DEFAULT NULL,
  `case_id` int(11) DEFAULT NULL,
  `case_status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ambulance`
--

LOCK TABLES `ambulance` WRITE;
/*!40000 ALTER TABLE `ambulance` DISABLE KEYS */;
INSERT INTO `ambulance` VALUES
(9,'1เธเธ”3243','เนเธเธญเธตเน','admin','1234','true',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(10,'1เธเธ” 4647 ','เธเธญเธก',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ambulance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ambulance_tool`
--

DROP TABLE IF EXISTS `ambulance_tool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ambulance_tool` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ambulance_id` int(11) DEFAULT NULL,
  `tool_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ambulance_tool`
--

LOCK TABLES `ambulance_tool` WRITE;
/*!40000 ALTER TABLE `ambulance_tool` DISABLE KEYS */;
INSERT INTO `ambulance_tool` VALUES
(47,9,20),
(48,9,22),
(49,10,24),
(50,10,25);
/*!40000 ALTER TABLE `ambulance_tool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `case_data`
--

DROP TABLE IF EXISTS `case_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `case_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `case_number` varchar(20) DEFAULT NULL,
  `case_landmark` varchar(255) DEFAULT NULL,
  `case_breathing` enum('breathe','not_breathing','unsure') DEFAULT NULL,
  `case_other_symptom` text DEFAULT NULL,
  `case_status` enum('inform','receive','departure','destination','hospital','complete') DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `case_status_notification` enum('self','other') DEFAULT NULL,
  `case_type` enum('accident') DEFAULT NULL,
  `case_tel` varchar(10) DEFAULT NULL,
  `case_name` varchar(255) DEFAULT NULL,
  `date_receive` datetime DEFAULT NULL,
  `case_lat` varchar(255) DEFAULT NULL,
  `case_lng` varchar(255) DEFAULT NULL,
  `ambulance_id` int(11) DEFAULT NULL,
  `date_inform` datetime DEFAULT NULL,
  `hospital_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `case_data`
--

LOCK TABLES `case_data` WRITE;
/*!40000 ALTER TABLE `case_data` DISABLE KEYS */;
INSERT INTO `case_data` VALUES
(165,'0001','seven eleven','breathe','','complete',3,45,NULL,'accident','0610755564','thananchai','2024-10-21 13:35:13','37.42209351379723','-122.08392206579445',9,'2024-10-21 13:33:34',NULL);
/*!40000 ALTER TABLE `case_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `case_data_tool`
--

DROP TABLE IF EXISTS `case_data_tool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `case_data_tool` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `case_data_id` int(11) DEFAULT NULL,
  `tool_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `case_data_tool`
--

LOCK TABLES `case_data_tool` WRITE;
/*!40000 ALTER TABLE `case_data_tool` DISABLE KEYS */;
INSERT INTO `case_data_tool` VALUES
(33,165,20),
(34,165,22),
(35,165,24);
/*!40000 ALTER TABLE `case_data_tool` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `case_image`
--

LOCK TABLES `case_image` WRITE;
/*!40000 ALTER TABLE `case_image` DISABLE KEYS */;
INSERT INTO `case_image` VALUES
(27,'upload\\case_uploads\\1729180617956.jpg',158),
(28,'upload\\case_uploads\\1729373902770.jpg',159),
(29,'upload\\case_uploads\\1729373902884.jpg',159),
(30,'upload\\case_uploads\\1729373902989.jpg',159),
(31,'upload\\case_uploads\\1729373903024.jpg',159),
(32,'upload\\case_uploads\\1729373903065.jpg',159),
(33,'upload\\case_uploads\\1729373903169.jpg',159);
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
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `case_symptom`
--

LOCK TABLES `case_symptom` WRITE;
/*!40000 ALTER TABLE `case_symptom` DISABLE KEYS */;
INSERT INTO `case_symptom` VALUES
(112,165,55),
(111,165,45),
(110,165,44),
(109,164,46),
(108,164,44),
(107,163,45),
(106,162,48),
(105,162,46),
(104,162,44),
(103,161,46),
(102,161,44),
(101,160,46),
(100,160,44),
(99,159,52),
(98,159,48),
(97,159,46),
(96,159,44),
(95,158,48),
(94,158,46),
(93,158,44);
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
-- Table structure for table `exacerbation`
--

DROP TABLE IF EXISTS `exacerbation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exacerbation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_lastname` varchar(255) DEFAULT NULL,
  `age` varchar(255) DEFAULT NULL,
  `id_card` varchar(255) DEFAULT NULL,
  `drug_allergy` varchar(255) DEFAULT NULL,
  `prescription_drugs` varchar(255) DEFAULT NULL,
  `sex` enum('man','female','not_specified') DEFAULT NULL,
  `date_incident` varchar(255) DEFAULT NULL,
  `time_incident` varchar(255) DEFAULT NULL,
  `location_incident` varchar(255) DEFAULT NULL,
  `symptom` varchar(255) DEFAULT NULL,
  `period` varchar(255) DEFAULT NULL,
  `assistance` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `landmarks` varchar(255) DEFAULT NULL,
  `lat` varchar(255) DEFAULT NULL,
  `lng` varchar(255) DEFAULT NULL,
  `name_lastname_Informer` varchar(255) DEFAULT NULL,
  `relationship` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `ambulance_id` int(11) DEFAULT NULL,
  `status` enum('inform','receive','departure','destination','hospital','complete') DEFAULT NULL,
  `violence` varchar(255) DEFAULT NULL,
  `type` enum('exacerbation') DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date_receive` datetime DEFAULT NULL,
  `date_inform` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exacerbation`
--

LOCK TABLES `exacerbation` WRITE;
/*!40000 ALTER TABLE `exacerbation` DISABLE KEYS */;
/*!40000 ALTER TABLE `exacerbation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exacerbation_tool`
--

DROP TABLE IF EXISTS `exacerbation_tool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exacerbation_tool` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exacerbation_id` int(11) DEFAULT NULL,
  `tool_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exacerbation_tool`
--

LOCK TABLES `exacerbation_tool` WRITE;
/*!40000 ALTER TABLE `exacerbation_tool` DISABLE KEYS */;
/*!40000 ALTER TABLE `exacerbation_tool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospital`
--

DROP TABLE IF EXISTS `hospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hospital` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hospital_name` varchar(255) DEFAULT NULL,
  `lat` varchar(255) DEFAULT NULL,
  `lng` varchar(255) DEFAULT NULL,
  `sub_district` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospital`
--

LOCK TABLES `hospital` WRITE;
/*!40000 ALTER TABLE `hospital` DISABLE KEYS */;
INSERT INTO `hospital` VALUES
(24,'เนเธฃเธเธเธขเธฒเธเธฒเธฅเธกเธซเธฒเธงเธดเธ—เธขเธฒเธฅเธฑเธขเธเน€เธฃเธจเธงเธฃ','16.748824883360218','100.1894045584816','เธ—เนเธฒเนเธเธเน','เน€เธกเธทเธญเธ','เธเธดเธฉเธ“เธธเนเธฅเธ');
/*!40000 ALTER TABLE `hospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infectious_patients`
--

DROP TABLE IF EXISTS `infectious_patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `infectious_patients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_lastname` varchar(255) DEFAULT NULL,
  `age` varchar(255) DEFAULT NULL,
  `id_card` varchar(255) DEFAULT NULL,
  `sex` enum('man','female','not_specified') DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `landmark` varchar(255) DEFAULT NULL,
  `lat` varchar(255) DEFAULT NULL,
  `lng` varchar(255) DEFAULT NULL,
  `name_disease` varchar(255) DEFAULT NULL,
  `symptom` varchar(255) DEFAULT NULL,
  `period` varchar(255) DEFAULT NULL,
  `date_service` date DEFAULT NULL,
  `time_service` time DEFAULT NULL,
  `hospital_id` int(11) DEFAULT NULL,
  `status` enum('inform','receive','departure','destination','hospital','complete') DEFAULT NULL,
  `ambulance_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `type` enum('infectious') DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date_receive` datetime DEFAULT NULL,
  `date_departure` datetime DEFAULT NULL,
  `date_destination` datetime DEFAULT NULL,
  `date_hopital` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infectious_patients`
--

LOCK TABLES `infectious_patients` WRITE;
/*!40000 ALTER TABLE `infectious_patients` DISABLE KEYS */;
/*!40000 ALTER TABLE `infectious_patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infectious_tool`
--

DROP TABLE IF EXISTS `infectious_tool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `infectious_tool` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `infectious_id` int(11) DEFAULT NULL,
  `tool_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infectious_tool`
--

LOCK TABLES `infectious_tool` WRITE;
/*!40000 ALTER TABLE `infectious_tool` DISABLE KEYS */;
/*!40000 ALTER TABLE `infectious_tool` ENABLE KEYS */;
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
-- Table structure for table `non_emergency_patients`
--

DROP TABLE IF EXISTS `non_emergency_patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `non_emergency_patients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_lastname` varchar(255) DEFAULT NULL,
  `sex` enum('man','female','not_specified') DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `landmark` varchar(255) DEFAULT NULL,
  `lng` varchar(255) DEFAULT NULL,
  `lat` varchar(255) DEFAULT NULL,
  `symptom` varchar(255) DEFAULT NULL,
  `disease` varchar(255) DEFAULT NULL,
  `drug_allergy` varchar(255) DEFAULT NULL,
  `doctor` varchar(255) DEFAULT NULL,
  `date_service` datetime DEFAULT NULL,
  `time_service` time DEFAULT NULL,
  `hospital_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `age` varchar(255) DEFAULT NULL,
  `id_card` varchar(255) DEFAULT NULL,
  `status` enum('inform','receive','departure','destination','hospital','complete') DEFAULT NULL,
  `ambulance_id` int(11) DEFAULT NULL,
  `type` enum('non_emergency') DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date_receive` datetime DEFAULT NULL,
  `date_inform` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `non_emergency_patients`
--

LOCK TABLES `non_emergency_patients` WRITE;
/*!40000 ALTER TABLE `non_emergency_patients` DISABLE KEYS */;
/*!40000 ALTER TABLE `non_emergency_patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `non_emergency_tool`
--

DROP TABLE IF EXISTS `non_emergency_tool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `non_emergency_tool` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `non_emergency_id` int(11) DEFAULT NULL,
  `tool_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `non_emergency_tool`
--

LOCK TABLES `non_emergency_tool` WRITE;
/*!40000 ALTER TABLE `non_emergency_tool` DISABLE KEYS */;
/*!40000 ALTER TABLE `non_emergency_tool` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `symptom`
--

LOCK TABLES `symptom` WRITE;
/*!40000 ALTER TABLE `symptom` DISABLE KEYS */;
INSERT INTO `symptom` VALUES
(44,'เธเธงเธ”เธซเธฅเธฑเธ'),
(45,'เน€เธเนเธเธซเธเนเธฒเธญเธ'),
(46,'เธเธงเธ”เธ•เนเธเธเธญ'),
(47,'เธเธงเธ”เธ—เนเธญเธ'),
(48,'เธญเธงเธฑเธขเธงเธฐเธเธดเธ”เธฃเธนเธ'),
(51,'เนเธเธฅเธ–เธฅเธญเธ'),
(52,'เนเธเธฅเธเธเธเนเธณ'),
(53,'เธเธฒเธ”เนเธเธฅเน€เธเธดเธ”'),
(54,'เธญเธฒเธเธฒเธฃเธเนเธณเนเธ'),
(55,'เน€เธงเธตเธขเธเธจเธตเธฃเธฉเธฐ'),
(56,'เธซเธเนเธฒเธกเธทเธ”เธซเธฃเธทเธญเน€เธเนเธเธฅเธก'),
(57,'เธเธฃเธฐเธ”เธนเธเธซเธฑเธเธซเธฃเธทเธญเธฃเนเธฒเธง ');
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
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `symptom_tool`
--

LOCK TABLES `symptom_tool` WRITE;
/*!40000 ALTER TABLE `symptom_tool` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `student_id` int(8) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `password` varchar(255) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `view_ambulance_tool`
--

DROP TABLE IF EXISTS `view_ambulance_tool`;
/*!50001 DROP VIEW IF EXISTS `view_ambulance_tool`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_ambulance_tool` AS SELECT
 1 AS `id`,
  1 AS `tool_id`,
  1 AS `ambulance_id`,
  1 AS `tool_name`,
  1 AS `ambulance_registration`,
  1 AS `driver_name` */;
SET character_set_client = @saved_cs_client;

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
  1 AS `case_landmark`,
  1 AS `case_breathing`,
  1 AS `case_other_symptom`,
  1 AS `case_status`,
  1 AS `user_id`,
  1 AS `member_id`,
  1 AS `case_status_notification`,
  1 AS `case_type`,
  1 AS `case_tel`,
  1 AS `case_name`,
  1 AS `date_receive`,
  1 AS `case_lat`,
  1 AS `case_lng`,
  1 AS `ambulance_id`,
  1 AS `user_name`,
  1 AS `user_lastname`,
  1 AS `driver_name`,
  1 AS `ambulance_registration` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_case_exacerbation_infectious_none_emergency`
--

DROP TABLE IF EXISTS `view_case_exacerbation_infectious_none_emergency`;
/*!50001 DROP VIEW IF EXISTS `view_case_exacerbation_infectious_none_emergency`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_case_exacerbation_infectious_none_emergency` AS SELECT
 1 AS `id`,
  1 AS `date_receive`,
  1 AS `type`,
  1 AS `tel`,
  1 AS `ambulance_id`,
  1 AS `status` */;
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
-- Temporary table structure for view `view_case_tool`
--

DROP TABLE IF EXISTS `view_case_tool`;
/*!50001 DROP VIEW IF EXISTS `view_case_tool`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_case_tool` AS SELECT
 1 AS `id`,
  1 AS `case_data_id`,
  1 AS `tool_id`,
  1 AS `tool_name` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_exacerbation_ambulance`
--

DROP TABLE IF EXISTS `view_exacerbation_ambulance`;
/*!50001 DROP VIEW IF EXISTS `view_exacerbation_ambulance`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_exacerbation_ambulance` AS SELECT
 1 AS `id`,
  1 AS `name_lastname`,
  1 AS `age`,
  1 AS `id_card`,
  1 AS `drug_allergy`,
  1 AS `prescription_drugs`,
  1 AS `sex`,
  1 AS `date_incident`,
  1 AS `time_incident`,
  1 AS `location_incident`,
  1 AS `symptom`,
  1 AS `period`,
  1 AS `assistance`,
  1 AS `address`,
  1 AS `landmarks`,
  1 AS `lat`,
  1 AS `lng`,
  1 AS `name_lastname_Informer`,
  1 AS `relationship`,
  1 AS `tel`,
  1 AS `member_id`,
  1 AS `ambulance_id`,
  1 AS `status`,
  1 AS `violence`,
  1 AS `type`,
  1 AS `user_id`,
  1 AS `date_receive`,
  1 AS `ambulance_registration`,
  1 AS `ambulance_driver_name`,
  1 AS `user_name`,
  1 AS `user_lastname` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_exacerbation_ambulance_user`
--

DROP TABLE IF EXISTS `view_exacerbation_ambulance_user`;
/*!50001 DROP VIEW IF EXISTS `view_exacerbation_ambulance_user`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_exacerbation_ambulance_user` AS SELECT
 1 AS `id`,
  1 AS `name_lastname`,
  1 AS `age`,
  1 AS `id_card`,
  1 AS `drug_allergy`,
  1 AS `prescription_drugs`,
  1 AS `sex`,
  1 AS `date_incident`,
  1 AS `time_incident`,
  1 AS `location_incident`,
  1 AS `symptom`,
  1 AS `period`,
  1 AS `assistance`,
  1 AS `address`,
  1 AS `landmarks`,
  1 AS `lat`,
  1 AS `lng`,
  1 AS `name_lastname_Informer`,
  1 AS `relationship`,
  1 AS `tel`,
  1 AS `member_id`,
  1 AS `ambulance_id`,
  1 AS `status`,
  1 AS `violence`,
  1 AS `type`,
  1 AS `user_id`,
  1 AS `date_receive`,
  1 AS `date_inform`,
  1 AS `ambulance_registration`,
  1 AS `ambulance_driver_name`,
  1 AS `user_name`,
  1 AS `user_lastname` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_exacerbation_tool`
--

DROP TABLE IF EXISTS `view_exacerbation_tool`;
/*!50001 DROP VIEW IF EXISTS `view_exacerbation_tool`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_exacerbation_tool` AS SELECT
 1 AS `id`,
  1 AS `exacerbation_id`,
  1 AS `tool_id`,
  1 AS `tool_name` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_infectious_hospital_ambulance`
--

DROP TABLE IF EXISTS `view_infectious_hospital_ambulance`;
/*!50001 DROP VIEW IF EXISTS `view_infectious_hospital_ambulance`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_infectious_hospital_ambulance` AS SELECT
 1 AS `id`,
  1 AS `name_lastname`,
  1 AS `age`,
  1 AS `id_card`,
  1 AS `sex`,
  1 AS `tel`,
  1 AS `address`,
  1 AS `landmark`,
  1 AS `lat`,
  1 AS `lng`,
  1 AS `name_disease`,
  1 AS `symptom`,
  1 AS `period`,
  1 AS `date_service`,
  1 AS `time_service`,
  1 AS `hospital_id`,
  1 AS `status`,
  1 AS `ambulance_id`,
  1 AS `member_id`,
  1 AS `type`,
  1 AS `user_id`,
  1 AS `date_receive`,
  1 AS `date_departure`,
  1 AS `date_destination`,
  1 AS `date_hopital`,
  1 AS `hospital_name`,
  1 AS `ambulance_registration`,
  1 AS `ambulance_driver_name`,
  1 AS `user_name`,
  1 AS `user_lastname` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_infectious_tool`
--

DROP TABLE IF EXISTS `view_infectious_tool`;
/*!50001 DROP VIEW IF EXISTS `view_infectious_tool`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_infectious_tool` AS SELECT
 1 AS `id`,
  1 AS `infectious_id`,
  1 AS `tool_id`,
  1 AS `tool_name` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_non_emergancy_patiens_hospital`
--

DROP TABLE IF EXISTS `view_non_emergancy_patiens_hospital`;
/*!50001 DROP VIEW IF EXISTS `view_non_emergancy_patiens_hospital`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_non_emergancy_patiens_hospital` AS SELECT
 1 AS `id`,
  1 AS `name_lastname`,
  1 AS `sex`,
  1 AS `tel`,
  1 AS `address`,
  1 AS `landmark`,
  1 AS `lng`,
  1 AS `lat`,
  1 AS `symptom`,
  1 AS `disease`,
  1 AS `drug_allergy`,
  1 AS `doctor`,
  1 AS `date_service`,
  1 AS `time_service`,
  1 AS `hospital_id`,
  1 AS `member_id`,
  1 AS `age`,
  1 AS `id_card`,
  1 AS `status`,
  1 AS `ambulance_id`,
  1 AS `type`,
  1 AS `user_id`,
  1 AS `date_receive`,
  1 AS `date_inform`,
  1 AS `hospital_name`,
  1 AS `ambulance_registration`,
  1 AS `ambulance_driver_name`,
  1 AS `user_name`,
  1 AS `user_lastname` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_non_emergency_tool`
--

DROP TABLE IF EXISTS `view_non_emergency_tool`;
/*!50001 DROP VIEW IF EXISTS `view_non_emergency_tool`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_non_emergency_tool` AS SELECT
 1 AS `id`,
  1 AS `non_emergency_id`,
  1 AS `tool_id`,
  1 AS `tool_name` */;
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
-- Final view structure for view `view_ambulance_tool`
--

/*!50001 DROP VIEW IF EXISTS `view_ambulance_tool`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_ambulance_tool` AS select `ambulance_tool`.`id` AS `id`,`ambulance_tool`.`tool_id` AS `tool_id`,`ambulance_tool`.`ambulance_id` AS `ambulance_id`,`tool`.`tool_name` AS `tool_name`,`ambulance`.`ambulance_registration` AS `ambulance_registration`,`ambulance`.`driver_name` AS `driver_name` from ((`ambulance_tool` left join `tool` on(`ambulance_tool`.`tool_id` = `tool`.`id`)) left join `ambulance` on(`ambulance_tool`.`ambulance_id` = `ambulance`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

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
/*!50001 VIEW `view_case` AS select `case_data`.`id` AS `id`,`case_data`.`case_number` AS `case_number`,`case_data`.`case_landmark` AS `case_landmark`,`case_data`.`case_breathing` AS `case_breathing`,`case_data`.`case_other_symptom` AS `case_other_symptom`,`case_data`.`case_status` AS `case_status`,`case_data`.`user_id` AS `user_id`,`case_data`.`member_id` AS `member_id`,`case_data`.`case_status_notification` AS `case_status_notification`,`case_data`.`case_type` AS `case_type`,`case_data`.`case_tel` AS `case_tel`,`case_data`.`case_name` AS `case_name`,`case_data`.`date_receive` AS `date_receive`,`case_data`.`case_lat` AS `case_lat`,`case_data`.`case_lng` AS `case_lng`,`case_data`.`ambulance_id` AS `ambulance_id`,`user`.`user_name` AS `user_name`,`user`.`user_lastname` AS `user_lastname`,`ambulance`.`driver_name` AS `driver_name`,`ambulance`.`ambulance_registration` AS `ambulance_registration` from ((`case_data` left join `user` on(`user`.`id` = `case_data`.`user_id`)) left join `ambulance` on(`ambulance`.`id` = `case_data`.`ambulance_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_case_exacerbation_infectious_none_emergency`
--

/*!50001 DROP VIEW IF EXISTS `view_case_exacerbation_infectious_none_emergency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_case_exacerbation_infectious_none_emergency` AS (select `exacerbation`.`id` AS `id`,`exacerbation`.`date_receive` AS `date_receive`,`exacerbation`.`type` AS `type`,`exacerbation`.`tel` AS `tel`,`exacerbation`.`ambulance_id` AS `ambulance_id`,`exacerbation`.`status` AS `status` from `exacerbation`) union all (select `case_data`.`id` AS `id`,`case_data`.`date_receive` AS `date_receive`,`case_data`.`case_type` AS `type`,`case_data`.`case_tel` AS `tel`,`case_data`.`ambulance_id` AS `ambulance_id`,`case_data`.`case_status` AS `status` from `case_data`) union all (select `infectious_patients`.`id` AS `id`,`infectious_patients`.`date_receive` AS `date_receive`,`infectious_patients`.`type` AS `type`,`infectious_patients`.`tel` AS `tel`,`infectious_patients`.`ambulance_id` AS `ambulance_id`,`infectious_patients`.`status` AS `status` from `infectious_patients`) union all (select `non_emergency_patients`.`id` AS `id`,`non_emergency_patients`.`date_receive` AS `date_receive`,`non_emergency_patients`.`type` AS `type`,`non_emergency_patients`.`tel` AS `tel`,`non_emergency_patients`.`ambulance_id` AS `ambulance_id`,`non_emergency_patients`.`status` AS `status` from `non_emergency_patients`) */;
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
-- Final view structure for view `view_case_tool`
--

/*!50001 DROP VIEW IF EXISTS `view_case_tool`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_case_tool` AS select `case_data_tool`.`id` AS `id`,`case_data_tool`.`case_data_id` AS `case_data_id`,`case_data_tool`.`tool_id` AS `tool_id`,`tool`.`tool_name` AS `tool_name` from (`case_data_tool` left join `tool` on(`tool`.`id` = `case_data_tool`.`tool_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_exacerbation_ambulance`
--

/*!50001 DROP VIEW IF EXISTS `view_exacerbation_ambulance`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_exacerbation_ambulance` AS select `exacerbation`.`id` AS `id`,`exacerbation`.`name_lastname` AS `name_lastname`,`exacerbation`.`age` AS `age`,`exacerbation`.`id_card` AS `id_card`,`exacerbation`.`drug_allergy` AS `drug_allergy`,`exacerbation`.`prescription_drugs` AS `prescription_drugs`,`exacerbation`.`sex` AS `sex`,`exacerbation`.`date_incident` AS `date_incident`,`exacerbation`.`time_incident` AS `time_incident`,`exacerbation`.`location_incident` AS `location_incident`,`exacerbation`.`symptom` AS `symptom`,`exacerbation`.`period` AS `period`,`exacerbation`.`assistance` AS `assistance`,`exacerbation`.`address` AS `address`,`exacerbation`.`landmarks` AS `landmarks`,`exacerbation`.`lat` AS `lat`,`exacerbation`.`lng` AS `lng`,`exacerbation`.`name_lastname_Informer` AS `name_lastname_Informer`,`exacerbation`.`relationship` AS `relationship`,`exacerbation`.`tel` AS `tel`,`exacerbation`.`member_id` AS `member_id`,`exacerbation`.`ambulance_id` AS `ambulance_id`,`exacerbation`.`status` AS `status`,`exacerbation`.`violence` AS `violence`,`exacerbation`.`type` AS `type`,`exacerbation`.`user_id` AS `user_id`,`exacerbation`.`date_receive` AS `date_receive`,`ambulance`.`ambulance_registration` AS `ambulance_registration`,`ambulance`.`driver_name` AS `ambulance_driver_name`,`user`.`user_name` AS `user_name`,`user`.`user_lastname` AS `user_lastname` from ((`exacerbation` left join `ambulance` on(`exacerbation`.`ambulance_id` = `ambulance`.`id`)) left join `user` on(`exacerbation`.`user_id` = `user`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_exacerbation_ambulance_user`
--

/*!50001 DROP VIEW IF EXISTS `view_exacerbation_ambulance_user`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_exacerbation_ambulance_user` AS select `exacerbation`.`id` AS `id`,`exacerbation`.`name_lastname` AS `name_lastname`,`exacerbation`.`age` AS `age`,`exacerbation`.`id_card` AS `id_card`,`exacerbation`.`drug_allergy` AS `drug_allergy`,`exacerbation`.`prescription_drugs` AS `prescription_drugs`,`exacerbation`.`sex` AS `sex`,`exacerbation`.`date_incident` AS `date_incident`,`exacerbation`.`time_incident` AS `time_incident`,`exacerbation`.`location_incident` AS `location_incident`,`exacerbation`.`symptom` AS `symptom`,`exacerbation`.`period` AS `period`,`exacerbation`.`assistance` AS `assistance`,`exacerbation`.`address` AS `address`,`exacerbation`.`landmarks` AS `landmarks`,`exacerbation`.`lat` AS `lat`,`exacerbation`.`lng` AS `lng`,`exacerbation`.`name_lastname_Informer` AS `name_lastname_Informer`,`exacerbation`.`relationship` AS `relationship`,`exacerbation`.`tel` AS `tel`,`exacerbation`.`member_id` AS `member_id`,`exacerbation`.`ambulance_id` AS `ambulance_id`,`exacerbation`.`status` AS `status`,`exacerbation`.`violence` AS `violence`,`exacerbation`.`type` AS `type`,`exacerbation`.`user_id` AS `user_id`,`exacerbation`.`date_receive` AS `date_receive`,`exacerbation`.`date_inform` AS `date_inform`,`ambulance`.`ambulance_registration` AS `ambulance_registration`,`ambulance`.`driver_name` AS `ambulance_driver_name`,`user`.`user_name` AS `user_name`,`user`.`user_lastname` AS `user_lastname` from ((`exacerbation` left join `ambulance` on(`exacerbation`.`ambulance_id` = `ambulance`.`id`)) left join `user` on(`exacerbation`.`user_id` = `user`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_exacerbation_tool`
--

/*!50001 DROP VIEW IF EXISTS `view_exacerbation_tool`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_exacerbation_tool` AS select `exacerbation_tool`.`id` AS `id`,`exacerbation_tool`.`exacerbation_id` AS `exacerbation_id`,`exacerbation_tool`.`tool_id` AS `tool_id`,`tool`.`tool_name` AS `tool_name` from (`exacerbation_tool` left join `tool` on(`tool`.`id` = `exacerbation_tool`.`tool_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_infectious_hospital_ambulance`
--

/*!50001 DROP VIEW IF EXISTS `view_infectious_hospital_ambulance`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_infectious_hospital_ambulance` AS select `infectious_patients`.`id` AS `id`,`infectious_patients`.`name_lastname` AS `name_lastname`,`infectious_patients`.`age` AS `age`,`infectious_patients`.`id_card` AS `id_card`,`infectious_patients`.`sex` AS `sex`,`infectious_patients`.`tel` AS `tel`,`infectious_patients`.`address` AS `address`,`infectious_patients`.`landmark` AS `landmark`,`infectious_patients`.`lat` AS `lat`,`infectious_patients`.`lng` AS `lng`,`infectious_patients`.`name_disease` AS `name_disease`,`infectious_patients`.`symptom` AS `symptom`,`infectious_patients`.`period` AS `period`,`infectious_patients`.`date_service` AS `date_service`,`infectious_patients`.`time_service` AS `time_service`,`infectious_patients`.`hospital_id` AS `hospital_id`,`infectious_patients`.`status` AS `status`,`infectious_patients`.`ambulance_id` AS `ambulance_id`,`infectious_patients`.`member_id` AS `member_id`,`infectious_patients`.`type` AS `type`,`infectious_patients`.`user_id` AS `user_id`,`infectious_patients`.`date_receive` AS `date_receive`,`infectious_patients`.`date_departure` AS `date_departure`,`infectious_patients`.`date_destination` AS `date_destination`,`infectious_patients`.`date_hopital` AS `date_hopital`,`hospital`.`hospital_name` AS `hospital_name`,`ambulance`.`ambulance_registration` AS `ambulance_registration`,`ambulance`.`driver_name` AS `ambulance_driver_name`,`user`.`user_name` AS `user_name`,`user`.`user_lastname` AS `user_lastname` from (((`infectious_patients` left join `hospital` on(`infectious_patients`.`hospital_id` = `hospital`.`id`)) left join `ambulance` on(`infectious_patients`.`ambulance_id` = `ambulance`.`id`)) left join `user` on(`user`.`id` = `infectious_patients`.`user_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_infectious_tool`
--

/*!50001 DROP VIEW IF EXISTS `view_infectious_tool`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_infectious_tool` AS select `infectious_tool`.`id` AS `id`,`infectious_tool`.`infectious_id` AS `infectious_id`,`infectious_tool`.`tool_id` AS `tool_id`,`tool`.`tool_name` AS `tool_name` from (`infectious_tool` left join `tool` on(`tool`.`id` = `infectious_tool`.`tool_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_non_emergancy_patiens_hospital`
--

/*!50001 DROP VIEW IF EXISTS `view_non_emergancy_patiens_hospital`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_non_emergancy_patiens_hospital` AS select `non_emergency_patients`.`id` AS `id`,`non_emergency_patients`.`name_lastname` AS `name_lastname`,`non_emergency_patients`.`sex` AS `sex`,`non_emergency_patients`.`tel` AS `tel`,`non_emergency_patients`.`address` AS `address`,`non_emergency_patients`.`landmark` AS `landmark`,`non_emergency_patients`.`lng` AS `lng`,`non_emergency_patients`.`lat` AS `lat`,`non_emergency_patients`.`symptom` AS `symptom`,`non_emergency_patients`.`disease` AS `disease`,`non_emergency_patients`.`drug_allergy` AS `drug_allergy`,`non_emergency_patients`.`doctor` AS `doctor`,`non_emergency_patients`.`date_service` AS `date_service`,`non_emergency_patients`.`time_service` AS `time_service`,`non_emergency_patients`.`hospital_id` AS `hospital_id`,`non_emergency_patients`.`member_id` AS `member_id`,`non_emergency_patients`.`age` AS `age`,`non_emergency_patients`.`id_card` AS `id_card`,`non_emergency_patients`.`status` AS `status`,`non_emergency_patients`.`ambulance_id` AS `ambulance_id`,`non_emergency_patients`.`type` AS `type`,`non_emergency_patients`.`user_id` AS `user_id`,`non_emergency_patients`.`date_receive` AS `date_receive`,`non_emergency_patients`.`date_inform` AS `date_inform`,`hospital`.`hospital_name` AS `hospital_name`,`ambulance`.`ambulance_registration` AS `ambulance_registration`,`ambulance`.`driver_name` AS `ambulance_driver_name`,`user`.`user_name` AS `user_name`,`user`.`user_lastname` AS `user_lastname` from (((`non_emergency_patients` left join `hospital` on(`non_emergency_patients`.`hospital_id` = `hospital`.`id`)) left join `ambulance` on(`non_emergency_patients`.`ambulance_id` = `ambulance`.`id`)) left join `user` on(`user`.`id` = `non_emergency_patients`.`user_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_non_emergency_tool`
--

/*!50001 DROP VIEW IF EXISTS `view_non_emergency_tool`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_non_emergency_tool` AS select `non_emergency_tool`.`id` AS `id`,`non_emergency_tool`.`non_emergency_id` AS `non_emergency_id`,`non_emergency_tool`.`tool_id` AS `tool_id`,`tool`.`tool_name` AS `tool_name` from (`non_emergency_tool` left join `tool` on(`tool`.`id` = `non_emergency_tool`.`tool_id`)) */;
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

-- Dump completed on 2024-10-22 15:47:27
