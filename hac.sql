-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: 35.187.234.240    Database: hac
-- ------------------------------------------------------
-- Server version	5.7.14-google

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
-- Table structure for table `accounts_profile`
--

DROP TABLE IF EXISTS `accounts_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nim` varchar(10) NOT NULL,
  `name` varchar(200) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nim` (`nim`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `accounts_profile_user_id_49a85d32_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_profile`
--

LOCK TABLES `accounts_profile` WRITE;
/*!40000 ALTER TABLE `accounts_profile` DISABLE KEYS */;
INSERT INTO `accounts_profile` VALUES (1,'D123','Admin Administrator',1),(2,'1901463311','Chandra Wijaya',2),(3,'1901514584','Vincent Alfred',3),(10,'D0316','Pak Lukas',10);
/*!40000 ALTER TABLE `accounts_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add tap',7,'add_tap'),(26,'Can change tap',7,'change_tap'),(27,'Can delete tap',7,'delete_tap'),(28,'Can view tap',7,'view_tap'),(29,'Can add machine',8,'add_machine'),(30,'Can change machine',8,'change_machine'),(31,'Can delete machine',8,'delete_machine'),(32,'Can view machine',8,'view_machine'),(33,'Can add machine_type',9,'add_machine_type'),(34,'Can change machine_type',9,'change_machine_type'),(35,'Can delete machine_type',9,'delete_machine_type'),(36,'Can view machine_type',9,'view_machine_type'),(37,'Can add card',10,'add_card'),(38,'Can change card',10,'change_card'),(39,'Can delete card',10,'delete_card'),(40,'Can view card',10,'view_card'),(41,'Can add unregistered_card',11,'add_unregistered_card'),(42,'Can change unregistered_card',11,'change_unregistered_card'),(43,'Can delete unregistered_card',11,'delete_unregistered_card'),(44,'Can view unregistered_card',11,'view_unregistered_card'),(45,'Can add daily usage',12,'add_dailyusage'),(46,'Can change daily usage',12,'change_dailyusage'),(47,'Can delete daily usage',12,'delete_dailyusage'),(48,'Can view daily usage',12,'view_dailyusage'),(49,'Can add usage',13,'add_usage'),(50,'Can change usage',13,'change_usage'),(51,'Can delete usage',13,'delete_usage'),(52,'Can view usage',13,'view_usage'),(53,'Can add certification',14,'add_certification'),(54,'Can change certification',14,'change_certification'),(55,'Can delete certification',14,'delete_certification'),(56,'Can view certification',14,'view_certification'),(57,'Can add profile',15,'add_profile'),(58,'Can change profile',15,'change_profile'),(59,'Can delete profile',15,'delete_profile'),(60,'Can view profile',15,'view_profile');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$120000$MDuFCZpOGsXC$6orSH5piKpLamIMSC3NIuk47MIUTWCGjPk5zdwYKdFQ=','2019-10-25 15:43:58.387515',1,'admin','','','',1,1,'2019-04-10 12:13:52.871821'),(2,'pbkdf2_sha256$120000$2yMwTMTKNsyc$QSU6/DG8jKkw3OQmnBSvL6we8zcKxUGds0qJO2m1LLQ=',NULL,0,'chandra','','','',0,1,'2019-04-20 12:17:42.028967'),(3,'pbkdf2_sha256$120000$zcl9p1xMu0yp$GYcMPQc68RdAmNEjMXKsLiSzIy0esx7CxVYCPh+D0pE=',NULL,0,'vincent','','','vred95@yahoo.com',0,1,'2019-04-20 12:18:26.675765'),(10,'pbkdf2_sha256$120000$B0fLv18HAtka$1br510F7hVS19/rA75bRMZXq6DtYZO/zAzkSIqU3Rtk=',NULL,0,'Pak_Lukas','','','',0,1,'2019-06-18 03:08:20.141535');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cards_card`
--

DROP TABLE IF EXISTS `cards_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cards_card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_uid` varchar(8) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `card_uid` (`card_uid`),
  KEY `cards_card_user_id_9c174339_fk_auth_user_id` (`user_id`),
  CONSTRAINT `cards_card_user_id_9c174339_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cards_card`
--

LOCK TABLES `cards_card` WRITE;
/*!40000 ALTER TABLE `cards_card` DISABLE KEYS */;
INSERT INTO `cards_card` VALUES (1,'7B8CF40B',1),(6,'4FC0A76A',2),(8,'37591C10',3),(14,'C319F8F4',10);
/*!40000 ALTER TABLE `cards_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cards_unregistered_card`
--

DROP TABLE IF EXISTS `cards_unregistered_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cards_unregistered_card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_uid` varchar(8) NOT NULL,
  `tap_time` datetime(6) NOT NULL,
  `machine_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `card_uid` (`card_uid`),
  KEY `cards_unregistered_c_machine_id_3cf68d64_fk_machines_` (`machine_id`),
  CONSTRAINT `cards_unregistered_c_machine_id_3cf68d64_fk_machines_` FOREIGN KEY (`machine_id`) REFERENCES `machines_machine` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cards_unregistered_card`
--

LOCK TABLES `cards_unregistered_card` WRITE;
/*!40000 ALTER TABLE `cards_unregistered_card` DISABLE KEYS */;
INSERT INTO `cards_unregistered_card` VALUES (15,'5690AA59','2019-05-28 07:17:13.651952',1),(16,'65CE662A','2019-05-28 07:17:16.331452',2),(17,'15416BF1','2019-06-12 08:05:37.619689',1),(18,'085F630D','2019-06-12 08:56:07.556339',1),(19,'2F8B996A','2019-06-12 08:57:12.902418',1),(20,'E5B995DA','2019-06-12 08:56:57.775358',1),(21,'08E9B44F','2019-06-12 10:18:59.904321',1),(22,'08017600','2019-06-12 10:19:28.885788',1),(23,'0811C4B2','2019-06-14 12:07:26.318807',2),(26,'D9EB7928','2019-06-18 03:06:52.849441',1),(27,'EF0356F5','2019-07-25 08:11:56.299198',1),(28,'AF3EB46A','2019-07-25 12:39:15.144736',1),(29,'0879A317','2019-07-25 11:08:57.835376',1),(30,'0841D2A5','2019-07-25 11:09:04.085549',1),(31,'082B060D','2019-07-25 11:09:12.150745',1),(32,'08C3D7FF','2019-07-25 11:10:40.896579',1),(33,'0874E983','2019-07-25 11:10:46.778452',1),(34,'08912214','2019-07-25 11:10:49.948745',1),(35,'08000000','2019-07-25 11:12:23.825408',1),(36,'080B2D8F','2019-07-25 12:33:28.595026',1),(37,'8F532F66','2019-07-25 12:38:45.481624',1),(38,'B31B01F5','2019-07-25 12:39:16.025305',1);
/*!40000 ALTER TABLE `cards_unregistered_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certifications_certification`
--

DROP TABLE IF EXISTS `certifications_certification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certifications_certification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `machine_type_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `certifications_certi_machine_type_id_cf53aa6b_fk_machines_` (`machine_type_id`),
  KEY `certifications_certification_user_id_959647a5_fk_auth_user_id` (`user_id`),
  CONSTRAINT `certifications_certi_machine_type_id_cf53aa6b_fk_machines_` FOREIGN KEY (`machine_type_id`) REFERENCES `machines_machine_type` (`id`),
  CONSTRAINT `certifications_certification_user_id_959647a5_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certifications_certification`
--

LOCK TABLES `certifications_certification` WRITE;
/*!40000 ALTER TABLE `certifications_certification` DISABLE KEYS */;
INSERT INTO `certifications_certification` VALUES (1,1,1),(3,2,1),(16,2,2),(31,2,10),(33,1,2),(34,3,2),(42,2,3),(43,3,1),(44,1,3),(45,3,3);
/*!40000 ALTER TABLE `certifications_certification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-04-10 12:40:15.892107','1','Profile object (1)',1,'[{\"added\": {}}]',7,1),(2,'2019-04-10 12:40:41.915894','1','Drill',1,'[{\"added\": {}}]',9,1),(3,'2019-04-10 12:41:00.006597','1','Bench Drill',1,'[{\"added\": {}}]',8,1),(4,'2019-04-10 12:42:28.738295','1','Certification object (1)',1,'[{\"added\": {}}]',10,1),(5,'2019-04-10 12:42:57.995690','1','7B8CF40B',1,'[{\"added\": {}}]',8,1),(6,'2019-04-20 11:03:44.411501','2','Certification object (2)',1,'[{\"added\": {}}]',14,1),(7,'2019-04-20 11:03:54.255929','3','Certification object (3)',1,'[{\"added\": {}}]',14,1),(8,'2019-04-20 11:04:01.633498','1','Certification object (1)',2,'[]',14,1),(9,'2019-04-20 12:17:42.384863','2','Chandra',1,'[{\"added\": {}}]',4,1),(10,'2019-04-20 12:18:04.267624','2','DB8B36OC',1,'[{\"added\": {}}]',10,1),(11,'2019-04-20 12:18:26.991977','3','Vincent',1,'[{\"added\": {}}]',4,1),(12,'2019-04-20 12:18:39.378879','3','6B78370C',1,'[{\"added\": {}}]',10,1),(13,'2019-04-20 12:20:34.186875','4','Certification object (4)',1,'[{\"added\": {}}]',14,1),(14,'2019-04-20 12:20:47.820692','5','Certification object (5)',1,'[{\"added\": {}}]',14,1),(15,'2019-04-20 12:22:37.924042','2','DB8B360C',2,'[{\"changed\": {\"fields\": [\"card_uid\"]}}]',10,1),(16,'2019-05-09 11:59:54.254591','1','DB8B360C',3,'',11,1),(17,'2019-05-13 11:55:15.516999','6','Certification object (6)',1,'[{\"added\": {}}]',14,1),(18,'2019-05-15 09:24:41.961330','5','08914091',1,'[{\"added\": {}}]',10,1),(19,'2019-05-15 09:27:31.355679','6','4FC0A76A',1,'[{\"added\": {}}]',10,1),(20,'2019-05-26 15:43:24.391698','3','Profile object (3)',1,'[{\"added\": {}}]',15,1),(21,'2019-05-26 15:43:37.790741','4','Profile object (4)',1,'[{\"added\": {}}]',15,1),(22,'2019-05-26 15:54:27.129720','5','Profile object (5)',1,'[{\"added\": {}}]',15,1),(23,'2019-06-09 08:36:32.848582','11','083396EE',3,'',11,1),(24,'2019-06-09 08:36:33.001271','10','080097C4',3,'',11,1),(25,'2019-06-09 08:36:33.154771','9','084900FF',3,'',11,1),(26,'2019-06-09 08:36:33.307160','8','08004D07',3,'',11,1),(27,'2019-06-09 08:36:33.460248','7','0872188C',3,'',11,1),(28,'2019-06-09 08:36:33.612948','6','088B9057',3,'',11,1),(29,'2019-06-09 08:36:33.766532','5','08914091',3,'',11,1),(30,'2019-06-09 08:36:33.919117','3','08492EB2',3,'',11,1),(31,'2019-06-09 08:36:34.072340','2','08D5B8FC',3,'',11,1),(32,'2019-06-17 12:32:08.719671','83','DailyUsage object (83)',2,'[{\"changed\": {\"fields\": [\"total_time\"]}}]',12,1),(33,'2019-06-17 12:32:20.649878','84','DailyUsage object (84)',2,'[{\"changed\": {\"fields\": [\"total_time\"]}}]',12,1),(34,'2019-07-09 14:19:47.711575','30','test30',3,'',8,1),(35,'2019-07-09 14:19:47.883590','29','test29',3,'',8,1),(36,'2019-07-09 14:19:48.052082','28','test28',3,'',8,1),(37,'2019-07-09 14:19:48.220663','27','test27',3,'',8,1),(38,'2019-07-09 14:19:48.388760','26','test26',3,'',8,1),(39,'2019-07-09 14:19:48.556513','25','test25',3,'',8,1),(40,'2019-07-09 14:19:48.724518','24','test24',3,'',8,1),(41,'2019-07-09 14:19:48.892637','23','test23',3,'',8,1),(42,'2019-07-09 14:19:49.060628','22','test22',3,'',8,1),(43,'2019-07-09 14:19:49.228454','21','test21',3,'',8,1),(44,'2019-07-09 14:19:49.396766','20','test20',3,'',8,1),(45,'2019-07-09 14:19:49.564899','19','test19',3,'',8,1),(46,'2019-07-09 14:19:49.733669','18','test18',3,'',8,1),(47,'2019-07-09 14:19:49.902152','17','test17',3,'',8,1),(48,'2019-07-09 14:19:50.070184','16','test16',3,'',8,1),(49,'2019-07-09 14:19:50.238921','15','test15',3,'',8,1),(50,'2019-07-09 14:19:50.406479','14','test14',3,'',8,1),(51,'2019-07-09 14:19:50.575195','13','test13',3,'',8,1),(52,'2019-07-09 14:19:50.743286','12','test12',3,'',8,1),(53,'2019-07-09 14:19:50.911437','11','test11',3,'',8,1),(54,'2019-07-09 14:19:51.079881','10','test10',3,'',8,1),(55,'2019-07-09 14:19:51.247838','9','test9',3,'',8,1),(56,'2019-07-09 14:19:51.415687','8','test8',3,'',8,1),(57,'2019-07-09 14:19:51.583532','7','test7',3,'',8,1),(58,'2019-07-09 14:19:51.750570','6','test6',3,'',8,1),(59,'2019-07-09 14:19:51.917885','5','test5',3,'',8,1),(60,'2019-07-09 14:19:52.085450','4','test4',3,'',8,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (15,'accounts','profile'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(10,'cards','card'),(11,'cards','unregistered_card'),(14,'certifications','certification'),(5,'contenttypes','contenttype'),(8,'machines','machine'),(9,'machines','machine_type'),(6,'sessions','session'),(7,'taps','tap'),(12,'usages','dailyusage'),(13,'usages','usage');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-04-10 12:13:33.602733'),(2,'auth','0001_initial','2019-04-10 12:13:35.036240'),(3,'admin','0001_initial','2019-04-10 12:13:35.476652'),(4,'admin','0002_logentry_remove_auto_add','2019-04-10 12:13:35.568573'),(5,'admin','0003_logentry_add_action_flag_choices','2019-04-10 12:13:35.684391'),(6,'contenttypes','0002_remove_content_type_name','2019-04-10 12:13:35.996161'),(7,'auth','0002_alter_permission_name_max_length','2019-04-10 12:13:36.396992'),(8,'auth','0003_alter_user_email_max_length','2019-04-10 12:13:36.585526'),(9,'auth','0004_alter_user_username_opts','2019-04-10 12:13:36.707472'),(10,'auth','0005_alter_user_last_login_null','2019-04-10 12:13:36.866841'),(11,'auth','0006_require_contenttypes_0002','2019-04-10 12:13:36.950095'),(12,'auth','0007_alter_validators_add_error_messages','2019-04-10 12:13:37.057720'),(13,'auth','0008_alter_user_username_max_length','2019-04-10 12:13:37.225573'),(14,'auth','0009_alter_user_last_name_max_length','2019-04-10 12:13:37.475498'),(15,'machines','0001_initial','2019-04-10 12:13:37.882525'),(16,'cards','0001_initial','2019-04-10 12:13:38.325918'),(17,'certifications','0001_initial','2019-04-10 12:13:38.665403'),(18,'sessions','0001_initial','2019-04-10 12:13:39.094959'),(19,'taps','0001_initial','2019-04-10 12:13:39.398752'),(20,'usages','0001_initial','2019-04-10 12:13:40.143751'),(21,'accounts','0001_initial','2019-04-10 12:39:57.505055'),(22,'usages','0002_auto_20190614_1744','2019-06-14 10:44:10.366317');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0o6n0s6vbqd0w25sxyeu34ao9eqa3gm6','OTFjMzcyYmZmZGQ4MmM0YWU1ZjlhZGQzYWQ0ZWNjM2VhZTY2ZTM0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNWI0OGJkYTllYzVjMWZmMTU1Mzc5MmViOGU4ZjVjMjUwYjJhNmZkIn0=','2019-05-13 09:26:16.583230'),('0y3zv21ohg1047vt5p0efq0ijxt6to45','OTFjMzcyYmZmZGQ4MmM0YWU1ZjlhZGQzYWQ0ZWNjM2VhZTY2ZTM0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNWI0OGJkYTllYzVjMWZmMTU1Mzc5MmViOGU4ZjVjMjUwYjJhNmZkIn0=','2019-07-15 15:31:58.206925'),('2jmoubdbv5t3iijflo3a9x0x0704vxby','OTFjMzcyYmZmZGQ4MmM0YWU1ZjlhZGQzYWQ0ZWNjM2VhZTY2ZTM0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNWI0OGJkYTllYzVjMWZmMTU1Mzc5MmViOGU4ZjVjMjUwYjJhNmZkIn0=','2019-06-08 08:11:30.569308'),('3bdgl65gsv1v6wtqgph1o5ncv3uon5z7','OTFjMzcyYmZmZGQ4MmM0YWU1ZjlhZGQzYWQ0ZWNjM2VhZTY2ZTM0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNWI0OGJkYTllYzVjMWZmMTU1Mzc5MmViOGU4ZjVjMjUwYjJhNmZkIn0=','2019-04-24 12:33:59.804861'),('3hjcces3bo3my8fwe8mgfb74p62yfwt7','OTFjMzcyYmZmZGQ4MmM0YWU1ZjlhZGQzYWQ0ZWNjM2VhZTY2ZTM0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNWI0OGJkYTllYzVjMWZmMTU1Mzc5MmViOGU4ZjVjMjUwYjJhNmZkIn0=','2019-04-27 06:28:02.930609'),('7ljjwzi5pmnqb0fd11yqzcm9d3smmi1f','OTFjMzcyYmZmZGQ4MmM0YWU1ZjlhZGQzYWQ0ZWNjM2VhZTY2ZTM0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNWI0OGJkYTllYzVjMWZmMTU1Mzc5MmViOGU4ZjVjMjUwYjJhNmZkIn0=','2019-08-27 08:47:15.878337'),('99ivtuqkqebtuff98u06hrwpmkzsi0jk','OTFjMzcyYmZmZGQ4MmM0YWU1ZjlhZGQzYWQ0ZWNjM2VhZTY2ZTM0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNWI0OGJkYTllYzVjMWZmMTU1Mzc5MmViOGU4ZjVjMjUwYjJhNmZkIn0=','2019-04-24 12:44:15.612233'),('aam2m6b3ztl2x8vg9sut4p62dfp3lre9','OTFjMzcyYmZmZGQ4MmM0YWU1ZjlhZGQzYWQ0ZWNjM2VhZTY2ZTM0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNWI0OGJkYTllYzVjMWZmMTU1Mzc5MmViOGU4ZjVjMjUwYjJhNmZkIn0=','2019-05-23 10:32:40.612109'),('cms5gppdqzobnif1iq0zgmtvnu317hps','OTFjMzcyYmZmZGQ4MmM0YWU1ZjlhZGQzYWQ0ZWNjM2VhZTY2ZTM0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNWI0OGJkYTllYzVjMWZmMTU1Mzc5MmViOGU4ZjVjMjUwYjJhNmZkIn0=','2019-08-06 09:06:15.020922'),('e2dhyazs13vdmr0wb676ynp38cpr9664','Njc0YjdiOTEzMjk3NjcyOTY3MDdmNTA2NThmZGI1ZWZhMmFkMTRiMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwNDYyZDRhNjYyYjI2ZDhkZjFjMzJlYjBhNmU5YWQxYWM5Y2JlMzY1In0=','2019-08-26 09:20:30.772376'),('fvweflz1dx30zhm0m4j2rtlpfyif5vl1','OTFjMzcyYmZmZGQ4MmM0YWU1ZjlhZGQzYWQ0ZWNjM2VhZTY2ZTM0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNWI0OGJkYTllYzVjMWZmMTU1Mzc5MmViOGU4ZjVjMjUwYjJhNmZkIn0=','2019-06-27 12:07:32.320009'),('gv5itzkd8o7hq9n9dhpflfbu3oqz967m','OTFjMzcyYmZmZGQ4MmM0YWU1ZjlhZGQzYWQ0ZWNjM2VhZTY2ZTM0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNWI0OGJkYTllYzVjMWZmMTU1Mzc5MmViOGU4ZjVjMjUwYjJhNmZkIn0=','2019-06-23 16:34:06.838837'),('h08f145v59wneawpk27y3hifb9gcamc6','OTFjMzcyYmZmZGQ4MmM0YWU1ZjlhZGQzYWQ0ZWNjM2VhZTY2ZTM0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNWI0OGJkYTllYzVjMWZmMTU1Mzc5MmViOGU4ZjVjMjUwYjJhNmZkIn0=','2019-07-20 17:27:33.493063'),('hdziidpvvfotmec3qy4apcvfpxzkbl4n','OTFjMzcyYmZmZGQ4MmM0YWU1ZjlhZGQzYWQ0ZWNjM2VhZTY2ZTM0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNWI0OGJkYTllYzVjMWZmMTU1Mzc5MmViOGU4ZjVjMjUwYjJhNmZkIn0=','2019-07-31 09:48:59.722885'),('htjugss93oxkxwf08e4j7c39mv0z6rb0','OTFjMzcyYmZmZGQ4MmM0YWU1ZjlhZGQzYWQ0ZWNjM2VhZTY2ZTM0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNWI0OGJkYTllYzVjMWZmMTU1Mzc5MmViOGU4ZjVjMjUwYjJhNmZkIn0=','2019-08-26 08:41:05.318313'),('jzrqto97v0xv98ceod96s06mo4mkjxpo','OTFjMzcyYmZmZGQ4MmM0YWU1ZjlhZGQzYWQ0ZWNjM2VhZTY2ZTM0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNWI0OGJkYTllYzVjMWZmMTU1Mzc5MmViOGU4ZjVjMjUwYjJhNmZkIn0=','2019-07-23 09:11:33.184701'),('kjquu4fy41zfxspawl3vpuyq585e896o','OTFjMzcyYmZmZGQ4MmM0YWU1ZjlhZGQzYWQ0ZWNjM2VhZTY2ZTM0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNWI0OGJkYTllYzVjMWZmMTU1Mzc5MmViOGU4ZjVjMjUwYjJhNmZkIn0=','2019-05-04 09:32:11.587237'),('kmuvg526bl0s5ez1uipuyg6zkizz8azh','OTFjMzcyYmZmZGQ4MmM0YWU1ZjlhZGQzYWQ0ZWNjM2VhZTY2ZTM0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNWI0OGJkYTllYzVjMWZmMTU1Mzc5MmViOGU4ZjVjMjUwYjJhNmZkIn0=','2019-07-14 12:05:07.405139'),('l64b2rg84ibgc2khn2gvu1w60njmhai2','Njc0YjdiOTEzMjk3NjcyOTY3MDdmNTA2NThmZGI1ZWZhMmFkMTRiMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwNDYyZDRhNjYyYjI2ZDhkZjFjMzJlYjBhNmU5YWQxYWM5Y2JlMzY1In0=','2019-05-30 07:25:07.471151'),('lcbzvisabnvympt09ogfca37re16ba82','OTFjMzcyYmZmZGQ4MmM0YWU1ZjlhZGQzYWQ0ZWNjM2VhZTY2ZTM0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNWI0OGJkYTllYzVjMWZmMTU1Mzc5MmViOGU4ZjVjMjUwYjJhNmZkIn0=','2019-06-30 16:23:25.729792'),('lyjyb8082qljoy1xhzdw3fqiiy3oo8gh','OTFjMzcyYmZmZGQ4MmM0YWU1ZjlhZGQzYWQ0ZWNjM2VhZTY2ZTM0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNWI0OGJkYTllYzVjMWZmMTU1Mzc5MmViOGU4ZjVjMjUwYjJhNmZkIn0=','2019-04-27 06:30:25.185656'),('mb7o75jg7oktukgz9wiyh5surj55lw70','OTFjMzcyYmZmZGQ4MmM0YWU1ZjlhZGQzYWQ0ZWNjM2VhZTY2ZTM0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNWI0OGJkYTllYzVjMWZmMTU1Mzc5MmViOGU4ZjVjMjUwYjJhNmZkIn0=','2019-08-26 08:40:10.917845'),('nxdok9clmsp0ncu6hh3opbwuxvop1uwi','OTFjMzcyYmZmZGQ4MmM0YWU1ZjlhZGQzYWQ0ZWNjM2VhZTY2ZTM0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNWI0OGJkYTllYzVjMWZmMTU1Mzc5MmViOGU4ZjVjMjUwYjJhNmZkIn0=','2019-06-27 11:39:42.608991'),('pd6cso81z316a593s6e3aw8d6ivx18zo','OTFjMzcyYmZmZGQ4MmM0YWU1ZjlhZGQzYWQ0ZWNjM2VhZTY2ZTM0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNWI0OGJkYTllYzVjMWZmMTU1Mzc5MmViOGU4ZjVjMjUwYjJhNmZkIn0=','2019-09-24 14:04:44.052211'),('ptqnivknfal87icwvrvy0xp68xao1fwo','Njc0YjdiOTEzMjk3NjcyOTY3MDdmNTA2NThmZGI1ZWZhMmFkMTRiMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwNDYyZDRhNjYyYjI2ZDhkZjFjMzJlYjBhNmU5YWQxYWM5Y2JlMzY1In0=','2019-06-03 15:09:45.893675'),('r2dgp2gsl7z5i2sn3j1kf681tnlp5lhf','OTFjMzcyYmZmZGQ4MmM0YWU1ZjlhZGQzYWQ0ZWNjM2VhZTY2ZTM0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNWI0OGJkYTllYzVjMWZmMTU1Mzc5MmViOGU4ZjVjMjUwYjJhNmZkIn0=','2019-07-24 01:08:46.648901'),('ro6fj26h1nz3189m6rwyj0q9ks77nuiy','OTFjMzcyYmZmZGQ4MmM0YWU1ZjlhZGQzYWQ0ZWNjM2VhZTY2ZTM0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNWI0OGJkYTllYzVjMWZmMTU1Mzc5MmViOGU4ZjVjMjUwYjJhNmZkIn0=','2019-05-23 11:57:45.895016'),('s0kio77rz83o7pt5shwsfvd3hp0w1im7','OTFjMzcyYmZmZGQ4MmM0YWU1ZjlhZGQzYWQ0ZWNjM2VhZTY2ZTM0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNWI0OGJkYTllYzVjMWZmMTU1Mzc5MmViOGU4ZjVjMjUwYjJhNmZkIn0=','2019-06-08 08:09:13.802586'),('sfaa8qzbox0f00s29k0orajug86hnnxs','OTFjMzcyYmZmZGQ4MmM0YWU1ZjlhZGQzYWQ0ZWNjM2VhZTY2ZTM0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNWI0OGJkYTllYzVjMWZmMTU1Mzc5MmViOGU4ZjVjMjUwYjJhNmZkIn0=','2019-08-06 16:53:25.625234'),('sw9xi38gyjol2pn9h34nnmc8vj9tvtz1','OTFjMzcyYmZmZGQ4MmM0YWU1ZjlhZGQzYWQ0ZWNjM2VhZTY2ZTM0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNWI0OGJkYTllYzVjMWZmMTU1Mzc5MmViOGU4ZjVjMjUwYjJhNmZkIn0=','2019-08-08 08:48:39.487580'),('vprcwy3k4zagc4jh7aonoicbf9zc6mfe','OTFjMzcyYmZmZGQ4MmM0YWU1ZjlhZGQzYWQ0ZWNjM2VhZTY2ZTM0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNWI0OGJkYTllYzVjMWZmMTU1Mzc5MmViOGU4ZjVjMjUwYjJhNmZkIn0=','2019-08-12 07:54:16.518318'),('xniwvhicdm4jovqdxdtcvffcgq4krc5d','OTFjMzcyYmZmZGQ4MmM0YWU1ZjlhZGQzYWQ0ZWNjM2VhZTY2ZTM0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNWI0OGJkYTllYzVjMWZmMTU1Mzc5MmViOGU4ZjVjMjUwYjJhNmZkIn0=','2019-06-28 09:56:03.714842'),('ypd10ltw2uuvvf1tyh1u3382k5q463p1','OTFjMzcyYmZmZGQ4MmM0YWU1ZjlhZGQzYWQ0ZWNjM2VhZTY2ZTM0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNWI0OGJkYTllYzVjMWZmMTU1Mzc5MmViOGU4ZjVjMjUwYjJhNmZkIn0=','2019-06-11 04:43:26.081506'),('zidxfpmb5yeu2hok25xwyy8v01tvehok','OTFjMzcyYmZmZGQ4MmM0YWU1ZjlhZGQzYWQ0ZWNjM2VhZTY2ZTM0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNWI0OGJkYTllYzVjMWZmMTU1Mzc5MmViOGU4ZjVjMjUwYjJhNmZkIn0=','2019-06-27 12:38:59.604416');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `machines_machine`
--

DROP TABLE IF EXISTS `machines_machine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `machines_machine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `machine_name` varchar(200) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `machine_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `machines_machine_machine_type_id_46b63190_fk_machines_` (`machine_type_id`),
  CONSTRAINT `machines_machine_machine_type_id_46b63190_fk_machines_` FOREIGN KEY (`machine_type_id`) REFERENCES `machines_machine_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `machines_machine`
--

LOCK TABLES `machines_machine` WRITE;
/*!40000 ALTER TABLE `machines_machine` DISABLE KEYS */;
INSERT INTO `machines_machine` VALUES (1,'Power Grinder',1,1),(2,'Bench Drill',1,2),(3,'Dremel Motosaw',1,3),(4,'Drill 2',1,2);
/*!40000 ALTER TABLE `machines_machine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `machines_machine_type`
--

DROP TABLE IF EXISTS `machines_machine_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `machines_machine_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `machine_type_name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `machine_type_name` (`machine_type_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `machines_machine_type`
--

LOCK TABLES `machines_machine_type` WRITE;
/*!40000 ALTER TABLE `machines_machine_type` DISABLE KEYS */;
INSERT INTO `machines_machine_type` VALUES (2,'Drill'),(1,'Grinder'),(3,'Saw');
/*!40000 ALTER TABLE `machines_machine_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taps_tap`
--

DROP TABLE IF EXISTS `taps_tap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taps_tap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_uid` varchar(20) NOT NULL,
  `tap_time` datetime(6) NOT NULL,
  `power_usage` int(11) DEFAULT NULL,
  `machine_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `taps_tap_machine_id_4fb846d7_fk_machines_machine_id` (`machine_id`),
  CONSTRAINT `taps_tap_machine_id_4fb846d7_fk_machines_machine_id` FOREIGN KEY (`machine_id`) REFERENCES `machines_machine` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taps_tap`
--

LOCK TABLES `taps_tap` WRITE;
/*!40000 ALTER TABLE `taps_tap` DISABLE KEYS */;
/*!40000 ALTER TABLE `taps_tap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usages_dailyusage`
--

DROP TABLE IF EXISTS `usages_dailyusage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usages_dailyusage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `total_usage` int(11) NOT NULL,
  `total_time` bigint(20) NOT NULL,
  `machine_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usages_dailyusage_machine_type_id_f5611483_fk_machines_` (`machine_type_id`),
  KEY `usages_dailyusage_date_afdd7701` (`date`),
  CONSTRAINT `usages_dailyusage_machine_type_id_f5611483_fk_machines_` FOREIGN KEY (`machine_type_id`) REFERENCES `machines_machine_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usages_dailyusage`
--

LOCK TABLES `usages_dailyusage` WRITE;
/*!40000 ALTER TABLE `usages_dailyusage` DISABLE KEYS */;
INSERT INTO `usages_dailyusage` VALUES (1,'2019-04-10',119,42,2),(2,'2019-04-10',43,39,1),(3,'2019-04-11',136,48,2),(4,'2019-04-11',31,28,1),(5,'2019-04-12',218,77,2),(6,'2019-04-12',48,44,1),(7,'2019-04-15',15,14,1),(8,'2019-04-15',74,26,2),(9,'2019-04-16',50,46,1),(10,'2019-04-16',79,28,2),(11,'2019-04-17',102,92,1),(12,'2019-04-17',195,69,2),(13,'2019-04-18',182,64,2),(14,'2019-04-18',43,39,1),(15,'2019-04-19',17,6,2),(16,'2019-04-19',39,36,1),(17,'2019-04-22',11,10,1),(18,'2019-04-22',264,93,2),(19,'2019-04-23',60,21,2),(20,'2019-04-23',88,79,1),(21,'2019-04-24',11,10,1),(22,'2019-04-24',163,57,2),(23,'2019-04-25',160,56,2),(24,'2019-04-25',45,41,1),(25,'2019-04-26',28,10,2),(26,'2019-04-26',32,30,1),(27,'2019-04-29',1,1,1),(28,'2019-04-29',42,15,2),(29,'2019-04-30',116,41,2),(30,'2019-04-30',40,37,1),(31,'2019-05-01',20,18,1),(32,'2019-05-01',62,22,2),(33,'2019-05-02',175,62,2),(34,'2019-05-02',37,34,1),(35,'2019-05-03',26,9,2),(36,'2019-05-03',43,39,1),(37,'2019-05-06',212,75,2),(38,'2019-05-06',43,40,1),(39,'2019-05-07',23,21,1),(40,'2019-05-07',54,19,2),(41,'2019-05-08',20,18,1),(42,'2019-05-08',207,73,2),(43,'2019-05-09',122,43,2),(44,'2019-05-09',19,17,1),(45,'2019-05-10',201,71,2),(46,'2019-05-10',91,82,1),(47,'2019-05-13',80,73,1),(48,'2019-05-13',88,31,2),(49,'2019-05-14',47,42,1),(50,'2019-05-14',86,30,2),(51,'2019-05-15',108,38,2),(52,'2019-05-15',47,43,1),(53,'2019-05-16',59,53,1),(54,'2019-05-16',6,2,2),(55,'2019-05-17',0,0,1),(56,'2019-05-17',188,66,2),(57,'2019-05-20',16,15,1),(58,'2019-05-20',32,11,2),(59,'2019-05-21',83,29,2),(60,'2019-05-21',9,8,1),(61,'2019-05-22',177,62,2),(62,'2019-05-22',48,44,1),(63,'2019-05-23',125,113,1),(64,'2019-05-23',128,45,2),(65,'2019-05-24',20,7,2),(66,'2019-05-24',33,30,1),(67,'2019-05-27',247,87,2),(68,'2019-05-27',28,26,1),(69,'2019-05-28',244,86,2),(70,'2019-05-28',38,34,1),(71,'2019-05-29',378,133,2),(72,'2019-05-29',90,82,1),(73,'2019-06-10',10,9,1),(74,'2019-06-10',31,11,2),(75,'2019-06-11',184,167,1),(76,'2019-06-11',196,69,2),(77,'2019-06-12',111,39,2),(78,'2019-06-12',36,32,1),(79,'2019-06-13',26,24,1),(80,'2019-06-13',352,124,2),(81,'2019-06-14',253,89,2),(82,'2019-06-14',52,47,1),(83,'2019-06-18',1,3,2),(84,'2019-06-18',0,1,1);
/*!40000 ALTER TABLE `usages_dailyusage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usages_usage`
--

DROP TABLE IF EXISTS `usages_usage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usages_usage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_time` datetime(6) NOT NULL,
  `end_time` datetime(6) NOT NULL,
  `total_usage` int(11) NOT NULL,
  `machine_id` int(11) NOT NULL,
  `machine_type_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usages_usage_machine_id_550bb300_fk_machines_machine_id` (`machine_id`),
  KEY `usages_usage_machine_type_id_1cd93873_fk_machines_` (`machine_type_id`),
  KEY `usages_usage_user_id_8a9ecca3_fk_auth_user_id` (`user_id`),
  CONSTRAINT `usages_usage_machine_id_550bb300_fk_machines_machine_id` FOREIGN KEY (`machine_id`) REFERENCES `machines_machine` (`id`),
  CONSTRAINT `usages_usage_machine_type_id_1cd93873_fk_machines_` FOREIGN KEY (`machine_type_id`) REFERENCES `machines_machine_type` (`id`),
  CONSTRAINT `usages_usage_user_id_8a9ecca3_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=238 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usages_usage`
--

LOCK TABLES `usages_usage` WRITE;
/*!40000 ALTER TABLE `usages_usage` DISABLE KEYS */;
INSERT INTO `usages_usage` VALUES (1,'2019-04-10 09:00:00.000000','2019-04-10 09:13:00.000000',14,1,1,3),(2,'2019-04-10 10:35:00.000000','2019-04-10 10:39:00.000000',11,2,2,1),(3,'2019-04-10 11:22:00.000000','2019-04-10 11:29:00.000000',8,1,1,2),(4,'2019-04-10 11:55:00.000000','2019-04-10 12:23:00.000000',79,2,2,3),(5,'2019-04-10 12:42:00.000000','2019-04-10 12:44:00.000000',6,2,2,3),(6,'2019-04-10 15:07:00.000000','2019-04-10 15:15:00.000000',23,2,2,1),(7,'2019-04-10 17:11:00.000000','2019-04-10 17:30:00.000000',21,1,1,2),(8,'2019-04-11 12:56:00.000000','2019-04-11 12:58:00.000000',6,2,2,2),(9,'2019-04-11 15:16:00.000000','2019-04-11 15:44:00.000000',79,2,2,2),(10,'2019-04-11 16:08:00.000000','2019-04-11 16:36:00.000000',31,1,1,2),(11,'2019-04-11 17:16:00.000000','2019-04-11 17:34:00.000000',51,2,2,2),(12,'2019-04-12 10:41:00.000000','2019-04-12 10:51:00.000000',28,2,2,1),(13,'2019-04-12 11:44:00.000000','2019-04-12 12:03:00.000000',54,2,2,2),(14,'2019-04-12 14:54:00.000000','2019-04-12 15:18:00.000000',26,1,1,1),(15,'2019-04-12 15:42:00.000000','2019-04-12 16:02:00.000000',22,1,1,2),(16,'2019-04-12 15:53:00.000000','2019-04-12 16:16:00.000000',65,2,2,2),(17,'2019-04-12 17:50:00.000000','2019-04-12 18:15:00.000000',71,2,2,1),(18,'2019-04-15 17:33:00.000000','2019-04-15 17:59:00.000000',74,2,2,3),(19,'2019-04-15 17:37:00.000000','2019-04-15 17:51:00.000000',15,1,1,1),(20,'2019-04-16 09:29:00.000000','2019-04-16 09:51:00.000000',24,1,1,2),(21,'2019-04-16 11:36:00.000000','2019-04-16 11:38:00.000000',2,1,1,3),(22,'2019-04-16 13:22:00.000000','2019-04-16 13:50:00.000000',79,2,2,2),(23,'2019-04-16 13:34:00.000000','2019-04-16 13:56:00.000000',24,1,1,3),(24,'2019-04-17 11:06:00.000000','2019-04-17 11:12:00.000000',17,2,2,1),(25,'2019-04-17 11:48:00.000000','2019-04-17 11:52:00.000000',11,2,2,2),(26,'2019-04-17 12:18:00.000000','2019-04-17 12:45:00.000000',30,1,1,2),(27,'2019-04-17 13:39:00.000000','2019-04-17 14:04:00.000000',28,1,1,1),(28,'2019-04-17 14:00:00.000000','2019-04-17 14:10:00.000000',11,1,1,1),(29,'2019-04-17 14:50:00.000000','2019-04-17 15:20:00.000000',33,1,1,2),(30,'2019-04-17 15:31:00.000000','2019-04-17 15:42:00.000000',31,2,2,2),(31,'2019-04-17 16:23:00.000000','2019-04-17 16:25:00.000000',6,2,2,2),(32,'2019-04-17 16:28:00.000000','2019-04-17 16:45:00.000000',48,2,2,2),(33,'2019-04-17 17:58:00.000000','2019-04-17 18:27:00.000000',82,2,2,1),(34,'2019-04-18 09:46:00.000000','2019-04-18 09:48:00.000000',6,2,2,2),(35,'2019-04-18 09:48:00.000000','2019-04-18 10:07:00.000000',54,2,2,3),(36,'2019-04-18 09:53:00.000000','2019-04-18 10:05:00.000000',13,1,1,2),(37,'2019-04-18 10:20:00.000000','2019-04-18 10:43:00.000000',65,2,2,3),(38,'2019-04-18 12:36:00.000000','2019-04-18 13:03:00.000000',30,1,1,3),(39,'2019-04-18 17:30:00.000000','2019-04-18 17:50:00.000000',57,2,2,1),(40,'2019-04-19 10:39:00.000000','2019-04-19 10:45:00.000000',17,2,2,1),(41,'2019-04-19 11:44:00.000000','2019-04-19 12:06:00.000000',24,1,1,2),(42,'2019-04-19 14:08:00.000000','2019-04-19 14:22:00.000000',15,1,1,1),(43,'2019-04-22 09:20:00.000000','2019-04-22 09:46:00.000000',74,2,2,3),(44,'2019-04-22 09:48:00.000000','2019-04-22 10:02:00.000000',40,2,2,2),(45,'2019-04-22 11:23:00.000000','2019-04-22 11:24:00.000000',1,1,1,2),(46,'2019-04-22 12:47:00.000000','2019-04-22 13:11:00.000000',68,2,2,3),(47,'2019-04-22 14:37:00.000000','2019-04-22 15:06:00.000000',82,2,2,2),(48,'2019-04-22 16:02:00.000000','2019-04-22 16:11:00.000000',10,1,1,1),(49,'2019-04-23 09:01:00.000000','2019-04-23 09:30:00.000000',32,1,1,3),(50,'2019-04-23 11:59:00.000000','2019-04-23 12:05:00.000000',7,1,1,2),(51,'2019-04-23 12:27:00.000000','2019-04-23 12:43:00.000000',18,1,1,1),(52,'2019-04-23 12:34:00.000000','2019-04-23 12:43:00.000000',26,2,2,1),(53,'2019-04-23 14:33:00.000000','2019-04-23 14:45:00.000000',13,1,1,2),(54,'2019-04-23 17:37:00.000000','2019-04-23 17:53:00.000000',18,1,1,1),(55,'2019-04-23 17:45:00.000000','2019-04-23 17:57:00.000000',34,2,2,3),(56,'2019-04-24 09:42:00.000000','2019-04-24 09:57:00.000000',43,2,2,3),(57,'2019-04-24 13:12:00.000000','2019-04-24 13:33:00.000000',60,2,2,2),(58,'2019-04-24 14:59:00.000000','2019-04-24 15:20:00.000000',60,2,2,3),(59,'2019-04-24 16:27:00.000000','2019-04-24 16:37:00.000000',11,1,1,3),(60,'2019-04-25 09:58:00.000000','2019-04-25 10:22:00.000000',68,2,2,1),(61,'2019-04-25 13:11:00.000000','2019-04-25 13:31:00.000000',57,2,2,1),(62,'2019-04-25 13:16:00.000000','2019-04-25 13:39:00.000000',25,1,1,3),(63,'2019-04-25 14:17:00.000000','2019-04-25 14:35:00.000000',20,1,1,2),(64,'2019-04-25 16:22:00.000000','2019-04-25 16:31:00.000000',26,2,2,1),(65,'2019-04-25 17:13:00.000000','2019-04-25 17:16:00.000000',9,2,2,3),(66,'2019-04-26 10:21:00.000000','2019-04-26 10:25:00.000000',4,1,1,2),(67,'2019-04-26 12:23:00.000000','2019-04-26 12:33:00.000000',28,2,2,2),(68,'2019-04-26 16:30:00.000000','2019-04-26 16:43:00.000000',14,1,1,2),(69,'2019-04-26 16:37:00.000000','2019-04-26 16:50:00.000000',14,1,1,1),(70,'2019-04-29 12:07:00.000000','2019-04-29 12:11:00.000000',11,2,2,3),(71,'2019-04-29 12:44:00.000000','2019-04-29 12:55:00.000000',31,2,2,1),(72,'2019-04-29 15:13:00.000000','2019-04-29 15:14:00.000000',1,1,1,3),(73,'2019-04-30 09:19:00.000000','2019-04-30 09:33:00.000000',15,1,1,2),(74,'2019-04-30 09:34:00.000000','2019-04-30 09:56:00.000000',24,1,1,3),(75,'2019-04-30 10:23:00.000000','2019-04-30 10:52:00.000000',82,2,2,2),(76,'2019-04-30 12:35:00.000000','2019-04-30 12:36:00.000000',1,1,1,1),(77,'2019-04-30 15:40:00.000000','2019-04-30 15:52:00.000000',34,2,2,1),(78,'2019-05-01 12:58:00.000000','2019-05-01 13:16:00.000000',20,1,1,2),(79,'2019-05-01 15:29:00.000000','2019-05-01 15:51:00.000000',62,2,2,1),(80,'2019-05-02 10:07:00.000000','2019-05-02 10:30:00.000000',65,2,2,3),(81,'2019-05-02 10:39:00.000000','2019-05-02 10:43:00.000000',4,1,1,3),(82,'2019-05-02 13:07:00.000000','2019-05-02 13:37:00.000000',33,1,1,3),(83,'2019-05-02 13:46:00.000000','2019-05-02 13:47:00.000000',3,2,2,2),(84,'2019-05-02 16:12:00.000000','2019-05-02 16:22:00.000000',28,2,2,2),(85,'2019-05-02 16:35:00.000000','2019-05-02 17:03:00.000000',79,2,2,1),(86,'2019-05-03 11:57:00.000000','2019-05-03 12:19:00.000000',24,1,1,3),(87,'2019-05-03 13:49:00.000000','2019-05-03 13:58:00.000000',26,2,2,3),(88,'2019-05-03 14:42:00.000000','2019-05-03 14:43:00.000000',1,1,1,3),(89,'2019-05-03 16:45:00.000000','2019-05-03 17:01:00.000000',18,1,1,1),(90,'2019-05-06 10:18:00.000000','2019-05-06 10:34:00.000000',45,2,2,1),(91,'2019-05-06 10:26:00.000000','2019-05-06 10:39:00.000000',37,2,2,1),(92,'2019-05-06 11:37:00.000000','2019-05-06 12:01:00.000000',26,1,1,1),(93,'2019-05-06 12:19:00.000000','2019-05-06 12:26:00.000000',20,2,2,3),(94,'2019-05-06 12:41:00.000000','2019-05-06 12:52:00.000000',31,2,2,3),(95,'2019-05-06 13:34:00.000000','2019-05-06 14:02:00.000000',79,2,2,3),(96,'2019-05-06 14:41:00.000000','2019-05-06 14:55:00.000000',15,1,1,3),(97,'2019-05-06 15:03:00.000000','2019-05-06 15:05:00.000000',2,1,1,2),(98,'2019-05-07 13:26:00.000000','2019-05-07 13:27:00.000000',3,2,2,2),(99,'2019-05-07 15:38:00.000000','2019-05-07 15:56:00.000000',51,2,2,1),(100,'2019-05-07 17:14:00.000000','2019-05-07 17:22:00.000000',9,1,1,3),(101,'2019-05-07 17:21:00.000000','2019-05-07 17:34:00.000000',14,1,1,3),(102,'2019-05-08 11:36:00.000000','2019-05-08 11:43:00.000000',20,2,2,3),(103,'2019-05-08 12:29:00.000000','2019-05-08 12:43:00.000000',40,2,2,2),(104,'2019-05-08 12:37:00.000000','2019-05-08 12:59:00.000000',62,2,2,3),(105,'2019-05-08 13:24:00.000000','2019-05-08 13:30:00.000000',7,1,1,2),(106,'2019-05-08 14:18:00.000000','2019-05-08 14:48:00.000000',85,2,2,3),(107,'2019-05-08 15:35:00.000000','2019-05-08 15:47:00.000000',13,1,1,2),(108,'2019-05-09 09:48:00.000000','2019-05-09 10:17:00.000000',82,2,2,3),(109,'2019-05-09 13:43:00.000000','2019-05-09 14:00:00.000000',19,1,1,1),(110,'2019-05-09 13:52:00.000000','2019-05-09 14:06:00.000000',40,2,2,3),(111,'2019-05-10 11:30:00.000000','2019-05-10 11:53:00.000000',25,1,1,3),(112,'2019-05-10 12:23:00.000000','2019-05-10 12:32:00.000000',10,1,1,2),(113,'2019-05-10 13:36:00.000000','2019-05-10 13:52:00.000000',45,2,2,2),(114,'2019-05-10 14:32:00.000000','2019-05-10 14:38:00.000000',17,2,2,1),(115,'2019-05-10 14:52:00.000000','2019-05-10 15:19:00.000000',77,2,2,2),(116,'2019-05-10 16:04:00.000000','2019-05-10 16:29:00.000000',28,1,1,1),(117,'2019-05-10 16:20:00.000000','2019-05-10 16:45:00.000000',28,1,1,1),(118,'2019-05-10 17:45:00.000000','2019-05-10 18:07:00.000000',62,2,2,2),(119,'2019-05-13 09:30:00.000000','2019-05-13 09:31:00.000000',3,2,2,1),(120,'2019-05-13 10:49:00.000000','2019-05-13 11:05:00.000000',45,2,2,2),(121,'2019-05-13 11:58:00.000000','2019-05-13 12:22:00.000000',26,1,1,2),(122,'2019-05-13 16:07:00.000000','2019-05-13 16:21:00.000000',40,2,2,3),(123,'2019-05-13 16:34:00.000000','2019-05-13 17:03:00.000000',32,1,1,2),(124,'2019-05-13 17:05:00.000000','2019-05-13 17:25:00.000000',22,1,1,1),(125,'2019-05-14 10:37:00.000000','2019-05-14 10:38:00.000000',3,2,2,3),(126,'2019-05-14 14:46:00.000000','2019-05-14 15:01:00.000000',17,1,1,1),(127,'2019-05-14 15:49:00.000000','2019-05-14 16:10:00.000000',23,1,1,2),(128,'2019-05-14 16:19:00.000000','2019-05-14 16:25:00.000000',7,1,1,3),(129,'2019-05-14 17:14:00.000000','2019-05-14 17:40:00.000000',74,2,2,2),(130,'2019-05-14 17:26:00.000000','2019-05-14 17:29:00.000000',9,2,2,3),(131,'2019-05-15 09:06:00.000000','2019-05-15 09:25:00.000000',21,1,1,3),(132,'2019-05-15 10:34:00.000000','2019-05-15 10:35:00.000000',1,1,1,1),(133,'2019-05-15 11:34:00.000000','2019-05-15 11:57:00.000000',25,1,1,3),(134,'2019-05-15 17:16:00.000000','2019-05-15 17:46:00.000000',85,2,2,2),(135,'2019-05-15 17:54:00.000000','2019-05-15 18:02:00.000000',23,2,2,1),(136,'2019-05-16 10:11:00.000000','2019-05-16 10:37:00.000000',29,1,1,1),(137,'2019-05-16 12:58:00.000000','2019-05-16 13:00:00.000000',6,2,2,1),(138,'2019-05-16 17:35:00.000000','2019-05-16 18:02:00.000000',30,1,1,2),(139,'2019-05-17 09:30:00.000000','2019-05-17 09:39:00.000000',26,2,2,1),(140,'2019-05-17 15:15:00.000000','2019-05-17 15:43:00.000000',79,2,2,1),(141,'2019-05-17 16:14:00.000000','2019-05-17 16:23:00.000000',26,2,2,3),(142,'2019-05-17 17:16:00.000000','2019-05-17 17:36:00.000000',57,2,2,3),(143,'2019-05-20 09:06:00.000000','2019-05-20 09:09:00.000000',9,2,2,2),(144,'2019-05-20 11:16:00.000000','2019-05-20 11:30:00.000000',15,1,1,1),(145,'2019-05-20 12:41:00.000000','2019-05-20 12:49:00.000000',23,2,2,2),(146,'2019-05-20 14:34:00.000000','2019-05-20 14:35:00.000000',1,1,1,3),(147,'2019-05-21 09:01:00.000000','2019-05-21 09:03:00.000000',6,2,2,1),(148,'2019-05-21 13:46:00.000000','2019-05-21 13:54:00.000000',9,1,1,2),(149,'2019-05-21 16:24:00.000000','2019-05-21 16:51:00.000000',77,2,2,1),(150,'2019-05-22 09:13:00.000000','2019-05-22 09:26:00.000000',14,1,1,1),(151,'2019-05-22 12:12:00.000000','2019-05-22 12:38:00.000000',74,2,2,2),(152,'2019-05-22 13:59:00.000000','2019-05-22 14:20:00.000000',60,2,2,2),(153,'2019-05-22 15:25:00.000000','2019-05-22 15:33:00.000000',9,1,1,1),(154,'2019-05-22 15:52:00.000000','2019-05-22 16:15:00.000000',25,1,1,2),(155,'2019-05-22 17:30:00.000000','2019-05-22 17:45:00.000000',43,2,2,1),(156,'2019-05-23 10:17:00.000000','2019-05-23 10:46:00.000000',32,1,1,3),(157,'2019-05-23 11:19:00.000000','2019-05-23 11:44:00.000000',28,1,1,2),(158,'2019-05-23 11:33:00.000000','2019-05-23 12:00:00.000000',77,2,2,2),(159,'2019-05-23 12:06:00.000000','2019-05-23 12:17:00.000000',12,1,1,3),(160,'2019-05-23 12:16:00.000000','2019-05-23 12:17:00.000000',3,2,2,2),(161,'2019-05-23 12:38:00.000000','2019-05-23 12:45:00.000000',8,1,1,2),(162,'2019-05-23 12:58:00.000000','2019-05-23 13:17:00.000000',21,1,1,3),(163,'2019-05-23 14:55:00.000000','2019-05-23 15:17:00.000000',24,1,1,3),(164,'2019-05-23 15:15:00.000000','2019-05-23 15:32:00.000000',48,2,2,3),(165,'2019-05-24 09:23:00.000000','2019-05-24 09:33:00.000000',11,1,1,1),(166,'2019-05-24 15:40:00.000000','2019-05-24 15:47:00.000000',20,2,2,2),(167,'2019-05-24 17:34:00.000000','2019-05-24 17:54:00.000000',22,1,1,3),(168,'2019-05-27 10:27:00.000000','2019-05-27 10:55:00.000000',79,2,2,3),(169,'2019-05-27 10:57:00.000000','2019-05-27 11:18:00.000000',60,2,2,2),(170,'2019-05-27 12:01:00.000000','2019-05-27 12:27:00.000000',74,2,2,3),(171,'2019-05-27 13:01:00.000000','2019-05-27 13:13:00.000000',34,2,2,1),(172,'2019-05-27 13:21:00.000000','2019-05-27 13:39:00.000000',20,1,1,3),(173,'2019-05-27 15:11:00.000000','2019-05-27 15:15:00.000000',4,1,1,2),(174,'2019-05-27 17:42:00.000000','2019-05-27 17:46:00.000000',4,1,1,3),(175,'2019-05-28 10:03:00.000000','2019-05-28 10:19:00.000000',18,1,1,3),(176,'2019-05-28 10:23:00.000000','2019-05-28 10:40:00.000000',48,2,2,3),(177,'2019-05-28 11:26:00.000000','2019-05-28 11:44:00.000000',20,1,1,2),(178,'2019-05-28 12:15:00.000000','2019-05-28 12:31:00.000000',45,2,2,1),(179,'2019-05-28 14:07:00.000000','2019-05-28 14:28:00.000000',60,2,2,2),(180,'2019-05-28 15:01:00.000000','2019-05-28 15:21:00.000000',57,2,2,1),(181,'2019-05-28 15:25:00.000000','2019-05-28 15:37:00.000000',34,2,2,1),(182,'2019-05-29 09:39:00.000000','2019-05-29 09:56:00.000000',19,1,1,3),(183,'2019-05-29 10:10:00.000000','2019-05-29 10:31:00.000000',60,2,2,1),(184,'2019-05-29 10:29:00.000000','2019-05-29 10:42:00.000000',14,1,1,3),(185,'2019-05-29 10:35:00.000000','2019-05-29 10:53:00.000000',20,1,1,2),(186,'2019-05-29 10:37:00.000000','2019-05-29 10:41:00.000000',11,2,2,2),(187,'2019-05-29 11:36:00.000000','2019-05-29 11:46:00.000000',28,2,2,1),(188,'2019-05-29 11:43:00.000000','2019-05-29 12:00:00.000000',48,2,2,1),(189,'2019-05-29 13:36:00.000000','2019-05-29 13:50:00.000000',40,2,2,2),(190,'2019-05-29 14:42:00.000000','2019-05-29 15:12:00.000000',33,1,1,2),(191,'2019-05-29 15:18:00.000000','2019-05-29 15:22:00.000000',4,1,1,1),(192,'2019-05-29 15:25:00.000000','2019-05-29 15:46:00.000000',60,2,2,2),(193,'2019-05-29 16:13:00.000000','2019-05-29 16:27:00.000000',40,2,2,1),(194,'2019-05-29 16:27:00.000000','2019-05-29 16:42:00.000000',43,2,2,1),(195,'2019-05-29 16:43:00.000000','2019-05-29 16:48:00.000000',14,2,2,3),(196,'2019-05-29 17:06:00.000000','2019-05-29 17:18:00.000000',34,2,2,1),(197,'2019-06-10 10:39:00.000000','2019-06-10 10:45:00.000000',17,2,2,2),(198,'2019-06-10 10:57:00.000000','2019-06-10 11:06:00.000000',10,1,1,1),(199,'2019-06-10 17:14:00.000000','2019-06-10 17:19:00.000000',14,2,2,2),(200,'2019-06-11 09:01:00.000000','2019-06-11 09:28:00.000000',30,1,1,2),(201,'2019-06-11 09:19:00.000000','2019-06-11 09:42:00.000000',65,2,2,1),(202,'2019-06-11 09:19:00.000000','2019-06-11 09:48:00.000000',82,2,2,3),(203,'2019-06-11 09:50:00.000000','2019-06-11 10:19:00.000000',32,1,1,1),(204,'2019-06-11 10:39:00.000000','2019-06-11 10:52:00.000000',14,1,1,2),(205,'2019-06-11 10:52:00.000000','2019-06-11 11:18:00.000000',29,1,1,1),(206,'2019-06-11 11:40:00.000000','2019-06-11 11:54:00.000000',15,1,1,3),(207,'2019-06-11 12:30:00.000000','2019-06-11 12:37:00.000000',20,2,2,1),(208,'2019-06-11 12:41:00.000000','2019-06-11 12:59:00.000000',20,1,1,2),(209,'2019-06-11 12:58:00.000000','2019-06-11 13:20:00.000000',24,1,1,3),(210,'2019-06-11 13:30:00.000000','2019-06-11 13:48:00.000000',20,1,1,2),(211,'2019-06-11 14:29:00.000000','2019-06-11 14:36:00.000000',20,2,2,1),(212,'2019-06-11 17:14:00.000000','2019-06-11 17:17:00.000000',9,2,2,1),(213,'2019-06-12 10:12:00.000000','2019-06-12 10:37:00.000000',28,1,1,3),(214,'2019-06-12 14:24:00.000000','2019-06-12 14:31:00.000000',20,2,2,3),(215,'2019-06-12 14:36:00.000000','2019-06-12 14:43:00.000000',8,1,1,1),(216,'2019-06-12 14:49:00.000000','2019-06-12 14:52:00.000000',9,2,2,2),(217,'2019-06-12 15:29:00.000000','2019-06-12 15:58:00.000000',82,2,2,3),(218,'2019-06-13 09:29:00.000000','2019-06-13 09:52:00.000000',65,2,2,2),(219,'2019-06-13 09:30:00.000000','2019-06-13 10:00:00.000000',85,2,2,2),(220,'2019-06-13 09:56:00.000000','2019-06-13 10:21:00.000000',71,2,2,2),(221,'2019-06-13 13:27:00.000000','2019-06-13 13:46:00.000000',54,2,2,3),(222,'2019-06-13 13:27:00.000000','2019-06-13 13:53:00.000000',74,2,2,3),(223,'2019-06-13 14:12:00.000000','2019-06-13 14:13:00.000000',3,2,2,3),(224,'2019-06-13 15:02:00.000000','2019-06-13 15:26:00.000000',26,1,1,3),(225,'2019-06-14 09:45:00.000000','2019-06-14 10:03:00.000000',20,1,1,1),(226,'2019-06-14 09:57:00.000000','2019-06-14 10:00:00.000000',9,2,2,1),(227,'2019-06-14 10:52:00.000000','2019-06-14 11:11:00.000000',21,1,1,1),(228,'2019-06-14 12:14:00.000000','2019-06-14 12:35:00.000000',60,2,2,2),(229,'2019-06-14 12:36:00.000000','2019-06-14 12:49:00.000000',37,2,2,1),(230,'2019-06-14 12:51:00.000000','2019-06-14 12:52:00.000000',3,2,2,3),(231,'2019-06-14 15:02:00.000000','2019-06-14 15:19:00.000000',48,2,2,3),(232,'2019-06-14 15:45:00.000000','2019-06-14 16:13:00.000000',79,2,2,2),(233,'2019-06-14 16:30:00.000000','2019-06-14 16:40:00.000000',11,1,1,2),(234,'2019-06-14 17:25:00.000000','2019-06-14 17:31:00.000000',17,2,2,1),(235,'2019-06-18 02:59:05.771911','2019-06-18 02:59:56.759249',0,1,1,3),(236,'2019-06-18 03:00:27.507496','2019-06-18 03:03:20.167683',0,2,2,2),(237,'2019-06-18 03:10:12.578064','2019-06-18 03:10:35.196058',1,2,2,10);
/*!40000 ALTER TABLE `usages_usage` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-25 22:49:19
