-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: robot
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
-- Table structure for table `robot`
--

DROP TABLE IF EXISTS `robot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `robot` (
  `robotID` int NOT NULL,
  `robotTitle` varchar(100) DEFAULT NULL,
  `robotContent` varchar(10000) DEFAULT NULL,
  `robotDate` datetime DEFAULT NULL,
  `robotImageName` varchar(200) DEFAULT NULL,
  `robotRealImageName` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`robotID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `robot`
--

LOCK TABLES `robot` WRITE;
/*!40000 ALTER TABLE `robot` DISABLE KEYS */;
INSERT INTO `robot` VALUES (1,'PAWDQ: A 3D Printed, Open Source, Low Cost Dynamic Quadruped','In this paper we present a new open source dynamic quadruped robot, PADWQ (pronounced pa-dook). In contrast to other quadruped robots that are either relying upon custom actuators and machined metal parts, or low-torque, high-gain servomotors that seriously limit the dynamic performance of the robot, the suggested robot consists entirely of 3D printed plastic structural parts and off-the-shelf commercial components, which allows for a rapid duplication, modification and distribution of the robot for various education and research purposes. It has 12 torque controlled quasi-direct drive (QDD) joints with a close loop control rate of 1 kHz, as well as onboard RGBD camera and GPU-equipped perception computer that can map the terrain and detect various objects in front of the robot. Preliminary test results show that the PADWQ is capable of dynamic trot-walking at the speed of 1 meter per second, even with a relatively simple motion controller.\r\n\r\nQuadruped locomotion has a number of potential advantages over other locomotion types, the biggest of which is the ability to handle uneven terrain. However, commonly used electric motors is not well suited for direct actuation of legged robot joints as they require much higher peak torque than most motors are capable of. Typically, a high-rpm motor is used with a high ratio gear reducer such as the Harmonic drive to generate the high peak torque required for legged robots. However, as such a setup has limited backdrivability, high reflected inertia and low impact resistance, it is not ideal for dynamic locomotion over uneven terrain. Recent introduction of the quasi-direct drive (QDD) [1], [2], [3], which uses a high-torque motor paired with low ratio gear reducer without an elastic component [4], [3], has brought a number of highly dynamic electric powered quadrupeds with excellent maneuverability comparable to hydraulic powered quadrupeds [5], [6], [7], [8], [9]. In addition, thanks to the big success of the quadrotors that have led to the influx of inexpensive high-performance brushless DC (BLDC) motors, QDD actuators can now be built at a low cost using commercially available off-the-shelf parts [10]. Another recent advance is the widespread adoption of affordable 3D printers, which allows manufacturing of complex 3D parts without relying upon costly processes such as CNC machining. This greatly helped spreading of the open source hardware, where the blueprints and assembly instructions are openly released so that the hardware can be rapidly duplicated and distributed across researchers. There have been a number open source quadruped projects as well, but to our knowledge most of them are based on position controlled servomotors However, to our knowledge, most of those open source robotic platforms are based on position controlled servo motors [11], [12], [13] which greatly limits their size, performance and possible applications. Two exceptions, the Stanford Doggo [3] and Solo [14], use custom QDD actuators that allows for dynamic behaviors such as jumping, but their real-world application is still limited as they are lightweight, low DOF quadrupeds solely designed for research purposes. In this paper, we present an open-source dynamic quadruped robot platform that is entirely built upon commercial, off-the-shelf components and standard 3D printed plastic structural parts, so that the robot can be easily duplicated, modified and distributed even without access to advanced machining processes. All the structural parts can be directly 3D printed from openly released STL files, and whole robot can be easily assembled only using hand tools in less than two man hours. The robot has two powerful onboard computers, each handling motion and perception processing, and has torque controlled modular QDD actuators that are capable of dynamic locomotion. Preliminary testing with the assembled robot has showed that the robot is capable of dynamic trot-walking at the velocity of 1.0 meter per second, even with a simple motion controller without extensive parameter tuning, and has expected runtime of one hour using internal batteries.','2021-12-29 16:29:06','바둑이.jpg','바둑이.jpg'),(2,'Development of a Small-Sized Intelligent Home Service Robot','Thanks to the recent introduction of affordable robotic components such as sensors, motors, batteries, and processors, there has been a growing interest in commercial home service robots that performs various household tasks for humans. However, home service robots with manipulation capabilities are typically large, heavy, and expensive, which poses a big hurdle for widespread research on such platforms. In this paper, we introduce a small-sized mobile manipulation robot, Granny, for home service robotics research. The suggested robot platform is capable of various functionalities required for home service robots, which include omnidirectional movement, localization, navigation, and manipulation while being small, light, and affordable. The suggested robot has been validated at the 2020 STEAM CUP IRC Home Service Challenge (HSC) robotic competition and won first place.\r\n\r\nThe introduction of affordable robotic components, such as LIDAR, camera, motor, battery, processor, lead to the development of low-cost robots with good performance. As a result, we now see accelerated commercialization of home service robot which can perform various tasks of humans. Also, there is a lot of ongoing research applicable to the home service robots such as mobile manipulation [1] [2], motion planning [3], human-robot interface [4]. Although one can test the developed robot algorithms in a simulation environment, it is essential to confirm whether the algorithms can perform well even with the limitations of the real environment like modeling errors and noise of sensors. The mobile manipulation robot, such as KUKA YouBot [5], Willow Garage PR2 [6], Toyota Human Support Robot (HSR) [7], Kinova MOVO [8] and Fetch [2], can be used to test the algorithms in the real environment. However, direct testing of new algorithms using such robots can be risky because big, heavy, and malfunctioning robots may injure the people around them. Also, current full-sized commercial mobile manipulation robots are usually too expensive to be distributed widely. We focused on the risks and designed a 3D printed, low-cost, lightweight robot platform. Our robot platform can not only be safely used for the experiment of robots but also widely distributed inexpensively. In this paper, we introduce a small home service robot platform that can be used to test the robotic algorithms in a small-scale environment. Our robot, whose name is Granny, is equipped with Mecanum wheels, 3 degrees of freedom (DOF) manipulator, and several sensors such as a camera, LIDAR, IMU. Granny is capable of 3D perception of objects via an RGB camera, omnidirectional driving based on Mecanum wheels, autonomous driving via LIDAR, and grasping objects and transferring them in indoor spaces via manipulator. The rest of the paper is organized as follows. Section II provides a brief introduction of the hardware configuration of Granny. Section III describes the design of the software. Section IV presents a quick summary of the Mecanum wheel kinematics. Section V describes the kinematics equations of Granny’s arm. In section VI, we present how the Granny had been successfully used in 2020 STEAM CUP IRC Home Service Challenge. and won first place.','2021-12-29 16:29:28','할머니.jpg','할머니.jpg'),(3,'High-Speed Autonomous Robotic Assembly Using In-Hand Manipulation and Re-Grasping','This paper presents an autonomous robotic assembly system for soma cube blocks which, 2 after observing the individual blocks and their assembled shape, quickly plans and executes the 3 assembly motion sequence that picks up each block and incrementally build the target shape. A multi 4 stage planner is used to find the suitable assembly solutions, assembly sequences, and grip sequences 5 considering various constraints, and re-grasping is used when the block target pose is not directly 6 realizable or the block pose is ambiguous. The suggested system is implemented for a commercial 7 UR5e robotic arm and a novel 2 degree of freedom (DOF) gripper capable of in-hand manipulation, 8 which further speeds up the manipulation speed, and has been experimentally validated through a 9 public competitive demonstration, where the suggested system has completed all assembly tasks 10 reliably with outstanding performance.\r\n\r\nAlthough industrial robots have long been used for various manufacturing tasks, their role has 14 mostly been limited to repetitive high-volume tasks as robot deployment has typically required 15 task-specific fixtures, end effectors, and hand-programmed motion sequences. Introduction of 16 human-safe, quickly programmable collaborative robots have broadened the robot deployment to 17 high-mix, low-volume works. And thanks to the recent advances of sensor technology and major 18 breakthrough in the machine learning field, we are now expecting a widespread adoption of intelligent 19 robots that can perceive the environment and make decisions by itself. 20 In this work, we present an integrated system which, given individual components and their 21 assembled shape, perceive their positions, orientations and assembled configuration using sensors, 22 generates the optimal assembly plan to build the target shape from components while avoiding a 23 collision, and rapidly executes the assembly motions using a robotic manipulator and gripper. The 24 suggested system is validated in both simulated and real environments using multiple combinations 25 of sensor, manipulator and gripper systems, and has successfully been used to rapidly solve a number 26 of assembly tasks autonomously in a public competitive demonstration with outstanding results. 27 The remainder of the paper proceeds as follows. Section 2 introduces the related works and 28 highlights how the suggested work differs from each of them. Section 3 presents the overview of 29 the hardware and software used for the system. Section 4 explains how the robot system processes 30 the sensor data to perceive the environment. Section 5 presents how the system finds the optimal 31 motion plan that rapidly assembles the components while avoiding a collision. Section 6 describes 32 the simulation setup we have used to test the system with different hardware configurations. Section 33 7 shows the experimental results acquired from laboratory experiment and public demonstration. 34 Finally, we conclude with a discussion of potential future directions arising from this work.','2021-12-29 16:34:42','블럭.jpg','블럭.jpg'),(4,'Mobile Manipulation for the HSR Intelligent Home Service Robot','With recent introduction of affordable sensors, motors, batteries and processors, as well as the major advancement in machine learning field, we now see a wide adoption of commercial service robots in various fields. However, service robots without manipulation capability are of limited use, as they cannot physically interact with the environment and require continual support of humans during the operation. In this paper, we describe how we implement the general purpose manipulation module for the Toyota HSR (Human Support Robot) platform, which includes the analytial forward and inverse kinematics of the HSR manipulator and corresponding motion planner for the arm to reach objects in various locations. Suggested manipulation module is implemented on the physical HSR platform and used at the World Robot Summit (WRS) 2018 international robotic competition with promising results.\r\n\r\nIntelligent service robots are an important physical manifestations of so-called fourth industrial revolution, requiring state of the art technologies from the artificial intelligence and robotics fields. And thanks to the big advancements in hardware, such as sensors, actuators and processors, as well as new deep learning algorithms, we are about to see a widespread adoption of autonomous service robots in various fields[1]. Although it is crucial for service robot to have capable arms to physically interact with the environment and perform tasks without human support, currently most of commercial service robots either lack an arm[1], or have weak and less precise arms only designed for gestures[1], which greatly limits their role. On the other hand, industrial high degree of freedom (DOF) manipulators are not very suitable for home service robots due to its high weight, cost, and difficulty of control in tight indoor spaces. One notable exception is the Toyota HSR platform, which has a relatively short low DOF arm with compliant control to safely operate in indoor space. In this paper, we describe the mobile manipulation software module we have developed for the HSR platform in detail, and how it has been successfully used for various household manipulation tasks in competitive settings. The rest of the paper is organized as follows. The section II provides a brief introduction of the HSR hardware. The section III presents a quick summary of our 3D object recognition pipeline. The section IV presents the analytic forward and inverse kinematics of the HSR manipulation. The section V describes how we design the HSR’s arm motion to handle target objects in various configurations. In the section VI, we present how the suggested manipulation software module has been used in the WRS 2018 international robotic competition.','2021-12-29 16:34:58','hsr.png','hsr.png');
/*!40000 ALTER TABLE `robot` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-07 18:26:17