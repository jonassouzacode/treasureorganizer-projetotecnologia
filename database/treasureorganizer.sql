-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: treasureorganizer
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `accounts_utilizador`
--

DROP TABLE IF EXISTS `accounts_utilizador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_utilizador` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `role` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_utilizador`
--

LOCK TABLES `accounts_utilizador` WRITE;
/*!40000 ALTER TABLE `accounts_utilizador` DISABLE KEYS */;
INSERT INTO `accounts_utilizador` VALUES (1,'pbkdf2_sha256$1200000$SEFcej47StFjtfCsq91DTP$qpJs9R05KL18sIXBP/m7KaYn27wdliNKiqpOWhDbtME=','2026-05-08 20:12:01.036435',1,'JonasAdmin','','','jonasadmin@gmail.com',1,1,'2026-04-29 08:38:30.126645','admin'),(3,'pbkdf2_sha256$1200000$zde8KFJXd6ULaLJaBDK9kw$zKEyRbCvJSLPOiv4hg6VxoBkaPliiDCnXkbUu2+bBA4=','2026-05-08 20:12:44.510505',0,'user1','','','',0,1,'2026-04-29 08:42:15.633100','user'),(4,'pbkdf2_sha256$1200000$JFNoRd3yH2hbd2NbokaSDt$b8hcH8z5egRNgyYSNpL/gYq/sfDXsxHyBW5Gjczp4sw=','2026-05-08 10:05:46.362932',0,'user2','','','',0,1,'2026-04-29 08:42:16.697907','user');
/*!40000 ALTER TABLE `accounts_utilizador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_utilizador_groups`
--

DROP TABLE IF EXISTS `accounts_utilizador_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_utilizador_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `utilizador_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_utilizador_groups_utilizador_id_group_id_f3447f18_uniq` (`utilizador_id`,`group_id`),
  KEY `accounts_utilizador_groups_group_id_7820a73f_fk_auth_group_id` (`group_id`),
  CONSTRAINT `accounts_utilizador__utilizador_id_001b3cd7_fk_accounts_` FOREIGN KEY (`utilizador_id`) REFERENCES `accounts_utilizador` (`id`),
  CONSTRAINT `accounts_utilizador_groups_group_id_7820a73f_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_utilizador_groups`
--

