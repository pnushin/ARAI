-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: bbs
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
-- Table structure for table `bbs`
--

DROP TABLE IF EXISTS `bbs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bbs` (
  `bbsID` int NOT NULL,
  `bbsTitle` varchar(100) DEFAULT NULL,
  `userID` varchar(20) DEFAULT NULL,
  `bbsDate` datetime DEFAULT NULL,
  `bbsContent` varchar(10000) DEFAULT NULL,
  `bbsAvailable` int DEFAULT NULL,
  `ImageName` varchar(200) DEFAULT NULL,
  `ImageRealName` varchar(200) DEFAULT NULL,
  `researchName` varchar(200) DEFAULT NULL,
  `researchRealName` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`bbsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bbs`
--

LOCK TABLES `bbs` WRITE;
/*!40000 ALTER TABLE `bbs` DISABLE KEYS */;
INSERT INTO `bbs` VALUES (2,'Mobile Manipulation using the Toyota HSR platform','sj','2021-12-30 19:16:11','오늘날 로봇 공학이 가장 중요한 기술 중 하나로 자리잡으면서 가정용 서비스 로봇 분야 또한 전례 없는 발전이 이루어지고 있으며, 최근에는 매니퓰레이터가 탑재되어 물체 조작 능력을 갖춘 서비스 로봇들도 등장하고 있다. 본 논문에서는 Toyota 사가 제작한 매니퓰레이터 장착 상용 서비스 로봇인 HSR(Human Support Robot) 을 사용하여 물체를 조작하기 위하여, HSR의 정기구학과 역기구학을 계산하고 이를 기반으로 다양한 물체의 조작을 구현하였다. 연구 결과는 도쿄에서 개최된 국제 로봇 대회인 WRS 2018 (World Robot Summit 2018) 에서 성공적으로 검증되었다.',1,'KROS-19.PNG','KROS-19.PNG','KRoC-19-0059.docx','KRoC-19-0059.docx'),(3,'Team Tidyboy World Robot Summit 2020 Team Description Paper','sj','2021-12-30 19:18:27','Team Tidyboy is a joint team consists of members from Pusan National University, Seoul National University, Korea University and Hanyang University.\r\nWe have a strong research experience in state-of-the-art machine learning methods applied to various robotics problems, as well as extensive expertise gained through a number of robotic competitions, including RoboCup soccer leagues, DARPA Robotics Challenges and RoboCup@Home Social Standard Platform League. Recently, we are focusing on service robots, and we have participated in two major interernational robotic competitions using the Toyota HSR platform: RoboCup@Home Domestic Standard Platform League andWorld Robot Summit Partner Robot Challenge with promising results. In this paper, we present the software framework we have been using for previous robotic competitions, and how we prepare our software to fulll design goals of the World Robot Summit 2020.',1,'ipsro.jpg','ipsro.jpg','Tidyboy_WRS2020.pdf','Tidyboy_WRS2020.pdf'),(4,'RoboCup@Home 2021 Domestic Standard Platform League Winner','sj','2021-12-30 19:20:27','Team Tidyboy is a joint RoboCup@Home Domestic Standard Platform League\r\n(DSPL) team that consists of members from Pusan National University, Seoul\r\nNational University, and Korea University. We have a strong research experience\r\nin state-of-the-art machine learning methods applied to various robotics prob-\r\nlems, as well as extensive expertise gained through a number of robotic compe-\r\ntitions, including RoboCup soccer leagues, DARPA Robotics Challenges (DRC)\r\nand RoboCup@Home Social Standard Platform League (SSPL). Recently, we\r\nare focusing on service robots, and we have participated in two major intererna-\r\ntional robotic competitions using the Toyota HSR platform: RoboCup@Home\r\nDSPL and World Robot Summit (WRS) Partner Robot Challenge with promis-\r\ning results.\r\nDue to the global pandemic issue, the RoboCup@Home 2021 was held as a\r\nvirtual event, utilizing the simulated testing environment developed for the WRS\r\n2020. Compared to previous RoboCup@Home leagues which has a wide variety\r\nof short manipulation and human-robot interaction tasks, WRS 2020 has only\r\ntwo manipulation tasks, which have to be executed sequentially. In addition, the\r\ntotal duration of the task is much longer at 20 minutes, and teams are given\r\nonly a single trial, which makes the robust long-term autonomy of the robot\r\ncrucial. In this paper, we present the software framework we have used for the\r\nRoboCup@Home 2021, and how we have handled various diculties from the\r\nnew WRS rule and simulated environments.',1,'hsr_detect_pipeline2.jpg','hsr_detect_pipeline2.jpg','robocup_winner_2021.pdf','robocup_winner_2021.pdf'),(5,'Development of a Robotic Surgery System using General Purpose Robotic Arm and Modular Haptic Control','sj','2021-12-30 19:24:25','의학과 공학기술의 발전으로 많은 수술장비들이 개발되었\r\n고, 이로 인하여 내, 외과적 수술의 성공률은 비약적으로 상승\r\n하였다. 현대에 이르러서는 기존과 같이 크게 절제하여 흉터\r\n를 남기는 방법 대신 최소한으로 축소한 절개구를 통하여 기\r\n구를 삽입하여 수술하는 방식이 개발되어, 수술의 성공 여부\r\n에 추가하여 얼마나 흉터를 적게 남기는가 또한 의학계의 중\r\n요한 이슈로 자리매김 하고 있다. 하지만 이러한 방법은 시술\r\n난이도가 크게 증가하여 전문가의 숙련도에 의존하는 단점이\r\n있어, 이를 해결하기 위하여 로봇 수술이 도입되고 있다.\r\n대표적인 수술용 로봇으로는 미국 인튜이티스 서지컬(Intuitive\r\nSurgical) 사에서 개발된 다빈치 로봇 수술 시스템(da Vinci®\r\nSurgical System)이 있다. 이 로봇은 의사가 직접 도구를 잡고\r\n수술하는 대신에 서전 콘솔(surgeon console)을 이용하여 수술하\r\n는 방식으로, 인체 내부를 확대한 3D 영상을 보며 양손의 컨트롤\r\n러를 조작하면 수술 로봇의 매니퓰레이터들이 컨트롤러의 움직\r\n임을 그대로 따라 움직여 정교한 수술을 가능하게 해 준다[1,2].\r\n하지만 기존 수술 로봇들은 가격이 매우 높고 설치에 넓은\r\n공간을 필요로 하기에, 보급에 제약이 있어 대형 병원 등에서\r\n만 사용되고 있는 한계점이 있다.\r\n 본 논문에서는 이러한 기존 로봇 수술 시스템의 문제를 해결하\r\n기 위하여, 최근 빠른 보급을 보이고 있는 범용 로봇팔과 모듈러\r\n햅틱 컨트롤러를 이용한 로봇 수술 시스템[Fig. 1]을 제안한다.\r\n모듈러 액츄에이터들로 구성된 저가의 햅틱 컨트롤러는 현\r\n재의 액츄에이터 위치들로부터 컨트롤러의 정기구학을 이용\r\n하여 말단부의 3차원 위치와 방향을 얻어낼 수 있으며, 이 정보\r\n와 로봇팔의 역기구학을 이용하여 범용 로봇팔에 장착된 수술\r\n도구를 작은 절개구를 통하여 원하는 위치와 방향에 위치시킬\r\n수 있도록 실시간으로 제어하여 로봇 수술을 수행하게 된다.',1,'ur5_leftright.jpg','ur5_leftright.jpg','최종.pdf','최종.pdf');
/*!40000 ALTER TABLE `bbs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userID` varchar(20) NOT NULL,
  `userPassword` varchar(20) DEFAULT NULL,
  `userName` varchar(20) DEFAULT NULL,
  `userEmail` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('sj','pwd10404','연구실','seungjoon.yi@pusan.ac.kr');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-07 18:24:45
