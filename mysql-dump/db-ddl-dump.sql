CREATE DATABASE  IF NOT EXISTS `backstage` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `backstage`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: backstage
-- ------------------------------------------------------
-- Server version	8.0.28

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agreements`
--

LOCK TABLES `agreements` WRITE;
/*!40000 ALTER TABLE `agreements` DISABLE KEYS */;
INSERT INTO `agreements` VALUES (1,'2022-05-10 21:41:34','2022-05-10 21:41:34',1,39,40,1),(2,'2022-05-10 21:42:02','2022-05-10 21:42:02',3,30,20,1),(3,'2022-05-10 21:42:15','2022-05-10 21:42:15',6,22,30,1);
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
  `text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `video_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `youtube_second` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_user_id_foreign` (`user_id`),
  CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contracts`
--

LOCK TABLES `contracts` WRITE;
/*!40000 ALTER TABLE `contracts` DISABLE KEYS */;
INSERT INTO `contracts` VALUES (1,'2022-05-10 21:44:31','2022-05-10 21:44:31',1,2,1,2,'2022-05-10','2022-08-10',1);
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
  `real_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `google_access_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_refresh_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creators`
--

LOCK TABLES `creators` WRITE;
/*!40000 ALTER TABLE `creators` DISABLE KEYS */;
INSERT INTO `creators` VALUES (2,'2022-05-10 21:36:21','2022-05-10 21:43:10','Jose Carlos Perez','Creador de contenido y propietario de Backstage.','ya29.A0ARrdaM8IxQWLQtmKOgMCSLpwtsb5pkq9y3bLEL6NH44uUabCTZLHuvM_rrcEXc2pCLBh7auMbyTU05T5pGFTxNnOzRrBaGRtBgcnCx30GkJ_gscEOHiQzvzZqMW88KNMS0LmqtN7So7hkolMp6s90_fnzAF0','1//03BYCMos5mjtUCgYIARAAGAMSNgF-L9IrT9gxH2VtT1dzuOVZ581b2SxEaP3FH0II45wRl1bNp7wntrnsVYhagrest2bglU5Smw'),(4,'2022-05-10 22:14:00','2022-05-10 22:14:00','Invitado','Soy un creador con el perfil vacio.',NULL,NULL);
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
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `real_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `likes` int NOT NULL DEFAULT '0',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `available` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `managers`
--

LOCK TABLES `managers` WRITE;
/*!40000 ALTER TABLE `managers` DISABLE KEYS */;
INSERT INTO `managers` VALUES (1,'2022-05-10 21:41:18','2022-05-10 21:41:18','Profesor DAW',0,'Soy gestor de contenido de la plataforma de Backstage, ademas de profesor de D.A.W.',1);
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
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` datetime NOT NULL,
  `duration` int NOT NULL,
  `is_onair` tinyint(1) NOT NULL DEFAULT '0',
  `user_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `media_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
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
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `type_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `notifications_from_user_foreign` (`from_user`),
  KEY `notifications_to_user_foreign` (`to_user`),
  KEY `notifications_notification_type_foreign` (`notification_type`),
  CONSTRAINT `notifications_from_user_foreign` FOREIGN KEY (`from_user`) REFERENCES `users` (`id`),
  CONSTRAINT `notifications_notification_type_foreign` FOREIGN KEY (`notification_type`) REFERENCES `notification_types` (`id`),
  CONSTRAINT `notifications_to_user_foreign` FOREIGN KEY (`to_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (1,'2022-05-10 21:44:31','2022-05-10 21:44:31',1,2,4,'Jose Carlos Perez Ha comenzado un nuevo contrato hasta 2022-8-10 21:44:31','1',0);
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
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contract` blob NOT NULL,
  `followers` int NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `available` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partners`
--

