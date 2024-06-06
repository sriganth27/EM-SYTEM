-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ems
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(45) NOT NULL,
  `event_category` varchar(45) NOT NULL,
  `event_date` varchar(45) NOT NULL,
  `event_topic` varchar(70) NOT NULL,
  `resource_person_name` varchar(45) NOT NULL,
  `resource_person_details` varchar(250) NOT NULL,
  `broucher` varchar(100) NOT NULL,
  `image1` varchar(100) NOT NULL,
  `image2` varchar(100) NOT NULL,
  `description` varchar(9000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (1,'IT','male','2023-07-27','java','sriganth G','villupuram','sri 2.jpg','12jan_amy-loves-saris01.jpg','345189.jpg','ok'),(2,'CSE','female','2023-07-28','python','jack','chennai','pexels-photo-1766838.jpeg','markus-winkler-LcaMfWaN28k-unsplash.jpg','leaf-nature-green-spring-122429.jpeg','done da'),(9,'ECE','webinar','2023-07-06','full stack web development','Kalaivendhan','trichy','4k-nature-waterfall-vca0x9gctkousu5t.jpg','708957.jpg','12jan_amy-loves-saris01.jpg','success'),(10,'IT','female','2023-06-29','full stack web development','sriganth G','chennai','Screenshot (8).png','Screenshot (9).png','Screenshot (10).png','ok'),(11,'IT','seminar','on','java','jack','chennai','3-32153_beautiful-flower-natural-scenery.jpg','087ade238232948e18161639394059e2.jpg','annie-spratt-7qotv-1XF2A-unsplash.jpg','omk'),(12,'CSE','webinar','on','java','sriganth G','trichy','beautiful_blue_flowers_02_hd_pictures_166919.jpg','christie-kim-0IsBu45B3T8-unsplash.jpg','dennis-bertuch-lcgOKDqY5GQ-unsplash.jpg','done');
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-07  1:11:23
