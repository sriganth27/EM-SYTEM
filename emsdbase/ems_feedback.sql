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
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `reg_number` varchar(45) NOT NULL,
  `dept_name` varchar(45) NOT NULL,
  `event_date` varchar(45) NOT NULL,
  `event_topic` varchar(45) NOT NULL,
  `event_time` varchar(45) NOT NULL,
  `comments` varchar(1000) NOT NULL,
  `sentiment` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (2,'Abinash','210520205001','Information Technology','2025-03-03','    artificial Intelligence','11:00am - 12:30pm','ok','Neutral'),(3,'sriganth G','210520205043','Information Technology','2024-03-03','    Artificial Intelligence','11:00am - 12:30pm','I would like to express my sincere appreciation to the organizing committee for putting together such an insightful seminar. The topic was incredibly relevant and thought-provoking, and the speakers did an excellent job of delivering engaging presentations. The interactive format of the sessions allowed for meaningful discussions and knowledge sharing among participants. Overall, it was a valuable learning experience, and I look forward to attending more events organized by our department in the future. Keep up the great work!','Positive'),(7,'Sasikumar ','210520205038','Information Technology','2024-03-06','    Artificial Intelligence','11:00am - 12:30pm','ok','Neutral'),(8,'Dinesh M','210520205011','Information Technology','2024-03-13','    Artificial Intelligence','11:00am - 12:30pm','ok ','Neutral'),(9,'Sriganth G','210520205043','Information Technology','2024-04-15','    Artificial Intelligence','11:00am - 12:30pm','this event is awesome for student and it is very helpful to improve skill','Neutral'),(10,'Sriganth G','210520205011','Information Technology','2024-04-15','    Artificial Intelligence','11:00am - 12:30pm','bad','Negative'),(11,'Sasikumar','210520205043','Information Technology','2024-05-10',' Full stack development','9.45 am - 10.45 am','the event was so good . and it will be very helpfull for us','Positive'),(12,'Dinesh M','210520205038','Information Technology','2024-05-10',' Full stack development','9:00 am - 10:45 am','it was good ','Positive');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-07  1:11:22
