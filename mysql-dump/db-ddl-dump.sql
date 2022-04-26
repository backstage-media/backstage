-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: test
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
-- Table structure for table `agreements`
--

DROP TABLE IF EXISTS `agreements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agreements` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `months` int NOT NULL,
  `price_per_month` int NOT NULL,
  `discount` int NOT NULL,
  `manager_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `agreements_manager_id_foreign` (`manager_id`),
  CONSTRAINT `agreements_manager_id_foreign` FOREIGN KEY (`manager_id`) REFERENCES `managers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agreements`
--

LOCK TABLES `agreements` WRITE;
/*!40000 ALTER TABLE `agreements` DISABLE KEYS */;
INSERT INTO `agreements` VALUES (2,'2022-02-20 11:47:37','2022-02-20 11:47:37',6,83,50,5),(3,'2022-02-20 12:10:26','2022-02-20 12:10:26',3,109,10,5),(4,'2022-02-28 12:33:36','2022-02-28 12:33:36',6,145,20,5),(5,'2022-04-21 08:24:54','2022-04-21 08:24:54',6,77,20,5),(6,'2022-04-21 08:26:26','2022-04-21 08:26:26',3,124,60,5),(7,'2022-04-21 08:28:43','2022-04-21 08:28:43',1,70,30,5),(8,'2022-04-21 08:28:48','2022-04-21 08:28:48',1,131,30,5);
/*!40000 ALTER TABLE `agreements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `video_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `youtube_second` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_user_id_foreign` (`user_id`),
  CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'2022-03-12 10:59:02','2022-03-12 10:59:02','Tesssssstt',1,'Guest User',0),(2,'2022-03-12 11:02:44','2022-03-12 11:02:44','TESSSSTTTT',1,'cdm2MziC7q4',0),(3,'2022-03-12 11:13:18','2022-03-12 11:13:18','teeeeeeeeeeeeeeeeeeee',1,'cdm2MziC7q4',0),(4,'2022-03-12 11:33:17','2022-03-12 11:33:17','Testeoooooooooooooooooooo',1,'cdm2MziC7q4',0),(5,'2022-03-12 12:25:48','2022-03-12 12:25:48','<a href=\"https://google.es\">Testeooo</a>',1,'cdm2MziC7q4',0),(6,'2022-03-12 12:30:42','2022-03-12 12:30:42','Este video es una mierda, la verdad.',14,'cdm2MziC7q4',0),(8,'2022-03-12 16:08:15','2022-03-12 16:08:15','Testeooooooooooooo',1,'wPpJIIwmTKA',0),(9,'2022-04-18 15:20:09','2022-04-18 15:20:09','This is a test message, notifications should work!',20,'wPpJIIwmTKA',0),(10,'2022-04-18 15:39:23','2022-04-18 15:39:23','Otra pruebaaa!',20,'wPpJIIwmTKA',0),(11,'2022-04-18 15:51:18','2022-04-18 15:51:18','AAAAAAAAAAAA',20,'wPpJIIwmTKA',0),(12,'2022-04-18 15:51:45','2022-04-18 15:51:45','AAAAAAAAAAAAsssssssssssssssssss',20,'wPpJIIwmTKA',0),(13,'2022-04-18 15:52:25','2022-04-18 15:52:25','atuuun',20,'wPpJIIwmTKA',0),(14,'2022-04-19 07:36:42','2022-04-19 07:36:42','Este video es la leche!',17,'Mu2bwy4J1mk',0),(15,'2022-04-19 10:36:27','2022-04-19 10:36:27','Comentario desde el manager, ahi lo llevas.',14,'cdm2MziC7q4',0),(16,'2022-04-19 10:38:55','2022-04-19 10:38:55','Otro comentario maestro.',14,'cdm2MziC7q4',0),(17,'2022-04-19 10:52:57','2022-04-19 10:52:57','Gracias por publicarlo!',17,'BUHKuKOtgGg',0),(18,'2022-04-19 11:01:46','2022-04-19 11:01:46','Otra prueba de comment!',17,'BUHKuKOtgGg',0),(19,'2022-04-19 11:02:01','2022-04-19 11:02:01','Another test again',17,'BUHKuKOtgGg',0),(20,'2022-04-19 11:02:15','2022-04-19 11:02:15','Testing 1,2,3',17,'BUHKuKOtgGg',0),(21,'2022-04-19 11:05:59','2022-04-19 11:05:59','Testeeeeeee',17,'BUHKuKOtgGg',0),(22,'2022-04-19 11:07:32','2022-04-19 11:07:32','Tessssssssssssssssstt',17,'BUHKuKOtgGg',0),(23,'2022-04-19 11:10:19','2022-04-19 11:10:19','Teeeestttttt',17,'BUHKuKOtgGg',0),(24,'2022-04-19 11:10:37','2022-04-19 11:10:37','Addddddddddddddd',17,'BUHKuKOtgGg',0),(25,'2022-04-19 11:12:15','2022-04-19 11:12:15','Ahoraaaaaa',17,'BUHKuKOtgGg',0),(26,'2022-04-19 11:13:09','2022-04-19 11:13:09','aaaaaaaaaaaaaaaaa',17,'BUHKuKOtgGg',0),(27,'2022-04-19 11:13:20','2022-04-19 11:13:20','aaaaaaaaaaaaaaaaaaaaaaaaaa',17,'BUHKuKOtgGg',0),(28,'2022-04-19 11:14:02','2022-04-19 11:14:02','eeeeeeeeee',17,'BUHKuKOtgGg',0),(29,'2022-04-19 11:19:44','2022-04-19 11:19:44','aaaa',17,'BUHKuKOtgGg',0),(30,'2022-04-19 11:20:51','2022-04-19 11:20:51','La prueba de fuego',17,'BUHKuKOtgGg',0),(31,'2022-04-20 10:20:14','2022-04-20 10:20:14','Otra prueba muy crazy!!',20,'wPpJIIwmTKA',0),(32,'2022-04-21 09:22:52','2022-04-21 09:22:52','Testeeoooo',14,'cdm2MziC7q4',0),(33,'2022-04-22 16:15:56','2022-04-22 16:15:56','Testeooooo',1,'cdm2MziC7q4',0),(34,'2022-04-22 16:17:24','2022-04-22 16:17:24','Testeoooooo',1,'cdm2MziC7q4',222);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contracts`
--

DROP TABLE IF EXISTS `contracts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contracts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `manager_id` bigint unsigned NOT NULL,
  `creator_id` bigint unsigned NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `agreement_id` bigint unsigned DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `automatic_renewal` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contracts_manager_id_foreign` (`manager_id`),
  KEY `contracts_creator_id_foreign` (`creator_id`),
  KEY `contracts_agreement_id_foreign` (`agreement_id`),
  CONSTRAINT `contracts_agreement_id_foreign` FOREIGN KEY (`agreement_id`) REFERENCES `agreements` (`id`),
  CONSTRAINT `contracts_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `creators` (`id`),
  CONSTRAINT `contracts_manager_id_foreign` FOREIGN KEY (`manager_id`) REFERENCES `managers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contracts`
--

