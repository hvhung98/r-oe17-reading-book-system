-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.18.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2019-04-10 17:20:02','2019-04-10 17:20:02');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authors` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_books_on_user_id` (`user_id`),
  KEY `index_books_on_category_id` (`category_id`),
  CONSTRAINT `fk_rails_1e86d9c4ec` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `fk_rails_bc582ddd02` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,1,1,'[\"Francesca Lind\", 1, 1, true, \"description0\"]',1,'description0',NULL,'2019-04-10 17:20:10','2019-04-10 17:20:10'),(2,2,2,'[\"Ms. Monserrat Beier\", 2, 2, true, \"description1\"]',1,'description1',NULL,'2019-04-10 17:20:10','2019-04-10 17:20:10'),(3,3,3,'[\"Ericka Wolf\", 3, 3, true, \"description2\"]',1,'description2',NULL,'2019-04-10 17:20:10','2019-04-10 17:20:10'),(4,4,4,'[\"Ibrahim Labadie\", 4, 4, true, \"description3\"]',1,'description3',NULL,'2019-04-10 17:20:10','2019-04-10 17:20:10'),(5,5,5,'[\"Ms. Joan Bosco\", 5, 5, true, \"description4\"]',1,'description4',NULL,'2019-04-10 17:20:10','2019-04-10 17:20:10'),(6,6,1,'[\"Ola Willms V\", 1, 6, true, \"description5\"]',1,'description5',NULL,'2019-04-10 17:20:10','2019-04-10 17:20:10'),(7,7,2,'[\"Alexanne Kirlin\", 2, 7, true, \"description6\"]',1,'description6',NULL,'2019-04-10 17:20:10','2019-04-10 17:20:10'),(8,8,3,'[\"Kara Kreiger\", 3, 8, true, \"description7\"]',1,'description7',NULL,'2019-04-10 17:20:10','2019-04-10 17:20:10'),(9,9,4,'[\"Ernestina Parisian II\", 4, 9, true, \"description8\"]',1,'description8',NULL,'2019-04-10 17:20:10','2019-04-10 17:20:10'),(10,10,5,'[\"Major Heaney\", 5, 10, true, \"description9\"]',1,'description9',NULL,'2019-04-10 17:20:10','2019-04-10 17:20:10'),(11,11,1,'[\"Dr. Anastacio Sporer\", 1, 11, true, \"description10\"]',1,'description10',NULL,'2019-04-10 17:20:10','2019-04-10 17:20:10'),(12,12,2,'[\"Terrill Dietrich\", 2, 12, true, \"description11\"]',1,'description11',NULL,'2019-04-10 17:20:10','2019-04-10 17:20:10'),(13,13,3,'[\"Kevin Davis\", 3, 13, true, \"description12\"]',1,'description12',NULL,'2019-04-10 17:20:10','2019-04-10 17:20:10'),(14,14,4,'[\"Macy Bosco\", 4, 14, true, \"description13\"]',1,'description13',NULL,'2019-04-10 17:20:10','2019-04-10 17:20:10'),(15,15,5,'[\"Leola Homenick\", 5, 15, true, \"description14\"]',1,'description14',NULL,'2019-04-10 17:20:10','2019-04-10 17:20:10'),(16,16,1,'[\"Mrs. Lina Cruickshank\", 1, 16, true, \"description15\"]',1,'description15',NULL,'2019-04-10 17:20:11','2019-04-10 17:20:11'),(17,17,2,'[\"Nadia Schowalter\", 2, 17, true, \"description16\"]',1,'description16',NULL,'2019-04-10 17:20:11','2019-04-10 17:20:11'),(18,18,3,'[\"Ellis Nikolaus\", 3, 18, true, \"description17\"]',1,'description17',NULL,'2019-04-10 17:20:11','2019-04-10 17:20:11'),(19,19,4,'[\"Magdalena Hoeger PhD\", 4, 19, true, \"description18\"]',1,'description18',NULL,'2019-04-10 17:20:11','2019-04-10 17:20:11'),(20,20,5,'[\"Mrs. Ari Runolfsson\", 5, 20, true, \"description19\"]',1,'description19',NULL,'2019-04-10 17:20:11','2019-04-10 17:20:11'),(21,21,1,'[\"Monserrat VonRueden\", 1, 21, true, \"description20\"]',1,'description20',NULL,'2019-04-10 17:20:11','2019-04-10 17:20:11'),(22,1,2,'[\"Carlos Wiza\", 2, 1, true, \"description21\"]',1,'description21',NULL,'2019-04-10 17:20:11','2019-04-10 17:20:11'),(23,2,3,'[\"Ottis Pfeffer\", 3, 2, true, \"description22\"]',1,'description22',NULL,'2019-04-10 17:20:11','2019-04-10 17:20:11'),(24,3,4,'[\"Ms. Keon Ferry\", 4, 3, true, \"description23\"]',1,'description23',NULL,'2019-04-10 17:20:11','2019-04-10 17:20:11'),(25,4,5,'[\"Hayley Miller\", 5, 4, true, \"description24\"]',1,'description24',NULL,'2019-04-10 17:20:11','2019-04-10 17:20:11'),(26,5,1,'[\"Adolf Hansen\", 1, 5, true, \"description25\"]',1,'description25',NULL,'2019-04-10 17:20:11','2019-04-10 17:20:11'),(27,6,2,'[\"Laisha Kuhn\", 2, 6, true, \"description26\"]',1,'description26',NULL,'2019-04-10 17:20:11','2019-04-10 17:20:11'),(28,7,3,'[\"Era Christiansen\", 3, 7, true, \"description27\"]',1,'description27',NULL,'2019-04-10 17:20:11','2019-04-10 17:20:11'),(29,8,4,'[\"Tobin King\", 4, 8, true, \"description28\"]',1,'description28',NULL,'2019-04-10 17:20:11','2019-04-10 17:20:11'),(30,9,5,'[\"Sallie Hamill\", 5, 9, true, \"description29\"]',1,'description29',NULL,'2019-04-10 17:20:11','2019-04-10 17:20:11'),(31,10,1,'[\"Ronny Botsford\", 1, 10, true, \"description30\"]',1,'description30',NULL,'2019-04-10 17:20:11','2019-04-10 17:20:11'),(32,11,2,'[\"Trevor Collier II\", 2, 11, true, \"description31\"]',1,'description31',NULL,'2019-04-10 17:20:11','2019-04-10 17:20:11'),(33,12,3,'[\"Aylin Tremblay PhD\", 3, 12, true, \"description32\"]',1,'description32',NULL,'2019-04-10 17:20:11','2019-04-10 17:20:11'),(34,13,4,'[\"Yvette Herman\", 4, 13, true, \"description33\"]',1,'description33',NULL,'2019-04-10 17:20:11','2019-04-10 17:20:11'),(35,14,5,'[\"Janie Jones\", 5, 14, true, \"description34\"]',1,'description34',NULL,'2019-04-10 17:20:11','2019-04-10 17:20:11'),(36,15,1,'[\"Miss Gladyce Dickinson\", 1, 15, true, \"description35\"]',1,'description35',NULL,'2019-04-10 17:20:11','2019-04-10 17:20:11'),(37,16,2,'[\"Mrs. Shawna Kunze\", 2, 16, true, \"description36\"]',1,'description36',NULL,'2019-04-10 17:20:12','2019-04-10 17:20:12'),(38,17,3,'[\"Shanny Weimann\", 3, 17, true, \"description37\"]',1,'description37',NULL,'2019-04-10 17:20:12','2019-04-10 17:20:12'),(39,18,4,'[\"Ahmed Balistreri\", 4, 18, true, \"description38\"]',1,'description38',NULL,'2019-04-10 17:20:12','2019-04-10 17:20:12'),(40,19,5,'[\"Shad Kunde\", 5, 19, true, \"description39\"]',1,'description39',NULL,'2019-04-10 17:20:12','2019-04-10 17:20:12'),(41,20,1,'[\"Myah Rice\", 1, 20, true, \"description40\"]',1,'description40',NULL,'2019-04-10 17:20:12','2019-04-10 17:20:12'),(42,21,2,'[\"Allan Jacobs\", 2, 21, true, \"description41\"]',1,'description41',NULL,'2019-04-10 17:20:12','2019-04-10 17:20:12'),(43,1,3,'[\"Annamae Simonis\", 3, 1, true, \"description42\"]',1,'description42',NULL,'2019-04-10 17:20:12','2019-04-10 17:20:12'),(44,2,4,'[\"Flossie Bins\", 4, 2, true, \"description43\"]',1,'description43',NULL,'2019-04-10 17:20:12','2019-04-10 17:20:12'),(45,3,5,'[\"Alexzander Gutkowski\", 5, 3, true, \"description44\"]',1,'description44',NULL,'2019-04-10 17:20:12','2019-04-10 17:20:12'),(46,4,1,'[\"Dagmar Lehner\", 1, 4, true, \"description45\"]',1,'description45',NULL,'2019-04-10 17:20:12','2019-04-10 17:20:12'),(47,5,2,'[\"Franco Donnelly\", 2, 5, true, \"description46\"]',1,'description46',NULL,'2019-04-10 17:20:12','2019-04-10 17:20:12'),(48,6,3,'[\"Dwight Johnston\", 3, 6, true, \"description47\"]',1,'description47',NULL,'2019-04-10 17:20:12','2019-04-10 17:20:12'),(49,7,4,'[\"Newell Rogahn\", 4, 7, true, \"description48\"]',1,'description48',NULL,'2019-04-10 17:20:12','2019-04-10 17:20:12'),(50,8,5,'[\"Celia Pacocha\", 5, 8, true, \"description49\"]',1,'description49',NULL,'2019-04-10 17:20:12','2019-04-10 17:20:12'),(51,9,1,'[\"Lorna Hahn MD\", 1, 9, true, \"description50\"]',1,'description50',NULL,'2019-04-10 17:20:12','2019-04-10 17:20:12'),(52,10,2,'[\"Blaise Nolan MD\", 2, 10, true, \"description51\"]',1,'description51',NULL,'2019-04-10 17:20:12','2019-04-10 17:20:12'),(53,11,3,'[\"Rory Reilly\", 3, 11, true, \"description52\"]',1,'description52',NULL,'2019-04-10 17:20:12','2019-04-10 17:20:12'),(54,12,4,'[\"Roy Hoeger\", 4, 12, true, \"description53\"]',1,'description53',NULL,'2019-04-10 17:20:12','2019-04-10 17:20:12'),(55,13,5,'[\"Mr. Neva Schumm\", 5, 13, true, \"description54\"]',1,'description54',NULL,'2019-04-10 17:20:12','2019-04-10 17:20:12'),(56,14,1,'[\"Santa Moore\", 1, 14, true, \"description55\"]',1,'description55',NULL,'2019-04-10 17:20:12','2019-04-10 17:20:12'),(57,15,2,'[\"Darwin Barrows\", 2, 15, true, \"description56\"]',1,'description56',NULL,'2019-04-10 17:20:12','2019-04-10 17:20:12'),(58,16,3,'[\"Keira Cronin\", 3, 16, true, \"description57\"]',1,'description57',NULL,'2019-04-10 17:20:13','2019-04-10 17:20:13'),(59,17,4,'[\"Leopoldo Powlowski\", 4, 17, true, \"description58\"]',1,'description58',NULL,'2019-04-10 17:20:13','2019-04-10 17:20:13'),(60,18,5,'[\"Chase Buckridge V\", 5, 18, true, \"description59\"]',1,'description59',NULL,'2019-04-10 17:20:13','2019-04-10 17:20:13'),(61,19,1,'[\"Benjamin Daugherty\", 1, 19, true, \"description60\"]',1,'description60',NULL,'2019-04-10 17:20:13','2019-04-10 17:20:13'),(62,20,2,'[\"Johann Heller\", 2, 20, true, \"description61\"]',1,'description61',NULL,'2019-04-10 17:20:13','2019-04-10 17:20:13'),(63,21,3,'[\"Chester King\", 3, 21, true, \"description62\"]',1,'description62',NULL,'2019-04-10 17:20:13','2019-04-10 17:20:13'),(64,1,4,'[\"Annabelle Johnson V\", 4, 1, true, \"description63\"]',1,'description63',NULL,'2019-04-10 17:20:13','2019-04-10 17:20:13'),(65,2,5,'[\"Howell Becker\", 5, 2, true, \"description64\"]',1,'description64',NULL,'2019-04-10 17:20:13','2019-04-10 17:20:13'),(66,3,1,'[\"Emmy Wisozk\", 1, 3, true, \"description65\"]',1,'description65',NULL,'2019-04-10 17:20:13','2019-04-10 17:20:13'),(67,4,2,'[\"Eli Mosciski\", 2, 4, true, \"description66\"]',1,'description66',NULL,'2019-04-10 17:20:13','2019-04-10 17:20:13'),(68,5,3,'[\"Donny Lueilwitz\", 3, 5, true, \"description67\"]',1,'description67',NULL,'2019-04-10 17:20:13','2019-04-10 17:20:13'),(69,6,4,'[\"Kay Brown\", 4, 6, true, \"description68\"]',1,'description68',NULL,'2019-04-10 17:20:13','2019-04-10 17:20:13'),(70,7,5,'[\"Athena Harber\", 5, 7, true, \"description69\"]',1,'description69',NULL,'2019-04-10 17:20:13','2019-04-10 17:20:13'),(71,8,1,'[\"Rodger Deckow V\", 1, 8, true, \"description70\"]',1,'description70',NULL,'2019-04-10 17:20:13','2019-04-10 17:20:13'),(72,9,2,'[\"Geovany Nolan\", 2, 9, true, \"description71\"]',1,'description71',NULL,'2019-04-10 17:20:13','2019-04-10 17:20:13'),(73,10,3,'[\"Loren Kuhn\", 3, 10, true, \"description72\"]',1,'description72',NULL,'2019-04-10 17:20:13','2019-04-10 17:20:13'),(74,11,4,'[\"Xzavier Turcotte\", 4, 11, true, \"description73\"]',1,'description73',NULL,'2019-04-10 17:20:13','2019-04-10 17:20:13'),(75,12,5,'[\"Pearline Wehner\", 5, 12, true, \"description74\"]',1,'description74',NULL,'2019-04-10 17:20:13','2019-04-10 17:20:13'),(76,13,1,'[\"Mr. Marian Bogan\", 1, 13, true, \"description75\"]',1,'description75',NULL,'2019-04-10 17:20:13','2019-04-10 17:20:13'),(77,14,2,'[\"Bradford Wilderman\", 2, 14, true, \"description76\"]',1,'description76',NULL,'2019-04-10 17:20:13','2019-04-10 17:20:13'),(78,15,3,'[\"Kayli Haag\", 3, 15, true, \"description77\"]',1,'description77',NULL,'2019-04-10 17:20:13','2019-04-10 17:20:13'),(79,16,4,'[\"Susana Stokes\", 4, 16, true, \"description78\"]',1,'description78',NULL,'2019-04-10 17:20:13','2019-04-10 17:20:13'),(80,17,5,'[\"Lonzo McLaughlin\", 5, 17, true, \"description79\"]',1,'description79',NULL,'2019-04-10 17:20:13','2019-04-10 17:20:13'),(81,18,1,'[\"Meghan Rodriguez\", 1, 18, true, \"description80\"]',1,'description80',NULL,'2019-04-10 17:20:13','2019-04-10 17:20:13'),(82,19,2,'[\"Garnett Russel\", 2, 19, true, \"description81\"]',1,'description81',NULL,'2019-04-10 17:20:14','2019-04-10 17:20:14'),(83,20,3,'[\"Ronny Haley\", 3, 20, true, \"description82\"]',1,'description82',NULL,'2019-04-10 17:20:14','2019-04-10 17:20:14'),(84,21,4,'[\"Emie Hudson\", 4, 21, true, \"description83\"]',1,'description83',NULL,'2019-04-10 17:20:14','2019-04-10 17:20:14'),(85,1,5,'[\"Arno Kuvalis\", 5, 1, true, \"description84\"]',1,'description84',NULL,'2019-04-10 17:20:14','2019-04-10 17:20:14'),(86,2,1,'[\"Clair Rogahn\", 1, 2, true, \"description85\"]',1,'description85',NULL,'2019-04-10 17:20:14','2019-04-10 17:20:14'),(87,3,2,'[\"Destini Yundt\", 2, 3, true, \"description86\"]',1,'description86',NULL,'2019-04-10 17:20:14','2019-04-10 17:20:14'),(88,4,3,'[\"Miss Ruthe Jast\", 3, 4, true, \"description87\"]',1,'description87',NULL,'2019-04-10 17:20:14','2019-04-10 17:20:14'),(89,5,4,'[\"Princess Braun\", 4, 5, true, \"description88\"]',1,'description88',NULL,'2019-04-10 17:20:14','2019-04-10 17:20:14'),(90,6,5,'[\"Ettie Barton\", 5, 6, true, \"description89\"]',1,'description89',NULL,'2019-04-10 17:20:14','2019-04-10 17:20:14'),(91,7,1,'[\"Isabelle Batz\", 1, 7, true, \"description90\"]',1,'description90',NULL,'2019-04-10 17:20:14','2019-04-10 17:20:14'),(92,8,2,'[\"Jaylon Pfeffer\", 2, 8, true, \"description91\"]',1,'description91',NULL,'2019-04-10 17:20:14','2019-04-10 17:20:14'),(93,9,3,'[\"Alva Hudson III\", 3, 9, true, \"description92\"]',1,'description92',NULL,'2019-04-10 17:20:14','2019-04-10 17:20:14'),(94,10,4,'[\"Talia Tillman\", 4, 10, true, \"description93\"]',1,'description93',NULL,'2019-04-10 17:20:14','2019-04-10 17:20:14'),(95,11,5,'[\"Emmitt Adams III\", 5, 11, true, \"description94\"]',1,'description94',NULL,'2019-04-10 17:20:14','2019-04-10 17:20:14'),(96,12,1,'[\"Solon Spinka\", 1, 12, true, \"description95\"]',1,'description95',NULL,'2019-04-10 17:20:14','2019-04-10 17:20:14'),(97,13,2,'[\"Tillman Welch\", 2, 13, true, \"description96\"]',1,'description96',NULL,'2019-04-10 17:20:14','2019-04-10 17:20:14'),(98,14,3,'[\"Stephany Harvey\", 3, 14, true, \"description97\"]',1,'description97',NULL,'2019-04-10 17:20:14','2019-04-10 17:20:14'),(99,15,4,'[\"Providenci Stracke\", 4, 15, true, \"description98\"]',1,'description98',NULL,'2019-04-10 17:20:14','2019-04-10 17:20:14'),(100,16,5,'[\"Cornell Klein\", 5, 16, true, \"description99\"]',1,'description99',NULL,'2019-04-10 17:20:14','2019-04-10 17:20:14');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Học ngoại ngữ','2019-04-10 17:20:07','2019-04-10 17:20:07'),(2,'Khoa học - Kĩ thuật','2019-04-10 17:20:07','2019-04-10 17:20:07'),(3,'Tâm Lý - Kỹ Năng Sống','2019-04-10 17:20:07','2019-04-10 17:20:07'),(4,'Văn hóa - Tôn giáo','2019-04-10 17:20:07','2019-04-10 17:20:07'),(5,'Lịch sử - Chính trị','2019-04-10 17:20:07','2019-04-10 17:20:07');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chapters`
