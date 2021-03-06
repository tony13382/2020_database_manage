CREATE DATABASE  IF NOT EXISTS `adress_id` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `adress_id`;
-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: adress_id
-- ------------------------------------------------------
-- Server version	5.7.27-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `addressee_ID` int(11) NOT NULL AUTO_INCREMENT,
  `addressee_name` char(50) NOT NULL,
  `addressee_contact` char(50) NOT NULL,
  `addressee_address` char(50) NOT NULL,
  PRIMARY KEY (`addressee_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'哈哈哈','0939741188','桃園市中壢區'),(2,'阿珠','0988656666','高雄市鳳山區'),(3,'小名','0932344087','台中市大雅區'),(4,'阿美美','0939741089','台中市大雅區');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods` (
  `goods_ID` int(11) NOT NULL AUTO_INCREMENT,
  `goods_name` char(50) NOT NULL,
  `goods_category` char(50) NOT NULL,
  `goods_stock` int(11) NOT NULL,
  `goods_price` int(11) NOT NULL,
  `position_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`goods_ID`),
  KEY `position_FK` (`position_ID`) USING BTREE,
  CONSTRAINT `position_FK` FOREIGN KEY (`position_ID`) REFERENCES `position` (`position_ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES (1,'手機','C',4,1500,1),(2,'蘋果','F',2,100,2),(3,'香蕉','F',3,70,2),(4,'手球','E',20,200,1);
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `order_ID` int(11) NOT NULL AUTO_INCREMENT,
  `addressee_ID` int(11) DEFAULT NULL,
  `shipper_ID` int(11) DEFAULT NULL,
  `order_time` date NOT NULL,
  PRIMARY KEY (`order_ID`),
  KEY `order` (`order_ID`),
  KEY `addressee_FK` (`addressee_ID`) USING BTREE,
  KEY `shipper_FK` (`shipper_ID`) USING BTREE,
  CONSTRAINT `addressee_FK` FOREIGN KEY (`addressee_ID`) REFERENCES `address` (`addressee_ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `shipper_FK` FOREIGN KEY (`shipper_ID`) REFERENCES `shipper` (`shipper_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,1,1,'2020-06-19'),(2,1,4,'2020-10-25'),(3,2,3,'2010-10-01');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_content`
--

DROP TABLE IF EXISTS `order_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_content` (
  `order_ID` int(11) NOT NULL AUTO_INCREMENT,
  `goods_ID` int(11) NOT NULL,
  `order_count` int(11) NOT NULL,
  PRIMARY KEY (`order_ID`,`goods_ID`),
  KEY `order_FK` (`order_ID`) USING BTREE,
  KEY `goods_FK` (`goods_ID`) USING BTREE,
  CONSTRAINT `goods_FK` FOREIGN KEY (`goods_ID`) REFERENCES `goods` (`goods_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_FK` FOREIGN KEY (`order_ID`) REFERENCES `order` (`order_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_content`
--

LOCK TABLES `order_content` WRITE;
/*!40000 ALTER TABLE `order_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `position` (
  `position_ID` int(11) NOT NULL AUTO_INCREMENT,
  `position_name` char(50) NOT NULL,
  `position_address` char(50) NOT NULL,
  `positoin_contact` char(50) NOT NULL,
  `position_block` char(50) NOT NULL,
  `position_shelf` char(50) NOT NULL,
  PRIMARY KEY (`position_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` VALUES (1,'北1','台北市','0224976219','01','01'),(2,'北2','桃園市','034930755','02','03'),(3,'中1','台中市','0434830744','02','01'),(4,'南1','Taoyaun City Zhongli Dist Hunxi Rd. Sec2 .No.400','101010','01','05'),(5,'南2','屏東縣','089862789','01','01');
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipper`
--

DROP TABLE IF EXISTS `shipper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipper` (
  `shipper_ID` int(11) NOT NULL AUTO_INCREMENT,
  `shipper_name` char(50) NOT NULL,
  `shipper_contact` char(50) NOT NULL,
  PRIMARY KEY (`shipper_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipper`
--

LOCK TABLES `shipper` WRITE;
/*!40000 ALTER TABLE `shipper` DISABLE KEYS */;
INSERT INTO `shipper` VALUES (1,'小吳','0987878787'),(2,'李四','0954875487'),(3,'小明','0912345678'),(4,'大方','10011111');
/*!40000 ALTER TABLE `shipper` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-20  1:56:04