LOCK TABLES `accounts_utilizador_groups` WRITE;
/*!40000 ALTER TABLE `accounts_utilizador_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_utilizador_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_utilizador_user_permissions`
--

DROP TABLE IF EXISTS `accounts_utilizador_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_utilizador_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `utilizador_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_utilizador_user_utilizador_id_permission_a985c49b_uniq` (`utilizador_id`,`permission_id`),
  KEY `accounts_utilizador__permission_id_2dc2ad1a_fk_auth_perm` (`permission_id`),
  CONSTRAINT `accounts_utilizador__permission_id_2dc2ad1a_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `accounts_utilizador__utilizador_id_0f1b9880_fk_accounts_` FOREIGN KEY (`utilizador_id`) REFERENCES `accounts_utilizador` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_utilizador_user_permissions`
--

LOCK TABLES `accounts_utilizador_user_permissions` WRITE;
/*!40000 ALTER TABLE `accounts_utilizador_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_utilizador_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `album` (
  `id_colecionavel` int NOT NULL,
  `numero_catalogo` varchar(50) DEFAULT NULL,
  `ean_upc` varchar(50) DEFAULT NULL,
  `tipo_album` enum('CD','Vinil') NOT NULL,
  `id_gravadora` int DEFAULT NULL,
  PRIMARY KEY (`id_colecionavel`),
  KEY `id_gravadora` (`id_gravadora`),
  CONSTRAINT `album_ibfk_1` FOREIGN KEY (`id_colecionavel`) REFERENCES `colecionavel` (`id`),
  CONSTRAINT `album_ibfk_2` FOREIGN KEY (`id_gravadora`) REFERENCES `gravadora` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
INSERT INTO `album` VALUES (34,'SHVL 804',NULL,'Vinil',11),(36,NULL,'074643811224','CD',12),(38,NULL,'5099751076512','Vinil',5),(41,'PCS 7088',NULL,'Vinil',14),(43,NULL,'888837168617','Vinil',3),(46,NULL,'720642442529','CD',NULL),(48,'BSK 3010',NULL,'Vinil',15),(50,'634904052324',NULL,'CD',16),(53,'SHDW 411',NULL,'Vinil',11),(55,NULL,'887828031915','Vinil',8);
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `album_artista`
--

DROP TABLE IF EXISTS `album_artista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `album_artista` (
  `id_colecionavel` int NOT NULL,
  `id_artista` int NOT NULL,
  PRIMARY KEY (`id_colecionavel`,`id_artista`),
  KEY `id_artista` (`id_artista`),
  CONSTRAINT `album_artista_ibfk_1` FOREIGN KEY (`id_colecionavel`) REFERENCES `colecionavel` (`id`),
  CONSTRAINT `album_artista_ibfk_2` FOREIGN KEY (`id_artista`) REFERENCES `artista` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album_artista`
--

LOCK TABLES `album_artista` WRITE;
/*!40000 ALTER TABLE `album_artista` DISABLE KEYS */;
INSERT INTO `album_artista` VALUES (55,6),(34,10),(53,10),(36,11),(38,12),(41,13),(43,14),(46,15),(50,16),(48,17);
/*!40000 ALTER TABLE `album_artista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artista`
--

DROP TABLE IF EXISTS `artista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artista` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artista`
--

LOCK TABLES `artista` WRITE;
/*!40000 ALTER TABLE `artista` DISABLE KEYS */;
INSERT INTO `artista` VALUES (1,'Anavitoria'),(2,'Terno Rei'),(3,'Tame Impala'),(4,'Sabrina Carpenter'),(5,'Melanie Martinez'),(6,'Artic Monkeys'),(7,'Lana Del Rey'),(8,'Artic Veins'),(9,'Valerie Monroe'),(10,'Pink Floyd'),(11,'Michael Jackson'),(12,'AC/DC'),(13,'The Beatles'),(14,'Daft Punk'),(15,'Nirvana'),(16,'Adele'),(17,'Fleetwood Mac'),(18,'Linkin Park');
/*!40000 ALTER TABLE `artista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',3,'add_permission'),(6,'Can change permission',3,'change_permission'),(7,'Can delete permission',3,'delete_permission'),(8,'Can view permission',3,'view_permission'),(9,'Can add group',2,'add_group'),(10,'Can change group',2,'change_group'),(11,'Can delete group',2,'delete_group'),(12,'Can view group',2,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_utilizador'),(22,'Can change user',6,'change_utilizador'),(23,'Can delete user',6,'delete_utilizador'),(24,'Can view user',6,'view_utilizador'),(25,'Can add album artista',8,'add_albumartista'),(26,'Can change album artista',8,'change_albumartista'),(27,'Can delete album artista',8,'delete_albumartista'),(28,'Can view album artista',8,'view_albumartista'),(29,'Can add colecao',9,'add_colecao'),(30,'Can change colecao',9,'change_colecao'),(31,'Can delete colecao',9,'delete_colecao'),(32,'Can view colecao',9,'view_colecao'),(33,'Can add lista desejos',11,'add_listadesejos'),(34,'Can change lista desejos',11,'change_listadesejos'),(35,'Can delete lista desejos',11,'delete_listadesejos'),(36,'Can view lista desejos',11,'view_listadesejos'),(37,'Can add livros autor',13,'add_livrosautor'),(38,'Can change livros autor',13,'change_livrosautor'),(39,'Can delete livros autor',13,'delete_livrosautor'),(40,'Can view livros autor',13,'view_livrosautor'),(41,'Can add colecionavel',10,'add_colecionavel'),(42,'Can change colecionavel',10,'change_colecionavel'),(43,'Can delete colecionavel',10,'delete_colecionavel'),(44,'Can view colecionavel',10,'view_colecionavel'),(45,'Can add livro',12,'add_livro'),(46,'Can change livro',12,'change_livro'),(47,'Can delete livro',12,'delete_livro'),(48,'Can view livro',12,'view_livro'),(49,'Can add album',7,'add_album'),(50,'Can change album',7,'change_album'),(51,'Can delete album',7,'delete_album'),(52,'Can view album',7,'view_album'),(53,'Can add artista',14,'add_artista'),(54,'Can change artista',14,'change_artista'),(55,'Can delete artista',14,'delete_artista'),(56,'Can view artista',14,'view_artista'),(57,'Can add autor',15,'add_autor'),(58,'Can change autor',15,'change_autor'),(59,'Can delete autor',15,'delete_autor'),(60,'Can view autor',15,'view_autor'),(61,'Can add editora',16,'add_editora'),(62,'Can change editora',16,'change_editora'),(63,'Can delete editora',16,'delete_editora'),(64,'Can view editora',16,'view_editora'),(65,'Can add encadernacao',17,'add_encadernacao'),(66,'Can change encadernacao',17,'change_encadernacao'),(67,'Can delete encadernacao',17,'delete_encadernacao'),(68,'Can view encadernacao',17,'view_encadernacao'),(69,'Can add genero',18,'add_genero'),(70,'Can change genero',18,'change_genero'),(71,'Can delete genero',18,'delete_genero'),(72,'Can view genero',18,'view_genero'),(73,'Can add gravadora',19,'add_gravadora'),(74,'Can change gravadora',19,'change_gravadora'),(75,'Can delete gravadora',19,'delete_gravadora'),(76,'Can view gravadora',19,'view_gravadora'),(77,'Can add idioma',20,'add_idioma'),(78,'Can change idioma',20,'change_idioma'),(79,'Can delete idioma',20,'delete_idioma'),(80,'Can view idioma',20,'view_idioma');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autor`
--

DROP TABLE IF EXISTS `autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autor`
--

LOCK TABLES `autor` WRITE;
/*!40000 ALTER TABLE `autor` DISABLE KEYS */;
INSERT INTO `autor` VALUES (1,'Stephanie Garber'),(2,'Sarah J. Maas'),(3,'Mark Oshiro'),(4,'Rick Riordan'),(5,'Genevieve Valentine'),(6,'Clare Vanderpool'),(7,'Antoine de Saint-Exupéry'),(8,'Michael R. Whitaker'),(9,'Holly Black'),(10,'George Orwell'),(11,'Machado de Assis'),(12,'J.R.R Tolkien'),(13,'Frank Herbert'),(14,'William Gibson'),(15,'Patrick Rothfuss'),(16,'J.K. Rowling'),(17,'Stephen King'),(18,'Bram Stoker'),(19,'Isaac Asimov'),(20,'Cormac McCarthy'),(21,'Neil Gaiman'),(22,'Terry Pratchett'),(23,'Haruki Murakami');
/*!40000 ALTER TABLE `autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colecao`
--

DROP TABLE IF EXISTS `colecao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `colecao` (
  `id_usuario` int NOT NULL,
  `id_colecionavel` int NOT NULL,
  `data_aquisicao` date DEFAULT NULL,
  PRIMARY KEY (`id_usuario`,`id_colecionavel`),
  KEY `id_colecionavel` (`id_colecionavel`),
  CONSTRAINT `colecao_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`),
  CONSTRAINT `colecao_ibfk_2` FOREIGN KEY (`id_colecionavel`) REFERENCES `colecionavel` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colecao`
--

LOCK TABLES `colecao` WRITE;
/*!40000 ALTER TABLE `colecao` DISABLE KEYS */;
INSERT INTO `colecao` VALUES (3,34,'2021-07-05'),(3,35,'2023-01-20'),(3,36,'2020-11-11'),(3,37,'2022-09-18'),(3,38,'2021-02-22'),(3,39,'2023-06-03'),(3,40,'2026-05-08'),(3,41,'2026-05-08'),(3,44,'2026-05-08'),(3,65,'2024-08-27'),(4,45,'2021-04-10'),(4,46,'2020-08-15'),(4,47,'2022-05-05'),(4,48,'2021-12-12'),(4,49,'2023-10-01'),(4,50,'2022-07-19'),(4,51,'2020-12-25');
/*!40000 ALTER TABLE `colecao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colecionavel`
--

DROP TABLE IF EXISTS `colecionavel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `colecionavel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo_colecionavel` enum('Livro','Album') NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `ano_lançamento` int DEFAULT NULL,
  `id_genero` int DEFAULT NULL,
  `id_idioma` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_genero` (`id_genero`),
  KEY `id_idioma` (`id_idioma`),
  CONSTRAINT `colecionavel_ibfk_1` FOREIGN KEY (`id_genero`) REFERENCES `genero` (`id`),
  CONSTRAINT `colecionavel_ibfk_2` FOREIGN KEY (`id_idioma`) REFERENCES `idioma` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colecionavel`
--

LOCK TABLES `colecionavel` WRITE;
/*!40000 ALTER TABLE `colecionavel` DISABLE KEYS */;
INSERT INTO `colecionavel` VALUES (31,'Livro','Livro1',2010,8,3),(32,'Livro','Livro2',2015,4,4),(33,'Livro','1984',1949,16,2),(34,'Album','The Dark Side of the Moon',1973,17,2),(35,'Livro','Dom Casmurro',1899,3,1),(36,'Album','Thriller',1982,13,2),(37,'Livro','O Hobbit',1937,2,1),(38,'Album','Back in Black',1980,18,2),(39,'Livro','A Revolução dos Bichos',1945,19,1),(40,'Livro','Duna',1965,1,2),(41,'Album','Abbey Road',1969,20,2),(42,'Livro','Neuromancer',1984,21,2),(43,'Album','Random Access Memories',2013,22,2),(44,'Livro','O Nome do Vento',2007,2,1),(45,'Livro','Harry Potter e a Pedra Filosofal',1997,2,1),(46,'Album','Nevermind',1991,23,2),(47,'Livro','O Alquimista',1988,24,1),(48,'Album','Rumours',1977,20,2),(49,'Livro','It - A Coisa',1986,5,1),(50,'Album','21',2011,13,2),(51,'Livro','O Senhor dos Anéis: A Sociedade do Anel',1954,2,1),(52,'Livro','Drácula',1897,5,2),(53,'Album','The Wall',1979,17,2),(54,'Livro','Fundação',1951,1,1),(55,'Album','AM',2013,11,2),(56,'Livro','A Estrada',2006,26,1),(58,'Livro','dfgdgfg',2025,17,3),(65,'Livro','Good Omens',1990,2,2);
/*!40000 ALTER TABLE `colecionavel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_accounts_utilizador_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_accounts_utilizador_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_utilizador` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (6,'accounts','utilizador'),(1,'admin','logentry'),(2,'auth','group'),(3,'auth','permission'),(14,'catalogo','artista'),(15,'catalogo','autor'),(16,'catalogo','editora'),(17,'catalogo','encadernacao'),(18,'catalogo','genero'),(19,'catalogo','gravadora'),(20,'catalogo','idioma'),(7,'colecionaveis','album'),(8,'colecionaveis','albumartista'),(9,'colecionaveis','colecao'),(10,'colecionaveis','colecionavel'),(11,'colecionaveis','listadesejos'),(12,'colecionaveis','livro'),(13,'colecionaveis','livrosautor'),(4,'contenttypes','contenttype'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2026-04-28 09:25:19.939167'),(2,'contenttypes','0002_remove_content_type_name','2026-04-28 09:25:20.045089'),(3,'auth','0001_initial','2026-04-28 09:25:20.340182'),(4,'auth','0002_alter_permission_name_max_length','2026-04-28 09:25:20.406815'),(5,'auth','0003_alter_user_email_max_length','2026-04-28 09:25:20.415058'),(6,'auth','0004_alter_user_username_opts','2026-04-28 09:25:20.422907'),(7,'auth','0005_alter_user_last_login_null','2026-04-28 09:25:20.431468'),(8,'auth','0006_require_contenttypes_0002','2026-04-28 09:25:20.434253'),(9,'auth','0007_alter_validators_add_error_messages','2026-04-28 09:25:20.441954'),(10,'auth','0008_alter_user_username_max_length','2026-04-28 09:25:20.449779'),(11,'auth','0009_alter_user_last_name_max_length','2026-04-28 09:25:20.459170'),(12,'auth','0010_alter_group_name_max_length','2026-04-28 09:25:20.480152'),(13,'auth','0011_update_proxy_permissions','2026-04-28 09:25:20.488447'),(14,'auth','0012_alter_user_first_name_max_length','2026-04-28 09:25:20.496343'),(15,'accounts','0001_initial','2026-04-28 09:25:20.815241'),(16,'admin','0001_initial','2026-04-28 09:25:20.972250'),(17,'admin','0002_logentry_remove_auto_add','2026-04-28 09:25:20.982883'),(18,'admin','0003_logentry_add_action_flag_choices','2026-04-28 09:25:20.993806'),(19,'sessions','0001_initial','2026-04-28 09:25:21.035576'),(20,'catalogo','0001_initial','2026-05-04 08:14:02.811821'),(21,'colecionaveis','0001_initial','2026-05-04 08:14:02.824976');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('29l73v1xnqqq5r4sw35kkdkdvieooxhc','e30:1wI0a2:eGU1gcPdHjFVs21IwjrD92kY5IYxjZ4eaBYBJY3toek','2026-05-13 08:47:38.809940'),('379s4wuy74ui5u0qroodcyubxrnnw943','.eJxVjMsOgjAQAP9lz6ZxS1sWjt75hma3D4uaklA4Gf_dkHDQ68xk3uB534rfW1r9HGEEA5dfJhyeqR4iPrjeFxWWuq2zqCNRp21qWmJ63c72b1C4FRiBkkakIQ8JYxBiZxF707OxJOREo0ggFwxlkpw7JNNpDjo7qyM7vMLnC9xZN6k:1wKvxo:C6oAMtuuAWs4reyNQHYaEnOzvj50piW8WHPxILKwbhI','2026-05-21 10:28:16.596445'),('5wfr8fw9kfv2omgivrbhpxfsbcrt998k','.eJxVjEEOwiAQAP-yZ0MWqlB69O4byMIuUjWQlPZk_Ltp0oNeZybzhkDbWsLWZQkzwwQDnH5ZpPSUugt-UL03lVpdlzmqPVGH7erWWF7Xo_0bFOoFJvCkydgkOcoFs6BHRpvR-rNB50jbxMlZZnaDZ3Gko2GkcWQylrzX8PkC-eI4Xg:1wLIsl:8qw4hNkZ1jCFT2XZaboe5vxHtv8XRcXu1ndVbQYEzSA','2026-05-22 10:56:35.002249'),('bavakkudd4ys11ivclo0fm4j6wm27b85','e30:1wI0bt:ythXLaonzDV_5er9i4x9Ys4G2G5KhKRUxI1KhKlAUJI','2026-05-13 08:49:33.080410'),('fs1r7zc54ah5vml1xnfvc3adr1i1wbbm','.eJxVjEEOwiAQAP-yZ0MoCwV69O4bmoUFqRpISnsy_t006UGvM5N5w0z7Vua9p3VeGCYY4PLLAsVnqofgB9V7E7HVbV2COBJx2i5ujdPrerZ_g0K9wATBOiM1svEJA9mMzpmMnp2Mg2WXBz0yJhNG9kZ6bRVKGdFEsjErRRo-X86MN04:1wIPiI:1iN0KUDxTVeDW1YholK2fDn6wF3dTpq2IQ2yVdd0n20','2026-05-14 11:37:50.024488'),('p09su0lxzv4r2h8sd4i7lyssuwv7b05f','e30:1wI0a9:lKGK0upW43pGfutIluJGgpZxtNRvHTaLUT4De46PqrE','2026-05-13 08:47:45.960530');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editora`
--

DROP TABLE IF EXISTS `editora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `editora` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editora`
--

LOCK TABLES `editora` WRITE;
/*!40000 ALTER TABLE `editora` DISABLE KEYS */;
INSERT INTO `editora` VALUES (1,'Hodder & Stoughton'),(2,'Galera'),(3,'Disney-Hyperion'),(4,'Darkside'),(5,'Mondadori'),(6,'Harper Collins'),(7,'Secker & Warburg'),(8,'Garnier'),(9,'Companhia das Letras'),(10,'Chilton Books'),(11,'Ace Books'),(12,'Arqueiro'),(13,'Rocco'),(14,'DGC Records'),(15,'Suma'),(16,'Martins Fontes'),(17,'Archibald Constable'),(18,'Gnome Press'),(19,'Knopf'),(20,'Workman Publishing'),(21,'Alfaguara');
/*!40000 ALTER TABLE `editora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encadernacao`
--

DROP TABLE IF EXISTS `encadernacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `encadernacao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `tipo_encadernacao` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encadernacao`
--

LOCK TABLES `encadernacao` WRITE;
/*!40000 ALTER TABLE `encadernacao` DISABLE KEYS */;
INSERT INTO `encadernacao` VALUES (1,'Capa Dura','CD'),(2,'Capa Mole','CM'),(3,'Capa Dura de Tecido','capa_dura'),(4,'Capa Mole Costurada','capa_mole');
/*!40000 ALTER TABLE `encadernacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genero` (
  `id` int NOT NULL AUTO_INCREMENT,
  `genero` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` VALUES (1,'Ficção Científica'),(2,'Fantasia'),(3,'Romance'),(4,'Realismo Mágico'),(5,'Terror'),(6,'Aventura'),(7,'Drama'),(8,'Suspense'),(9,'Ficção'),(10,'MPB'),(11,'Rock Alternativo'),(12,'Pop Alternativo'),(13,'Pop'),(14,'Pop Psicodélico'),(16,'Distopia'),(17,'Rock Progressivo'),(18,'Hard Rock'),(19,'Sátira Política'),(20,'Rock'),(21,'Cyberpunk'),(22,'Eletrônica'),(23,'Grunge'),(24,'Ficção Filosófica'),(25,'Indie Rock'),(26,'Pós-apocalíptico');
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gravadora`
--

DROP TABLE IF EXISTS `gravadora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gravadora` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gravadora`
--

LOCK TABLES `gravadora` WRITE;
/*!40000 ALTER TABLE `gravadora` DISABLE KEYS */;
INSERT INTO `gravadora` VALUES (1,'F/Simas'),(2,'Balaclava'),(3,'Columbia Records'),(4,'Island Records'),(5,'Atlantic Records'),(6,'Interscope Records'),(7,'Fiction Records'),(8,'Domino Records'),(9,'Vertigo Berlin'),(10,'Capitol Records'),(11,'Harvest Records'),(12,'Epic Records'),(14,'Apple Records'),(15,'Warner Bros.'),(16,'XL Recordings'),(17,'Modular Recordings'),(18,'Warner Records');
/*!40000 ALTER TABLE `gravadora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idioma`
--

DROP TABLE IF EXISTS `idioma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `idioma` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idioma` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idioma`
--

LOCK TABLES `idioma` WRITE;
/*!40000 ALTER TABLE `idioma` DISABLE KEYS */;
INSERT INTO `idioma` VALUES (1,'Português'),(2,'Inglês'),(3,'Espanhol'),(4,'Francês'),(5,'Japonês'),(6,'Italiano');
/*!40000 ALTER TABLE `idioma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lista_desejos`
--

DROP TABLE IF EXISTS `lista_desejos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lista_desejos` (
  `id_usuario` int NOT NULL,
  `id_colecionavel` int NOT NULL,
  `data_adicao` date DEFAULT NULL,
  PRIMARY KEY (`id_usuario`,`id_colecionavel`),
  KEY `id_colecionavel` (`id_colecionavel`),
  CONSTRAINT `lista_desejos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`),
  CONSTRAINT `lista_desejos_ibfk_2` FOREIGN KEY (`id_colecionavel`) REFERENCES `colecionavel` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lista_desejos`
--

LOCK TABLES `lista_desejos` WRITE;
/*!40000 ALTER TABLE `lista_desejos` DISABLE KEYS */;
INSERT INTO `lista_desejos` VALUES (3,42,NULL),(3,43,NULL),(4,52,NULL),(4,53,NULL),(4,54,NULL),(4,55,NULL),(4,56,NULL);
/*!40000 ALTER TABLE `lista_desejos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livro`
--

DROP TABLE IF EXISTS `livro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `livro` (
  `id_colecionavel` int NOT NULL,
  `isbn` varchar(13) NOT NULL,
  `id_tipo_encadernacao` int DEFAULT NULL,
  `id_editora` int DEFAULT NULL,
  PRIMARY KEY (`id_colecionavel`),
  UNIQUE KEY `isbn` (`isbn`),
  KEY `id_tipo_encadernacao` (`id_tipo_encadernacao`),
  KEY `id_editora` (`id_editora`),
  CONSTRAINT `livro_ibfk_1` FOREIGN KEY (`id_colecionavel`) REFERENCES `colecionavel` (`id`),
  CONSTRAINT `livro_ibfk_2` FOREIGN KEY (`id_tipo_encadernacao`) REFERENCES `encadernacao` (`id`),
  CONSTRAINT `livro_ibfk_3` FOREIGN KEY (`id_editora`) REFERENCES `editora` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livro`
--

LOCK TABLES `livro` WRITE;
/*!40000 ALTER TABLE `livro` DISABLE KEYS */;
INSERT INTO `livro` VALUES (31,'9783125623207',1,5),(32,'9714827323207',2,3),(33,'9780452284234',1,7),(35,'9788535902775',2,8),(37,'9788525432543',3,6),(39,'9788580860917',2,9),(40,'9780441172719',1,10),(42,'9780441569564',2,11),(44,'9788580410372',1,12),(45,'9788532511010',1,13),(47,'9788532512345',2,13),(49,'9788532556789',2,15),(51,'9788533613459',1,16),(52,'9780141439846',3,17),(54,'9788574123456',2,18),(56,'9780307387899',1,19),(65,'9780575048006',3,20);
/*!40000 ALTER TABLE `livro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livros_autor`
--

DROP TABLE IF EXISTS `livros_autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `livros_autor` (
  `isbn` varchar(13) NOT NULL,
  `id_autor` int NOT NULL,
  PRIMARY KEY (`isbn`,`id_autor`),
  KEY `id_autor` (`id_autor`),
  CONSTRAINT `livros_autor_ibfk_2` FOREIGN KEY (`id_autor`) REFERENCES `autor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livros_autor`
--

LOCK TABLES `livros_autor` WRITE;
/*!40000 ALTER TABLE `livros_autor` DISABLE KEYS */;
INSERT INTO `livros_autor` VALUES ('9783125623207',3),('9714827323207',4),('9780452284234',10),('9788580860917',10),('9788535902775',11),('9788525432543',12),('9788533613459',12),('',13),('9780441172719',13),('9780441569564',14),('9788580410372',15),('9788532511010',16),('9788532556789',17),('9780141439846',18),('9788574123456',19),('9780307387899',20),('9780575048006',21),('9780575048006',22);
/*!40000 ALTER TABLE `livros_autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'JonasAdmin','jonasadmin@email.com','placeholder'),(3,'user1','user1@email.com','placeholder'),(4,'user2','user2@email.com','placeholder');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-08 23:31:55