--

DROP TABLE IF EXISTS `chapters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chapters` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `book_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `content` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_chapters_on_book_id` (`book_id`),
  CONSTRAINT `fk_rails_71ecfd0b86` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chapters`
--

LOCK TABLES `chapters` WRITE;
/*!40000 ALTER TABLE `chapters` DISABLE KEYS */;
/*!40000 ALTER TABLE `chapters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `book_id` bigint(20) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_comments_on_user_id` (`user_id`),
  KEY `index_comments_on_book_id` (`book_id`),
  CONSTRAINT `fk_rails_03de2dc08c` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_rails_a98e86e5b9` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follows`
--

DROP TABLE IF EXISTS `follows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `follows` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_follows_on_user_id` (`user_id`),
  KEY `index_follows_on_category_id` (`category_id`),
  CONSTRAINT `fk_rails_32479bd030` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_rails_40148eff14` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follows`
--

LOCK TABLES `follows` WRITE;
/*!40000 ALTER TABLE `follows` DISABLE KEYS */;
/*!40000 ALTER TABLE `follows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `histories`
--

DROP TABLE IF EXISTS `histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `histories` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `activity_type` varchar(255) DEFAULT NULL,
  `activity_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_histories_on_user_id` (`user_id`),
  CONSTRAINT `fk_rails_ddbf5f9cca` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `histories`
--

LOCK TABLES `histories` WRITE;
/*!40000 ALTER TABLE `histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `book_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_likes_on_user_id` (`user_id`),
  KEY `index_likes_on_book_id` (`book_id`),
  CONSTRAINT `fk_rails_15895dfb71` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  CONSTRAINT `fk_rails_1e09b5dabf` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'normal','2019-04-10 17:20:07','2019-04-10 17:20:07'),(2,'moderrator','2019-04-10 17:20:07','2019-04-10 17:20:07'),(3,'admin','2019-04-10 17:20:07','2019-04-10 17:20:07');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20190410064117'),('20190410064235'),('20190410064713'),('20190410065235'),('20190410065304'),('20190410065348'),('20190410065903'),('20190410070035'),('20190410070138'),('20190410070404'),('20190410070716'),('20190410154359');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'normal',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `password_digest` varchar(255) DEFAULT NULL,
  `remember_digest` varchar(255) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_users_on_role_id` (`role_id`),
  CONSTRAINT `fk_rails_642f17018b` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,3,'admin','admin@gmail.com','0','2019-04-10 17:20:07','2019-04-10 17:20:07','$2a$10$ATvdszXMQtz7aiGZfhUFkuyxqmlzW8iMaXHJH0cI3vzJmtC1JeR92',NULL,NULL),(2,1,'Mrs. Efren Cormier','user1@gmail.com','0','2019-04-10 17:20:08','2019-04-10 17:20:08','$2a$10$KpbfVZM9EPwmPZAltImOEu0vxoha2zmWgudo5ZvD6EF6vD1EBnDYG',NULL,NULL),(3,1,'Ariane Roberts IV','user2@gmail.com','0','2019-04-10 17:20:08','2019-04-10 17:20:08','$2a$10$wq0tu8BJOVRNyD/zo/kB1O3TmVcCBzSxlpboLNnsSdW1UGNeAuxpm',NULL,NULL),(4,1,'Cristobal Williamson','user3@gmail.com','0','2019-04-10 17:20:08','2019-04-10 17:20:08','$2a$10$aIeJDfMkseT67b/6N7IuEesADRiV1HuqA5Wk8kD50KSdEw9ps1uni',NULL,NULL),(5,1,'Dejuan Koss','user4@gmail.com','0','2019-04-10 17:20:08','2019-04-10 17:20:08','$2a$10$tXJNMEJxzuymLy8MglvknORykahwO1/g66.FVrwkhh3Q6Xa96RSq6',NULL,NULL),(6,1,'Merritt Rath III','user5@gmail.com','0','2019-04-10 17:20:08','2019-04-10 17:20:08','$2a$10$aQY0BUok3Lk0uWZP7DmbC.WebmbUw0QrtNDUbq5ePD50M/UY9Sd2W',NULL,NULL),(7,1,'Mina O\'Hara','user6@gmail.com','0','2019-04-10 17:20:08','2019-04-10 17:20:08','$2a$10$XyV0mEZbk4bb3LdCuwjcXOs.kvHb5LIHCpk5YorAiZxg4o.Q.ZoM.',NULL,NULL),(8,1,'Jacinto Effertz','user7@gmail.com','0','2019-04-10 17:20:09','2019-04-10 17:20:09','$2a$10$/ZxuWmEufBYZSaBQrrM2Pedgvf.W1k8Ah4F8w24ZCluAFvA3JukTO',NULL,NULL),(9,1,'Adrianna Cruickshank','user8@gmail.com','0','2019-04-10 17:20:09','2019-04-10 17:20:09','$2a$10$zqqgo/vRCcRKkBfVr6RzYei/YNeSlF81hD/WVGBBf8xkILtb2RwBK',NULL,NULL),(10,1,'Leila Hermiston','user9@gmail.com','0','2019-04-10 17:20:09','2019-04-10 17:20:09','$2a$10$9d1omDWEUP556Q2iXcWNx.pY2qTJ3Rgt8Q6nMTH/Nbze9v1g0DpQO',NULL,NULL),(11,1,'Brielle Bernhard','user10@gmail.com','0','2019-04-10 17:20:09','2019-04-10 17:20:09','$2a$10$B0X8IBl9NAV/9qzBZWIHse40Qq90asuBP5mbWGKssurnsg1KgQ4O.',NULL,NULL),(12,1,'Abdullah Parker','user11@gmail.com','0','2019-04-10 17:20:09','2019-04-10 17:20:09','$2a$10$aOFybwYcG14s.VzZOPhUgepD5jr7hb.DeOw7UkA/D3JzCekfRCdbO',NULL,NULL),(13,1,'Dino Dickinson MD','user12@gmail.com','0','2019-04-10 17:20:09','2019-04-10 17:20:09','$2a$10$EdBf82/mBIse59UvnmvdrehJvoGb/ygdaKZjFCeJZEaHiUsBICXj.',NULL,NULL),(14,1,'Jennyfer Welch DDS','user13@gmail.com','0','2019-04-10 17:20:09','2019-04-10 17:20:09','$2a$10$izC4W9W5nEXdWvU4kX3.QOBrcexp8jsnxeRHz1dPou.TNzQ3N/2Yi',NULL,NULL),(15,1,'Susana Schiller','user14@gmail.com','0','2019-04-10 17:20:09','2019-04-10 17:20:09','$2a$10$NR6tqsZoUtm3PiLFDolcjeszlp3R0Ql8dmt9XINdALY0lpi3Tftg6',NULL,NULL),(16,1,'Miss Loren Schaefer','user15@gmail.com','0','2019-04-10 17:20:09','2019-04-10 17:20:09','$2a$10$LnrXeFxZcGBYXj2Yi2KfSOwpr8DbcYHxAdWINU2oIflMgTxhb2GjC',NULL,NULL),(17,1,'Dr. Serenity Morar','user16@gmail.com','0','2019-04-10 17:20:09','2019-04-10 17:20:09','$2a$10$t3KWrC6WvsJ8rBKmN67RC.g82ShQaPzuw6k7rCwvoUilVcVQOZ/zO',NULL,NULL),(18,1,'Rhett Torphy','user17@gmail.com','0','2019-04-10 17:20:09','2019-04-10 17:20:09','$2a$10$yQalj.zmQcEGi0MZkOYFCe3kJReIdheBZTCtYcobl0cjUAco4pNsW',NULL,NULL),(19,1,'Paris Wintheiser','user18@gmail.com','0','2019-04-10 17:20:10','2019-04-10 17:20:10','$2a$10$suvGLzr7vb.iC1SSDl7vm.CB3ZGEiMzbRAVnMkGfKYC5ewQpqkjCe',NULL,NULL),(20,1,'Oswaldo Dibbert Sr.','user19@gmail.com','0','2019-04-10 17:20:10','2019-04-10 17:20:10','$2a$10$pRwYAw/I1VNwVUCBvWTDXuAglkGaBUlbf5ypVzuy8hLBjqDJ5liny',NULL,NULL),(21,1,'Cassandra O\'Hara','user20@gmail.com','0','2019-04-10 17:20:10','2019-04-10 17:20:10','$2a$10$aBa2ep25i1UEgyWYfEvjzevaUS8qTbFPN9wb0FJd7klyFuQ.liZ.a',NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `written_bies`
--

DROP TABLE IF EXISTS `written_bies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `written_bies` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `author_id` bigint(20) DEFAULT NULL,
  `book_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_written_bies_on_author_id` (`author_id`),
  KEY `index_written_bies_on_book_id` (`book_id`),
  CONSTRAINT `fk_rails_c962358642` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`),
  CONSTRAINT `fk_rails_ec4e53f3b8` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `written_bies`
--

LOCK TABLES `written_bies` WRITE;
/*!40000 ALTER TABLE `written_bies` DISABLE KEYS */;
/*!40000 ALTER TABLE `written_bies` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-11  0:25:17