LOCK TABLES `partners` WRITE;
/*!40000 ALTER TABLE `partners` DISABLE KEYS */;
INSERT INTO `partners` VALUES (1,'2022-03-22 20:15:50','2022-03-22 20:15:50','Test',_binary '/tmp/phpWLqEet',0,'','Test',1),(2,'2022-03-24 17:55:09','2022-03-24 17:55:09','Asus',_binary '/tmp/phpYvR4ky',0,'','support@asus.com',1),(4,'2022-03-24 19:06:10','2022-03-24 19:06:10','aassaa',_binary '%PDF-1.4\n%äüöß\n2 0 obj\n<</Length 3 0 R/Filter/FlateDecode>>\nstream\nx=\˜n1E÷ù»v¶\鴰\辠\ϸ\0³߷­d{r\"X\露°²±G\n\ʙ\˜r^\ߙ­\偓!0Xªr¹bVhlý£¨8񜢏(O²vN3J\褯\Ѻ6\뜦Сw\쾚$ɝj¨Oý\葦\Ύf񁋒(\n\nendstream\nendobj\n\n3 0 obj\n134\nendobj\n\n5 0 obj\n<</Length 6 0 R/Filter/FlateDecode/Length1 23164>>\nstream\nx\�|[Օÿ¹÷=-v¼Ȼ¼E\ϑ¼*^\✘q\˱BR7;\Ԏ¤±,+±m)\ڦa+`ai)L1´\쭣\ˁ\Zeº\̐\ҡ\ڜҎ򫡔ü\ʴ(eZbý¾÷\깣ig~ü>_¤\ܷ\Ͻ÷l÷s\ϽOy(BN÷ ˿$13þ¥º÷µ?ܞµ𩜢Ӛ\ݾ=_x򜟜\ˣ2üt\πþ\ݯ¾\ي��{ýW\ߣy4(ûm\Ș\ُĥ\ӗr ö¯\貮­\ĸ\ƕ>·\발嚜М眜qΠ\뜮ÿ,/ށ±6\䜚��{3\Ƈ*\뼾@𧔖%\ڨ\䫾a?yK\ɦ¢O$Y|À1¼\ŋcfc®¨£\ɜ¿þ¿|SlSZD[��퍾.\愜Ͽg\凚þ\з觬i4ÁþLY��f\˩#©��\ˑ:KwR:u\ҝ,R&m§Lnf÷D÷Eߢ\蜯\聜蓜윪\裘ÿ\"ý½þMeTGA¿<��uG¿Bfº\њ\ڜƲ\Ʌ?Áû°\ᶺ¾\;}Z\Ӝ骈«§Fj>ý\ʜ覵°ᕸ\'\趺ÁQw\ԋi	rG��ї¨º\髴\r\؜䠓\ꆪ \˜麺2\˖þН��	|§\Ҥ8	M\钜Z¢\Z¥\ǜ臬µ^1¼ýl􍲒\ZÀ&/½\Ū\٦þ ]ý9]J\ǜ軘¯xO©ª.nþ}��§X<{=k¨6\ܺöª\轜ѯ!#h9<²zz\霚z¾OÿN\ǣiu@󋬟i¬ÿ	\Ϝ懸\奪Àjw\ڐ\݇aD\丝 g\ۿ¥\ӴKg¹\쓬\ݜƾÀxI¹G9ªü\ʜԇ\᯻\Az\ľ~^bȯb\휬3\̇¾\ľ\桾6ÿjV¯Qÿ¢5MþKts􏤥ú$]I\ᛯ\ф¥ҏ\鏴��U¬\ݜϜ촻\Ǳ%|÷󻸃ü\ʦ\嶜噵V]¯^®¾¨þ\ܰ\Í&iú¦oþ\洏¢OE\܉ü\"jG¯BV<H\'\饈ÿ½J¿ùùk\َöih	°\؝\웜셶#ö[¬\仉_˛¡\Շ᧫ù\�h	\\缕þ;þGŠ,QV*{û°2©R~­Z\Ԝ"µB]®nQw¨QD¦\ڰ±¡\ð\ᱜówõ\ƾ£\߸\ӕ¦k\Ϳt¶\윬¿M\Ӵÿtxz¹kF&]	O|@\ޟE~\0þ¦wVÀa÷j\֜ʜڜئö)v󰫜ٵ\윯ؗ\ٽ\쁶-¬\0k\জ؜¼»¸_˯\緰£x\真\翜ᯰ3°<K±+e¹²Q١\\ªa\rA\倲-<{򘲒򲲦򛜥¢¥.VC\ꕜꜝ\꜃\ꑵGO\Z񾀰\Ұeø\ნÇFn\̱\晫1>bü¥\ɨZij7\ݨú\ӿý,Árm~µ\ܙ؃ùc<]=\ȜΜ0\ϔJ\ƜʝCv\ſP2¸$yؖÁ³\մÁitªaퟝ�	ªe/\Ё#WP\՜Ӕa¿\ড়՜繅��òՇ!\Ïx=jt?\͏°õt\׳Kø½\n±7\أ􆲽\nº]\΂��Ö°ϳ:vþg*\욪>ÀU\Ƕ²w\Еj}ú\㫠[M¿ ·¦¿ª&ªC}¤»\ѯ\Ы\쑺33D\߆uSP\\¨27#߯#Qõvb\ľ\̆0¾DGŉbª3®S¯¤w\远魜ñd\ԺT\ҷ§½\ꗜ՟E\뢜團a\إ􈶝?]󆲜䙌\Ŝ貜촸Ԓj\윪v\ځ}��ۢ\ᜨ½\ѫ¢û£>úG𾙭cfc\ؑਧ\ýEú»	û𜢿\ީ0\݇S��¬\Zû\ጡ\ᰜᱜÑ÷\r/\Z\Üۜלҽ\Ȝ蟜"\㱂7ý~Kbf\ĦQ\r\읅ۻhw+\ϐ\ˡ?öl	\긺}%H¹\Z޻ûù\썷P\'.£o\ӫ³,¬\Ȝrýf\ȩwú!D𜚶Lªvý\뎢«xútª\֔lúý\ZގJ»¡.4³K \돴)ꃆ\ԜΜƑ\'i5*k³򏰷Rf¡õl	û:øz°C(V~\Ÿ-\ޜ]Ž\ʳ8c¢À\ᴊ¥\؞Xu¥¶j§·ÁΆuկ]³zU]m͊\ꜥU\國e¥%\ŅK\틜n4\ۜ⼼ܜlkVfFzZj%9)1aQ|\٤4¨\ng´¬\Ŝޚ£z\ª}Ær1¶»p\̓􄵠Z҄µI¦-¤tr÷(1J\笥³hõT_¾Lk±k\ᗛ\휚$۱µ𭜍ön-|F$|X\nÀ µXûµ0\뜑Z­ûúG[z!n|Q|½\ɓ_¾\Ɯ㗁\\(e÷³¬uL<«e\͸\'s\"\n\瘛[\ٶfaAX)lqõ۷vµ4\疔t/³&·½7Löõ\ᤇ$¡&©&ll\n¤\Z\ͫVC7i\㋦Fo´Po#¡\Ϝާº¬+¬¸º��®|\ݺ7𔦮\뜧\Ϝ檣-V¯&££\׫ᩭ]󧋄µ»2À\ˋ[{F[¡úf8±­C6~]wW]XXUl}{À��\ǜٜלۻG?Ӄ\Фi\۾HN󘴴\崨£]öpC®½\ە7N£\۶Od;µ\셳\國\ƭ)1ǎ\'%\뀂\⼀3;\'!I. ¶m³e\"ûF$DXsk°¤ˎ5­\Ϫ\Zu¯^\݌\\\ᾄ\ěk\ꙵ¬xÁ6Z\윚\蟉`?󶂌K\ǘ-$<M5\̜πa#\\V&R\Ĕ\Ƶr\\[¾l\ߤ_i÷[4tpµ÷®\pAퟵ�\꜅ |hkWl¬Qon\S33\ۜŌ¡Yö;2ù¨|\Ȉfÿ%[2\ӚúׄY\朇L{b󭝶¶­;º´\ўݷmF±ùU³s:Nk\꒲¹񜜅\Μ")/%®°ZF\ԽaI)Lk\r[z6Į\ݱ\ɳi2\ϣ¾#¸d7Ǧ[^\㘸^»`¼ÀºQöªE¼­s\ǜ証¹V \ќі»\ֺ\ڳꚌ\굫û\豾0x\Ԝߜҳ\Мɜ豛rí7wcýl\r\Ӻq;»a븓\ݐ±£\똅Oo7tvE8\㍽\뻇b®\똮E\˧±b¤µ1$z\唜'\ѡ9«J»\'Iy\ǜȽ\ɣ8\Ĝᕎ\۔|\޸õM´þ(g\ӆ\Ӥop¦AV(ޤN3\ʶ\r\Ӝ\yQnv­duXޫ?[¿\ٲný¦³õ\Ԝ0\ز.˫\nR\nR\nqa¸ø@S¦>p\Z\诤©SЅ\'2¸𜥡t®(1\ğ\命	²¬\ՙ2»3û3\r«³V\枟{·\ᮅ[J!#Zl1g11\Ӥtj\"nQ\rL¼ٙv¨iU¼ %U#\͒e\ᖉ~ӄ¶¼\Üꀩ;m,;÷¾\瘻\錴²A\ڈ;÷²i\ՙ©\鸗\Ĝ۞ÀRVT׭\㵵EE\Ņö;xþS=WMö\ל휞tM\Ͼ\̊^ý\\݆]õõ\랰\ϫznú\͟>q͘»­̦>÷AmR\ꥯ<öؓ»Sĳ÷-\џ¨¸¯ˤ{YJٓrA3f\빽JoKy\'yЙ¢.ʤø��cZzQFM²RgR¦S[Zs$E3Yfvf.YZs\غf\徜뻖þ{+³\Ư*3©dЎ\ٻff\ΜΪ¨k\߻\쐫ߌ\Տ;\ރ\۴¦\ޜ"#Uo\Z\Έ/°µF£}IQQ-¢¹¢z\劁*\׼\㽼±O²l۶\r\å,û¾\�~\쮾6m=\홻%��\˜Ϝź\ྷ\˜꺪fkQ)ٙ\ߠ0\Z2	5J¹\ƚco\歜斫³=AS*K;\⺊\ޗúu\ユ0>.=Uzº4J+K\۱q²��©3\'¯¦\ヲ\Ҡ*PM9ùpY$\ޔ <·X5YRRs󲊊\㙙-E©)\Νµ=)̗\&y«39\'·(?8_\뜉cyÀ-Dt|!*ɔ\נz\犜؝\Ңg#Z=\ڜҜ⚢皋j*_*~­XI.¶*V¨X+®*«\Ŝ٥¿ùZ¸8öB¶\ߛ¹ׁD{o\с\眒\뜢\ݰ¦\ጋI]Mh˫ذc\ÁV±rEuf\֊y\̀͜jKF	̀r\ӜԮ»ªZ¸,􀉾��ś\׶WL¿¹¸aecù��ѭvn\ߞ¹\벜毟\�¾ZQ¿ᦻ¦9o½gǲ\֫\ﾻb4½U݆\܌c5GSK,m2z\کMH®1g&&ט\ĜŨ.L\ะ-gM\rª&.J2Z8¥\մ®*\n\ۜӺ,\̲Ɏ8S%\'V&Qѓ¡¼Á2Ոޙ·¸&#++G]­8­\ٵ¦L²bg#T?1J\œ3oeFU¨\ٜ霟9ر\鬶®øg=»¹\ŜӼkc\ﰦ˻¯SÙ\rҵ,uu��j\0¦$\؜莦㲳-l\騋¯Aŏ¨:}X��\Ϝ︵\ㄹF\诜I)\ri´l\\R­\r!>qLVwZAZZ3%)ö%\ŜŢ\˜ԥ1\Ǵû\̾}cSaӧ¶oݜ½¾¶÷\Ӝ٪\ќ٤þø±½-IùEb [\Ԁ;񬸾j`2\Fñ��境\ۣø§¦&&%Q®¥.I&s\湕/Ӗ_ߓ\?oȷ$k,\欑ø򖖾ٺ\'ª^\Ꜫʹڷ\"¥@C񜋈7\ʧ\Ϝ沜㗈ºw\'ûW´\퀣½_\ڼ\￻À}M\ސ;f8Y𜪑\뜧½)gª>7\ݓ\ќۜ؞lú\ֳ-\֓G\ÜΆ³A5\Z\nM¹\ʼ\ҼY­46s³U¬\'̦\㖼oSp򰜭Q\՜"¾H¿øù@ýz\0s\˘¹½b°\ԣ5XHFl_RΜ]\˻\Μޫ8þþ􃯟½MT\'+þk\Ë¨\Μꕪ+S5ҭ²\Z\̜ꉫ\ϜȌ\ᩩ)Ii\ɤIJcd\ᜩq\朤Elע(e&\ޜȒcXV\׸\ؖ½¢Á¼\ŜܮV\̥ʔ])<e©\΄¤´\"¾\Ʋ§2y&B÷d\\BMfv\֕Ǹ\䜒{\뷉\Ӳõ\\̾¬XXZ.««񂹐\šmEm(Y&Q22Vd\ؑ\윖{W\ߝº\"PԴ\ڿþ\眩7\ڿpm\ǜҜom{õ§\"\׮±\߀l\Ĝپr\ⰏP\眱\�P\\8n*\ܜ¶¸¸qc@£	¿L\̉§ퟒ�Ў\ܜ"\rF\Z\ύEL{9®`im֏\Z~ %\ȜМȜ蠁Î4\˜Юg\ٜӯ²lõI¦N𗏨E8@\ؼ;\Ėr\nû\톾\Ȑ6LN~o0\،=1 07%\\)b4c	e«\瘢\랑\ӫ8þ\疸£gr1Ϊt\ʣ_;F\軜Μօ«\J\❖Gǟ;8c6§³\rübcküŏ$>i|2\绱\ߋøIü+	\\ᜌͯ\ɰ&¥\Ԥg\̸)C.yq쓲\г[	\ɉ©\퉽I<ɚ\ʄd\疰©\쉼­FöKJc½£<\֛󤜯LNJ®÷\喘½+57¡.Jµ\\º\Ȅ¬2£`KKʩ\\¼k±o񽋜՜ŜɅf\'¶9;\ߜۘ󆦳rûl:󮊀9gº\ՙ\ޠu.N\ƥׂK^J,j\rgeL HƀHö }d\睬0\㌜̧.<¿N\Z$\蟷 (\𒒐$\Ԝ'9\ᬒBQ£õ¸C𶮥#Ǯ\՚hE5)򾤍&cÿ3³®|\뜈��󲴗ϰT\㙧rµkýb\劋.«¯gl[\嗜⶗\չ»\Ӝϼþ¦\rl\ʃMMù1ø\{ùqÿ\ɝ\ɵ4g\姃üª~\\ުü2ªCmc3\֍o¦¦¹\Ծ􁓂(\÷\鎵Wt)¨J\⫱\绉\݉ܗøcd\Ÿv\Ѱ\׈��ÿ\䓼Rє!\快\rj\ȰY]z \rċ#!*i;\[|\؈»K½\ĝ»4X^\ɗ/G\䂝¡+\ԜŬ:¬R:\뜗aY\ٜ紜؈ø6\ѷ\طt\،Eܯ\ñ4\ʜ\ḵ9E\Ӝᅜԫú¥\'\Юs³\'\Z\Ӝ᤺,ùӳ~;|\\\ᶜ˪\椚\֜鰂\ˬ\뵘¥xː(Ár_«\æ\굜\֡3¥Yþ \ñԒb\МḜ/¢\婏\Ͼ[¶\"\헺¨\숏\֜ᤪ\Ȳ\¦\n¯\'e}IU\ʜɺP\\ܣ³N\갊Yߗ°xc\֫:¬Rj\֛6¸dýI¬¨\̀\'X\ӴX%«\զ\ḑ_k#¾ٵ:9\ٜr:øf_¬Ð}#¾\ٓ:øfÿ£#¾ٿ\ҡ\ķ\硝F|s^\ԡ\ķ÷S:øj\ٺøj\ա\ėû_:ø\ߩ\Ḝ᫜⿜סøª8¶\ƅÀ§d\밊KNk)٨ð¿d«D\旸tX¥¼-R\έ:,\伍\©\祜Ϝ갼^򝉧{J~¦ð§\䍉g\0^\ʴX%­4C¾´VA_\ڤ\ᬉ¿Sý^	\犜(½M¥÷H8_\ؓ:®ð§��ۤý÷uXп,\ᥜ"J\ߜҡ\䀜韥\\&üS¨\ðOY\̜βQ	\ʊuX\͜ҿ³0\쯓ùc\몛ª\Â¿KÀ	1úý:,𜗋Xƥ\쾝z¥N\ڏ~򜐮r½F¢uR¿7Ђ:\飡À\✪\ޫ)4`À_¨Y\❿CI³iԁ\n\҄͜ۈ>¦o9­ƻ\ʵ¨ZbÁ1~xöÀ \䜚y´aڇk¨1\庩£\\׌£\Ѧ©\֜ХRJ`\֜ꕜК·*¿	X7f}÷Á³A*=¯1G[>Ϯ\ιøoI\Ϝn¿õA\Ơúaº8¡\�ﳜrX¼\免Ai𑆱 	\꒷#\ZµK~¤¾M¸n\\ҷ.\Ћ>¤\noHN!­\⼶\Ŝ✬^a´û?\ʣ󋐍H«ö\̜굜ꜙ[.£\죞\ݜ꜍r¦_z\хk\͜ھ,g¼2S;p\rI«ce\ժ\䒓´$(½<\㷡آʥ\碬£¼\ҷ}2\Ä\ΜrI]󜣜e¹¤msPJv÷Cÿ 󾦭vI}n=\Z±au@K®1Ʒ6þ^=\۽z=\ҷ±\՜̈́ȥ\۟\ڴ©a¾U3¾\㑩»^6Z\ӽy;¨{ĭgj\ܺ dz¤W¼\裲\ݺ&$=-2j.§}r\王H~a©\砜ε£Á-ù÷\隽úJcûQH󜂮P\ni1\윟½ºw}úJ¼>$GsQ\r\Ȭ֝?\'fjk`v-bnPʛ!\꜅庵.\ݿnYõ4}\θ¬O\ꜞ#±1~±üzû\徳\빜✃U\율}º·c檽K\ƪ��¿WFm@\Ҹ\型e\㐤­d~v{g3K\켫��JkDn\÷V¬\̜ڱ(Gs\ٛüЉø\кܺ^)!$=ݷ 7=´øϊ\ܶϮp·\̭M\怕ҷwÁ\ٺº°=¶߃zՈ\�es\ճ6;(#\⢫%\̪!\׭g\粭¦½Oz\˯w\ɾ\ٕ\̜螒5S̻¤\'ubżü3\ψ÷\˜\Zusƶ\nyö1·gj%\䊷¤_a+du\ZE¿\܋\r\Ɉy\䨀»d\Ĝ"^1KùWÈ̘­gͨ��[њy\ނ¬8Zqý¤ķ\0Ӂ«\ȍq´\ཉb;)OS¢u\ʬ\n\'״Y|l\ļ\ꜗ}>£\ݩ6<\瞹»��\\ږ\˜繳h~µU¹:\Zۿ^½f��J񜌜ք±[»umbw\ki\i\әü\Ϝ̜Ԏ\ٜꜤ\ѷg6§eý\껹·\糜ל̮󌓲·\Ϝ՗§\"{eeYݫGfH|¾\˕-��"\窞©m¢¹佨Zto��Qº÷·3Wg÷~1ÿ+V½]\Ҝ"¿��\ӹkb®\鹸4¯¶\͜蕕¤Oz\ڻ\w¯¼lzx^\ގ\ݟ\視ݠ?W¾򆤼/ќ:S\稽 ݡ¤ǅüþ\ٵ\Ĭ݃zEù?¶«üz~\̕ޅ9��ˏr\휧Fn\朞K9ý-¶\ؽ[Fu\胱þ¿\礇\䜝jH\޵\ǎ¡}򜞨\期]ý\ב7¬\߿yõg󜝅ǘ·\朮X\ݒ\湻x&b®ùz÷\ߤ휗\ϕ°𼟨G¿\r\⬙ O\Z)ö$P{ø\Zª\ó\벌\ʱ|U#²ħ#۩M§¬\천̜Ԝ谝\Ɯꤜ׊ªųhBú\߶\ֽ÷Oƙ¹\ʏyoö<\윜\﷜춹=ڣZg¿G\ۜ䛲Қ|\þ߰+\赜riþw\֜윮ºþ¢J!L\발r& m\߲ի«\ʱ©®\МZ´m\޽ýÁ¶\͓ퟱ�󴵎{]\뽃}32\׈&Pk.񌇄\蕕UUZ\ɦ¯{\ؗ𜭎Α̧\ز)«Shî>Ϡkørͷûc-׆={¼ g\ؓ§y´ H·wh\�V¤unҶ\윞]¡¹ú4\πÀ3\ҏ²YIX³oϰ\˟¿>ʣ5»F¼C{¯\¶ùz!z³\לݜ	\霃^·ץu¸BC}X\\µªº\ɷ􌜮ۆ÷k¼Gywk}w\Ϝв-¶v7¨\\^Lú=Zh\е󵷿k\؜圆20𺃘kH\Üܾ±~/\ܜ=nO \ú± \䇜ܽW%\Z򨣜ޠ¿tà\Ϝל'¸³0\Ĝr§fpÁ\ϐ\М끵@hx&=\휛\癶!\ށa+8)Á\Ρ\恡L\Ĝѳ,M\؝\Z\0(múAxúB \\j ¸À3\ߓ\"[Bgx\л$)}C¬ö»CP`׵\ǜ'\懺\᳭\߳\Ǉ|\ڞ\ﾏ$i\\έ\Ѓ\ߜry\ݠwùý¸q\ȭ»½\\眮,f\г°_\Üڂȝ!c\л \ݛ\ԷR@\ל熇¯GRқ½!al\ȭü¯\�ɐE\"O°��➄j L¸L¦\'®=®+½C\퉺Ŝö>oÀ?\ܚ/T\ψÀ\ﲜô􁄠7 rÿ°o\М'¥U􇃾5###z\¸}ýÁÁ\ʁ øے\ʁÀ.Xx@þ#`=e󖎍­\Z;7n٬mi\վ¹±©esG\ָ񶖖M-;\㓜㻻\᜖¯	ÀP¬ (=z-&#Y¬¹w¿¶\ߗnm𳜜G±´Dr\ȜE|±ý@\3\챈L¬кÁ\֜Zøz\Ŷgp1\";GD:y8𴰜ǝDwÏsvúöx$񬟂\윭\r!\Zfú°£\歨80cy\֕³\̜"۴}®«\朮 C\泗hۇd\Μ֤W.¤·Kø=n/ι+\ל܅!m\ל՜ל畹¬Uy@K\ߜʜݽ!£¼^± (t#¾\ᜋ±$ù(¾\Ԑ\\Я􀖜̝HT؏Pù÷k±\䜕=´P��Ɯݳ\իo\ȓjP÷ܞ\᡽úݒ8\Мr���Fb\圪\勺D҃\n\зW\⦜׈³dau\碬\播\޽~±\Ҝ䙆}\߫ \Ǖ\\#¶w4\␨YUSWª\խ_U^USU·½\rȪ\國kjp­[Q§խ¬]]»:1þ#v\ݜǮF1ª\ԍû«ý&I\ܜ꜌ÿe\ጐB,·o- \î¦sk:¦Uÿ\УþSnPQ¾£\ĵ|þüü¯\r.|mp\᫃_\\ø\ڜ܂\׆¾6¸𵁅¯\r.|mp\᫃_\\ø\ڜ܂\׆¾6øøk\ٜϏ¼��\Ħ>>­>	- =wöbY5¨fp­��\ӻ ¸:,ᙹ¿򝗜✜\쥒O\ì£}򳎅󋧜ڵ\ӷ$ý|rWΧ>\߼|Où>҇>զ®SתM\ꊵ\ꔯR\ۜԜճ©\ϻ\߹\ޏt氭\笜'i#¶4󜧜氭ú½\霥²x¥\Я;²d\޼,\¿\ҷµ¼\˫ýÿ\˓´~J\繽:¯P2cdN)_°¤W;\'»\'Ӫ\厪G\㔖6\є\Z\'rD\㠯/¯>&ø¤j\诜"\r\퐚Bc¸29v¢	ú&\Ҳøk\"\ɩﳑª0a±V·7¦+WS<\ʐ\ى¦@¿½}>ú^¥B\؜霈¶T¾7((C6¥Qɤj��\劲P$)¦\'))«nW«$IVQlY1Eªm\ډEüٰS¹a\"n°%£ú\府ń\頺ª,[򳊼U¢tN\ĥVnLP:±\̎¸Ŧÿ¬¼:¡A_G»\\ɧ��\∆m\ꄲ»$û;!ú\օ\̫D7T=\՘§¿+·\㷊m\'VUScRBUø	M9\蠸\Ϝ✊( Qi¡EhFa\Ũù1s#h*+ɯ\С´û\0«I`iIõ1%[±\𝃶g\".IXf¤¦I2\넂Ru\óJ¶ qȲVûN(er)\˦¬¹ÁK\벢±\0c¦Á3J²Xz\"_z \ܨØQ²b#\ƿÀO	\ﰗùE|\ŏú\ȾõþE½ÿa¬N񓓜М✜俬úӍyü\r\ۜş¥û\0q~?£\Ɯƿ\Μ'ügü5 \㾴\ǐ¯@<R𽜛$@\ۜf\Ų\磎J°\ꀖ®¤fV7򜧸³?E¿ý³| ?ފ~\黜蟠µ´ýQ½ÿZ\䴿?3\ӜƜ'\"Ip\Ĥº#£\辕¡ب½\Ҷ4ÿr@ú\͈Q°L-µ%<\Ɵ\䁈¾-µ1\ߏºػ \Z£WDO©üHr8򴦻\Ə󜃎k³\Й\©*¬*¯zH\ќnµr­N{Hk´𛜉\0\硜òp\Ź̑=hN´\üƈZn<5uq:똄zpõKpµ\̎¾#¡~mA\㐱\0\�ڡ´«H\ŵJ´Ϣ}\�D¡ |øÁ\ᇇ~\ɜᇇ~pø%_j¡	p􀣇=£=\ܨG\䐶ö£Gr´£\휠h\휠hG;8\ڥG;8\ځ\Ѯ9\ం\É§\䰂\É\'8\É\'8£\nU\ਂG\䨂G8ªÀQ%9ªÀQ*ɡCMrh\ܐÀ¡C\Z84ph\Â8,\ఈ8,ఀ\Ü"9,2>!4Áq\Z§Áq\Z§%\ǩp\ǩp§Áq\Z§ùȸrª񅰜\˩°,§Àr\n,§ÀrJ²\˩°җ\Μțh\ю¡	\ީퟸ�\n¼SwJ¦WMퟘ�Ga\ɑGap%Gap%\ǘ8\ƀ11\ɱ1pcLr\ɜĜr¡	¿=)ÿ\朐𫘗+?\ĊeޖýzEö§q\ٿýg\骜ٟIu²¡\"\ك\샤3³­.¹1%`\ڮ4\ڽhG\Ў¢$��khQ^\뜜¢&¶\14Nx²q񾜣\㉣\ሱ´k¹<Q\֑ú¢¼\ĵ÷h8DpmP¯\ޜZ\Ԝٚ¼kx3\匶û2öR;YƎ±/±\Ƹ~1Se¥Ý>\ᬋP´\ζ\nZ]Q񺔦[|;\˖)ZidOǺR§ý\ۨ\㨏¡]VVVVf¸2\з9\蜢F+F+@ӄ\n\ʜ̜Ĝݍj\ٹ\'²&^H¤8¡§¸|\'\"\ŕ\覣\ś\н)\Ʊ\'©X\܆±\'¹\ǜџ\؞\Ǵ7c\ݷ\"¶\螉\ت\М팔W »4Rü¢­1m\'*X;õ¾\떽¶\풐m\؊\ѹ\"\Ņº\n1[ʺ\赴:\ג&{Ķݒmµ 6S±<3R¹4π&zeýþ\뒙s\팜�ۜ۠ÿ��©¢{©p]⌷=]þU7\ڜ"񂞜烸އEÿ\�m÷@+|\Ҷ·­\¶kù¤\蛠÷RE\Ķµ6\ɟw¦\َ٪lÁ򜗭\ۜ'l.\۶\ۜ΂\ࣶ\ˬO3©u񇟴µC\Ƭ¢0b»¸pR\ت\ۯsڊm«µ§iULn]ù\ӜTӾþ-+9¾½n¥8\ˌ\.5­7­5\ٍKLMù¦tsª\٢N2\'\㜍f³Ѭ¹\̜霢\睜\✏+Ӎ\⯜׉¨«*aWûKS\Ό>A\ᴥ·u¬gm\᩷µõj\᷺\쓬~뎰Á¾Sۨ­s}x£m\Ҕ\ݖ®s´M\헶3vk7°a~\ä£ήI¨\벜ŏQ3º\ܣ\Ęöu·tw5s_µ!u]\ʜ꜖\泜\z��\懜煮뜨\n?\ߝ®@4¿»-|øªc<\'¶4\㉢\뜮:¦úyr\˶Wý\͜ݠ{]!@FŢy=iõd½ CbtE`]\耗HE®(>QҩLЍ¿¢µ4k¤)$zEҼRH󨐱\୞/*Tvu	*\֥פa¥R\͆r$ÁM\n²1©,\\9GR¨\Ԏ\Ԋ]\n£±\Ũ\ҋfh\ҋ@\㸟¾<\띬by\耳◿z\쭞´ퟷ�­\ჽ6~ ¤ÿ$XQO¯»_��d÷4؛µ񜥏gúy1½\ܜ޼NϷtv?\ﴴG;·\؝\͜ݓ\rõ]t\ݸ«««þ<\ª°.¡«¡񼓍bºA\誔º\Z®g\Ԝ՜╹\ߜ޵n¦õ\ⷁd?Á\ţ{rº\קZü\넂[[`={\\%ö-rt\윫Éhbª¼±¼QLa©$񳮺õÀڂ\ܜ㜬}\ʂt}=͸Q[¸vk[¸ cGH°\ӵþ\ċN[©\śe\û>%\λ\n\n\⒲\੹-\\\֜і^¹LP\՜Ӝܜr\\\ŌNQ$n<.®e2:I`A¡N@&~#À§.3¸xTN\䜤WûÁ	~\r\ϱ|$R)ù\ȄB񼒜¨¬õx>}$§ ZüAXE_\띩\地.?\\7V8V>Vg?´𐐶\đ\Z©|H¡ #0\㈀Ánýt��\ɋ\Ǆ\ఴ;򷞜胮v\迣§\Ϻ6 K\rH񁙀\İ\Ǧ¡¦\Μ"\'CE*ü?X\۶\nendstream\nendobj\n\n6 0 obj\n10825\nendobj\n\n7 0 obj\n<</Type/FontDescriptor/FontName/BAAAAA+Arial-BoldMT\n/Flags 4\n/FontBBox[-627 -376 2000 1011]/ItalicAngle 0\n/Ascent 905\n/Descent 211\n/CapHeight 1010\n/StemV 80\n/FontFile2 5 0 R>>\nendobj\n\n8 0 obj\n<</Length 272/Filter/FlateDecode>>\nstream\nx]\Ϯ \Ɯ％\ǜ�Zu»1ٺ\ٜăÿ¤¶ 0Z񜠜ۗ\ۦ=@~\Ü̷ùf`usm´r\윕΢G¥¥e^­\0\ڃ¨4IR*p{·:C׶\ۜ⠪��ao>·8»\ќÅ\ν\ܑöb%X¥Gzø¨[·«1_0vª¢\ߜ穳\Ϝ݄U\ǆú´r\ۜыþ\n\޷4\ŸV\Ĭa1\0\ۜ鑈\ɹE\˛­\" \応\²KúA|v֗&¾󬫼§ȧ<𽲱\r\ŷs\ܹ\偋\䜹û¢ùµ\ȵ\܇\ȹ\ܜ݄»a?k bµ֯\0³©\߿1³	*<\߻\휮endstream\nendobj\n\n9 0 obj\n<</Type/Font/Subtype/TrueType/BaseFont/BAAAAA+Arial-BoldMT\n/FirstChar 0\n/LastChar 11\n/Widths[750 722 610 889 556 277 666 610 333 277 277 556 ]\n/FontDescriptor 7 0 R\n/ToUnicode 8 0 R\n>>\nendobj\n\n10 0 obj\n<<\n/F1 9 0 R\n>>\nendobj\n\n11 0 obj\n<</Font 10 0 R\n/ProcSet[/PDF/Text]>>\nendobj\n\n1 0 obj\n<</Type/Page/Parent 4 0 R/Resources 11 0 R/MediaBox[0 0 595 842]/Group<</S/Transparency/CS/DeviceRGB/I true>>/Contents 2 0 R>>\nendobj\n\n12 0 obj\n<</Count 1/First 13 0 R/Last 13 0 R\n>>\nendobj\n\n13 0 obj\n<</Title<FEFF00440075006D006D00790020005000440046002000660069006C0065>\n/Dest[1 0 R/XYZ 56.7 773.3 0]/Parent 12 0 R>>\nendobj\n\n4 0 obj\n<</Type/Pages\n/Resources 11 0 R\n/MediaBox[ 0 0 595 842 ]\n/Kids[ 1 0 R ]\n/Count 1>>\nendobj\n\n14 0 obj\n<</Type/Catalog/Pages 4 0 R\n/Outlines 12 0 R\n>>\nendobj\n\n15 0 obj\n<</Author<FEFF004500760061006E00670065006C006F007300200056006C006100630068006F006700690061006E006E00690073>\n/Creator<FEFF005700720069007400650072>\n/Producer<FEFF004F00700065006E004F00660066006900630065002E006F0072006700200032002E0031>\n/CreationDate(D:20070223175637+02\'00\')>>\nendobj\n\nxref\n0 16\n0000000000 65535 f \n0000011997 00000 n \n0000000019 00000 n \n0000000224 00000 n \n0000012330 00000 n \n0000000244 00000 n \n0000011154 00000 n \n0000011176 00000 n \n0000011368 00000 n \n0000011709 00000 n \n0000011910 00000 n \n0000011943 00000 n \n0000012140 00000 n \n0000012196 00000 n \n0000012429 00000 n \n0000012494 00000 n \ntrailer\n<</Size 16/Root 14 0 R\n/Info 15 0 R\n/ID [ <F7D77B3D22B9F92829D49FF5D78B8F28>\n<F7D77B3D22B9F92829D49FF5D78B8F28> ]\n>>\nstartxref\n12787\n%%EOF\n',0,'','asaaaaaa',1),(5,'2022-04-20 10:18:08','2022-04-20 10:18:08','PCComponen',_binary '%PDF-1.4\n%äüöß\n2 0 obj\n<</Length 3 0 R/Filter/FlateDecode>>\nstream\nx=\˜n1E÷ù»v¶\鴰\辠\ϸ\0³߷­d{r\"X\露°²±G\n\ʙ\˜r^\ߙ­\偓!0Xªr¹bVhlý£¨8񜢏(O²vN3J\褯\Ѻ6\뜦Сw\쾚$ɝj¨Oý\葦\Ύf񁋒(\n\nendstream\nendobj\n\n3 0 obj\n134\nendobj\n\n5 0 obj\n<</Length 6 0 R/Filter/FlateDecode/Length1 23164>>\nstream\nx\�|[Օÿ¹÷=-v¼Ȼ¼E\ϑ¼*^\✘q\˱BR7;\Ԏ¤±,+±m)\ڦa+`ai)L1´\쭣\ˁ\Zeº\̐\ҡ\ڜҎ򫡔ü\ʴ(eZbý¾÷\깣ig~ü>_¤\ܷ\Ͻ÷l÷s\ϽOy(BN÷ ˿$13þ¥º÷µ?ܞµ𩜢Ӛ\ݾ=_x򜟜\ˣ2üt\πþ\ݯ¾\ي��{ýW\ߣy4(ûm\Ș\ُĥ\ӗr ö¯\貮­\ĸ\ƕ>·\발嚜М眜qΠ\뜮ÿ,/ށ±6\䜚��{3\Ƈ*\뼾@𧔖%\ڨ\䫾a?yK\ɦ¢O$Y|À1¼\ŋcfc®¨£\ɜ¿þ¿|SlSZD[��퍾.\愜Ͽg\凚þ\з觬i4ÁþLY��f\˩#©��\ˑ:KwR:u\ҝ,R&m§Lnf÷D÷Eߢ\蜯\聜蓜윪\裘ÿ\"ý½þMeTGA¿<��uG¿Bfº\њ\ڜƲ\Ʌ?Áû°\ᶺ¾\;}Z\Ӝ骈«§Fj>ý\ʜ覵°ᕸ\'\趺ÁQw\ԋi	rG��ї¨º\髴\r\؜䠓\ꆪ \˜麺2\˖þН��	|§\Ҥ8	M\钜Z¢\Z¥\ǜ臬µ^1¼ýl􍲒\ZÀ&/½\Ū\٦þ ]ý9]J\ǜ軘¯xO©ª.nþ}��§X<{=k¨6\ܺöª\轜ѯ!#h9<²zz\霚z¾OÿN\ǣiu@󋬟i¬ÿ	\Ϝ懸\奪Àjw\ڐ\݇aD\丝 g\ۿ¥\ӴKg¹\쓬\ݜƾÀxI¹G9ªü\ʜԇ\᯻\Az\ľ~^bȯb\휬3\̇¾\ľ\桾6ÿjV¯Qÿ¢5MþKts􏤥ú$]I\ᛯ\ф¥ҏ\鏴��U¬\ݜϜ촻\Ǳ%|÷󻸃ü\ʦ\嶜噵V]¯^®¾¨þ\ܰ\Í&iú¦oþ\洏¢OE\܉ü\"jG¯BV<H\'\饈ÿ½J¿ùùk\َöih	°\؝\웜셶#ö[¬\仉_˛¡\Շ᧫ù\�h	\\缕þ;þGŠ,QV*{û°2©R~­Z\Ԝ"µB]®nQw¨QD¦\ڰ±¡\ð\ᱜówõ\ƾ£\߸\ӕ¦k\Ϳt¶\윬¿M\Ӵÿtxz¹kF&]	O|@\ޟE~\0þ¦wVÀa÷j\֜ʜڜئö)v󰫜ٵ\윯ؗ\ٽ\쁶-¬\0k\জ؜¼»¸_˯\緰£x\真\翜ᯰ3°<K±+e¹²Q١\\ªa\rA\倲-<{򘲒򲲦򛜥¢¥.VC\ꕜꜝ\꜃\ꑵGO\Z񾀰\Ұeø\ნÇFn\̱\晫1>bü¥\ɨZij7\ݨú\ӿý,Árm~µ\ܙ؃ùc<]=\ȜΜ0\ϔJ\ƜʝCv\ſP2¸$yؖÁ³\մÁitªaퟝ�	ªe/\Ё#WP\՜Ӕa¿\ড়՜繅��òՇ!\Ïx=jt?\͏°õt\׳Kø½\n±7\أ􆲽\nº]\΂��Ö°ϳ:vþg*\욪>ÀU\Ƕ²w\Еj}ú\㫠[M¿ ·¦¿ª&ªC}¤»\ѯ\Ы\쑺33D\߆uSP\\¨27#߯#Qõvb\ľ\̆0¾DGŉbª3®S¯¤w\远魜ñd\ԺT\ҷ§½\ꗜ՟E\뢜團a\إ􈶝?]󆲜䙌\Ŝ貜촸Ԓj\윪v\ځ}��ۢ\ᜨ½\ѫ¢û£>úG𾙭cfc\ؑਧ\ýEú»	û𜢿\ީ0\݇S��¬\Zû\ጡ\ᰜᱜÑ÷\r/\Z\Üۜלҽ\Ȝ蟜"\㱂7ý~Kbf\ĦQ\r\읅ۻhw+\ϐ\ˡ?öl	\긺}%H¹\Z޻ûù\썷P\'.£o\ӫ³,¬\Ȝrýf\ȩwú!D𜚶Lªvý\뎢«xútª\֔lúý\ZގJ»¡.4³K \돴)ꃆ\ԜΜƑ\'i5*k³򏰷Rf¡õl	û:øz°C(V~\Ÿ-\ޜ]Ž\ʳ8c¢À\ᴊ¥\؞Xu¥¶j§·ÁΆuկ]³zU]m͊\ꜥU\國e¥%\ŅK\틜n4\ۜ⼼ܜlkVfFzZj%9)1aQ|\٤4¨\ng´¬\Ŝޚ£z\ª}Ær1¶»p\̓􄵠Z҄µI¦-¤tr÷(1J\笥³hõT_¾Lk±k\ᗛ\휚$۱µ𭜍ön-|F$|X\nÀ µXûµ0\뜑Z­ûúG[z!n|Q|½\ɓ_¾\Ɯ㗁\\(e÷³¬uL<«e\͸\'s\"\n\瘛[\ٶfaAX)lqõ۷vµ4\疔t/³&·½7Löõ\ᤇ$¡&©&ll\n¤\Z\ͫVC7i\㋦Fo´Po#¡\Ϝާº¬+¬¸º��®|\ݺ7𔦮\뜧\Ϝ檣-V¯&££\׫ᩭ]󧋄µ»2À\ˋ[{F[¡úf8±­C6~]wW]XXUl}{À��\ǜٜלۻG?Ӄ\Фi\۾HN󘴴\崨£]öpC®½\ە7N£\۶Od;µ\셳\國\ƭ)1ǎ\'%\뀂\⼀3;\'!I. ¶m³e\"ûF$DXsk°¤ˎ5­\Ϫ\Zu¯^\݌\\\ᾄ\ěk\ꙵ¬xÁ6Z\윚\蟉`?󶂌K\ǘ-$<M5\̜πa#\\V&R\Ĕ\Ƶr\\[¾l\ߤ_i÷[4tpµ÷®\pAퟵ�\꜅ |hkWl¬Qon\S33\ۜŌ¡Yö;2ù¨|\Ȉfÿ%[2\ӚúׄY\朇L{b󭝶¶­;º´\ўݷmF±ùU³s:Nk\꒲¹񜜅\Μ")/%®°ZF\ԽaI)Lk\r[z6Į\ݱ\ɳi2\ϣ¾#¸d7Ǧ[^\㘸^»`¼ÀºQöªE¼­s\ǜ証¹V \ќі»\ֺ\ڳꚌ\굫û\豾0x\Ԝߜҳ\Мɜ豛rí7wcýl\r\Ӻq;»a븓\ݐ±£\똅Oo7tvE8\㍽\뻇b®\똮E\˧±b¤µ1$z\唜'\ѡ9«J»\'Iy\ǜȽ\ɣ8\Ĝᕎ\۔|\޸õM´þ(g\ӆ\Ӥop¦AV(ޤN3\ʶ\r\Ӝ\yQnv­duXޫ?[¿\ٲný¦³õ\Ԝ0\ز.˫\nR\nR\nqa¸ø@S¦>p\Z\诤©SЅ\'2¸𜥡t®(1\ğ\命	²¬\ՙ2»3û3\r«³V\枟{·\ᮅ[J!#Zl1g11\Ӥtj\"nQ\rL¼ٙv¨iU¼ %U#\͒e\ᖉ~ӄ¶¼\Üꀩ;m,;÷¾\瘻\錴²A\ڈ;÷²i\ՙ©\鸗\Ĝ۞ÀRVT׭\㵵EE\Ņö;xþS=WMö\ל휞tM\Ͼ\̊^ý\\݆]õõ\랰\ϫznú\͟>q͘»­̦>÷AmR\ꥯ<öؓ»Sĳ÷-\џ¨¸¯ˤ{YJٓrA3f\빽JoKy\'yЙ¢.ʤø��cZzQFM²RgR¦S[Zs$E3Yfvf.YZs\غf\徜뻖þ{+³\Ư*3©dЎ\ٻff\ΜΪ¨k\߻\쐫ߌ\Տ;\ރ\۴¦\ޜ"#Uo\Z\Έ/°µF£}IQQ-¢¹¢z\劁*\׼\㽼±O²l۶\r\å,û¾\�~\쮾6m=\홻%��\˜Ϝź\ྷ\˜꺪fkQ)ٙ\ߠ0\Z2	5J¹\ƚco\歜斫³=AS*K;\⺊\ޗúu\ユ0>.=Uzº4J+K\۱q²��©3\'¯¦\ヲ\Ҡ*PM9ùpY$\ޔ <·X5YRRs󲊊\㙙-E©)\Νµ=)̗\&y«39\'·(?8_\뜉cyÀ-Dt|!*ɔ\נz\犜؝\Ңg#Z=\ڜҜ⚢皋j*_*~­XI.¶*V¨X+®*«\Ŝ٥¿ùZ¸8öB¶\ߛ¹ׁD{o\с\眒\뜢\ݰ¦\ጋI]Mh˫ذc\ÁV±rEuf\֊y\̀͜jKF	̀r\ӜԮ»ªZ¸,􀉾��ś\׶WL¿¹¸aecù��ѭvn\ߞ¹\벜毟\�¾ZQ¿ᦻ¦9o½gǲ\֫\ﾻb4½U݆\܌c5GSK,m2z\کMH®1g&&ט\ĜŨ.L\ะ-gM\rª&.J2Z8¥\մ®*\n\ۜӺ,\̲Ɏ8S%\'V&Qѓ¡¼Á2Ոޙ·¸&#++G]­8­\ٵ¦L²bg#T?1J\œ3oeFU¨\ٜ霟9ر\鬶®øg=»¹\ŜӼkc\ﰦ˻¯SÙ\rҵ,uu��j\0¦$\؜莦㲳-l\騋¯Aŏ¨:}X��\Ϝ︵\ㄹF\诜I)\ri´l\\R­\r!>qLVwZAZZ3%)ö%\ŜŢ\˜ԥ1\Ǵû\̾}cSaӧ¶oݜ½¾¶÷\Ӝ٪\ќ٤þø±½-IùEb [\Ԁ;񬸾j`2\Fñ��境\ۣø§¦&&%Q®¥.I&s\湕/Ӗ_ߓ\?oȷ$k,\欑ø򖖾ٺ\'ª^\Ꜫʹڷ\"¥@C񜋈7\ʧ\Ϝ沜㗈ºw\'ûW´\퀣½_\ڼ\￻À}M\ސ;f8Y𜪑\뜧½)gª>7\ݓ\ќۜ؞lú\ֳ-\֓G\ÜΆ³A5\Z\nM¹\ʼ\ҼY­46s³U¬\'̦\㖼oSp򰜭Q\՜"¾H¿øù@ýz\0s\˘¹½b°\ԣ5XHFl_RΜ]\˻\Μޫ8þþ􃯟½MT\'+þk\Ë¨\Μꕪ+S5ҭ²\Z\̜ꉫ\ϜȌ\ᩩ)Ii\ɤIJcd\ᜩq\朤Elע(e&\ޜȒcXV\׸\ؖ½¢Á¼\ŜܮV\̥ʔ])<e©\΄¤´\"¾\Ʋ§2y&B÷d\\BMfv\֕Ǹ\䜒{\뷉\Ӳõ\\̾¬XXZ.««񂹐\šmEm(Y&Q22Vd\ؑ\윖{W\ߝº\"PԴ\ڿþ\眩7\ڿpm\ǜҜom{õ§\"\׮±\߀l\Ĝپr\ⰏP\眱\�P\\8n*\ܜ¶¸¸qc@£	¿L\̉§ퟒ�Ў\ܜ"\rF\Z\ύEL{9®`im֏\Z~ %\ȜМȜ蠁Î4\˜Юg\ٜӯ²lõI¦N𗏨E8@\ؼ;\Ėr\nû\톾\Ȑ6LN~o0\،=1 07%\\)b4c	e«\瘢\랑\ӫ8þ\疸£gr1Ϊt\ʣ_;F\軜Μօ«\J\❖Gǟ;8c6§³\rübcküŏ$>i|2\绱\ߋøIü+	\\ᜌͯ\ɰ&¥\Ԥg\̸)C.yq쓲\г[	\ɉ©\퉽I<ɚ\ʄd\疰©\쉼­FöKJc½£<\֛󤜯LNJ®÷\喘½+57¡.Jµ\\º\Ȅ¬2£`KKʩ\\¼k±o񽋜՜ŜɅf\'¶9;\ߜۘ󆦳rûl:󮊀9gº\ՙ\ޠu.N\ƥׂK^J,j\rgeL HƀHö }d\睬0\㌜̧.<¿N\Z$\蟷 (\𒒐$\Ԝ'9\ᬒBQ£õ¸C𶮥#Ǯ\՚hE5)򾤍&cÿ3³®|\뜈��󲴗ϰT\㙧rµkýb\劋.«¯gl[\嗜⶗\չ»\Ӝϼþ¦\rl\ʃMMù1ø\{ùqÿ\ɝ\ɵ4g\姃üª~\\ުü2ªCmc3\֍o¦¦¹\Ծ􁓂(\÷\鎵Wt)¨J\⫱\绉\݉ܗøcd\Ÿv\Ѱ\׈��ÿ\䓼Rє!\快\rj\ȰY]z \rċ#!*i;\[|\؈»K½\ĝ»4X^\ɗ/G\䂝¡+\ԜŬ:¬R:\뜗aY\ٜ紜؈ø6\ѷ\طt\،Eܯ\ñ4\ʜ\ḵ9E\Ӝᅜԫú¥\'\Юs³\'\Z\Ӝ᤺,ùӳ~;|\\\ᶜ˪\椚\֜鰂\ˬ\뵘¥xː(Ár_«\æ\굜\֡3¥Yþ \ñԒb\МḜ/¢\婏\Ͼ[¶\"\헺¨\숏\֜ᤪ\Ȳ\¦\n¯\'e}IU\ʜɺP\\ܣ³N\갊Yߗ°xc\֫:¬Rj\֛6¸dýI¬¨\̀\'X\ӴX%«\զ\ḑ_k#¾ٵ:9\ٜr:øf_¬Ð}#¾\ٓ:øfÿ£#¾ٿ\ҡ\ķ\硝F|s^\ԡ\ķ÷S:øj\ٺøj\ա\ėû_:ø\ߩ\Ḝ᫜⿜סøª8¶\ƅÀ§d\밊KNk)٨ð¿d«D\旸tX¥¼-R\έ:,\伍\©\祜Ϝ갼^򝉧{J~¦ð§\䍉g\0^\ʴX%­4C¾´VA_\ڤ\ᬉ¿Sý^	\犜(½M¥÷H8_\ؓ:®ð§��ۤý÷uXп,\ᥜ"J\ߜҡ\䀜韥\\&üS¨\ðOY\̜βQ	\ʊuX\͜ҿ³0\쯓ùc\몛ª\Â¿KÀ	1úý:,𜗋Xƥ\쾝z¥N\ڏ~򜐮r½F¢uR¿7Ђ:\飡À\✪\ޫ)4`À_¨Y\❿CI³iԁ\n\҄͜ۈ>¦o9­ƻ\ʵ¨ZbÁ1~xöÀ \䜚y´aڇk¨1\庩£\\׌£\Ѧ©\֜ХRJ`\֜ꕜК·*¿	X7f}÷Á³A*=¯1G[>Ϯ\ιøoI\Ϝn¿õA\Ơúaº8¡\�ﳜrX¼\免Ai𑆱 	\꒷#\ZµK~¤¾M¸n\\ҷ.\Ћ>¤\noHN!­\⼶\Ŝ✬^a´û?\ʣ󋐍H«ö\̜굜ꜙ[.£\죞\ݜ꜍r¦_z\хk\͜ھ,g¼2S;p\rI«ce\ժ\䒓´$(½<\㷡آʥ\碬£¼\ҷ}2\Ä\ΜrI]󜣜e¹¤msPJv÷Cÿ 󾦭vI}n=\Z±au@K®1Ʒ6þ^=\۽z=\ҷ±\՜̈́ȥ\۟\ڴ©a¾U3¾\㑩»^6Z\ӽy;¨{ĭgj\ܺ dz¤W¼\裲\ݺ&$=-2j.§}r\王H~a©\砜ε£Á-ù÷\隽úJcûQH󜂮P\ni1\윟½ºw}úJ¼>$GsQ\r\Ȭ֝?\'fjk`v-bnPʛ!\꜅庵.\ݿnYõ4}\θ¬O\ꜞ#±1~±üzû\徳\빜✃U\율}º·c檽K\ƪ��¿WFm@\Ҹ\型e\㐤­d~v{g3K\켫��JkDn\÷V¬\̜ڱ(Gs\ٛüЉø\кܺ^)!$=ݷ 7=´øϊ\ܶϮp·\̭M\怕ҷwÁ\ٺº°=¶߃zՈ\�es\ճ6;(#\⢫%\̪!\׭g\粭¦½Oz\˯w\ɾ\ٕ\̜螒5S̻¤\'ubżü3\ψ÷\˜\Zusƶ\nyö1·gj%\䊷¤_a+du\ZE¿\܋\r\Ɉy\䨀»d\Ĝ"^1KùWÈ̘­gͨ��[њy\ނ¬8Zqý¤ķ\0Ӂ«\ȍq´\ཉb;)OS¢u\ʬ\n\'״Y|l\ļ\ꜗ}>£\ݩ6<\瞹»��\\ږ\˜繳h~µU¹:\Zۿ^½f��J񜌜ք±[»umbw\ki\i\әü\Ϝ̜Ԏ\ٜꜤ\ѷg6§eý\껹·\糜ל̮󌓲·\Ϝ՗§\"{eeYݫGfH|¾\˕-��"\窞©m¢¹佨Zto��Qº÷·3Wg÷~1ÿ+V½]\Ҝ"¿��\ӹkb®\鹸4¯¶\͜蕕¤Oz\ڻ\w¯¼lzx^\ގ\ݟ\視ݠ?W¾򆤼/ќ:S\稽 ݡ¤ǅüþ\ٵ\Ĭ݃zEù?¶«üz~\̕ޅ9��ˏr\휧Fn\朞K9ý-¶\ؽ[Fu\胱þ¿\礇\䜝jH\޵\ǎ¡}򜞨\期]ý\ב7¬\߿yõg󜝅ǘ·\朮X\ݒ\湻x&b®ùz÷\ߤ휗\ϕ°𼟨G¿\r\⬙ O\Z)ö$P{ø\Zª\ó\벌\ʱ|U#²ħ#۩M§¬\천̜Ԝ谝\Ɯꤜ׊ªųhBú\߶\ֽ÷Oƙ¹\ʏyoö<\윜\﷜춹=ڣZg¿G\ۜ䛲Қ|\þ߰+\赜riþw\֜윮ºþ¢J!L\발r& m\߲ի«\ʱ©®\МZ´m\޽ýÁ¶\͓ퟱ�󴵎{]\뽃}32\׈&Pk.񌇄\蕕UUZ\ɦ¯{\ؗ𜭎Α̧\ز)«Shî>Ϡkørͷûc-׆={¼ g\ؓ§y´ H·wh\�V¤unҶ\윞]¡¹ú4\πÀ3\ҏ²YIX³oϰ\˟¿>ʣ5»F¼C{¯\¶ùz!z³\לݜ	\霃^·ץu¸BC}X\\µªº\ɷ􌜮ۆ÷k¼Gywk}w\Ϝв-¶v7¨\\^Lú=Zh\е󵷿k\؜圆20𺃘kH\Üܾ±~/\ܜ=nO \ú± \䇜ܽW%\Z򨣜ޠ¿tà\Ϝל'¸³0\Ĝr§fpÁ\ϐ\М끵@hx&=\휛\癶!\ށa+8)Á\Ρ\恡L\Ĝѳ,M\؝\Z\0(múAxúB \\j ¸À3\ߓ\"[Bgx\л$)}C¬ö»CP`׵\ǜ'\懺\᳭\߳\Ǉ|\ڞ\ﾏ$i\\έ\Ѓ\ߜry\ݠwùý¸q\ȭ»½\\眮,f\г°_\Üڂȝ!c\л \ݛ\ԷR@\ל熇¯GRқ½!al\ȭü¯\�ɐE\"O°��➄j L¸L¦\'®=®+½C\퉺Ŝö>oÀ?\ܚ/T\ψÀ\ﲜô􁄠7 rÿ°o\М'¥U􇃾5###z\¸}ýÁÁ\ʁ øے\ʁÀ.Xx@þ#`=e󖎍­\Z;7n٬mi\վ¹±©esG\ָ񶖖M-;\㓜㻻\᜖¯	ÀP¬ (=z-&#Y¬¹w¿¶\ߗnm𳜜G±´Dr\ȜE|±ý@\3\챈L¬кÁ\֜Zøz\Ŷgp1\";GD:y8𴰜ǝDwÏsvúöx$񬟂\윭\r!\Zfú°£\歨80cy\֕³\̜"۴}®«\朮 C\泗hۇd\Μ֤W.¤·Kø=n/ι+\ל܅!m\ל՜ל畹¬Uy@K\ߜʜݽ!£¼^± (t#¾\ᜋ±$ù(¾\Ԑ\\Я􀖜̝HT؏Pù÷k±\䜕=´P��Ɯݳ\իo\ȓjP÷ܞ\᡽úݒ8\Мr���Fb\圪\勺D҃\n\зW\⦜׈³dau\碬\播\޽~±\Ҝ䙆}\߫ \Ǖ\\#¶w4\␨YUSWª\խ_U^USU·½\rȪ\國kjp­[Q§խ¬]]»:1þ#v\ݜǮF1ª\ԍû«ý&I\ܜ꜌ÿe\ጐB,·o- \î¦sk:¦Uÿ\УþSnPQ¾£\ĵ|þüü¯\r.|mp\᫃_\\ø\ڜ܂\׆¾6¸𵁅¯\r.|mp\᫃_\\ø\ڜ܂\׆¾6øøk\ٜϏ¼��\Ħ>>­>	- =wöbY5¨fp­��\ӻ ¸:,ᙹ¿򝗜✜\쥒O\ì£}򳎅󋧜ڵ\ӷ$ý|rWΧ>\߼|Où>҇>զ®SתM\ꊵ\ꔯR\ۜԜճ©\ϻ\߹\ޏt氭\笜'i#¶4󜧜氭ú½\霥²x¥\Я;²d\޼,\¿\ҷµ¼\˫ýÿ\˓´~J\繽:¯P2cdN)_°¤W;\'»\'Ӫ\厪G\㔖6\є\Z\'rD\㠯/¯>&ø¤j\诜"\r\퐚Bc¸29v¢	ú&\Ҳøk\"\ɩﳑª0a±V·7¦+WS<\ʐ\ى¦@¿½}>ú^¥B\؜霈¶T¾7((C6¥Qɤj��\劲P$)¦\'))«nW«$IVQlY1Eªm\ډEüٰS¹a\"n°%£ú\府ń\頺ª,[򳊼U¢tN\ĥVnLP:±\̎¸Ŧÿ¬¼:¡A_G»\\ɧ��\∆m\ꄲ»$û;!ú\օ\̫D7T=\՘§¿+·\㷊m\'VUScRBUø	M9\蠸\Ϝ✊( Qi¡EhFa\Ũù1s#h*+ɯ\С´û\0«I`iIõ1%[±\𝃶g\".IXf¤¦I2\넂Ru\óJ¶ qȲVûN(er)\˦¬¹ÁK\벢±\0c¦Á3J²Xz\"_z \ܨØQ²b#\ƿÀO	\ﰗùE|\ŏú\ȾõþE½ÿa¬N񓓜М✜俬úӍyü\r\ۜş¥û\0q~?£\Ɯƿ\Μ'ügü5 \㾴\ǐ¯@<R𽜛$@\ۜf\Ų\磎J°\ꀖ®¤fV7򜧸³?E¿ý³| ?ފ~\黜蟠µ´ýQ½ÿZ\䴿?3\ӜƜ'\"Ip\Ĥº#£\辕¡ب½\Ҷ4ÿr@ú\͈Q°L-µ%<\Ɵ\䁈¾-µ1\ߏºػ \Z£WDO©üHr8򴦻\Ə󜃎k³\Й\©*¬*¯zH\ќnµr­N{Hk´𛜉\0\硜òp\Ź̑=hN´\üƈZn<5uq:똄zpõKpµ\̎¾#¡~mA\㐱\0\�ڡ´«H\ŵJ´Ϣ}\�D¡ |øÁ\ᇇ~\ɜᇇ~pø%_j¡	p􀣇=£=\ܨG\䐶ö£Gr´£\휠h\휠hG;8\ڥG;8\ځ\Ѯ9\ం\É§\䰂\É\'8\É\'8£\nU\ਂG\䨂G8ªÀQ%9ªÀQ*ɡCMrh\ܐÀ¡C\Z84ph\Â8,\ఈ8,ఀ\Ü"9,2>!4Áq\Z§Áq\Z§%\ǩp\ǩp§Áq\Z§ùȸrª񅰜\˩°,§Àr\n,§ÀrJ²\˩°җ\Μțh\ю¡	\ީퟸ�\n¼SwJ¦WMퟘ�Ga\ɑGap%Gap%\ǘ8\ƀ11\ɱ1pcLr\ɜĜr¡	¿=)ÿ\朐𫘗+?\ĊeޖýzEö§q\ٿýg\骜ٟIu²¡\"\ك\샤3³­.¹1%`\ڮ4\ڽhG\Ў¢$��khQ^\뜜¢&¶\14Nx²q񾜣\㉣\ሱ´k¹<Q\֑ú¢¼\ĵ÷h8DpmP¯\ޜZ\Ԝٚ¼kx3\匶û2öR;YƎ±/±\Ƹ~1Se¥Ý>\ᬋP´\ζ\nZ]Q񺔦[|;\˖)ZidOǺR§ý\ۨ\㨏¡]VVVVf¸2\з9\蜢F+F+@ӄ\n\ʜ̜Ĝݍj\ٹ\'²&^H¤8¡§¸|\'\"\ŕ\覣\ś\н)\Ʊ\'©X\܆±\'¹\ǜџ\؞\Ǵ7c\ݷ\"¶\螉\ت\М팔W »4Rü¢­1m\'*X;õ¾\떽¶\풐m\؊\ѹ\"\Ņº\n1[ʺ\赴:\ג&{Ķݒmµ 6S±<3R¹4π&zeýþ\뒙s\팜�ۜ۠ÿ��©¢{©p]⌷=]þU7\ڜ"񂞜烸އEÿ\�m÷@+|\Ҷ·­\¶kù¤\蛠÷RE\Ķµ6\ɟw¦\َ٪lÁ򜗭\ۜ'l.\۶\ۜ΂\ࣶ\ˬO3©u񇟴µC\Ƭ¢0b»¸pR\ت\ۯsڊm«µ§iULn]ù\ӜTӾþ-+9¾½n¥8\ˌ\.5­7­5\ٍKLMù¦tsª\٢N2\'\㜍f³Ѭ¹\̜霢\睜\✏+Ӎ\⯜׉¨«*aWûKS\Ό>A\ᴥ·u¬gm\᩷µõj\᷺\쓬~뎰Á¾Sۨ­s}x£m\Ҕ\ݖ®s´M\헶3vk7°a~\ä£ήI¨\벜ŏQ3º\ܣ\Ęöu·tw5s_µ!u]\ʜ꜖\泜\z��\懜煮뜨\n?\ߝ®@4¿»-|øªc<\'¶4\㉢\뜮:¦úyr\˶Wý\͜ݠ{]!@FŢy=iõd½ CbtE`]\耗HE®(>QҩLЍ¿¢µ4k¤)$zEҼRH󨐱\୞/*Tvu	*\֥פa¥R\͆r$ÁM\n²1©,\\9GR¨\Ԏ\Ԋ]\n£±\Ũ\ҋfh\ҋ@\㸟¾<\띬by\耳◿z\쭞´ퟷ�­\ჽ6~ ¤ÿ$XQO¯»_��d÷4؛µ񜥏gúy1½\ܜ޼NϷtv?\ﴴG;·\؝\͜ݓ\rõ]t\ݸ«««þ<\ª°.¡«¡񼓍bºA\誔º\Z®g\Ԝ՜╹\ߜ޵n¦õ\ⷁd?Á\ţ{rº\קZü\넂[[`={\\%ö-rt\윫Éhbª¼±¼QLa©$񳮺õÀڂ\ܜ㜬}\ʂt}=͸Q[¸vk[¸ cGH°\ӵþ\ċN[©\śe\û>%\λ\n\n\⒲\੹-\\\֜і^¹LP\՜Ӝܜr\\\ŌNQ$n<.®e2:I`A¡N@&~#À§.3¸xTN\䜤WûÁ	~\r\ϱ|$R)ù\ȄB񼒜¨¬õx>}$§ ZüAXE_\띩\地.?\\7V8V>Vg?´𐐶\đ\Z©|H¡ #0\㈀Ánýt��\ɋ\Ǆ\ఴ;򷞜胮v\迣§\Ϻ6 K\rH񁙀\İ\Ǧ¡¦\Μ"\'CE*ü?X\۶\nendstream\nendobj\n\n6 0 obj\n10825\nendobj\n\n7 0 obj\n<</Type/FontDescriptor/FontName/BAAAAA+Arial-BoldMT\n/Flags 4\n/FontBBox[-627 -376 2000 1011]/ItalicAngle 0\n/Ascent 905\n/Descent 211\n/CapHeight 1010\n/StemV 80\n/FontFile2 5 0 R>>\nendobj\n\n8 0 obj\n<</Length 272/Filter/FlateDecode>>\nstream\nx]\Ϯ \Ɯ％\ǜ�Zu»1ٺ\ٜăÿ¤¶ 0Z񜠜ۗ\ۦ=@~\Ü̷ùf`usm´r\윕΢G¥¥e^­\0\ڃ¨4IR*p{·:C׶\ۜ⠪��ao>·8»\ќÅ\ν\ܑöb%X¥Gzø¨[·«1_0vª¢\ߜ穳\Ϝ݄U\ǆú´r\ۜыþ\n\޷4\ŸV\Ĭa1\0\ۜ鑈\ɹE\˛­\" \応\²KúA|v֗&¾󬫼§ȧ<𽲱\r\ŷs\ܹ\偋\䜹û¢ùµ\ȵ\܇\ȹ\ܜ݄»a?k bµ֯\0³©\߿1³	*<\߻\휮endstream\nendobj\n\n9 0 obj\n<</Type/Font/Subtype/TrueType/BaseFont/BAAAAA+Arial-BoldMT\n/FirstChar 0\n/LastChar 11\n/Widths[750 722 610 889 556 277 666 610 333 277 277 556 ]\n/FontDescriptor 7 0 R\n/ToUnicode 8 0 R\n>>\nendobj\n\n10 0 obj\n<<\n/F1 9 0 R\n>>\nendobj\n\n11 0 obj\n<</Font 10 0 R\n/ProcSet[/PDF/Text]>>\nendobj\n\n1 0 obj\n<</Type/Page/Parent 4 0 R/Resources 11 0 R/MediaBox[0 0 595 842]/Group<</S/Transparency/CS/DeviceRGB/I true>>/Contents 2 0 R>>\nendobj\n\n12 0 obj\n<</Count 1/First 13 0 R/Last 13 0 R\n>>\nendobj\n\n13 0 obj\n<</Title<FEFF00440075006D006D00790020005000440046002000660069006C0065>\n/Dest[1 0 R/XYZ 56.7 773.3 0]/Parent 12 0 R>>\nendobj\n\n4 0 obj\n<</Type/Pages\n/Resources 11 0 R\n/MediaBox[ 0 0 595 842 ]\n/Kids[ 1 0 R ]\n/Count 1>>\nendobj\n\n14 0 obj\n<</Type/Catalog/Pages 4 0 R\n/Outlines 12 0 R\n>>\nendobj\n\n15 0 obj\n<</Author<FEFF004500760061006E00670065006C006F007300200056006C006100630068006F006700690061006E006E00690073>\n/Creator<FEFF005700720069007400650072>\n/Producer<FEFF004F00700065006E004F00660066006900630065002E006F0072006700200032002E0031>\n/CreationDate(D:20070223175637+02\'00\')>>\nendobj\n\nxref\n0 16\n0000000000 65535 f \n0000011997 00000 n \n0000000019 00000 n \n0000000224 00000 n \n0000012330 00000 n \n0000000244 00000 n \n0000011154 00000 n \n0000011176 00000 n \n0000011368 00000 n \n0000011709 00000 n \n0000011910 00000 n \n0000011943 00000 n \n0000012140 00000 n \n0000012196 00000 n \n0000012429 00000 n \n0000012494 00000 n \ntrailer\n<</Size 16/Root 14 0 R\n/Info 15 0 R\n/ID [ <F7D77B3D22B9F92829D49FF5D78B8F28>\n<F7D77B3D22B9F92829D49FF5D78B8F28> ]\n>>\nstartxref\n12787\n%%EOF\n',0,'','admin@pccomponentes.com',1);
/*!40000 ALTER TABLE `partners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
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
  `text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `video_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'2022-05-10 21:34:34','2022-05-10 21:34:34',1,NULL,1),(2,'2022-05-10 21:36:21','2022-05-10 21:36:21',1,NULL,2),(3,'2022-05-10 21:38:36','2022-05-10 21:38:36',1,NULL,3),(4,'2022-05-10 21:41:18','2022-05-10 21:41:18',2,1,NULL),(5,'2022-05-10 22:14:00','2022-05-10 22:14:00',1,NULL,4),(6,'2022-05-10 22:15:00','2022-05-10 22:15:00',3,NULL,NULL);
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
  `type_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Jose Carlos Perez','alumno@daw.com',NULL,'$2y$10$N21RPmefKCP4FEqgUAeAkuruIgut20mtOyYzA4wDp6zee8ZIwZQvu',NULL,'2022-05-10 21:36:04','2022-05-10 21:36:21',2),(2,'Profesor Daw','profesor@daw.com',NULL,'$2y$10$PQS5bQGaYi.3cbba3C3PBu4Fj7VRUHqMK17Hh7svcKwKFcmecd2gC',NULL,'2022-05-10 21:37:52','2022-05-10 21:41:18',4),(3,'Invitado','invitado@daw.es',NULL,'$2y$10$KLDUxhcSh04XrxNNTXbGIuqywB67WKDQ8IypicROSe45kp4tQnZqm',NULL,'2022-05-10 22:13:47','2022-05-10 22:14:00',5),(4,'Administrador','admin@daw.es',NULL,'$2y$10$xs0Dlu/3wtH6TXq1db45V.SSvElls8bNZuuOt/WAM6mNvNUj94OU.',NULL,'2022-05-10 22:15:21','2022-05-10 22:15:21',6);
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

-- Dump completed on 2022-05-10 22:19:38
