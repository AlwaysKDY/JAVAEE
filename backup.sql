-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: javaee
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `attractions`
--

DROP TABLE IF EXISTS `attractions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attractions` (
  `attraction_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text,
  `image_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`attraction_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attractions`
--

LOCK TABLES `attractions` WRITE;
/*!40000 ALTER TABLE `attractions` DISABLE KEYS */;
INSERT INTO `attractions` VALUES (1,'kdy\'s home','It is a nice home!','1.png'),(2,'Sunshine Park','A beautiful park with sunny landscapes.','2.png'),(3,'Moonlight Garden','A serene garden illuminated by moonlight.','3.png'),(4,'Starry Sky Observatory','An observatory to watch the stars.','4.png'),(5,'Ocean Breeze Beach','A beach with refreshing ocean breeze.','5.png'),(6,'Mountain View Trail','A trail with stunning mountain views.','6.png'),(7,'Riverbank Walk','A peaceful walk along the riverbank.','7.png'),(8,'Forest Adventure','An adventure trail in the forest.','8.png'),(9,'Historic Museum','A museum showcasing historical artifacts.','9.png'),(10,'Wildlife Safari','A safari to observe wildlife.','10.png'),(11,'Art Gallery','A gallery displaying various artworks.','11.png'),(12,'Wonderful Land','A place very attractive.','12.png');
/*!40000 ALTER TABLE `attractions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkin_records`
--

DROP TABLE IF EXISTS `checkin_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checkin_records` (
  `checkin_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `attraction_id` int DEFAULT NULL,
  `checkin_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`checkin_id`),
  KEY `user_id` (`user_id`),
  KEY `attraction_id` (`attraction_id`),
  CONSTRAINT `checkin_records_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `checkin_records_ibfk_2` FOREIGN KEY (`attraction_id`) REFERENCES `attractions` (`attraction_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkin_records`
--

LOCK TABLES `checkin_records` WRITE;
/*!40000 ALTER TABLE `checkin_records` DISABLE KEYS */;
INSERT INTO `checkin_records` VALUES (1,1,1,'2024-05-23 14:02:48','check-in failed: no valid reservation'),(2,2,2,'2024-05-23 14:02:57','check-in failed: no valid reservation'),(3,1,1,'2024-05-23 14:12:52','checked in'),(5,1,5,'2024-05-23 14:34:17','check-in failed: no valid reservation'),(6,1,2,'2024-05-23 14:34:19','check-in failed: no valid reservation'),(7,1,1,'2024-05-23 14:34:19','checked in'),(9,1,5,'2024-05-23 14:34:37','check-in failed: no valid reservation'),(11,1,2,'2024-05-23 14:38:58','check-in failed: no valid reservation'),(12,1,1,'2024-05-23 14:38:59','checked in'),(13,1,7,'2024-05-23 14:39:00','check-in failed: no valid reservation'),(14,1,1,'2024-05-23 14:44:11','checked in'),(15,1,NULL,'2024-05-23 14:47:24','check-in failed: no valid reservation'),(16,2,NULL,'2024-05-23 14:47:25','check-in failed: no valid reservation'),(17,1,2,'2024-06-03 12:42:29','check-in failed: no valid reservation'),(18,1,1,'2024-06-03 12:42:57','checked in');
/*!40000 ALTER TABLE `checkin_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `queue` (
  `queue_id` int NOT NULL AUTO_INCREMENT,
  `attraction_id` int DEFAULT NULL,
  `queue_length` int NOT NULL,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`queue_id`),
  KEY `attraction_id` (`attraction_id`),
  CONSTRAINT `queue_ibfk_1` FOREIGN KEY (`attraction_id`) REFERENCES `attractions` (`attraction_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
INSERT INTO `queue` VALUES (1,1,152,'2024-05-22 08:58:04'),(3,2,6,'2024-05-22 09:59:32'),(4,3,234,'2024-05-22 09:59:32'),(5,4,43,'2024-05-22 09:59:32'),(6,5,25,'2024-05-22 09:59:32'),(7,6,0,'2024-05-22 09:59:32'),(8,7,4,'2024-05-22 09:59:32'),(9,8,156,'2024-05-22 09:59:32'),(10,9,43,'2024-05-22 09:59:32'),(11,10,94,'2024-05-22 09:59:32'),(12,11,23,'2024-05-23 14:36:57'),(13,12,54,'2024-05-23 14:36:57');
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservations`
--

DROP TABLE IF EXISTS `reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservations` (
  `reservation_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `attraction_id` int DEFAULT NULL,
  `reservation_date` date NOT NULL,
  `time_slot` varchar(50) NOT NULL,
  PRIMARY KEY (`reservation_id`),
  KEY `user_id` (`user_id`),
  KEY `attraction_id` (`attraction_id`),
  CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `reservations_ibfk_2` FOREIGN KEY (`attraction_id`) REFERENCES `attractions` (`attraction_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservations`
--

LOCK TABLES `reservations` WRITE;
/*!40000 ALTER TABLE `reservations` DISABLE KEYS */;
INSERT INTO `reservations` VALUES (1,1,5,'2024-05-10','9:00-11:00'),(2,1,NULL,'2024-05-10','09:00-10:00'),(3,1,2,'2024-05-26','11:00-13:00'),(4,1,NULL,'2024-05-26','09:00-10:00'),(5,1,2,'2024-05-02','11:00-13:00'),(6,1,NULL,'2024-05-02','09:00-10:00'),(7,1,1,'2024-05-23','21:00-23:00'),(8,1,NULL,'2024-05-23','09:00-10:00'),(9,1,1,'2024-05-23','21:00-23:00'),(10,1,NULL,'2024-05-24','09:00-10:00'),(11,1,2,'2024-05-24','11:00-13:00'),(12,1,NULL,'2024-06-14','09:00-10:00'),(13,1,1,'2024-06-14','11:00-13:00'),(14,1,2,'2024-05-25','7:00-9:00'),(15,1,NULL,'2024-05-25','09:00-10:00'),(16,1,3,'2024-05-24','11:00-13:00'),(17,1,NULL,'2024-06-01','09:00-10:00'),(18,1,2,'2024-06-01','13:00-15:00'),(19,1,NULL,'2024-05-31','09:00-10:00'),(20,1,2,'2024-05-31','9:00-11:00'),(21,1,2,'2024-06-06','11:00-13:00'),(22,1,NULL,'2024-06-06','09:00-10:00'),(23,1,NULL,'2024-06-03','09:00-10:00'),(24,1,1,'2024-06-03','19:00-21:00');
/*!40000 ALTER TABLE `reservations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service` (
  `station_id` int NOT NULL AUTO_INCREMENT,
  `contact` varchar(255) NOT NULL,
  `hours` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`station_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicestation`
--

DROP TABLE IF EXISTS `servicestation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicestation` (
  `station_id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `contact` varchar(50) DEFAULT NULL,
  `hours` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`station_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicestation`
--

LOCK TABLES `servicestation` WRITE;
/*!40000 ALTER TABLE `servicestation` DISABLE KEYS */;
INSERT INTO `servicestation` VALUES (1,'medical','Central Medical Station','Central Plaza','1234567890','08:00-18:00'),(2,'medical','North Medical Station','North Wing','1234567891','08:00-18:00'),(3,'medical','South Medical Station','South Wing','1234567892','08:00-18:00'),(4,'dining','Central Dining Station','Central Plaza','1234567893','08:00-18:00'),(5,'dining','North Dining Station','North Wing','1234567894','08:00-18:00'),(6,'dining','South Dining Station','South Wing','1234567895','08:00-18:00'),(7,'dining','Beachside Cafe','Ocean Breeze Beach','1234567896','08:00-18:00'),(8,'dining','Mountain View Restaurant','Mountain View Trail','1234567897','08:00-18:00'),(9,'medical','Beachside Medical Station','Ocean Breeze Beach','1234567898','08:00-18:00'),(10,'medical','Mountain View Medical Station','Mountain View Trail','1234567899','08:00-18:00'),(11,'medical','Central Medical Station','Main Entrance','123-456-7890','08:00 - 20:00'),(12,'medical','West Wing Clinic','West Wing','123-456-7891','09:00 - 18:00'),(13,'medical','East Side Medical Help','East Side','123-456-7892','10:00 - 22:00'),(14,'dining','Main Food Court','Central Plaza','987-654-3210','08:00 - 22:00'),(15,'dining','East Side Eatery','East Wing','987-654-3211','09:00 - 21:00'),(16,'dining','West Wing Cafe','West Wing','987-654-3212','10:00 - 23:00');
/*!40000 ALTER TABLE `servicestation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `traffic`
--

DROP TABLE IF EXISTS `traffic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `traffic` (
  `traffic_id` int NOT NULL AUTO_INCREMENT,
  `route` text,
  PRIMARY KEY (`traffic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `traffic`
--

LOCK TABLES `traffic` WRITE;
/*!40000 ALTER TABLE `traffic` DISABLE KEYS */;
INSERT INTO `traffic` VALUES (1,'Route 1: Central Station to Sunshine Park'),(2,'Route 2: Sunshine Park to Moonlight Garden'),(3,'Route 3: Moonlight Garden to Starry Sky Observatory'),(4,'Route 4: Starry Sky Observatory to Ocean Breeze Beach'),(5,'Route 5: Ocean Breeze Beach to Mountain View Trail'),(6,'Route 6: Mountain View Trail to Riverbank Walk'),(7,'Route 7: Riverbank Walk to Forest Adventure'),(8,'Route 8: Forest Adventure to Historic Museum'),(9,'Route 9: Historic Museum to Wildlife Safari'),(10,'Route 10: Wildlife Safari to Art Gallery');
/*!40000 ALTER TABLE `traffic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `registration_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `recovery_key` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'kdy','70a07123ec789d907cd962758068851882460f32e18bfb918bea8ce2f982b7f4','kongdy5521@gmail.com','18309850329','2024-05-21 14:27:48','1'),(2,'wzc','0e1bad67c2c090247e4d44a0c5a56281b5176f4416b7fdbb6acc6216a7f209aa','wangzc0320@mail.com','18979552586','2024-05-21 14:30:37','1'),(5,'111','99b0edf6adf964042a0c1ae82ade2aece8f38a2d86433e84c5187fb268425fe0','2404954410@qq.com','123123','2024-05-21 14:58:27','8aa3bf53-1591-4b85-9f0d-3555cd0fd782'),(6,'123123','15ce36b59fa6c65991830a78f0d7401daed5484f8835d0c64d986c68feb2b137','kongdy5521@mail.com','12312343123','2024-05-21 15:08:53','f8522cdf-a9ce-4854-8f76-a2832b07b75e'),(7,'123332','56e23f47faba60cb62547556f36b029e4c31e169843c913727a53bb5ab8c5c25','11@11','431323111','2024-05-22 14:11:23','24675801-fded-49a6-aa2c-8f4d8132ba78'),(8,'4124123','ade51e3b0e9826b63632a43227df0c0c3e2ee73cb71f7795086ca3a0e8fb8d2e','23423@bvgwerdf','125341231','2024-05-23 09:19:25','7f1c78e1-c884-4cbe-b740-14022b7b9d42'),(9,'zzk','dedb7a33605f868b778a46fca7671db3be6d81cfc435649a141b1cc7011f92a8','12312341@regewgf23.com','12312324525','2024-06-03 12:40:54','8feb7ab5-68ce-48f9-9671-308b9f04fa9c');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weather`
--

DROP TABLE IF EXISTS `weather`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weather` (
  `weather_id` int NOT NULL AUTO_INCREMENT,
  `attraction_id` int DEFAULT NULL,
  `weather_date` date NOT NULL,
  `temperature` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`weather_id`),
  KEY `attraction_id` (`attraction_id`),
  CONSTRAINT `weather_ibfk_1` FOREIGN KEY (`attraction_id`) REFERENCES `attractions` (`attraction_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weather`
--

LOCK TABLES `weather` WRITE;
/*!40000 ALTER TABLE `weather` DISABLE KEYS */;
INSERT INTO `weather` VALUES (1,1,'2024-05-22','25.0','Sunny','2024-05-22 09:59:51'),(2,2,'2024-05-22','18.0','Clear','2024-05-22 09:59:51'),(3,3,'2024-05-22','20.0','Partly Cloudy','2024-05-22 09:59:51'),(4,4,'2024-05-22','28.0','Sunny','2024-05-22 09:59:51'),(5,5,'2024-05-22','22.0','Cloudy','2024-05-22 09:59:51'),(6,6,'2024-05-22','24.0','Sunny','2024-05-22 09:59:51'),(7,7,'2024-05-22','21.0','Partly Cloudy','2024-05-22 09:59:51'),(8,8,'2024-05-22','19.0','Clear','2024-05-22 09:59:51'),(9,9,'2024-05-22','23.0','Sunny','2024-05-22 09:59:51'),(10,10,'2024-05-22','26.0','Sunny','2024-05-22 09:59:51'),(11,1,'2024-05-23','26.0','Sunny','2024-05-22 09:59:51'),(12,2,'2024-05-23','19.0','Clear','2024-05-22 09:59:51'),(13,3,'2024-05-23','21.0','Partly Cloudy','2024-05-22 09:59:51'),(14,4,'2024-05-23','29.0','Sunny','2024-05-22 09:59:51'),(15,5,'2024-05-23','23.0','Cloudy','2024-05-22 09:59:51'),(16,6,'2024-05-23','25.0','Sunny','2024-05-22 09:59:51'),(17,7,'2024-05-23','22.0','Partly Cloudy','2024-05-22 09:59:51'),(18,8,'2024-05-23','20.0','Clear','2024-05-22 09:59:51'),(19,9,'2024-05-23','24.0','Sunny','2024-05-22 09:59:51'),(20,10,'2024-05-23','27.0','Sunny','2024-05-22 09:59:51');
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

-- Dump completed on 2024-06-03 20:47:02
