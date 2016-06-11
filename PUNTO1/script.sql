-- MySQL dump 10.13  Distrib 5.7.9, for Win32 (AMD64)
--
-- Host: 127.0.0.1    Database: pruebamysql
CREATE SCHEMA IF NOT EXISTS `pruebamysql2` DEFAULT CHARACTER SET latin1 ;
USE pruebamysql2;
-- ------------------------------------------------------
-- Server version	5.7.12-log

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `category_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category_name` varchar(150) DEFAULT NULL,
  `remarks` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Comedy',NULL),(2,'Action',NULL),(3,'Adventure',NULL),(4,'Horror',NULL),(5,'Drama',NULL),(6,'Science Fiction',NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `members` (
  `membership_number` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `full_names` varchar(150) DEFAULT NULL,
  `gender` varchar(6) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `physical_address` varchar(255) DEFAULT NULL,
  `postal_address` varchar(255) DEFAULT NULL,
  `conctact_number` varchar(75) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`membership_number`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'Andrea Enriquea','female','1993-06-08',NULL,NULL,NULL,NULL),(4,'David Salazar','male','1981-09-26',NULL,NULL,NULL,NULL),(5,'Alex Samboni','male','1985-11-23',NULL,NULL,NULL,NULL),(6,'Oscar Rendon','male','1984-03-11',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movierentals`
--

DROP TABLE IF EXISTS `movierentals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movierentals` (
  `reference_number` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_Date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `membership_number` int(11) unsigned NOT NULL,
  `movie_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`reference_number`),
  KEY `UK_MovieRentals_membership_number` (`membership_number`),
  KEY `FK_movierentals_movies_movie_id` (`movie_id`),
  CONSTRAINT `FK_movierentals_members_membership_number` FOREIGN KEY (`membership_number`) REFERENCES `members` (`membership_number`),
  CONSTRAINT `FK_movierentals_movies_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movierentals`
--

LOCK TABLES `movierentals` WRITE;
/*!40000 ALTER TABLE `movierentals` DISABLE KEYS */;
INSERT INTO `movierentals` VALUES (1,'2016-06-10','2016-06-11',1,1),(2,'2016-06-09','2016-06-12',1,5),(3,'2016-06-11','2016-06-13',4,6);
/*!40000 ALTER TABLE `movierentals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movies` (
  `movie_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(350) DEFAULT NULL,
  `director` varchar(150) DEFAULT NULL,
  `year_released` varchar(4) DEFAULT NULL,
  `category_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`movie_id`),
  KEY `FK_movies_categories_category_id` (`category_id`),
  CONSTRAINT `FK_movies_categories_category_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (1,'Tortugas ninja 2','Dave Green','2000',2),(4,'The Conjuring 2','James Wan','2015',4),(5,'X-Men: Apocalipsis','Bryan Singer','2016',2),(6,'Terminator','James Cameron','1984',2),(7,'Titanic','James Cameron','1997',5),(8,'Ghost in the Shell','Mamoru Oshii','1995',6),(9,'Alicia a traves del espejo',' Thea Sharrock','2016',5);
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payments` (
  `payment_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `membership_number` int(11) unsigned NOT NULL,
  `payment_date` date DEFAULT NULL,
  `description` varchar(75) DEFAULT NULL,
  `amount_paid` float DEFAULT NULL,
  `external_reference_number` int(11) DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `FK_payments_members_membership_number` (`membership_number`),
  CONSTRAINT `FK_payments_members_membership_number` FOREIGN KEY (`membership_number`) REFERENCES `members` (`membership_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-11 14:10:57