LOCK TABLES `contracts` WRITE;
/*!40000 ALTER TABLE `contracts` DISABLE KEYS */;
INSERT INTO `contracts` VALUES (4,'2022-02-28 12:55:52','2022-04-22 13:17:44',5,70,0,4,'2022-02-28','2022-08-28',0),(5,'2022-03-01 20:05:47','2022-04-24 09:46:25',5,73,0,3,'2022-03-01','2022-06-01',0),(6,'2022-04-18 11:07:19','2022-04-18 11:07:19',5,76,1,2,'2022-04-18','2022-10-18',1),(7,'2022-04-18 11:10:11','2022-04-18 11:10:11',5,78,1,3,'2022-04-18','2022-07-18',1),(8,'2022-04-19 07:36:10','2022-04-19 07:36:10',5,75,1,4,'2022-04-19','2022-10-19',1),(9,'2022-04-21 10:15:53','2022-04-24 09:47:26',5,81,0,7,'2022-04-21','2022-05-21',0),(10,'2022-04-22 14:28:55','2022-04-24 09:48:24',5,70,0,2,'2022-04-22','2022-10-22',0),(11,'2022-04-22 14:51:32','2022-04-24 15:33:28',5,70,0,2,'2022-04-22','2022-10-22',0);
/*!40000 ALTER TABLE `contracts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conversation`
--

DROP TABLE IF EXISTS `conversation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conversation` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `comment_id` bigint unsigned NOT NULL,
  `reply_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `conversation_comment_id_foreign` (`comment_id`),
  KEY `conversation_reply_id_foreign` (`reply_id`),
  CONSTRAINT `conversation_comment_id_foreign` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`),
  CONSTRAINT `conversation_reply_id_foreign` FOREIGN KEY (`reply_id`) REFERENCES `replies` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversation`
--

LOCK TABLES `conversation` WRITE;
/*!40000 ALTER TABLE `conversation` DISABLE KEYS */;
/*!40000 ALTER TABLE `conversation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creators`
--

DROP TABLE IF EXISTS `creators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creators` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `real_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `google_access_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_refresh_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creators`
--

LOCK TABLES `creators` WRITE;
/*!40000 ALTER TABLE `creators` DISABLE KEYS */;
INSERT INTO `creators` VALUES (1,'2022-02-05 10:10:15','2022-02-05 10:10:15','Augusto Cesar','I\'m here on backstage!',NULL,NULL),(2,'2022-02-05 10:25:45','2022-02-05 10:25:45','Jose Perez','I\'m here on backstage!',NULL,NULL),(3,'2022-02-05 10:28:55','2022-02-05 10:28:55','Jose Perez','I\'m here on backstage!',NULL,NULL),(4,'2022-02-05 10:44:51','2022-02-05 10:44:51','testeeee','I\'m here on backstage!',NULL,NULL),(5,'2022-02-05 10:54:13','2022-04-24 12:16:42','Master of the planet','I\'m here on backstage!a aaaaaa',NULL,NULL),(6,'2022-02-05 11:01:50','2022-02-05 11:01:50','Grandmaster','I\'m here on backstage!',NULL,NULL),(7,'2022-02-05 11:15:41','2022-02-05 11:15:41','Paquito','I\'m here on backstage!',NULL,NULL),(8,'2022-02-05 11:17:04','2022-02-05 11:17:04','testeeee','I\'m here on backstage!',NULL,NULL),(9,'2022-02-05 11:42:08','2022-02-05 11:42:08','aaaaaaaaaaaaa','I\'m here on backstage!',NULL,NULL),(10,'2022-02-05 12:12:36','2022-02-05 12:12:36','testingx','I\'m here on backstage!',NULL,NULL),(11,'2022-02-05 12:14:52','2022-02-05 12:14:52','testingx','I\'m here on backstage!',NULL,NULL),(12,'2022-02-05 12:21:07','2022-02-05 12:21:07','test user','I\'m here on backstage!',NULL,NULL),(13,'2022-02-05 12:24:08','2022-02-05 12:24:08','test user','I\'m here on backstage!',NULL,NULL),(14,'2022-02-05 12:24:08','2022-02-05 12:24:08','test user','I\'m here on backstage!',NULL,NULL),(15,'2022-02-05 12:24:09','2022-02-05 12:24:09','test user','I\'m here on backstage!',NULL,NULL),(16,'2022-02-05 12:25:14','2022-02-05 12:25:14','test user','I\'m here on backstage!',NULL,NULL),(17,'2022-02-05 12:25:15','2022-02-05 12:25:15','test user','I\'m here on backstage!',NULL,NULL),(18,'2022-02-05 12:27:56','2022-02-05 12:27:56','Test nameeeee','I\'m here on backstage!',NULL,NULL),(19,'2022-02-05 12:28:39','2022-02-05 12:28:39','Test nameeeee','I\'m here on backstage!',NULL,NULL),(20,'2022-02-05 12:32:23','2022-02-05 12:32:23','Test nameeeee','I\'m here on backstage!',NULL,NULL),(21,'2022-02-05 12:32:47','2022-02-05 12:32:47','Test nameeeee','I\'m here on backstage!',NULL,NULL),(22,'2022-02-05 12:34:00','2022-02-05 12:34:00','Test nameeeee','I\'m here on backstage!',NULL,NULL),(23,'2022-02-05 12:34:01','2022-02-05 12:34:01','Test nameeeee','I\'m here on backstage!',NULL,NULL),(24,'2022-02-05 12:34:20','2022-02-05 12:34:20','Test nameeeee','I\'m here on backstage!',NULL,NULL),(25,'2022-02-05 12:34:21','2022-02-05 12:34:21','Test nameeeee','I\'m here on backstage!',NULL,NULL),(26,'2022-02-05 12:34:48','2022-02-05 12:34:48','Test nameeeee','I\'m here on backstage!',NULL,NULL),(27,'2022-02-05 12:35:41','2022-02-05 12:35:41','Test nameeeee','I\'m here on backstage!',NULL,NULL),(28,'2022-02-05 12:36:04','2022-02-05 12:36:04','Test nameeeee','I\'m here on backstage!',NULL,NULL),(29,'2022-02-05 12:36:05','2022-02-05 12:36:05','Test nameeeee','I\'m here on backstage!',NULL,NULL),(30,'2022-02-05 12:36:05','2022-02-05 12:36:05','Test nameeeee','I\'m here on backstage!',NULL,NULL),(31,'2022-02-05 12:37:07','2022-02-05 12:37:07','Test nameeeee','I\'m here on backstage!',NULL,NULL),(32,'2022-02-05 12:37:08','2022-02-05 12:37:08','Test nameeeee','I\'m here on backstage!',NULL,NULL),(33,'2022-02-05 12:37:27','2022-02-05 12:37:27','Test nameeeee','I\'m here on backstage!',NULL,NULL),(34,'2022-02-05 12:39:33','2022-02-05 12:39:33','Test nameeeee','I\'m here on backstage!',NULL,NULL),(35,'2022-02-05 12:39:55','2022-02-05 12:39:55','Test nameeeee','I\'m here on backstage!',NULL,NULL),(36,'2022-02-05 12:40:13','2022-02-05 12:40:13','Test nameeeee','I\'m here on backstage!',NULL,NULL),(37,'2022-02-05 12:41:02','2022-02-05 12:41:02','Test nameeeee','I\'m here on backstage!',NULL,NULL),(38,'2022-02-05 12:41:03','2022-02-05 12:41:03','Test nameeeee','I\'m here on backstage!',NULL,NULL),(39,'2022-02-05 12:41:16','2022-02-05 12:41:16','Test nameeeee','I\'m here on backstage!',NULL,NULL),(40,'2022-02-05 12:41:16','2022-02-05 12:41:16','Test nameeeee','I\'m here on backstage!',NULL,NULL),(41,'2022-02-05 12:41:28','2022-02-05 12:41:28','Test nameeeee','I\'m here on backstage!',NULL,NULL),(42,'2022-02-05 12:41:29','2022-02-05 12:41:29','Test nameeeee','I\'m here on backstage!',NULL,NULL),(43,'2022-02-05 12:41:53','2022-02-05 12:41:53','Test nameeeee','I\'m here on backstage!',NULL,NULL),(44,'2022-02-05 12:44:38','2022-02-05 12:44:38','Test nameeeee','I\'m here on backstage!',NULL,NULL),(45,'2022-02-05 12:44:50','2022-02-05 12:44:50','Test nameeeee','I\'m here on backstage!',NULL,NULL),(46,'2022-02-05 12:44:59','2022-02-05 12:44:59','Test nameeeee','I\'m here on backstage!',NULL,NULL),(47,'2022-02-05 12:45:01','2022-02-05 12:45:01','Test nameeeee','I\'m here on backstage!',NULL,NULL),(48,'2022-02-05 12:45:39','2022-02-05 12:45:39','Test nameeeee','I\'m here on backstage!',NULL,NULL),(49,'2022-02-05 12:45:39','2022-02-05 12:45:39','Test nameeeee','I\'m here on backstage!',NULL,NULL),(50,'2022-02-05 12:46:08','2022-02-05 12:46:08','Test nameeeee','I\'m here on backstage!',NULL,NULL),(51,'2022-02-05 12:46:09','2022-02-05 12:46:09','Test nameeeee','I\'m here on backstage!',NULL,NULL),(52,'2022-02-05 12:46:33','2022-02-05 12:46:33','Test nameeeee','I\'m here on backstage!',NULL,NULL),(53,'2022-02-05 12:46:33','2022-02-05 12:46:33','Test nameeeee','I\'m here on backstage!',NULL,NULL),(54,'2022-02-05 12:46:59','2022-02-05 12:46:59','Test nameeeee','I\'m here on backstage!',NULL,NULL),(55,'2022-02-05 12:47:18','2022-02-05 12:47:18','Test nameeeee','I\'m here on backstage!',NULL,NULL),(56,'2022-02-05 12:47:29','2022-02-05 12:47:29','Test nameeeee','I\'m here on backstage!',NULL,NULL),(57,'2022-02-05 12:47:30','2022-02-05 12:47:30','Test nameeeee','I\'m here on backstage!',NULL,NULL),(58,'2022-02-05 12:47:40','2022-02-05 12:47:40','Test nameeeee','I\'m here on backstage!',NULL,NULL),(59,'2022-02-05 12:47:58','2022-02-05 12:47:58','Test nameeeee','I\'m here on backstage!',NULL,NULL),(60,'2022-02-05 12:48:02','2022-02-05 12:48:02','Test nameeeee','I\'m here on backstage!',NULL,NULL),(61,'2022-02-05 12:48:51','2022-02-05 12:48:51','Test nameeeee','I\'m here on backstage!',NULL,NULL),(62,'2022-02-05 12:48:52','2022-02-05 12:48:52','Test nameeeee','I\'m here on backstage!',NULL,NULL),(63,'2022-02-05 12:48:53','2022-02-05 12:48:53','Test nameeeee','I\'m here on backstage!',NULL,NULL),(64,'2022-02-05 12:50:11','2022-02-05 12:50:11','Test nameeeee','I\'m here on backstage!',NULL,NULL),(65,'2022-02-05 12:50:12','2022-02-05 12:50:12','Test nameeeee','I\'m here on backstage!',NULL,NULL),(66,'2022-02-05 12:50:28','2022-02-05 12:50:28','Test nameeeee','I\'m here on backstage!',NULL,NULL),(67,'2022-02-05 12:50:41','2022-02-05 12:50:41','Test nameeeee','I\'m here on backstage!',NULL,NULL),(68,'2022-02-05 12:50:47','2022-02-05 12:50:47','Test nameeeee','I\'m here on backstage!',NULL,NULL),(69,'2022-02-05 12:51:00','2022-02-05 12:51:00','Test nameeeee','I\'m here on backstage!',NULL,NULL),(70,'2022-02-05 12:52:34','2022-02-06 10:33:40','Test nameeeee','I\'m here on backstage!','ya29.A0ARrdaM9iATj1yIFKhQ3F7ZI2XSDoBXEkhhsFRrP-BQkVPIob-jlrJMmKoxCtRSnS7xLMe0LEGame6E8uhEYZTgOMHU_K45k2nLpV0MI5u-XrolO4i16CC8cE12HvRr_JVJD_Wpav0BP8lOIuEvFlEpv38XS1','1//03gq5las8_fV8CgYIARAAGAMSNwF-L9IrVV36r_lC3X4eGFYGcrqjrAAerGMGmwplD-OLiYx3j1gSdLfRDYO34-XRlBl4Bogf9TA'),(71,'2022-02-05 12:54:11','2022-02-05 12:54:11','Test nameeeee','I\'m here on backstage!',NULL,NULL),(72,'2022-02-06 09:17:47','2022-04-02 08:41:38','Vegeta','I\'m here on backstage!','ya29.A0ARrdaM8nV5edT5ZEX6Ya38aUHow37tiK4qrfDcAYNOZ1TuYQlV_5VPKa-aItRFPAzaVOkolARO62ImCwlVKcgo2pdhY2Msbxvd2k-h8s9UHXjgHEakgZvscGYkZC87Y6VhDs_OS89Pxw-C19_nk4xT1-coD6','1//03h6Im2TgWgHLCgYIARAAGAMSNwF-L9IrUj2vIxbzQx-HLyBFXRMRlTPrHpsmMOWEzFZtnviOeqj7i_4fSnnLjBPLt83s7gwQ46o'),(73,'2022-03-01 20:02:28','2022-03-01 20:04:25','Ana Youtuber','soy ana la crack, maquina','ya29.A0ARrdaM9kSTcTNtJQPWkm-dmO5ZQu7bQdumgQ4kepF-DUQU8fMABjCRQLMMnlf9rjL-rEO7eD7CkIS8iILRlIOLxYyzrR6e3gvUB2OmYl8YRNil3NqfB8KzDl-9_eYugFmUNgJg9rN-sSpV9TdFp_QoM2LPTO','1//03GMZueuyNOWdCgYIARAAGAMSNwF-L9Ir7UbwO1tKveYmSe8xjUjZEOowID5ZR_8i9bleDazziPy_yennJ68eBOmd0Zjxa7eD88I'),(74,'2022-04-12 11:44:23','2022-04-12 11:44:52','Samuel Martin','Soy el Rubius y voy a gestionar mi contenido desde Backstage','ya29.A0ARrdaM_01F74Mi_5GEHkFrjRuMHO33R0KqT8k8616402LQG7wVII9UIUh1OAFg_nHiaJ8xIpFwuQ_S2frNxlHcj_NcxRmKF0oEd3LiUGaCGAqHMPM3q961CzXEfjbRezsfHzksEnbYJp_n5HgjHQW8G9I-Ml','1//03y-7zsImTLnzCgYIARAAGAMSNwF-L9Irvy9TkypcJRhXEy5uBwMuUFnXiFhgN8kA6ya7luO8srR6z4IY9RClAiRMKSumOlYn1tA'),(75,'2022-04-12 11:53:50','2022-04-12 11:54:11','Mario Casas','I\'m here on backstage!','ya29.A0ARrdaM9uXU05lGeshwA9NQ5Y32pf6AXIfqH_3zPFVQIqDhAKNgtAm2HkIfPSG3Cec9GDbz0NmviOznCU9T0GMyhsWxdGT5ycinbOqMjQGIQ9gNPQqc-pTVkkBkvfkzCCKCpCiDgXvkdHY6GBWDiZdkoRrnb1','1//03GQiMiKiBt5ECgYIARAAGAMSNwF-L9IrONP_b_Ovn4le22yKSvI8MNSrZzetda6udLRQ94FQ1w9jr5jDlkE9Cz_ErefiDqQnwKE'),(76,'2022-04-18 07:59:16','2022-04-18 08:03:40','Great content Creator','I\'m here on backstage!','ya29.A0ARrdaM8L1frBxykQUvTmicb3g_-f_gaZoTvKvex4mscPENsK7u-Tq8eHCnG55we_vMLDBkRndnR6V6mfuKNLvO5uySWH5FHJwerP8dKxp9-3QUJY-cfT6Q2j4Jf9lIbLWXvgaOx_e7paX2TjKYUZybaXe8I9',NULL),(77,'2022-04-18 08:04:58','2022-04-18 08:05:59','Jose Master Youtube','I\'m here on backstage!','ya29.A0ARrdaM-LBV_m7Wf4t3J25bbzmz9u-owiIq7BBpmk5qOKfvHFGed23COQ8CUFF_vpzZvxp6uzz4lNCDqnL5bq9FZWX0w2dro1G-gxI7zKZTvdiuGcVfUXLHAdXG7Axie6Q1plWWjQNXDImF3KjuT_W_0GUQUW',NULL),(78,'2022-04-18 08:08:49','2022-04-18 08:09:14','User Content Master','I\'m here on backstage!','ya29.A0ARrdaM98orbdG-mjFdb9YKuulWgDq5EBCfwc6sKAE3N1bAuPiDOUbiWppjFBj64UTcSiVeQepbgaH1KHe8HbHIPuy3KdXr_9gF4hkToi0K7ruyZg8Zvw36M9YmowX0G-LrW6NDMnCGS1WmTeM3a3DvdVWSv9','1//03MLyXmysdDz9CgYIARAAGAMSNwF-L9IrWi_iWoflvfvvtWm7ODl6uL_VEOElLWw82W2vjqucw6FmiqLCroaLpwfqiORi8zKb3ac'),(79,'2022-04-19 13:01:53','2022-04-19 13:01:53','Admin Master','I\'m here on backstage!',NULL,NULL),(80,'2022-04-20 10:58:37','2022-04-20 10:58:37','Jose Backstage','This is a testing profile for the new platform.',NULL,NULL),(81,'2022-04-21 09:15:22','2022-04-21 10:20:53','aaaaaa','I\'m here on backstage!','ya29.A0ARrdaM8ORfFD92Wnc1vUlSPHngQb0fG5fyXI7HhXYVpiiWygZRuI1ZNfN607yoMR2vHyw-tZj8smzMp-GwL3oo4menFq336GyCEAuY7AW1WzJwtUFxO9sr626cHxoFAn66fJkzOah5fR0bf_uviifPREcQDvXQ',NULL),(82,'2022-04-22 16:50:17','2022-04-22 16:50:43','Tanque Gamer','I\'m here on backstage!','ya29.A0ARrdaM9ZzbV7piA85TgBu4aRplAuX9pr7h4SJaGrtLjUkMQ2Sk-YvDw7J1bfnB5ogf0foL3nLMfwsz-2i265ayZIv2IZi9y0MGfl7tkD3p0LFJ8RAhG7rgS1lwnQTAhRgLHOhEhwnWqI3dpE5s94EOPKaZ8v','1//03Sc3g30SklOgCgYIARAAGAMSNgF-L9IrSsDYFgVD3plpl_46zJpZQnF35Ta6jCNMPMyxpiPkvidqkq0-y1fjEVoLWo_En1UGeQ');
/*!40000 ALTER TABLE `creators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `managers`
--

DROP TABLE IF EXISTS `managers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `managers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `real_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `likes` int NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `available` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `managers`
--

LOCK TABLES `managers` WRITE;
/*!40000 ALTER TABLE `managers` DISABLE KEYS */;
INSERT INTO `managers` VALUES (1,'2022-02-05 11:33:53','2022-02-05 11:33:53','DJ Moods',0,'I\'m here on backstage as Manager!',1),(2,'2022-02-05 11:37:50','2022-02-05 11:37:50','DJ Moods',0,'I\'m here on backstage as Manager!',1),(3,'2022-02-06 11:03:02','2022-04-24 12:02:55','El maquina del youtube',0,'aaaaaaaaaaa',1),(4,'2022-02-06 14:43:18','2022-02-06 14:43:18','El maqui',0,'Soy una machine gunn',1),(5,'2022-02-13 12:30:49','2022-02-13 12:30:49','Master of youtube',299,'I\'m here on backstage!',1),(6,'2022-04-21 09:08:32','2022-04-21 09:08:32','Maestro Maximo',0,'Esta es una prueba de mi trabajoooo!!!',1),(7,'2022-04-21 09:10:05','2022-04-21 09:10:05','Maestro Maximo',0,'Esta es una prueba de mi trabajoooo!!!',1),(8,'2022-04-21 09:15:58','2022-04-21 09:15:58','Manager Bueno',0,'I\'m here on backstage!',1),(9,'2022-04-21 09:18:22','2022-04-21 09:18:22','Maestro Maximo',0,'I\'m here on backstage!',1),(10,'2022-04-21 09:31:39','2022-04-21 09:31:39','Manager Crack',0,'I\'m here on backstage!',1),(11,'2022-04-21 09:32:28','2022-04-21 09:32:28','Manager Coloso',0,'I\'m here on backstage!',1);
/*!40000 ALTER TABLE `managers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` datetime NOT NULL,
  `duration` int NOT NULL,
  `is_onair` tinyint(1) NOT NULL DEFAULT '0',
  `user_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `media_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,'2021-12-15 18:40:00',NULL,'This is a test stream','The best video ever','https://youtu.be/cGcoZh3MIiY','2021-12-15 18:40:00',87,0,1),(2,'2021-12-15 18:40:00',NULL,'This is a test stream','The best video ever','https://www.twitch.tv/tk_anakin','2021-12-15 18:40:00',87,0,1),(3,'2021-12-15 18:40:00',NULL,'This is a test stream','The best video ever','https://youtu.be/cGcoZh3MIiY','2021-12-15 18:40:00',87,0,1);
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2021_12_15_164828_create_media_content_table',2),(6,'2021_12_15_164828_create_media_table',3),(7,'2022_01_29_105627_create_content_creators_table',4),(8,'2022_01_29_113723_create_user_types_table',5),(9,'2022_01_29_122914_create_creators_table',6),(10,'2022_01_29_122914_create_managers_table',6),(11,'2022_01_29_123015_create_roles_table',6),(12,'2022_01_31_181047_add_google_key_to_creators_table',7),(13,'2022_02_05_104809_add_nullable_to_roles_table',8),(14,'2022_02_05_113244_add_default_to_managers_table',9),(15,'2022_02_12_092009_create_agreements_table',10),(16,'2022_02_12_092101_create_contracts_table',10),(17,'2022_02_12_094114_add_owners_to_agreements_table',11),(18,'2022_02_20_151640_add_periods_to_contracts_table',12),(19,'2022_03_05_122723_create_comments_table',13),(20,'2022_03_05_122756_create_replies_table',13),(21,'2022_03_05_122813_create_conversation_table',13),(23,'2022_03_17_190934_create_partners_table',14),(24,'2022_04_18_095123_create_notification_type_table',15),(25,'2022_04_18_095223_create_notifications_table',15),(26,'2022_04_22_153551_add_seconds_to_comments_table',16);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_types`
--

DROP TABLE IF EXISTS `notification_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_types`
--

LOCK TABLES `notification_types` WRITE;
/*!40000 ALTER TABLE `notification_types` DISABLE KEYS */;
INSERT INTO `notification_types` VALUES (1,NULL,NULL,'Content Comment'),(2,NULL,NULL,'Content Change'),(3,NULL,NULL,'Private Message'),(4,NULL,NULL,'Contract Created');
/*!40000 ALTER TABLE `notification_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `from_user` bigint unsigned NOT NULL,
  `to_user` bigint unsigned NOT NULL,
  `notification_type` bigint unsigned NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `notifications_from_user_foreign` (`from_user`),
  KEY `notifications_to_user_foreign` (`to_user`),
  KEY `notifications_notification_type_foreign` (`notification_type`),
  CONSTRAINT `notifications_from_user_foreign` FOREIGN KEY (`from_user`) REFERENCES `users` (`id`),
  CONSTRAINT `notifications_notification_type_foreign` FOREIGN KEY (`notification_type`) REFERENCES `notification_types` (`id`),
  CONSTRAINT `notifications_to_user_foreign` FOREIGN KEY (`to_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (1,'2022-04-18 14:27:51','2022-04-18 14:27:51',20,14,2,'Your video \"Bloodborne PVE 3 online A lo loco   El cara jaula y el rey del castillo\" changed visibility to public','0etU5xLS23s',0),(2,'2022-04-18 15:05:42','2022-04-18 15:05:42',20,14,2,'Your video \"Transmision de PS4 en vivo de rhoperto\" changed visibility to unlisted','I7B-TXPsM6E',0),(3,'2022-04-18 15:20:09','2022-04-18 15:20:09',20,14,1,'New Comment added for video \"wPpJIIwmTKA\": This is a test message, notifications should work!','wPpJIIwmTKA:11',0),(4,'2022-04-18 15:39:23','2022-04-18 15:39:23',20,14,1,'New Comment added for video \"Transmisi√≥n de PS4 en vivo de josek91\": Otra pruebaaa!','wPpJIIwmTKA:12',0),(5,'2022-04-18 15:52:25','2022-04-18 15:52:25',20,14,1,'New Comment added for video \"Transmisi√≥n de PS4 en vivo de josek91\": atuuun','wPpJIIwmTKA:13',0),(6,'2022-04-18 16:12:53','2022-04-18 16:12:53',20,14,2,'Your video \"Transmision de PS4 en vivo de rhoperto 2\" changed visibility to unlisted','Mu2bwy4J1mk',0),(7,'2022-04-19 07:36:42','2022-04-19 07:36:42',17,14,1,'New Comment added for video \"Transmision de PS4 en vivo de rhoperto 2\": Este video es la leche!','Mu2bwy4J1mk:14',0),(8,'2022-04-19 10:38:55','2022-04-19 10:38:55',14,17,1,'New Comment added for video \"Transmisi√≥n de PS4 en vivo de josek91\": Otro comentario maestro.','cdm2MziC7q4:16',0),(9,'2022-04-19 10:50:06','2022-04-19 10:50:06',14,17,2,'Your video \"Bloodborne PVE 3 online A lo loco%21 1\" changed visibility to unlisted','BUHKuKOtgGg',0),(10,'2022-04-19 10:52:57','2022-04-19 10:52:57',17,14,1,'New Comment added for video \"Bloodborne PVE 3 online A lo loco%21 1\": Gracias por publicarlo!','BUHKuKOtgGg:17',0),(11,'2022-04-19 11:01:46','2022-04-19 11:01:46',17,14,1,'New Comment added for video \"Bloodborne PVE 3 online A lo loco%21 1\": Otra prueba de comment!','BUHKuKOtgGg:18',0),(12,'2022-04-19 11:02:01','2022-04-19 11:02:01',17,14,1,'New Comment added for video \"Bloodborne PVE 3 online A lo loco%21 1\": Another test again','BUHKuKOtgGg:19',0),(13,'2022-04-19 11:02:15','2022-04-19 11:02:15',17,14,1,'New Comment added for video \"Bloodborne PVE 3 online A lo loco%21 1\": Testing 1,2,3','BUHKuKOtgGg:20',0),(14,'2022-04-19 11:05:59','2022-04-19 11:05:59',17,14,1,'New Comment added for video \"Bloodborne PVE 3 online A lo loco%21 1\": Testeeeeeee','BUHKuKOtgGg:21',0),(15,'2022-04-19 11:07:32','2022-04-19 11:07:32',17,14,1,'New Comment added for video \"Bloodborne PVE 3 online A lo loco%21 1\": Tessssssssssssssssstt','BUHKuKOtgGg:22',0),(16,'2022-04-19 11:10:19','2022-04-19 11:10:19',17,14,1,'New Comment added for video \"Bloodborne PVE 3 online A lo loco%21 1\": Teeeestttttt','BUHKuKOtgGg:23',0),(17,'2022-04-19 11:10:37','2022-04-19 11:10:37',17,14,1,'New Comment added for video \"Bloodborne PVE 3 online A lo loco%21 1\": Addddddddddddddd','BUHKuKOtgGg:24',0),(18,'2022-04-19 11:12:15','2022-04-19 11:12:15',17,14,1,'New Comment added for video \"Bloodborne PVE 3 online A lo loco%21 1\": Ahoraaaaaa','BUHKuKOtgGg:25',0),(19,'2022-04-19 11:13:09','2022-04-19 11:13:09',17,14,1,'New Comment added for video \"Bloodborne PVE 3 online A lo loco%21 1\": aaaaaaaaaaaaaaaaa','BUHKuKOtgGg:26',0),(20,'2022-04-19 11:13:20','2022-04-19 11:13:20',17,14,1,'New Comment added for video \"Bloodborne PVE 3 online A lo loco%21 1\": aaaaaaaaaaaaaaaaaaaaaaaaaa','BUHKuKOtgGg:27',0),(21,'2022-04-19 11:14:02','2022-04-19 11:14:02',17,14,1,'New Comment added for video \"Bloodborne PVE 3 online A lo loco%21 1\": eeeeeeeeee','BUHKuKOtgGg:28',0),(22,'2022-04-19 11:19:44','2022-04-19 11:19:44',17,14,1,'New Comment added for video \"Bloodborne PVE 3 online A lo loco%21 1\": aaaa','BUHKuKOtgGg:29',0),(23,'2022-04-19 11:20:51','2022-04-19 11:20:51',17,14,1,'New Comment added for video \"Bloodborne PVE 3 online A lo loco%21 1\": La prueba de fuego','BUHKuKOtgGg:30',0),(24,'2022-04-20 10:20:14','2022-04-20 10:20:14',20,14,1,'New Comment added for video \"Transmisi√≥n de PS4 en vivo de josek91\": Otra prueba muy crazy!!','wPpJIIwmTKA:31',0),(25,'2022-04-21 09:22:52','2022-04-21 09:22:52',14,1,1,'New Comment added for video \"Transmisi√≥n de PS4 en vivo de josek91\": Testeeoooo','cdm2MziC7q4:32',0),(26,'2022-04-21 10:15:53','2022-04-21 10:15:53',26,14,4,'TesteOOoooStarted a new contract with you until \"2022-5-21 12:15:53','9',0),(27,'2022-04-22 14:28:55','2022-04-22 14:28:55',1,14,4,'jperez Started a new contract with you until 2022-10-22 16:28:55','10',0),(28,'2022-04-22 14:51:32','2022-04-22 14:51:32',1,14,4,'jperez Started a new contract with you until 2022-10-22 16:51:32','11',0),(29,'2022-04-22 16:15:56','2022-04-22 16:15:56',1,14,1,'New Comment added for video \"Transmisi√≥n de PS4 en vivo de josek91\": Testeooooo','cdm2MziC7q4:33',0),(30,'2022-04-22 16:17:24','2022-04-22 16:17:24',1,14,1,'New Comment added for video \"Transmisi√≥n de PS4 en vivo de josek91\": Testeoooooo','cdm2MziC7q4:34',0);
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partners`
--

DROP TABLE IF EXISTS `partners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partners` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contract` blob NOT NULL,
  `followers` int NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `available` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partners`
--

LOCK TABLES `partners` WRITE;
/*!40000 ALTER TABLE `partners` DISABLE KEYS */;
INSERT INTO `partners` VALUES (1,'2022-03-22 20:15:50','2022-03-22 20:15:50','Test',_binary '/tmp/phpWLqEet',0,'','Test',1),(2,'2022-03-24 17:55:09','2022-03-24 17:55:09','Asus',_binary '/tmp/phpYvR4ky',0,'','support@asus.com',1),(4,'2022-03-24 19:06:10','2022-03-24 19:06:10','aassaa',_binary '%PDF-1.4\n%√§√º√∂√ü\n2 0 obj\n<</Length 3 0 R/Filter/FlateDecode>>\nstream\nxú=é\À\n1E˜˘äªvì∂\È¥0\Ë~†\‡¯\0Ç≥ôﬂ∑≠édì{r\"X\È\rÅ∞¬≤±G\n\ \À\ró^\ﬂY≠\ÂAS!ãú0X™rπbVhl˝£®8Ò\‚(O≤vNö3J\Ë$o\—z6\Î\Ê–°w\Ï˛ö$…ùj®O˝\ËQ¶\ŒNÖföÒÀí(\n\nendstream\nendobj\n\n3 0 obj\n134\nendobj\n\n5 0 obj\n<</Length 6 0 R/Filter/FlateDecode/Length1 23164>>\nstream\nxú\Ì|y|[’ïˇπ˜=-vº»ªºE\œQº*^\‚\ÿq\ÀÒBR7â;\‘§±,+±äm)ñ\⁄&a+`ñÜai)L1¥\Ïm#\Àú\Ze∫\ÃP\“a\⁄\“NÚk°îñ¸\ t(eZb˝æ˜\Íy#Åig~¸>ü_§\‹w\œ=˜l˜ús\œ}Oäy(ÅëBN˜†Àø$13ïà˛âà•∫˜µ?‹ûµi\"”ö\›˛=É_xÚ\ﬂ\Ô#ä\À#2¸t\œ¿˛\›Ôüæ\ŸJîÙ.Q¸{˝W\ﬂ#üy4ô(˚m\»X\Ÿƒ•\”Wõàr ÉñˆØ\Ë2Æ≠\ƒx\∆U>∑\Î∞\ÂZ\–\Á\\ÅqŒ†\Î\nˇ,/ﬁÅ±6\‰\ZÙlT{3\∆Gâ*\Î¸æ@ßT%\⁄(\‰k˛aè?yK\…&¢O$Y|¿1º\≈cfcÆ®£\…øà˛ø|éSûlSûZDà[Ùıô6Ìçæ.\ÊD\œg\Â«ö˛ä\–7Ëß¨Ñi4¡˛LYÙ>\Àf\Ài#©Ù\'d\À:KwR:u\“],ïñR&mßçLçÉnf˜D˜Eﬂ¢ã\Ë\Ô\ËÅ\ËS\Ï\Í\Ëcòˇ\"˝Ω˛MeTGõAøù<ÙñÚuGøBf∫û\—Z\⁄\∆2\…E?¡˚è∞\·v∫Éæ\Õ>}Z\”\Èj»´ßFjå>˝Ä\ \Ëfı∞·ï∏\'\Ë6:¡åQw\‘Kãi	çrGÙ\'\—◊®à∫\ÈkÙ\r\ÿ\‰`S\Í*†\À\È:˙2\ÀV˛–ùÙuöf	|ß\“d8	M\È\Z¢\Z•\«\Ë,ïµ^1º˝lÙM2R\Zï¿&/Ω\≈j\Ÿ&˛†ö]˝9]J\«\Ë{XØxO©ó™.ùnà˛}Ù9 †ßX<{ö=k®6\‹zˆ™\Ë˝\—o!#ãh9<≤zz\È\ZzñæOˇN\‡£iu@Û,üi¨ˇ	\œ\Ê¯\Âe™¿jw\¬\⁄\›GaD\‰8ù†g\‡õ•\”ÙKgπ\Ï¨ó\›\∆˛¿xIπG9™¸ã\ \‘G\·o;\¬GAzêû\ƒ~~ë^b»Øb\Ì\Ï3\Ã«æ\ƒ˛ûù\Êa˛6ˇìjVØQˇ¢û5Müû˛KtsÙèd•˙$]I\·€Ø\—•“è\ÈÙÙ≥∞U¨ü\›\œ\¬\Ï4{õ\«Ò%|˜Ûª¯É¸õ\ f\Â6\ÂYµV]Ø^Ææ®˛\‹\√M&ói˙Éá¶oü˛\ÊÙè¢OEÑ\‹IÇ¸\"jÖGØBV<H\'\ÈeHˇΩJø˘˘k\Ÿˆih	∞\ÿ\Ïõ\Ïˆ#ˆ[¨í\‰{	_Àõ°\’«á·ß´˘\Ì¸h	\ÔS¸\Á¸U˛;˛G≈†,QV*{ï˚ï∞2©úR~≠Z\‘\"µB]ÆnQw®QD¶\⁄p±°\√à\·q\√sÜwåı\∆>£\ﬂ¯\”’¶k\Õˇt∂\Ï\ÏøM\”tˇtxzπkF&]	O|ï@\ﬁE~\0è˛ü¶wÖV¿äa˜j\÷\ \⁄\ÿ&ˆ)vÛ∞´\Ÿı\Ï\Ôÿó\Ÿ=\Ïˆ-¨\0k\‡&\ÿ\Ó\‡çºÉª∏á_ÀØ\Á∑£x\Á\ﬂ\Á?\·Ø3∞<K±+eπ≤QŸ°\\™a\rA\ÂÄr-<{õÚòÚíÚ≤Ú¶Ú\Â¢ñ•.VC\Íï\Í\›\Í\√\ÍQıGÜO\ZÒ~¿p\“0e¯ë\·\√Fn\Ã1\Ê+çü1>b¸•\…hZij7\›h˙\”ò˝,èï¡rm~µ\‡\ŸÿÉã˘c<]=\»\Œ\0ë\œTJ\∆\ àCv\≈PÉ2ç∏$âyÿñ¡≥\’4¡it™a\Ÿ	™e/\–A#WPâ\’\”aø\‡ß\’\Á˘EÙc\÷√≤’áï!\√x=éjtò?\ÕO∞ıtî\◊ÛK¯Ω\n±7\ÿ#ÙÚ˝\n∫É]\ŒÙ8;\√÷∞œ≥:vê˛Ög*\ÏZ™è>¿U\«6≤w\–Uj}˙\„´ [Mø†∑¶ø™&™üC}ö§ª\—o\–k\ÏQ˙33D\ﬂFuSPç\\®27#ﬂØ#Qıvbü\ƒ~\ÃF0æDG≈âb™3ÆSØ§w\Ë?\È-\√qd\‘zT\“7ßΩ\ÍW\’_E\Î¢\Â\ÿa\ÿeÙˆ]?]åÛ≤\‰å\≈\Ë2\ÏÙx‘íj\Ï\Ív\⁄A}ÙyTΩ€¢\·\ËΩ\—k¢˚£>˙G˛ô-cfc\ÿì‡®ß\Ô\·˝E˙ª	˚\‚ˇ\ﬁ)0\›GSÙ[feÖ¨\Z˚\·åaü\·∞\·1\√Q√∑\r/\Zó\√\€\◊\“=\»\Ë_\"õ\„±7˝à~Kbf\ƒ&õñQ\r\Ï]€ªhÄw+\œP\À!?ˆl	\Í¯z}%Hπ\Zﬁª˚˘\ÏçwP\'.£o\”+å≥,¨\»\r˝f\»iÉüwÅ˙!D\Z6L™v˝\ÎNb´x˙úêt™\÷l˙˝\ZﬁéJªñ°.4≥K \ÎOÙ)ÍÉÜï\‘\Œ\∆Å\'i5*k≥ÚO˜Rf°ıl	˚:¯z∞Cì(üV~\≈8-õ\ﬁ]≈Ω\ 38c¢¿è\·Ù •ã\ÿ^Xëåuú•∂Öjß∑¡ÜóâúçùŒÜu’Ø]≥zU]mÕä\Í\ÂUï\Â\Àe•%\≈EÖK\ÌK\n4\€\‚¸º‹úlkVfFzZjä%9)1aQ|ú\Ÿd4®\ng¥¨\≈\ﬁ⁄£Öãz\¬jë}√Ür1∂ªÄp\ÕCÙÑ5†Z“ÑµI¶-§tÇr˜á(ù1J\Á,%≥hıT_æLk±k\·õ\Ì\⁄$€±µ-\Õˆn-|F¬õ$|X¬âÄ\n¿†µX˚õµ0\Î\—Z¬≠˚˙G[zö!n|Q|ìΩ\…_æå\∆\„\\(úe˜è≥¨uL<´e\Õ8\'s\"å\n\Áÿõ[\¬\ŸˆfaAX)lqıÖ€∑vµ4\Átó/≥&∑Ω7Lˆı\·dá$°&©&ll\nõ§\Z\Õ+VC7i\„À¶Foû¥Poè#°\œ\ﬁÁ∫¨+¨∏∫ÖéÙ6á≥Æ|\›:7Ñ‘¶Æ\Î\Á\œ\Ê*£-VØ&Ü££\◊k·©≠]Ûgƒµª2¿\À[{F[°˙f8±≠CÉ6~]wWò]ïöXâXUl}{ã¿Ù|F\«\Ÿ\◊\€˚G?”É\–‰åÜi\€˛ÇHNéÛXÙ4\Â¥h£ù]ˆÇpCÆΩ\€’ú7ûN£\€ˆOd;µ\ÏÖ3\Â\À\∆-)1«é\'%\Î@B\‚|¿3;\'!I.†∂m≥ûe\¬\"˚F$DXsk∞§Àé5≠\œ*\ZuØ^\›\\\·>D\ƒék\Íµ¨x¡6Z\Ï\⁄\Ë	`?ÛˆBåK\«-$ä<ôM5\Ã\œ¿aá#\\V&R\ƒ‘Ñò\¬\∆ur\\[æl\ﬂ$_i˜[4tpµ√∑Æ\Ó5ïpAÅMìN\Í\≈ |hkWl¨QonÑúïé\Ó0\Ô3S33\€\≈Ã°ôôYˆ;2˘®|\»õãfˇ%[2\”Z˙◊ÑY\Ê\«L{bÛmˆ∂≠;∫¥ñ\—›∑mùF±˘U≥s:Nk\ÍRrπÒ\\E\Œ\")/õ%ÉÆÑ∞ZàFô\‘}aI)Lk\r[z6ƒÆ\›Ò\…3i2\œcöåæ#∏d7«¶[^\„X8^ª`º¿∫ÑQˆ™Eº≠s\«\Ëh¸ÇπV†\—\—Vª\÷:\⁄3Íöå\Íµk˚\Ë1˛0x\‘\ﬂ\“3\–\…\ËÒõr√≠7wc˝l\ríï\”˙q;ªaÎ∏ì\›–±£\ÎòOo7tvE8\„M=\Îª«óbÆ\ÎnEú\Àg±b§âµ1$zÑõ\ÂT\Ó1\'\—!9´JÑª\'Iúy\«\»=\…c8ã\ƒ\·Ué\€|\ﬁ8ıM¥˛(g\”F\”$op¶ëAùV(ﬁ§N3\ 6\r\”\\yöQnv≠duXﬁ´?[ø\ŸÚn˝¶≥ı\‘\0\ÿÚ.À´\nR\nR\nqa∏Å¯@S¶>p\Z\Ë/§©S–Ö\'2∏úe!tÆ(1î\ƒ_ú\ÂQ=	Ü≤¨\’Y2ª3˚3\r´≥V\Ê^ü{∑\·ÆE[J!#ûñZòl1g11\”dtj\"nQ\rLºŸôv®ÄiUº %U#\ÕRe\·ñI~”Ñ∂º\√\ÍÄi;Ömõ,;˜æ\Áÿª\Èå4≤A\⁄H;˜≤ùi\’Yôô©\È∏\ƒ\€^¿RVT◊≠\„µ5EE\≈Eˆ;x˛S=WMˆî\◊\Ì\ﬁtM\Ô\◊œæ\ÃJ^˝\\›Ü]ıı\Îû0\œ+zn˙\Õ>qÕòª≠Ã¶>˜AmR\Í%/<ˆÿìªSìƒ≥˜-\—ﬂ®∏ØÀ§{ùYüJŸìróAâ3f\Îy}JoKyìõí\'y–ô¢. §¯åÙÙ¯8cZzQFM≤RgR¶S[Zs$ìE3Yféãvf.YZs\ÿ:f\Â~\Î;V˛{+≥\∆/*ä3ã©d–éô\Ÿ;ff\Œ\Œj®ók\ﬂ;\Ï´ﬂå\’;\ﬁC\€t¶\ﬁ\"#UoÅ\Z\Œ/∞ùµF£}IQQ-¢ñûôπ¢z\ÂJ*õ\◊<\„Ω¸±O≤l€∂Ü\r\√e,˚æ\ÌΩü~\Ï.>6m=\ÌYª%Ù:õ˙\À\œ\≈:\‡~˜\À\Í:*fkèQ)åŸô\ﬂ`0\Z2åô	5Jçπ\∆Zco\Ê-\Êk≥=AS*K;\‚zJï\ﬁW˙u\„√¶áû0>ë.=Uz∫4âJ+K\€1q≤ÙµRc©3\'Ø¶\„Cr\“`*PM9˘ôpY$\ﬁT <∑X5YRRäsÛÚää\„ì-E©)\Œµ=)Ãó\¬R&y´39\'∑(?8_\Î\…cy¿-Dt|!*…î\◊ z\ÁJ\ÿ]\“bg#Z=\⁄\“\‚öbÁöãj*ã_*~≠XI.∂*V®X+Æ*é´\≈\Ÿ%øä˘Z∏8ˆB∂ùÅó\ﬂ€π◊ÅD{o\ÔN\—¡\Á\“\Î\‚\›p¶\·KI]MhÀ´ÿ∞c\ÔNÑ¡ëVê±rEuf\÷Jy\Õ\Ã@jêÉKåF	ÕÄòr\”\‘Óª™Z∏,Ù@I˛Ùõ˘\≈[\◊ˆWLøπ∏aec˘Ùõj\—mèvn\ﬂﬁπ\Î≤\Ê/ü\ÌÊªæZQø·¶ª¶9oΩg«≤\÷k\Ô>˚bñ4ΩU›Ü\‹Lc5GSK,m2z\⁄iMHÆ1g&&◊ò\ƒ\≈(.ÜL\‡∏pé-gM\rÇ™&.J2Z8•\’4Æ*\nÉ\€\”z,\Ã2…é8S%\'V&ïêñQï—ì°ºì¡2Ñó’àﬁôö∑∏&#++G]≠8≠\Ÿ5¶L≤bgó#T?1J\≈”â3oeçFU®\Ÿ\È\ﬂã9ÿ±\Èl6Æ¯g=ªπ\≈\”¸kác\Ô&ÀªØS√ôùï\r“µ,uuäÙk\Íj\0¶$ã\ÿ\Ë&„≤≥-l\ÈhØA≈è®:}áXÙùq\œ\Ôxu\„D9FÜ\ËoúIâ)\riñ¥l\\R≠\rú!à>ÇqLVwZAZZ3%)ˆ%\≈\≈b\À\‘%1\«Ù˚\Ã>}cSa”ß∂o›úΩæ∂˜\”\Ÿj\—\Ÿ$˛á¯±ùΩ-I˘Eb†[\‘¿;Ò,¯>j`2\Ó∑GúÖF√±ÙcV\Âb\€c¯âÅß¶&&%QÆ•.I&s\Ê9U/”ñ_ïﬂì\Ô\œ?îo»∑$k,\Ê,Q¯ÚæŸ∫\'™^\Í\Í π⁄∑\"•@CÒ\ÀH7ä\ g\œ\Êr\„◊à∫w\'˚Wñ¥\Ì¿cΩ_\⁄¸ô\Ô?˚¿ë}Mü\ﬁP;f8ûY\Íë\Î\'Ω)g™>7\›S\—\€\ÿﬁüèl˙\÷s-\÷G\√\Œ≥A5\Z\nMöπ\ |\“¸öY≠46s≥ôU¨\'éÃ¶\„<äoSpÚmQ\’\"æHçõøà¯˘ã@˝z\0s\ÀÿπΩb∞\‘c5XHFÅl_RŒú]\À˚\Œ\ﬁk8˛˛ÙÉÔüΩMT\'+˛k\√À®¬ì\Œ\Íï*+S5ãñ“≠≤\Z\Ã\ÍI+\œ\»L\·È©ô)Ii\…dIJcd\·\Èq\Ê\‰El◊¢(e&\ﬁ\»RícÖXVú\◊x\ÿâèíΩ¢¡º\≈\‹nV\Ã%ñ î])<eí©\Œƒ§¥\"ûæã\∆2ß2y&B˜d\\BMfv\÷«∏ó\‰\“{\Î7â\”ÚÉùı\Ô\Ó\Ã~ù¨XõXZ.´´ìÒBy\≈!mEmç(Y&Q22Vd\ÿQ\Ï\÷{W\ﬂ∫\"P‘¥\Ó¢\⁄˛\Á\È7\ÔUã⁄øpm\«\“\ÔXVom{ıÉßîç\"\◊ná±\ﬂ@l\ƒ\Ÿ>rå\‚∞P\Áúq\Ìq¸P\\8n*\ÓT\‹\Ô\„∂∏û∏Éqc@£	øíL\ÃIßƒ®\–N\‹\"\rFì\Z\œMEL{9Æ`içöm÷è\Zá~ Ñ%\»\–\»\Ë`√é4ò\À\–ng\Ÿ\”o≤lıI¶NóO®E8@\ÿ<;\ƒúrñ\n˚\Ì~\»6LN~o0\ÿ=ÜÉÜ1 07%\\)b4c	e´\ÁX¢\Î^\”k8˛\ÁVx£gr1Œ™t\ c_;Fñ\Ë˚\Œ\÷E´\Ôé˚J\‚]ñG«üà;ë8ôc6ß≥\r¸bck¸ñ≈è$>i|2\ÁªÒ\ﬂK¯I¸+	\Ôõ˛îòòóúó\·\ÃÕØ\…p&•\‘$gú\Ãx)CëÖ.yqÉÏì≤\–Û[ú	\…I©\ÌI=I<…ö\ Dd\Á÷∞©\¬\Ïâ|≠FˆKJcΩ£<\÷[Ûd\ÔLNJÆ˜\ÂòΩ+5ô7°.Jµä\\∫\»D¨2£`KK ©\\ºk±oÒ}ã\’\≈\…f\'ä∂9;\ﬂ\€Û∆¶3r˚l:Û.ä¿9g∫\’Yí\ﬁ`u.N\∆%◊ÇK^JÉ,j\rgeLÖ†H∆ÄHˆ†}dÜ\Áù,ÑíÅ0Å\„L\Ãgâ.<øN\Z$\Ë_w†(\ÔîÍìúRíPö$\‘\'9\·,íBQú£ı∏CvÓ•ùÜ#«Æ\’ZhE5)Ú˛$MÜ&cˇ3≥Æ|\Î\»Ù\ÔÆÛ≤Ùóœ∞T\„Yßrµk˝éb\ÂäK.´Øgl[\ÂW\Ó\‚∂Wô\’˘ª\”\œ|˛¶\rl\‡ ÉMM˘1ò¯à\Ô\◊{û˘qˇ\…]\…ı4gõ\ÂßC¸™~\ÓSö\ﬁj¸2™Cmc3üô\÷Mo¶¶π\‘>ÙSÇ(\√w\ÈıWtã)ü®J\‚´q\Á{	\›	‹ó¯cd\≈¯v\—0\◊ûïÙ8≥±ˇ\‰ì|R—î!\Â´\rj\»Y]zï \rƒã#!*i;\Óπ6[|\ÿªKΩí\ƒ›ª4X^\…/Gä\‰¬ù°+\‘\≈,:¨R:\Î\◊aY\Ÿ\Át\ÿ¯6\—w\ÿ7t\ÿLE‹Ø\√q4\ \Ô\“\·xı9E\”\·E\‘k˙•\'\–ns≥\'\Zèö\”\·$∫,˘”≥~;ò|\\á\·6\Àj\Ê§Z\÷\È∞B\À,\ÎuX•xÀê(¡rÖ_´\√&\Íµ\÷a3•Y˛†\√q‘íb\–\·x\ÓJ˘Ñ/¢\Âiè\œ~[∂\"\Ì:ú®\ÏHO\÷\·$™\»Ú\¬¶\nØ\'e}IáU\ \…zP\¬\‡\„≥N\Í∞JôYﬂó∞xc\÷k:¨Rj\÷6â∏d˝Iáã¨®Ñ\Õ¿\'X\”tX%´\’&\·8_kù#æŸµ:9\Ÿ\r:å¯f_¨√êô}ü#æ\Ÿ:å¯fˇ£#æŸø\“a\ƒ7\ÁaF|s^\‘a\ƒ7˜S:å¯j\Ÿ:å¯jü\’a\ƒW˚_:å¯\ﬂ)\·x\·´\‚\◊a¯™8∂\∆E¿ßñd\Î∞JãKNk)Ÿ®√∞ød´ÑìD\ÊóxtX•ºíêÑ-R\Œm:,\‰|M\¬i\¬\Á%\œ\Í0|^Ú]	ß{J~¶√∞ß\‰M	g\0ü^\ tX%≠4C¬ôÇæ¥VáA_\⁄$\·lIøSá˝^	\Áä(ΩMáë•˜H8_\ÿS:Æ√∞ßÙ)	\€$˝˜uX–ø,\·•\"J\ﬂ\“a\‰@\È%\\&¸Sñ®\√OY\Ã\ŒrQ	\ JuXùÅ\Õ\“ˇ≥0\Ï/ì˘cñ\Î*€™\√øK¿	1˙˝:,\◊KX∆•\Ï~z•N\⁄O~Ú\–nrëΩFè¢uRøÑ7ëèÜ–Ç:ïÜä\È£a¿\‚\Í\ﬁ+)4`¿_®Y\‚]ˇCIï≥ñi‘Åô\n\Õ\“Ä€à>¶o9≠∆ªä\ u®Zb¡1Ä~xˆ¿Ü†\‰\⁄y¥a⁄ák®Ü1\Ô\Âz©£\Ô;\◊Ã£\—f©\÷\–%RJ`\÷\Í\–ZÖ∑Ü*ø	X7f}ò˜¡≥A*=Øîèí1G[>œÆ\Œy¯oI\œ\nøıA\∆ ˙a∫8°\Ìø\Ôs\rXº\ÂÖMAiõëÜ±†	\ÍR∑#\ZµK~çä§æM∏nÅ\Ó\›\“˜.\–>§\noèHN!≠\‚<6\≈\‚\ÏÉ^aì¥˚?í\ #ÛK–çH´ˆ\Ã\Íı\Í\Ÿ[.£\Ï£^\›\Í\Õr¶_z\—kñ\Õ\⁄>,gº2S;p\rI´câe\’*\‰Rì¥$(Ω<\„∑aÿ¢Å •\Áb,£º\“˜}2\√D\Œ\rI]Û\„\Ó\÷eπ§mÇsPJv˜Cˇ†îÛæ&≠vI}n=\Z±au@èáKÆ1∆∑6˛^=\€˝z=\“7ôç±\’\ÕD»•\€í\⁄4©aæU3ëæ\„)ª^6Züî\”=Éèy;®{ƒ≠gj\‡∫ dz§Wº\Ëc≤\›:&$=-2j.ß}r\ÁKèH~a©à\Á†\Œ5£¡-˘˜\ÈZΩ˙Jc˚QHòÛ\¬nP\ni1\Ïú_Ω∫w}˙Jºí>$GsQ\r\»,ê÷ù?\'fjk`v-bnP õì!\Í\≈Â∫µ.\›ˇnYı4}ó\Œ¯¨O\Í\ﬁ#±1~±√ºz˚\ÂæÛ\Î9\‚\√U\Ï\Ë}∫∑cÊ™ΩK\∆*ñöÙ°[_øWFm@\“¯\Âﬁãe\„ê‰å≠d~v{g3K\Ï¸+Ù\»JkDn\Ó\”˜V¨\Ó\Ã\⁄1(Gs\Ÿ¸–â¯\–˙‹∫é^)!$=›∑ 7=¥¯œä\‹vœÆp∑\ÃmM\Ê¿“∑ôw¡\Ÿzã∫∞=∂ﬂÉz’à\Ì¶Äûes\’36;(#\‚¢+%\Ãj!\◊-g\Á2-¶ΩOz\À/w\…˛\ŸU\Ã\Ëí5SÃª§\'Üub≈ºî¸3\œH˜\À\Zîus∆∂\nyˆ1∑gj%\‰äwÖ§ö_a+du\ZEø\‹KÄ\r\…y\‰(@ªd\ƒ\"^1K˘W√àÃò≠gûñÕ®Ùù8˜[—öêy\ﬁ¨8Zq˝§ƒ∑\0”Å´\»Õãq¥\‡ΩIb;)OS¢u\ l\nú\'◊¥Y|lü\ƒ<\Í\◊}>ó£\›)6ôôä<\Á^9ªÙ°Yù\Ó\Ÿ\⁄\À\ÁπÛh~µåUéπ:\Z€ø^ΩfÙ=ΩGJÒ\Ã\÷D±[ªumbw\Ô\”ki\Ô\Ïi\”¸\œ\Ã\‘Œë\Ÿ\Í\‰\—wúg6ßáe˝\Í˚y∑ûè\ÁÛ\◊\Ã.ÛÃì2∑ã\œ\’◊ßüÄ\"{eeåY›´GfHó|æ\ÀU-ÙT¨\"üõ\Ájû©m¢äπ‰Ω®ZtoÙ\ZÚQ∫Ö˜∑3Wg˜üè~ó1ˇû+VΩ]\“\"øÙ¨Wø\”˘kbÆ\Èπ84Ø∂\Õ\Ëï§Oz\⁄;\ÔûwØºlñzx^\ﬁŒù\›\Ô)a›†î?ìWæÚFd¸/ó—ú:S\Á(}†ç›°Ü§«Ö¸˛\Ÿı\ƒÏöü›ÉzEç˘?∂´¸z~\ÃUﬁÖ9Ùq+öÀèçr\Ì\ÁFn\Ê\ﬁKú9˝-∂ö\ÿ˝û[Fu\ËC1˛êø\Á$\‰\›jH\ﬁı\«Œ°}Ú\ﬁhÑ\Ê\ﬂ]˝\◊—üë7¨\ﬂˇyıgûÛ\›≈ù«ò∑\Ê\ÓX\›R\Êπ˚x&bÆ˘z˜\ﬂdÌúó\œ’∞º_hëGøã\r\‚Ïôë ûO\Z)ˆ$PÇ{¯\Z™\√ÛóÜ\Îrå\ Ò|U#ü≤ƒß#€©Mß¨\¬\Ïr\Ã\‘\Ëpû\∆\Í$\◊J™≈≥ÄhB˙\ﬂv\÷˝˜O∆ôπ\ yoˆ<\Ï\‹\Ô˜\Ïvπ=⁄£ZgøG\€\‰ÚÅ“ö|\√~ﬂ∞+\Ëı\ri˛wÖ\÷\Ï\n∫˛¢J!L\Î\rÑ&†m\ﬂÚ’´´\ q©Æ\–\Z¥m\ﬁ=˝¡Ä∂\Õ\ÔÛÙ5{]\Î}}32\◊Hå&Pk.ÒÑ\ËUUZ\…&Ø{\ÿ\ÌñŒëÃßê\ÿr)´S¬èhù√Æ>œ†k¯rÕ∑˚c-◊Ü={ºÅ†g\ÿ”ßyá¥ H∑wh\ÌÆ†V§un“∂\Ï\ﬁ]°πÜ˙4\œ@¿3\“≤äYIX≥oœ∞\Àﬂø> £5ªFºC{Ø\Ó-◊∂˘z!z≥\◊\›\Ôpñ	\È\√^∑◊•u∏BC}X\\µ™∫\…7Ù\n€Ü˜kºGywk}ûÄw\œ\–2-∂v7®\\^L˙Ü=Zh\–5Û5wøk\ÿ\Â\∆20∫XákH\√\‹~±~/\‹\Ó\«=nO \‡É:± \‰á\‹˝öW%\ZÚh#\ﬁ`øt√†\œ\◊\'∏≥É0\ƒ\rßfp¡\œP\–\Îµ@hxÖ&=\Ì\€\Áv!\ﬁ¡aè+8à)¡\‡!\Ê°L\ƒ\—3,M\ÿ\Z\0(mÖ˙Aîxá˙BÅ†\\j ∏¿3\ﬂ\"[Bãgx\–;$)Ü}óC¨ˆªCP`ü◊µ\«\'\ÊG˙\·s≠\ﬂ3\‡áG|\⁄\Ô>è$êi\Ô\“\‡m\–\ﬂ\ry\› w˘˝∏q\»ÌÅíòªΩ\¬Yö\Á\n,f\–3∞_\√\⁄»ù!c\–; \›\‘7R@\◊\ÁGØGêR“õûΩ!al\»-¸Ø\Ìˆa…êàEÉ\"O∞Ùa\‚Dj L∏L¶\'ÜÉÆ=Æ+ΩC\Ì	∫ó≈úˆ>o¿?\‡\⁄/T\Ó!\œH¿\ÔÚ\√4êÙ¡ƒ†7 rˇ∞o\–\'•UÙÉ˛5ïï###Éz\¬V∏}Éï˝¡¡Å\ ¡†¯€í\ ¡¿.óXxÖ@˛ï#û`=íeÛñŒç≠õ\Z;7nŸ¨mi\’>π±©esGã\÷xÒ∂ññM-õ;\„\„;˚\·\÷Ø	ãò¿P¨ (=zû-&#Y¨πwø∂\ﬂúnëm≥\‹G±¥Dr\»E|±˝Ü@\Ó\⁄3\ÏÒàL¨–∫¡\÷\ÔB\Z¯z\≈6gpÅ1\";GD:y8èÙ∞\«Dúw√èsvâ˙ˆx$âÒ,BÉ\Ï\Ì\r!\Zf˙∞£\Ê-®80cy\÷≥\Ã\"€¥}ÆÅê´\Ê\n C\ÊsWh€ád\Œ\ÓüY÷§W.§∑K¯=n/äŒπ+\◊\‡\≈!ômÇ\◊\’\◊\Á9Å¨ñUyô@K\ﬂ\ \›˝!£ºÉ^± (ët#æ\·\À±$ï˘(ëæ\‘P\ÔÄ7\–/Ù@V\Ã›ÉHTÿèP˘˜k±\‰\’=¥PëÙ\«\∆\›sã\’ko\»êjP˜‹û\·!}√∫›í8\–\Ô\rÙa\ÌÛzFb\Â\Íú\Â:D“É\n\–7W\‚f\◊≥dau\Áb,\Ê“≠\ﬁ}~±\“\‰Y}\ﬂÎÇ†\«\\#∂w4\‚(YUSW™\’-_U^USU∑Ω\r»™\Â\Àkjp≠[Qß’≠¨]]ª:1˛#v\›\«nF1™\‘Õì˚è´˝&I\‹\Í\Ãˇòe\·LêB,∑o-†ô\√Ó¶Ösk:¶Uˇ\–c˛åéSnPûQæ£ú\ƒu|˛¸¸ÖØ\r.|mp\·kÉ_\\¯\⁄\‡\¬\◊æ6∏µ¡ÖØ\r.|mp\·kÉ_\\¯\⁄\‡\¬\◊æ6¯¯kÉ\Ÿ\œºÙQü,\ƒf>â>ñ≠>â	-†=wˆbY5®fp≠Ù∆ó\”{†∏Öü:,úõ·ôπøÚùW\‚\‹\Ï%öO\√lê£}ÚÛéÖÛg\⁄ı\”7$ü˝|rWŒß>\ﬂ¸|O˘>“á>’¶ÆS◊™M\ÍJuï\ÍT/R\€\‘\’Û©\œ;\ﬂy\ﬁOtÊ∞≠\Á¨\'Üi#∂4Û\Á\Ê∞m˙Ω\È\Â≤xû•\–/;≤d\ﬁ¸,\ÓØÕõø\“7µºè\À+˝ˇ\ÀS¥ò~J\Áy}õ:ïØP2cdãN)_û∞§W;\'ïª\'í”™ùç\ÂNjG\„V6\—\Z\'ürD\„ oãî/Ø>&Äâ¯§j\Ëo\"\r\ÌöBc∏29v¢	˙õ&\“2Ö¯k\"\…)íÔ≥ë™ö0a±V∑7¶+WS<\ \Ÿ…¶@øΩ}>˙^•ïB\ÿ\ÈúH∂TÇæê7((C6•Q…§jÙ\ÕJ\ÂJ≤P$)¶\'))´nåWö´$IVQèläY1E™m\⁄	E¸Ÿ∞Sπa\"në∞ÔÜà%£˙\Â:\≈D\È†:™,[Ú3J<U¢âïtN\ƒ%VnLP:±\ÃN∏≈¶àˇ¨üº:ï°A_ãíGôòª\\…ßÙ≠\ \‚HÜm\ÍÑrª$˚;!˙\÷E\Ã+D7ëòT=\’ßàø+∑\¬\„∑Jmá\'äVUScëRBUä¯	M9\Ë†¯\œ\‚\ (†QÑi°EhFa\≈(˘1s#h*ï+…Øå\–a¥˚\0´ôÅèI`iIı1%[±\¬ñ6g\".IXfç§¶I2\ÎDBRu\√3JÄ∂†qú»≤V˚N(er)\À&¨πÇ¡âKÄ\Î≤b±\0c¶à¡3Jû≤Xz\"_z \‹h√òQ≤b#\∆¿O	\Ôó˘èE|\≈O˙\»˛ı˛EΩˇa¨èNÒS\–\‚ú\‰ˇ,˙”çy¸\r\€\≈_•˚\0q~Ç?è£\∆\∆\Œ\'Ö¸g¸5†\„>Ù\«–Ø@<R=\€$üú@\€\Ôâ$fä\≈Ú\Á#éJ∞\Í@VÆ§fV7Ú\Á¯≥î?Eø˝≥|äñ†?âﬁä~ä\È{\Ëü‡µ¥˝QΩˇZ\‰4ä?â3\”\∆\'\"I¬Ñp\ƒ$∫#£\Ëæ°ÿ®Ω\“ˆ4ˇúr@˙\ÕHQ∞èL-µ%üÄ<\∆\‰¡Hæ-µ1û\ﬂœ∫ÿª \Z£WDO©¸ÅHùr8Ú¥f;\∆Û\√Nkù≥\–Y\Ó|H©*¨*ØzH\—\nµr≠N{Hk¥[\…\0\Áa\√Úõp\≈˘Ãë=hN¥\√¸∆àZn<ã5âuq:ÑÎòÑzpıKàpµ\ÃŒæ#°~mA\„êq\0\Ì \⁄!¥´H\≈ıJ¥œ¢}\ÌÛD°ç†|¯¡\·á~\…\·á~p¯%á_j°	épÙÄ£=í£=\‡\ËGè\‰ˆˆÄ£Gr¥É£\Ì\‡hó\Ì\‡hG;8\⁄%G;8\⁄¡\—.9ú\‡pÇ\√	ß\‰pÇ\√	\'8úí\√	\'8úí£\nU\‡®Gï\‰®G8™¿Q%9™¿Qé*…°ÅCáMrh\‡\–¿°ÅCì\Z84phí\√8,\‡∞H8,‡∞Ä\√\"9,2>!4¡q\Zß¡q\Zß%\«ipú\«ipúñß¡q\Zß˘»∏r™Ò∞ú\À)∞úí,ß¿r\n,ß¿rJ≤ú\À)∞ú“óî\Œ\‡Hõh\—°	\ﬁ)NÅw\nºSíwJ¶WMÜ¡Ga\…GapÑ%GapÑ%\«8\∆¿1é1\…1é1påÅcLrå\…\ƒ\r°	éø=)ˇ\Ê\–´Xóá+?\ƒJeêﬁñ˝zEˆüßq\Ÿéí˝g\Èj\Ÿ_Iu≤°\"\ŸCû\ÏÉd3≥à≠.π1%`\⁄.4\⁄}hG\–N¢ô$Ù\⁄khQ^\Î\\¢&õ∂ò\Ó31ù4éòNõx≤qãÒ>\„\„I£\·àÒ¥ëkçπ<Q\÷Qî˙¢º\ƒı˜h8DpmêPØÅ\ﬁ\Z\‘\ŸZºkxç3\Âåˆ˚2ˆR;Y∆éî±/ñ±\∆8~1Se•√ù>á\·¨ÀôP¥\Œˆ\nZ]QÒ:T¶[ü|;\À)ZiõdO«∫Rß˝\€h\„h°]çVáVçVéVàfì∏2\–w9ó\Ë\"üF+F+@”Ñ\n\ \Ã\ƒ\›Mjä\Ÿyå\'≤á&^H§8°ß∏|\'\"\≈U\Ë&#\≈[\–=)\Óµ5∆±\'©X\‹±\'π\«\—â\ÿ^\«Ù7c\›7\"∂\Ëâ\ÿj\–\ÌåW†ª4R¸¢≠1ëm\'õ*X;ıæ\Î˝∂à\Ìêmç\ÿJ\—9\"\≈EÇ∫ä\n1[ ∫\ËuÙÖ:\◊“ò&{ƒ∂›íàmµ†6S±<3Rπ4œÄ&ze˝˛\ÎRôsë\Ìå\Ìv\€\€`ˇãÙ¯ô6©¢{©pí]‚å∑=]˛U7\⁄\"çÒÇ\Á√∏ﬁáEˇÑ\Ì°\¬m˜@+|\“v∑≠\¬vk˘§\Ë[`˜çRE\ƒvµ6\…w¶\ŸŸ™l¡Ú\◊m\€\'l.\€6\€\ŒB\‡#∂\ÀlO3©õuÒ«ü¥µC\‡F¨¢0bª∏pRö\ÿj\€os⁄äm´µßÖiULn]˘\”\¬T”æ˛-+ú9æΩní•8\ÀL\Ôòõ.5≠7≠5\ŸMKLãM˘¶ts™\ŸbN2\'ò\„\Õf≥—¨öπô\Ã\È\‚\Á\‚\œ+”ç\‚Ø\◊…®ä´*aW˚KS\ŒÃú>A\·4•ç∑u¨gm\·)7µıj\·˜:\Ïì,~Îé∞¡æûÖS€®≠s}xï£m\“\›Æs¥ÖM\Ìóvç3vk7∞a~\√$£ŒÆI®\Îr\≈Qç3∫\Óñ\‹c\ƒXˆu∑twì5s_Éµ!u]\ \Í\÷\ÊÛ\\zÙ´c\Óeù\Êá\Ôj\Î\Ë\n?ñ\ﬂÆ@4øª-|ï¯ô™c<ô\'∂4\„I¢\Î\Ó:¶˙yr\À6ÅW˝\Õ\› {]í!õì@F≈¢ôy=iÇıdΩ CåbtE`]Å\Ë@üHEíÆ(>Q“©L–çø¢µ4èkö§)$zE“ºRHÛhê1\‡m/*íTvçu	*\÷e◊§a•Rê\Õírõ$¡ìõM\n≤1©,\\9GR®ì\‘Œí\‘J]\nõ£±\≈h\“Kfh\“K@\„¯æ<\Îlby\Ë¿Û‚óøz\Ï-¥ûM˚˙≠\·CΩö6~ §ˇ$XQOØª_Ù.O8d˜4áÿõµÒ\Âœüg˙y1Ω\‹\ﬁ<Nœ∑tvç?\ÔÙ4Gñ;ó∑\ÿ]\Õ\›\rı]çt\›8´´´˛<\¬ÍÖ∞.°´°Ò<”çb∫A\Ëj∫\ZÖÆgÉ\‘\’\‚y\ﬂ\ﬁ5n¶ı\‚wAd?¡\≈#á{r∫\◊gZ¸\ÎDB[[`=ê{\\%ˆ-rtá\Ï\Î√âhb™º±ºQLaüâ©$ÒÛn˙îı¿⁄Ç\‹\„\Ï}\ tä}=Õ∏ñQ[∏vk[∏†cGóHï∞\”u˛ò\ƒKN[©\≈€åe\√{>%\Œ˚\nû\Ô\nÖ\‚r\‡)π-\\\÷\—^πñòLP\’\”\‹\r\\\≈NQ$n<.Æe2:ÖIå`A°N@&~#¿èß.3éô∏xTN\‰\‰W˚û¡	~\r\œq|$R)üó˘\»ƒíBÒ¸ú®¨çıx>}$ß†Z¸AXE_\Îù)\Â\0.?\\7V8V>Vg?¥ê∂á\ƒQ\Z©|H°†#0\„Ä¡nä˝tÙ\›\…Àóä\«\‡pt;Ú7^\Ë√Æv\Ëø#ß\œ:6†K\rHÒ¡ôÄ\ƒä\«&°¶ê\Œ\"\'CíE*¸?X\€6\nendstream\nendobj\n\n6 0 obj\n10825\nendobj\n\n7 0 obj\n<</Type/FontDescriptor/FontName/BAAAAA+Arial-BoldMT\n/Flags 4\n/FontBBox[-627 -376 2000 1011]/ItalicAngle 0\n/Ascent 905\n/Descent 211\n/CapHeight 1010\n/StemV 80\n/FontFile2 5 0 R>>\nendobj\n\n8 0 obj\n<</Length 272/Filter/FlateDecode>>\nstream\nxú]ë\œnÑ \∆\Ô<\«\ÌaZuªâ1Ÿ∫\Ÿ\ƒCˇ§∂†0ZíäÒ\‡\€\€&=@~\√\Ã7˘f`usm¥r\Ï\’Œ¢G••Öe^≠\0\⁄√®4IR*ïp{Ñ∑ò:Cò◊∂\€\‚`jÙ0ó%ao>∑8ª\—\√E\Œ=\‹ˆb%X•Gz¯®[∑´1_0Åvîì™¢\ﬂ\Á©3\œ\›U\«F˙¥r\€\—K˛\n\ﬁ74\≈8âV\ƒ,a1ù\0\€\ÈH\…yE\À€≠\"†\Âø\\≤K˙A|v÷ó&æîÛ,´<ß»ß<=rq\rú\≈˜s\‡9\ÂÅ\‰˘˚Å¢˘µó\»u\‡\«\»9ö\‹\›ªaü?k†bµ÷Ø\0óé≥á©ïÜ\ﬂ1≥	*<\ﬂ;ïÑ\Ì\nendstream\nendobj\n\n9 0 obj\n<</Type/Font/Subtype/TrueType/BaseFont/BAAAAA+Arial-BoldMT\n/FirstChar 0\n/LastChar 11\n/Widths[750 722 610 889 556 277 666 610 333 277 277 556 ]\n/FontDescriptor 7 0 R\n/ToUnicode 8 0 R\n>>\nendobj\n\n10 0 obj\n<<\n/F1 9 0 R\n>>\nendobj\n\n11 0 obj\n<</Font 10 0 R\n/ProcSet[/PDF/Text]>>\nendobj\n\n1 0 obj\n<</Type/Page/Parent 4 0 R/Resources 11 0 R/MediaBox[0 0 595 842]/Group<</S/Transparency/CS/DeviceRGB/I true>>/Contents 2 0 R>>\nendobj\n\n12 0 obj\n<</Count 1/First 13 0 R/Last 13 0 R\n>>\nendobj\n\n13 0 obj\n<</Title<FEFF00440075006D006D00790020005000440046002000660069006C0065>\n/Dest[1 0 R/XYZ 56.7 773.3 0]/Parent 12 0 R>>\nendobj\n\n4 0 obj\n<</Type/Pages\n/Resources 11 0 R\n/MediaBox[ 0 0 595 842 ]\n/Kids[ 1 0 R ]\n/Count 1>>\nendobj\n\n14 0 obj\n<</Type/Catalog/Pages 4 0 R\n/Outlines 12 0 R\n>>\nendobj\n\n15 0 obj\n<</Author<FEFF004500760061006E00670065006C006F007300200056006C006100630068006F006700690061006E006E00690073>\n/Creator<FEFF005700720069007400650072>\n/Producer<FEFF004F00700065006E004F00660066006900630065002E006F0072006700200032002E0031>\n/CreationDate(D:20070223175637+02\'00\')>>\nendobj\n\nxref\n0 16\n0000000000 65535 f \n0000011997 00000 n \n0000000019 00000 n \n0000000224 00000 n \n0000012330 00000 n \n0000000244 00000 n \n0000011154 00000 n \n0000011176 00000 n \n0000011368 00000 n \n0000011709 00000 n \n0000011910 00000 n \n0000011943 00000 n \n0000012140 00000 n \n0000012196 00000 n \n0000012429 00000 n \n0000012494 00000 n \ntrailer\n<</Size 16/Root 14 0 R\n/Info 15 0 R\n/ID [ <F7D77B3D22B9F92829D49FF5D78B8F28>\n<F7D77B3D22B9F92829D49FF5D78B8F28> ]\n>>\nstartxref\n12787\n%%EOF\n',0,'','asaaaaaa',1),(5,'2022-04-20 10:18:08','2022-04-20 10:18:08','PCComponen',_binary '%PDF-1.4\n%√§√º√∂√ü\n2 0 obj\n<</Length 3 0 R/Filter/FlateDecode>>\nstream\nxú=é\À\n1E˜˘äªvì∂\È¥0\Ë~†\‡¯\0Ç≥ôﬂ∑≠édì{r\"X\È\rÅ∞¬≤±G\n\ \À\ró^\ﬂY≠\ÂAS!ãú0X™rπbVhl˝£®8Ò\‚(O≤vNö3J\Ë$o\—z6\Î\Ê–°w\Ï˛ö$…ùj®O˝\ËQ¶\ŒNÖföÒÀí(\n\nendstream\nendobj\n\n3 0 obj\n134\nendobj\n\n5 0 obj\n<</Length 6 0 R/Filter/FlateDecode/Length1 23164>>\nstream\nxú\Ì|y|[’ïˇπ˜=-vº»ªºE\œQº*^\‚\ÿq\ÀÒBR7â;\‘§±,+±äm)ñ\⁄&a+`ñÜai)L1¥\Ïm#\Àú\Ze∫\ÃP\“a\⁄\“NÚk°îñ¸\ t(eZb˝æ˜\Íy#Åig~¸>ü_§\‹w\œ=˜l˜ús\œ}Oäy(ÅëBN˜†Àø$13ïà˛âà•∫˜µ?‹ûµi\"”ö\›˛=É_xÚ\ﬂ\Ô#ä\À#2¸t\œ¿˛\›Ôüæ\ŸJîÙ.Q¸{˝W\ﬂ#üy4ô(˚m\»X\Ÿƒ•\”Wõàr ÉñˆØ\Ë2Æ≠\ƒx\∆U>∑\Î∞\ÂZ\–\Á\\ÅqŒ†\Î\nˇ,/ﬁÅ±6\‰\ZÙlT{3\∆Gâ*\Î¸æ@ßT%\⁄(\‰k˛aè?yK\…&¢O$Y|¿1º\≈cfcÆ®£\…øà˛ø|éSûlSûZDà[Ùıô6Ìçæ.\ÊD\œg\Â«ö˛ä\–7Ëß¨Ñi4¡˛LYÙ>\Àf\Ài#©Ù\'d\À:KwR:u\“],ïñR&mßçLçÉnf˜D˜Eﬂ¢ã\Ë\Ô\ËÅ\ËS\Ï\Í\Ëcòˇ\"˝Ω˛MeTGõAøù<ÙñÚuGøBf∫û\—Z\⁄\∆2\…E?¡˚è∞\·v∫Éæ\Õ>}Z\”\Èj»´ßFjå>˝Ä\ \Ëfı∞·ï∏\'\Ë6:¡åQw\‘Kãi	çrGÙ\'\—◊®à∫\ÈkÙ\r\ÿ\‰`S\Í*†\À\È:˙2\ÀV˛–ùÙuöf	|ß\“d8	M\È\Z¢\Z•\«\Ë,ïµ^1º˝lÙM2R\Zï¿&/Ω\≈j\Ÿ&˛†ö]˝9]J\«\Ë{XØxO©ó™.ùnà˛}Ù9 †ßX<{ö=k®6\‹zˆ™\Ë˝\—o!#ãh9<≤zz\È\ZzñæOˇN\‡£iu@Û,üi¨ˇ	\œ\Ê¯\Âe™¿jw\¬\⁄\›GaD\‰8ù†g\‡õ•\”ÙKgπ\Ï¨ó\›\∆˛¿xIπG9™¸ã\ \‘G\·o;\¬GAzêû\ƒ~~ë^b»Øb\Ì\Ï3\Ã«æ\ƒ˛ûù\Êa˛6ˇìjVØQˇ¢û5Müû˛KtsÙèd•˙$]I\·€Ø\—•“è\ÈÙÙ≥∞U¨ü\›\œ\¬\Ï4{õ\«Ò%|˜Ûª¯É¸õ\ f\Â6\ÂYµV]Ø^Ææ®˛\‹\√M&ói˙Éá¶oü˛\ÊÙè¢OEÑ\‹IÇ¸\"jÖGØBV<H\'\ÈeHˇΩJø˘˘k\Ÿˆih	∞\ÿ\Ïõ\Ïˆ#ˆ[¨í\‰{	_Àõ°\’«á·ß´˘\Ì¸h	\ÔS¸\Á¸U˛;˛G≈†,QV*{ï˚ï∞2©úR~≠Z\‘\"µB]ÆnQw®QD¶\⁄p±°\√à\·q\√sÜwåı\∆>£\ﬂ¯\”’¶k\Õˇt∂\Ï\ÏøM\”tˇtxzπkF&]	O|ï@\ﬁE~\0è˛ü¶wÖV¿äa˜j\÷\ \⁄\ÿ&ˆ)vÛ∞´\Ÿı\Ï\Ôÿó\Ÿ=\Ïˆ-¨\0k\‡&\ÿ\Ó\‡çºÉª∏á_ÀØ\Á∑£x\Á\ﬂ\Á?\·Ø3∞<K±+eπ≤QŸ°\\™a\rA\ÂÄr-<{õÚòÚíÚ≤Ú¶Ú\Â¢ñ•.VC\Íï\Í\›\Í\√\ÍQıGÜO\ZÒ~¿p\“0e¯ë\·\√Fn\Ã1\Ê+çü1>b¸•\…hZij7\›h˙\”ò˝,èï¡rm~µ\‡\ŸÿÉã˘c<]=\»\Œ\0ë\œTJ\∆\ àCv\≈PÉ2ç∏$âyÿñ¡≥\’4¡it™a\Ÿ	™e/\–A#WPâ\’\”aø\‡ß\’\Á˘EÙc\÷√≤’áï!\√x=éjtò?\ÕO∞ıtî\◊ÛK¯Ω\n±7\ÿ#ÙÚ˝\n∫É]\ŒÙ8;\√÷∞œ≥:vê˛Ög*\ÏZ™è>¿U\«6≤w\–Uj}˙\„´ [Mø†∑¶ø™&™üC}ö§ª\—o\–k\ÏQ˙33D\ﬂFuSPç\\®27#ﬂØ#Qıvbü\ƒ~\ÃF0æDG≈âb™3ÆSØ§w\Ë?\È-\√qd\‘zT\“7ßΩ\ÍW\’_E\Î¢\Â\ÿa\ÿeÙˆ]?]åÛ≤\‰å\≈\Ë2\ÏÙx‘íj\Ï\Ív\⁄A}ÙyTΩ€¢\·\ËΩ\—k¢˚£>˙G˛ô-cfc\ÿì‡®ß\Ô\·˝E˙ª	˚\‚ˇ\ﬁ)0\›GSÙ[feÖ¨\Z˚\·åaü\·∞\·1\√Q√∑\r/\Zó\√\€\◊\“=\»\Ë_\"õ\„±7˝à~Kbf\ƒ&õñQ\r\Ï]€ªhÄw+\œP\À!?ˆl	\Í¯z}%Hπ\Zﬁª˚˘\ÏçwP\'.£o\”+å≥,¨\»\r˝f\»iÉüwÅ˙!D\Z6L™v˝\ÎNb´x˙úêt™\÷l˙˝\ZﬁéJªñ°.4≥K \ÎOÙ)ÍÉÜï\‘\Œ\∆Å\'i5*k≥ÚO˜Rf°ıl	˚:¯z∞Cì(üV~\≈8-õ\ﬁ]≈Ω\ 38c¢¿è\·Ù •ã\ÿ^Xëåuú•∂Öjß∑¡ÜóâúçùŒÜu’Ø]≥zU]mÕä\Í\ÂUï\Â\Àe•%\≈EÖK\ÌK\n4\€\‚¸º‹úlkVfFzZjä%9)1aQ|ú\Ÿd4®\ng¥¨\≈\ﬁ⁄£Öãz\¬jë}√Ür1∂ªÄp\ÕCÙÑ5†Z“ÑµI¶-§tÇr˜á(ù1J\Á,%≥hıT_æLk±k\·õ\Ì\⁄$€±µ-\Õˆn-|F¬õ$|X¬âÄ\n¿†µX˚õµ0\Î\—Z¬≠˚˙G[zö!n|Q|ìΩ\…_æå\∆\„\\(úe˜è≥¨uL<´e\Õ8\'s\"å\n\Áÿõ[\¬\ŸˆfaAX)lqıÖ€∑vµ4\Átó/≥&∑Ω7Lˆı\·dá$°&©&ll\nõ§\Z\Õ+VC7i\„À¶Foû¥Poè#°\œ\ﬁÁ∫¨+¨∏∫ÖéÙ6á≥Æ|\›:7Ñ‘¶Æ\Î\Á\œ\Ê*£-VØ&Ü££\◊k·©≠]Ûgƒµª2¿\À[{F[°˙f8±≠CÉ6~]wWò]ïöXâXUl}{ã¿Ù|F\«\Ÿ\◊\€˚G?”É\–‰åÜi\€˛ÇHNéÛXÙ4\Â¥h£ù]ˆÇpCÆΩ\€’ú7ûN£\€ˆOd;µ\ÏÖ3\Â\À\∆-)1«é\'%\Î@B\‚|¿3;\'!I.†∂m≥ûe\¬\"˚F$DXsk∞§Àé5≠\œ*\ZuØ^\›\\\·>D\ƒék\Íµ¨x¡6Z\Ï\⁄\Ë	`?ÛˆBåK\«-$ä<ôM5\Ã\œ¿aá#\\V&R\ƒ‘Ñò\¬\∆ur\\[æl\ﬂ$_i˜[4tpµ√∑Æ\Ó5ïpAÅMìN\Í\≈ |hkWl¨QonÑúïé\Ó0\Ô3S33\€\≈Ã°ôôYˆ;2˘®|\»õãfˇ%[2\”Z˙◊ÑY\Ê\«L{bÛmˆ∂≠;∫¥ñ\—›∑mùF±˘U≥s:Nk\ÍRrπÒ\\E\Œ\")/õ%ÉÆÑ∞ZàFô\‘}aI)Lk\r[z6ƒÆ\›Ò\…3i2\œcöåæ#∏d7«¶[^\„X8^ª`º¿∫ÑQˆ™Eº≠s\«\Ëh¸ÇπV†\—\—Vª\÷:\⁄3Íöå\Íµk˚\Ë1˛0x\‘\ﬂ\“3\–\…\ËÒõr√≠7wc˝l\ríï\”˙q;ªaÎ∏ì\›–±£\ÎòOo7tvE8\„M=\Îª«óbÆ\ÎnEú\Àg±b§âµ1$zÑõ\ÂT\Ó1\'\—!9´JÑª\'Iúy\«\»=\…c8ã\ƒ\·Ué\€|\ﬁ8ıM¥˛(g\”F\”$op¶ëAùV(ﬁ§N3\ 6\r\”\\yöQnv≠duXﬁ´?[ø\ŸÚn˝¶≥ı\‘\0\ÿÚ.À´\nR\nR\nqa∏Å¯@S¶>p\Z\Ë/§©S–Ö\'2∏úe!tÆ(1î\ƒ_ú\ÂQ=	Ü≤¨\’Y2ª3˚3\r´≥V\Ê^ü{∑\·ÆE[J!#ûñZòl1g11\”dtj\"nQ\rLºŸôv®ÄiUº %U#\ÕRe\·ñI~”Ñ∂º\√\ÍÄi;Ömõ,;˜æ\Áÿª\Èå4≤A\⁄H;˜≤ùi\’Yôô©\È∏\ƒ\€^¿RVT◊≠\„µ5EE\≈Eˆ;x˛S=WMˆî\◊\Ì\ﬁtM\Ô\◊œæ\ÃJ^˝\\›Ü]ıı\Îû0\œ+zn˙\Õ>qÕòª≠Ã¶>˜AmR\Í%/<ˆÿìªSìƒ≥˜-\—ﬂ®∏ØÀ§{ùYüJŸìróAâ3f\Îy}JoKyìõí\'y–ô¢. §¯åÙÙ¯8cZzQFM≤RgR¶S[Zs$ìE3Yféãvf.YZs\ÿ:f\Â~\Î;V˛{+≥\∆/*ä3ã©d–éô\Ÿ;ff\Œ\Œj®ók\ﬂ;\Ï´ﬂå\’;\ﬁC\€t¶\ﬁ\"#UoÅ\Z\Œ/∞ùµF£}IQQ-¢ñûôπ¢z\ÂJ*õ\◊<\„Ω¸±O≤l€∂Ü\r\√e,˚æ\ÌΩü~\Ï.>6m=\ÌYª%Ù:õ˙\À\œ\≈:\‡~˜\À\Í:*fkèQ)åŸô\ﬂ`0\Z2åô	5Jçπ\∆Zco\Ê-\Êk≥=AS*K;\‚zJï\ﬁW˙u\„√¶áû0>ë.=Uz∫4âJ+K\€1q≤ÙµRc©3\'Ø¶\„Cr\“`*PM9˘ôpY$\ﬁT <∑X5YRRäsÛÚää\„ì-E©)\Œµ=)Ãó\¬R&y´39\'∑(?8_\Î\…cy¿-Dt|!*…î\◊ z\ÁJ\ÿ]\“bg#Z=\⁄\“\‚öbÁöãj*ã_*~≠XI.∂*V®X+Æ*é´\≈\Ÿ%øä˘Z∏8ˆB∂ùÅó\ﬂ€π◊ÅD{o\ÔN\—¡\Á\“\Î\‚\›p¶\·KI]MhÀ´ÿ∞c\ÔNÑ¡ëVê±rEuf\÷Jy\Õ\Ã@jêÉKåF	ÕÄòr\”\‘Óª™Z∏,Ù@I˛Ùõ˘\≈[\◊ˆWLøπ∏aec˘Ùõj\—mèvn\ﬂﬁπ\Î≤\Ê/ü\ÌÊªæZQø·¶ª¶9oΩg«≤\÷k\Ô>˚bñ4ΩU›Ü\‹Lc5GSK,m2z\⁄iMHÆ1g&&◊ò\ƒ\≈(.ÜL\‡∏pé-gM\rÇ™&.J2Z8•\’4Æ*\nÉ\€\”z,\Ã2…é8S%\'V&ïêñQï—ì°ºì¡2Ñó’àﬁôö∑∏&#++G]≠8≠\Ÿ5¶L≤bgó#T?1J\≈”â3oeçFU®\Ÿ\È\ﬂã9ÿ±\Èl6Æ¯g=ªπ\≈\”¸kác\Ô&ÀªØS√ôùï\r“µ,uuäÙk\Íj\0¶$ã\ÿ\Ë&„≤≥-l\ÈhØA≈è®:}áXÙùq\œ\Ôxu\„D9FÜ\ËoúIâ)\riñ¥l\\R≠\rú!à>ÇqLVwZAZZ3%)ˆ%\≈\≈b\À\‘%1\«Ù˚\Ã>}cSa”ß∂o›úΩæ∂˜\”\Ÿj\—\Ÿ$˛á¯±ùΩ-I˘Eb†[\‘¿;Ò,¯>j`2\Ó∑GúÖF√±ÙcV\Âb\€c¯âÅß¶&&%QÆ•.I&s\Ê9U/”ñ_ïﬂì\Ô\œ?îo»∑$k,\Ê,Q¯ÚæŸ∫\'™^\Í\Í π⁄∑\"•@CÒ\ÀH7ä\ g\œ\Êr\„◊à∫w\'˚Wñ¥\Ì¿cΩ_\⁄¸ô\Ô?˚¿ë}Mü\ﬁP;f8ûY\Íë\Î\'Ω)g™>7\›S\—\€\ÿﬁüèl˙\÷s-\÷G\√\Œ≥A5\Z\nMöπ\ |\“¸öY≠46s≥ôU¨\'éÃ¶\„<äoSpÚmQ\’\"æHçõøà¯˘ã@˝z\0s\ÀÿπΩb∞\‘c5XHFÅl_RŒú]\À˚\Œ\ﬁk8˛˛ÙÉÔüΩMT\'+˛k\√À®¬ì\Œ\Íï*+S5ãñ“≠≤\Z\Ã\ÍI+\œ\»L\·È©ô)Ii\…dIJcd\·\Èq\Ê\‰El◊¢(e&\ﬁ\»RícÖXVú\◊x\ÿâèíΩ¢¡º\≈\‹nV\Ã%ñ î])<eí©\Œƒ§¥\"ûæã\∆2ß2y&B˜d\\BMfv\÷«∏ó\‰\“{\Î7â\”ÚÉùı\Ô\Ó\Ã~ù¨XõXZ.´´ìÒBy\≈!mEmç(Y&Q22Vd\ÿQ\Ï\÷{W\ﬂ∫\"P‘¥\Ó¢\⁄˛\Á\È7\ÔUã⁄øpm\«\“\ÔXVom{ıÉßîç\"\◊ná±\ﬂ@l\ƒ\Ÿ>rå\‚∞P\Áúq\Ìq¸P\\8n*\ÓT\‹\Ô\„∂∏û∏Éqc@£	øíL\ÃIßƒ®\–N\‹\"\rFì\Z\œMEL{9Æ`içöm÷è\Zá~ Ñ%\»\–\»\Ë`√é4ò\À\–ng\Ÿ\”o≤lıI¶NóO®E8@\ÿ<;\ƒúrñ\n˚\Ì~\»6LN~o0\ÿ=ÜÉÜ1 07%\\)b4c	e´\ÁX¢\Î^\”k8˛\ÁVx£gr1Œ™t\ c_;Fñ\Ë˚\Œ\÷E´\Ôé˚J\‚]ñG«üà;ë8ôc6ß≥\r¸bck¸ñ≈è$>i|2\ÁªÒ\ﬂK¯I¸+	\Ôõ˛îòòóúó\·\ÃÕØ\…p&•\‘$gú\Ãx)CëÖ.yqÉÏì≤\–Û[ú	\…I©\ÌI=I<…ö\ Dd\Á÷∞©\¬\Ïâ|≠FˆKJcΩ£<\÷[Ûd\ÔLNJÆ˜\ÂòΩ+5ô7°.Jµä\\∫\»D¨2£`KK ©\\ºk±oÒ}ã\’\≈\…f\'ä∂9;\ﬂ\€Û∆¶3r˚l:Û.ä¿9g∫\’Yí\ﬁ`u.N\∆%◊ÇK^JÉ,j\rgeLÖ†H∆ÄHˆ†}dÜ\Áù,ÑíÅ0Å\„L\Ãgâ.<øN\Z$\Ë_w†(\ÔîÍìúRíPö$\‘\'9\·,íBQú£ı∏CvÓ•ùÜ#«Æ\’ZhE5)Ú˛$MÜ&cˇ3≥Æ|\Î\»Ù\ÔÆÛ≤Ùóœ∞T\„Yßrµk˝éb\ÂäK.´Øgl[\ÂW\Ó\‚∂Wô\’˘ª\”\œ|˛¶\rl\‡ ÉMM˘1ò¯à\Ô\◊{û˘qˇ\…]\…ı4gõ\ÂßC¸™~\ÓSö\ﬁj¸2™Cmc3üô\÷Mo¶¶π\‘>ÙSÇ(\√w\ÈıWtã)ü®J\‚´q\Á{	\›	‹ó¯cd\≈¯v\—0\◊ûïÙ8≥±ˇ\‰ì|R—î!\Â´\rj\»Y]zï \rƒã#!*i;\Óπ6[|\ÿªKΩí\ƒ›ª4X^\…/Gä\‰¬ù°+\‘\≈,:¨R:\Î\◊aY\Ÿ\Át\ÿ¯6\—w\ÿ7t\ÿLE‹Ø\√q4\ \Ô\“\·xı9E\”\·E\‘k˙•\'\–ns≥\'\Zèö\”\·$∫,˘”≥~;ò|\\á\·6\Àj\Ê§Z\÷\È∞B\À,\ÎuX•xÀê(¡rÖ_´\√&\Íµ\÷a3•Y˛†\√q‘íb\–\·x\ÓJ˘Ñ/¢\Âiè\œ~[∂\"\Ì:ú®\ÏHO\÷\·$™\»Ú\¬¶\nØ\'e}IáU\ \…zP\¬\‡\„≥N\Í∞JôYﬂó∞xc\÷k:¨Rj\÷6â∏d˝Iáã¨®Ñ\Õ¿\'X\”tX%´\’&\·8_kù#æŸµ:9\Ÿ\r:å¯f_¨√êô}ü#æ\Ÿ:å¯fˇ£#æŸø\“a\ƒ7\ÁaF|s^\‘a\ƒ7˜S:å¯j\Ÿ:å¯jü\’a\ƒW˚_:å¯\ﬂ)\·x\·´\‚\◊a¯™8∂\∆E¿ßñd\Î∞JãKNk)Ÿ®√∞ød´ÑìD\ÊóxtX•ºíêÑ-R\Œm:,\‰|M\¬i\¬\Á%\œ\Í0|^Ú]	ß{J~¶√∞ß\‰M	g\0ü^\ tX%≠4C¬ôÇæ¥VáA_\⁄$\·lIøSá˝^	\Áä(ΩMáë•˜H8_\ÿS:Æ√∞ßÙ)	\€$˝˜uX–ø,\·•\"J\ﬂ\“a\‰@\È%\\&¸Sñ®\√OY\Ã\ŒrQ	\ JuXùÅ\Õ\“ˇ≥0\Ï/ì˘cñ\Î*€™\√øK¿	1˙˝:,\◊KX∆•\Ï~z•N\⁄O~Ú\–nrëΩFè¢uRøÑ7ëèÜ–Ç:ïÜä\È£a¿\‚\Í\ﬁ+)4`¿_®Y\‚]ˇCIï≥ñi‘Åô\n\Õ\“Ä€à>¶o9≠∆ªä\ u®Zb¡1Ä~xˆ¿Ü†\‰\⁄y¥a⁄ák®Ü1\Ô\Âz©£\Ô;\◊Ã£\—f©\÷\–%RJ`\÷\Í\–ZÖ∑Ü*ø	X7f}ò˜¡≥A*=Øîèí1G[>œÆ\Œy¯oI\œ\nøıA\∆ ˙a∫8°\Ìø\Ôs\rXº\ÂÖMAiõëÜ±†	\ÍR∑#\ZµK~çä§æM∏nÅ\Ó\›\“˜.\–>§\noèHN!≠\‚<6\≈\‚\ÏÉ^aì¥˚?í\ #ÛK–çH´ˆ\Ã\Íı\Í\Ÿ[.£\Ï£^\›\Í\Õr¶_z\—kñ\Õ\⁄>,gº2S;p\rI´câe\’*\‰Rì¥$(Ω<\„∑aÿ¢Å •\Áb,£º\“˜}2\√D\Œ\rI]Û\„\Ó\÷eπ§mÇsPJv˜Cˇ†îÛæ&≠vI}n=\Z±au@èáKÆ1∆∑6˛^=\€˝z=\“7ôç±\’\ÕD»•\€í\⁄4©aæU3ëæ\„)ª^6Züî\”=Éèy;®{ƒ≠gj\‡∫ dz§Wº\Ëc≤\›:&$=-2j.ß}r\ÁKèH~a©à\Á†\Œ5£¡-˘˜\ÈZΩ˙Jc˚QHòÛ\¬nP\ni1\Ïú_Ω∫w}˙Jºí>$GsQ\r\»,ê÷ù?\'fjk`v-bnP õì!\Í\≈Â∫µ.\›ˇnYı4}ó\Œ¯¨O\Í\ﬁ#±1~±√ºz˚\ÂæÛ\Î9\‚\√U\Ï\Ë}∫∑cÊ™ΩK\∆*ñöÙ°[_øWFm@\“¯\Âﬁãe\„ê‰å≠d~v{g3K\Ï¸+Ù\»JkDn\Ó\”˜V¨\Ó\Ã\⁄1(Gs\Ÿ¸–â¯\–˙‹∫é^)!$=›∑ 7=¥¯œä\‹vœÆp∑\ÃmM\Ê¿“∑ôw¡\Ÿzã∫∞=∂ﬂÉz’à\Ì¶Äûes\’36;(#\‚¢+%\Ãj!\◊-g\Á2-¶ΩOz\À/w\…˛\ŸU\Ã\Ëí5SÃª§\'Üub≈ºî¸3\œH˜\À\Zîus∆∂\nyˆ1∑gj%\‰äwÖ§ö_a+du\ZEø\‹KÄ\r\…y\‰(@ªd\ƒ\"^1K˘W√àÃò≠gûñÕ®Ùù8˜[—öêy\ﬁ¨8Zq˝§ƒ∑\0”Å´\»Õãq¥\‡ΩIb;)OS¢u\ l\nú\'◊¥Y|lü\ƒ<\Í\◊}>ó£\›)6ôôä<\Á^9ªÙ°Yù\Ó\Ÿ\⁄\À\ÁπÛh~µåUéπ:\Z€ø^ΩfÙ=ΩGJÒ\Ã\÷D±[ªumbw\Ô\”ki\Ô\Ïi\”¸\œ\Ã\‘Œë\Ÿ\Í\‰\—wúg6ßáe˝\Í˚y∑ûè\ÁÛ\◊\Ã.ÛÃì2∑ã\œ\’◊ßüÄ\"{eeåY›´GfHó|æ\ÀU-ÙT¨\"üõ\Ájû©m¢äπ‰Ω®ZtoÙ\ZÚQ∫Ö˜∑3Wg˜üè~ó1ˇû+VΩ]\“\"øÙ¨Wø\”˘kbÆ\Èπ84Ø∂\Õ\Ëï§Oz\⁄;\ÔûwØºlñzx^\ﬁŒù\›\Ô)a›†î?ìWæÚFd¸/ó—ú:S\Á(}†ç›°Ü§«Ö¸˛\Ÿı\ƒÏöü›ÉzEç˘?∂´¸z~\ÃUﬁÖ9Ùq+öÀèçr\Ì\ÁFn\Ê\ﬁKú9˝-∂ö\ÿ˝û[Fu\ËC1˛êø\Á$\‰\›jH\ﬁı\«Œ°}Ú\ﬁhÑ\Ê\ﬂ]˝\◊—üë7¨\ﬂˇyıgûÛ\›≈ù«ò∑\Ê\ÓX\›R\Êπ˚x&bÆ˘z˜\ﬂdÌúó\œ’∞º_hëGøã\r\‚Ïôë ûO\Z)ˆ$PÇ{¯\Z™\√ÛóÜ\Îrå\ Ò|U#ü≤ƒß#€©Mß¨\¬\Ïr\Ã\‘\Ëpû\∆\Í$\◊J™≈≥ÄhB˙\ﬂv\÷˝˜O∆ôπ\ yoˆ<\Ï\‹\Ô˜\Ïvπ=⁄£ZgøG\€\‰ÚÅ“ö|\√~ﬂ∞+\Ëı\ri˛wÖ\÷\Ï\n∫˛¢J!L\Î\rÑ&†m\ﬂÚ’´´\ q©Æ\–\Z¥m\ﬁ=˝¡Ä∂\Õ\ÔÛÙ5{]\Î}}32\◊Hå&Pk.ÒÑ\ËUUZ\…&Ø{\ÿ\ÌñŒëÃßê\ÿr)´S¬èhù√Æ>œ†k¯rÕ∑˚c-◊Ü={ºÅ†g\ÿ”ßyá¥ H∑wh\ÌÆ†V§un“∂\Ï\ﬁ]°πÜ˙4\œ@¿3\“≤äYIX≥oœ∞\Àﬂø> £5ªFºC{Ø\Ó-◊∂˘z!z≥\◊\›\Ôpñ	\È\√^∑◊•u∏BC}X\\µ™∫\…7Ù\n€Ü˜kºGywk}ûÄw\œ\–2-∂v7®\\^L˙Ü=Zh\–5Û5wøk\ÿ\Â\∆20∫XákH\√\‹~±~/\‹\Ó\«=nO \‡É:± \‰á\‹˝öW%\ZÚh#\ﬁ`øt√†\œ\◊\'∏≥É0\ƒ\rßfp¡\œP\–\Îµ@hxÖ&=\Ì\€\Áv!\ﬁ¡aè+8à)¡\‡!\Ê°L\ƒ\—3,M\ÿ\Z\0(mÖ˙Aîxá˙BÅ†\\j ∏¿3\ﬂ\"[Bãgx\–;$)Ü}óC¨ˆªCP`ü◊µ\«\'\ÊG˙\·s≠\ﬂ3\‡áG|\⁄\Ô>è$êi\Ô\“\‡m\–\ﬂ\ry\› w˘˝∏q\»ÌÅíòªΩ\¬Yö\Á\n,f\–3∞_\√\⁄»ù!c\–; \›\‘7R@\◊\ÁGØGêR“õûΩ!al\»-¸Ø\Ìˆa…êàEÉ\"O∞Ùa\‚Dj L∏L¶\'ÜÉÆ=Æ+ΩC\Ì	∫ó≈úˆ>o¿?\‡\⁄/T\Ó!\œH¿\ÔÚ\√4êÙ¡ƒ†7 rˇ∞o\–\'•UÙÉ˛5ïï###Éz\¬V∏}Éï˝¡¡Å\ ¡†¯€í\ ¡¿.óXxÖ@˛ï#û`=íeÛñŒç≠õ\Z;7nŸ¨mi\’>π±©esGã\÷xÒ∂ññM-õ;\„\„;˚\·\÷Ø	ãò¿P¨ (=zû-&#Y¨πwø∂\ﬂúnëm≥\‹G±¥Dr\»E|±˝Ü@\Ó\⁄3\ÏÒàL¨–∫¡\÷\ÔB\Z¯z\≈6gpÅ1\";GD:y8èÙ∞\«Dúw√èsvâ˙ˆx$âÒ,BÉ\Ï\Ì\r!\Zf˙∞£\Ê-®80cy\÷≥\Ã\"€¥}ÆÅê´\Ê\n C\ÊsWh€ád\Œ\ÓüY÷§W.§∑K¯=n/äŒπ+\◊\‡\≈!ômÇ\◊\’\◊\Á9Å¨ñUyô@K\ﬂ\ \›˝!£ºÉ^± (ët#æ\·\À±$ï˘(ëæ\‘P\ÔÄ7\–/Ù@V\Ã›ÉHTÿèP˘˜k±\‰\’=¥PëÙ\«\∆\›sã\’ko\»êjP˜‹û\·!}√∫›í8\–\Ô\rÙa\ÌÛzFb\Â\Íú\Â:D“É\n\–7W\‚f\◊≥dau\Áb,\Ê“≠\ﬁ}~±\“\‰Y}\ﬂÎÇ†\«\\#∂w4\‚(YUSW™\’-_U^USU∑Ω\r»™\Â\Àkjp≠[Qß’≠¨]]ª:1˛#v\›\«nF1™\‘Õì˚è´˝&I\‹\Í\Ãˇòe\·LêB,∑o-†ô\√Ó¶Ösk:¶Uˇ\–c˛åéSnPûQæ£ú\ƒu|˛¸¸ÖØ\r.|mp\·kÉ_\\¯\⁄\‡\¬\◊æ6∏µ¡ÖØ\r.|mp\·kÉ_\\¯\⁄\‡\¬\◊æ6¯¯kÉ\Ÿ\œºÙQü,\ƒf>â>ñ≠>â	-†=wˆbY5®fp≠Ù∆ó\”{†∏Öü:,úõ·ôπøÚùW\‚\‹\Ï%öO\√lê£}ÚÛéÖÛg\⁄ı\”7$ü˝|rWŒß>\ﬂ¸|O˘>“á>’¶ÆS◊™M\ÍJuï\ÍT/R\€\‘\’Û©\œ;\ﬂy\ﬁOtÊ∞≠\Á¨\'Üi#∂4Û\Á\Ê∞m˙Ω\È\Â≤xû•\–/;≤d\ﬁ¸,\ÓØÕõø\“7µºè\À+˝ˇ\ÀS¥ò~J\Áy}õ:ïØP2cdãN)_û∞§W;\'ïª\'í”™ùç\ÂNjG\„V6\—\Z\'ürD\„ oãî/Ø>&Äâ¯§j\Ëo\"\r\ÌöBc∏29v¢	˙õ&\“2Ö¯k\"\…)íÔ≥ë™ö0a±V∑7¶+WS<\ \Ÿ…¶@øΩ}>˙^•ïB\ÿ\ÈúH∂TÇæê7((C6•Q…§jÙ\ÕJ\ÂJ≤P$)¶\'))´nåWö´$IVQèläY1E™m\⁄	E¸Ÿ∞Sπa\"në∞ÔÜà%£˙\Â:\≈D\È†:™,[Ú3J<U¢âïtN\ƒ%VnLP:±\ÃN∏≈¶àˇ¨üº:ï°A_ãíGôòª\\…ßÙ≠\ \‚HÜm\ÍÑrª$˚;!˙\÷E\Ã+D7ëòT=\’ßàø+∑\¬\„∑Jmá\'äVUScëRBUä¯	M9\Ë†¯\œ\‚\ (†QÑi°EhFa\≈(˘1s#h*ï+…Øå\–a¥˚\0´ôÅèI`iIı1%[±\¬ñ6g\".IXfç§¶I2\ÎDBRu\√3JÄ∂†qú»≤V˚N(er)\À&¨πÇ¡âKÄ\Î≤b±\0c¶à¡3Jû≤Xz\"_z \‹h√òQ≤b#\∆¿O	\Ôó˘èE|\≈O˙\»˛ı˛EΩˇa¨èNÒS\–\‚ú\‰ˇ,˙”çy¸\r\€\≈_•˚\0q~Ç?è£\∆\∆\Œ\'Ö¸g¸5†\„>Ù\«–Ø@<R=\€$üú@\€\Ôâ$fä\≈Ú\Á#éJ∞\Í@VÆ§fV7Ú\Á¯≥î?Eø˝≥|äñ†?âﬁä~ä\È{\Ëü‡µ¥˝QΩˇZ\‰4ä?â3\”\∆\'\"I¬Ñp\ƒ$∫#£\Ëæ°ÿ®Ω\“ˆ4ˇúr@˙\ÕHQ∞èL-µ%üÄ<\∆\‰¡Hæ-µ1û\ﬂœ∫ÿª \Z£WDO©¸ÅHùr8Ú¥f;\∆Û\√Nkù≥\–Y\Ó|H©*¨*ØzH\—\nµr≠N{Hk¥[\…\0\Áa\√Úõp\≈˘Ãë=hN¥\√¸∆àZn<ã5âuq:ÑÎòÑzpıKàpµ\ÃŒæ#°~mA\„êq\0\Ì \⁄!¥´H\≈ıJ¥œ¢}\ÌÛD°ç†|¯¡\·á~\…\·á~p¯%á_j°	épÙÄ£=í£=\‡\ËGè\‰ˆˆÄ£Gr¥É£\Ì\‡hó\Ì\‡hG;8\⁄%G;8\⁄¡\—.9ú\‡pÇ\√	ß\‰pÇ\√	\'8úí\√	\'8úí£\nU\‡®Gï\‰®G8™¿Q%9™¿Qé*…°ÅCáMrh\‡\–¿°ÅCì\Z84phí\√8,\‡∞H8,‡∞Ä\√\"9,2>!4¡q\Zß¡q\Zß%\«ipú\«ipúñß¡q\Zß˘»∏r™Ò∞ú\À)∞úí,ß¿r\n,ß¿rJ≤ú\À)∞ú“óî\Œ\‡Hõh\—°	\ﬁ)NÅw\nºSíwJ¶WMÜ¡Ga\…GapÑ%GapÑ%\«8\∆¿1é1\…1é1påÅcLrå\…\ƒ\r°	éø=)ˇ\Ê\–´Xóá+?\ƒJeêﬁñ˝zEˆüßq\Ÿéí˝g\Èj\Ÿ_Iu≤°\"\ŸCû\ÏÉd3≥à≠.π1%`\⁄.4\⁄}hG\–N¢ô$Ù\⁄khQ^\Î\\¢&õ∂ò\Ó31ù4éòNõx≤qãÒ>\„\„I£\·àÒ¥ëkçπ<Q\÷Qî˙¢º\ƒı˜h8DpmêPØÅ\ﬁ\Z\‘\ŸZºkxç3\Âåˆ˚2ˆR;Y∆éî±/ñ±\∆8~1Se•√ù>á\·¨ÀôP¥\Œˆ\nZ]QÒ:T¶[ü|;\À)ZiõdO«∫Rß˝\€h\„h°]çVáVçVéVàfì∏2\–w9ó\Ë\"üF+F+@”Ñ\n\ \Ã\ƒ\›Mjä\Ÿyå\'≤á&^H§8°ß∏|\'\"\≈U\Ë&#\≈[\–=)\Óµ5∆±\'©X\‹±\'π\«\—â\ÿ^\«Ù7c\›7\"∂\Ëâ\ÿj\–\ÌåW†ª4R¸¢≠1ëm\'õ*X;ıæ\Î˝∂à\Ìêmç\ÿJ\—9\"\≈EÇ∫ä\n1[ ∫\ËuÙÖ:\◊“ò&{ƒ∂›íàmµ†6S±<3Rπ4œÄ&ze˝˛\ÎRôsë\Ìå\Ìv\€\€`ˇãÙ¯ô6©¢{©pí]‚å∑=]˛U7\⁄\"çÒÇ\Á√∏ﬁáEˇÑ\Ì°\¬m˜@+|\“v∑≠\¬vk˘§\Ë[`˜çRE\ƒvµ6\…w¶\ŸŸ™l¡Ú\◊m\€\'l.\€6\€\ŒB\‡#∂\ÀlO3©õuÒ«ü¥µC\‡F¨¢0bª∏pRö\ÿj\€os⁄äm´µßÖiULn]˘\”\¬T”æ˛-+ú9æΩní•8\ÀL\Ôòõ.5≠7≠5\ŸMKLãM˘¶ts™\ŸbN2\'ò\„\Õf≥—¨öπô\Ã\È\‚\Á\‚\œ+”ç\‚Ø\◊…®ä´*aW˚KS\ŒÃú>A\·4•ç∑u¨gm\·)7µıj\·˜:\Ïì,~Îé∞¡æûÖS€®≠s}xï£m\“\›Æs¥ÖM\Ìóvç3vk7∞a~\√$£ŒÆI®\Îr\≈Qç3∫\Óñ\‹c\ƒXˆu∑twì5s_Éµ!u]\ \Í\÷\ÊÛ\\zÙ´c\Óeù\Êá\Ôj\Î\Ë\n?ñ\ﬂÆ@4øª-|ï¯ô™c<ô\'∂4\„I¢\Î\Ó:¶˙yr\À6ÅW˝\Õ\› {]í!õì@F≈¢ôy=iÇıdΩ CåbtE`]Å\Ë@üHEíÆ(>Q“©L–çø¢µ4èkö§)$zE“ºRHÛhê1\‡m/*íTvçu	*\÷e◊§a•Rê\Õírõ$¡ìõM\n≤1©,\\9GR®ì\‘Œí\‘J]\nõ£±\≈h\“Kfh\“K@\„¯æ<\Îlby\Ë¿Û‚óøz\Ï-¥ûM˚˙≠\·CΩö6~ §ˇ$XQOØª_Ù.O8d˜4áÿõµÒ\Âœüg˙y1Ω\‹\ﬁ<Nœ∑tvç?\ÔÙ4Gñ;ó∑\ÿ]\Õ\›\rı]çt\›8´´´˛<\¬ÍÖ∞.°´°Ò<”çb∫A\Ëj∫\ZÖÆgÉ\‘\’\‚y\ﬂ\ﬁ5n¶ı\‚wAd?¡\≈#á{r∫\◊gZ¸\ÎDB[[`=ê{\\%ˆ-rtá\Ï\Î√âhb™º±ºQLaüâ©$ÒÛn˙îı¿⁄Ç\‹\„\Ï}\ tä}=Õ∏ñQ[∏vk[∏†cGóHï∞\”u˛ò\ƒKN[©\≈€åe\√{>%\Œ˚\nû\Ô\nÖ\‚r\‡)π-\\\÷\—^πñòLP\’\”\‹\r\\\≈NQ$n<.Æe2:ÖIå`A°N@&~#¿èß.3éô∏xTN\‰\‰W˚û¡	~\r\œq|$R)üó˘\»ƒíBÒ¸ú®¨çıx>}$ß†Z¸AXE_\Îù)\Â\0.?\\7V8V>Vg?¥ê∂á\ƒQ\Z©|H°†#0\„Ä¡nä˝tÙ\›\…Àóä\«\‡pt;Ú7^\Ë√Æv\Ëø#ß\œ:6†K\rHÒ¡ôÄ\ƒä\«&°¶ê\Œ\"\'CíE*¸?X\€6\nendstream\nendobj\n\n6 0 obj\n10825\nendobj\n\n7 0 obj\n<</Type/FontDescriptor/FontName/BAAAAA+Arial-BoldMT\n/Flags 4\n/FontBBox[-627 -376 2000 1011]/ItalicAngle 0\n/Ascent 905\n/Descent 211\n/CapHeight 1010\n/StemV 80\n/FontFile2 5 0 R>>\nendobj\n\n8 0 obj\n<</Length 272/Filter/FlateDecode>>\nstream\nxú]ë\œnÑ \∆\Ô<\«\ÌaZuªâ1Ÿ∫\Ÿ\ƒCˇ§∂†0ZíäÒ\‡\€\€&=@~\√\Ã7˘f`usm¥r\Ï\’Œ¢G••Öe^≠\0\⁄√®4IR*ïp{Ñ∑ò:Cò◊∂\€\‚`jÙ0ó%ao>∑8ª\—\√E\Œ=\‹ˆb%X•Gz¯®[∑´1_0Åvîì™¢\ﬂ\Á©3\œ\›U\«F˙¥r\€\—K˛\n\ﬁ74\≈8âV\ƒ,a1ù\0\€\ÈH\…yE\À€≠\"†\Âø\\≤K˙A|v÷ó&æîÛ,´<ß»ß<=rq\rú\≈˜s\‡9\ÂÅ\‰˘˚Å¢˘µó\»u\‡\«\»9ö\‹\›ªaü?k†bµ÷Ø\0óé≥á©ïÜ\ﬂ1≥	*<\ﬂ;ïÑ\Ì\nendstream\nendobj\n\n9 0 obj\n<</Type/Font/Subtype/TrueType/BaseFont/BAAAAA+Arial-BoldMT\n/FirstChar 0\n/LastChar 11\n/Widths[750 722 610 889 556 277 666 610 333 277 277 556 ]\n/FontDescriptor 7 0 R\n/ToUnicode 8 0 R\n>>\nendobj\n\n10 0 obj\n<<\n/F1 9 0 R\n>>\nendobj\n\n11 0 obj\n<</Font 10 0 R\n/ProcSet[/PDF/Text]>>\nendobj\n\n1 0 obj\n<</Type/Page/Parent 4 0 R/Resources 11 0 R/MediaBox[0 0 595 842]/Group<</S/Transparency/CS/DeviceRGB/I true>>/Contents 2 0 R>>\nendobj\n\n12 0 obj\n<</Count 1/First 13 0 R/Last 13 0 R\n>>\nendobj\n\n13 0 obj\n<</Title<FEFF00440075006D006D00790020005000440046002000660069006C0065>\n/Dest[1 0 R/XYZ 56.7 773.3 0]/Parent 12 0 R>>\nendobj\n\n4 0 obj\n<</Type/Pages\n/Resources 11 0 R\n/MediaBox[ 0 0 595 842 ]\n/Kids[ 1 0 R ]\n/Count 1>>\nendobj\n\n14 0 obj\n<</Type/Catalog/Pages 4 0 R\n/Outlines 12 0 R\n>>\nendobj\n\n15 0 obj\n<</Author<FEFF004500760061006E00670065006C006F007300200056006C006100630068006F006700690061006E006E00690073>\n/Creator<FEFF005700720069007400650072>\n/Producer<FEFF004F00700065006E004F00660066006900630065002E006F0072006700200032002E0031>\n/CreationDate(D:20070223175637+02\'00\')>>\nendobj\n\nxref\n0 16\n0000000000 65535 f \n0000011997 00000 n \n0000000019 00000 n \n0000000224 00000 n \n0000012330 00000 n \n0000000244 00000 n \n0000011154 00000 n \n0000011176 00000 n \n0000011368 00000 n \n0000011709 00000 n \n0000011910 00000 n \n0000011943 00000 n \n0000012140 00000 n \n0000012196 00000 n \n0000012429 00000 n \n0000012494 00000 n \ntrailer\n<</Size 16/Root 14 0 R\n/Info 15 0 R\n/ID [ <F7D77B3D22B9F92829D49FF5D78B8F28>\n<F7D77B3D22B9F92829D49FF5D78B8F28> ]\n>>\nstartxref\n12787\n%%EOF\n',0,'','admin@pccomponentes.com',1);
/*!40000 ALTER TABLE `partners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
INSERT INTO `password_resets` VALUES ('jcperez@protonmail.com','$2y$10$hrsYW5VwWoCidzOs0nyBdeS9IWS.KbvqBSIXbCuiFOF32x7u0u71q','2022-04-18 08:06:54');
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `replies`
--

DROP TABLE IF EXISTS `replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `replies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `video_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `replies_user_id_foreign` (`user_id`),
  CONSTRAINT `replies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `replies`
--

LOCK TABLES `replies` WRITE;
/*!40000 ALTER TABLE `replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_type_id` bigint unsigned NOT NULL,
  `manager_id` bigint unsigned DEFAULT NULL,
  `creator_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `roles_user_type_id_foreign` (`user_type_id`),
  KEY `roles_manager_id_foreign` (`manager_id`),
  KEY `roles_creator_id_foreign` (`creator_id`),
  CONSTRAINT `roles_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `creators` (`id`),
  CONSTRAINT `roles_manager_id_foreign` FOREIGN KEY (`manager_id`) REFERENCES `managers` (`id`),
  CONSTRAINT `roles_user_type_id_foreign` FOREIGN KEY (`user_type_id`) REFERENCES `user_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'2022-02-05 10:54:13','2022-02-05 10:54:13',1,NULL,5),(2,'2022-02-05 11:01:50','2022-02-05 11:01:50',1,NULL,6),(3,'2022-02-05 11:15:41','2022-02-05 11:15:41',1,NULL,7),(4,'2022-02-05 11:17:04','2022-02-05 11:17:04',1,NULL,8),(7,'2022-02-05 11:42:08','2022-02-05 11:42:08',1,NULL,9),(8,'2022-02-05 12:12:36','2022-02-05 12:12:36',1,NULL,10),(9,'2022-02-05 12:14:52','2022-02-05 12:14:52',1,NULL,11),(10,'2022-02-05 12:21:07','2022-02-05 12:21:07',1,NULL,12),(11,'2022-02-05 12:24:08','2022-02-05 12:24:08',1,NULL,13),(12,'2022-02-05 12:24:08','2022-02-05 12:24:08',1,NULL,14),(13,'2022-02-05 12:24:09','2022-02-05 12:24:09',1,NULL,15),(14,'2022-02-05 12:25:14','2022-02-05 12:25:14',1,NULL,16),(15,'2022-02-05 12:25:15','2022-02-05 12:25:15',1,NULL,17),(16,'2022-02-05 12:27:56','2022-02-05 12:27:56',1,NULL,18),(17,'2022-02-05 12:28:39','2022-02-05 12:28:39',1,NULL,19),(18,'2022-02-05 12:32:23','2022-02-05 12:32:23',1,NULL,20),(19,'2022-02-05 12:32:47','2022-02-05 12:32:47',1,NULL,21),(20,'2022-02-05 12:34:00','2022-02-05 12:34:00',1,NULL,22),(21,'2022-02-05 12:34:01','2022-02-05 12:34:01',1,NULL,23),(22,'2022-02-05 12:34:20','2022-02-05 12:34:20',1,NULL,24),(23,'2022-02-05 12:34:21','2022-02-05 12:34:21',1,NULL,25),(24,'2022-02-05 12:34:48','2022-02-05 12:34:48',1,NULL,26),(25,'2022-02-05 12:35:41','2022-02-05 12:35:41',1,NULL,27),(26,'2022-02-05 12:36:04','2022-02-05 12:36:04',1,NULL,28),(27,'2022-02-05 12:36:05','2022-02-05 12:36:05',1,NULL,29),(28,'2022-02-05 12:36:05','2022-02-05 12:36:05',1,NULL,30),(29,'2022-02-05 12:37:07','2022-02-05 12:37:07',1,NULL,31),(30,'2022-02-05 12:37:08','2022-02-05 12:37:08',1,NULL,32),(31,'2022-02-05 12:37:27','2022-02-05 12:37:27',1,NULL,33),(32,'2022-02-05 12:39:33','2022-02-05 12:39:33',1,NULL,34),(33,'2022-02-05 12:39:55','2022-02-05 12:39:55',1,NULL,35),(34,'2022-02-05 12:40:13','2022-02-05 12:40:13',1,NULL,36),(35,'2022-02-05 12:41:02','2022-02-05 12:41:02',1,NULL,37),(36,'2022-02-05 12:41:03','2022-02-05 12:41:03',1,NULL,38),(37,'2022-02-05 12:41:16','2022-02-05 12:41:16',1,NULL,39),(38,'2022-02-05 12:41:16','2022-02-05 12:41:16',1,NULL,40),(39,'2022-02-05 12:41:28','2022-02-05 12:41:28',1,NULL,41),(40,'2022-02-05 12:41:29','2022-02-05 12:41:29',1,NULL,42),(41,'2022-02-05 12:41:53','2022-02-05 12:41:53',1,NULL,43),(42,'2022-02-05 12:44:38','2022-02-05 12:44:38',1,NULL,44),(43,'2022-02-05 12:44:50','2022-02-05 12:44:50',1,NULL,45),(44,'2022-02-05 12:44:59','2022-02-05 12:44:59',1,NULL,46),(45,'2022-02-05 12:45:01','2022-02-05 12:45:01',1,NULL,47),(46,'2022-02-05 12:45:39','2022-02-05 12:45:39',1,NULL,48),(47,'2022-02-05 12:45:39','2022-02-05 12:45:39',1,NULL,49),(48,'2022-02-05 12:46:08','2022-02-05 12:46:08',1,NULL,50),(49,'2022-02-05 12:46:09','2022-02-05 12:46:09',1,NULL,51),(50,'2022-02-05 12:46:33','2022-02-05 12:46:33',1,NULL,52),(51,'2022-02-05 12:46:33','2022-02-05 12:46:33',1,NULL,53),(52,'2022-02-05 12:46:59','2022-02-05 12:46:59',1,NULL,54),(53,'2022-02-05 12:47:18','2022-02-05 12:47:18',1,NULL,55),(54,'2022-02-05 12:47:29','2022-02-05 12:47:29',1,NULL,56),(55,'2022-02-05 12:47:30','2022-02-05 12:47:30',1,NULL,57),(56,'2022-02-05 12:47:40','2022-02-05 12:47:40',1,NULL,58),(57,'2022-02-05 12:47:58','2022-02-05 12:47:58',1,NULL,59),(58,'2022-02-05 12:48:02','2022-02-05 12:48:02',1,NULL,60),(59,'2022-02-05 12:48:51','2022-02-05 12:48:51',1,NULL,61),(60,'2022-02-05 12:48:52','2022-02-05 12:48:52',1,NULL,62),(61,'2022-02-05 12:48:53','2022-02-05 12:48:53',1,NULL,63),(62,'2022-02-05 12:50:11','2022-02-05 12:50:11',1,NULL,64),(63,'2022-02-05 12:50:12','2022-02-05 12:50:12',1,NULL,65),(64,'2022-02-05 12:50:28','2022-02-05 12:50:28',1,NULL,66),(65,'2022-02-05 12:50:41','2022-02-05 12:50:41',1,NULL,67),(66,'2022-02-05 12:50:47','2022-02-05 12:50:47',1,NULL,68),(67,'2022-02-05 12:51:00','2022-02-05 12:51:00',1,NULL,69),(68,'2022-02-05 12:52:34','2022-02-05 12:52:34',1,NULL,70),(69,'2022-02-05 12:54:11','2022-02-05 12:54:11',1,NULL,71),(70,'2022-02-06 09:17:47','2022-02-06 09:17:47',1,NULL,72),(71,'2022-02-06 11:03:02','2022-02-06 11:03:02',2,3,NULL),(72,'2022-02-06 14:43:18','2022-02-06 14:43:18',2,4,NULL),(73,'2022-02-13 12:30:49','2022-02-13 12:30:49',2,5,NULL),(74,'2022-03-01 20:02:28','2022-03-01 20:02:28',1,NULL,73),(75,'2022-04-12 11:44:23','2022-04-12 11:44:23',1,NULL,74),(76,'2022-04-12 11:53:50','2022-04-12 11:53:50',1,NULL,75),(77,'2022-04-18 07:59:16','2022-04-18 07:59:16',1,NULL,76),(78,'2022-04-18 08:04:58','2022-04-18 08:04:58',1,NULL,77),(79,'2022-04-18 08:08:49','2022-04-18 08:08:49',1,NULL,78),(80,'2022-04-19 08:08:49','2022-04-19 08:08:49',3,NULL,NULL),(81,'2022-04-19 13:01:53','2022-04-19 13:01:53',1,NULL,79),(82,'2022-04-20 10:58:37','2022-04-20 10:58:37',1,NULL,80),(83,'2022-04-21 09:15:22','2022-04-21 09:15:22',1,NULL,81),(84,'2022-04-21 09:18:22','2022-04-21 09:18:22',2,9,NULL),(85,'2022-04-21 09:31:39','2022-04-21 09:31:39',2,10,NULL),(86,'2022-04-21 09:32:28','2022-04-21 09:32:28',2,11,NULL),(87,'2022-04-22 16:50:17','2022-04-22 16:50:17',1,NULL,82);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_types`
--

DROP TABLE IF EXISTS `user_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_types`
--

LOCK TABLES `user_types` WRITE;
/*!40000 ALTER TABLE `user_types` DISABLE KEYS */;
INSERT INTO `user_types` VALUES (1,NULL,NULL,'Creator'),(2,NULL,NULL,'Manager'),(3,NULL,NULL,'Admin');
/*!40000 ALTER TABLE `user_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'jperez','jos3k4@gmail.com',NULL,'$2y$10$2nYC2bb/TaDm8SrpNoWAKe0CTh8cTCUHmxmttNj3l9Z3VSaauJfwm','RWnL13PkXA48EdCKY26r7eEgJ24V7l7EfMIUvIyqVO21LEocZBmnBYFam2UX','2021-12-13 19:56:08','2022-04-20 11:47:47',68),(5,'Josee Carlos Perez','jcperez@protonmail.com',NULL,'$2y$10$DiH/LZ.Q2bXVNA0Evd34rO8AcSH0KRcwBeZbeSqor/km4SKC.KMbC',NULL,'2022-01-31 18:35:58','2022-04-20 11:58:13',2),(10,'Vegeta','test@gmail.com',NULL,'$2y$10$/yiPbQAYbLv.lKPsYmuZmeRYsSHgUg/i76vA3zoI/fbQZa4ddBe/S',NULL,'2022-02-05 12:27:42','2022-02-05 12:54:11',69),(11,'Master user','test@protonmail.com',NULL,'$2y$10$OHA3wjSlOxanzedr5N.LdO8x/xhML06wHt/NGUZySRIdDIIc6WqyW',NULL,'2022-02-06 09:17:22','2022-02-06 09:17:47',70),(13,'Machine Gun','test2@gmail.com',NULL,'$2y$10$2i7VoKmIL32ugM0c5w1v/.uBeXgMkqfp2xHHnvsVfK7uFdysinkhq',NULL,'2022-02-06 14:42:59','2022-02-06 14:43:18',72),(14,'JC Manager','manager@gmail.com',NULL,'$2y$10$gy2vwONTsLz2iYw2CKMUf.JuMwl8zLtBqMtd9mrtvrnE6qcbddcmu',NULL,'2022-02-13 12:30:20','2022-02-13 12:30:49',73),(17,'Vegeta777','vegeta@gmail.com',NULL,'$2y$10$CxEFlHtdlxWyflLyrDZ2c.2rAz6HcSAm4tbpMQqUW11EDwsl1ey12',NULL,'2022-04-12 11:53:28','2022-04-12 11:53:50',76),(18,'Jose Carlos Perez','jperez@gmail.com',NULL,'$2y$10$6o07GtTFQUqelO45KOtcVuJ4kyJzr4KeCPZSr7AIJrheadZ/9ob6K',NULL,'2022-04-18 07:58:48','2022-04-18 07:59:16',77),(20,'Jose','jperez2@gmail.com',NULL,'$2y$10$dpwjCab6V.nW1RjqhZ.OqOf9LC6LsZ165Yeepj/HkQ0FQzah4I/gy','j7i1DQf60g1PoxL1qRCtw9vx7VfIGltjq8QSjXkaNDWtyj2Xen7n25iCT8dN','2022-04-18 08:08:31','2022-04-18 08:08:49',79),(21,'Administrator','admin@gmail.com',NULL,'$2y$10$pLk6LeEkxWDvy54bBiDc6.vHTNtZucMEzEYKkH6irnw2gomV5qkPe',NULL,'2022-04-19 13:01:23','2022-04-19 13:01:53',81),(22,'Administrator','admin2@gmail.com',NULL,'$2y$10$KlUZHTl.zu61KSzCe33T6ejGXVTGEwhgz/2kXRzFvIdliAdbSxO5W','cKaK3NoC110Dk9jvgUlLJa2jRvRQshDMFyglzntEqZYjUtl8cID1bY1xLWlh','2022-04-19 13:06:06','2022-04-19 13:06:06',80),(23,'test3','test3@gmail.com',NULL,'$2y$10$aBKf9zP8S6jeEHu7YaR7yeEgQ3v2gYkyoUXGFF/5TLIR4HpZlT4Mi',NULL,'2022-04-20 10:56:57','2022-04-20 10:58:37',82),(25,'Amazing Content Manager','manager2@gmail.com',NULL,'$2y$10$xD.D6q9z0af1Jx.Z2qCLbeDZ75ZbWAe4.QbQvbFkq50OSbv7IMxcq',NULL,'2022-04-21 09:08:06','2022-04-21 09:08:06',0),(26,'TesteOOooo','jpereztest@gmail.com',NULL,'$2y$10$2Mmz2V4hnt3nIfZKtuB5GeRoOQ9LyAY62efPza87UTBb/rExa4dbS',NULL,'2022-04-21 09:15:13','2022-04-21 09:15:22',83),(27,'TesteooOoo manager','testmanager@gmail.com',NULL,'$2y$10$r91LuPtFEws0nH2iAZL0Me5MDadMB4hoMzp61yT3XD5/JtnKdwoRa',NULL,'2022-04-21 09:15:46','2022-04-21 09:18:22',84),(28,'Other Manager','manager3@gmail.com',NULL,'$2y$10$6KWJKJNHzB/EfhYRIKnWFeMLwo.ciKc2hPOPI40H4lwNOzSSD1C5i',NULL,'2022-04-21 09:31:23','2022-04-21 09:31:39',85),(29,'Manager Maki','manager4@gmail.com',NULL,'$2y$10$lQQ8eIYq54Oxl7upOVf.M.LchnSOctRNdbTpMJo4eL.9bZ/wr6q5S',NULL,'2022-04-21 09:32:13','2022-04-21 09:32:28',86),(30,'Tanque','tanque@gmail.com',NULL,'$2y$10$xVi./uoQLVaNJbpX/r0uM.lkzlYUW0t1s/wQ0vL.hRb7A32QJ/VkS',NULL,'2022-04-22 16:50:04','2022-04-22 16:50:17',87);
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

-- Dump completed on 2022-04-24 19:33:37
