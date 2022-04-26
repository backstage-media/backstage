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
INSERT INTO `notifications` VALUES (1,'2022-04-18 14:27:51','2022-04-18 14:27:51',20,14,2,'Your video \"Bloodborne PVE 3 online A lo loco   El cara jaula y el rey del castillo\" changed visibility to public','0etU5xLS23s',0),(2,'2022-04-18 15:05:42','2022-04-18 15:05:42',20,14,2,'Your video \"Transmision de PS4 en vivo de rhoperto\" changed visibility to unlisted','I7B-TXPsM6E',0),(3,'2022-04-18 15:20:09','2022-04-18 15:20:09',20,14,1,'New Comment added for video \"wPpJIIwmTKA\": This is a test message, notifications should work!','wPpJIIwmTKA:11',0),(4,'2022-04-18 15:39:23','2022-04-18 15:39:23',20,14,1,'New Comment added for video \"Transmisión de PS4 en vivo de josek91\": Otra pruebaaa!','wPpJIIwmTKA:12',0),(5,'2022-04-18 15:52:25','2022-04-18 15:52:25',20,14,1,'New Comment added for video \"Transmisión de PS4 en vivo de josek91\": atuuun','wPpJIIwmTKA:13',0),(6,'2022-04-18 16:12:53','2022-04-18 16:12:53',20,14,2,'Your video \"Transmision de PS4 en vivo de rhoperto 2\" changed visibility to unlisted','Mu2bwy4J1mk',0),(7,'2022-04-19 07:36:42','2022-04-19 07:36:42',17,14,1,'New Comment added for video \"Transmision de PS4 en vivo de rhoperto 2\": Este video es la leche!','Mu2bwy4J1mk:14',0),(8,'2022-04-19 10:38:55','2022-04-19 10:38:55',14,17,1,'New Comment added for video \"Transmisión de PS4 en vivo de josek91\": Otro comentario maestro.','cdm2MziC7q4:16',0),(9,'2022-04-19 10:50:06','2022-04-19 10:50:06',14,17,2,'Your video \"Bloodborne PVE 3 online A lo loco%21 1\" changed visibility to unlisted','BUHKuKOtgGg',0),(10,'2022-04-19 10:52:57','2022-04-19 10:52:57',17,14,1,'New Comment added for video \"Bloodborne PVE 3 online A lo loco%21 1\": Gracias por publicarlo!','BUHKuKOtgGg:17',0),(11,'2022-04-19 11:01:46','2022-04-19 11:01:46',17,14,1,'New Comment added for video \"Bloodborne PVE 3 online A lo loco%21 1\": Otra prueba de comment!','BUHKuKOtgGg:18',0),(12,'2022-04-19 11:02:01','2022-04-19 11:02:01',17,14,1,'New Comment added for video \"Bloodborne PVE 3 online A lo loco%21 1\": Another test again','BUHKuKOtgGg:19',0),(13,'2022-04-19 11:02:15','2022-04-19 11:02:15',17,14,1,'New Comment added for video \"Bloodborne PVE 3 online A lo loco%21 1\": Testing 1,2,3','BUHKuKOtgGg:20',0),(14,'2022-04-19 11:05:59','2022-04-19 11:05:59',17,14,1,'New Comment added for video \"Bloodborne PVE 3 online A lo loco%21 1\": Testeeeeeee','BUHKuKOtgGg:21',0),(15,'2022-04-19 11:07:32','2022-04-19 11:07:32',17,14,1,'New Comment added for video \"Bloodborne PVE 3 online A lo loco%21 1\": Tessssssssssssssssstt','BUHKuKOtgGg:22',0),(16,'2022-04-19 11:10:19','2022-04-19 11:10:19',17,14,1,'New Comment added for video \"Bloodborne PVE 3 online A lo loco%21 1\": Teeeestttttt','BUHKuKOtgGg:23',0),(17,'2022-04-19 11:10:37','2022-04-19 11:10:37',17,14,1,'New Comment added for video \"Bloodborne PVE 3 online A lo loco%21 1\": Addddddddddddddd','BUHKuKOtgGg:24',0),(18,'2022-04-19 11:12:15','2022-04-19 11:12:15',17,14,1,'New Comment added for video \"Bloodborne PVE 3 online A lo loco%21 1\": Ahoraaaaaa','BUHKuKOtgGg:25',0),(19,'2022-04-19 11:13:09','2022-04-19 11:13:09',17,14,1,'New Comment added for video \"Bloodborne PVE 3 online A lo loco%21 1\": aaaaaaaaaaaaaaaaa','BUHKuKOtgGg:26',0),(20,'2022-04-19 11:13:20','2022-04-19 11:13:20',17,14,1,'New Comment added for video \"Bloodborne PVE 3 online A lo loco%21 1\": aaaaaaaaaaaaaaaaaaaaaaaaaa','BUHKuKOtgGg:27',0),(21,'2022-04-19 11:14:02','2022-04-19 11:14:02',17,14,1,'New Comment added for video \"Bloodborne PVE 3 online A lo loco%21 1\": eeeeeeeeee','BUHKuKOtgGg:28',0),(22,'2022-04-19 11:19:44','2022-04-19 11:19:44',17,14,1,'New Comment added for video \"Bloodborne PVE 3 online A lo loco%21 1\": aaaa','BUHKuKOtgGg:29',0),(23,'2022-04-19 11:20:51','2022-04-19 11:20:51',17,14,1,'New Comment added for video \"Bloodborne PVE 3 online A lo loco%21 1\": La prueba de fuego','BUHKuKOtgGg:30',0),(24,'2022-04-20 10:20:14','2022-04-20 10:20:14',20,14,1,'New Comment added for video \"Transmisión de PS4 en vivo de josek91\": Otra prueba muy crazy!!','wPpJIIwmTKA:31',0),(25,'2022-04-21 09:22:52','2022-04-21 09:22:52',14,1,1,'New Comment added for video \"Transmisión de PS4 en vivo de josek91\": Testeeoooo','cdm2MziC7q4:32',0),(26,'2022-04-21 10:15:53','2022-04-21 10:15:53',26,14,4,'TesteOOoooStarted a new contract with you until \"2022-5-21 12:15:53','9',0),(27,'2022-04-22 14:28:55','2022-04-22 14:28:55',1,14,4,'jperez Started a new contract with you until 2022-10-22 16:28:55','10',0),(28,'2022-04-22 14:51:32','2022-04-22 14:51:32',1,14,4,'jperez Started a new contract with you until 2022-10-22 16:51:32','11',0),(29,'2022-04-22 16:15:56','2022-04-22 16:15:56',1,14,1,'New Comment added for video \"Transmisión de PS4 en vivo de josek91\": Testeooooo','cdm2MziC7q4:33',0),(30,'2022-04-22 16:17:24','2022-04-22 16:17:24',1,14,1,'New Comment added for video \"Transmisión de PS4 en vivo de josek91\": Testeoooooo','cdm2MziC7q4:34',0);
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
INSERT INTO `partners` VALUES (1,'2022-03-22 20:15:50','2022-03-22 20:15:50','Test',_binary '/tmp/phpWLqEet',0,'','Test',1),(2,'2022-03-24 17:55:09','2022-03-24 17:55:09','Asus',_binary '/tmp/phpYvR4ky',0,'','support@asus.com',1),(4,'2022-03-24 19:06:10','2022-03-24 19:06:10','aassaa',_binary '%PDF-1.4\n%äüöß\n2 0 obj\n<</Length 3 0 R/Filter/FlateDecode>>\nstream\nx�=�\�\n1E����v��\�0\�~�\��\0���߷��d�{r\"X\�\r��²�G\n\�\�\r�^\�Y�\�AS!��0X�r�bVhl���8�\�(O�vN�3J\�$o\�z6\�\�Сw\���$ɝj�O�\�Q�\�N�f��˒(\n\nendstream\nendobj\n\n3 0 obj\n134\nendobj\n\n5 0 obj\n<</Length 6 0 R/Filter/FlateDecode/Length1 23164>>\nstream\nx�\�|y|[Օ���=-v�Ȼ�E\�Q�*^\�\�q\��BR7�;\���,+��m)�\�&a+`��ai)L1�\�m#\��\Ze�\�P\�a\�\�N�k����\�t(eZb���\�y#�ig~�>�_�\�w\�=�l��s\�}O�y(��BN��˿$13���������?ܞ��i\"Ӛ\��=�_x�\�\�#�\�#2�t\���\�\�J��.Q�{�W\�#�y4�(�m\�X\�ĥ\�W��r ����\�2��\�x\�U>�\�\�Z\�\�\\�qΠ\�\n�,/ށ�6\�\Z�lT{3\�G�*\���@�T%\�(\�k�a�?yK\�&�O$Y|�1�\�cfc���\�����|�S�lS�ZD�[���6퍾.\�D\�g\�ǚ��\�7觬�i4��LY�>\�f\�i#��\'d\�:KwR:u\�],��R&m��L��nf�D�Eߢ�\�\�\�\�S\�\�\�c��\"���MeTG�A��<���uG�Bf��\�Z\�\�2\�E?����\�v���\�>}Z\�\�jȫ�Fj�>��\�\�f��ᕸ\'\�6:��Qw\�K�i	�rG�\'\�ר��\�k�\r\�\�`S\�*�\�\�:�2\�V�Н�u�f	|�\�d8	M\�\Z�\Z�\�\�,��^1��l�M2R\Z��&/�\�j\�&���]�9]J\�\�{X�xO���.�n��}�9ʠ�X<{�=k�6\�z��\��\�o!#�h9<�zz\�\Zz��O�N\��iu@�,�i��	\�\��\�e��jw\�\�\�GaD\�8��g\���\��Kg�\���\�\���xI�G9���\�\�G\�o;\�GAz��\�~~�^bȯb\�\�3\�Ǿ\����\�a�6��jV�Q���5M���Kts�d��$]I\�ۯ\��ҏ\�����U��\�\�\�\�4{�\��%|������\�f\�6\�Y�V]�^����\��\�M&�i����o��\��OE�\�I��\"j�G�BV<H\'\�eH��J���k\��ih	�\�\�\��#�[��\�{	_˛�\�Ǉ᧫�\��h	\�S�\��U�;�GŠ,QV*{����2��R~�Z\�\"�B]�nQw�QD�\�p��\���\�q\�s�w��\�>�\��\�զk\��t�\�\�M\�t�txz�kF&]	O|�@\�E~\0����w�V��a�j\�\�\�\�&�)v�\��\�\�ؗ\�=\��-�\0k\�&\�\�\�������_˯\��x\�\�\�?\��3�<K�+e��Q١\\�a\rA\�r-<{������\����.VC\�\�\�\�\�\�Q�G�O\Z�~�p\�0e��\�\�Fn\�1\�+��1>b��\�hZij7\�h�\���,���rm~�\�\�؃��c<]=\�\�\0�\�TJ\�\��Cv\�P�2��$�yؖ��\�4�it�a�\�	�e/\�A#WP�\�\�a�\�\�\��E�c\�òՇ�!\�x=�jt�?\�O��t�\��K��\n�7\�#���\n��]\��8;\�ְϳ:v���g*\�Z��>�U\�6�w\�Uj}�\� [M������&��C}���\�o\�k\�Q�33D\�FuSP�\\�27#߯#Q�vb�\�~\�F0�DGŉb�3�S��w\�?\�-\�qd\�zT\�7��\�W\�_E\�\�\�a\�e��]?]���\��\�\�2\��xԒj\�\�v\�A}�yT�ۢ\�\�\�k���>�G���-cfc\��ਧ\�\��E��	��\��\�)0\�GS�[fe��\Z�\�a�\�\�1\�Q÷\r/\Z�\�\�\�\�=\�\�_\"�\�7��~Kbf\�&��Q\r\�]ۻh�w+\�P\�!?�l	\��z}%H�\Z޻��\�wP\'.�o\�+��,�\�\r�f\�i��w��!D�\Z6L�v�\�Nb�x���t�\�l��\ZގJ���.4�K \�O�)ꃆ�\�\�\��\'i5*k��O��Rf��l	�:�z�C�(�V~\�8-�\�]Ž\�38c���\��ʥ�\�^X��u����j���������Άuկ]�zU]m͊\�\�U�\�\�e�%\�E�K\�K\n4\�\���ܜlkVfFzZj�%9)1aQ|�\�d4�\ng��\�\�ڣ��z\�j�}Ær1���p\�C�5�Z҄�I�-�t�r��(�1J\�,%�h�T_�Lk�k\��\�\�$۱��-\��n-|F$|X�\n���X���0\�\�Z­��G[z�!n|Q|��\�_��\�\�\\(�e����uL<�e\�8\'s\"�\n\�؛[\�\��faAX)lq��۷v�4\�t�/�&��7L��\�d�$�&�&ll\n��\Z\�+VC7i\�˦Fo��Po�#�\�\�纬+������6���|\�:7��Ԧ�\�\�\�\�*�-V�&���\�kᩭ]�gĵ�2�\�[{F[��f8��C�6~]wW�]��X�XUl}{���|F\�\�\�\��G?Ӄ\�䌆i\���HN��X�4\�h��]��pC��\�՜7�N�\��Od;�\�3\�\�\�-)1ǎ\'%\�@B\�|�3;\'!I.��m��e\�\"�F$DXsk��ˎ5�\�*\Zu�^\�\\\�>D\��k\���x�6Z\�\�\�	`?��B�K\�-$�<�M5\�\��a�#\\V&R\�Ԅ�\�\�ur\\[�l\�$_i�[4tp�÷�\�5�pA��M�N\�\� |hkWl�Qon����\�0\�3S33\�\�̡��Y�;2��|\���f�%[2\�Z�ׄY\�\�L{b�m���;���\�ݷm�F��U�s:Nk\�Rr��\\E\�\")/�%����Z�F�\�}aI)Lk\r[z6Į\��\�3i2\�c���#�d7Ǧ[^\�X8^�`����Q��E��s\�\�h���V�\�\�V�\�:\�3Ꚍ\�k�\�1�0x\�\�\�3\�\�\��rí7wc�l\r��\��q;�a븓\�б�\�Oo7tvE8\�M=\�Ǘb�\�nE�\�g�b���1$z��\�T\�1\'\�!9�J��\'I�y\�\�=\�c8�\�\�U�\�|\�8�M��(g\�F\�$op��A�V(ޤN3\�6\r\�\\y�Qnv�duXޫ?[�\��n����\�\0\��.˫\nR\nR\nqa���@S�>p\Z\�/��SЅ\'2��e!t�(1�\�_�\�Q=	���\�Y2�3�3\r��V\�^�{�\�E[J!#��Z�l1g11\�dtj\"nQ\rL�ٙv��iU� %U#\�Re\�I~ӄ��\�\�i;�m�,;��\�ػ\�4�A\�H;���i\�Y���\�\�\�^�RVT׭\�5EE\�E�;x�S=WM��\�\�\�tM\�\�Ͼ\�J^�\\݆]��\�0\�+zn�\�>q͘��̦>�AmR\�%/<�ؓ�S�ĳ�-\�ߨ��ˤ{�Y�Jٓr�A�3f\�y}JoKy���\'yЙ�.ʤ�����8cZzQFM�RgR�S[Zs$�E3Yf��vf.YZs\�:f\�~\�;V�{+�\�/*�3��dЎ�\�;ff\�\�j��k\�;\��ߌ\�;\�C\�t�\�\"#Uo�\Z\�/���F�}IQQ-������z\�J*�\�<\���O�l۶�\r\�e,��\�~\�.>6m=\�Y�%�:��\�\�\�:\�~�\�\�:*fk�Q)�ٙ\�`0\Z2��	5J��\�Zco\�-\�k�=AS*K;\�zJ�\�W�u\�æ��0>�.=Uz�4�J+K\�1q���Rc�3\'��\�Cr\�`*PM9��pY$\�T <�X5YRR�s��\��-E�)\��=)̗\�R&y�39\'�(?8_\�\�cy�-Dt|!*ɔ\� z\�J\�]\�bg#Z=\�\�\�b皋j*�_*~�XI.�*V�X+�*��\�\�%���Z�8�B����\�۹ׁD{o\�N\��\�\�\�\�\�p�\�KI]Mh˫ذc\�N���V��rEuf\�Jy\�\�@j��K�F	̀�r\�\�Z�,�@I����\�[\��WL���aec���j\�m�vn\�޹\�\�/�\�滾ZQ�ᦻ�9o�gǲ\�k\�>�b�4�U݆\�Lc5GSK,m2z\�iMH�1g&&ט\�\�(.�L\�p�-gM\r��&.J2Z8�\�4�*\n�\�\�z,\�2Ɏ8S%\'V&���Q�ѓ����2��Ոޙ���&#++G]�8�\�5�L�bg�#T?1J\�Ӊ3oe�FU�\�\�\��9ر\�l6��g=��\�\��k�c\��&˻�SÙ��\rҵ,uu��k\�j\0�$�\�\�&㲳-l\�h�Aŏ�:}�X��q\�\�xu\�D9F�\�o�I�)\ri��l\\R�\r�!�>�qLVwZAZZ3%)�%\�\�b\�\�%1\���\�>}cSaӧ�oݜ����\�\�j\�\�$������-I�Eb�[\��;�,�>j`2\�G��Fñ�cV\�b\�c�����&&%Q��.I&s\�9U/Ӗ_�ߓ\�\�?�oȷ$k,\�,Q���ٺ\'�^\�\�ʹڷ\"�@C�\�H7�\�g\�\�r\�׈�w\'�W��\��c�_\���\�?���}M�\�P;f8�Y�\�\�\'�)g�>7\�S\�\�\�ޟ�l�\�s-\�G\�\��A5\Z\nM��\�|\���Y�46s��U�\'�̦\�<�oSp��mQ\�\"�H�������@�z\0s\�ع�b�\�c5XHF�l_RΜ]\��\�\�k8���MT\'+�k\�˨\�\�*+S5��ҭ�\Z\�\�I+\�\�L\�驙)Ii\�dIJcd\�\�q\�\�Elע(e&\�\�R�c�XV�\�x\��������\�\�nV\�%�ʔ])<e��\�Ĥ�\"���\�2�2y&B�d\\BMfv\�Ǹ�\�\�{\�7�\���\�\�\�~��X�XZ.����By\�!mEm�(Y&Q22Vd\�Q\�\�{W\��\"PԴ\�\��\�\�7\�U�ڿpm\�\�\�XVom{�����\"\�n��\�@l\�\�>r�\�P\�q\�q�P\\8n*\�T\�\�\������qc@�	��L\�I��Ĩ\�N\�\"\rF�\Z\�MEL{9�`i��m֏\Z�~ �%\�\�\�\�`Î4�\�\�ng\�\�o�l�I�N�O�E8@\�<;\��r�\n�\�~\�6LN~o0\�=���1 07%\\)b4c	e�\�X�\�^\�k8�\�Vx�gr1Ϊt\�c_;F�\��\�\�E�\��J\�]�Gǟ�;�8�c6��\r�bck��ŏ$>i|2\��\�K�I�+	\��������\�\�ͯ\�p&�\�$g�\�x)C��.yq�쓲\��[�	\�I�\�I=I<ɚ\�Dd\�ְ�\�\�|�F�KJc��<\�[�d\�LNJ��\���+5�7�.J��\\�\�D�2�`KKʩ\\�k�o�}�\�\�\�f\'��9;\�\��Ʀ3r�l:�.��9g�\�Y�\�`u.N\�%ׂK^J�,j\rgeL��HƀH��}d�\�,���0�\�L\�g�.<�N\Z$\�_w�(\�ꓜ�R�P�$\�\'9\�,�BQ����C�v�#Ǯ\�ZhE5)��$M�&c�3��|\�\��\����ϰT\�Y�r�k��b\�K.��gl[\�W\�\�W�\���\�\�|��\rl\�ʃMM�1���\�\�{��q�\�]\��4g�\�C��~\�S�\�j�2�Cmc3��\�Mo���\�>�S�(\�w\��Wt�)��J\�q\�{	\�	ܗ�cd\��v\�0\����8���\�|Rє!\��\rj\��Y]z� \rċ#!*i;\�6[|\��K��\�ݻ4X^\�/G�\��+\�\�,:�R:\�\�aY\�\�t\��6\�w\�7t\�LEܯ\�q4\�\�\�\�x�9E\�\�E\�k��\'\�ns�\'\Z��\�\�$�,�ӳ~;�|\\�\�6\�j\�Z\�\�B\�,\�uX�xː(�r�_�\�&\�\�a3�Y��\�qԒb\�\�x\�J��/�\�i�\�~[�\"\�:��\�HO\�\�$�\��\��\n�\'e}I�U\�\�zP\�\�\�N\�J�Yߗ�xc\�k:�Rj\�6��d�I�����\��\'X\�tX%�\�&\�8_k�#�ٵ:9\�\r:��f_�Ð�}�#�\�:��f��#�ٿ\�a\�7\�aF|s^\�a\�7�S:��j\�:��j�\�a\�W�_:��\�)\�x\�\�\�a��8�\�E���d\�J�KNk)٨ð�d���D\�xtX�����-R\�m:,\�|M\�i\�\�%\�\�0|^�]	�{J~�ð�\�M	g\0�^\�tX%�4C���V�A_\�$\�lI�S��^	\�(�M����H8_\�S:�ð��)	\�$��uXп,\�\"J\�\�a\�@\�%\\&�S��\��OY\�\�rQ	\�JuX��\�\���0\�/��c�\�*۪\��K�	1��:,�\�KXƥ\�~z�N\�O~�\�nr��F��uR��7���Ђ:���\�a�\�\�\�+)4`�_�Y\�]�CI���iԁ�\n\�\��ۈ>�o9�ƻ�\�u�Zb�1�~x����\�\�y�aڇk��1\�\�z��\�;\�̣\�f�\�\�%RJ`\�\�\�Z���*�	X7f}����A*=����1G[>Ϯ\�y�oI\�\n��A\� �a�8�\�\�s\rX�\�MAi�𑆱�	\�R�#\Z�K~����M�n�\�\�\��.\�>�\no�HN!�\�<6\�\�\�^a���?�\�#�KЍH��\�\��\�\�[.�\�^\�\�\�r�_z\�k�\�\�>,g�2S;p\rI�c�e\�*\�R��$(�<\�aآ�ʥ\�b,��\��}2\�D\�\rI]�\�\�\�e��m�sPJv�C����&�vI}n=\Z�au@��K�1Ʒ6�^=\��z=\�7���\�\�Dȥ\��\�4�a�U3��\�)�^6Z��\�=��y;�{ĭgj\�� dz�W�\�c�\�:&$=-2j.�}r\�K�H~a��\�\�5��-��\�Z��Jc�QH��\�nP\ni1\�_��w}�J��>$GsQ\r\�,�֝?\'fjk`v-bnPʛ�!\�\�庵.\��nY�4}�\���O\�\�#�1~�üz�\��\�9\�\�U\�\�}��c檽K\�*����[_�WFm@\��\�ދe\�䌭d~v{g3K\��+�\�JkDn\�\��V�\�\�\�1(Gs\��Љ�\��ܺ�^)!$=ݷ 7=��ϊ\�vϮp�\�mM\��ҷ�w�\�z���=�߃zՈ\��es\�36;(#\�+%\�j!\�-g\�2-��Oz\�/w\��\�U\�\��5S̻�\'�ubż��3\�H�\�\Z�usƶ\ny�1�gj%\�w���_a+du\ZE�\�K�\r\�y\�(@�d\�\"^1K�WÈ̘�g��ͨ��8�[њ�y\��8Zq��ķ\0Ӂ�\�͋q�\�Ib;)OS�u\�l\n�\'״Y|l�\�<\�\�}>��\�)6���<\�^9���Y�\�\�\�\�\��h~��U��:\Zۿ^�f�=�GJ�\�\�D�[�umbw\�\�ki\�\�i\��\�\�\�Α\�\�\�\�w�g6��e�\��y���\��\�\�.�̓2��\�\�ק��\"{ee�YݫGfH�|�\�U-�T�\"��\�j��m���佨Zto�\Z�Q����3Wg���~�1��+V�]\�\"���W�\��kb�\�84��\�\���Oz\�;\��w��l�zx^\�Ν\�\�)aݠ�?�W��Fd�/�ќ:S\�(}��ݡ��ǅ��\��\�욟݃zE��?���z~\�Uޅ9�q+�ˏ�r\�\�Fn\�\�K�9�-��\���[Fu\�C1���\�$\�\�jH\��\�Ρ}�\�h�\�\�]�\�џ�7�\��y�g��\�ŝǘ�\�\�X\�R\��x&b��z�\�d휗\�հ�_h�G��\r\�왑 �O\Z)�$P�{�\Z�\��\�r�\��|U#��ħ#۩M��\�\�r\�\�\�p�\�\�$\�J�ų�hB�\�v\���Oƙ�\�yo�<\�\�\��\�v�=ڣZg�G\�\���Қ|\�~߰+\��\ri�w�\�\�\n���J!L\��\r�&�m\��ի�\�q��\�\Z�m\�=����\��\���5{]\�}}32\�H�&Pk.��\�UUZ\�&�{\��\��Α̧�\�r)�Sh�î>Ϡk�rͷ�c-׆={���g\�ӧy�� H�wh\�V�unҶ\�\�]����4\�@�3\���YIX�oϰ\�߿>ʣ5�F�C{�\�-׶�z!z�\�\�\�p�	\�\�^�ץu�BC}X\\���\�7�\nۆ�k�Gywk}��w\�\�2-�v7�\\^L��=Zh\�5�5w�k\�\�\�20�X�kH\�\�~�~/\�\�\�=nO \��:� \�\���W%\Z�h#\�`�tà\�\�\'���0\�\r�fp�\�P\�\��@hx�&=\�\�\�v!\��a�+8�)�\�!\��L\�\�3,M\�\Z\0(m��A�x��B��\\j ��3\�\"[B�gx\�;$)�}�C���CP`�׵\�\'\�G�\�s�\�3\��G|\�\�>�$�i\�\�\�m\�\�\ry\� w���q\�큒���\�Y�\�\n,f\�3�_\�\�ȝ!c\�; \�\�7R@\�\�G�G�Rқ��!al\�-��\��aɐ�E�\"O��a\�Dj L�L�\'���=�+�C\�	��Ŝ�>o�?\�\�/T\�!\�H�\��\�4���Ġ7 r��o\�\'�U���5��###�z\�V�}������\����ے\���.�Xx�@��#�`=�e�΍��\Z;7n٬mi\�>���esG�\�x񶖖M-�;\�\�;�\�\��	���P� (=z�-&#Y��w��\��n�m�\�G��Dr\�E|���@\�\�3\��L�к�\�\�B\Z�z\�6gp�1\";GD:y8����\�D�wÏsv���x$��,B�\�\�\r!\Zf���\�-�80cy\��\�\"۴}����\�\n C\�sWhۇd\�\�Y֤W.��K�=n/�ι+\�\�\�!�m�\�\�\�\�9���Uy�@K\�\�\��!���^� (�t#�\�\��$��(��\�P\�7\�/�@V\�݃HT؏P��k�\�\�=�P��\�\�\�s�\�ko\��jP�ܞ\�!}úݒ8\�\�\r�a\��zFb\�\�\�:D҃\n\�7W\�f\��dau\�b,\�ҭ\�}~�\�\�Y}\�날\�\\#�w4\�(YUSW�\�-_U^USU��\rȪ\�\�kjp�[Q�խ�]]�:1�#v\�\�nF1�\�͓����&I\�\�\���e\�L�B,�o-��\�sk:�U�\�c���SnP�Q���\�u|�����\r.|mp\�k�_\\�\�\�\�\��6�����\r.|mp\�k�_\\�\�\�\�\��6��k�\�\���Q�,\�f>�>��>�	-�=w�bY5�fp��Ɨ\�{����:,��ᙹ��W\�\�\�%�O\�l��}���g\��\�7$��|rWΧ>\��|O�>҇>զ�SתM\�Ju�\�T/R\�\�\��\�;\�y\�Ot氭\�\'�i#�4�\�\�m��\�\��x��\�/;�d\��,\�͛�\�7���\�+��\�S��~J\�y}�:��P2cd�N)_���W;\'��\'�Ӫ��\�NjG\�V6\�\Z\'�rD\� o��/�>&����j\�o\"\r\��Bc�29v�	��&\�2��k\"\�)�ﳑ��0a�V�7�+WS<\�\�ɦ@��}>�^��B\�\�H�T���7((C6�Qɤj�\�J\�J�P$)�\'))�n�W��$IVQ�l�Y1E�m\�	E�ٰS�a\"n��%��\�:\�D\�:�,[�3J<U���tN\�%VnLP:�\�N�Ŧ�����:��A_��G���\\ɧ��\�\�H�m\�r�$�;!�\�E\�+D7��T=\����+�\�\�Jm�\'�VUSc�RBU��	M9\��\�\�\�(�Q�i�EhFa\�(�1s#h*�+ɯ�\�a��\0����I`iI�1%[�\���6g\".IXf���I2\�DBRu\�3J���q�ȲV�N(er)\�&�����K�\�b�\0c���3J��Xz\"_z \�hØQ�b#\��O	\����E|\�O�\����E��a��N�S\�\�\��,�Ӎy�\r\�\�_��\0q~�?��\�\�\�\'��g�5�\�>�\�Я@<R�=\�$��@\�\�$f�\��\�#�J�\�@V��fV7�\����?E���|���?�ފ~�\�{\�൴�Q��Z\�4�?�3\�\�\'\"Ip\�$�#�\��ب�\��4��r@�\�HQ��L-�%��<\�\��H�-�1�\�Ϻػ \Z�WDO���H�r8�f;\��\�Nk��\�Y\�|H�*�*�zH\�\n�r�N{Hk��[\�\0\�a\��p\��̑=hN�\��ƈZn<�5�uq:�똄zp�K�p�\�ξ#�~mA\�q\0\� \�!��H\��J�Ϣ}\��D���|��\��~\�\��~p�%�_j�	�p�=��=\�\�G�\�����Gr���\�\�h�\�\�hG;8\�%G;8\��\�.9�\�p�\�	�\�p�\�	\'8��\�	\'8���\nU\�G�\�G8��Q%9��Q�*ɡ�C�Mrh\�\����C�\Z84ph�\�8,\�H8,ఀ\�\"9,2>!4�q\Z��q\Z�%\�ip�\�ip����q\Z��ȸr����\�)���,��r\n,��rJ��\�)��җ�\�\�H�h\��	\�)�N�w\n�S�wJ�WM���Ga\�Gap�%Gap�%\�8\��1�1\�1�1p��cLr�\�\�\r�	��=)�\�\��X��+?\�Je�ޖ�zE���q\����g\�j\�_Iu��\"\�C�\�d3���.�1%`\�.4\�}hG\�N��$�\�khQ^\�\\�&���\�31�4��N�x�q��>\�\�I�\��k��<Q\�Q����\���h8Dpm�P��\�\Z\�\�Z�kx�3\���2�R;YƎ��/��\�8~1Se�Ý>�\�˙P�\��\nZ]Q�:T�[�|;\�)Zi�dOǺR��\�h\�h�]�V�V�V�V�f��2\�w9�\�\"�F+F+@ӄ\n\�\�\�\�Mj�\�y�\'��&^H�8���|\'\"\�U\�&#\�[\�=)\�5Ʊ\'�X\��\'�\�\��\�^\��7c\�7\"�\��\�j\�\�W��4R���1�m\'�*X;��\����\��m�\�J\�9\"\�E���\n1[ʺ\�u�:\�Ҙ&{Ķݒ�m��6S�<3R�4π&ze��\�R�s�\�\�v\�\�`�����6��{�p�]⌷=]�U7\�\"��\�øއE��\�\�m�@+|\�v��\�vk��\�[`��RE\�v�6\�w�\�٪l��\�m\�\'l.\�6\�\�B\�#�\�lO3��u�ǟ��C\�F��0b��pR�\�j\�osڊm����iULn]�\�\�TӾ�-+�9��n��8\�L\��.5�7�5\�MKL�M��ts�\�bN2\'�\�\�f�Ѭ���\�\�\�\�\�\�+Ӎ\�\�ɨ��*aW�KS\�̜>A\�4���u�gm\�)7��j\��:\�,~뎰����Sۨ�s}x��m\�\��s��M\�v�3vk7�a~\�$�ήI�\�r\�Q�3�\�\�c\�X�u�tw�5s_��!u]\�\�\�\��\\z��c\�e�\�\�j\�\�\n?�\��@4��-|����c<�\'�4\�I�\�\�:��yr\�6�W�\�\� {]�!��@FŢ�y=i��d� C�btE`]�\�@�HE��(>QҩLЍ���4�k��)$zEҼRH�h�1\�m/*�Tv�u	*\�eפa�R�\��r�$���M\n�1�,\\9GR��\�Β\�J]\n���\�h\�Kfh\�K@\���<\�lby\���◿z\�-���M���\�C��6~ ��$XQO��_�.O8d�4�؛��\�ϟg�y1�\�\�<NϷtv�?\��4G�;��\�]\�\�\r�]�t\�8����<\�ꅰ.����<Ӎb�A\�j�\Z��g�\�\�\�y\�\�5n��\�wAd?�\�#�{r�\�gZ�\�DB[[`=�{\\%�-rt�\�\�Éhb����QLa���$��n����ڂ\�\�\�}\�t�}=͸�Q[�vk[��cG�H��\�u��\�KN[�\�یe\�{>%\��\n�\�\n�\�r\�)�-\\\�\�^���LP\�\�\�\r\\\�NQ$n<.�e2:�I�`A�N@&~#���.3���xTN\�\�W���	~\r\�q|$R)���\�ĒB�������x>}$��Z�AXE_\�)\�\0.?\\7V8V>Vg?�����\�Q\Z�|H��#0\���n��t�\�\�˗�\�\�pt;�7^\�îv\�#�\�:6�K\rH����\���\�&���\�\"\'C�E*�?X\�6\nendstream\nendobj\n\n6 0 obj\n10825\nendobj\n\n7 0 obj\n<</Type/FontDescriptor/FontName/BAAAAA+Arial-BoldMT\n/Flags 4\n/FontBBox[-627 -376 2000 1011]/ItalicAngle 0\n/Ascent 905\n/Descent 211\n/CapHeight 1010\n/StemV 80\n/FontFile2 5 0 R>>\nendobj\n\n8 0 obj\n<</Length 272/Filter/FlateDecode>>\nstream\nx�]�\�n� \�\�<\�\�aZu��1ٺ\�\�C����0Z���\�\�\�&=@~\�\�7�f`usm�r\�\�΢G���e^�\0\�è4IR*�p{���:C�׶\�\�`j�0�%ao>�8�\�\�E\�=\��b%X�Gz��[��1_0�v����\�\�3\�\�U\�F��r\�\�K�\n\�74\�8�V\�,a1�\0\�\�H\�yE\�ۭ\"�\�\\�K�A|v֗&���,�<�ȧ<�=rq\r�\��s\�9\�\��������\�u\�\�\�9�\�\��a�?k�b�֯\0�������\�1�	*<\�;��\�\nendstream\nendobj\n\n9 0 obj\n<</Type/Font/Subtype/TrueType/BaseFont/BAAAAA+Arial-BoldMT\n/FirstChar 0\n/LastChar 11\n/Widths[750 722 610 889 556 277 666 610 333 277 277 556 ]\n/FontDescriptor 7 0 R\n/ToUnicode 8 0 R\n>>\nendobj\n\n10 0 obj\n<<\n/F1 9 0 R\n>>\nendobj\n\n11 0 obj\n<</Font 10 0 R\n/ProcSet[/PDF/Text]>>\nendobj\n\n1 0 obj\n<</Type/Page/Parent 4 0 R/Resources 11 0 R/MediaBox[0 0 595 842]/Group<</S/Transparency/CS/DeviceRGB/I true>>/Contents 2 0 R>>\nendobj\n\n12 0 obj\n<</Count 1/First 13 0 R/Last 13 0 R\n>>\nendobj\n\n13 0 obj\n<</Title<FEFF00440075006D006D00790020005000440046002000660069006C0065>\n/Dest[1 0 R/XYZ 56.7 773.3 0]/Parent 12 0 R>>\nendobj\n\n4 0 obj\n<</Type/Pages\n/Resources 11 0 R\n/MediaBox[ 0 0 595 842 ]\n/Kids[ 1 0 R ]\n/Count 1>>\nendobj\n\n14 0 obj\n<</Type/Catalog/Pages 4 0 R\n/Outlines 12 0 R\n>>\nendobj\n\n15 0 obj\n<</Author<FEFF004500760061006E00670065006C006F007300200056006C006100630068006F006700690061006E006E00690073>\n/Creator<FEFF005700720069007400650072>\n/Producer<FEFF004F00700065006E004F00660066006900630065002E006F0072006700200032002E0031>\n/CreationDate(D:20070223175637+02\'00\')>>\nendobj\n\nxref\n0 16\n0000000000 65535 f \n0000011997 00000 n \n0000000019 00000 n \n0000000224 00000 n \n0000012330 00000 n \n0000000244 00000 n \n0000011154 00000 n \n0000011176 00000 n \n0000011368 00000 n \n0000011709 00000 n \n0000011910 00000 n \n0000011943 00000 n \n0000012140 00000 n \n0000012196 00000 n \n0000012429 00000 n \n0000012494 00000 n \ntrailer\n<</Size 16/Root 14 0 R\n/Info 15 0 R\n/ID [ <F7D77B3D22B9F92829D49FF5D78B8F28>\n<F7D77B3D22B9F92829D49FF5D78B8F28> ]\n>>\nstartxref\n12787\n%%EOF\n',0,'','asaaaaaa',1),(5,'2022-04-20 10:18:08','2022-04-20 10:18:08','PCComponen',_binary '%PDF-1.4\n%äüöß\n2 0 obj\n<</Length 3 0 R/Filter/FlateDecode>>\nstream\nx�=�\�\n1E����v��\�0\�~�\��\0���߷��d�{r\"X\�\r��²�G\n\�\�\r�^\�Y�\�AS!��0X�r�bVhl���8�\�(O�vN�3J\�$o\�z6\�\�Сw\���$ɝj�O�\�Q�\�N�f��˒(\n\nendstream\nendobj\n\n3 0 obj\n134\nendobj\n\n5 0 obj\n<</Length 6 0 R/Filter/FlateDecode/Length1 23164>>\nstream\nx�\�|y|[Օ���=-v�Ȼ�E\�Q�*^\�\�q\��BR7�;\���,+��m)�\�&a+`��ai)L1�\�m#\��\Ze�\�P\�a\�\�N�k����\�t(eZb���\�y#�ig~�>�_�\�w\�=�l��s\�}O�y(��BN��˿$13���������?ܞ��i\"Ӛ\��=�_x�\�\�#�\�#2�t\���\�\�J��.Q�{�W\�#�y4�(�m\�X\�ĥ\�W��r ����\�2��\�x\�U>�\�\�Z\�\�\\�qΠ\�\n�,/ށ�6\�\Z�lT{3\�G�*\���@�T%\�(\�k�a�?yK\�&�O$Y|�1�\�cfc���\�����|�S�lS�ZD�[���6퍾.\�D\�g\�ǚ��\�7觬�i4��LY�>\�f\�i#��\'d\�:KwR:u\�],��R&m��L��nf�D�Eߢ�\�\�\�\�S\�\�\�c��\"���MeTG�A��<���uG�Bf��\�Z\�\�2\�E?����\�v���\�>}Z\�\�jȫ�Fj�>��\�\�f��ᕸ\'\�6:��Qw\�K�i	�rG�\'\�ר��\�k�\r\�\�`S\�*�\�\�:�2\�V�Н�u�f	|�\�d8	M\�\Z�\Z�\�\�,��^1��l�M2R\Z��&/�\�j\�&���]�9]J\�\�{X�xO���.�n��}�9ʠ�X<{�=k�6\�z��\��\�o!#�h9<�zz\�\Zz��O�N\��iu@�,�i��	\�\��\�e��jw\�\�\�GaD\�8��g\���\��Kg�\���\�\���xI�G9���\�\�G\�o;\�GAz��\�~~�^bȯb\�\�3\�Ǿ\����\�a�6��jV�Q���5M���Kts�d��$]I\�ۯ\��ҏ\�����U��\�\�\�\�4{�\��%|������\�f\�6\�Y�V]�^����\��\�M&�i����o��\��OE�\�I��\"j�G�BV<H\'\�eH��J���k\��ih	�\�\�\��#�[��\�{	_˛�\�Ǉ᧫�\��h	\�S�\��U�;�GŠ,QV*{����2��R~�Z\�\"�B]�nQw�QD�\�p��\���\�q\�s�w��\�>�\��\�զk\��t�\�\�M\�t�txz�kF&]	O|�@\�E~\0����w�V��a�j\�\�\�\�&�)v�\��\�\�ؗ\�=\��-�\0k\�&\�\�\�������_˯\��x\�\�\�?\��3�<K�+e��Q١\\�a\rA\�r-<{������\����.VC\�\�\�\�\�\�Q�G�O\Z�~�p\�0e��\�\�Fn\�1\�+��1>b��\�hZij7\�h�\���,���rm~�\�\�؃��c<]=\�\�\0�\�TJ\�\��Cv\�P�2��$�yؖ��\�4�it�a�\�	�e/\�A#WP�\�\�a�\�\�\��E�c\�òՇ�!\�x=�jt�?\�O��t�\��K��\n�7\�#���\n��]\��8;\�ְϳ:v���g*\�Z��>�U\�6�w\�Uj}�\� [M������&��C}���\�o\�k\�Q�33D\�FuSP�\\�27#߯#Q�vb�\�~\�F0�DGŉb�3�S��w\�?\�-\�qd\�zT\�7��\�W\�_E\�\�\�a\�e��]?]���\��\�\�2\��xԒj\�\�v\�A}�yT�ۢ\�\�\�k���>�G���-cfc\��ਧ\�\��E��	��\��\�)0\�GS�[fe��\Z�\�a�\�\�1\�Q÷\r/\Z�\�\�\�\�=\�\�_\"�\�7��~Kbf\�&��Q\r\�]ۻh�w+\�P\�!?�l	\��z}%H�\Z޻��\�wP\'.�o\�+��,�\�\r�f\�i��w��!D�\Z6L�v�\�Nb�x���t�\�l��\ZގJ���.4�K \�O�)ꃆ�\�\�\��\'i5*k��O��Rf��l	�:�z�C�(�V~\�8-�\�]Ž\�38c���\��ʥ�\�^X��u����j���������Άuկ]�zU]m͊\�\�U�\�\�e�%\�E�K\�K\n4\�\���ܜlkVfFzZj�%9)1aQ|�\�d4�\ng��\�\�ڣ��z\�j�}Ær1���p\�C�5�Z҄�I�-�t�r��(�1J\�,%�h�T_�Lk�k\��\�\�$۱��-\��n-|F$|X�\n���X���0\�\�Z­��G[z�!n|Q|��\�_��\�\�\\(�e����uL<�e\�8\'s\"�\n\�؛[\�\��faAX)lq��۷v�4\�t�/�&��7L��\�d�$�&�&ll\n��\Z\�+VC7i\�˦Fo��Po�#�\�\�纬+������6���|\�:7��Ԧ�\�\�\�\�*�-V�&���\�kᩭ]�gĵ�2�\�[{F[��f8��C�6~]wW�]��X�XUl}{���|F\�\�\�\��G?Ӄ\�䌆i\���HN��X�4\�h��]��pC��\�՜7�N�\��Od;�\�3\�\�\�-)1ǎ\'%\�@B\�|�3;\'!I.��m��e\�\"�F$DXsk��ˎ5�\�*\Zu�^\�\\\�>D\��k\���x�6Z\�\�\�	`?��B�K\�-$�<�M5\�\��a�#\\V&R\�Ԅ�\�\�ur\\[�l\�$_i�[4tp�÷�\�5�pA��M�N\�\� |hkWl�Qon����\�0\�3S33\�\�̡��Y�;2��|\���f�%[2\�Z�ׄY\�\�L{b�m���;���\�ݷm�F��U�s:Nk\�Rr��\\E\�\")/�%����Z�F�\�}aI)Lk\r[z6Į\��\�3i2\�c���#�d7Ǧ[^\�X8^�`����Q��E��s\�\�h���V�\�\�V�\�:\�3Ꚍ\�k�\�1�0x\�\�\�3\�\�\��rí7wc�l\r��\��q;�a븓\�б�\�Oo7tvE8\�M=\�Ǘb�\�nE�\�g�b���1$z��\�T\�1\'\�!9�J��\'I�y\�\�=\�c8�\�\�U�\�|\�8�M��(g\�F\�$op��A�V(ޤN3\�6\r\�\\y�Qnv�duXޫ?[�\��n����\�\0\��.˫\nR\nR\nqa���@S�>p\Z\�/��SЅ\'2��e!t�(1�\�_�\�Q=	���\�Y2�3�3\r��V\�^�{�\�E[J!#��Z�l1g11\�dtj\"nQ\rL�ٙv��iU� %U#\�Re\�I~ӄ��\�\�i;�m�,;��\�ػ\�4�A\�H;���i\�Y���\�\�\�^�RVT׭\�5EE\�E�;x�S=WM��\�\�\�tM\�\�Ͼ\�J^�\\݆]��\�0\�+zn�\�>q͘��̦>�AmR\�%/<�ؓ�S�ĳ�-\�ߨ��ˤ{�Y�Jٓr�A�3f\�y}JoKy���\'yЙ�.ʤ�����8cZzQFM�RgR�S[Zs$�E3Yf��vf.YZs\�:f\�~\�;V�{+�\�/*�3��dЎ�\�;ff\�\�j��k\�;\��ߌ\�;\�C\�t�\�\"#Uo�\Z\�/���F�}IQQ-������z\�J*�\�<\���O�l۶�\r\�e,��\�~\�.>6m=\�Y�%�:��\�\�\�:\�~�\�\�:*fk�Q)�ٙ\�`0\Z2��	5J��\�Zco\�-\�k�=AS*K;\�zJ�\�W�u\�æ��0>�.=Uz�4�J+K\�1q���Rc�3\'��\�Cr\�`*PM9��pY$\�T <�X5YRR�s��\��-E�)\��=)̗\�R&y�39\'�(?8_\�\�cy�-Dt|!*ɔ\� z\�J\�]\�bg#Z=\�\�\�b皋j*�_*~�XI.�*V�X+�*��\�\�%���Z�8�B����\�۹ׁD{o\�N\��\�\�\�\�\�p�\�KI]Mh˫ذc\�N���V��rEuf\�Jy\�\�@j��K�F	̀�r\�\�Z�,�@I����\�[\��WL���aec���j\�m�vn\�޹\�\�/�\�滾ZQ�ᦻ�9o�gǲ\�k\�>�b�4�U݆\�Lc5GSK,m2z\�iMH�1g&&ט\�\�(.�L\�p�-gM\r��&.J2Z8�\�4�*\n�\�\�z,\�2Ɏ8S%\'V&���Q�ѓ����2��Ոޙ���&#++G]�8�\�5�L�bg�#T?1J\�Ӊ3oe�FU�\�\�\��9ر\�l6��g=��\�\��k�c\��&˻�SÙ��\rҵ,uu��k\�j\0�$�\�\�&㲳-l\�h�Aŏ�:}�X��q\�\�xu\�D9F�\�o�I�)\ri��l\\R�\r�!�>�qLVwZAZZ3%)�%\�\�b\�\�%1\���\�>}cSaӧ�oݜ����\�\�j\�\�$������-I�Eb�[\��;�,�>j`2\�G��Fñ�cV\�b\�c�����&&%Q��.I&s\�9U/Ӗ_�ߓ\�\�?�oȷ$k,\�,Q���ٺ\'�^\�\�ʹڷ\"�@C�\�H7�\�g\�\�r\�׈�w\'�W��\��c�_\���\�?���}M�\�P;f8�Y�\�\�\'�)g�>7\�S\�\�\�ޟ�l�\�s-\�G\�\��A5\Z\nM��\�|\���Y�46s��U�\'�̦\�<�oSp��mQ\�\"�H�������@�z\0s\�ع�b�\�c5XHF�l_RΜ]\��\�\�k8���MT\'+�k\�˨\�\�*+S5��ҭ�\Z\�\�I+\�\�L\�驙)Ii\�dIJcd\�\�q\�\�Elע(e&\�\�R�c�XV�\�x\��������\�\�nV\�%�ʔ])<e��\�Ĥ�\"���\�2�2y&B�d\\BMfv\�Ǹ�\�\�{\�7�\���\�\�\�~��X�XZ.����By\�!mEm�(Y&Q22Vd\�Q\�\�{W\��\"PԴ\�\��\�\�7\�U�ڿpm\�\�\�XVom{�����\"\�n��\�@l\�\�>r�\�P\�q\�q�P\\8n*\�T\�\�\������qc@�	��L\�I��Ĩ\�N\�\"\rF�\Z\�MEL{9�`i��m֏\Z�~ �%\�\�\�\�`Î4�\�\�ng\�\�o�l�I�N�O�E8@\�<;\��r�\n�\�~\�6LN~o0\�=���1 07%\\)b4c	e�\�X�\�^\�k8�\�Vx�gr1Ϊt\�c_;F�\��\�\�E�\��J\�]�Gǟ�;�8�c6��\r�bck��ŏ$>i|2\��\�K�I�+	\��������\�\�ͯ\�p&�\�$g�\�x)C��.yq�쓲\��[�	\�I�\�I=I<ɚ\�Dd\�ְ�\�\�|�F�KJc��<\�[�d\�LNJ��\���+5�7�.J��\\�\�D�2�`KKʩ\\�k�o�}�\�\�\�f\'��9;\�\��Ʀ3r�l:�.��9g�\�Y�\�`u.N\�%ׂK^J�,j\rgeL��HƀH��}d�\�,���0�\�L\�g�.<�N\Z$\�_w�(\�ꓜ�R�P�$\�\'9\�,�BQ����C�v�#Ǯ\�ZhE5)��$M�&c�3��|\�\��\����ϰT\�Y�r�k��b\�K.��gl[\�W\�\�W�\���\�\�|��\rl\�ʃMM�1���\�\�{��q�\�]\��4g�\�C��~\�S�\�j�2�Cmc3��\�Mo���\�>�S�(\�w\��Wt�)��J\�q\�{	\�	ܗ�cd\��v\�0\����8���\�|Rє!\��\rj\��Y]z� \rċ#!*i;\�6[|\��K��\�ݻ4X^\�/G�\��+\�\�,:�R:\�\�aY\�\�t\��6\�w\�7t\�LEܯ\�q4\�\�\�\�x�9E\�\�E\�k��\'\�ns�\'\Z��\�\�$�,�ӳ~;�|\\�\�6\�j\�Z\�\�B\�,\�uX�xː(�r�_�\�&\�\�a3�Y��\�qԒb\�\�x\�J��/�\�i�\�~[�\"\�:��\�HO\�\�$�\��\��\n�\'e}I�U\�\�zP\�\�\�N\�J�Yߗ�xc\�k:�Rj\�6��d�I�����\��\'X\�tX%�\�&\�8_k�#�ٵ:9\�\r:��f_�Ð�}�#�\�:��f��#�ٿ\�a\�7\�aF|s^\�a\�7�S:��j\�:��j�\�a\�W�_:��\�)\�x\�\�\�a��8�\�E���d\�J�KNk)٨ð�d���D\�xtX�����-R\�m:,\�|M\�i\�\�%\�\�0|^�]	�{J~�ð�\�M	g\0�^\�tX%�4C���V�A_\�$\�lI�S��^	\�(�M����H8_\�S:�ð��)	\�$��uXп,\�\"J\�\�a\�@\�%\\&�S��\��OY\�\�rQ	\�JuX��\�\���0\�/��c�\�*۪\��K�	1��:,�\�KXƥ\�~z�N\�O~�\�nr��F��uR��7���Ђ:���\�a�\�\�\�+)4`�_�Y\�]�CI���iԁ�\n\�\��ۈ>�o9�ƻ�\�u�Zb�1�~x����\�\�y�aڇk��1\�\�z��\�;\�̣\�f�\�\�%RJ`\�\�\�Z���*�	X7f}����A*=����1G[>Ϯ\�y�oI\�\n��A\� �a�8�\�\�s\rX�\�MAi�𑆱�	\�R�#\Z�K~����M�n�\�\�\��.\�>�\no�HN!�\�<6\�\�\�^a���?�\�#�KЍH��\�\��\�\�[.�\�^\�\�\�r�_z\�k�\�\�>,g�2S;p\rI�c�e\�*\�R��$(�<\�aآ�ʥ\�b,��\��}2\�D\�\rI]�\�\�\�e��m�sPJv�C����&�vI}n=\Z�au@��K�1Ʒ6�^=\��z=\�7���\�\�Dȥ\��\�4�a�U3��\�)�^6Z��\�=��y;�{ĭgj\�� dz�W�\�c�\�:&$=-2j.�}r\�K�H~a��\�\�5��-��\�Z��Jc�QH��\�nP\ni1\�_��w}�J��>$GsQ\r\�,�֝?\'fjk`v-bnPʛ�!\�\�庵.\��nY�4}�\���O\�\�#�1~�üz�\��\�9\�\�U\�\�}��c檽K\�*����[_�WFm@\��\�ދe\�䌭d~v{g3K\��+�\�JkDn\�\��V�\�\�\�1(Gs\��Љ�\��ܺ�^)!$=ݷ 7=��ϊ\�vϮp�\�mM\��ҷ�w�\�z���=�߃zՈ\��es\�36;(#\�+%\�j!\�-g\�2-��Oz\�/w\��\�U\�\��5S̻�\'�ubż��3\�H�\�\Z�usƶ\ny�1�gj%\�w���_a+du\ZE�\�K�\r\�y\�(@�d\�\"^1K�WÈ̘�g��ͨ��8�[њ�y\��8Zq��ķ\0Ӂ�\�͋q�\�Ib;)OS�u\�l\n�\'״Y|l�\�<\�\�}>��\�)6���<\�^9���Y�\�\�\�\�\��h~��U��:\Zۿ^�f�=�GJ�\�\�D�[�umbw\�\�ki\�\�i\��\�\�\�Α\�\�\�\�w�g6��e�\��y���\��\�\�.�̓2��\�\�ק��\"{ee�YݫGfH�|�\�U-�T�\"��\�j��m���佨Zto�\Z�Q����3Wg���~�1��+V�]\�\"���W�\��kb�\�84��\�\���Oz\�;\��w��l�zx^\�Ν\�\�)aݠ�?�W��Fd�/�ќ:S\�(}��ݡ��ǅ��\��\�욟݃zE��?���z~\�Uޅ9�q+�ˏ�r\�\�Fn\�\�K�9�-��\���[Fu\�C1���\�$\�\�jH\��\�Ρ}�\�h�\�\�]�\�џ�7�\��y�g��\�ŝǘ�\�\�X\�R\��x&b��z�\�d휗\�հ�_h�G��\r\�왑 �O\Z)�$P�{�\Z�\��\�r�\��|U#��ħ#۩M��\�\�r\�\�\�p�\�\�$\�J�ų�hB�\�v\���Oƙ�\�yo�<\�\�\��\�v�=ڣZg�G\�\���Қ|\�~߰+\��\ri�w�\�\�\n���J!L\��\r�&�m\��ի�\�q��\�\Z�m\�=����\��\���5{]\�}}32\�H�&Pk.��\�UUZ\�&�{\��\��Α̧�\�r)�Sh�î>Ϡk�rͷ�c-׆={���g\�ӧy�� H�wh\�V�unҶ\�\�]����4\�@�3\���YIX�oϰ\�߿>ʣ5�F�C{�\�-׶�z!z�\�\�\�p�	\�\�^�ץu�BC}X\\���\�7�\nۆ�k�Gywk}��w\�\�2-�v7�\\^L��=Zh\�5�5w�k\�\�\�20�X�kH\�\�~�~/\�\�\�=nO \��:� \�\���W%\Z�h#\�`�tà\�\�\'���0\�\r�fp�\�P\�\��@hx�&=\�\�\�v!\��a�+8�)�\�!\��L\�\�3,M\�\Z\0(m��A�x��B��\\j ��3\�\"[B�gx\�;$)�}�C���CP`�׵\�\'\�G�\�s�\�3\��G|\�\�>�$�i\�\�\�m\�\�\ry\� w���q\�큒���\�Y�\�\n,f\�3�_\�\�ȝ!c\�; \�\�7R@\�\�G�G�Rқ��!al\�-��\��aɐ�E�\"O��a\�Dj L�L�\'���=�+�C\�	��Ŝ�>o�?\�\�/T\�!\�H�\��\�4���Ġ7 r��o\�\'�U���5��###�z\�V�}������\����ے\���.�Xx�@��#�`=�e�΍��\Z;7n٬mi\�>���esG�\�x񶖖M-�;\�\�;�\�\��	���P� (=z�-&#Y��w��\��n�m�\�G��Dr\�E|���@\�\�3\��L�к�\�\�B\Z�z\�6gp�1\";GD:y8����\�D�wÏsv���x$��,B�\�\�\r!\Zf���\�-�80cy\��\�\"۴}����\�\n C\�sWhۇd\�\�Y֤W.��K�=n/�ι+\�\�\�!�m�\�\�\�\�9���Uy�@K\�\�\��!���^� (�t#�\�\��$��(��\�P\�7\�/�@V\�݃HT؏P��k�\�\�=�P��\�\�\�s�\�ko\��jP�ܞ\�!}úݒ8\�\�\r�a\��zFb\�\�\�:D҃\n\�7W\�f\��dau\�b,\�ҭ\�}~�\�\�Y}\�날\�\\#�w4\�(YUSW�\�-_U^USU��\rȪ\�\�kjp�[Q�խ�]]�:1�#v\�\�nF1�\�͓����&I\�\�\���e\�L�B,�o-��\�sk:�U�\�c���SnP�Q���\�u|�����\r.|mp\�k�_\\�\�\�\�\��6�����\r.|mp\�k�_\\�\�\�\�\��6��k�\�\���Q�,\�f>�>��>�	-�=w�bY5�fp��Ɨ\�{����:,��ᙹ��W\�\�\�%�O\�l��}���g\��\�7$��|rWΧ>\��|O�>҇>զ�SתM\�Ju�\�T/R\�\�\��\�;\�y\�Ot氭\�\'�i#�4�\�\�m��\�\��x��\�/;�d\��,\�͛�\�7���\�+��\�S��~J\�y}�:��P2cd�N)_���W;\'��\'�Ӫ��\�NjG\�V6\�\Z\'�rD\� o��/�>&����j\�o\"\r\��Bc�29v�	��&\�2��k\"\�)�ﳑ��0a�V�7�+WS<\�\�ɦ@��}>�^��B\�\�H�T���7((C6�Qɤj�\�J\�J�P$)�\'))�n�W��$IVQ�l�Y1E�m\�	E�ٰS�a\"n��%��\�:\�D\�:�,[�3J<U���tN\�%VnLP:�\�N�Ŧ�����:��A_��G���\\ɧ��\�\�H�m\�r�$�;!�\�E\�+D7��T=\����+�\�\�Jm�\'�VUSc�RBU��	M9\��\�\�\�(�Q�i�EhFa\�(�1s#h*�+ɯ�\�a��\0����I`iI�1%[�\���6g\".IXf���I2\�DBRu\�3J���q�ȲV�N(er)\�&�����K�\�b�\0c���3J��Xz\"_z \�hØQ�b#\��O	\����E|\�O�\����E��a��N�S\�\�\��,�Ӎy�\r\�\�_��\0q~�?��\�\�\�\'��g�5�\�>�\�Я@<R�=\�$��@\�\�$f�\��\�#�J�\�@V��fV7�\����?E���|���?�ފ~�\�{\�൴�Q��Z\�4�?�3\�\�\'\"Ip\�$�#�\��ب�\��4��r@�\�HQ��L-�%��<\�\��H�-�1�\�Ϻػ \Z�WDO���H�r8�f;\��\�Nk��\�Y\�|H�*�*�zH\�\n�r�N{Hk��[\�\0\�a\��p\��̑=hN�\��ƈZn<�5�uq:�똄zp�K�p�\�ξ#�~mA\�q\0\� \�!��H\��J�Ϣ}\��D���|��\��~\�\��~p�%�_j�	�p�=��=\�\�G�\�����Gr���\�\�h�\�\�hG;8\�%G;8\��\�.9�\�p�\�	�\�p�\�	\'8��\�	\'8���\nU\�G�\�G8��Q%9��Q�*ɡ�C�Mrh\�\����C�\Z84ph�\�8,\�H8,ఀ\�\"9,2>!4�q\Z��q\Z�%\�ip�\�ip����q\Z��ȸr����\�)���,��r\n,��rJ��\�)��җ�\�\�H�h\��	\�)�N�w\n�S�wJ�WM���Ga\�Gap�%Gap�%\�8\��1�1\�1�1p��cLr�\�\�\r�	��=)�\�\��X��+?\�Je�ޖ�zE���q\����g\�j\�_Iu��\"\�C�\�d3���.�1%`\�.4\�}hG\�N��$�\�khQ^\�\\�&���\�31�4��N�x�q��>\�\�I�\��k��<Q\�Q����\���h8Dpm�P��\�\Z\�\�Z�kx�3\���2�R;YƎ��/��\�8~1Se�Ý>�\�˙P�\��\nZ]Q�:T�[�|;\�)Zi�dOǺR��\�h\�h�]�V�V�V�V�f��2\�w9�\�\"�F+F+@ӄ\n\�\�\�\�Mj�\�y�\'��&^H�8���|\'\"\�U\�&#\�[\�=)\�5Ʊ\'�X\��\'�\�\��\�^\��7c\�7\"�\��\�j\�\�W��4R���1�m\'�*X;��\����\��m�\�J\�9\"\�E���\n1[ʺ\�u�:\�Ҙ&{Ķݒ�m��6S�<3R�4π&ze��\�R�s�\�\�v\�\�`�����6��{�p�]⌷=]�U7\�\"��\�øއE��\�\�m�@+|\�v��\�vk��\�[`��RE\�v�6\�w�\�٪l��\�m\�\'l.\�6\�\�B\�#�\�lO3��u�ǟ��C\�F��0b��pR�\�j\�osڊm����iULn]�\�\�TӾ�-+�9��n��8\�L\��.5�7�5\�MKL�M��ts�\�bN2\'�\�\�f�Ѭ���\�\�\�\�\�\�+Ӎ\�\�ɨ��*aW�KS\�̜>A\�4���u�gm\�)7��j\��:\�,~뎰����Sۨ�s}x��m\�\��s��M\�v�3vk7�a~\�$�ήI�\�r\�Q�3�\�\�c\�X�u�tw�5s_��!u]\�\�\�\��\\z��c\�e�\�\�j\�\�\n?�\��@4��-|����c<�\'�4\�I�\�\�:��yr\�6�W�\�\� {]�!��@FŢ�y=i��d� C�btE`]�\�@�HE��(>QҩLЍ���4�k��)$zEҼRH�h�1\�m/*�Tv�u	*\�eפa�R�\��r�$���M\n�1�,\\9GR��\�Β\�J]\n���\�h\�Kfh\�K@\���<\�lby\���◿z\�-���M���\�C��6~ ��$XQO��_�.O8d�4�؛��\�ϟg�y1�\�\�<NϷtv�?\��4G�;��\�]\�\�\r�]�t\�8����<\�ꅰ.����<Ӎb�A\�j�\Z��g�\�\�\�y\�\�5n��\�wAd?�\�#�{r�\�gZ�\�DB[[`=�{\\%�-rt�\�\�Éhb����QLa���$��n����ڂ\�\�\�}\�t�}=͸�Q[�vk[��cG�H��\�u��\�KN[�\�یe\�{>%\��\n�\�\n�\�r\�)�-\\\�\�^���LP\�\�\�\r\\\�NQ$n<.�e2:�I�`A�N@&~#���.3���xTN\�\�W���	~\r\�q|$R)���\�ĒB�������x>}$��Z�AXE_\�)\�\0.?\\7V8V>Vg?�����\�Q\Z�|H��#0\���n��t�\�\�˗�\�\�pt;�7^\�îv\�#�\�:6�K\rH����\���\�&���\�\"\'C�E*�?X\�6\nendstream\nendobj\n\n6 0 obj\n10825\nendobj\n\n7 0 obj\n<</Type/FontDescriptor/FontName/BAAAAA+Arial-BoldMT\n/Flags 4\n/FontBBox[-627 -376 2000 1011]/ItalicAngle 0\n/Ascent 905\n/Descent 211\n/CapHeight 1010\n/StemV 80\n/FontFile2 5 0 R>>\nendobj\n\n8 0 obj\n<</Length 272/Filter/FlateDecode>>\nstream\nx�]�\�n� \�\�<\�\�aZu��1ٺ\�\�C����0Z���\�\�\�&=@~\�\�7�f`usm�r\�\�΢G���e^�\0\�è4IR*�p{���:C�׶\�\�`j�0�%ao>�8�\�\�E\�=\��b%X�Gz��[��1_0�v����\�\�3\�\�U\�F��r\�\�K�\n\�74\�8�V\�,a1�\0\�\�H\�yE\�ۭ\"�\�\\�K�A|v֗&���,�<�ȧ<�=rq\r�\��s\�9\�\��������\�u\�\�\�9�\�\��a�?k�b�֯\0�������\�1�	*<\�;��\�\nendstream\nendobj\n\n9 0 obj\n<</Type/Font/Subtype/TrueType/BaseFont/BAAAAA+Arial-BoldMT\n/FirstChar 0\n/LastChar 11\n/Widths[750 722 610 889 556 277 666 610 333 277 277 556 ]\n/FontDescriptor 7 0 R\n/ToUnicode 8 0 R\n>>\nendobj\n\n10 0 obj\n<<\n/F1 9 0 R\n>>\nendobj\n\n11 0 obj\n<</Font 10 0 R\n/ProcSet[/PDF/Text]>>\nendobj\n\n1 0 obj\n<</Type/Page/Parent 4 0 R/Resources 11 0 R/MediaBox[0 0 595 842]/Group<</S/Transparency/CS/DeviceRGB/I true>>/Contents 2 0 R>>\nendobj\n\n12 0 obj\n<</Count 1/First 13 0 R/Last 13 0 R\n>>\nendobj\n\n13 0 obj\n<</Title<FEFF00440075006D006D00790020005000440046002000660069006C0065>\n/Dest[1 0 R/XYZ 56.7 773.3 0]/Parent 12 0 R>>\nendobj\n\n4 0 obj\n<</Type/Pages\n/Resources 11 0 R\n/MediaBox[ 0 0 595 842 ]\n/Kids[ 1 0 R ]\n/Count 1>>\nendobj\n\n14 0 obj\n<</Type/Catalog/Pages 4 0 R\n/Outlines 12 0 R\n>>\nendobj\n\n15 0 obj\n<</Author<FEFF004500760061006E00670065006C006F007300200056006C006100630068006F006700690061006E006E00690073>\n/Creator<FEFF005700720069007400650072>\n/Producer<FEFF004F00700065006E004F00660066006900630065002E006F0072006700200032002E0031>\n/CreationDate(D:20070223175637+02\'00\')>>\nendobj\n\nxref\n0 16\n0000000000 65535 f \n0000011997 00000 n \n0000000019 00000 n \n0000000224 00000 n \n0000012330 00000 n \n0000000244 00000 n \n0000011154 00000 n \n0000011176 00000 n \n0000011368 00000 n \n0000011709 00000 n \n0000011910 00000 n \n0000011943 00000 n \n0000012140 00000 n \n0000012196 00000 n \n0000012429 00000 n \n0000012494 00000 n \ntrailer\n<</Size 16/Root 14 0 R\n/Info 15 0 R\n/ID [ <F7D77B3D22B9F92829D49FF5D78B8F28>\n<F7D77B3D22B9F92829D49FF5D78B8F28> ]\n>>\nstartxref\n12787\n%%EOF\n',0,'','admin@pccomponentes.com',1);
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
