-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: beritacoding
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article` (
  `id` varchar(32) NOT NULL,
  `title` varchar(128) DEFAULT NULL,
  `slug` varchar(128) NOT NULL,
  `content` text,
  `draft` enum('true','false') NOT NULL DEFAULT 'true',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES ('61b76a823b3e57.09689587','Hello World!','hello-world-61b76a823b3e57.09689587','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum dui nibh, consectetur eu varius sit amet, fringilla at arcu. Cras fringilla pretium diam ut consectetur. Aliquam molestie augue nibh, at maximus sem fringilla in. Nullam ut metus ullamcorper, pharetra felis eu, efficitur lorem. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed convallis facilisis urna, id rutrum dui elementum sit amet. Mauris quam ex, molestie tempus dolor vitae, rhoncus volutpat lorem. Proin ac diam ac ex placerat maximus nec in turpis.','false','2021-12-13 22:45:06'),('61b7822c1baf15.67160129','Ini Konten Baru','ini-konten-baru-61b7822c1baf15.67160129','<blockquote>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum dui nibh, consectetur eu varius sit amet, fringilla at arcu. Cras fringilla pretium diam ut consectetur. Aliquam molestie augue nibh, at maximus sem fringilla in. Nullam ut metus ullamcorper, pharetra felis eu, efficitur lorem. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed convallis facilisis urna, id rutrum dui elementum sit amet. Mauris quam ex, molestie tempus dolor vitae, rhoncus volutpat lorem. </blockquote><blockquote>Proin ac diam ac ex placerat maximus nec in turpis. Donec ultrices efficitur diam eu tincidunt. Morbi vulputate leo vel luctus sollicitudin. Integer scelerisque, sapien eu auctor aliquam, metus erat ultrices lacus, a dignissim nulla tortor non mauris. Vivamus in facilisis nibh, a suscipit arcu. In feugiat ex ac enim egestas pellentesque. Nullam sodales vel sapien in viverra. Nunc vehicula mollis lacus in feugiat. Nam scelerisque fringilla vulputate. Vivamus et enim id justo tincidunt cursus. Suspendisse lacinia et arcu egestas tempor. Mauris at risus ac orci rutrum lacinia. Donec commodo risus sem, ut tempus odio eleifend ac. Integer diam tortor, lobortis a augue non, luctus laoreet metus. Morbi et dolor pharetra, accumsan purus vitae, eleifend neque.</blockquote>','false','2021-12-14 00:26:04');
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `id` varchar(32) NOT NULL,
  `name` varchar(32) NOT NULL,
  `email` varchar(32) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` varchar(32) NOT NULL,
  `name` varchar(32) NOT NULL,
  `email` varchar(64) NOT NULL,
  `username` varchar(64) NOT NULL,
  `password` varchar(255) NOT NULL,
  `avatar` varchar(32) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `last_login` timestamp NULL DEFAULT NULL,
  `password_updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('6118b2a943acc2.78631959','Rahmat Rafli','rahmatrafli1@gmail.com','admin','$2y$10$0JlTba7onav0iS6b/aSv2O.QPKBlJaaAu9kXLbbkuPSN3WOeJBak2','6118b2a943acc278631959.png','2021-08-14 23:22:33','2021-12-13 11:34:13','2021-12-13 18:14:01');
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

-- Dump completed on 2021-12-14  0:40:09
