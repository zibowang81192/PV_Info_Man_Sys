-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: db
-- ------------------------------------------------------
-- Server version	8.0.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `designer`
--

DROP TABLE IF EXISTS `designer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `designer` (
  `DNO` int NOT NULL AUTO_INCREMENT,
  `DNAME` char(100) NOT NULL,
  PRIMARY KEY (`DNO`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `designer`
--

LOCK TABLES `designer` WRITE;
/*!40000 ALTER TABLE `designer` DISABLE KEYS */;
INSERT INTO `designer` VALUES (1,'信息产业电子第十一设计研究院科技工程股份有限公司（无锡）'),(2,'西安隆基清洁能源有限公司'),(3,'河北筑能工程技术有限公司'),(4,'青海新能源（集团）有限公司'),(5,'新疆中大电力设计有限责任公司'),(6,'山东电力工程咨询院有限公司'),(7,'中国能源建设集团山西省电力勘测设计院有限公司'),(8,'西安正和电力设计有限公司'),(9,'中国电力工程顾问集团-东北电力设计院');
/*!40000 ALTER TABLE `designer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dp_r`
--

DROP TABLE IF EXISTS `dp_r`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dp_r` (
  `DPNO` int NOT NULL AUTO_INCREMENT,
  `PNO` int NOT NULL,
  `DNO` int NOT NULL,
  PRIMARY KEY (`DPNO`),
  KEY `DP_dfk` (`DNO`),
  KEY `DP_pfk` (`PNO`),
  CONSTRAINT `DP_dfk` FOREIGN KEY (`DNO`) REFERENCES `designer` (`DNO`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `DP_pfk` FOREIGN KEY (`PNO`) REFERENCES `program` (`PNO`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dp_r`
--

LOCK TABLES `dp_r` WRITE;
/*!40000 ALTER TABLE `dp_r` DISABLE KEYS */;
INSERT INTO `dp_r` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,3),(5,5,3),(6,6,4),(7,6,5),(8,7,6),(9,8,7),(10,9,8),(11,10,9),(12,11,9);
/*!40000 ALTER TABLE `dp_r` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program`
--

DROP TABLE IF EXISTS `program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `program` (
  `PNO` int NOT NULL,
  `PNAME` char(100) NOT NULL,
  `PTYPE` char(20) NOT NULL,
  `PTERM` char(20) NOT NULL,
  `POWNER` char(20) DEFAULT NULL,
  `PFIRM` char(100) DEFAULT NULL,
  `PYEAR` year NOT NULL,
  `PMONTH` int NOT NULL,
  PRIMARY KEY (`PNO`),
  CONSTRAINT `CK_mouth` CHECK ((`PMONTH` between 1 and 12))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program`
--

LOCK TABLES `program` WRITE;
/*!40000 ALTER TABLE `program` DISABLE KEYS */;
INSERT INTO `program` VALUES (1,'虎悦通忻州市忻府区一期5万千瓦光伏发电项目','山地光伏','可研',NULL,NULL,2020,9),(2,'黄龙县三岔镇10万千瓦平价上网光伏发电项目','山地光伏','可研',NULL,NULL,2020,9),(3,'阳山县阳光黎埠90MW农光互补发电项目','山地光伏','可研',NULL,NULL,2020,9),(4,'阳山阳光江英50MW农光互补光伏发电项目','山地光伏','可研',NULL,NULL,2020,9),(5,'阳山县七拱镇岩口村50MW农光互补发电项目','山地光伏','可研',NULL,NULL,2020,9),(6,'中利腾晖尼勒克县2万千瓦太阳能并网光伏发电项目','山地光伏','技术评判',NULL,NULL,2020,9),(7,'定安装配式产业10MW屋顶光伏项目','屋顶光伏','可研',NULL,NULL,2020,9),(8,'青海省海南州100MW地面电站项目','平顶光伏','可研',NULL,NULL,2020,9),(9,'平山堡岛新能源有限公司石家庄市平山县岗南镇 110MWp 光伏发电项目','山地光伏','可研',NULL,NULL,2020,9),(10,'国电科左后旗乌兰楚鲁40MWp光伏发电工程','平地光伏','技术评判',NULL,NULL,2020,10),(11,'国电科左后旗乌兰楚鲁60MWp光伏发电工程','平地光伏','技术评判',NULL,NULL,2020,10);
/*!40000 ALTER TABLE `program` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ps_r`
--

DROP TABLE IF EXISTS `ps_r`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ps_r` (
  `PSNO` int NOT NULL AUTO_INCREMENT,
  `PNO` int NOT NULL,
  `FNO` int NOT NULL,
  PRIMARY KEY (`PSNO`),
  UNIQUE KEY `pno_uni` (`PNO`),
  UNIQUE KEY `PS_sfk` (`FNO`),
  CONSTRAINT `PS_pfk` FOREIGN KEY (`PNO`) REFERENCES `program` (`PNO`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PS_sfk` FOREIGN KEY (`FNO`) REFERENCES `site_factory` (`FNO`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ps_r`
--

LOCK TABLES `ps_r` WRITE;
/*!40000 ALTER TABLE `ps_r` DISABLE KEYS */;
INSERT INTO `ps_r` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10),(11,11,11);
/*!40000 ALTER TABLE `ps_r` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_factory`
--

DROP TABLE IF EXISTS `site_factory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `site_factory` (
  `FNO` int NOT NULL AUTO_INCREMENT,
  `LOC` char(100) NOT NULL,
  `FCHARACTER` char(100) DEFAULT NULL,
  `PROVINCE` char(20) NOT NULL,
  `CITY` char(20) NOT NULL,
  `COUNTRY` char(20) DEFAULT NULL,
  `CAPACITY` double NOT NULL,
  `AREA` double DEFAULT NULL,
  `ALTITUDE_MAX` int NOT NULL,
  `ALTITUDE_MIN` int NOT NULL,
  `LONGITUDE` double NOT NULL,
  `LONGITUDE_EORW` char(10) NOT NULL,
  `LATITUDE` double NOT NULL,
  `LATITUDE_NORS` char(10) NOT NULL,
  PRIMARY KEY (`FNO`),
  CONSTRAINT `CK_altitude` CHECK (((`ALTITUDE_MAX` > 0) and (`ALTITUDE_MIN` > 0) and (`ALTITUDE_MAX` >= `ALTITUDE_MIN`))),
  CONSTRAINT `CK_area` CHECK ((`AREA` > 0)),
  CONSTRAINT `CK_capacity` CHECK ((`CAPACITY` > 0)),
  CONSTRAINT `CK_latitude` CHECK (((`LATITUDE` >= 0) and (`LATITUDE` <= 180) and ((`LATITUDE_NORS` = _utf8mb4'north') or (`LATITUDE_NORS` = _utf8mb4'south')))),
  CONSTRAINT `CK_longitude` CHECK (((`LONGITUDE` >= 0) and (`LONGITUDE` <= 180) and ((`LONGITUDE_EORW` = _utf8mb4'east') or (`LONGITUDE_EORW` = _utf8mb4'west'))))
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_factory`
--

LOCK TABLES `site_factory` WRITE;
/*!40000 ALTER TABLE `site_factory` DISABLE KEYS */;
INSERT INTO `site_factory` VALUES (1,'山西省忻州市忻府区豆罗镇',NULL,'山西省','忻州市','忻府区',55.01925,1645.9,1100,1100,112.64,'east',38.32,'north'),(2,'陕西省延安市黄龙县三岔镇',NULL,'陕西省','延安市','黄龙县',110.51664,3500,1200,1200,109.7158,'east',35.5517,'north'),(3,'广东清远市阳山县黎埠镇','丘陵地形，地表植被稀少','广东省','清远市','阳山县',99.0528,3170,200,200,112.4489,'east',24.6,'north'),(4,'广东清远市阳山县东部江英镇上坪村','低山丘陵地形，地表植被茂密','广东省','清远市','阳山县',55.99648,2263,450,450,112.8433,'east',24.4358,'north'),(5,'广东省清远市阳山县七拱镇','低山丘陵地形，地表植被茂密','广东省','清远市','阳山县',55.99648,2263,150,150,112.6267,'east',24.3333,'north'),(6,'新疆伊犁州尼勒克县乌赞乡境内','山前低山丘陵区，表面覆盖有黄土层','新疆','伊犁哈萨克自治州','尼勒克县',20.26614,800,1241,1241,82.273341,'east',43.511388,'north'),(7,'海南省定安县新竹镇建筑产业基地（定安基地）','绿筑#1厂房屋顶','海南省','定安县',NULL,4.75422,NULL,15,15,110.24,'east',19.42,'north'),(8,'青海省海南州生态太阳能发电园南部','土地覆盖为裸地，项目资源点地形几乎平坦，地形坡度3°','青海省','海南藏族自治州','共和县',104.63622,2142.796,3000,3000,100.2522,'east',36.41,'north'),(9,'河北省石家庄市平山县岗南镇','地形相对平坦，周围环境空旷','河北省','石家庄市','平山县',111.072,3327,350,350,114.0214,'east',38.2408,'north'),(10,'内蒙古自治区科尔沁左翼后旗','冲积平原，为堆积地形地貌，多分布固定、半固定沙丘及沙丘链，草场和泡沼','内蒙古','通辽市','科尔沁左翼后旗',40.497719,2041.5,145,141,123.12,'east',43.1724,'north'),(11,'内蒙古自治区科尔沁左翼后旗','冲积平原，为堆积地形地貌，多分布固定、半固定沙丘及沙丘链，草场和泡沼','内蒙古','通辽市','科尔沁左翼后旗',21.766695,1413.945,145,141,123.1324,'east',43.1705,'north');
/*!40000 ALTER TABLE `site_factory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sw_r`
--

DROP TABLE IF EXISTS `sw_r`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sw_r` (
  `SWNO` int NOT NULL AUTO_INCREMENT,
  `FNO` int NOT NULL,
  `WNO` int NOT NULL,
  PRIMARY KEY (`SWNO`),
  UNIQUE KEY `fno_uni` (`FNO`),
  KEY `SW_wfk` (`WNO`),
  CONSTRAINT `SW_sfk` FOREIGN KEY (`FNO`) REFERENCES `site_factory` (`FNO`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `SW_wfk` FOREIGN KEY (`WNO`) REFERENCES `weather` (`WNO`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sw_r`
--

LOCK TABLES `sw_r` WRITE;
/*!40000 ALTER TABLE `sw_r` DISABLE KEYS */;
INSERT INTO `sw_r` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10),(11,11,10);
/*!40000 ALTER TABLE `sw_r` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weather`
--

DROP TABLE IF EXISTS `weather`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weather` (
  `WNO` int NOT NULL AUTO_INCREMENT,
  `LSRA_MJ` double NOT NULL,
  `LSRA_KWH` double NOT NULL,
  `BRA` int NOT NULL,
  `YMAT` double NOT NULL,
  `YHT` double NOT NULL,
  `YLT` double NOT NULL,
  `HMMT` double DEFAULT NULL,
  `MDFS` int DEFAULT NULL,
  `AWS` double DEFAULT NULL,
  `EWS` double DEFAULT NULL,
  `ATD` double DEFAULT NULL,
  `PC` int DEFAULT NULL,
  PRIMARY KEY (`WNO`),
  CONSTRAINT `CK_atd` CHECK (((`ATD` >= 0) and (`ATD` <= 366))),
  CONSTRAINT `CK_bra` CHECK (((`BRA` >= 0) and (`BRA` <= 90))),
  CONSTRAINT `CK_lsra` CHECK (((`LSRA_KWH` > 0) and (`LSRA_MJ` > 0))),
  CONSTRAINT `CK_mdfs` CHECK ((`MDFS` >= 0)),
  CONSTRAINT `CK_pc` CHECK (((`PC` = 0) or (`PC` = 1) or (`PC` = 2) or (`PC` = 3) or (`PC` = 4))),
  CONSTRAINT `CK_tem` CHECK (((`YHT` >= `YLT`) and (`YLT` > -(273.15)))),
  CONSTRAINT `CK_ws` CHECK (((`AWS` >= 0) and (`EWS` >= `AWS`))),
  CONSTRAINT `CK_ymat` CHECK ((`YMAT` > -(273.15)))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weather`
--

LOCK TABLES `weather` WRITE;
/*!40000 ALTER TABLE `weather` DISABLE KEYS */;
INSERT INTO `weather` VALUES (1,5394.96,1498.6,33,8.7,42.2,-30,NULL,109,2.7,31,34.1,NULL),(2,5319,1477.5,32,9.5,36.7,-23.7,21.5,NULL,1.8,NULL,30.5,NULL),(3,4554,1265,19,20.7,41,-8,28.7,NULL,NULL,NULL,78.6,NULL),(4,4604.4,1279,19,20.7,41,-8,28.7,NULL,NULL,NULL,78.6,NULL),(5,4550.4,1264,19,20.7,41,-8,28.7,NULL,NULL,NULL,78.6,NULL),(6,5434.7,150964,42,9.5,39.2,-33.8,NULL,65,1.6,28.1,17,NULL),(7,5580,1550,12,24,39.7,5,NULL,NULL,1.6,32.1,NULL,NULL),(8,6439.1,1788.64,36,3.7,31.3,-28.9,NULL,150,1.8,28,NULL,NULL),(9,5083.2,1412,36,12.2,41.4,-17.6,NULL,1,3.6,NULL,31.1,NULL),(10,5184.36,1440.1,41,6.8,36.7,-30.9,NULL,179,3.85,21,24.3,NULL);
/*!40000 ALTER TABLE `weather` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-30 17:22:17
