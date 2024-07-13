CREATE DATABASE  IF NOT EXISTS `travelmicroserviceflightdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `travelmicroserviceflightdb`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: travelmicroserviceflightdb
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `airline`
--

DROP TABLE IF EXISTS `airline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airline` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airline`
--

LOCK TABLES `airline` WRITE;
/*!40000 ALTER TABLE `airline` DISABLE KEYS */;
INSERT INTO `airline` VALUES (1,'EXPRESS INDIA'),(2,'EXPRESS INDIA'),(3,'SkyHigh Airlines'),(4,'BlueSky Air'),(5,'Velocity Air'),(6,'Freedom Airlines'),(7,'Horizon Air');
/*!40000 ALTER TABLE `airline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airport`
--

DROP TABLE IF EXISTS `airport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airport` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `location` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airport`
--

LOCK TABLES `airport` WRITE;
/*!40000 ALTER TABLE `airport` DISABLE KEYS */;
INSERT INTO `airport` VALUES (1,'Visakhapatnam','Visakhapatnam International Airport'),(2,'Tirupati','Tirupati Airport '),(3,'Delhi','Indira Gandhi International Airport'),(4,'Hyderabad','Rajiv Gandhi International Airport'),(5,'Chennai','Chennai International Airport'),(6,'Goa','Goa International Airport'),(7,'Goa','Goa International Airport');
/*!40000 ALTER TABLE `airport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `destination_airport_id` bigint DEFAULT NULL,
  `flight_id` bigint DEFAULT NULL,
  `start_airport_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `amount` double NOT NULL,
  `payment_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKjmxx0j70sxmcbr4r6yaasd7lo` (`destination_airport_id`),
  KEY `FK546eybei9q7dsna94vryofrbr` (`flight_id`),
  KEY `FKrjllky46ese0kforahqxym5q8` (`start_airport_id`),
  KEY `FKkgseyy7t56x7lkjgu3wah5s3t` (`user_id`),
  CONSTRAINT `FK546eybei9q7dsna94vryofrbr` FOREIGN KEY (`flight_id`) REFERENCES `flight` (`id`),
  CONSTRAINT `FKjmxx0j70sxmcbr4r6yaasd7lo` FOREIGN KEY (`destination_airport_id`) REFERENCES `airport` (`id`),
  CONSTRAINT `FKkgseyy7t56x7lkjgu3wah5s3t` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKrjllky46ese0kforahqxym5q8` FOREIGN KEY (`start_airport_id`) REFERENCES `airport` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (1,'2024-05-20',1,1,2,1,1000,NULL),(2,'2024-05-25',2,1,1,1,1000,NULL),(3,'2024-05-20',1,1,2,2,1000,NULL),(4,'2024-06-16',1,2,3,3,1200,2),(5,'2024-06-17',5,3,4,4,1500,3),(6,'2024-06-18',6,4,2,5,1800,4),(12,'2024-06-16',1,2,3,3,1200,2),(13,'2024-06-16',1,2,3,3,1200,2);
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight`
--

DROP TABLE IF EXISTS `flight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flight` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `seat_capacity` int NOT NULL,
  `airline_id` bigint DEFAULT NULL,
  `date` date DEFAULT NULL,
  `destination_airport` varchar(255) DEFAULT NULL,
  `start_airport` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK37wfh52g7g91rllg104gfq3yv` (`airline_id`),
  CONSTRAINT `FK37wfh52g7g91rllg104gfq3yv` FOREIGN KEY (`airline_id`) REFERENCES `airline` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight`
--

LOCK TABLES `flight` WRITE;
/*!40000 ALTER TABLE `flight` DISABLE KEYS */;
INSERT INTO `flight` VALUES (1,180,1,'2024-06-15','Tirupati','Visakhapatnam'),(2,180,1,'2024-06-16','Delhi','Visakhapatnam'),(3,180,2,'2024-06-17','Hyderabad','Chennai'),(4,200,3,'2024-06-18','Tirupati','Goa'),(5,160,4,'2024-06-19','Visakhapatnam','Hyderabad'),(6,220,5,'2024-06-20','Chennai','Delhi'),(7,180,6,'2024-06-21','Goa','Tirupati'),(8,180,6,'2024-06-21','Goa','Tirupati');
/*!40000 ALTER TABLE `flight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `amount` double NOT NULL,
  `booking_id` bigint DEFAULT NULL,
  `payment_mode` tinyint DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `payment_chk_1` CHECK ((`payment_mode` between 0 and 4))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,1000,1,3,'SUCCESS','Transaction123'),(2,1000,2,3,'SUCCESS','Transaction123'),(3,1000,3,3,'SUCCESS','Transaction123'),(4,1200,4,3,'SUCCESS','Transaction123'),(5,1500,5,3,'SUCCESS','Transaction123'),(6,1800,6,3,'SUCCESS','Transaction123'),(7,1200,12,3,'SUCCESS','Transaction123'),(8,1200,13,3,'SUCCESS','Transaction123');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `end_time` datetime(6) DEFAULT NULL,
  `start_time` datetime(6) DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `destination_airport_id` bigint DEFAULT NULL,
  `flight_id` bigint DEFAULT NULL,
  `start_airport_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7g3r9aihi9k6x7eu0l6ciiffv` (`destination_airport_id`),
  KEY `FK3l8j433ly5vnb2d67o6ms00b` (`flight_id`),
  KEY `FK5j41jvrr18eqheqedbdj37gx7` (`start_airport_id`),
  CONSTRAINT `FK3l8j433ly5vnb2d67o6ms00b` FOREIGN KEY (`flight_id`) REFERENCES `flight` (`id`),
  CONSTRAINT `FK5j41jvrr18eqheqedbdj37gx7` FOREIGN KEY (`start_airport_id`) REFERENCES `airport` (`id`),
  CONSTRAINT `FK7g3r9aihi9k6x7eu0l6ciiffv` FOREIGN KEY (`destination_airport_id`) REFERENCES `airport` (`id`),
  CONSTRAINT `schedule_chk_1` CHECK ((`status` between 0 and 2))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (3,'2024-06-16 16:30:00.000000','2024-06-16 13:30:00.000000',1,2,1,1),(4,'2024-06-16 17:30:00.000000','2024-06-16 14:30:00.000000',1,1,2,3),(5,'2024-06-17 17:30:00.000000','2024-06-17 15:30:00.000000',0,5,3,4),(6,'2024-06-18 19:30:00.000000','2024-06-18 16:30:00.000000',2,6,4,2),(7,'2024-06-19 19:00:00.000000','2024-06-19 17:30:00.000000',1,4,5,1),(8,'2024-06-20 21:30:00.000000','2024-06-20 18:30:00.000000',0,3,6,5),(9,'2024-06-21 22:30:00.000000','2024-06-21 19:30:00.000000',1,2,7,6),(10,'2024-06-21 22:30:00.000000','2024-06-21 19:30:00.000000',1,2,7,6);
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date_of_birth` bigint DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,8919524324,'venu.d@example.com','venu madhav'),(2,8919524324,'ranga.d@example.com','ranga'),(3,7867867866,'karim.sk@example.com','karim'),(4,8911111111,'teja.g@example.com','teja'),(5,9555789789,'kedhar.k@example.com','kedhar'),(6,9555789789,'vijay.B@example.com','vijay kumar');
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

-- Dump completed on 2024-05-21 23:11:15
CREATE DATABASE  IF NOT EXISTS `travelmicroservicehoteldb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `travelmicroservicehoteldb`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: travelmicroservicehoteldb
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `bkid` int NOT NULL AUTO_INCREMENT,
  `checkin_date` varchar(255) DEFAULT NULL,
  `checkout_date` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `hotel_id` int DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `number_guests` varchar(255) DEFAULT NULL,
  `amount` bigint DEFAULT NULL,
  `payment_id` bigint DEFAULT NULL,
  PRIMARY KEY (`bkid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (1,'2023-06-01','2023-06-05','venu',1,'Madhav','2',NULL,NULL),(2,'2024-06-01','2024-06-05','mani',2,'kumar','2',500,1),(3,'2024-06-05','2024-06-10','Anita',3,'Sharma','2',1000,52),(4,'2024-06-10','2024-06-15','Ravi',4,'Kumar','1',750,54),(5,'2024-06-15','2024-06-20','Sunita',5,'Verma','2',1500,56),(6,'2024-06-20','2024-06-25','Raj',6,'Singh','3',900,58),(7,'2024-06-25','2024-06-30','Priya',7,'Menon','1',500,60),(8,'2024-06-18','2024-06-23','Vijay',8,'Desai','2',1100,62),(9,'2024-06-01','2024-06-05','Kavita',9,'Patel','2',600,64),(10,'2024-06-01','2024-06-05','Kavita',9,'Patel','2',600,102);
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotels`
--

DROP TABLE IF EXISTS `hotels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotels` (
  `htid` int NOT NULL AUTO_INCREMENT,
  `hotel_ammenities` varchar(255) DEFAULT NULL,
  `hotel_city` varchar(255) DEFAULT NULL,
  `hotel_country` varchar(255) DEFAULT NULL,
  `hotel_name` varchar(255) DEFAULT NULL,
  `hotel_zipcode` varchar(255) DEFAULT NULL,
  `hotel_amenities` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`htid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotels`
--

LOCK TABLES `hotels` WRITE;
/*!40000 ALTER TABLE `hotels` DISABLE KEYS */;
INSERT INTO `hotels` VALUES (1,NULL,'Tirupati','India','Hotel Orion Stay','517507','Pool, Gym, WiFi'),(2,NULL,'Visakhapatnam','India','Grand Hotel','530001','Pool, Gym, Spa'),(3,NULL,'Tirupati','India','Ocean View Resort','517501','Free Breakfast, Pool, Wi-Fi'),(4,NULL,'Delhi','India','Capital Palace','110001','Restaurant, Gym, Business Center'),(5,NULL,'Hyderabad','India','Hyderabad Heights','500001','Spa, Bar, Wi-Fi'),(6,NULL,'Chennai','India','Chennai Comforts','600001','Pool, Gym, Free Parking'),(7,NULL,'Goa','India','Beachside Bliss','403001','Beach Access, Pool, Free Breakfast'),(8,NULL,'Visakhapatnam','India','Royal Residency','530002','Free Wi-Fi, Conference Room, Restaurant'),(9,NULL,'Tirupati','India','Divine Suites','517502','Spa, Free Breakfast, Gym'),(10,NULL,'Delhi','India','Heritage Inn','110002','Free Parking, Restaurant, Gym'),(11,NULL,'Delhi','India','Heritage Inn','110002','Free Parking, Restaurant, Gym');
/*!40000 ALTER TABLE `hotels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_details`
--

DROP TABLE IF EXISTS `payment_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_details` (
  `payment_id` bigint NOT NULL,
  `amount` bigint NOT NULL,
  `booking_id` bigint NOT NULL,
  `payment_date` datetime(6) DEFAULT NULL,
  `mode` varchar(255) DEFAULT NULL,
  `payment_status` varchar(255) DEFAULT NULL,
  `reference_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_details`
--

LOCK TABLES `payment_details` WRITE;
/*!40000 ALTER TABLE `payment_details` DISABLE KEYS */;
INSERT INTO `payment_details` VALUES (1,500,2,'2024-05-20 03:38:11.808668','CREDIT_CARD','SUCCESS',NULL),(2,500,2,'2024-05-20 03:38:11.846668','CREDIT_CARD','SUCCESS',NULL),(3,500,1,'2024-05-20 03:51:47.618102','CREDIT_CARD','SUCCESS',NULL),(52,1000,3,'2024-05-21 13:08:28.227903','CREDIT_CARD','SUCCESS',NULL),(53,1000,3,'2024-05-21 13:08:28.305761','CREDIT_CARD','SUCCESS',NULL),(54,750,4,'2024-05-21 13:08:40.892531','CREDIT_CARD','SUCCESS',NULL),(55,750,4,'2024-05-21 13:08:40.907813','CREDIT_CARD','SUCCESS',NULL),(56,1500,5,'2024-05-21 13:08:53.605700','CREDIT_CARD','SUCCESS',NULL),(57,1500,5,'2024-05-21 13:08:53.637720','CREDIT_CARD','SUCCESS',NULL),(58,900,6,'2024-05-21 13:09:04.531000','CREDIT_CARD','SUCCESS',NULL),(59,900,6,'2024-05-21 13:09:04.546985','CREDIT_CARD','SUCCESS',NULL),(60,500,7,'2024-05-21 13:09:16.838847','CREDIT_CARD','SUCCESS',NULL),(61,500,7,'2024-05-21 13:09:16.857987','CREDIT_CARD','SUCCESS',NULL),(62,1100,8,'2024-05-21 13:09:30.126500','CREDIT_CARD','SUCCESS',NULL),(63,1100,8,'2024-05-21 13:09:30.135685','CREDIT_CARD','SUCCESS',NULL),(64,600,9,'2024-05-21 13:09:44.777810','CREDIT_CARD','SUCCESS',NULL),(65,600,9,'2024-05-21 13:09:44.786134','CREDIT_CARD','SUCCESS',NULL),(66,500,1,'2024-05-21 13:15:32.669796','CREDIT_CARD','SUCCESS',NULL),(67,500,1,'2024-05-21 13:18:08.630691','CREDIT_CARD','SUCCESS',NULL),(102,600,10,'2024-05-21 16:49:19.748129','CREDIT_CARD','SUCCESS',NULL),(103,600,10,'2024-05-21 16:49:20.031385','CREDIT_CARD','SUCCESS',NULL),(104,600,2,'2024-05-21 16:50:52.142905','CREDIT_CARD','SUCCESS',NULL);
/*!40000 ALTER TABLE `payment_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_details_seq`
--

DROP TABLE IF EXISTS `payment_details_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_details_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_details_seq`
--

LOCK TABLES `payment_details_seq` WRITE;
/*!40000 ALTER TABLE `payment_details_seq` DISABLE KEYS */;
INSERT INTO `payment_details_seq` VALUES (201);
/*!40000 ALTER TABLE `payment_details_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rooms` (
  `rmid` int NOT NULL AUTO_INCREMENT,
  `available_date` varchar(255) DEFAULT NULL,
  `bed_types` varchar(255) DEFAULT NULL,
  `ac` varchar(255) DEFAULT NULL,
  `microwave` varchar(255) DEFAULT NULL,
  `refrigerator` varchar(255) DEFAULT NULL,
  `hotel_id` varchar(255) DEFAULT NULL,
  `num_beds` varchar(255) DEFAULT NULL,
  `price_per_night` varchar(255) DEFAULT NULL,
  `room_available` varchar(255) DEFAULT NULL,
  `room_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rmid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'2023-06-01','Queen','Yes','Yes','Yes','1','2','200','Yes','Deluxe Room'),(5,'2023-06-01','Queen','Yes','No','No','1','2','150','Yes','Standard double room'),(6,'2024-06-01','King','Yes','Yes','Yes','2','2','200','Yes','Deluxe Suite'),(7,'2024-06-05','Queen','Yes','No','Yes','3','1','250','Yes','Executive Suite'),(8,'2024-06-10','Double','Yes','No','No','4','2','150','Yes','Standard Room'),(9,'2024-06-15','King','Yes','Yes','Yes','5','1','300','Yes','Luxury Suite'),(10,'2024-06-20','Double','Yes','No','Yes','6','3','180','Yes','Family Room'),(11,'2024-06-25','Single','No','No','No','1','1','100','Yes','Economy Room'),(12,'2024-06-18','Queen','Yes','Yes','Yes','3','2','220','Yes','Junior Suite'),(13,'2024-07-01','King','Yes','Yes','Yes','4','1','600','Yes','Penthouse Suite'),(14,'2024-06-23','Double','Yes','No','Yes','5','2','180','Yes','Superior Room'),(15,'2024-06-29','Queen','Yes','No','No','6','1','170','Yes','Garden View Room'),(16,'2024-06-29','Queen','Yes','No','No','6','1','170','Yes','Garden View Room');
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-21 23:11:15
CREATE DATABASE  IF NOT EXISTS `travelmicroservicecarrental2db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `travelmicroservicecarrental2db`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: travelmicroservicecarrental2db
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `cars`
--

DROP TABLE IF EXISTS `cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cars` (
  `id` int NOT NULL AUTO_INCREMENT,
  `availability_status` bit(1) DEFAULT NULL,
  `make` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `price_per_day` double DEFAULT NULL,
  `year` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cars`
--

LOCK TABLES `cars` WRITE;
/*!40000 ALTER TABLE `cars` DISABLE KEYS */;
INSERT INTO `cars` VALUES (1,_binary '','Toyota','Camry',500,2021),(2,_binary '','Honda','Accord',400,2019),(3,_binary '','Ford','F-150',400,2021),(4,_binary '','BMW','5 Series',2000,2022),(5,_binary '','Audi','A6',1800,2021),(6,_binary '','Mercedes-Benz','E-Class',2200,2023),(7,_binary '','Tesla','Model S',2500,2022),(8,_binary '','Lexus','ES',1600,2020),(9,_binary '','Jaguar','XF',1900,2021),(10,_binary '','Volvo','S90',2100,2022),(11,_binary '','Porsche','Panamera',2800,2023),(12,_binary '','Cadillac','CT5',2000,2022),(13,_binary '','Infiniti','Q50',1500,2020),(14,_binary '','Infiniti','Q50',1500,2020);
/*!40000 ALTER TABLE `cars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amount` double DEFAULT NULL,
  `payment_date` datetime(6) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `reservation_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKp8yh4sjt3u0g6aru1oxfh3o14` (`reservation_id`),
  CONSTRAINT `FKp8yh4sjt3u0g6aru1oxfh3o14` FOREIGN KEY (`reservation_id`) REFERENCES `reservations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,1500,'2024-05-20 10:00:00.000000','SUCCESS',1),(2,1600,'2024-05-21 19:10:24.973574','SUCCESS',2),(3,1400,'2024-05-21 19:10:35.456501','SUCCESS',3),(4,1800,'2024-05-21 19:10:47.272103','SUCCESS',4),(5,2000,'2024-05-21 19:10:57.959974','SUCCESS',5),(6,2200,'2024-05-21 19:11:08.648936','SUCCESS',6),(7,2400,'2024-05-21 19:11:33.738556','SUCCESS',7),(8,1600,'2024-05-22 09:00:00.000000','SUCCESS',2),(9,1400,'2024-05-23 08:00:00.000000','SUCCESS',3),(10,1800,'2024-05-24 10:00:00.000000','SUCCESS',4),(11,2000,'2024-05-25 11:00:00.000000','SUCCESS',5),(12,2200,'2024-05-26 12:00:00.000000','SUCCESS',6),(13,2400,'2024-05-21 22:26:35.592483','SUCCESS',8),(14,2200,'2024-05-26 12:00:00.000000','SUCCESS',6);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservations`
--

DROP TABLE IF EXISTS `reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `drop_off_date_time` datetime(6) DEFAULT NULL,
  `pick_up_date_time` datetime(6) DEFAULT NULL,
  `pick_up_location` varchar(255) DEFAULT NULL,
  `reservation_date` datetime(6) DEFAULT NULL,
  `return_date` datetime(6) DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  `car_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKkoxuu4vp8ex6mcc642sa11iyc` (`car_id`),
  KEY `FKb5g9io5h54iwl2inkno50ppln` (`user_id`),
  CONSTRAINT `FKb5g9io5h54iwl2inkno50ppln` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKkoxuu4vp8ex6mcc642sa11iyc` FOREIGN KEY (`car_id`) REFERENCES `cars` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservations`
--

LOCK TABLES `reservations` WRITE;
/*!40000 ALTER TABLE `reservations` DISABLE KEYS */;
INSERT INTO `reservations` VALUES (1,'2024-05-20 10:00:00.000000','2024-05-17 10:00:00.000000','Downtown','2024-05-17 10:00:00.000000','2024-05-20 10:00:00.000000',1500,1,1),(2,'2024-05-22 09:00:00.000000','2024-05-18 09:00:00.000000','Airport','2024-05-18 09:00:00.000000','2024-05-22 09:00:00.000000',1600,2,2),(3,'2024-05-23 08:00:00.000000','2024-05-19 08:00:00.000000','City Center','2024-05-19 08:00:00.000000','2024-05-23 08:00:00.000000',1400,3,3),(4,'2024-05-24 10:00:00.000000','2024-05-20 10:00:00.000000','Suburb','2024-05-20 10:00:00.000000','2024-05-24 10:00:00.000000',1800,4,4),(5,'2024-05-25 11:00:00.000000','2024-05-21 11:00:00.000000','Hotel','2024-05-21 11:00:00.000000','2024-05-25 11:00:00.000000',2000,5,5),(6,'2024-05-26 12:00:00.000000','2024-05-22 12:00:00.000000','Resort','2024-05-22 12:00:00.000000','2024-05-26 12:00:00.000000',2200,6,6),(7,'2024-05-27 13:00:00.000000','2024-05-23 13:00:00.000000','Shopping Mall','2024-05-23 13:00:00.000000','2024-05-27 13:00:00.000000',2400,7,7),(8,'2024-05-27 13:00:00.000000','2024-05-23 13:00:00.000000','Shopping Mall','2024-05-23 13:00:00.000000','2024-05-27 13:00:00.000000',2400,7,7);
/*!40000 ALTER TABLE `reservations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'venu.d@example.com','venu madhav','8919524324'),(2,'ravi.k@example.com','Ravi Kumar','9812345678'),(3,'anita.s@example.com','Anita Sharma','9823456789'),(4,'priya.m@example.com','Priya Menon','9834567890'),(5,'vijay.d@example.com','Vijay Desai','9845678901'),(6,'amit.j@example.com','Amit Jain','9867890123'),(7,'raj.s@example.com','Raj Singh','9889012345'),(8,'anil.g@example.com','Anil Gupta','9890123456'),(9,'anil.g@example.com','Anil Gupta','9890123456'),(10,'neha.j@example.com','Neha Joshi','9901234567'),(11,'karim.j@example.com','karim','9089898989');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-21 23:11:15
