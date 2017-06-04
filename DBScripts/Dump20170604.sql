CREATE DATABASE  IF NOT EXISTS `ESTATE_MGMT` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `ESTATE_MGMT`;
-- MySQL dump 10.13  Distrib 5.7.18, for Linux (x86_64)
--
-- Host: localhost    Database: ESTATE_MGMT
-- ------------------------------------------------------
-- Server version	5.7.18-0ubuntu0.16.04.1

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
-- Table structure for table `ESTATE_ASSET`
--

DROP TABLE IF EXISTS `ESTATE_ASSET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ESTATE_ASSET` (
  `ASSET_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ASSET_NAME` varchar(45) NOT NULL,
  `CREATED_BY` int(11) NOT NULL,
  `ASSET_AVAILABLE_QUANTITY` int(11) NOT NULL DEFAULT '0',
  `CREATED_ON` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `LAST_ACCESSED_ON` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ASSET_ID`),
  KEY `fk_ESTATE_ASSET_1_idx` (`CREATED_BY`),
  CONSTRAINT `fk_ESTATE_ASSET_1` FOREIGN KEY (`CREATED_BY`) REFERENCES `ESTATE_USERS` (`USR_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ESTATE_ASSET`
--

LOCK TABLES `ESTATE_ASSET` WRITE;
/*!40000 ALTER TABLE `ESTATE_ASSET` DISABLE KEYS */;
INSERT INTO `ESTATE_ASSET` VALUES (2,'PlayStation',1,0,'2017-02-09 17:18:35','2017-02-09 17:18:35'),(3,'PlayStation - 3',1,0,'2017-02-09 17:18:58','2017-02-09 17:18:58'),(4,'XBOX',1,13,'2017-03-08 15:00:03','2017-03-28 10:10:51'),(5,'Laptop',1,11,'2017-03-19 01:06:55','2017-03-28 10:13:51'),(6,'Tablet',1,0,'2017-03-21 14:18:28','2017-03-21 14:18:28'),(7,'Chair',1,0,'2017-03-21 15:54:01','2017-03-21 15:54:01'),(8,'mouse',1,0,'2017-03-28 17:06:41','2017-03-28 17:06:41'),(9,'keyboard',1,0,'2017-03-28 17:19:07','2017-03-28 17:19:07');
/*!40000 ALTER TABLE `ESTATE_ASSET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ESTATE_DELIVERY`
--

DROP TABLE IF EXISTS `ESTATE_DELIVERY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ESTATE_DELIVERY` (
  `DELIVERY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTRY_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `USER` int(11) NOT NULL,
  `ASSET_ID` int(11) NOT NULL,
  `DELIVERY_LOCATION_ID` int(11) NOT NULL,
  `ISSUE_QUANTITY` int(11) NOT NULL,
  `ISSUE_DATE` datetime DEFAULT NULL,
  `REQUISITION_NO` varchar(45) CHARACTER SET utf8 NOT NULL,
  `CSR_NO` varchar(45) CHARACTER SET utf8 NOT NULL,
  `REMARKS` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`DELIVERY_ID`),
  KEY `USER_idx` (`USER`),
  KEY `ASSET_idx` (`ASSET_ID`),
  KEY `DEL_LOCATION_idx` (`DELIVERY_LOCATION_ID`),
  CONSTRAINT `DEL_ASSET` FOREIGN KEY (`ASSET_ID`) REFERENCES `ESTATE_ASSET` (`ASSET_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `DEL_LOCATION` FOREIGN KEY (`DELIVERY_LOCATION_ID`) REFERENCES `ESTATE_DELIVERY_LOCATIONS` (`DL_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `DEL_USER` FOREIGN KEY (`USER`) REFERENCES `ESTATE_USERS` (`USR_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ESTATE_DELIVERY`
--

LOCK TABLES `ESTATE_DELIVERY` WRITE;
/*!40000 ALTER TABLE `ESTATE_DELIVERY` DISABLE KEYS */;
INSERT INTO `ESTATE_DELIVERY` VALUES (1,'2017-02-13 20:38:14',1,2,2,5,'2017-02-13 00:00:00','demo','asd',NULL),(2,'2017-03-21 15:43:10',2,2,2,1,'2017-01-01 00:00:00','12','12','12'),(3,'2017-03-25 16:39:54',1,2,2,1,'2017-03-17 00:00:00','re','csr','rem'),(4,'2017-03-28 10:16:32',1,4,1,7,'2017-03-28 00:00:00','7845263','7546','static Connection conn = null;\r\n	static PreparedStatement pst = null;\r\n	static ResultSet rs = null; '),(5,'2017-03-28 10:26:34',1,2,1,1,'2017-03-28 00:00:00','1','1','1 '),(6,'2017-03-28 10:33:37',1,2,2,1,'2017-03-28 00:00:00','asdasd','q','q '),(7,'2017-03-28 10:37:50',1,5,6,2,'2017-03-28 00:00:00','2','2','2 '),(8,'2017-03-28 17:08:35',1,2,1,1,'2017-03-28 00:00:00','1','1','1 '),(9,'2017-03-28 17:23:47',1,5,4,2,'2017-03-28 00:00:00','12','12',' 121');
/*!40000 ALTER TABLE `ESTATE_DELIVERY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ESTATE_DELIVERY_LOCATIONS`
--

DROP TABLE IF EXISTS `ESTATE_DELIVERY_LOCATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ESTATE_DELIVERY_LOCATIONS` (
  `DL_ID` int(11) NOT NULL AUTO_INCREMENT,
  `DL_NAME` varchar(45) NOT NULL,
  `CREATED_BY` int(11) NOT NULL,
  `CREATED_ON` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`DL_ID`),
  KEY `fk_ESTATE_DELIVERY_LOCATIONS_1_idx` (`CREATED_BY`),
  CONSTRAINT `fk_ESTATE_DELIVERY_LOCATIONS_1` FOREIGN KEY (`CREATED_BY`) REFERENCES `ESTATE_USERS` (`USR_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ESTATE_DELIVERY_LOCATIONS`
--

LOCK TABLES `ESTATE_DELIVERY_LOCATIONS` WRITE;
/*!40000 ALTER TABLE `ESTATE_DELIVERY_LOCATIONS` DISABLE KEYS */;
INSERT INTO `ESTATE_DELIVERY_LOCATIONS` VALUES (1,'HALL No-9',1,'2017-02-09 16:49:19'),(2,'HALL No-5',1,'2017-02-09 17:18:10'),(3,'Test',1,'2017-03-19 11:27:43'),(4,'Test2',1,'2017-03-19 11:30:50'),(5,'CSE',1,'2017-03-21 15:54:15'),(6,'Samanway',1,'2017-03-28 10:37:12'),(7,'IT',1,'2017-03-28 17:19:23');
/*!40000 ALTER TABLE `ESTATE_DELIVERY_LOCATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ESTATE_PURCHASE`
--

DROP TABLE IF EXISTS `ESTATE_PURCHASE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ESTATE_PURCHASE` (
  `PURCHASE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTRY_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `USER` int(11) NOT NULL,
  `APPROVAL_DATE` datetime DEFAULT NULL,
  `APPROVED_QUANTITY` int(11) NOT NULL,
  `PURCHASE_QUANTITY` int(11) NOT NULL,
  `UNIT_COST` decimal(10,0) NOT NULL,
  `SPECIFICATION` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `SUPPLIER_DETAILS` varchar(500) CHARACTER SET utf8 NOT NULL,
  `BILL_NO` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `BILL_DATE` datetime DEFAULT NULL,
  `CSR_NO` varchar(45) NOT NULL,
  `REMARKS` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  `ASSET_ID` int(11) NOT NULL,
  PRIMARY KEY (`PURCHASE_ID`),
  KEY `USER_idx` (`USER`),
  KEY `ASSET_idx` (`ASSET_ID`),
  CONSTRAINT `ASSET` FOREIGN KEY (`ASSET_ID`) REFERENCES `ESTATE_ASSET` (`ASSET_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `USER` FOREIGN KEY (`USER`) REFERENCES `ESTATE_USERS` (`USR_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ESTATE_PURCHASE`
--

LOCK TABLES `ESTATE_PURCHASE` WRITE;
/*!40000 ALTER TABLE `ESTATE_PURCHASE` DISABLE KEYS */;
INSERT INTO `ESTATE_PURCHASE` VALUES (1,'2017-02-13 20:35:30',1,'2017-02-13 00:00:00',5,5,20000,'demo','demo','asd1236','2017-02-13 00:00:00','asd546','this is absolute garbage to check the UI.....asdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd',2),(2,'2017-03-28 10:08:20',1,'2017-03-28 00:00:00',10,10,10000,' if 1<x<=3 if 1<x<=3 ',' if 1<x<=3 if 1<x<=3 ','515','2016-11-30 00:00:00','649463',' if 1<x<=3 if 1<x<=3 if 1<x<=3 ',4),(3,'2017-03-28 10:10:51',1,'2017-03-28 00:00:00',10,10,10000,' if 1<x<=3 if 1<x<=3 ',' if 1<x<=3 if 1<x<=3 ','515','2016-11-30 00:00:00','649463',' if 1<x<=3 if 1<x<=3 if 1<x<=3 ',4),(4,'2017-03-28 10:13:51',1,'2017-03-28 00:00:00',15,15,10000,' if 1<x<=3 if 1<x<=3 ',' if 1<x<=3 if 1<x<=3 ','515','2016-11-30 00:00:00','649463',' if 1<x<=3 if 1<x<=3 if 1<x<=3 ',5);
/*!40000 ALTER TABLE `ESTATE_PURCHASE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ESTATE_USERS`
--

DROP TABLE IF EXISTS `ESTATE_USERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ESTATE_USERS` (
  `USR_ID` int(11) NOT NULL AUTO_INCREMENT,
  `USR_NAME` varchar(50) NOT NULL,
  `USR_FULL_NAME` varchar(45) DEFAULT NULL,
  `USR_PASSWORD` varchar(45) NOT NULL,
  `USR_CREATED_BY` varchar(45) NOT NULL,
  `USR_LAST_ACCESS` datetime DEFAULT NULL,
  `USR_LAST_UPDATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`USR_ID`),
  UNIQUE KEY `USR_NAME_UNIQUE` (`USR_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ESTATE_USERS`
--

LOCK TABLES `ESTATE_USERS` WRITE;
/*!40000 ALTER TABLE `ESTATE_USERS` DISABLE KEYS */;
INSERT INTO `ESTATE_USERS` VALUES (1,'sam','Sam Ghatak',' ','sysadmin','2017-04-02 22:02:08','2017-04-02 22:02:02'),(2,'mar','Marichi','m','sam',NULL,'2017-03-19 17:52:25'),(4,'ish','Ishu','i','sam',NULL,'2017-03-19 17:56:15'),(5,'dept','dept','dept','sam',NULL,'2017-03-28 17:25:21'),(6,'samg','samg',' ','sam',NULL,'2017-04-02 21:39:40'),(7,'a','a','d','sam',NULL,'2017-04-02 22:01:15'),(8,'b','b','g','sam','2017-04-02 21:54:31','2017-04-02 22:01:53');
/*!40000 ALTER TABLE `ESTATE_USERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'ESTATE_MGMT'
--
/*!50003 DROP PROCEDURE IF EXISTS `InsertDelivery` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertDelivery`(IN AssetId Int,IN DlId Int, IN UserId Int,
in issueDate datetime, in issueQuantity int,
in reqNo varchar(45), in csr varchar(45),
in remarks varchar(250),OUT res int
)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
      set @res :=0 ;
      ROLLBACK;
	END;
    set res = 0;
	start transaction;
		SELECT 
    @cnt:= ASSET_AVAILABLE_QUANTITY
FROM
    ESTATE_ASSET
WHERE
    ASSET_ID = AssetId;
IF ( @cnt >= issueQuantity) THEN 
INSERT INTO `ESTATE_MGMT`.`ESTATE_DELIVERY`
(
`USER`,
`ASSET_ID`,
`DELIVERY_LOCATION_ID`,
`ISSUE_QUANTITY`,
`ISSUE_DATE`,
`REQUISITION_NO`,
`CSR_NO`,
`REMARKS`)
VALUES
(UserId,AssetId,DlId,issueQuantity,issueDate,reqNo,csr,remarks);
update ESTATE_ASSET set ASSET_AVAILABLE_QUANTITY = (ASSET_AVAILABLE_QUANTITY - issueQuantity)
where ASSET_ID = AssetId;
set res = 1;
END IF;
    commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertUser`(IN UsrName varchar(50),
in UsrFullName varchar(45), in UsrPwd varchar(45),
in CreatedBy varchar(45),OUT res int
)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
      set @res :=0 ;
      ROLLBACK;
	END;
    set res = 0;
	start transaction;
	INSERT INTO `ESTATE_MGMT`.`ESTATE_USERS`
	(
	`USR_NAME`,
	`USR_FULL_NAME`,
	`USR_PASSWORD`,
	`USR_CREATED_BY`
	)
	VALUES
	(UsrName,UsrFullName,UsrPwd,CreatedBy);
	set res = 1;
	commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ResetPassword` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ResetPassword`(IN UsrName varchar(50),
in UsrPwd varchar(45),
OUT res int
)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
      set @res :=0 ;
      ROLLBACK;
	END;
    set res = 0;
	start transaction;
	SELECT @uid := USR_ID FROM `ESTATE_MGMT`.`ESTATE_USERS`
	WHERE USR_NAME = UsrName;
	IF(@uid > 0)
    THEN
    select @uid;
	UPDATE `ESTATE_MGMT`.`ESTATE_USERS` SET USR_PASSWORD = UsrPwd, USR_LAST_UPDATE = current_timestamp
    WHERE USR_ID = @uid; 
    set res = 1;
    END IF;
	commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-04  9:48:46
