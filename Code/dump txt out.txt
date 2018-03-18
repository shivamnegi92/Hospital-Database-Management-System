-- MySQL dump 10.13  Distrib 5.7.12, for Win32 (AMD64)
--
-- Host: 127.0.0.1    Database: hospitalmanagementsystem
-- ------------------------------------------------------
-- Server version	5.7.15-log

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `person_id` int(11) NOT NULL,
  `address_line_2` varchar(45) DEFAULT NULL,
  `address_line_3` varchar(45) DEFAULT NULL,
  `address_line_1` varchar(45) DEFAULT NULL,
  `ZIPCode` int(11) DEFAULT NULL,
  PRIMARY KEY (`person_id`),
  UNIQUE KEY `person_id_UNIQUE` (`person_id`),
  KEY `person address_idx` (`person_id`),
  CONSTRAINT `person address` FOREIGN KEY (`person_id`) REFERENCES `person_personal` (`idPerson`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'20c','Boston','shillman Way',2120),(2,'29c','Boston','Montana Way',2210),(3,'29b','Boston','Mcgreevy Way',29221),(4,'221','Boston','Willams Way',29221),(5,'29c','Boston','Tremount',2210),(6,'21','Boston','Peterborough',2210),(7,'22','Boston','Johnwalkier',2210),(8,'29c','Boston','Valkayrie',2210),(9,'99','Boston','Michel',29221),(10,'66','Boston','Willimson',29221);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill` (
  `Amount` int(40) DEFAULT NULL,
  `date_of_event` datetime DEFAULT NULL,
  `bill_ID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`bill_ID`),
  UNIQUE KEY `bill_ID_UNIQUE` (`bill_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES (900,'2016-12-11 00:00:00',1),(100,'2016-11-11 00:00:00',2),(90,'2016-12-11 00:00:00',3),(89,'2016-11-12 00:00:00',4),(100,'2016-09-11 00:00:00',5),(99,'2016-11-06 00:00:00',6),(100,'2016-11-07 00:00:00',7),(100,'2016-11-08 00:00:00',8),(100,'2016-12-09 00:00:00',9),(100,'2016-11-11 00:00:00',10),(100,'2016-12-09 00:00:00',11),(456,'2016-12-09 00:00:00',12),(100,'2016-12-09 00:00:00',13),(100,'2016-12-09 00:00:00',15),(120,'2016-12-09 00:00:00',16);
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_per_case`
--

DROP TABLE IF EXISTS `bill_per_case`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_per_case` (
  `case_id` int(11) NOT NULL,
  `bill_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`case_id`),
  UNIQUE KEY `case_id_UNIQUE` (`case_id`),
  UNIQUE KEY `bill_id_UNIQUE` (`bill_id`),
  CONSTRAINT `bill` FOREIGN KEY (`bill_id`) REFERENCES `bill` (`bill_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `bill_per_Case fk patient` FOREIGN KEY (`case_id`) REFERENCES `patient` (`case_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_per_case`
--

LOCK TABLES `bill_per_case` WRITE;
/*!40000 ALTER TABLE `bill_per_case` DISABLE KEYS */;
INSERT INTO `bill_per_case` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(15,15),(16,16);
/*!40000 ALTER TABLE `bill_per_case` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `block`
--

DROP TABLE IF EXISTS `block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `block` (
  `idBlock` int(11) NOT NULL,
  `block_name` varchar(45) DEFAULT NULL,
  `floor` int(11) DEFAULT NULL,
  PRIMARY KEY (`idBlock`),
  UNIQUE KEY `idBlock_UNIQUE` (`idBlock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `block`
--

LOCK TABLES `block` WRITE;
/*!40000 ALTER TABLE `block` DISABLE KEYS */;
INSERT INTO `block` VALUES (1,'Emergency ',1),(2,'Public',2),(3,'Private',3),(4,'Emergecy',4),(5,'Public',5),(6,'Private',6),(7,'Private',1),(8,'Public',2),(9,'Public',3),(10,'Private',4),(11,'Public',5),(12,'Pubic',6),(13,'Private',1),(14,'VIP',1);
/*!40000 ALTER TABLE `block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `bloodgroupdetail`
--

DROP TABLE IF EXISTS `bloodgroupdetail`;
/*!50001 DROP VIEW IF EXISTS `bloodgroupdetail`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `bloodgroupdetail` AS SELECT 
 1 AS `idperson`,
 1 AS `concat(p.person_fname,p.person_lname)`,
 1 AS `address_line_1`,
 1 AS `address_line_2`,
 1 AS `address_line_3`,
 1 AS `zipcode`,
 1 AS `bloodgroup`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `department_name` varchar(22) NOT NULL,
  `head_doctor_id` int(22) NOT NULL,
  PRIMARY KEY (`department_name`,`head_doctor_id`),
  KEY `fk_department_doctor1_idx` (`head_doctor_id`),
  CONSTRAINT `fk_department_doctor1` FOREIGN KEY (`head_doctor_id`) REFERENCES `doctor` (`idDoctor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('Anesthesia',1),('Dentistry Dept',2),('Emergency',3),('Gynecology Dept',4),('Internal Diseases',5),('Nursing',6),('Pediatrics Dept',7);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctor` (
  `idDoctor` int(22) NOT NULL,
  `rating` varchar(45) DEFAULT NULL,
  `experience(years)` int(22) DEFAULT NULL,
  `trained_in` varchar(45) DEFAULT NULL,
  `case_status` varchar(45) NOT NULL,
  PRIMARY KEY (`idDoctor`),
  UNIQUE KEY `idDoctor_UNIQUE` (`idDoctor`),
  CONSTRAINT `doctor department` FOREIGN KEY (`idDoctor`) REFERENCES `staff` (`E_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (1,'3',4,'Cardiology','ON CASE'),(2,'4',4,'Cardiovascular surgery','OFF CASE'),(3,'5',12,'Anesthology ','OFF CASE'),(4,'3',3,'Emergency medicine','ON CASE'),(5,'3',2,'Paediatric cardiology','ON CASE'),(6,'4',3,'Dental Science','OFF CASE'),(7,'3',4,'Surgery','ON CASE'),(15,'3',12,'Pediatric Infection Analysis','ON CASE'),(16,'3',12,'Heart Surgery','OFF CASE');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment_list`
--

DROP TABLE IF EXISTS `equipment_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipment_list` (
  `equipment_id` int(11) NOT NULL,
  `equipment_name` varchar(45) DEFAULT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`equipment_id`),
  UNIQUE KEY `equipment_id_UNIQUE` (`equipment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment_list`
--

LOCK TABLES `equipment_list` WRITE;
/*!40000 ALTER TABLE `equipment_list` DISABLE KEYS */;
INSERT INTO `equipment_list` VALUES (1,'XRAY','NA'),(2,'Surgery Tools','Available'),(3,'MRI Scanner','Available'),(4,'MRI Scanner 2','NA'),(5,'Stretcher ','Available'),(6,'CT SCANNER','NA'),(7,'MRI Scanner3','NA'),(8,'XRAY 2','NA'),(9,'Heart Monitor','NA');
/*!40000 ALTER TABLE `equipment_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inpatient`
--

DROP TABLE IF EXISTS `inpatient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inpatient` (
  `case_id` int(11) NOT NULL,
  `disease_name` varchar(45) DEFAULT NULL,
  `doc_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`case_id`),
  UNIQUE KEY `case_id_UNIQUE` (`case_id`),
  KEY `doc_key_idx` (`doc_id`),
  CONSTRAINT `case_key` FOREIGN KEY (`case_id`) REFERENCES `patient` (`case_id`) ON UPDATE CASCADE,
  CONSTRAINT `doc_key` FOREIGN KEY (`doc_id`) REFERENCES `doctor` (`idDoctor`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inpatient`
--

LOCK TABLES `inpatient` WRITE;
/*!40000 ALTER TABLE `inpatient` DISABLE KEYS */;
INSERT INTO `inpatient` VALUES (1,'Asthama',1),(2,'Cough',5),(3,'Menangitis',1),(4,'Migrain',1),(5,'Ulcer Surgery',5),(12,'Cold',5),(15,'Infection',15);
/*!40000 ALTER TABLE `inpatient` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `hospitalmanagementsystem`.`inpatient_AFTER_INSERT`
AFTER INSERT ON `hospitalmanagementsystem`.`inpatient`
FOR EACH ROW
BEGIN


set @doc_id=new.doc_id;

UPDATE  hospitalmanagementsystem.doctor SET case_status='ON CASE' where idDoctor=@doc_id;



END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `hospitalmanagementsystem`.`inpatient_AFTER_UPDATE`
AFTER UPDATE ON `hospitalmanagementsystem`.`inpatient`
FOR EACH ROW
BEGIN

set @doc_id=new.doc_id;

UPDATE  hospitalmanagementsystem.doctor SET case_status='ON CASE' where idDoctor=@doc_id;


END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `list_lung_transplant`
--

DROP TABLE IF EXISTS `list_lung_transplant`;
/*!50001 DROP VIEW IF EXISTS `list_lung_transplant`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `list_lung_transplant` AS SELECT 
 1 AS `procedure_name`,
 1 AS `person_Fname`,
 1 AS `person_Lname`,
 1 AS `case_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `listcardiosurgery`
--

DROP TABLE IF EXISTS `listcardiosurgery`;
/*!50001 DROP VIEW IF EXISTS `listcardiosurgery`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `listcardiosurgery` AS SELECT 
 1 AS `procedure_name`,
 1 AS `person_Fname`,
 1 AS `person_Lname`,
 1 AS `case_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `outpatient`
--

DROP TABLE IF EXISTS `outpatient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `outpatient` (
  `doctor_id` int(45) NOT NULL,
  `case_id` int(45) NOT NULL,
  `procedure_name` varchar(45) DEFAULT NULL,
  `equipment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`doctor_id`,`case_id`),
  UNIQUE KEY `equipment_id_UNIQUE` (`equipment_id`),
  KEY `procedure_treatment_idx` (`case_id`),
  CONSTRAINT `equipment_outpatient` FOREIGN KEY (`equipment_id`) REFERENCES `equipment_list` (`equipment_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `procedure_employee` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`idDoctor`) ON UPDATE CASCADE,
  CONSTRAINT `procedure_treatment` FOREIGN KEY (`case_id`) REFERENCES `patient` (`case_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outpatient`
--

LOCK TABLES `outpatient` WRITE;
/*!40000 ALTER TABLE `outpatient` DISABLE KEYS */;
INSERT INTO `outpatient` VALUES (2,6,'Lung Trans',1),(2,10,'Cardio Surgery',2),(4,9,'Lung Transplant',3),(7,7,'Bone Marrow Transplant',4),(7,8,'Cardio Surgery',5),(7,11,'Lung Surgery',6),(7,13,'Bone Marrow Transplant',7),(7,14,'Lung Transplant',8),(16,16,'Heart Transplant',9);
/*!40000 ALTER TABLE `outpatient` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `hospitalmanagementsystem`.`outpatient_AFTER_INSERT`
AFTER INSERT ON `hospitalmanagementsystem`.`outpatient`
FOR EACH ROW
BEGIN
set @newequipid=new.equipment_id;

UPDATE  hospitalmanagementsystem.equipment_list SET status='NA' where equipment_id=@newequipid;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `hospitalmanagementsystem`.`outpatient_AFTER_UPDATE`
AFTER UPDATE ON `hospitalmanagementsystem`.`outpatient`
FOR EACH ROW
BEGIN

set @newequipid=new.equipment_id;

UPDATE  hospitalmanagementsystem.equipment_list SET status='NA' where equipment_id=@newequipid;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient` (
  `person_id` int(11) NOT NULL,
  `case_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`case_id`,`person_id`),
  UNIQUE KEY `case_id_UNIQUE` (`case_id`),
  KEY `patientID` (`person_id`),
  CONSTRAINT `patientID` FOREIGN KEY (`person_id`) REFERENCES `person_personal` (`idPerson`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(15,15),(16,16);
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_details`
--

DROP TABLE IF EXISTS `payment_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_details` (
  `idpayment_details` int(11) NOT NULL,
  `card_no` int(35) DEFAULT NULL,
  `card_type` varchar(45) DEFAULT NULL,
  `expiery_date` datetime DEFAULT NULL,
  `person_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`idpayment_details`),
  KEY `person_personPaymentDetails_idx` (`person_ID`),
  CONSTRAINT `person_personPaymentDetails` FOREIGN KEY (`person_ID`) REFERENCES `person_personal` (`idPerson`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_details`
--

LOCK TABLES `payment_details` WRITE;
/*!40000 ALTER TABLE `payment_details` DISABLE KEYS */;
INSERT INTO `payment_details` VALUES (1,324234234,'Master Card','2018-09-22 00:00:00',1),(2,34324312,'VISA Card','2018-09-21 00:00:00',2),(3,32343453,'VISA Card','2018-09-11 00:00:00',3),(4,324234234,'Forex Card','2018-02-22 00:00:00',4),(5,342342122,'VISA Card','2018-01-11 00:00:00',5),(6,342342343,'FOREX Card','2018-01-12 00:00:00',6),(7,23423414,'VISA Card','2018-01-12 00:00:00',7),(8,332242312,'Master Card','2018-11-12 00:00:00',8),(9,324324242,'Master Card','2018-11-12 00:00:00',9),(15,343223423,'VISA CARD','2018-11-12 00:00:00',15);
/*!40000 ALTER TABLE `payment_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_med_record`
--

DROP TABLE IF EXISTS `person_med_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_med_record` (
  `idPerson` int(11) NOT NULL,
  `height(ft/in)` varchar(22) DEFAULT NULL,
  `weight(kgs)` int(11) DEFAULT NULL,
  `allergy` varchar(45) DEFAULT NULL,
  `sysbp` int(11) DEFAULT NULL,
  `dysbp` int(11) DEFAULT NULL,
  `bloodgroup` varchar(45) DEFAULT NULL,
  `dateupdated` datetime NOT NULL,
  PRIMARY KEY (`idPerson`,`dateupdated`),
  CONSTRAINT `idPerson` FOREIGN KEY (`idPerson`) REFERENCES `person_personal` (`idPerson`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_med_record`
--

LOCK TABLES `person_med_record` WRITE;
/*!40000 ALTER TABLE `person_med_record` DISABLE KEYS */;
INSERT INTO `person_med_record` VALUES (1,'5\'4',77,'Latex',81,122,'A+','2016-12-11 00:00:00'),(2,'5\'5',77,'Pollen',82,122,'B-','2016-11-11 00:00:00'),(3,'6\'2',55,'Shellfish',80,121,'O','2016-03-11 00:00:00'),(4,'5\'4',44,'Egg',81,122,'A+','2016-09-11 00:00:00'),(5,'5\'2',66,'Egg',81,121,'AB','2016-11-13 00:00:00'),(6,'5\'2',77,'Egg',88,120,'B-','2016-11-22 00:00:00'),(7,'5\'4',44,'Pollen',79,122,'A+','2016-11-19 00:00:00'),(8,'4\'8',66,'Pollen',88,124,'A+','2016-09-11 00:00:00'),(9,'5\'3',77,'Egg',81,123,'A+','2016-11-11 00:00:00'),(10,'5\'4',55,'Pollen',81,123,'B-','2016-10-11 00:00:00'),(11,'5\'4',55,'Pollen',81,123,'O','2016-10-11 00:00:00'),(12,'5\'4',44,'POLLEN',77,120,'O','2016-10-11 00:00:00'),(13,'5\'5',33,'Pollen',77,120,'O','2016-10-11 00:00:00'),(14,'5',33,'Milk',80,120,'A+','2016-10-11 00:00:00'),(15,'6',33,'Dust',90,130,'A+','2016-09-11 00:00:00');
/*!40000 ALTER TABLE `person_med_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_personal`
--

DROP TABLE IF EXISTS `person_personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_personal` (
  `idPerson` int(11) NOT NULL AUTO_INCREMENT,
  `person_FName` varchar(45) DEFAULT NULL,
  `person_LName` varchar(45) DEFAULT NULL,
  `person_age` int(22) DEFAULT NULL,
  `person_gender` varchar(1) DEFAULT NULL,
  `person_insuranceID` int(11) DEFAULT NULL,
  `person_contactNo` int(11) DEFAULT NULL,
  `person_email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idPerson`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='																				';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_personal`
--

LOCK TABLES `person_personal` WRITE;
/*!40000 ALTER TABLE `person_personal` DISABLE KEYS */;
INSERT INTO `person_personal` VALUES (1,'John','Peter',20,'M',423433242,23423224,'JohnPeter@yahoo.com'),(2,'Rice','Venere',24,'F',411113242,23342342,'rice@yahoo.com'),(3,'Michel','Penere',23,'F',423432444,33342342,'bakin@gmail.comm'),(4,'Robort','Sharma',23,'M',423432222,22323424,'robort@yahoo.com'),(5,'Kite','Snow',24,'F',423432423,23223424,'subhash@gmail.com'),(6,'Manish','Water',33,'M',423432542,33423424,'mandela@yahoo.com'),(7,'Willams','Timothy',23,'F',423432142,32423424,'william@gmail.com'),(8,'Tiger','Woods',33,'M',423432442,84423424,'tiger@gmail.com'),(9,'Bill','Gates',23,'M',423422242,83423424,'bill@microsoft.com'),(10,'Barak','Obama',24,'M',423432342,82423424,'barak@yahoo.com'),(11,'Anura','Singh',23,'M',423432423,81423424,'anura@yahoo.com'),(12,'Mohit','Ramaini',22,'M',433423342,31212334,'mohita@yahoo.com'),(13,'Murli','Kamni',23,'M',232434324,23434234,'manisha@yahoo.com'),(14,'Bill','Jackson',22,'F',342342343,31231232,'bill@yahoo.com'),(15,'Neeraj','Rajput',30,'M',454532523,32323223,'neeraj@yahoo.com'),(16,'Kate','Red',33,'F',636336366,34233243,'kateRed@yahoo.com');
/*!40000 ALTER TABLE `person_personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmacy`
--

DROP TABLE IF EXISTS `pharmacy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pharmacy` (
  `idMedicine` int(11) NOT NULL AUTO_INCREMENT,
  `nameMedicine` varchar(45) DEFAULT NULL,
  `drugAction` varchar(100) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `manufactureDate` date DEFAULT NULL,
  `expireIn_Months` int(11) DEFAULT NULL,
  PRIMARY KEY (`idMedicine`),
  UNIQUE KEY `idMedicine_UNIQUE` (`idMedicine`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmacy`
--

LOCK TABLES `pharmacy` WRITE;
/*!40000 ALTER TABLE `pharmacy` DISABLE KEYS */;
INSERT INTO `pharmacy` VALUES (1,'Norflox','Treat bacterial infections of the prostate or urinary tract ',40,'2016-11-12',4),(2,'Allegra','TREAT SNEEZING, EAR PAIN',50,'2016-11-10',5),(3,'Combliflame','Treat Toothache,Ear pain,Joint pain',40,'2015-11-10',6),(4,'Codeine',' TREAT SEVERE PAIN',50,'2016-10-12',7),(5,'Asprin','ANALGESIC',50,'2016-10-12',8),(6,'Chlorzoxazone ','ANTI-INFLAMMATORY/ MUSCLOSKELETAL DISORDER',40,'2016-09-12',2),(7,'Diclofenac Gel',' MUSCLOSKELETAL DISORDER',90,'2016-08-12',30),(8,'Acetaminophen','DIGESTIVE DISORDER',90,'2016-09-12',12),(15,'Dygene','Digestive Infection',99,'2016-12-01',12);
/*!40000 ALTER TABLE `pharmacy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `popular_medicine`
--

DROP TABLE IF EXISTS `popular_medicine`;
/*!50001 DROP VIEW IF EXISTS `popular_medicine`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `popular_medicine` AS SELECT 
 1 AS `Name of Medicine`,
 1 AS `Medicine ID`,
 1 AS `Number Of Purchases`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `prescription`
--

DROP TABLE IF EXISTS `prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prescription` (
  `Doses` varchar(45) DEFAULT NULL,
  `Prescription_id` int(11) NOT NULL AUTO_INCREMENT,
  `case_id` int(11) DEFAULT NULL,
  `id_medicine` int(11) DEFAULT NULL,
  PRIMARY KEY (`Prescription_id`),
  UNIQUE KEY `Prescription_id_UNIQUE` (`Prescription_id`),
  KEY `prescription_inpatient_idx` (`case_id`),
  KEY `prescription_pharmacy_idx` (`id_medicine`),
  CONSTRAINT `prescription_inpatient` FOREIGN KEY (`case_id`) REFERENCES `inpatient` (`case_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `prescription_pharmacy` FOREIGN KEY (`id_medicine`) REFERENCES `pharmacy` (`idMedicine`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription`
--

LOCK TABLES `prescription` WRITE;
/*!40000 ALTER TABLE `prescription` DISABLE KEYS */;
INSERT INTO `prescription` VALUES ('One per day',1,1,4),('One per day',2,2,2),('Twice per day Morning, Eve',3,3,2),('Twice per day Morning, Eve',4,4,1),('Twice per day Morning, Eve',5,5,2),('Twice per day, after Lunch, after Dinner',15,15,15);
/*!40000 ALTER TABLE `prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room` (
  `room_id` int(11) NOT NULL,
  `room_type` varchar(45) DEFAULT NULL,
  `nurse_id` int(11) DEFAULT NULL,
  `block_idBlock` int(11) NOT NULL,
  `availability` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`room_id`,`block_idBlock`),
  UNIQUE KEY `room_id_UNIQUE` (`room_id`),
  KEY `nurser room_idx` (`nurse_id`),
  KEY `fk_room_block1_idx` (`block_idBlock`),
  CONSTRAINT `fk_room_block1` FOREIGN KEY (`block_idBlock`) REFERENCES `block` (`idBlock`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `nurser room` FOREIGN KEY (`nurse_id`) REFERENCES `staff` (`E_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,'AC',8,1,'NA'),(2,'NonAC',8,2,'NA'),(3,'AC',8,3,'NA'),(4,'AC',8,4,'NA'),(5,'AC - Extra Bed',10,1,'NA'),(6,'AC - Extra Bed',10,2,'NA'),(7,'NonAC',10,3,'NA'),(8,'NonAC',8,4,'NA'),(9,'NonAC',8,1,'Available'),(10,'NonAC',10,3,'NA'),(14,'AC',10,14,'NA');
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff` (
  `E_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Department` varchar(45) DEFAULT NULL,
  `Role` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`E_ID`),
  CONSTRAINT `staff link staff personal` FOREIGN KEY (`E_ID`) REFERENCES `staff_personal` (`e_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Internal Disease','Doctor'),(2,'Surgery','Surgeon'),(3,'Anesthesia','Doctor'),(4,'Gynecology Dept','Doctor'),(5,'Pediatrics Dept','Doctor'),(6,'Dentistry Dept','Dentist'),(7,'Emergency Room','Surgeon'),(8,'Nursing','Nurse'),(9,'Logistics','Driver'),(10,'Nursing','Nurse'),(15,'Pediatrics Dept','Doctor'),(16,'Surgery','Surgeon');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_personal`
--

DROP TABLE IF EXISTS `staff_personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff_personal` (
  `e_id` int(11) NOT NULL AUTO_INCREMENT,
  `FName` varchar(45) DEFAULT NULL,
  `LName` varchar(45) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `contactNo` int(11) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `houseNo` varchar(45) DEFAULT NULL,
  `streetName` varchar(45) DEFAULT NULL,
  `cityName` varchar(45) DEFAULT NULL,
  `ZIP` int(11) DEFAULT NULL,
  PRIMARY KEY (`e_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_personal`
--

LOCK TABLES `staff_personal` WRITE;
/*!40000 ALTER TABLE `staff_personal` DISABLE KEYS */;
INSERT INTO `staff_personal` VALUES (1,'Robin','Wills',29,'M',787787878,'syahiu@yahoo.com','20c','shillman Way','Boston',2120),(2,'John','Skiller',33,'M',878787899,'skilng@yahoo.com','29c','Montana Way','Boston',2210),(3,'Ronit','Rajen',30,'M',787787879,'killlmn@yahoo.com','29b','Mcgreevy Way','Boston',29221),(4,'John','Snow',44,'M',98982080,'killlmn@yahoo.com','221','Willams Way','Boston',29221),(5,'Lalita','Manow',44,'M',98983080,'killlmn@yahoo.com','29c','Tremount','Boston',2210),(6,'Dinesh','Chowksey',42,'M',98984080,'ganesh.gege@gmail.com','21','Peterborough','Boston',2210),(7,'Mohit','Arora',21,'M',98983180,'genasd@gmail.com','22','Johnwalkier','Boston',2210),(8,'Anurag','Singh',33,'F',89778787,'asdasd@gmail.com','29c','Valkayrie','Boston',2210),(9,'Dinesh','Kalia',44,'M',77778787,'sadasdas@gmail.com','99','Michel','Boston',29221),(10,'Manish','Mahajan',55,'F',78778782,'sadasdsad@gmail.com','66','Willimson','Boston',29221),(15,'John','Snow',66,'M',78787323,'johnSnow@yahoo.com','88','Kitebury','Boston',2120),(16,'Pen','Smith',55,'M',72727727,'penSmith@yahoo.com','88','Peterbourough','Boston',21211);
/*!40000 ALTER TABLE `staff_personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stay`
--

DROP TABLE IF EXISTS `stay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stay` (
  `cid` int(11) NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `stay room_idx` (`room_id`),
  CONSTRAINT `stay outpatient` FOREIGN KEY (`cid`) REFERENCES `outpatient` (`case_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `stay room` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stay`
--

LOCK TABLES `stay` WRITE;
/*!40000 ALTER TABLE `stay` DISABLE KEYS */;
INSERT INTO `stay` VALUES (6,'2016-10-12 00:00:00','2016-11-12 00:00:00',1),(7,'2016-10-12 00:00:00','2016-11-12 00:00:00',2),(8,'2016-10-12 00:00:00','2016-11-12 00:00:00',3),(9,'2016-10-12 00:00:00','2016-11-12 00:00:00',4),(10,'2016-10-12 00:00:00','2016-11-12 00:00:00',5),(11,'2016-10-12 00:00:00','2016-12-12 00:00:00',6),(14,'2016-12-12 00:00:00','2016-12-22 00:00:00',10),(16,'2016-12-12 00:00:00','2016-12-20 00:00:00',14);
/*!40000 ALTER TABLE `stay` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `hospitalmanagementsystem`.`stay_AFTER_INSERT`
AFTER INSERT ON `hospitalmanagementsystem`.`stay`
FOR EACH ROW
BEGIN

set @room_id=new.room_id;

UPDATE  hospitalmanagementsystem.room SET availability='NA' where room_id=@room_id;




END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `hospitalmanagementsystem`.`stay_AFTER_UPDATE`
AFTER UPDATE ON `hospitalmanagementsystem`.`stay`
FOR EACH ROW
BEGIN

set @room_id=new.room_id;

UPDATE  hospitalmanagementsystem.room SET availability='NA' where room_id=@room_id;


END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'hospitalmanagementsystem'
--

--
-- Dumping routines for database 'hospitalmanagementsystem'
--
/*!50003 DROP PROCEDURE IF EXISTS `MaximumBill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `MaximumBill`(IN param1 int)
BEGIN

SELECT b.bill_id, b.date_of_event, b.amount, pt.person_id, pp.person_Fname, pp.person_Lname,pp.person_age,pp.person_gender from bill b 
inner join  bill_per_case bp
on b.bill_id=bp.bill_id 
inner join patient pt
on pt.case_id=bp.case_id 
inner join person_personal pp
on pp.idperson=pt.person_id


where pt.case_id=param1






;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PatientCaseInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PatientCaseInfo`(IN param1 int)
BEGIN

SELECT b.bill_id, b.date_of_event, b.amount, pt.person_id, pp.person_Fname, pp.person_Lname,pp.person_age,pp.person_gender from bill b 
inner join  bill_per_case bp
on b.bill_id=bp.bill_id 
inner join patient pt
on pt.case_id=bp.case_id 
inner join person_personal pp
on pp.idperson=pt.person_id


where pt.case_id=param1






;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `staff_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `staff_details`(IN param1 int)
BEGIN


SELECT s.e_id, sp.fname,sp.lname, sp.age, s.department, s.role, sp.email, sp.contactno
 from staff s 
inner join  staff_personal sp
on s.e_id=sp.e_id 
where s.e_id=param1;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `bloodgroupdetail`
--

/*!50001 DROP VIEW IF EXISTS `bloodgroupdetail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `bloodgroupdetail` AS select `p`.`idPerson` AS `idperson`,concat(`p`.`person_FName`,`p`.`person_LName`) AS `concat(p.person_fname,p.person_lname)`,`a`.`address_line_1` AS `address_line_1`,`a`.`address_line_2` AS `address_line_2`,`a`.`address_line_3` AS `address_line_3`,`a`.`ZIPCode` AS `zipcode`,`pm`.`bloodgroup` AS `bloodgroup` from ((`person_personal` `p` left join `person_med_record` `pm` on((`p`.`idPerson` = `pm`.`idPerson`))) left join `address` `a` on((`a`.`person_id` = `p`.`idPerson`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `list_lung_transplant`
--

/*!50001 DROP VIEW IF EXISTS `list_lung_transplant`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `list_lung_transplant` AS select `o`.`procedure_name` AS `procedure_name`,`p`.`person_FName` AS `person_Fname`,`p`.`person_LName` AS `person_Lname`,`o`.`case_id` AS `case_id` from ((`outpatient` `o` left join `patient` `pa` on((`pa`.`case_id` = `o`.`case_id`))) left join `person_personal` `p` on((`p`.`idPerson` = `pa`.`person_id`))) where (`o`.`procedure_name` = 'Lung Transplant') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `listcardiosurgery`
--

/*!50001 DROP VIEW IF EXISTS `listcardiosurgery`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `listcardiosurgery` AS select `o`.`procedure_name` AS `procedure_name`,`p`.`person_FName` AS `person_Fname`,`p`.`person_LName` AS `person_Lname`,`o`.`case_id` AS `case_id` from ((`outpatient` `o` left join `patient` `pa` on((`pa`.`case_id` = `o`.`case_id`))) left join `person_personal` `p` on((`p`.`idPerson` = `pa`.`person_id`))) where (`o`.`procedure_name` = 'Cardio Surgery') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `popular_medicine`
--

/*!50001 DROP VIEW IF EXISTS `popular_medicine`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `popular_medicine` AS select `ph`.`nameMedicine` AS `Name of Medicine`,`ph`.`idMedicine` AS `Medicine ID`,count(`p`.`id_medicine`) AS `Number Of Purchases` from (`prescription` `p` left join `pharmacy` `ph` on((`ph`.`idMedicine` = `p`.`id_medicine`))) group by `p`.`id_medicine` order by count(`p`.`id_medicine`) desc limit 1 */;
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

-- Dump completed on 2016-12-12  5:16:30
