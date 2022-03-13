-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: team
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team` (
  `teamID` int NOT NULL,
  `memberName` varchar(50) DEFAULT NULL,
  `memberIntro` varchar(2048) DEFAULT NULL,
  `IDPhotoName` varchar(200) DEFAULT NULL,
  `IDPhotoRealName` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`teamID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (1,'Jae-Bong Yi','School of Electrical and Computer Engineering Pusan National University Research Area : Manipulation','이재봉님.jpg','이재봉님.jpg'),(2,'Joon-Young Kim','School of Electrical and Computer Engineering Pusan National University Research Area : Manipulation','김준영님.jpg','김준영님.jpg'),(3,'Tae-Yang Kim','School of Electrical and Computer Engineering Pusan National University Research Area : Manipulation','김태양님.jpg','김태양님.jpg'),(4,'Tae-Woong Kang','School of Electrical and Computer Engineering Pusan National University Research Area : Manipulation','강태웅님.jpg','강태웅님.jpg'),(5,'Dong-Woon Song','School of Electrical and Computer Engineering Pusan National University Research Area : Manipulation','송동운님.jpg','송동운님.jpg'),(6,'Jin-Woo Park','School of Electrical and Computer Engineering Pusan National University Research Area : Manipulation','박진우님.jpg','박진우님.jpg'),(7,'Ye-Rin Moon','Ye-Rin Moon\r\nSchool of Electrical and Computer Engineering Pusan National University Research Area : Manipulation','문예린님.jpg','문예린님.jpg'),(8,'Jong-Ho Shin','School of Electrical and Computer Engineering Pusan National University Research Area : Manipulation','신종호님.jpg','신종호님.jpg'),(9,'Beom-Soo Choi','School of Electrical and Computer Engineering Pusan National University Research Area : Manipulation','최범수님.jpg','최범수님.jpg');
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-07 18:26:53
