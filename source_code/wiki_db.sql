-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: 10.0.0.200    Database: 
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
-- Current Database: `my_wiki`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `my_wiki` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `my_wiki`;

--
-- Table structure for table `actor`
--

DROP TABLE IF EXISTS `actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actor` (
  `actor_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `actor_user` int(10) unsigned DEFAULT NULL,
  `actor_name` varbinary(255) NOT NULL,
  PRIMARY KEY (`actor_id`),
  UNIQUE KEY `actor_name` (`actor_name`),
  UNIQUE KEY `actor_user` (`actor_user`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor`
--

LOCK TABLES `actor` WRITE;
/*!40000 ALTER TABLE `actor` DISABLE KEYS */;
/*!40000 ALTER TABLE `actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `archive`
--

DROP TABLE IF EXISTS `archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `archive` (
  `ar_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ar_namespace` int(11) NOT NULL DEFAULT '0',
  `ar_title` varbinary(255) NOT NULL DEFAULT '',
  `ar_comment` varbinary(767) NOT NULL DEFAULT '',
  `ar_comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `ar_user` int(10) unsigned NOT NULL DEFAULT '0',
  `ar_user_text` varbinary(255) NOT NULL DEFAULT '',
  `ar_actor` bigint(20) unsigned NOT NULL DEFAULT '0',
  `ar_timestamp` binary(14) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `ar_minor_edit` tinyint(4) NOT NULL DEFAULT '0',
  `ar_rev_id` int(10) unsigned NOT NULL,
  `ar_text_id` int(10) unsigned NOT NULL DEFAULT '0',
  `ar_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ar_len` int(10) unsigned DEFAULT NULL,
  `ar_page_id` int(10) unsigned DEFAULT NULL,
  `ar_parent_id` int(10) unsigned DEFAULT NULL,
  `ar_sha1` varbinary(32) NOT NULL DEFAULT '',
  `ar_content_model` varbinary(32) DEFAULT NULL,
  `ar_content_format` varbinary(64) DEFAULT NULL,
  PRIMARY KEY (`ar_id`),
  UNIQUE KEY `ar_revid_uniq` (`ar_rev_id`),
  KEY `name_title_timestamp` (`ar_namespace`,`ar_title`,`ar_timestamp`),
  KEY `ar_usertext_timestamp` (`ar_user_text`,`ar_timestamp`),
  KEY `ar_actor_timestamp` (`ar_actor`,`ar_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archive`
--

LOCK TABLES `archive` WRITE;
/*!40000 ALTER TABLE `archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bot_passwords`
--

DROP TABLE IF EXISTS `bot_passwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bot_passwords` (
  `bp_user` int(10) unsigned NOT NULL,
  `bp_app_id` varbinary(32) NOT NULL,
  `bp_password` tinyblob NOT NULL,
  `bp_token` binary(32) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `bp_restrictions` blob NOT NULL,
  `bp_grants` blob NOT NULL,
  PRIMARY KEY (`bp_user`,`bp_app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bot_passwords`
--

LOCK TABLES `bot_passwords` WRITE;
/*!40000 ALTER TABLE `bot_passwords` DISABLE KEYS */;
/*!40000 ALTER TABLE `bot_passwords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `cat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cat_title` varbinary(255) NOT NULL,
  `cat_pages` int(11) NOT NULL DEFAULT '0',
  `cat_subcats` int(11) NOT NULL DEFAULT '0',
  `cat_files` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cat_id`),
  UNIQUE KEY `cat_title` (`cat_title`),
  KEY `cat_pages` (`cat_pages`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorylinks`
--

DROP TABLE IF EXISTS `categorylinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorylinks` (
  `cl_from` int(10) unsigned NOT NULL DEFAULT '0',
  `cl_to` varbinary(255) NOT NULL DEFAULT '',
  `cl_sortkey` varbinary(230) NOT NULL DEFAULT '',
  `cl_sortkey_prefix` varbinary(255) NOT NULL DEFAULT '',
  `cl_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cl_collation` varbinary(32) NOT NULL DEFAULT '',
  `cl_type` enum('page','subcat','file') NOT NULL DEFAULT 'page',
  PRIMARY KEY (`cl_from`,`cl_to`),
  KEY `cl_sortkey` (`cl_to`,`cl_type`,`cl_sortkey`,`cl_from`),
  KEY `cl_timestamp` (`cl_to`,`cl_timestamp`),
  KEY `cl_collation_ext` (`cl_collation`,`cl_to`,`cl_type`,`cl_from`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorylinks`
--

LOCK TABLES `categorylinks` WRITE;
/*!40000 ALTER TABLE `categorylinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorylinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `change_tag`
--

DROP TABLE IF EXISTS `change_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `change_tag` (
  `ct_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ct_rc_id` int(11) DEFAULT NULL,
  `ct_log_id` int(10) unsigned DEFAULT NULL,
  `ct_rev_id` int(10) unsigned DEFAULT NULL,
  `ct_tag` varbinary(255) NOT NULL DEFAULT '',
  `ct_params` blob,
  `ct_tag_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`ct_id`),
  UNIQUE KEY `change_tag_rc_tag_id` (`ct_rc_id`,`ct_tag_id`),
  UNIQUE KEY `change_tag_log_tag_id` (`ct_log_id`,`ct_tag_id`),
  UNIQUE KEY `change_tag_rev_tag_id` (`ct_rev_id`,`ct_tag_id`),
  KEY `change_tag_rc_tag_nonuniq` (`ct_rc_id`,`ct_tag`),
  KEY `change_tag_log_tag_nonuniq` (`ct_log_id`,`ct_tag`),
  KEY `change_tag_rev_tag_nonuniq` (`ct_rev_id`,`ct_tag`),
  KEY `change_tag_tag_id` (`ct_tag`,`ct_rc_id`,`ct_rev_id`,`ct_log_id`),
  KEY `change_tag_tag_id_id` (`ct_tag_id`,`ct_rc_id`,`ct_rev_id`,`ct_log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `change_tag`
--

LOCK TABLES `change_tag` WRITE;
/*!40000 ALTER TABLE `change_tag` DISABLE KEYS */;
INSERT INTO `change_tag` VALUES (1,45,NULL,46,_binary 'mw-blank',NULL,1),(2,50,NULL,51,_binary 'mw-blank',NULL,1);
/*!40000 ALTER TABLE `change_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `change_tag_def`
--

DROP TABLE IF EXISTS `change_tag_def`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `change_tag_def` (
  `ctd_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ctd_name` varbinary(255) NOT NULL,
  `ctd_user_defined` tinyint(1) NOT NULL,
  `ctd_count` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ctd_id`),
  UNIQUE KEY `ctd_name` (`ctd_name`),
  KEY `ctd_count` (`ctd_count`),
  KEY `ctd_user_defined` (`ctd_user_defined`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `change_tag_def`
--

LOCK TABLES `change_tag_def` WRITE;
/*!40000 ALTER TABLE `change_tag_def` DISABLE KEYS */;
INSERT INTO `change_tag_def` VALUES (1,_binary 'mw-blank',0,2);
/*!40000 ALTER TABLE `change_tag_def` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `comment_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_hash` int(11) NOT NULL,
  `comment_text` blob NOT NULL,
  `comment_data` blob,
  PRIMARY KEY (`comment_id`),
  KEY `comment_hash` (`comment_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content` (
  `content_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `content_size` int(10) unsigned NOT NULL,
  `content_sha1` varbinary(32) NOT NULL,
  `content_model` smallint(5) unsigned NOT NULL,
  `content_address` varbinary(255) NOT NULL,
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
INSERT INTO `content` VALUES (1,735,_binary 'a5wehuldd0go2uniagwvx66n6c80irq',1,_binary 'tt:1'),(2,182,_binary 'qnirei0amkyic0rhlbn6kraca4uc1ug',1,_binary 'tt:2'),(3,227,_binary 'n996q47vuw1acm5szeai01yt6a735wv',1,_binary 'tt:3'),(4,243,_binary '1cfhir1fdhtvc83xh623rgjrsdjqi8q',1,_binary 'tt:4'),(5,256,_binary '1x5f9d3xq9osyeczhd653vnt2q7zzv5',1,_binary 'tt:5'),(6,256,_binary '86f2i9ucij0tkdqshggfj41s703w9d6',1,_binary 'tt:6'),(7,11,_binary 'tal59t60dbpbkydz0n16dqk2t1smsir',1,_binary 'tt:7'),(8,15,_binary 'lnkztzieh2gbqiooasyd2oqc5z3ocbh',1,_binary 'tt:8'),(9,376,_binary 'o7r499hrpfjal5hzzzydn5yxqul1b3w',1,_binary 'tt:9'),(10,0,_binary 'phoiac9h4m842xq45sp7s6u21eteeq1',1,_binary 'tt:10'),(11,401,_binary 'cvvkssp2zxsw0p5dxu7w457j0w8uxzz',1,_binary 'tt:11'),(12,605,_binary 'gp5js5jmusp8nn4nk67654bykqxplzi',1,_binary 'tt:12'),(13,695,_binary 'p22x5z6pmerqvdzn2x8tf8llqq2n05a',1,_binary 'tt:13'),(14,0,_binary 'phoiac9h4m842xq45sp7s6u21eteeq1',1,_binary 'tt:14'),(15,1378,_binary 'rwdvui3b7tol6ir2fxvfxoawt5gyve2',1,_binary 'tt:15'),(16,0,_binary 'phoiac9h4m842xq45sp7s6u21eteeq1',1,_binary 'tt:16'),(17,2171,_binary '9igce8v3z2hh4nqawim5aook61uphx0',1,_binary 'tt:17'),(18,2528,_binary 'pz36zb9s41b1ecc48qyt24bqenzy31w',1,_binary 'tt:18'),(19,3416,_binary '7424aj2kqfeysblv7hewpy001i34gly',1,_binary 'tt:19'),(20,3414,_binary 'l9oakz1jk1d6p303eyw7frec6afc4oh',1,_binary 'tt:20'),(21,0,_binary 'phoiac9h4m842xq45sp7s6u21eteeq1',1,_binary 'tt:21'),(22,25,_binary '659w59x7c02m2bt1htumidotxnry5sg',1,_binary 'tt:22'),(23,529,_binary 'jy7vcq53rd8cth67vf16im6nd593buu',1,_binary 'tt:23'),(24,815,_binary '5qja47tv93k39cksmj6mhr0enh6x63z',1,_binary 'tt:24'),(25,1441,_binary 'l7v3pibb0ekxrakfguhduzui3djihxj',1,_binary 'tt:25'),(26,1459,_binary 'czsmzvjo19qerf6zkkc61gfl13xcn5o',1,_binary 'tt:26'),(27,1465,_binary 'gd6lgxfh4hk7tlafn2j01cjpeha93gp',1,_binary 'tt:27'),(28,1483,_binary 'qdg5m38k7mql336nwia3k879jl7bupq',1,_binary 'tt:28'),(29,1477,_binary 'c09bj096x67uau29w7qeoj1e3n6qcyb',1,_binary 'tt:29'),(30,2217,_binary 'huyth0kwupv6ozoo6zg9w78kdc9w4li',1,_binary 'tt:30'),(31,109,_binary 'dyhbkxs0yuvxe3skjz5r7hjbomrk6tn',1,_binary 'tt:31'),(32,125,_binary 'r84of5qkys0ewefbzvwmhpyz4gzumf5',1,_binary 'tt:32'),(33,26,_binary '7eism4u5mltxd8e7w66s3rzm3lmh1os',1,_binary 'tt:33'),(34,0,_binary 'phoiac9h4m842xq45sp7s6u21eteeq1',1,_binary 'tt:34'),(35,41,_binary '7wvw2d8fyhn91g4p9c73thm7mxrtswg',1,_binary 'tt:35'),(36,40,_binary 'kx615d3kcicaeme1j9p2xzavojc4efk',1,_binary 'tt:36'),(37,37,_binary 'iphhqkn8aw12ynxd6pdb1ttempmdgdl',1,_binary 'tt:37'),(38,154,_binary 'dmbffl54mzr3ihdlp19synb7l9x7aoz',1,_binary 'tt:38'),(39,78,_binary '6c3d2e8s3r96bnbubmejj50hbfmqc5c',2,_binary 'tt:39'),(40,79,_binary '8hj5tk2wuh95ra3dsd2xh2ez0wrn734',1,_binary 'tt:40'),(41,74,_binary 'lw5svqcfvm82mxtqpbd7t4wm6tjcj44',2,_binary 'tt:41'),(42,66,_binary 'dhzsc5h4j781ukcturpkukyzvzdmrsh',2,_binary 'tt:42'),(43,61,_binary 'gw4r3ytz4oxdehlewzilfv8a40itpnt',1,_binary 'tt:43'),(44,35,_binary '8v6rrb6nwtuz07uak826s26bj3mr36y',2,_binary 'tt:44'),(45,37,_binary 'prv7sdccyisl88q0rdodvq3i8lcg8yp',2,_binary 'tt:45'),(46,0,_binary 'phoiac9h4m842xq45sp7s6u21eteeq1',2,_binary 'tt:46'),(47,41,_binary 'a5qcpr16ksiyrvi0ohn91io52pum3wy',1,_binary 'tt:47'),(48,48,_binary '1xbpazcxxqml0umi0nuwwyjbth6piib',2,_binary 'tt:48'),(49,54,_binary 'opuqg0sd5zn2gmmfcxvmpxw6pww13mn',1,_binary 'tt:49'),(50,54,_binary 'gy5u3mj0jugbcj0lo24r16sv0h9xp0m',2,_binary 'tt:50'),(51,0,_binary 'phoiac9h4m842xq45sp7s6u21eteeq1',2,_binary 'tt:51'),(52,41,_binary 'a5qcpr16ksiyrvi0ohn91io52pum3wy',1,_binary 'tt:52'),(53,46,_binary 's1cegvkd58t07e2gkyp5ifbqr8keehy',1,_binary 'tt:53'),(54,0,_binary 'phoiac9h4m842xq45sp7s6u21eteeq1',1,_binary 'tt:54'),(55,46,_binary 's1cegvkd58t07e2gkyp5ifbqr8keehy',1,_binary 'tt:55'),(56,55,_binary 't1q7nkw0knfz1mcs3f5z4kka3nvkwqg',1,_binary 'tt:56'),(57,0,_binary 'phoiac9h4m842xq45sp7s6u21eteeq1',1,_binary 'tt:57'),(58,46,_binary 'qyhgrxvr7sg3dw0r8p2ctjzx1k5ktr3',1,_binary 'tt:58'),(59,0,_binary 'phoiac9h4m842xq45sp7s6u21eteeq1',1,_binary 'tt:59'),(60,44,_binary 'cuawt2y5xdvr04odayxdb9jpldefxkn',1,_binary 'tt:60'),(61,53,_binary 'tmbcf0owe312nnn10gk876hiz4j2xx3',1,_binary 'tt:61'),(62,0,_binary 'phoiac9h4m842xq45sp7s6u21eteeq1',1,_binary 'tt:62');
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_models`
--

DROP TABLE IF EXISTS `content_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_models` (
  `model_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `model_name` varbinary(64) NOT NULL,
  PRIMARY KEY (`model_id`),
  UNIQUE KEY `model_name` (`model_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_models`
--

LOCK TABLES `content_models` WRITE;
/*!40000 ALTER TABLE `content_models` DISABLE KEYS */;
INSERT INTO `content_models` VALUES (2,_binary 'css'),(1,_binary 'wikitext');
/*!40000 ALTER TABLE `content_models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `externallinks`
--

DROP TABLE IF EXISTS `externallinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `externallinks` (
  `el_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `el_from` int(10) unsigned NOT NULL DEFAULT '0',
  `el_to` blob NOT NULL,
  `el_index` blob NOT NULL,
  `el_index_60` varbinary(60) NOT NULL,
  PRIMARY KEY (`el_id`),
  KEY `el_from` (`el_from`,`el_to`(40)),
  KEY `el_to` (`el_to`(60),`el_from`),
  KEY `el_index` (`el_index`(60)),
  KEY `el_index_60` (`el_index_60`,`el_id`),
  KEY `el_from_index_60` (`el_from`,`el_index_60`,`el_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `externallinks`
--

LOCK TABLES `externallinks` WRITE;
/*!40000 ALTER TABLE `externallinks` DISABLE KEYS */;
INSERT INTO `externallinks` VALUES (1,4,_binary 'https://www.veracrypt.fr/en/Downloads.html',_binary 'https://fr.veracrypt.www./en/Downloads.html',_binary 'https://fr.veracrypt.www./en/Downloads.html');
/*!40000 ALTER TABLE `externallinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filearchive`
--

DROP TABLE IF EXISTS `filearchive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filearchive` (
  `fa_id` int(11) NOT NULL AUTO_INCREMENT,
  `fa_name` varbinary(255) NOT NULL DEFAULT '',
  `fa_archive_name` varbinary(255) DEFAULT '',
  `fa_storage_group` varbinary(16) DEFAULT NULL,
  `fa_storage_key` varbinary(64) DEFAULT '',
  `fa_deleted_user` int(11) DEFAULT NULL,
  `fa_deleted_timestamp` binary(14) DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `fa_deleted_reason` varbinary(767) DEFAULT '',
  `fa_deleted_reason_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `fa_size` int(10) unsigned DEFAULT '0',
  `fa_width` int(11) DEFAULT '0',
  `fa_height` int(11) DEFAULT '0',
  `fa_metadata` mediumblob,
  `fa_bits` int(11) DEFAULT '0',
  `fa_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE','3D') DEFAULT NULL,
  `fa_major_mime` enum('unknown','application','audio','image','text','video','message','model','multipart','chemical') DEFAULT 'unknown',
  `fa_minor_mime` varbinary(100) DEFAULT 'unknown',
  `fa_description` varbinary(767) DEFAULT '',
  `fa_description_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `fa_user` int(10) unsigned DEFAULT '0',
  `fa_user_text` varbinary(255) DEFAULT '',
  `fa_actor` bigint(20) unsigned NOT NULL DEFAULT '0',
  `fa_timestamp` binary(14) DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `fa_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `fa_sha1` varbinary(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`fa_id`),
  KEY `fa_name` (`fa_name`,`fa_timestamp`),
  KEY `fa_storage_group` (`fa_storage_group`,`fa_storage_key`),
  KEY `fa_deleted_timestamp` (`fa_deleted_timestamp`),
  KEY `fa_user_timestamp` (`fa_user_text`,`fa_timestamp`),
  KEY `fa_actor_timestamp` (`fa_actor`,`fa_timestamp`),
  KEY `fa_sha1` (`fa_sha1`(10))
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filearchive`
--

LOCK TABLES `filearchive` WRITE;
/*!40000 ALTER TABLE `filearchive` DISABLE KEYS */;
/*!40000 ALTER TABLE `filearchive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image` (
  `img_name` varbinary(255) NOT NULL DEFAULT '',
  `img_size` int(10) unsigned NOT NULL DEFAULT '0',
  `img_width` int(11) NOT NULL DEFAULT '0',
  `img_height` int(11) NOT NULL DEFAULT '0',
  `img_metadata` mediumblob NOT NULL,
  `img_bits` int(11) NOT NULL DEFAULT '0',
  `img_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE','3D') DEFAULT NULL,
  `img_major_mime` enum('unknown','application','audio','image','text','video','message','model','multipart','chemical') NOT NULL DEFAULT 'unknown',
  `img_minor_mime` varbinary(100) NOT NULL DEFAULT 'unknown',
  `img_description` varbinary(767) NOT NULL DEFAULT '',
  `img_description_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `img_user` int(10) unsigned NOT NULL DEFAULT '0',
  `img_user_text` varbinary(255) NOT NULL DEFAULT '',
  `img_actor` bigint(20) unsigned NOT NULL DEFAULT '0',
  `img_timestamp` varbinary(14) NOT NULL DEFAULT '',
  `img_sha1` varbinary(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`img_name`),
  KEY `img_user_timestamp` (`img_user`,`img_timestamp`),
  KEY `img_usertext_timestamp` (`img_user_text`,`img_timestamp`),
  KEY `img_actor_timestamp` (`img_actor`,`img_timestamp`),
  KEY `img_size` (`img_size`),
  KEY `img_timestamp` (`img_timestamp`),
  KEY `img_sha1` (`img_sha1`(10)),
  KEY `img_media_mime` (`img_media_type`,`img_major_mime`,`img_minor_mime`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (_binary 'Administring_custom_forms.mp4',29039368,0,0,'',0,_binary 'VIDEO',_binary 'video',_binary 'mp4','',0,1,_binary 'Wiki user',0,_binary '20190206070205',_binary '94scdxcq9th2mzy5ze84obex15kykav'),(_binary 'Using_custom_forms.mp4',8418142,0,0,'',0,_binary 'VIDEO',_binary 'video',_binary 'mp4','',0,1,_binary 'Wiki user',0,_binary '20190206065341',_binary '3m2xtvpth39lul52rzswb01dsm7das6'),(_binary 'Using_secrets.mp4',26425433,0,0,'',0,_binary 'VIDEO',_binary 'video',_binary 'mp4','',0,1,_binary 'Wiki user',0,_binary '20190206054937',_binary '7lxy0p5zqe4ir2smm9tbxtfgsr7rt0n'),(_binary 'Using_secrets_keys.mp4',24331742,0,0,'',0,_binary 'VIDEO',_binary 'video',_binary 'mp4','',0,1,_binary 'Wiki user',0,_binary '20190206065005',_binary '4f1fqh9bm3p2vj2gpddizjlqpb4rb0s'),(_binary 'Using_secrets_other_options.mp4',7859218,0,0,'',0,_binary 'VIDEO',_binary 'video',_binary 'mp4','',0,1,_binary 'Wiki user',0,_binary '20190206065207',_binary 'r8z0g14gho7tkoy65ilu483e8jsy75x'),(_binary 'Veracrypt_1.png',1464637,683,535,_binary 'a:6:{s:10:\"frameCount\";i:0;s:9:\"loopCount\";i:1;s:8:\"duration\";d:0;s:8:\"bitDepth\";i:8;s:9:\"colorType\";s:16:\"truecolour-alpha\";s:8:\"metadata\";a:5:{s:11:\"XResolution\";s:8:\"2835/100\";s:11:\"YResolution\";s:8:\"2835/100\";s:14:\"ResolutionUnit\";i:3;s:8:\"DateTime\";s:19:\"2019:02:05 10:47:29\";s:15:\"_MW_PNG_VERSION\";i:1;}}',8,_binary 'BITMAP',_binary 'image',_binary 'png','',0,1,_binary 'Wiki user',0,_binary '20190206020841',_binary '2qtkri5zfjrrvnkm6z2xshuzmz8xh4x'),(_binary 'Veracrypt_2.png',1279771,645,495,_binary 'a:6:{s:10:\"frameCount\";i:0;s:9:\"loopCount\";i:1;s:8:\"duration\";d:0;s:8:\"bitDepth\";i:8;s:9:\"colorType\";s:16:\"truecolour-alpha\";s:8:\"metadata\";a:5:{s:11:\"XResolution\";s:8:\"2835/100\";s:11:\"YResolution\";s:8:\"2835/100\";s:14:\"ResolutionUnit\";i:3;s:8:\"DateTime\";s:19:\"2019:02:06 02:32:38\";s:15:\"_MW_PNG_VERSION\";i:1;}}',8,_binary 'BITMAP',_binary 'image',_binary 'png','',0,1,_binary 'Wiki user',0,_binary '20190206023410',_binary 'psrywqwxbrgclfdrwemttjrth4a2x7w'),(_binary 'Veracrypt_3.png',1290383,640,503,_binary 'a:6:{s:10:\"frameCount\";i:0;s:9:\"loopCount\";i:1;s:8:\"duration\";d:0;s:8:\"bitDepth\";i:8;s:9:\"colorType\";s:16:\"truecolour-alpha\";s:8:\"metadata\";a:5:{s:11:\"XResolution\";s:8:\"2835/100\";s:11:\"YResolution\";s:8:\"2835/100\";s:14:\"ResolutionUnit\";i:3;s:8:\"DateTime\";s:19:\"2019:02:06 02:53:17\";s:15:\"_MW_PNG_VERSION\";i:1;}}',8,_binary 'BITMAP',_binary 'image',_binary 'png','',0,1,_binary 'Wiki user',0,_binary '20190206030531',_binary 'g5aql4cxkpbx6ndxwo66tr3el0pkno6'),(_binary 'Veracrypt_4.png',1217617,732,415,_binary 'a:6:{s:10:\"frameCount\";i:0;s:9:\"loopCount\";i:1;s:8:\"duration\";d:0;s:8:\"bitDepth\";i:8;s:9:\"colorType\";s:16:\"truecolour-alpha\";s:8:\"metadata\";a:5:{s:11:\"XResolution\";s:8:\"2835/100\";s:11:\"YResolution\";s:8:\"2835/100\";s:14:\"ResolutionUnit\";i:3;s:8:\"DateTime\";s:19:\"2019:02:06 04:08:32\";s:15:\"_MW_PNG_VERSION\";i:1;}}',8,_binary 'BITMAP',_binary 'image',_binary 'png','',0,1,_binary 'Wiki user',0,_binary '20190206041537',_binary '7hucpp8ieqt0o2vcgy8hf157c5mby73');
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagelinks`
--

DROP TABLE IF EXISTS `imagelinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagelinks` (
  `il_from` int(10) unsigned NOT NULL DEFAULT '0',
  `il_from_namespace` int(11) NOT NULL DEFAULT '0',
  `il_to` varbinary(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`il_from`,`il_to`),
  KEY `il_to` (`il_to`,`il_from`),
  KEY `il_backlinks_namespace` (`il_from_namespace`,`il_to`,`il_from`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagelinks`
--

LOCK TABLES `imagelinks` WRITE;
/*!40000 ALTER TABLE `imagelinks` DISABLE KEYS */;
INSERT INTO `imagelinks` VALUES (20,0,_binary 'Administring_custom_forms.mp4'),(18,0,_binary 'Using_custom_forms.mp4'),(11,0,_binary 'Using_secrets.mp4'),(14,0,_binary 'Using_secrets_keys.mp4'),(16,0,_binary 'Using_secrets_other_options.mp4'),(4,0,_binary 'Veracrypt_1.png'),(4,0,_binary 'Veracrypt_2.png'),(4,0,_binary 'Veracrypt_3.png'),(4,0,_binary 'Veracrypt_4.png');
/*!40000 ALTER TABLE `imagelinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interwiki`
--

DROP TABLE IF EXISTS `interwiki`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interwiki` (
  `iw_prefix` varbinary(32) NOT NULL,
  `iw_url` blob NOT NULL,
  `iw_api` blob NOT NULL,
  `iw_wikiid` varbinary(64) NOT NULL,
  `iw_local` tinyint(1) NOT NULL,
  `iw_trans` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`iw_prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interwiki`
--

LOCK TABLES `interwiki` WRITE;
/*!40000 ALTER TABLE `interwiki` DISABLE KEYS */;
INSERT INTO `interwiki` VALUES (_binary 'acronym',_binary 'https://www.acronymfinder.com/~/search/af.aspx?string=exact&Acronym=$1','','',0,0),(_binary 'advogato',_binary 'http://www.advogato.org/$1','','',0,0),(_binary 'arxiv',_binary 'https://www.arxiv.org/abs/$1','','',0,0),(_binary 'c2find',_binary 'http://c2.com/cgi/wiki?FindPage&value=$1','','',0,0),(_binary 'cache',_binary 'https://www.google.com/search?q=cache:$1','','',0,0),(_binary 'commons',_binary 'https://commons.wikimedia.org/wiki/$1',_binary 'https://commons.wikimedia.org/w/api.php','',0,0),(_binary 'dictionary',_binary 'http://www.dict.org/bin/Dict?Database=*&Form=Dict1&Strategy=*&Query=$1','','',0,0),(_binary 'doi',_binary 'https://dx.doi.org/$1','','',0,0),(_binary 'drumcorpswiki',_binary 'http://www.drumcorpswiki.com/$1',_binary 'http://drumcorpswiki.com/api.php','',0,0),(_binary 'dwjwiki',_binary 'http://www.suberic.net/cgi-bin/dwj/wiki.cgi?$1','','',0,0),(_binary 'elibre',_binary 'http://enciclopedia.us.es/index.php/$1',_binary 'http://enciclopedia.us.es/api.php','',0,0),(_binary 'emacswiki',_binary 'https://www.emacswiki.org/cgi-bin/wiki.pl?$1','','',0,0),(_binary 'foldoc',_binary 'https://foldoc.org/?$1','','',0,0),(_binary 'foxwiki',_binary 'https://fox.wikis.com/wc.dll?Wiki~$1','','',0,0),(_binary 'freebsdman',_binary 'https://www.FreeBSD.org/cgi/man.cgi?apropos=1&query=$1','','',0,0),(_binary 'gentoo-wiki',_binary 'http://gentoo-wiki.com/$1','','',0,0),(_binary 'google',_binary 'https://www.google.com/search?q=$1','','',0,0),(_binary 'googlegroups',_binary 'https://groups.google.com/groups?q=$1','','',0,0),(_binary 'hammondwiki',_binary 'http://www.dairiki.org/HammondWiki/$1','','',0,0),(_binary 'hrwiki',_binary 'http://www.hrwiki.org/wiki/$1',_binary 'http://www.hrwiki.org/w/api.php','',0,0),(_binary 'imdb',_binary 'http://www.imdb.com/find?q=$1&tt=on','','',0,0),(_binary 'kmwiki',_binary 'https://kmwiki.wikispaces.com/$1','','',0,0),(_binary 'linuxwiki',_binary 'http://linuxwiki.de/$1','','',0,0),(_binary 'lojban',_binary 'https://mw.lojban.org/papri/$1','','',0,0),(_binary 'lqwiki',_binary 'http://wiki.linuxquestions.org/wiki/$1','','',0,0),(_binary 'meatball',_binary 'http://www.usemod.com/cgi-bin/mb.pl?$1','','',0,0),(_binary 'mediawikiwiki',_binary 'https://www.mediawiki.org/wiki/$1',_binary 'https://www.mediawiki.org/w/api.php','',0,0),(_binary 'memoryalpha',_binary 'http://en.memory-alpha.org/wiki/$1',_binary 'http://en.memory-alpha.org/api.php','',0,0),(_binary 'metawiki',_binary 'http://sunir.org/apps/meta.pl?$1','','',0,0),(_binary 'metawikimedia',_binary 'https://meta.wikimedia.org/wiki/$1',_binary 'https://meta.wikimedia.org/w/api.php','',0,0),(_binary 'mozillawiki',_binary 'https://wiki.mozilla.org/$1',_binary 'https://wiki.mozilla.org/api.php','',0,0),(_binary 'mw',_binary 'https://www.mediawiki.org/wiki/$1',_binary 'https://www.mediawiki.org/w/api.php','',0,0),(_binary 'oeis',_binary 'https://oeis.org/$1','','',0,0),(_binary 'openwiki',_binary 'http://openwiki.com/ow.asp?$1','','',0,0),(_binary 'pmid',_binary 'https://www.ncbi.nlm.nih.gov/pubmed/$1?dopt=Abstract','','',0,0),(_binary 'pythoninfo',_binary 'https://wiki.python.org/moin/$1','','',0,0),(_binary 'rfc',_binary 'https://tools.ietf.org/html/rfc$1','','',0,0),(_binary 's23wiki',_binary 'http://s23.org/wiki/$1',_binary 'http://s23.org/w/api.php','',0,0),(_binary 'seattlewireless',_binary 'http://seattlewireless.net/$1','','',0,0),(_binary 'senseislibrary',_binary 'https://senseis.xmp.net/?$1','','',0,0),(_binary 'shoutwiki',_binary 'http://www.shoutwiki.com/wiki/$1',_binary 'http://www.shoutwiki.com/w/api.php','',0,0),(_binary 'squeak',_binary 'http://wiki.squeak.org/squeak/$1','','',0,0),(_binary 'theopedia',_binary 'https://www.theopedia.com/$1','','',0,0),(_binary 'tmbw',_binary 'http://www.tmbw.net/wiki/$1',_binary 'http://tmbw.net/wiki/api.php','',0,0),(_binary 'tmnet',_binary 'http://www.technomanifestos.net/?$1','','',0,0),(_binary 'twiki',_binary 'http://twiki.org/cgi-bin/view/$1','','',0,0),(_binary 'uncyclopedia',_binary 'https://en.uncyclopedia.co/wiki/$1',_binary 'https://en.uncyclopedia.co/w/api.php','',0,0),(_binary 'unreal',_binary 'https://wiki.beyondunreal.com/$1',_binary 'https://wiki.beyondunreal.com/w/api.php','',0,0),(_binary 'usemod',_binary 'http://www.usemod.com/cgi-bin/wiki.pl?$1','','',0,0),(_binary 'wiki',_binary 'http://c2.com/cgi/wiki?$1','','',0,0),(_binary 'wikia',_binary 'http://www.wikia.com/wiki/$1','','',0,0),(_binary 'wikibooks',_binary 'https://en.wikibooks.org/wiki/$1',_binary 'https://en.wikibooks.org/w/api.php','',0,0),(_binary 'wikidata',_binary 'https://www.wikidata.org/wiki/$1',_binary 'https://www.wikidata.org/w/api.php','',0,0),(_binary 'wikif1',_binary 'http://www.wikif1.org/$1','','',0,0),(_binary 'wikihow',_binary 'https://www.wikihow.com/$1',_binary 'https://www.wikihow.com/api.php','',0,0),(_binary 'wikimedia',_binary 'https://foundation.wikimedia.org/wiki/$1',_binary 'https://foundation.wikimedia.org/w/api.php','',0,0),(_binary 'wikinews',_binary 'https://en.wikinews.org/wiki/$1',_binary 'https://en.wikinews.org/w/api.php','',0,0),(_binary 'wikinfo',_binary 'http://wikinfo.co/English/index.php/$1','','',0,0),(_binary 'wikipedia',_binary 'https://en.wikipedia.org/wiki/$1',_binary 'https://en.wikipedia.org/w/api.php','',0,0),(_binary 'wikiquote',_binary 'https://en.wikiquote.org/wiki/$1',_binary 'https://en.wikiquote.org/w/api.php','',0,0),(_binary 'wikisource',_binary 'https://wikisource.org/wiki/$1',_binary 'https://wikisource.org/w/api.php','',0,0),(_binary 'wikispecies',_binary 'https://species.wikimedia.org/wiki/$1',_binary 'https://species.wikimedia.org/w/api.php','',0,0),(_binary 'wikiversity',_binary 'https://en.wikiversity.org/wiki/$1',_binary 'https://en.wikiversity.org/w/api.php','',0,0),(_binary 'wikivoyage',_binary 'https://en.wikivoyage.org/wiki/$1',_binary 'https://en.wikivoyage.org/w/api.php','',0,0),(_binary 'wikt',_binary 'https://en.wiktionary.org/wiki/$1',_binary 'https://en.wiktionary.org/w/api.php','',0,0),(_binary 'wiktionary',_binary 'https://en.wiktionary.org/wiki/$1',_binary 'https://en.wiktionary.org/w/api.php','',0,0);
/*!40000 ALTER TABLE `interwiki` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_changes`
--

DROP TABLE IF EXISTS `ip_changes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ip_changes` (
  `ipc_rev_id` int(10) unsigned NOT NULL DEFAULT '0',
  `ipc_rev_timestamp` binary(14) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `ipc_hex` varbinary(35) NOT NULL DEFAULT '',
  PRIMARY KEY (`ipc_rev_id`),
  KEY `ipc_rev_timestamp` (`ipc_rev_timestamp`),
  KEY `ipc_hex_time` (`ipc_hex`,`ipc_rev_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_changes`
--

LOCK TABLES `ip_changes` WRITE;
/*!40000 ALTER TABLE `ip_changes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_changes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipblocks`
--

DROP TABLE IF EXISTS `ipblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ipblocks` (
  `ipb_id` int(11) NOT NULL AUTO_INCREMENT,
  `ipb_address` tinyblob NOT NULL,
  `ipb_user` int(10) unsigned NOT NULL DEFAULT '0',
  `ipb_by` int(10) unsigned NOT NULL DEFAULT '0',
  `ipb_by_text` varbinary(255) NOT NULL DEFAULT '',
  `ipb_by_actor` bigint(20) unsigned NOT NULL DEFAULT '0',
  `ipb_reason` varbinary(767) NOT NULL DEFAULT '',
  `ipb_reason_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `ipb_timestamp` binary(14) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `ipb_auto` tinyint(1) NOT NULL DEFAULT '0',
  `ipb_anon_only` tinyint(1) NOT NULL DEFAULT '0',
  `ipb_create_account` tinyint(1) NOT NULL DEFAULT '1',
  `ipb_enable_autoblock` tinyint(1) NOT NULL DEFAULT '1',
  `ipb_expiry` varbinary(14) NOT NULL DEFAULT '',
  `ipb_range_start` tinyblob NOT NULL,
  `ipb_range_end` tinyblob NOT NULL,
  `ipb_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `ipb_block_email` tinyint(1) NOT NULL DEFAULT '0',
  `ipb_allow_usertalk` tinyint(1) NOT NULL DEFAULT '0',
  `ipb_parent_block_id` int(11) DEFAULT NULL,
  `ipb_sitewide` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ipb_id`),
  UNIQUE KEY `ipb_address` (`ipb_address`(255),`ipb_user`,`ipb_auto`,`ipb_anon_only`),
  KEY `ipb_user` (`ipb_user`),
  KEY `ipb_range` (`ipb_range_start`(8),`ipb_range_end`(8)),
  KEY `ipb_timestamp` (`ipb_timestamp`),
  KEY `ipb_expiry` (`ipb_expiry`),
  KEY `ipb_parent_block_id` (`ipb_parent_block_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipblocks`
--

LOCK TABLES `ipblocks` WRITE;
/*!40000 ALTER TABLE `ipblocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `ipblocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipblocks_restrictions`
--

DROP TABLE IF EXISTS `ipblocks_restrictions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ipblocks_restrictions` (
  `ir_ipb_id` int(11) NOT NULL,
  `ir_type` tinyint(1) NOT NULL,
  `ir_value` int(11) NOT NULL,
  PRIMARY KEY (`ir_ipb_id`,`ir_type`,`ir_value`),
  KEY `ir_type_value` (`ir_type`,`ir_value`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipblocks_restrictions`
--

LOCK TABLES `ipblocks_restrictions` WRITE;
/*!40000 ALTER TABLE `ipblocks_restrictions` DISABLE KEYS */;
/*!40000 ALTER TABLE `ipblocks_restrictions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iwlinks`
--

DROP TABLE IF EXISTS `iwlinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iwlinks` (
  `iwl_from` int(10) unsigned NOT NULL DEFAULT '0',
  `iwl_prefix` varbinary(20) NOT NULL DEFAULT '',
  `iwl_title` varbinary(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`iwl_from`,`iwl_prefix`,`iwl_title`),
  KEY `iwl_prefix_title_from` (`iwl_prefix`,`iwl_title`,`iwl_from`),
  KEY `iwl_prefix_from_title` (`iwl_prefix`,`iwl_from`,`iwl_title`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iwlinks`
--

LOCK TABLES `iwlinks` WRITE;
/*!40000 ALTER TABLE `iwlinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `iwlinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job` (
  `job_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `job_cmd` varbinary(60) NOT NULL DEFAULT '',
  `job_namespace` int(11) NOT NULL,
  `job_title` varbinary(255) NOT NULL,
  `job_timestamp` varbinary(14) DEFAULT NULL,
  `job_params` blob NOT NULL,
  `job_random` int(10) unsigned NOT NULL DEFAULT '0',
  `job_attempts` int(10) unsigned NOT NULL DEFAULT '0',
  `job_token` varbinary(32) NOT NULL DEFAULT '',
  `job_token_timestamp` varbinary(14) DEFAULT NULL,
  `job_sha1` varbinary(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`job_id`),
  KEY `job_sha1` (`job_sha1`),
  KEY `job_cmd_token` (`job_cmd`,`job_token`,`job_random`),
  KEY `job_cmd_token_id` (`job_cmd`,`job_token`,`job_id`),
  KEY `job_cmd` (`job_cmd`,`job_namespace`,`job_title`,`job_params`(128)),
  KEY `job_timestamp` (`job_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l10n_cache`
--

DROP TABLE IF EXISTS `l10n_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l10n_cache` (
  `lc_lang` varbinary(32) NOT NULL,
  `lc_key` varbinary(255) NOT NULL,
  `lc_value` mediumblob NOT NULL,
  PRIMARY KEY (`lc_lang`,`lc_key`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l10n_cache`
--

LOCK TABLES `l10n_cache` WRITE;
/*!40000 ALTER TABLE `l10n_cache` DISABLE KEYS */;
INSERT INTO `l10n_cache` VALUES (_binary 'en',_binary 'messages:tooltip-t-emailuser',_binary 's:40:\"Send an email to {{GENDER:$1|this user}}\";'),(_binary 'en',_binary 'messages:tooltip-t-info',_binary 's:32:\"More information about this page\";'),(_binary 'en',_binary 'messages:tooltip-t-permalink',_binary 's:43:\"Permanent link to this revision of the page\";'),(_binary 'en',_binary 'messages:tooltip-t-print',_binary 's:30:\"Printable version of this page\";'),(_binary 'en',_binary 'messages:tooltip-t-recentchangeslinked',_binary 's:45:\"Recent changes in pages linked from this page\";'),(_binary 'en',_binary 'messages:tooltip-t-specialpages',_binary 's:27:\"A list of all special pages\";'),(_binary 'en',_binary 'messages:tooltip-t-upload',_binary 's:12:\"Upload files\";'),(_binary 'en',_binary 'messages:tooltip-t-whatlinkshere',_binary 's:39:\"A list of all wiki pages that link here\";'),(_binary 'en',_binary 'messages:tooltip-undo',_binary 's:107:\"\"Undo\" reverts this edit and opens the edit form in preview mode. It allows adding a reason in the summary.\";'),(_binary 'en',_binary 'messages:tooltip-upload',_binary 's:12:\"Start upload\";'),(_binary 'en',_binary 'messages:tooltip-watch',_binary 's:31:\"Add this page to your watchlist\";'),(_binary 'en',_binary 'messages:tooltip-watchlistedit-normal-submit',_binary 's:13:\"Remove titles\";'),(_binary 'en',_binary 'messages:tooltip-watchlistedit-raw-submit',_binary 's:16:\"Update watchlist\";'),(_binary 'en',_binary 'messages:tooltip-whatlinkshere-invert',_binary 's:70:\"Check this box to hide links from pages within the selected namespace.\";'),(_binary 'en',_binary 'messages:trackingcategories',_binary 's:19:\"Tracking categories\";'),(_binary 'en',_binary 'messages:trackingcategories-desc',_binary 's:27:\"Category inclusion criteria\";'),(_binary 'en',_binary 'messages:trackingcategories-disabled',_binary 's:20:\"Category is disabled\";'),(_binary 'en',_binary 'messages:trackingcategories-msg',_binary 's:17:\"Tracking category\";'),(_binary 'en',_binary 'messages:trackingcategories-name',_binary 's:12:\"Message name\";'),(_binary 'en',_binary 'messages:trackingcategories-nodesc',_binary 's:25:\"No description available.\";'),(_binary 'en',_binary 'messages:trackingcategories-summary',_binary 's:191:\"This page lists tracking categories which are automatically populated by the MediaWiki software. Their names can be changed by altering the relevant system messages in the {{ns:8}} namespace.\";'),(_binary 'en',_binary 'messages:transaction-duration-limit-exceeded',_binary 's:217:\"To avoid creating high replication lag, this transaction was aborted because the write duration ($1) exceeded the $2 second limit.\nIf you are changing many items at once, try doing multiple smaller operations instead.\";'),(_binary 'en',_binary 'messages:translateinterface',_binary 's:139:\"To add or change translations for all wikis, please use [https://translatewiki.net/ translatewiki.net], the MediaWiki localisation project.\";'),(_binary 'en',_binary 'messages:tue',_binary 's:3:\"Tue\";'),(_binary 'en',_binary 'messages:tuesday',_binary 's:7:\"Tuesday\";'),(_binary 'en',_binary 'messages:tuesday-at',_binary 's:13:\"Tuesday at $1\";'),(_binary 'en',_binary 'messages:uctop',_binary 's:9:\"(current)\";'),(_binary 'en',_binary 'messages:unblock',_binary 's:12:\"Unblock user\";'),(_binary 'en',_binary 'messages:unblock-hideuser',_binary 's:64:\"You cannot unblock this user, as their username has been hidden.\";'),(_binary 'en',_binary 'messages:unblock-summary',_binary 's:0:\"\";'),(_binary 'en',_binary 'messages:unblocked',_binary 's:34:\"[[User:$1|$1]] has been unblocked.\";'),(_binary 'en',_binary 'messages:unblocked-id',_binary 's:26:\"Block $1 has been removed.\";'),(_binary 'en',_binary 'messages:unblocked-ip',_binary 's:51:\"[[Special:Contributions/$1|$1]] has been unblocked.\";'),(_binary 'en',_binary 'messages:unblocked-range',_binary 's:22:\"$1 has been unblocked.\";'),(_binary 'en',_binary 'messages:unblockip',_binary 's:12:\"Unblock user\";'),(_binary 'en',_binary 'messages:unblockiptext',_binary 's:90:\"Use the form below to restore write access to a previously blocked IP address or username.\";'),(_binary 'en',_binary 'messages:unblocklink',_binary 's:7:\"unblock\";'),(_binary 'en',_binary 'messages:unblocklogentry',_binary 's:12:\"unblocked $1\";'),(_binary 'en',_binary 'messages:uncategorized-categories-exceptionlist',_binary 's:228:\" # Contains a list of categories, which shouldn\'t be mentioned on Special:UncategorizedCategories. One per line, starting with \"*\". Lines starting with another character (including whitespaces) are ignored. Use \"#\" for comments.\";'),(_binary 'en',_binary 'messages:uncategorizedcategories',_binary 's:24:\"Uncategorized categories\";'),(_binary 'en',_binary 'messages:uncategorizedcategories-summary',_binary 's:0:\"\";'),(_binary 'en',_binary 'messages:uncategorizedimages',_binary 's:19:\"Uncategorized files\";'),(_binary 'en',_binary 'messages:uncategorizedimages-summary',_binary 's:0:\"\";'),(_binary 'en',_binary 'messages:uncategorizedpages',_binary 's:19:\"Uncategorized pages\";'),(_binary 'en',_binary 'messages:uncategorizedpages-summary',_binary 's:0:\"\";'),(_binary 'en',_binary 'messages:uncategorizedtemplates',_binary 's:23:\"Uncategorized templates\";'),(_binary 'en',_binary 'messages:uncategorizedtemplates-summary',_binary 's:0:\"\";'),(_binary 'en',_binary 'messages:undelete',_binary 's:18:\"View deleted pages\";'),(_binary 'en',_binary 'messages:undelete-bad-store-key',_binary 's:82:\"Cannot undelete file revision with timestamp $1: File was missing before deletion.\";'),(_binary 'en',_binary 'messages:undelete-cantcreate',_binary 's:118:\"You cannot undelete this page as there is no existing page with this name and you are not allowed to create this page.\";'),(_binary 'en',_binary 'messages:undelete-cantedit',_binary 's:71:\"You cannot undelete this page as you are not allowed to edit this page.\";'),(_binary 'en',_binary 'messages:undelete-cleanup-error',_binary 's:40:\"Error deleting unused archive file \"$1\".\";'),(_binary 'en',_binary 'messages:undelete-error',_binary 's:21:\"Error undeleting page\";'),(_binary 'en',_binary 'messages:undelete-error-long',_binary 's:54:\"Errors were encountered while undeleting the file:\n\n$1\";'),(_binary 'en',_binary 'messages:undelete-error-short',_binary 's:25:\"Error undeleting file: $1\";'),(_binary 'en',_binary 'messages:undelete-fieldset-title',_binary 's:17:\"Restore revisions\";'),(_binary 'en',_binary 'messages:undelete-filename-mismatch',_binary 's:67:\"Cannot undelete file revision with timestamp $1: Filename mismatch.\";'),(_binary 'en',_binary 'messages:undelete-header',_binary 's:71:\"See [[Special:Log/delete|the deletion log]] for recently deleted pages.\";'),(_binary 'en',_binary 'messages:undelete-missing-filearchive',_binary 's:107:\"Unable to restore file archive ID $1 because it is not in the database.\nIt may have already been undeleted.\";'),(_binary 'en',_binary 'messages:undelete-no-results',_binary 's:48:\"No matching pages found in the deletion archive.\";'),(_binary 'en',_binary 'messages:undelete-nodiff',_binary 's:27:\"No previous revision found.\";'),(_binary 'en',_binary 'messages:undelete-revision',_binary 's:47:\"Deleted revision of $1 (as of $4, at $5) by $3:\";'),(_binary 'en',_binary 'messages:undelete-revision-row2',_binary 's:29:\"$1 ($2) $3 . . $4 $5 $6 $7 $8\";'),(_binary 'en',_binary 'messages:undelete-search-box',_binary 's:20:\"Search deleted pages\";'),(_binary 'en',_binary 'messages:undelete-search-full',_binary 's:28:\"Show page titles containing:\";'),(_binary 'en',_binary 'messages:undelete-search-prefix',_binary 's:25:\"Show pages starting with:\";'),(_binary 'en',_binary 'messages:undelete-search-submit',_binary 's:6:\"Search\";'),(_binary 'en',_binary 'messages:undelete-search-title',_binary 's:20:\"Search deleted pages\";'),(_binary 'en',_binary 'messages:undelete-show-file-confirm',_binary 's:99:\"Are you sure you want to view the deleted revision of the file \"<nowiki>$1</nowiki>\" from $2 at $3?\";'),(_binary 'en',_binary 'messages:undelete-show-file-submit',_binary 's:3:\"Yes\";'),(_binary 'en',_binary 'messages:undelete-summary',_binary 's:0:\"\";'),(_binary 'en',_binary 'messages:undelete_short',_binary 's:40:\"Undelete {{PLURAL:$1|one edit|$1 edits}}\";'),(_binary 'en',_binary 'messages:undeletebtn',_binary 's:7:\"Restore\";'),(_binary 'en',_binary 'messages:undeletecomment',_binary 's:7:\"Reason:\";'),(_binary 'en',_binary 'messages:undeletedarticle',_binary 's:17:\"restored \"[[$1]]\"\";'),(_binary 'en',_binary 'messages:undeletedpage',_binary 's:137:\"<strong>$1 has been restored</strong>\n\nConsult the [[Special:Log/delete|deletion log]] for a record of recent deletions and restorations.\";'),(_binary 'en',_binary 'messages:undeleteextrahelp',_binary 's:282:\"To restore the page\'s entire history, leave all checkboxes deselected and click <strong><em>{{int:undeletebtn}}</em></strong>.\nTo perform a selective restoration, check the boxes corresponding to the revisions to be restored, and click <strong><em>{{int:undeletebtn}}</em></strong>.\";'),(_binary 'en',_binary 'messages:undeletehistory',_binary 's:198:\"If you restore the page, all revisions will be restored to the history.\nIf a new page with the same name has been created since the deletion, the restored revisions will appear in the prior history.\";'),(_binary 'en',_binary 'messages:undeletehistorynoadmin',_binary 's:236:\"This page has been deleted.\nThe reason for deletion is shown in the summary below, along with details of the users who had edited this page before deletion.\nThe actual text of these deleted revisions is only available to administrators.\";'),(_binary 'en',_binary 'messages:undeleteinvert',_binary 's:16:\"Invert selection\";'),(_binary 'en',_binary 'messages:undeletelink',_binary 's:12:\"view/restore\";'),(_binary 'en',_binary 'messages:undeletepage',_binary 's:30:\"View and restore deleted pages\";'),(_binary 'en',_binary 'messages:undeletepagetext',_binary 's:178:\"The following {{PLURAL:$1|page has been deleted but is|$1 pages have been deleted but are}} still in the archive and can be restored.\nThe archive may be periodically cleaned out.\";'),(_binary 'en',_binary 'messages:undeletepagetitle',_binary 's:75:\"<strong>The following consists of deleted revisions of [[:$1|$1]]</strong>.\";'),(_binary 'en',_binary 'messages:undeleterevdel',_binary 's:179:\"Undeletion will not be performed if it will result in the top page or file revision being partially deleted.\nIn such cases, you must uncheck or unhide the newest deleted revision.\";'),(_binary 'en',_binary 'messages:undeleterevision-duplicate-revid',_binary 's:134:\"{{PLURAL:$1|One revision|$1 revisions}} could not be restored, because {{PLURAL:$1|its|their}} <code>rev_id</code> was already in use.\";'),(_binary 'en',_binary 'messages:undeleterevision-missing',_binary 's:121:\"Invalid or missing revision.\nYou may have a bad link, or the revision may have been restored or removed from the archive.\";'),(_binary 'en',_binary 'messages:undeleterevisions',_binary 's:43:\"$1 {{PLURAL:$1|revision|revisions}} deleted\";'),(_binary 'en',_binary 'messages:undeleteviewlink',_binary 's:4:\"view\";'),(_binary 'en',_binary 'messages:underline-always',_binary 's:6:\"Always\";'),(_binary 'en',_binary 'messages:underline-default',_binary 's:23:\"Skin or browser default\";'),(_binary 'en',_binary 'messages:underline-never',_binary 's:5:\"Never\";'),(_binary 'en',_binary 'messages:undo-failure',_binary 's:67:\"The edit could not be undone due to conflicting intermediate edits.\";'),(_binary 'en',_binary 'messages:undo-main-slot-only',_binary 's:79:\"The edit could not be undone because it involves content outside the main slot.\";'),(_binary 'en',_binary 'messages:undo-nochange',_binary 's:45:\"The edit appears to have already been undone.\";'),(_binary 'en',_binary 'messages:undo-norev',_binary 's:70:\"The edit could not be undone because it does not exist or was deleted.\";'),(_binary 'en',_binary 'messages:undo-success',_binary 's:161:\"The edit can be undone.\nPlease check the comparison below to verify that this is what you want to do, and then save the changes below to finish undoing the edit.\";'),(_binary 'en',_binary 'messages:undo-summary',_binary 's:75:\"Undo revision $1 by [[Special:Contributions/$2|$2]] ([[User talk:$2|talk]])\";'),(_binary 'en',_binary 'messages:undo-summary-username-hidden',_binary 's:33:\"Undo revision $1 by a hidden user\";'),(_binary 'en',_binary 'messages:unexpected',_binary 's:28:\"Unexpected value: \"$1\"=\"$2\".\";'),(_binary 'en',_binary 'messages:unicode-support-fail',_binary 's:112:\"It appears that your browser does not support Unicode. It is required to edit pages, so your edit was not saved.\";'),(_binary 'en',_binary 'messages:unit-pixel',_binary 's:2:\"px\";'),(_binary 'en',_binary 'messages:unknown-error',_binary 's:26:\"An unknown error occurred.\";'),(_binary 'en',_binary 'messages:unlinkaccounts',_binary 's:15:\"Unlink accounts\";'),(_binary 'en',_binary 'messages:unlinkaccounts-success',_binary 's:25:\"The account was unlinked.\";'),(_binary 'en',_binary 'messages:unlockbtn',_binary 's:15:\"Unlock database\";'),(_binary 'en',_binary 'messages:unlockconfirm',_binary 's:42:\"Yes, I really want to unlock the database.\";'),(_binary 'en',_binary 'messages:unlockdb',_binary 's:15:\"Unlock database\";'),(_binary 'en',_binary 'messages:unlockdbsuccesssub',_binary 's:21:\"Database lock removed\";'),(_binary 'en',_binary 'messages:unlockdbsuccesstext',_binary 's:31:\"The database has been unlocked.\";'),(_binary 'en',_binary 'messages:unlockdbtext',_binary 's:227:\"Unlocking the database will restore the ability of all users to edit pages, change their preferences, edit their watchlists, and other things requiring changes in the database.\nPlease confirm that this is what you intend to do.\";'),(_binary 'en',_binary 'messages:unpatrolledletter',_binary 's:1:\"!\";'),(_binary 'en',_binary 'messages:unprotect',_binary 's:17:\"Change protection\";'),(_binary 'en',_binary 'messages:unprotected-js',_binary 's:151:\"For security reasons JavaScript cannot be loaded from unprotected pages. Please only create javascript in the MediaWiki: namespace or as a User subpage\";'),(_binary 'en',_binary 'messages:unprotectedarticle',_binary 's:32:\"removed protection from \"[[$1]]\"\";'),(_binary 'en',_binary 'messages:unprotectedarticle-comment',_binary 's:46:\"{{GENDER:$2|Removed protection}} from \"[[$1]]\"\";'),(_binary 'en',_binary 'messages:unregistered-user-config',_binary 's:100:\"For security reasons JavaScript, CSS and JSON user subpages cannot be loaded for unregistered users.\";'),(_binary 'en',_binary 'messages:unstrip-depth-category',_binary 's:47:\"Pages where the unstrip depth limit is exceeded\";'),(_binary 'en',_binary 'messages:unstrip-depth-warning',_binary 's:33:\"Unstrip depth limit exceeded ($1)\";'),(_binary 'en',_binary 'messages:unstrip-size-category',_binary 's:46:\"Pages where the unstrip size limit is exceeded\";'),(_binary 'en',_binary 'messages:unstrip-size-warning',_binary 's:32:\"Unstrip size limit exceeded ($1)\";'),(_binary 'en',_binary 'messages:unusedcategories',_binary 's:17:\"Unused categories\";'),(_binary 'en',_binary 'messages:unusedcategories-summary',_binary 's:0:\"\";'),(_binary 'en',_binary 'messages:unusedcategoriestext',_binary 's:89:\"The following category pages exist, although no other page or category makes use of them.\";'),(_binary 'en',_binary 'messages:unusedimages',_binary 's:12:\"Unused files\";'),(_binary 'en',_binary 'messages:unusedimages-summary',_binary 's:0:\"\";'),(_binary 'en',_binary 'messages:unusedimagestext',_binary 's:191:\"The following files exist but are not embedded in any page.\nPlease note that other web sites may link to a file with a direct URL, and so may still be listed here despite being in active use.\";'),(_binary 'en',_binary 'messages:unusedtemplates',_binary 's:16:\"Unused templates\";'),(_binary 'en',_binary 'messages:unusedtemplates-summary',_binary 's:0:\"\";'),(_binary 'en',_binary 'messages:unusedtemplatestext',_binary 's:170:\"This page lists all pages in the {{ns:template}} namespace that are not included in another page.\nRemember to check for other links to the templates before deleting them.\";'),(_binary 'en',_binary 'messages:unusedtemplateswlh',_binary 's:11:\"other links\";'),(_binary 'en',_binary 'messages:unwatch',_binary 's:7:\"Unwatch\";'),(_binary 'en',_binary 'messages:unwatchedpages',_binary 's:15:\"Unwatched pages\";'),(_binary 'en',_binary 'messages:unwatchedpages-summary',_binary 's:0:\"\";'),(_binary 'en',_binary 'messages:unwatching',_binary 's:13:\"Unwatching...\";'),(_binary 'en',_binary 'messages:unwatchthispage',_binary 's:13:\"Stop watching\";'),(_binary 'en',_binary 'messages:updated',_binary 's:9:\"(Updated)\";'),(_binary 'en',_binary 'messages:updatedmarker',_binary 's:27:\"updated since my last visit\";'),(_binary 'en',_binary 'messages:upload',_binary 's:11:\"Upload file\";'),(_binary 'en',_binary 'messages:upload-copy-upload-invalid-domain',_binary 's:48:\"Copy uploads are not available from this domain.\";'),(_binary 'en',_binary 'messages:upload-curl-error28',_binary 's:14:\"Upload timeout\";'),(_binary 'en',_binary 'messages:upload-curl-error28-text',_binary 's:138:\"The site took too long to respond.\nPlease check the site is up, wait a short while and try again.\nYou may want to try at a less busy time.\";'),(_binary 'en',_binary 'messages:upload-curl-error6',_binary 's:19:\"Could not reach URL\";'),(_binary 'en',_binary 'messages:upload-curl-error6-text',_binary 's:102:\"The URL provided could not be reached.\nPlease double-check that the URL is correct and the site is up.\";'),(_binary 'en',_binary 'messages:upload-default-description',_binary 's:1:\"-\";'),(_binary 'en',_binary 'messages:upload-description',_binary 's:16:\"File description\";'),(_binary 'en',_binary 'messages:upload-dialog-button-back',_binary 's:4:\"Back\";'),(_binary 'en',_binary 'messages:upload-dialog-button-cancel',_binary 's:6:\"Cancel\";'),(_binary 'en',_binary 'messages:upload-dialog-button-done',_binary 's:4:\"Done\";'),(_binary 'en',_binary 'messages:upload-dialog-button-save',_binary 's:4:\"Save\";'),(_binary 'en',_binary 'messages:upload-dialog-button-upload',_binary 's:6:\"Upload\";'),(_binary 'en',_binary 'messages:upload-dialog-disabled',_binary 's:57:\"File uploads using this dialog are disabled on this wiki.\";'),(_binary 'en',_binary 'messages:upload-dialog-title',_binary 's:11:\"Upload file\";'),(_binary 'en',_binary 'messages:upload-disallowed-here',_binary 's:31:\"You cannot overwrite this file.\";'),(_binary 'en',_binary 'messages:upload-file-error',_binary 's:14:\"Internal error\";'),(_binary 'en',_binary 'messages:upload-file-error-text',_binary 's:145:\"An internal error occurred when attempting to create a temporary file on the server.\nPlease contact an [[Special:ListUsers/sysop|administrator]].\";'),(_binary 'en',_binary 'messages:upload-foreign-cant-load-config',_binary 's:81:\"Failed to load the configuration for file uploads to the foreign file repository.\";'),(_binary 'en',_binary 'messages:upload-foreign-cant-upload',_binary 's:85:\"This wiki is not configured to upload files to the requested foreign file repository.\";'),(_binary 'en',_binary 'messages:upload-form-label-infoform-categories',_binary 's:10:\"Categories\";'),(_binary 'en',_binary 'messages:upload-form-label-infoform-date',_binary 's:4:\"Date\";'),(_binary 'en',_binary 'messages:upload-form-label-infoform-description',_binary 's:11:\"Description\";'),(_binary 'en',_binary 'messages:upload-form-label-infoform-description-tooltip',_binary 's:135:\"Briefly describe everything notable about the work.\nFor a photo, mention the main things that are depicted, the occasion, or the place.\";'),(_binary 'en',_binary 'messages:upload-form-label-infoform-name',_binary 's:4:\"Name\";'),(_binary 'en',_binary 'messages:upload-form-label-infoform-name-tooltip',_binary 's:147:\"A unique descriptive title for the file, which will serve as a filename. You may use plain language with spaces. Do not include the file extension.\";'),(_binary 'en',_binary 'messages:upload-form-label-infoform-title',_binary 's:7:\"Details\";'),(_binary 'en',_binary 'messages:upload-form-label-not-own-work-local-generic-foreign',_binary 's:139:\"You may also want to try using [[Special:Upload|the upload page on {{SITENAME}}]], if this file can be uploaded there under their policies.\";'),(_binary 'en',_binary 'messages:upload-form-label-not-own-work-local-generic-local',_binary 's:68:\"You may also want to try [[Special:Upload|the default upload page]].\";'),(_binary 'en',_binary 'messages:upload-form-label-not-own-work-message-generic-foreign',_binary 's:133:\"If you are not able to upload this file under the policies of the shared repository, please close this dialog and try another method.\";'),(_binary 'en',_binary 'messages:upload-form-label-not-own-work-message-generic-local',_binary 's:124:\"If you are not able to upload this file under the policies of {{SITENAME}}, please close this dialog and try another method.\";'),(_binary 'en',_binary 'messages:upload-form-label-own-work',_binary 's:19:\"This is my own work\";'),(_binary 'en',_binary 'messages:upload-form-label-own-work-message-generic-foreign',_binary 's:156:\"I understand that I am uploading this file to a shared repository. I confirm that I am doing so following the terms of service and licensing policies there.\";'),(_binary 'en',_binary 'messages:upload-form-label-own-work-message-generic-local',_binary 's:110:\"I confirm that I am uploading this file following the terms of service and licensing policies on {{SITENAME}}.\";'),(_binary 'en',_binary 'messages:upload-form-label-usage-filename',_binary 's:9:\"File name\";'),(_binary 'en',_binary 'messages:upload-form-label-usage-title',_binary 's:5:\"Usage\";'),(_binary 'en',_binary 'messages:upload-http-error',_binary 's:26:\"An HTTP error occurred: $1\";'),(_binary 'en',_binary 'messages:upload-maxfilesize',_binary 's:21:\"Maximum file size: $1\";'),(_binary 'en',_binary 'messages:upload-misc-error',_binary 's:20:\"Unknown upload error\";'),(_binary 'en',_binary 'messages:upload-misc-error-text',_binary 's:189:\"An unknown error occurred during the upload.\nPlease verify that the URL is valid and accessible and try again.\nIf the problem persists, contact an [[Special:ListUsers/sysop|administrator]].\";'),(_binary 'en',_binary 'messages:upload-options',_binary 's:14:\"Upload options\";'),(_binary 'en',_binary 'messages:upload-permitted',_binary 's:44:\"Permitted file {{PLURAL:$2|type|types}}: $1.\";'),(_binary 'en',_binary 'messages:upload-preferred',_binary 's:44:\"Preferred file {{PLURAL:$2|type|types}}: $1.\";'),(_binary 'en',_binary 'messages:upload-prohibited',_binary 's:45:\"Prohibited file {{PLURAL:$2|type|types}}: $1.\";'),(_binary 'en',_binary 'messages:upload-proto-error',_binary 's:18:\"Incorrect protocol\";'),(_binary 'en',_binary 'messages:upload-proto-error-text',_binary 's:87:\"Remote upload requires URLs beginning with <code>http://</code> or <code>ftp://</code>.\";'),(_binary 'en',_binary 'messages:upload-recreate-warning',_binary 's:148:\"<strong>Warning: A file by that name has been deleted or moved.</strong>\n\nThe deletion and move log for this page are provided here for convenience:\";'),(_binary 'en',_binary 'messages:upload-scripted-dtd',_binary 's:68:\"Cannot upload SVG files that contain a non-standard DTD declaration.\";'),(_binary 'en',_binary 'messages:upload-scripted-pi-callback',_binary 's:73:\"Cannot upload a file that contains XML-stylesheet processing instruction.\";'),(_binary 'en',_binary 'messages:upload-source',_binary 's:11:\"Source file\";'),(_binary 'en',_binary 'messages:upload-summary',_binary 's:0:\"\";'),(_binary 'en',_binary 'messages:upload-too-many-redirects',_binary 's:36:\"The URL contained too many redirects\";'),(_binary 'en',_binary 'messages:upload-tryagain',_binary 's:32:\"Submit modified file description\";'),(_binary 'en',_binary 'messages:upload-tryagain-nostash',_binary 's:48:\"Submit re-uploaded file and modified description\";'),(_binary 'en',_binary 'messages:upload_directory_missing',_binary 's:79:\"The upload directory ($1) is missing and could not be created by the webserver.\";'),(_binary 'en',_binary 'messages:upload_directory_read_only',_binary 's:59:\"The upload directory ($1) is not writable by the webserver.\";'),(_binary 'en',_binary 'messages:upload_source_file',_binary 's:37:\"(your chosen file from your computer)\";'),(_binary 'en',_binary 'messages:upload_source_url',_binary 's:56:\"(your chosen file from a valid, publicly accessible URL)\";'),(_binary 'en',_binary 'messages:uploadbtn',_binary 's:11:\"Upload file\";'),(_binary 'en',_binary 'messages:uploaddisabled',_binary 's:17:\"Uploads disabled.\";'),(_binary 'en',_binary 'messages:uploaddisabledtext',_binary 's:26:\"File uploads are disabled.\";'),(_binary 'en',_binary 'messages:uploaded-animate-svg',_binary 's:133:\"Found \"animate\" tag that might be changing href, using the \"from\" attribute <code>&lt;$1 $2=\"$3\"&gt;</code> in the uploaded SVG file.\";'),(_binary 'en',_binary 'messages:uploaded-event-handler-on-svg',_binary 's:82:\"Setting event-handler attributes <code>$1=\"$2\"</code> is not allowed in SVG files.\";'),(_binary 'en',_binary 'messages:uploaded-hostile-svg',_binary 's:59:\"Found unsafe CSS in the style element of uploaded SVG file.\";'),(_binary 'en',_binary 'messages:uploaded-href-attribute-svg',_binary 's:282:\"<a> elements can only link (href) to data: (embedded file), http:// or https://, or fragment (#, same-document) targets.  For other elements, such as <image>, only data: and fragment are allowed.  Try embedding images when exporting your SVG.  Found <code>&lt;$1 $2=\"$3\"&gt;</code>.\";'),(_binary 'en',_binary 'messages:uploaded-href-unsafe-target-svg',_binary 's:95:\"Found href to unsafe data: URI target <code>&lt;$1 $2=\"$3\"&gt;</code> in the uploaded SVG file.\";'),(_binary 'en',_binary 'messages:uploaded-image-filter-svg',_binary 's:86:\"Found image filter with URL: <code>&lt;$1 $2=\"$3\"&gt;</code> in the uploaded SVG file.\";'),(_binary 'en',_binary 'messages:uploaded-remote-url-svg',_binary 's:114:\"SVG that sets any style attribute with remote URL is blocked. Found <code>$1=\"$2\"</code> in the uploaded SVG file.\";'),(_binary 'en',_binary 'messages:uploaded-script-svg',_binary 's:55:\"Found scriptable element \"$1\" in the uploaded SVG file.\";'),(_binary 'en',_binary 'messages:uploaded-setting-event-handler-svg',_binary 's:108:\"Setting event-handler attributes is blocked, found <code>&lt;$1 $2=\"$3\"&gt;</code> in the uploaded SVG file.\";'),(_binary 'en',_binary 'messages:uploaded-setting-handler-svg',_binary 's:126:\"SVG that sets the \"handler\" attribute with remote/data/script is blocked. Found <code>$1=\"$2\"</code> in the uploaded SVG file.\";'),(_binary 'en',_binary 'messages:uploaded-setting-href-svg',_binary 's:73:\"Using the \"set\" tag to add \"href\" attribute to parent element is blocked.\";'),(_binary 'en',_binary 'messages:uploaded-wrong-setting-svg',_binary 's:148:\"Using the \"set\" tag to add a remote/data/script target to any attribute is blocked. Found <code>&lt;set to=\"$1\"&gt;</code> in the uploaded SVG file.\";'),(_binary 'en',_binary 'messages:uploadedimage',_binary 's:17:\"uploaded \"[[$1]]\"\";'),(_binary 'en',_binary 'messages:uploaderror',_binary 's:12:\"Upload error\";'),(_binary 'en',_binary 'messages:uploadfooter',_binary 's:1:\"-\";'),(_binary 'en',_binary 'messages:uploadinvalidxml',_binary 's:49:\"The XML in the uploaded file could not be parsed.\";'),(_binary 'en',_binary 'messages:uploadjava',_binary 's:153:\"The file is a ZIP file that contains a Java .class file.\nUploading Java files is not allowed because they can cause security restrictions to be bypassed.\";'),(_binary 'en',_binary 'messages:uploadlogpage',_binary 's:10:\"Upload log\";'),(_binary 'en',_binary 'messages:uploadlogpagetext',_binary 's:126:\"Below is a list of the most recent file uploads.\nSee the [[Special:NewFiles|gallery of new files]] for a more visual overview.\";'),(_binary 'en',_binary 'messages:uploadnewversion-linktext',_binary 's:33:\"Upload a new version of this file\";'),(_binary 'en',_binary 'messages:uploadnologin',_binary 's:13:\"Not logged in\";'),(_binary 'en',_binary 'messages:uploadnologintext',_binary 's:26:\"Please $1 to upload files.\";'),(_binary 'en',_binary 'messages:uploadscripted',_binary 's:92:\"This file contains HTML or script code that may be erroneously interpreted by a web browser.\";'),(_binary 'en',_binary 'messages:uploadscriptednamespace',_binary 's:66:\"This SVG file contains an illegal namespace \"<nowiki>$1</nowiki>\".\";'),(_binary 'en',_binary 'messages:uploadstash',_binary 's:12:\"Upload stash\";'),(_binary 'en',_binary 'messages:uploadstash-bad-path',_binary 's:19:\"Path doesn\'t exist.\";'),(_binary 'en',_binary 'messages:uploadstash-bad-path-bad-format',_binary 's:35:\"Key \"$1\" is not in a proper format.\";'),(_binary 'en',_binary 'messages:uploadstash-bad-path-invalid',_binary 's:18:\"Path is not valid.\";'),(_binary 'en',_binary 'messages:uploadstash-bad-path-no-handler',_binary 's:40:\"No handler found for mime $1 of file $2.\";'),(_binary 'en',_binary 'messages:uploadstash-bad-path-unknown-type',_binary 's:18:\"Unknown type \"$1\".\";'),(_binary 'en',_binary 'messages:uploadstash-bad-path-unrecognized-thumb-name',_binary 's:24:\"Unrecognized thumb name.\";'),(_binary 'en',_binary 'messages:uploadstash-badtoken',_binary 's:98:\"Performing that action failed, perhaps because your editing credentials expired. Please try again.\";'),(_binary 'en',_binary 'messages:uploadstash-clear',_binary 's:19:\"Clear stashed files\";'),(_binary 'en',_binary 'messages:uploadstash-errclear',_binary 's:26:\"Clearing the files failed.\";'),(_binary 'en',_binary 'messages:uploadstash-exception',_binary 's:47:\"Could not store upload in the stash ($1): \"$2\".\";'),(_binary 'en',_binary 'messages:uploadstash-file-not-found',_binary 's:28:\"Key \"$1\" not found in stash.\";'),(_binary 'en',_binary 'messages:uploadstash-file-not-found-missing-content-type',_binary 's:28:\"Missing content-type header.\";'),(_binary 'en',_binary 'messages:uploadstash-file-not-found-no-local-path',_binary 's:30:\"No local path for scaled item.\";'),(_binary 'en',_binary 'messages:uploadstash-file-not-found-no-object',_binary 's:48:\"Couldn\'t create local file object for thumbnail.\";'),(_binary 'en',_binary 'messages:uploadstash-file-not-found-no-remote-thumb',_binary 's:38:\"Fetching thumbnail failed: $1\nURL = $2\";'),(_binary 'en',_binary 'messages:uploadstash-file-not-found-no-thumb',_binary 's:27:\"Could not obtain thumbnail.\";'),(_binary 'en',_binary 'messages:uploadstash-file-not-found-not-exists',_binary 's:38:\"Cannot find path, or not a plain file.\";'),(_binary 'en',_binary 'messages:uploadstash-file-too-large',_binary 's:41:\"Cannot serve a file larger than $1 bytes.\";'),(_binary 'en',_binary 'messages:uploadstash-no-extension',_binary 's:18:\"Extension is null.\";'),(_binary 'en',_binary 'messages:uploadstash-no-such-key',_binary 's:32:\"No such key ($1), cannot remove.\";'),(_binary 'en',_binary 'messages:uploadstash-nofiles',_binary 's:26:\"You have no stashed files.\";'),(_binary 'en',_binary 'messages:uploadstash-not-logged-in',_binary 's:49:\"No user is logged in, files must belong to users.\";'),(_binary 'en',_binary 'messages:uploadstash-refresh',_binary 's:25:\"Refresh the list of files\";'),(_binary 'en',_binary 'messages:uploadstash-summary',_binary 's:193:\"This page provides access to files that are uploaded or in the process of uploading, but are not yet published to the wiki. These files are not visible to anyone but the user who uploaded them.\";'),(_binary 'en',_binary 'messages:uploadstash-thumbnail',_binary 's:14:\"view thumbnail\";'),(_binary 'en',_binary 'messages:uploadstash-wrong-owner',_binary 's:50:\"This file ($1) doesn\'t belong to the current user.\";'),(_binary 'en',_binary 'messages:uploadstash-zero-length',_binary 's:20:\"File is zero length.\";'),(_binary 'en',_binary 'messages:uploadtext',_binary 's:820:\"Use the form below to upload files.\nTo view or search previously uploaded files go to the [[Special:FileList|list of uploaded files]], (re)uploads are also logged in the [[Special:Log/upload|upload log]], deletions in the [[Special:Log/delete|deletion log]].\n\nTo include a file in a page, use a link in one of the following forms:\n* <strong><code><nowiki>[[</nowiki>{{ns:file}}<nowiki>:File.jpg]]</nowiki></code></strong> to use the full version of the file\n* <strong><code><nowiki>[[</nowiki>{{ns:file}}<nowiki>:File.png|200px|thumb|left|alt text]]</nowiki></code></strong> to use a 200 pixel wide rendition in a box in the left margin with \"alt text\" as description\n* <strong><code><nowiki>[[</nowiki>{{ns:media}}<nowiki>:File.ogg]]</nowiki></code></strong> for directly linking to the file without displaying the file\";'),(_binary 'en',_binary 'messages:uploadvirus',_binary 's:38:\"The file contains a virus!\nDetails: $1\";'),(_binary 'en',_binary 'messages:uploadwarning',_binary 's:14:\"Upload warning\";'),(_binary 'en',_binary 'messages:uploadwarning-text',_binary 's:55:\"Please modify the file description below and try again.\";'),(_binary 'en',_binary 'messages:uploadwarning-text-nostash',_binary 's:70:\"Please re-upload the file, modify the description below and try again.\";'),(_binary 'en',_binary 'messages:user-mail-no-addy',_binary 's:45:\"Tried to send email without an email address.\";'),(_binary 'en',_binary 'messages:user-mail-no-body',_binary 's:61:\"Tried to send email with an empty or unreasonably short body.\";'),(_binary 'en',_binary 'messages:usercreated',_binary 's:33:\"{{GENDER:$3|Created}} on $1 at $2\";'),(_binary 'en',_binary 'messages:usercssispublic',_binary 's:99:\"Please note: CSS subpages should not contain confidential data as they are viewable by other users.\";'),(_binary 'en',_binary 'messages:usercsspreview',_binary 's:96:\"<strong>Remember that you are only previewing your user CSS.\nIt has not yet been saved!</strong>\";'),(_binary 'en',_binary 'messages:usercssyoucanpreview',_binary 's:94:\"<strong>Tip:</strong> Use the \"{{int:showpreview}}\" button to test your new CSS before saving.\";'),(_binary 'en',_binary 'messages:usereditcount',_binary 's:27:\"$1 {{PLURAL:$1|edit|edits}}\";'),(_binary 'en',_binary 'messages:userexists',_binary 's:64:\"Username entered already in use.\nPlease choose a different name.\";'),(_binary 'en',_binary 'messages:userinvalidconfigtitle',_binary 's:179:\"<strong>Warning:</strong> There is no skin \"$1\".\nCustom .css, .json, and .js pages use a lowercase title, e.g. {{ns:user}}:Foo/vector.css as opposed to {{ns:user}}:Foo/Vector.css.\";'),(_binary 'en',_binary 'messages:userjsispublic',_binary 's:106:\"Please note: JavaScript subpages should not contain confidential data as they are viewable by other users.\";'),(_binary 'en',_binary 'messages:userjsonispublic',_binary 's:100:\"Please note: JSON subpages should not contain confidential data as they are viewable by other users.\";'),(_binary 'en',_binary 'messages:userjsonpreview',_binary 's:112:\"<strong>Remember that you are only testing/previewing your user JSON config.\nIt has not yet been saved!</strong>\";'),(_binary 'en',_binary 'messages:userjsonyoucanpreview',_binary 's:95:\"<strong>Tip:</strong> Use the \"{{int:showpreview}}\" button to test your new JSON before saving.\";'),(_binary 'en',_binary 'messages:userjspreview',_binary 's:111:\"<strong>Remember that you are only testing/previewing your user JavaScript.\nIt has not yet been saved!</strong>\";'),(_binary 'en',_binary 'messages:userjsyoucanpreview',_binary 's:101:\"<strong>Tip:</strong> Use the \"{{int:showpreview}}\" button to test your new JavaScript before saving.\";'),(_binary 'en',_binary 'messages:userlogin-createanother',_binary 's:22:\"Create another account\";'),(_binary 'en',_binary 'messages:userlogin-helplink2',_binary 's:20:\"Help with logging in\";'),(_binary 'en',_binary 'messages:userlogin-joinproject',_binary 's:17:\"Join {{SITENAME}}\";'),(_binary 'en',_binary 'messages:userlogin-loggedin',_binary 's:92:\"You are already logged in as {{GENDER:$1|$1}}.\nUse the form below to log in as another user.\";'),(_binary 'en',_binary 'messages:userlogin-noaccount',_binary 's:22:\"Don\'t have an account?\";'),(_binary 'en',_binary 'messages:userlogin-reauth',_binary 's:62:\"You must log in again to verify that you are {{GENDER:$1|$1}}.\";'),(_binary 'en',_binary 'messages:userlogin-remembermypassword',_binary 's:17:\"Keep me logged in\";'),(_binary 'en',_binary 'messages:userlogin-resetpassword-link',_binary 's:21:\"Forgot your password?\";'),(_binary 'en',_binary 'messages:userlogin-signwithsecure',_binary 's:21:\"Use secure connection\";'),(_binary 'en',_binary 'messages:userlogin-yourname',_binary 's:8:\"Username\";'),(_binary 'en',_binary 'messages:userlogin-yourname-ph',_binary 's:19:\"Enter your username\";'),(_binary 'en',_binary 'messages:userlogin-yourpassword',_binary 's:8:\"Password\";'),(_binary 'en',_binary 'messages:userlogin-yourpassword-ph',_binary 's:19:\"Enter your password\";'),(_binary 'en',_binary 'messages:userlogout',_binary 's:7:\"Log out\";'),(_binary 'en',_binary 'messages:userlogout-summary',_binary 's:0:\"\";'),(_binary 'en',_binary 'messages:usermaildisabled',_binary 's:19:\"User email disabled\";'),(_binary 'en',_binary 'messages:usermaildisabledtext',_binary 's:49:\"You cannot send email to other users on this wiki\";'),(_binary 'en',_binary 'messages:usermessage-editor',_binary 's:16:\"System messenger\";'),(_binary 'en',_binary 'messages:usermessage-summary',_binary 's:23:\"Leaving system message.\";'),(_binary 'en',_binary 'messages:usermessage-template',_binary 's:21:\"MediaWiki:UserMessage\";'),(_binary 'en',_binary 'messages:username',_binary 's:23:\"{{GENDER:$1|Username}}:\";'),(_binary 'en',_binary 'messages:usernameinprogress',_binary 's:75:\"An account creation for this user name is already in progress.\nPlease wait.\";'),(_binary 'en',_binary 'messages:userpage-userdoesnotexist',_binary 's:87:\"User account \"$1\" is not registered.\nPlease check if you want to create/edit this page.\";'),(_binary 'en',_binary 'messages:userpage-userdoesnotexist-view',_binary 's:36:\"User account \"$1\" is not registered.\";'),(_binary 'en',_binary 'messages:userrights',_binary 's:11:\"User rights\";'),(_binary 'en',_binary 'messages:userrights-cannot-shorten-expiry',_binary 's:152:\"You cannot bring forward the expiry of membership in group \"$1\". Only users with permission to add and remove this group can bring forward expiry times.\";'),(_binary 'en',_binary 'messages:userrights-changeable-col',_binary 's:21:\"Groups you can change\";'),(_binary 'en',_binary 'messages:userrights-conflict',_binary 's:72:\"Conflict of user rights changes! Please review and confirm your changes.\";'),(_binary 'en',_binary 'messages:userrights-editusergroup',_binary 's:30:\"Edit {{GENDER:$1|user}} groups\";'),(_binary 'en',_binary 'messages:userrights-expiry',_binary 's:8:\"Expires:\";'),(_binary 'en',_binary 'messages:userrights-expiry-current',_binary 's:10:\"Expires $1\";'),(_binary 'en',_binary 'messages:userrights-expiry-existing',_binary 's:32:\"Existing expiration time: $3, $2\";'),(_binary 'en',_binary 'messages:userrights-expiry-in-past',_binary 's:46:\"The expiry time for group \"$1\" is in the past.\";'),(_binary 'en',_binary 'messages:userrights-expiry-none',_binary 's:15:\"Does not expire\";'),(_binary 'en',_binary 'messages:userrights-expiry-options',_binary 's:91:\"1 day:1 day,1 week:1 week,1 month:1 month,3 months:3 months,6 months:6 months,1 year:1 year\";'),(_binary 'en',_binary 'messages:userrights-expiry-othertime',_binary 's:11:\"Other time:\";'),(_binary 'en',_binary 'messages:userrights-groups-help',_binary 's:352:\"You may alter the groups this user is in:\n* A checked box means the user is in that group.\n* An unchecked box means the user is not in that group.\n* A * indicates that you cannot remove the group once you have added it, or vice versa.\n* A # indicates that you can only put back the expiration time of this group membership; you cannot bring it forward.\";'),(_binary 'en',_binary 'messages:userrights-groupsmember',_binary 's:10:\"Member of:\";'),(_binary 'en',_binary 'messages:userrights-groupsmember-auto',_binary 's:19:\"Implicit member of:\";'),(_binary 'en',_binary 'messages:userrights-groupsmember-type',_binary 's:2:\"$1\";'),(_binary 'en',_binary 'messages:userrights-invalid-expiry',_binary 's:42:\"The expiry time for group \"$1\" is invalid.\";'),(_binary 'en',_binary 'messages:userrights-irreversible-marker',_binary 's:3:\"$1*\";'),(_binary 'en',_binary 'messages:userrights-lookup-user',_binary 's:13:\"Select a user\";'),(_binary 'en',_binary 'messages:userrights-no-interwiki',_binary 's:62:\"You do not have permission to edit user rights on other wikis.\";'),(_binary 'en',_binary 'messages:userrights-no-shorten-expiry-marker',_binary 's:3:\"$1#\";'),(_binary 'en',_binary 'messages:userrights-nodatabase',_binary 's:43:\"Database $1 does not exist or is not local.\";'),(_binary 'en',_binary 'messages:userrights-reason',_binary 's:7:\"Reason:\";'),(_binary 'en',_binary 'messages:userrights-summary',_binary 's:0:\"\";'),(_binary 'en',_binary 'messages:userrights-unchangeable-col',_binary 's:24:\"Groups you cannot change\";'),(_binary 'en',_binary 'messages:userrights-user-editname',_binary 's:17:\"Enter a username:\";'),(_binary 'en',_binary 'messages:userrights-viewusergroup',_binary 's:30:\"View {{GENDER:$1|user}} groups\";'),(_binary 'en',_binary 'messages:variantname-crh',_binary 's:3:\"crh\";'),(_binary 'en',_binary 'messages:variantname-crh-cyrl',_binary 's:8:\"crh-Cyrl\";'),(_binary 'en',_binary 'messages:variantname-crh-latn',_binary 's:8:\"crh-Latn\";'),(_binary 'en',_binary 'messages:variantname-gan',_binary 's:3:\"gan\";'),(_binary 'en',_binary 'messages:variantname-gan-hans',_binary 's:4:\"hans\";'),(_binary 'en',_binary 'messages:variantname-gan-hant',_binary 's:4:\"hant\";'),(_binary 'en',_binary 'messages:variantname-ike-cans',_binary 's:8:\"ike-Cans\";'),(_binary 'en',_binary 'messages:variantname-ike-latn',_binary 's:8:\"ike-Latn\";'),(_binary 'en',_binary 'messages:variantname-iu',_binary 's:2:\"iu\";'),(_binary 'en',_binary 'messages:variantname-kk',_binary 's:2:\"kk\";'),(_binary 'en',_binary 'messages:variantname-kk-arab',_binary 's:7:\"kk-arab\";'),(_binary 'en',_binary 'messages:variantname-kk-cn',_binary 's:5:\"kk-cn\";'),(_binary 'en',_binary 'messages:variantname-kk-cyrl',_binary 's:7:\"kk-cyrl\";'),(_binary 'en',_binary 'messages:variantname-kk-kz',_binary 's:5:\"kk-kz\";'),(_binary 'en',_binary 'messages:variantname-kk-latn',_binary 's:7:\"kk-latn\";'),(_binary 'en',_binary 'messages:variantname-kk-tr',_binary 's:5:\"kk-tr\";'),(_binary 'en',_binary 'messages:variantname-ku',_binary 's:2:\"ku\";'),(_binary 'en',_binary 'messages:variantname-ku-arab',_binary 's:7:\"ku-Arab\";'),(_binary 'en',_binary 'messages:variantname-ku-latn',_binary 's:7:\"ku-Latn\";'),(_binary 'en',_binary 'messages:variantname-shi',_binary 's:3:\"shi\";'),(_binary 'en',_binary 'messages:variantname-shi-latn',_binary 's:8:\"shi-Latn\";'),(_binary 'en',_binary 'messages:variantname-shi-tfng',_binary 's:8:\"shi-Tfng\";'),(_binary 'en',_binary 'messages:variantname-sr',_binary 's:2:\"sr\";'),(_binary 'en',_binary 'messages:variantname-sr-ec',_binary 's:5:\"sr-ec\";'),(_binary 'en',_binary 'messages:variantname-sr-el',_binary 's:5:\"sr-el\";'),(_binary 'en',_binary 'messages:variantname-tg',_binary 's:2:\"tg\";'),(_binary 'en',_binary 'messages:variantname-tg-cyrl',_binary 's:7:\"tg-Cyrl\";'),(_binary 'en',_binary 'messages:variantname-tg-latn',_binary 's:7:\"tg-Latn\";'),(_binary 'en',_binary 'messages:variantname-uz',_binary 's:2:\"uz\";'),(_binary 'en',_binary 'messages:variantname-uz-cyrl',_binary 's:7:\"uz-Cyrl\";'),(_binary 'en',_binary 'messages:variantname-uz-latn',_binary 's:7:\"uz-Latn\";'),(_binary 'en',_binary 'messages:variantname-zh',_binary 's:2:\"zh\";'),(_binary 'en',_binary 'messages:variantname-zh-cn',_binary 's:2:\"cn\";'),(_binary 'en',_binary 'messages:variantname-zh-hans',_binary 's:4:\"hans\";'),(_binary 'en',_binary 'messages:variantname-zh-hant',_binary 's:4:\"hant\";'),(_binary 'en',_binary 'messages:variantname-zh-hk',_binary 's:2:\"hk\";'),(_binary 'en',_binary 'messages:variantname-zh-mo',_binary 's:2:\"mo\";'),(_binary 'en',_binary 'messages:variantname-zh-my',_binary 's:2:\"my\";'),(_binary 'en',_binary 'messages:variantname-zh-sg',_binary 's:2:\"sg\";'),(_binary 'en',_binary 'messages:variantname-zh-tw',_binary 's:2:\"tw\";'),(_binary 'en',_binary 'messages:variants',_binary 's:8:\"Variants\";'),(_binary 'en',_binary 'messages:vector-action-addsection',_binary 's:9:\"Add topic\";'),(_binary 'en',_binary 'messages:vector-action-delete',_binary 's:6:\"Delete\";'),(_binary 'en',_binary 'messages:vector-action-move',_binary 's:4:\"Move\";'),(_binary 'en',_binary 'messages:vector-action-protect',_binary 's:7:\"Protect\";'),(_binary 'en',_binary 'messages:vector-action-undelete',_binary 's:8:\"Undelete\";'),(_binary 'en',_binary 'messages:vector-action-unprotect',_binary 's:17:\"Change protection\";'),(_binary 'en',_binary 'messages:vector-jumptonavigation',_binary 's:18:\"Jump to navigation\";'),(_binary 'en',_binary 'messages:vector-jumptosearch',_binary 's:14:\"Jump to search\";'),(_binary 'en',_binary 'messages:vector-more-actions',_binary 's:4:\"More\";'),(_binary 'en',_binary 'messages:vector-skin-desc',_binary 's:74:\"Modern version of MonoBook with fresh look and many usability improvements\";'),(_binary 'en',_binary 'messages:vector-view-create',_binary 's:6:\"Create\";'),(_binary 'en',_binary 'messages:vector-view-edit',_binary 's:4:\"Edit\";'),(_binary 'en',_binary 'messages:vector-view-history',_binary 's:12:\"View history\";'),(_binary 'en',_binary 'messages:vector-view-view',_binary 's:4:\"Read\";'),(_binary 'en',_binary 'messages:vector-view-viewsource',_binary 's:11:\"View source\";'),(_binary 'en',_binary 'messages:vector.css',_binary 's:58:\"/* CSS placed here will affect users of the Vector skin */\";'),(_binary 'en',_binary 'messages:vector.js',_binary 's:72:\"/* Any JavaScript here will be loaded for users using the Vector skin */\";'),(_binary 'en',_binary 'messages:verification-error',_binary 's:41:\"This file did not pass file verification.\";'),(_binary 'en',_binary 'messages:version',_binary 's:7:\"Version\";'),(_binary 'en',_binary 'messages:version-antispam',_binary 's:15:\"Spam prevention\";'),(_binary 'en',_binary 'messages:version-api',_binary 's:3:\"API\";'),(_binary 'en',_binary 'messages:version-credits-not-found',_binary 's:61:\"No detailed credits information was found for this extension.\";'),(_binary 'en',_binary 'messages:version-credits-summary',_binary 's:105:\"We would like to recognize the following persons for their contribution to [[Special:Version|MediaWiki]].\";'),(_binary 'en',_binary 'messages:version-credits-title',_binary 's:14:\"Credits for $1\";'),(_binary 'en',_binary 'messages:version-db-mariadb-url',_binary 's:20:\"https://mariadb.org/\";'),(_binary 'en',_binary 'messages:version-db-mssql-url',_binary 's:30:\"https://www.microsoft.com/sql/\";'),(_binary 'en',_binary 'messages:version-db-mysql-url',_binary 's:22:\"https://www.mysql.com/\";'),(_binary 'en',_binary 'messages:version-db-oracle-url',_binary 's:31:\"http://www.oracle.com/database/\";'),(_binary 'en',_binary 'messages:version-db-percona-url',_binary 's:46:\"http://www.percona.com/software/percona-server\";'),(_binary 'en',_binary 'messages:version-db-postgres-url',_binary 's:26:\"http://www.postgresql.org/\";'),(_binary 'en',_binary 'messages:version-db-sqlite-url',_binary 's:23:\"https://www.sqlite.org/\";'),(_binary 'en',_binary 'messages:version-editors',_binary 's:7:\"Editors\";'),(_binary 'en',_binary 'messages:version-entrypoints',_binary 's:16:\"Entry point URLs\";'),(_binary 'en',_binary 'messages:version-entrypoints-api-php',_binary 's:74:\"[https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:api.php api.php]\";'),(_binary 'en',_binary 'messages:version-entrypoints-articlepath',_binary 's:86:\"[https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:$wgArticlePath Article path]\";'),(_binary 'en',_binary 'messages:version-entrypoints-header-entrypoint',_binary 's:11:\"Entry point\";'),(_binary 'en',_binary 'messages:version-entrypoints-header-url',_binary 's:3:\"URL\";'),(_binary 'en',_binary 'messages:version-entrypoints-index-php',_binary 's:78:\"[https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:index.php index.php]\";'),(_binary 'en',_binary 'messages:version-entrypoints-load-php',_binary 's:76:\"[https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:load.php load.php]\";'),(_binary 'en',_binary 'messages:version-entrypoints-scriptpath',_binary 's:84:\"[https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:$wgScriptPath Script path]\";'),(_binary 'en',_binary 'messages:version-ext-colheader-credits',_binary 's:7:\"Authors\";'),(_binary 'en',_binary 'messages:version-ext-colheader-description',_binary 's:11:\"Description\";'),(_binary 'en',_binary 'messages:version-ext-colheader-license',_binary 's:7:\"License\";'),(_binary 'en',_binary 'messages:version-ext-colheader-name',_binary 's:9:\"Extension\";'),(_binary 'en',_binary 'messages:version-ext-colheader-version',_binary 's:7:\"Version\";'),(_binary 'en',_binary 'messages:version-ext-license',_binary 's:7:\"License\";'),(_binary 'en',_binary 'messages:version-extensions',_binary 's:20:\"Installed extensions\";'),(_binary 'en',_binary 'messages:version-hook-name',_binary 's:9:\"Hook name\";'),(_binary 'en',_binary 'messages:version-hook-subscribedby',_binary 's:13:\"Subscribed by\";'),(_binary 'en',_binary 'messages:version-hooks',_binary 's:5:\"Hooks\";'),(_binary 'en',_binary 'messages:version-libraries',_binary 's:19:\"Installed libraries\";'),(_binary 'en',_binary 'messages:version-libraries-authors',_binary 's:7:\"Authors\";'),(_binary 'en',_binary 'messages:version-libraries-description',_binary 's:11:\"Description\";'),(_binary 'en',_binary 'messages:version-libraries-library',_binary 's:7:\"Library\";'),(_binary 'en',_binary 'messages:version-libraries-license',_binary 's:7:\"License\";'),(_binary 'en',_binary 'messages:version-libraries-version',_binary 's:7:\"Version\";'),(_binary 'en',_binary 'messages:version-license',_binary 's:17:\"MediaWiki License\";'),(_binary 'en',_binary 'messages:version-license-info',_binary 's:820:\"MediaWiki is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either version 2 of the License, or (at your option) any later version.\n\nMediaWiki is distributed in the hope that it will be useful, but <em>WITHOUT ANY WARRANTY</em>; without even the implied warranty of <strong>MERCHANTABILITY</strong> or <strong>FITNESS FOR A PARTICULAR PURPOSE</strong>. See the GNU General Public License for more details.\n\nYou should have received [{{SERVER}}{{SCRIPTPATH}}/COPYING a copy of the GNU General Public License] along with this program; if not, write to the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA or [//www.gnu.org/licenses/old-licenses/gpl-2.0.html read it online].\";'),(_binary 'en',_binary 'messages:version-license-not-found',_binary 's:61:\"No detailed license information was found for this extension.\";'),(_binary 'en',_binary 'messages:version-license-title',_binary 's:14:\"License for $1\";'),(_binary 'en',_binary 'messages:version-mediahandlers',_binary 's:14:\"Media handlers\";'),(_binary 'en',_binary 'messages:version-no-ext-name',_binary 's:9:\"[no name]\";'),(_binary 'en',_binary 'messages:version-other',_binary 's:5:\"Other\";'),(_binary 'en',_binary 'messages:version-parser-extensiontags',_binary 's:21:\"Parser extension tags\";'),(_binary 'en',_binary 'messages:version-parser-function-hooks',_binary 's:21:\"Parser function hooks\";'),(_binary 'en',_binary 'messages:version-parserhooks',_binary 's:12:\"Parser hooks\";'),(_binary 'en',_binary 'messages:version-poweredby-credits',_binary 's:105:\"This wiki is powered by <strong>[https://www.mediawiki.org/ MediaWiki]</strong>, copyright © 2001-$1 $2.\";'),(_binary 'en',_binary 'messages:version-poweredby-others',_binary 's:6:\"others\";'),(_binary 'en',_binary 'messages:version-poweredby-translators',_binary 's:29:\"translatewiki.net translators\";'),(_binary 'en',_binary 'messages:version-skin-colheader-name',_binary 's:4:\"Skin\";'),(_binary 'en',_binary 'messages:version-skins',_binary 's:15:\"Installed skins\";'),(_binary 'en',_binary 'messages:version-software',_binary 's:18:\"Installed software\";'),(_binary 'en',_binary 'messages:version-software-product',_binary 's:7:\"Product\";'),(_binary 'en',_binary 'messages:version-software-version',_binary 's:7:\"Version\";'),(_binary 'en',_binary 'messages:version-specialpages',_binary 's:13:\"Special pages\";'),(_binary 'en',_binary 'messages:version-summary',_binary 's:0:\"\";'),(_binary 'en',_binary 'messages:version-variables',_binary 's:9:\"Variables\";'),(_binary 'en',_binary 'messages:version-version',_binary 's:4:\"($1)\";'),(_binary 'en',_binary 'messages:versionrequired',_binary 's:32:\"Version $1 of MediaWiki required\";'),(_binary 'en',_binary 'messages:versionrequiredtext',_binary 's:91:\"Version $1 of MediaWiki is required to use this page.\nSee [[Special:Version|version page]].\";'),(_binary 'en',_binary 'messages:video-dims',_binary 's:12:\"$1, $2 × $3\";'),(_binary 'en',_binary 'messages:view',_binary 's:4:\"View\";'),(_binary 'en',_binary 'messages:view-foreign',_binary 's:10:\"View on $1\";'),(_binary 'en',_binary 'messages:view-pool-error',_binary 's:159:\"Sorry, the servers are overloaded at the moment.\nToo many users are trying to view this page.\nPlease wait a while before you try to access this page again.\n\n$1\";'),(_binary 'en',_binary 'messages:viewcount',_binary 's:56:\"This page has been accessed {{PLURAL:$1|once|$1 times}}.\";'),(_binary 'en',_binary 'messages:viewdeleted',_binary 's:8:\"View $1?\";'),(_binary 'en',_binary 'messages:viewdeleted_short',_binary 's:52:\"View {{PLURAL:$1|one deleted edit|$1 deleted edits}}\";'),(_binary 'en',_binary 'messages:viewdeletedpage',_binary 's:18:\"View deleted pages\";'),(_binary 'en',_binary 'messages:viewhelppage',_binary 's:14:\"View help page\";'),(_binary 'en',_binary 'messages:viewinguserrights',_binary 's:76:\"Viewing user rights of {{GENDER:$1|user}} <strong>[[User:$1|$1]]</strong> $2\";'),(_binary 'en',_binary 'messages:viewpagelogs',_binary 's:23:\"View logs for this page\";'),(_binary 'en',_binary 'messages:viewprevnext',_binary 's:40:\"View ($1 {{int:pipe-separator}} $2) ($3)\";'),(_binary 'en',_binary 'messages:views',_binary 's:5:\"Views\";'),(_binary 'en',_binary 'messages:viewsource',_binary 's:11:\"View source\";'),(_binary 'en',_binary 'messages:viewsource-title',_binary 's:18:\"View source for $1\";'),(_binary 'en',_binary 'messages:viewsourcelink',_binary 's:11:\"view source\";'),(_binary 'en',_binary 'messages:viewsourceold',_binary 's:11:\"view source\";'),(_binary 'en',_binary 'messages:viewsourcetext',_binary 's:46:\"You can view and copy the source of this page.\";'),(_binary 'en',_binary 'messages:viewtalkpage',_binary 's:15:\"View discussion\";'),(_binary 'en',_binary 'messages:viewyourtext',_binary 's:77:\"You can view and copy the source of <strong>your edits</strong> to this page.\";'),(_binary 'en',_binary 'messages:virus-badscanner',_binary 's:53:\"Bad configuration: Unknown virus scanner: <em>$1</em>\";'),(_binary 'en',_binary 'messages:virus-scanfailed',_binary 's:21:\"scan failed (code $1)\";'),(_binary 'en',_binary 'messages:virus-unknownscanner',_binary 's:18:\"unknown antivirus:\";'),(_binary 'en',_binary 'messages:wantedcategories',_binary 's:17:\"Wanted categories\";'),(_binary 'en',_binary 'messages:wantedcategories-summary',_binary 's:0:\"\";'),(_binary 'en',_binary 'messages:wantedfiles',_binary 's:12:\"Wanted files\";'),(_binary 'en',_binary 'messages:wantedfiles-summary',_binary 's:0:\"\";'),(_binary 'en',_binary 'messages:wantedfiletext-cat',_binary 's:244:\"The following files are used but do not exist. Files from foreign repositories may be listed despite existing. Any such false positives will be <del>struck out</del>. Additionally, pages that embed files that do not exist are listed in [[:$1]].\";'),(_binary 'en',_binary 'messages:wantedfiletext-cat-noforeign',_binary 's:124:\"The following files are used but do not exist. Additionally, pages that embed files that do not exist are listed in [[:$1]].\";'),(_binary 'en',_binary 'messages:wantedfiletext-nocat',_binary 's:166:\"The following files are used but do not exist. Files from foreign repositories may be listed despite existing. Any such false positives will be <del>struck out</del>.\";'),(_binary 'en',_binary 'messages:wantedfiletext-nocat-noforeign',_binary 's:46:\"The following files are used but do not exist.\";'),(_binary 'en',_binary 'messages:wantedpages',_binary 's:12:\"Wanted pages\";'),(_binary 'en',_binary 'messages:wantedpages-badtitle',_binary 's:31:\"Invalid title in result set: $1\";'),(_binary 'en',_binary 'messages:wantedpages-summary',_binary 's:251:\"List of non-existing pages with the most links to them, excluding pages which only have redirects linking to them. For a list of non-existent pages that have redirects linking to them, see [[{{#special:BrokenRedirects}}|the list of broken redirects]].\";'),(_binary 'en',_binary 'messages:wantedtemplates',_binary 's:16:\"Wanted templates\";'),(_binary 'en',_binary 'messages:wantedtemplates-summary',_binary 's:0:\"\";'),(_binary 'en',_binary 'messages:watch',_binary 's:5:\"Watch\";'),(_binary 'en',_binary 'messages:watcherrortext',_binary 's:66:\"An error occurred while changing your watchlist settings for \"$1\".\";'),(_binary 'en',_binary 'messages:watching',_binary 's:11:\"Watching...\";'),(_binary 'en',_binary 'messages:watchlist',_binary 's:9:\"Watchlist\";'),(_binary 'en',_binary 'messages:watchlist-details',_binary 's:74:\"{{PLURAL:$1|$1 page is|$1 pages are}} on your Watchlist (plus talk pages).\";'),(_binary 'en',_binary 'messages:watchlist-hide',_binary 's:4:\"Hide\";'),(_binary 'en',_binary 'messages:watchlist-options',_binary 's:17:\"Watchlist options\";'),(_binary 'en',_binary 'messages:watchlist-submit',_binary 's:4:\"Show\";'),(_binary 'en',_binary 'messages:watchlist-summary',_binary 's:0:\"\";'),(_binary 'en',_binary 'messages:watchlist-unwatch',_binary 's:2:\"×\";'),(_binary 'en',_binary 'messages:watchlist-unwatch-undo',_binary 's:1:\"+\";'),(_binary 'en',_binary 'messages:watchlistanontext',_binary 's:54:\"Please log in to view or edit items on your watchlist.\";'),(_binary 'en',_binary 'messages:watchlistedit-clear-done',_binary 's:32:\"Your watchlist has been cleared.\";'),(_binary 'en',_binary 'messages:watchlistedit-clear-explain',_binary 's:53:\"All of the titles will be removed from your watchlist\";'),(_binary 'en',_binary 'messages:watchlistedit-clear-jobqueue',_binary 's:57:\"Your watchlist is being cleared. This may take some time!\";'),(_binary 'en',_binary 'messages:watchlistedit-clear-legend',_binary 's:15:\"Clear watchlist\";'),(_binary 'en',_binary 'messages:watchlistedit-clear-removed',_binary 's:49:\"{{PLURAL:$1|1 title was|$1 titles were}} removed:\";'),(_binary 'en',_binary 'messages:watchlistedit-clear-submit',_binary 's:40:\"Clear the watchlist (This is permanent!)\";'),(_binary 'en',_binary 'messages:watchlistedit-clear-title',_binary 's:15:\"Clear watchlist\";'),(_binary 'en',_binary 'messages:watchlistedit-clear-titles',_binary 's:7:\"Titles:\";'),(_binary 'en',_binary 'messages:watchlistedit-normal-done',_binary 's:76:\"{{PLURAL:$1|A single title was|$1 titles were}} removed from your watchlist:\";'),(_binary 'en',_binary 'messages:watchlistedit-normal-explain',_binary 's:197:\"Titles on your watchlist are shown below.\nTo remove a title, check the box next to it, and click \"{{int:Watchlistedit-normal-submit}}\".\nYou can also [[Special:EditWatchlist/raw|edit the raw list]].\";'),(_binary 'en',_binary 'messages:watchlistedit-normal-legend',_binary 's:28:\"Remove titles from watchlist\";'),(_binary 'en',_binary 'messages:watchlistedit-normal-submit',_binary 's:13:\"Remove titles\";'),(_binary 'en',_binary 'messages:watchlistedit-normal-title',_binary 's:14:\"Edit watchlist\";'),(_binary 'en',_binary 'messages:watchlistedit-raw-added',_binary 's:47:\"{{PLURAL:$1|1 title was|$1 titles were}} added:\";'),(_binary 'en',_binary 'messages:watchlistedit-raw-done',_binary 's:32:\"Your watchlist has been updated.\";'),(_binary 'en',_binary 'messages:watchlistedit-raw-explain',_binary 's:241:\"Titles on your watchlist are shown below, and can be edited by adding to and removing from the list;\none title per line.\nWhen finished, click \"{{int:Watchlistedit-raw-submit}}\".\nYou can also [[Special:EditWatchlist|use the standard editor]].\";'),(_binary 'en',_binary 'messages:watchlistedit-raw-legend',_binary 's:18:\"Edit raw watchlist\";'),(_binary 'en',_binary 'messages:watchlistedit-raw-removed',_binary 's:49:\"{{PLURAL:$1|1 title was|$1 titles were}} removed:\";'),(_binary 'en',_binary 'messages:watchlistedit-raw-submit',_binary 's:16:\"Update watchlist\";'),(_binary 'en',_binary 'messages:watchlistedit-raw-title',_binary 's:18:\"Edit raw watchlist\";'),(_binary 'en',_binary 'messages:watchlistedit-raw-titles',_binary 's:7:\"Titles:\";'),(_binary 'en',_binary 'messages:watchlistedit-too-many',_binary 's:41:\"There are too many pages to display here.\";'),(_binary 'en',_binary 'messages:watchlistfor2',_binary 's:9:\"For $1 $2\";'),(_binary 'en',_binary 'messages:watchlisttools-clear',_binary 's:19:\"Clear the watchlist\";'),(_binary 'en',_binary 'messages:watchlisttools-edit',_binary 's:23:\"View and edit watchlist\";'),(_binary 'en',_binary 'messages:watchlisttools-raw',_binary 's:18:\"Edit raw watchlist\";'),(_binary 'en',_binary 'messages:watchlisttools-view',_binary 's:21:\"View relevant changes\";'),(_binary 'en',_binary 'messages:watchnologin',_binary 's:13:\"Not logged in\";'),(_binary 'en',_binary 'messages:watchthis',_binary 's:15:\"Watch this page\";'),(_binary 'en',_binary 'messages:watchthispage',_binary 's:15:\"Watch this page\";'),(_binary 'en',_binary 'messages:watchthisupload',_binary 's:15:\"Watch this file\";'),(_binary 'en',_binary 'messages:wed',_binary 's:3:\"Wed\";'),(_binary 'en',_binary 'messages:wednesday',_binary 's:9:\"Wednesday\";'),(_binary 'en',_binary 'messages:wednesday-at',_binary 's:15:\"Wednesday at $1\";'),(_binary 'en',_binary 'messages:weeks',_binary 's:30:\"{{PLURAL:$1|$1 week|$1 weeks}}\";'),(_binary 'en',_binary 'messages:welcomecreation-msg',_binary 's:112:\"Your account has been created.\nYou can change your {{SITENAME}} [[Special:Preferences|preferences]] if you wish.\";'),(_binary 'en',_binary 'messages:welcomeuser',_binary 's:12:\"Welcome, $1!\";'),(_binary 'en',_binary 'messages:whatlinkshere',_binary 's:15:\"What links here\";'),(_binary 'en',_binary 'messages:whatlinkshere-filters',_binary 's:7:\"Filters\";'),(_binary 'en',_binary 'messages:whatlinkshere-hideimages',_binary 's:13:\"$1 file links\";'),(_binary 'en',_binary 'messages:whatlinkshere-hidelinks',_binary 's:8:\"$1 links\";'),(_binary 'en',_binary 'messages:whatlinkshere-hideredirs',_binary 's:12:\"$1 redirects\";'),(_binary 'en',_binary 'messages:whatlinkshere-hidetrans',_binary 's:16:\"$1 transclusions\";'),(_binary 'en',_binary 'messages:whatlinkshere-links',_binary 's:9:\"← links\";'),(_binary 'en',_binary 'messages:whatlinkshere-next',_binary 's:26:\"{{PLURAL:$1|next|next $1}}\";'),(_binary 'en',_binary 'messages:whatlinkshere-page',_binary 's:5:\"Page:\";'),(_binary 'en',_binary 'messages:whatlinkshere-prev',_binary 's:34:\"{{PLURAL:$1|previous|previous $1}}\";'),(_binary 'en',_binary 'messages:whatlinkshere-submit',_binary 's:2:\"Go\";'),(_binary 'en',_binary 'messages:whatlinkshere-summary',_binary 's:0:\"\";'),(_binary 'en',_binary 'messages:whatlinkshere-title',_binary 's:23:\"Pages that link to \"$1\"\";'),(_binary 'en',_binary 'messages:whitelistedittext',_binary 's:24:\"Please $1 to edit pages.\";'),(_binary 'en',_binary 'messages:widthheight',_binary 's:8:\"$1 × $2\";'),(_binary 'en',_binary 'messages:widthheightpage',_binary 's:37:\"$1 × $2, $3 {{PLURAL:$3|page|pages}}\";'),(_binary 'en',_binary 'messages:windows-nonascii-filename',_binary 's:61:\"This wiki does not support filenames with special characters.\";'),(_binary 'en',_binary 'messages:withoutinterwiki',_binary 's:28:\"Pages without language links\";'),(_binary 'en',_binary 'messages:withoutinterwiki-legend',_binary 's:6:\"Prefix\";'),(_binary 'en',_binary 'messages:withoutinterwiki-submit',_binary 's:4:\"Show\";'),(_binary 'en',_binary 'messages:withoutinterwiki-summary',_binary 's:59:\"The following pages do not link to other language versions.\";'),(_binary 'en',_binary 'messages:wlheader-enotif',_binary 's:30:\"Email notification is enabled.\";'),(_binary 'en',_binary 'messages:wlheader-showupdated',_binary 's:92:\"Pages that have been changed since you last visited them are shown in <strong>bold</strong>.\";'),(_binary 'en',_binary 'messages:wlnote',_binary 's:151:\"Below {{PLURAL:$1|is the last change|are the last <strong>$1</strong> changes}} in the last {{PLURAL:$2|hour|<strong>$2</strong> hours}}, as of $3, $4.\";'),(_binary 'en',_binary 'messages:wlshowhideanons',_binary 's:15:\"anonymous users\";'),(_binary 'en',_binary 'messages:wlshowhidebots',_binary 's:4:\"bots\";'),(_binary 'en',_binary 'messages:wlshowhidecategorization',_binary 's:19:\"page categorization\";'),(_binary 'en',_binary 'messages:wlshowhideliu',_binary 's:16:\"registered users\";'),(_binary 'en',_binary 'messages:wlshowhidemine',_binary 's:8:\"my edits\";'),(_binary 'en',_binary 'messages:wlshowhideminor',_binary 's:11:\"minor edits\";'),(_binary 'en',_binary 'messages:wlshowhidepatr',_binary 's:15:\"patrolled edits\";'),(_binary 'en',_binary 'messages:wlshowlast',_binary 's:26:\"Show last $1 hours $2 days\";'),(_binary 'en',_binary 'messages:wlshowtime',_binary 's:26:\"Period of time to display:\";'),(_binary 'en',_binary 'messages:word-separator',_binary 's:5:\"&#32;\";'),(_binary 'en',_binary 'messages:wrongpassword',_binary 's:57:\"Incorrect username or password entered.\nPlease try again.\";'),(_binary 'en',_binary 'messages:wrongpasswordempty',_binary 's:45:\"Password entered was blank.\nPlease try again.\";'),(_binary 'en',_binary 'messages:xffblockreason',_binary 's:158:\"An IP address present in the X-Forwarded-For header, either yours or that of a proxy server you are using, has been blocked. The original block reason was: $1\";'),(_binary 'en',_binary 'messages:xml-error-string',_binary 's:35:\"$1 at line $2, col $3 (byte $4): $5\";'),(_binary 'en',_binary 'messages:year',_binary 's:24:\"From year (and earlier):\";'),(_binary 'en',_binary 'messages:years',_binary 's:30:\"{{PLURAL:$1|$1 year|$1 years}}\";'),(_binary 'en',_binary 'messages:yesterday-at',_binary 's:15:\"Yesterday at $1\";'),(_binary 'en',_binary 'messages:youhavenewmessages',_binary 's:31:\"{{PLURAL:$3|You have}} $1 ($2).\";'),(_binary 'en',_binary 'messages:youhavenewmessagesfromusers',_binary 's:72:\"{{PLURAL:$4|You have}} $1 from {{PLURAL:$3|another user|$3 users}} ($2).\";'),(_binary 'en',_binary 'messages:youhavenewmessagesmanyusers',_binary 's:33:\"You have $1 from many users ($2).\";'),(_binary 'en',_binary 'messages:youhavenewmessagesmulti',_binary 's:27:\"You have new messages on $1\";'),(_binary 'en',_binary 'messages:yourdiff',_binary 's:11:\"Differences\";'),(_binary 'en',_binary 'messages:yourdomainname',_binary 's:12:\"Your domain:\";'),(_binary 'en',_binary 'messages:youremail',_binary 's:6:\"Email:\";'),(_binary 'en',_binary 'messages:yourgender',_binary 's:34:\"How do you prefer to be described?\";'),(_binary 'en',_binary 'messages:yourlanguage',_binary 's:9:\"Language:\";'),(_binary 'en',_binary 'messages:yourname',_binary 's:9:\"Username:\";'),(_binary 'en',_binary 'messages:yournick',_binary 's:14:\"New signature:\";'),(_binary 'en',_binary 'messages:yourpassword',_binary 's:9:\"Password:\";'),(_binary 'en',_binary 'messages:yourpasswordagain',_binary 's:16:\"Retype password:\";'),(_binary 'en',_binary 'messages:yourrealname',_binary 's:10:\"Real name:\";'),(_binary 'en',_binary 'messages:yourtext',_binary 's:9:\"Your text\";'),(_binary 'en',_binary 'messages:yourvariant',_binary 's:25:\"Content language variant:\";'),(_binary 'en',_binary 'messages:zip-bad',_binary 's:99:\"The file is a corrupt or otherwise unreadable ZIP file.\nIt cannot be properly checked for security.\";'),(_binary 'en',_binary 'messages:zip-file-open-error',_binary 's:62:\"An error was encountered when opening the file for ZIP checks.\";'),(_binary 'en',_binary 'messages:zip-unsupported',_binary 's:117:\"The file is a ZIP file that uses ZIP features not supported by MediaWiki.\nIt cannot be properly checked for security.\";'),(_binary 'en',_binary 'messages:zip-wrong-format',_binary 's:38:\"The specified file was not a ZIP file.\";'),(_binary 'en',_binary 'minimumGroupingDigits',_binary 'N;'),(_binary 'en',_binary 'namespaceAliases',_binary 'a:0:{}'),(_binary 'en',_binary 'namespaceGenderAliases',_binary 'a:0:{}'),(_binary 'en',_binary 'namespaceNames',_binary 'a:17:{i:-2;s:5:\"Media\";i:-1;s:7:\"Special\";i:0;s:0:\"\";i:1;s:4:\"Talk\";i:2;s:4:\"User\";i:3;s:9:\"User_talk\";i:5;s:7:\"$1_talk\";i:6;s:4:\"File\";i:7;s:9:\"File_talk\";i:8;s:9:\"MediaWiki\";i:9;s:14:\"MediaWiki_talk\";i:10;s:8:\"Template\";i:11;s:13:\"Template_talk\";i:12;s:4:\"Help\";i:13;s:9:\"Help_talk\";i:14;s:8:\"Category\";i:15;s:13:\"Category_talk\";}'),(_binary 'en',_binary 'originalFallbackSequence',_binary 'a:0:{}'),(_binary 'en',_binary 'pluralRuleTypes',_binary 'a:1:{i:0;s:3:\"one\";}'),(_binary 'en',_binary 'pluralRules',_binary 'a:1:{i:0;s:26:\"i = 1 and v = 0 @integer 1\";}'),(_binary 'en',_binary 'preload',_binary 'a:3:{s:8:\"messages\";a:111:{s:9:\"aboutpage\";s:13:\"Project:About\";s:9:\"aboutsite\";s:18:\"About {{SITENAME}}\";s:17:\"accesskey-ca-edit\";s:1:\"e\";s:20:\"accesskey-ca-history\";s:1:\"h\";s:23:\"accesskey-ca-nstab-main\";s:1:\"c\";s:17:\"accesskey-ca-talk\";s:1:\"t\";s:23:\"accesskey-ca-viewsource\";s:1:\"e\";s:25:\"accesskey-n-currentevents\";s:0:\"\";s:16:\"accesskey-n-help\";s:0:\"\";s:32:\"accesskey-n-mainpage-description\";s:1:\"z\";s:18:\"accesskey-n-portal\";s:0:\"\";s:22:\"accesskey-n-randompage\";s:1:\"x\";s:25:\"accesskey-n-recentchanges\";s:1:\"r\";s:16:\"accesskey-p-logo\";s:0:\"\";s:18:\"accesskey-pt-login\";s:1:\"o\";s:26:\"accesskey-pt-createaccount\";s:0:\"\";s:16:\"accesskey-search\";s:1:\"f\";s:25:\"accesskey-search-fulltext\";s:0:\"\";s:19:\"accesskey-search-go\";s:0:\"\";s:16:\"accesskey-t-info\";s:0:\"\";s:21:\"accesskey-t-permalink\";s:0:\"\";s:17:\"accesskey-t-print\";s:1:\"p\";s:31:\"accesskey-t-recentchangeslinked\";s:1:\"k\";s:24:\"accesskey-t-specialpages\";s:1:\"q\";s:25:\"accesskey-t-whatlinkshere\";s:1:\"j\";s:7:\"actions\";s:7:\"Actions\";s:10:\"anonnotice\";s:1:\"-\";s:8:\"brackets\";s:4:\"[$1]\";s:15:\"comma-separator\";s:6:\",&#32;\";s:13:\"currentevents\";s:14:\"Current events\";s:17:\"currentevents-url\";s:22:\"Project:Current events\";s:14:\"disclaimerpage\";s:26:\"Project:General disclaimer\";s:11:\"disclaimers\";s:11:\"Disclaimers\";s:4:\"edit\";s:4:\"Edit\";s:11:\"editsection\";s:4:\"edit\";s:15:\"editsectionhint\";s:16:\"Edit section: $1\";s:4:\"help\";s:4:\"Help\";s:8:\"helppage\";s:63:\"https://www.mediawiki.org/wiki/Special:MyLanguage/Help:Contents\";s:24:\"interlanguage-link-title\";s:9:\"$1 – $2\";s:6:\"jumpto\";s:8:\"Jump to:\";s:16:\"jumptonavigation\";s:10:\"navigation\";s:12:\"jumptosearch\";s:6:\"search\";s:14:\"lastmodifiedat\";s:39:\"This page was last edited on $1, at $2.\";s:8:\"mainpage\";s:9:\"Main Page\";s:20:\"mainpage-description\";s:9:\"Main page\";s:14:\"mainpage-nstab\";s:9:\"Main page\";s:10:\"namespaces\";s:10:\"Namespaces\";s:10:\"navigation\";s:10:\"Navigation\";s:23:\"nav-login-createaccount\";s:23:\"Log in / create account\";s:10:\"nstab-main\";s:4:\"Page\";s:15:\"opensearch-desc\";s:34:\"{{SITENAME}} ({{CONTENTLANGUAGE}})\";s:14:\"pagecategories\";s:33:\"{{PLURAL:$1|Category|Categories}}\";s:18:\"pagecategorieslink\";s:18:\"Special:Categories\";s:9:\"pagetitle\";s:17:\"$1 - {{SITENAME}}\";s:23:\"pagetitle-view-mainpage\";s:12:\"{{SITENAME}}\";s:9:\"permalink\";s:14:\"Permanent link\";s:13:\"personaltools\";s:14:\"Personal tools\";s:6:\"portal\";s:16:\"Community portal\";s:10:\"portal-url\";s:24:\"Project:Community portal\";s:16:\"printableversion\";s:17:\"Printable version\";s:7:\"privacy\";s:14:\"Privacy policy\";s:11:\"privacypage\";s:22:\"Project:Privacy policy\";s:10:\"randompage\";s:11:\"Random page\";s:14:\"randompage-url\";s:14:\"Special:Random\";s:13:\"recentchanges\";s:14:\"Recent changes\";s:27:\"recentchangeslinked-toolbox\";s:15:\"Related changes\";s:17:\"recentchanges-url\";s:21:\"Special:RecentChanges\";s:13:\"retrievedfrom\";s:19:\"Retrieved from \"$1\"\";s:6:\"search\";s:6:\"Search\";s:13:\"searcharticle\";s:2:\"Go\";s:12:\"searchbutton\";s:6:\"Search\";s:20:\"searchsuggest-search\";s:19:\"Search {{SITENAME}}\";s:7:\"sidebar\";s:168:\"\n* navigation\n** mainpage|mainpage-description\n** recentchanges-url|recentchanges\n** randompage-url|randompage\n** helppage|help-mediawiki\n* SEARCH\n* TOOLBOX\n* LANGUAGES\";s:18:\"navigation-heading\";s:15:\"Navigation menu\";s:14:\"site-atom-feed\";s:12:\"$1 Atom feed\";s:10:\"sitenotice\";s:1:\"-\";s:12:\"specialpages\";s:13:\"Special pages\";s:7:\"tagline\";s:17:\"From {{SITENAME}}\";s:4:\"talk\";s:10:\"Discussion\";s:7:\"toolbox\";s:5:\"Tools\";s:15:\"tooltip-ca-edit\";s:14:\"Edit this page\";s:18:\"tooltip-ca-history\";s:27:\"Past revisions of this page\";s:21:\"tooltip-ca-nstab-main\";s:21:\"View the content page\";s:15:\"tooltip-ca-talk\";s:33:\"Discussion about the content page\";s:21:\"tooltip-ca-viewsource\";s:47:\"This page is protected.\nYou can view its source\";s:23:\"tooltip-n-currentevents\";s:45:\"Find background information on current events\";s:14:\"tooltip-n-help\";s:21:\"The place to find out\";s:30:\"tooltip-n-mainpage-description\";s:19:\"Visit the main page\";s:16:\"tooltip-n-portal\";s:56:\"About the project, what you can do, where to find things\";s:20:\"tooltip-n-randompage\";s:18:\"Load a random page\";s:23:\"tooltip-n-recentchanges\";s:36:\"A list of recent changes in the wiki\";s:14:\"tooltip-p-logo\";s:19:\"Visit the main page\";s:16:\"tooltip-pt-login\";s:58:\"You are encouraged to log in; however, it is not mandatory\";s:24:\"tooltip-pt-createaccount\";s:80:\"You are encouraged to create an account and log in; however, it is not mandatory\";s:14:\"tooltip-search\";s:19:\"Search {{SITENAME}}\";s:23:\"tooltip-search-fulltext\";s:30:\"Search the pages for this text\";s:17:\"tooltip-search-go\";s:46:\"Go to a page with this exact name if it exists\";s:14:\"tooltip-t-info\";s:32:\"More information about this page\";s:19:\"tooltip-t-permalink\";s:43:\"Permanent link to this revision of the page\";s:15:\"tooltip-t-print\";s:30:\"Printable version of this page\";s:29:\"tooltip-t-recentchangeslinked\";s:45:\"Recent changes in pages linked from this page\";s:22:\"tooltip-t-specialpages\";s:27:\"A list of all special pages\";s:23:\"tooltip-t-whatlinkshere\";s:39:\"A list of all wiki pages that link here\";s:8:\"variants\";s:8:\"Variants\";s:16:\"vector-view-edit\";s:4:\"Edit\";s:19:\"vector-view-history\";s:12:\"View history\";s:16:\"vector-view-view\";s:4:\"Read\";s:9:\"viewcount\";s:56:\"This page has been accessed {{PLURAL:$1|once|$1 times}}.\";s:5:\"views\";s:5:\"Views\";s:13:\"whatlinkshere\";s:15:\"What links here\";s:14:\"word-separator\";s:5:\"&#32;\";}s:11:\"dateFormats\";a:20:{s:8:\"mdy time\";s:3:\"H:i\";s:8:\"mdy date\";s:6:\"F j, Y\";s:13:\"mdy monthonly\";s:3:\"F Y\";s:8:\"mdy both\";s:11:\"H:i, F j, Y\";s:10:\"mdy pretty\";s:3:\"F j\";s:8:\"dmy time\";s:3:\"H:i\";s:8:\"dmy date\";s:5:\"j F Y\";s:13:\"dmy monthonly\";s:3:\"F Y\";s:8:\"dmy both\";s:10:\"H:i, j F Y\";s:10:\"dmy pretty\";s:3:\"j F\";s:8:\"ymd time\";s:3:\"H:i\";s:8:\"ymd date\";s:5:\"Y F j\";s:13:\"ymd monthonly\";s:3:\"Y F\";s:8:\"ymd both\";s:10:\"H:i, Y F j\";s:10:\"ymd pretty\";s:3:\"F j\";s:13:\"ISO 8601 time\";s:11:\"xnH:xni:xns\";s:13:\"ISO 8601 date\";s:11:\"xnY-xnm-xnd\";s:18:\"ISO 8601 monthonly\";s:7:\"xnY-xnm\";s:13:\"ISO 8601 both\";s:25:\"xnY-xnm-xnd\"T\"xnH:xni:xns\";s:15:\"ISO 8601 pretty\";s:7:\"xnm-xnd\";}s:14:\"namespaceNames\";a:17:{i:-2;s:5:\"Media\";i:-1;s:7:\"Special\";i:0;s:0:\"\";i:1;s:4:\"Talk\";i:2;s:4:\"User\";i:3;s:9:\"User_talk\";i:5;s:7:\"$1_talk\";i:6;s:4:\"File\";i:7;s:9:\"File_talk\";i:8;s:9:\"MediaWiki\";i:9;s:14:\"MediaWiki_talk\";i:10;s:8:\"Template\";i:11;s:13:\"Template_talk\";i:12;s:4:\"Help\";i:13;s:9:\"Help_talk\";i:14;s:8:\"Category\";i:15;s:13:\"Category_talk\";}}'),(_binary 'en',_binary 'preloadedMessages',_binary 'a:111:{i:0;s:9:\"aboutpage\";i:1;s:9:\"aboutsite\";i:2;s:17:\"accesskey-ca-edit\";i:3;s:20:\"accesskey-ca-history\";i:4;s:23:\"accesskey-ca-nstab-main\";i:5;s:17:\"accesskey-ca-talk\";i:6;s:23:\"accesskey-ca-viewsource\";i:7;s:25:\"accesskey-n-currentevents\";i:8;s:16:\"accesskey-n-help\";i:9;s:32:\"accesskey-n-mainpage-description\";i:10;s:18:\"accesskey-n-portal\";i:11;s:22:\"accesskey-n-randompage\";i:12;s:25:\"accesskey-n-recentchanges\";i:13;s:16:\"accesskey-p-logo\";i:14;s:18:\"accesskey-pt-login\";i:15;s:26:\"accesskey-pt-createaccount\";i:16;s:16:\"accesskey-search\";i:17;s:25:\"accesskey-search-fulltext\";i:18;s:19:\"accesskey-search-go\";i:19;s:16:\"accesskey-t-info\";i:20;s:21:\"accesskey-t-permalink\";i:21;s:17:\"accesskey-t-print\";i:22;s:31:\"accesskey-t-recentchangeslinked\";i:23;s:24:\"accesskey-t-specialpages\";i:24;s:25:\"accesskey-t-whatlinkshere\";i:25;s:7:\"actions\";i:26;s:10:\"anonnotice\";i:27;s:8:\"brackets\";i:28;s:15:\"comma-separator\";i:29;s:13:\"currentevents\";i:30;s:17:\"currentevents-url\";i:31;s:14:\"disclaimerpage\";i:32;s:11:\"disclaimers\";i:33;s:4:\"edit\";i:34;s:11:\"editsection\";i:35;s:15:\"editsectionhint\";i:36;s:4:\"help\";i:37;s:8:\"helppage\";i:38;s:24:\"interlanguage-link-title\";i:39;s:6:\"jumpto\";i:40;s:16:\"jumptonavigation\";i:41;s:12:\"jumptosearch\";i:42;s:14:\"lastmodifiedat\";i:43;s:8:\"mainpage\";i:44;s:20:\"mainpage-description\";i:45;s:14:\"mainpage-nstab\";i:46;s:10:\"namespaces\";i:47;s:10:\"navigation\";i:48;s:23:\"nav-login-createaccount\";i:49;s:10:\"nstab-main\";i:50;s:15:\"opensearch-desc\";i:51;s:14:\"pagecategories\";i:52;s:18:\"pagecategorieslink\";i:53;s:9:\"pagetitle\";i:54;s:23:\"pagetitle-view-mainpage\";i:55;s:9:\"permalink\";i:56;s:13:\"personaltools\";i:57;s:6:\"portal\";i:58;s:10:\"portal-url\";i:59;s:16:\"printableversion\";i:60;s:7:\"privacy\";i:61;s:11:\"privacypage\";i:62;s:10:\"randompage\";i:63;s:14:\"randompage-url\";i:64;s:13:\"recentchanges\";i:65;s:27:\"recentchangeslinked-toolbox\";i:66;s:17:\"recentchanges-url\";i:67;s:13:\"retrievedfrom\";i:68;s:6:\"search\";i:69;s:13:\"searcharticle\";i:70;s:12:\"searchbutton\";i:71;s:20:\"searchsuggest-search\";i:72;s:7:\"sidebar\";i:73;s:18:\"navigation-heading\";i:74;s:14:\"site-atom-feed\";i:75;s:10:\"sitenotice\";i:76;s:12:\"specialpages\";i:77;s:7:\"tagline\";i:78;s:4:\"talk\";i:79;s:7:\"toolbox\";i:80;s:15:\"tooltip-ca-edit\";i:81;s:18:\"tooltip-ca-history\";i:82;s:21:\"tooltip-ca-nstab-main\";i:83;s:15:\"tooltip-ca-talk\";i:84;s:21:\"tooltip-ca-viewsource\";i:85;s:23:\"tooltip-n-currentevents\";i:86;s:14:\"tooltip-n-help\";i:87;s:30:\"tooltip-n-mainpage-description\";i:88;s:16:\"tooltip-n-portal\";i:89;s:20:\"tooltip-n-randompage\";i:90;s:23:\"tooltip-n-recentchanges\";i:91;s:14:\"tooltip-p-logo\";i:92;s:16:\"tooltip-pt-login\";i:93;s:24:\"tooltip-pt-createaccount\";i:94;s:14:\"tooltip-search\";i:95;s:23:\"tooltip-search-fulltext\";i:96;s:17:\"tooltip-search-go\";i:97;s:14:\"tooltip-t-info\";i:98;s:19:\"tooltip-t-permalink\";i:99;s:15:\"tooltip-t-print\";i:100;s:29:\"tooltip-t-recentchangeslinked\";i:101;s:22:\"tooltip-t-specialpages\";i:102;s:23:\"tooltip-t-whatlinkshere\";i:103;s:8:\"variants\";i:104;s:16:\"vector-view-edit\";i:105;s:19:\"vector-view-history\";i:106;s:16:\"vector-view-view\";i:107;s:9:\"viewcount\";i:108;s:5:\"views\";i:109;s:13:\"whatlinkshere\";i:110;s:14:\"word-separator\";}'),(_binary 'en',_binary 'rtl',_binary 'b:0;'),(_binary 'en',_binary 'separatorTransformTable',_binary 'N;'),(_binary 'en',_binary 'specialPageAliases',_binary 'a:124:{s:11:\"Activeusers\";a:1:{i:0;s:11:\"ActiveUsers\";}s:11:\"Allmessages\";a:1:{i:0;s:11:\"AllMessages\";}s:12:\"AllMyUploads\";a:2:{i:0;s:12:\"AllMyUploads\";i:1;s:10:\"AllMyFiles\";}s:8:\"Allpages\";a:1:{i:0;s:8:\"AllPages\";}s:7:\"ApiHelp\";a:1:{i:0;s:7:\"ApiHelp\";}s:10:\"ApiSandbox\";a:1:{i:0;s:10:\"ApiSandbox\";}s:12:\"Ancientpages\";a:1:{i:0;s:12:\"AncientPages\";}s:13:\"AutoblockList\";a:2:{i:0;s:13:\"AutoblockList\";i:1;s:14:\"ListAutoblocks\";}s:8:\"Badtitle\";a:1:{i:0;s:8:\"Badtitle\";}s:9:\"Blankpage\";a:1:{i:0;s:9:\"BlankPage\";}s:5:\"Block\";a:3:{i:0;s:5:\"Block\";i:1;s:7:\"BlockIP\";i:2;s:9:\"BlockUser\";}s:11:\"Booksources\";a:1:{i:0;s:11:\"BookSources\";}s:12:\"BotPasswords\";a:1:{i:0;s:12:\"BotPasswords\";}s:15:\"BrokenRedirects\";a:1:{i:0;s:15:\"BrokenRedirects\";}s:10:\"Categories\";a:1:{i:0;s:10:\"Categories\";}s:18:\"ChangeContentModel\";a:1:{i:0;s:18:\"ChangeContentModel\";}s:17:\"ChangeCredentials\";a:1:{i:0;s:17:\"ChangeCredentials\";}s:11:\"ChangeEmail\";a:1:{i:0;s:11:\"ChangeEmail\";}s:14:\"ChangePassword\";a:3:{i:0;s:14:\"ChangePassword\";i:1;s:9:\"ResetPass\";i:2;s:13:\"ResetPassword\";}s:12:\"ComparePages\";a:1:{i:0;s:12:\"ComparePages\";}s:12:\"Confirmemail\";a:1:{i:0;s:12:\"ConfirmEmail\";}s:13:\"Contributions\";a:2:{i:0;s:13:\"Contributions\";i:1;s:8:\"Contribs\";}s:13:\"CreateAccount\";a:1:{i:0;s:13:\"CreateAccount\";}s:12:\"Deadendpages\";a:1:{i:0;s:12:\"DeadendPages\";}s:20:\"DeletedContributions\";a:1:{i:0;s:20:\"DeletedContributions\";}s:4:\"Diff\";a:1:{i:0;s:4:\"Diff\";}s:15:\"DoubleRedirects\";a:1:{i:0;s:15:\"DoubleRedirects\";}s:8:\"EditTags\";a:1:{i:0;s:8:\"EditTags\";}s:13:\"EditWatchlist\";a:1:{i:0;s:13:\"EditWatchlist\";}s:9:\"Emailuser\";a:2:{i:0;s:9:\"EmailUser\";i:1;s:5:\"Email\";}s:15:\"ExpandTemplates\";a:1:{i:0;s:15:\"ExpandTemplates\";}s:6:\"Export\";a:1:{i:0;s:6:\"Export\";}s:15:\"Fewestrevisions\";a:1:{i:0;s:15:\"FewestRevisions\";}s:19:\"FileDuplicateSearch\";a:1:{i:0;s:19:\"FileDuplicateSearch\";}s:8:\"Filepath\";a:1:{i:0;s:8:\"FilePath\";}s:13:\"GoToInterwiki\";a:1:{i:0;s:13:\"GoToInterwiki\";}s:6:\"Import\";a:1:{i:0;s:6:\"Import\";}s:15:\"Invalidateemail\";a:1:{i:0;s:15:\"InvalidateEmail\";}s:14:\"JavaScriptTest\";a:1:{i:0;s:14:\"JavaScriptTest\";}s:9:\"BlockList\";a:3:{i:0;s:9:\"BlockList\";i:1;s:10:\"ListBlocks\";i:2;s:11:\"IPBlockList\";}s:10:\"LinkSearch\";a:1:{i:0;s:10:\"LinkSearch\";}s:12:\"LinkAccounts\";a:1:{i:0;s:12:\"LinkAccounts\";}s:10:\"Listadmins\";a:1:{i:0;s:10:\"ListAdmins\";}s:8:\"Listbots\";a:1:{i:0;s:8:\"ListBots\";}s:9:\"Listfiles\";a:3:{i:0;s:9:\"ListFiles\";i:1;s:8:\"FileList\";i:2;s:9:\"ImageList\";}s:15:\"Listgrouprights\";a:2:{i:0;s:15:\"ListGroupRights\";i:1;s:15:\"UserGroupRights\";}s:10:\"Listgrants\";a:1:{i:0;s:10:\"ListGrants\";}s:13:\"Listredirects\";a:1:{i:0;s:13:\"ListRedirects\";}s:19:\"ListDuplicatedFiles\";a:2:{i:0;s:19:\"ListDuplicatedFiles\";i:1;s:18:\"ListFileDuplicates\";}s:9:\"Listusers\";a:2:{i:0;s:9:\"ListUsers\";i:1;s:8:\"UserList\";}s:6:\"Lockdb\";a:1:{i:0;s:6:\"LockDB\";}s:3:\"Log\";a:2:{i:0;s:3:\"Log\";i:1;s:4:\"Logs\";}s:11:\"Lonelypages\";a:2:{i:0;s:11:\"LonelyPages\";i:1;s:13:\"OrphanedPages\";}s:9:\"Longpages\";a:1:{i:0;s:9:\"LongPages\";}s:15:\"MediaStatistics\";a:1:{i:0;s:15:\"MediaStatistics\";}s:12:\"MergeHistory\";a:1:{i:0;s:12:\"MergeHistory\";}s:10:\"MIMEsearch\";a:1:{i:0;s:10:\"MIMESearch\";}s:14:\"Mostcategories\";a:1:{i:0;s:14:\"MostCategories\";}s:10:\"Mostimages\";a:3:{i:0;s:15:\"MostLinkedFiles\";i:1;s:9:\"MostFiles\";i:2;s:10:\"MostImages\";}s:14:\"Mostinterwikis\";a:1:{i:0;s:14:\"MostInterwikis\";}s:10:\"Mostlinked\";a:2:{i:0;s:15:\"MostLinkedPages\";i:1;s:10:\"MostLinked\";}s:20:\"Mostlinkedcategories\";a:2:{i:0;s:20:\"MostLinkedCategories\";i:1;s:18:\"MostUsedCategories\";}s:19:\"Mostlinkedtemplates\";a:3:{i:0;s:20:\"MostTranscludedPages\";i:1;s:19:\"MostLinkedTemplates\";i:2;s:17:\"MostUsedTemplates\";}s:13:\"Mostrevisions\";a:1:{i:0;s:13:\"MostRevisions\";}s:8:\"Movepage\";a:1:{i:0;s:8:\"MovePage\";}s:15:\"Mycontributions\";a:1:{i:0;s:15:\"MyContributions\";}s:10:\"MyLanguage\";a:1:{i:0;s:10:\"MyLanguage\";}s:6:\"Mypage\";a:1:{i:0;s:6:\"MyPage\";}s:6:\"Mytalk\";a:1:{i:0;s:6:\"MyTalk\";}s:9:\"Myuploads\";a:2:{i:0;s:9:\"MyUploads\";i:1;s:7:\"MyFiles\";}s:9:\"Newimages\";a:2:{i:0;s:8:\"NewFiles\";i:1;s:9:\"NewImages\";}s:8:\"Newpages\";a:1:{i:0;s:8:\"NewPages\";}s:13:\"PagesWithProp\";a:4:{i:0;s:13:\"PagesWithProp\";i:1;s:13:\"Pageswithprop\";i:2;s:11:\"PagesByProp\";i:3;s:11:\"Pagesbyprop\";}s:8:\"PageData\";a:1:{i:0;s:8:\"PageData\";}s:12:\"PageLanguage\";a:1:{i:0;s:12:\"PageLanguage\";}s:16:\"PasswordPolicies\";a:1:{i:0;s:16:\"PasswordPolicies\";}s:13:\"PasswordReset\";a:1:{i:0;s:13:\"PasswordReset\";}s:13:\"PermanentLink\";a:2:{i:0;s:13:\"PermanentLink\";i:1;s:9:\"PermaLink\";}s:11:\"Preferences\";a:1:{i:0;s:11:\"Preferences\";}s:11:\"Prefixindex\";a:1:{i:0;s:11:\"PrefixIndex\";}s:14:\"Protectedpages\";a:1:{i:0;s:14:\"ProtectedPages\";}s:15:\"Protectedtitles\";a:1:{i:0;s:15:\"ProtectedTitles\";}s:10:\"Randompage\";a:2:{i:0;s:6:\"Random\";i:1;s:10:\"RandomPage\";}s:16:\"RandomInCategory\";a:1:{i:0;s:16:\"RandomInCategory\";}s:14:\"Randomredirect\";a:1:{i:0;s:14:\"RandomRedirect\";}s:14:\"Randomrootpage\";a:1:{i:0;s:14:\"RandomRootpage\";}s:13:\"Recentchanges\";a:1:{i:0;s:13:\"RecentChanges\";}s:19:\"Recentchangeslinked\";a:2:{i:0;s:19:\"RecentChangesLinked\";i:1;s:14:\"RelatedChanges\";}s:8:\"Redirect\";a:1:{i:0;s:8:\"Redirect\";}s:17:\"RemoveCredentials\";a:1:{i:0;s:17:\"RemoveCredentials\";}s:11:\"ResetTokens\";a:1:{i:0;s:11:\"ResetTokens\";}s:14:\"Revisiondelete\";a:1:{i:0;s:14:\"RevisionDelete\";}s:7:\"RunJobs\";a:1:{i:0;s:7:\"RunJobs\";}s:6:\"Search\";a:1:{i:0;s:6:\"Search\";}s:10:\"Shortpages\";a:1:{i:0;s:10:\"ShortPages\";}s:12:\"Specialpages\";a:1:{i:0;s:12:\"SpecialPages\";}s:10:\"Statistics\";a:2:{i:0;s:10:\"Statistics\";i:1;s:5:\"Stats\";}s:4:\"Tags\";a:1:{i:0;s:4:\"Tags\";}s:18:\"TrackingCategories\";a:1:{i:0;s:18:\"TrackingCategories\";}s:7:\"Unblock\";a:1:{i:0;s:7:\"Unblock\";}s:23:\"Uncategorizedcategories\";a:1:{i:0;s:23:\"UncategorizedCategories\";}s:19:\"Uncategorizedimages\";a:2:{i:0;s:18:\"UncategorizedFiles\";i:1;s:19:\"UncategorizedImages\";}s:18:\"Uncategorizedpages\";a:1:{i:0;s:18:\"UncategorizedPages\";}s:22:\"Uncategorizedtemplates\";a:1:{i:0;s:22:\"UncategorizedTemplates\";}s:8:\"Undelete\";a:1:{i:0;s:8:\"Undelete\";}s:14:\"UnlinkAccounts\";a:1:{i:0;s:14:\"UnlinkAccounts\";}s:8:\"Unlockdb\";a:1:{i:0;s:8:\"UnlockDB\";}s:16:\"Unusedcategories\";a:1:{i:0;s:16:\"UnusedCategories\";}s:12:\"Unusedimages\";a:2:{i:0;s:11:\"UnusedFiles\";i:1;s:12:\"UnusedImages\";}s:15:\"Unusedtemplates\";a:1:{i:0;s:15:\"UnusedTemplates\";}s:14:\"Unwatchedpages\";a:1:{i:0;s:14:\"UnwatchedPages\";}s:6:\"Upload\";a:1:{i:0;s:6:\"Upload\";}s:11:\"UploadStash\";a:1:{i:0;s:11:\"UploadStash\";}s:9:\"Userlogin\";a:2:{i:0;s:9:\"UserLogin\";i:1;s:5:\"Login\";}s:10:\"Userlogout\";a:2:{i:0;s:10:\"UserLogout\";i:1;s:6:\"Logout\";}s:10:\"Userrights\";a:3:{i:0;s:10:\"UserRights\";i:1;s:9:\"MakeSysop\";i:2;s:7:\"MakeBot\";}s:7:\"Version\";a:1:{i:0;s:7:\"Version\";}s:16:\"Wantedcategories\";a:1:{i:0;s:16:\"WantedCategories\";}s:11:\"Wantedfiles\";a:1:{i:0;s:11:\"WantedFiles\";}s:11:\"Wantedpages\";a:2:{i:0;s:11:\"WantedPages\";i:1;s:11:\"BrokenLinks\";}s:15:\"Wantedtemplates\";a:1:{i:0;s:15:\"WantedTemplates\";}s:9:\"Watchlist\";a:1:{i:0;s:9:\"Watchlist\";}s:13:\"Whatlinkshere\";a:1:{i:0;s:13:\"WhatLinksHere\";}s:16:\"Withoutinterwiki\";a:1:{i:0;s:16:\"WithoutInterwiki\";}}');
/*!40000 ALTER TABLE `l10n_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `langlinks`
--

DROP TABLE IF EXISTS `langlinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `langlinks` (
  `ll_from` int(10) unsigned NOT NULL DEFAULT '0',
  `ll_lang` varbinary(20) NOT NULL DEFAULT '',
  `ll_title` varbinary(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ll_from`,`ll_lang`),
  KEY `ll_lang` (`ll_lang`,`ll_title`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `langlinks`
--

LOCK TABLES `langlinks` WRITE;
/*!40000 ALTER TABLE `langlinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `langlinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_search`
--

DROP TABLE IF EXISTS `log_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_search` (
  `ls_field` varbinary(32) NOT NULL,
  `ls_value` varbinary(255) NOT NULL,
  `ls_log_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ls_field`,`ls_value`,`ls_log_id`),
  KEY `ls_log_id` (`ls_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_search`
--

LOCK TABLES `log_search` WRITE;
/*!40000 ALTER TABLE `log_search` DISABLE KEYS */;
INSERT INTO `log_search` VALUES (_binary 'associated_rev_id',_binary '1',1),(_binary 'associated_rev_id',_binary '2',2),(_binary 'associated_rev_id',_binary '7',3),(_binary 'associated_rev_id',_binary '9',4),(_binary 'associated_rev_id',_binary '10',5),(_binary 'associated_rev_id',_binary '10',6),(_binary 'associated_rev_id',_binary '14',7),(_binary 'associated_rev_id',_binary '14',8),(_binary 'associated_rev_id',_binary '16',9),(_binary 'associated_rev_id',_binary '16',10),(_binary 'associated_rev_id',_binary '21',11),(_binary 'associated_rev_id',_binary '21',12),(_binary 'associated_rev_id',_binary '23',13),(_binary 'associated_rev_id',_binary '31',14),(_binary 'associated_rev_id',_binary '33',15),(_binary 'associated_rev_id',_binary '34',16),(_binary 'associated_rev_id',_binary '34',17),(_binary 'associated_rev_id',_binary '39',18),(_binary 'associated_rev_id',_binary '53',19),(_binary 'associated_rev_id',_binary '54',20),(_binary 'associated_rev_id',_binary '54',21),(_binary 'associated_rev_id',_binary '55',22),(_binary 'associated_rev_id',_binary '57',23),(_binary 'associated_rev_id',_binary '57',24),(_binary 'associated_rev_id',_binary '58',25),(_binary 'associated_rev_id',_binary '59',26),(_binary 'associated_rev_id',_binary '59',27),(_binary 'associated_rev_id',_binary '61',28),(_binary 'associated_rev_id',_binary '62',29),(_binary 'associated_rev_id',_binary '62',30);
/*!40000 ALTER TABLE `log_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logging`
--

DROP TABLE IF EXISTS `logging`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logging` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `log_type` varbinary(32) NOT NULL DEFAULT '',
  `log_action` varbinary(32) NOT NULL DEFAULT '',
  `log_timestamp` binary(14) NOT NULL DEFAULT '19700101000000',
  `log_user` int(10) unsigned NOT NULL DEFAULT '0',
  `log_user_text` varbinary(255) NOT NULL DEFAULT '',
  `log_actor` bigint(20) unsigned NOT NULL DEFAULT '0',
  `log_namespace` int(11) NOT NULL DEFAULT '0',
  `log_title` varbinary(255) NOT NULL DEFAULT '',
  `log_page` int(10) unsigned DEFAULT NULL,
  `log_comment` varbinary(767) NOT NULL DEFAULT '',
  `log_comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `log_params` blob NOT NULL,
  `log_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`log_id`),
  KEY `type_time` (`log_type`,`log_timestamp`),
  KEY `user_time` (`log_user`,`log_timestamp`),
  KEY `actor_time` (`log_actor`,`log_timestamp`),
  KEY `page_time` (`log_namespace`,`log_title`,`log_timestamp`),
  KEY `times` (`log_timestamp`),
  KEY `log_user_type_time` (`log_user`,`log_type`,`log_timestamp`),
  KEY `log_actor_type_time` (`log_actor`,`log_type`,`log_timestamp`),
  KEY `log_page_id_time` (`log_page`,`log_timestamp`),
  KEY `log_type_action` (`log_type`,`log_action`,`log_timestamp`),
  KEY `log_user_text_type_time` (`log_user_text`,`log_type`,`log_timestamp`),
  KEY `log_user_text_time` (`log_user_text`,`log_timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logging`
--

LOCK TABLES `logging` WRITE;
/*!40000 ALTER TABLE `logging` DISABLE KEYS */;
INSERT INTO `logging` VALUES (1,_binary 'create',_binary 'create',_binary '20190205080506',0,_binary 'MediaWiki default',0,0,_binary 'Main_Page',1,'',0,_binary 'a:1:{s:17:\"associated_rev_id\";i:1;}',0),(2,_binary 'create',_binary 'create',_binary '20190205081951',1,_binary 'Wiki user',0,8,_binary 'Sidebar',2,_binary 'Created page with \" * navigation ** mainpage|mainpage-description ** recentchanges-url|recentchanges * new heading ** randompage-url|randompage ** helppage|help-mediawiki * SEARCH * TOOLBOX * LA...\"',0,_binary 'a:1:{s:17:\"associated_rev_id\";i:2;}',0),(3,_binary 'create',_binary 'create',_binary '20190206015618',1,_binary 'Wiki user',0,0,_binary 'Administration',3,_binary 'Created page with \"* VeraCrypt\"',0,_binary 'a:1:{s:17:\"associated_rev_id\";i:7;}',0),(4,_binary 'create',_binary 'create',_binary '20190206020524',1,_binary 'Wiki user',0,0,_binary 'VeraCrypt',4,_binary 'Created page with \"<h2>Overview</h2>  VeraCrypt provides a clinician\'s laptop with full disk encryption. This protects the data stored on the laptop in the event of thief. The link to the utilit...\"',0,_binary 'a:1:{s:17:\"associated_rev_id\";i:9;}',0),(5,_binary 'upload',_binary 'upload',_binary '20190206020841',1,_binary 'Wiki user',0,6,_binary 'Veracrypt_1.png',5,'',0,_binary 'a:3:{s:8:\"img_sha1\";s:31:\"2qtkri5zfjrrvnkm6z2xshuzmz8xh4x\";s:13:\"img_timestamp\";s:14:\"20190206020841\";s:17:\"associated_rev_id\";i:10;}',0),(6,_binary 'create',_binary 'create',_binary '20190206020841',1,_binary 'Wiki user',0,6,_binary 'Veracrypt_1.png',5,'',0,_binary 'a:1:{s:17:\"associated_rev_id\";i:10;}',0),(7,_binary 'upload',_binary 'upload',_binary '20190206023410',1,_binary 'Wiki user',0,6,_binary 'Veracrypt_2.png',6,'',0,_binary 'a:3:{s:8:\"img_sha1\";s:31:\"psrywqwxbrgclfdrwemttjrth4a2x7w\";s:13:\"img_timestamp\";s:14:\"20190206023410\";s:17:\"associated_rev_id\";i:14;}',0),(8,_binary 'create',_binary 'create',_binary '20190206023410',1,_binary 'Wiki user',0,6,_binary 'Veracrypt_2.png',6,'',0,_binary 'a:1:{s:17:\"associated_rev_id\";i:14;}',0),(9,_binary 'upload',_binary 'upload',_binary '20190206030531',1,_binary 'Wiki user',0,6,_binary 'Veracrypt_3.png',7,'',0,_binary 'a:3:{s:8:\"img_sha1\";s:31:\"g5aql4cxkpbx6ndxwo66tr3el0pkno6\";s:13:\"img_timestamp\";s:14:\"20190206030531\";s:17:\"associated_rev_id\";i:16;}',0),(10,_binary 'create',_binary 'create',_binary '20190206030531',1,_binary 'Wiki user',0,6,_binary 'Veracrypt_3.png',7,'',0,_binary 'a:1:{s:17:\"associated_rev_id\";i:16;}',0),(11,_binary 'upload',_binary 'upload',_binary '20190206041537',1,_binary 'Wiki user',0,6,_binary 'Veracrypt_4.png',8,'',0,_binary 'a:3:{s:8:\"img_sha1\";s:31:\"7hucpp8ieqt0o2vcgy8hf157c5mby73\";s:13:\"img_timestamp\";s:14:\"20190206041537\";s:17:\"associated_rev_id\";i:21;}',0),(12,_binary 'create',_binary 'create',_binary '20190206041537',1,_binary 'Wiki user',0,6,_binary 'Veracrypt_4.png',8,'',0,_binary 'a:1:{s:17:\"associated_rev_id\";i:21;}',0),(13,_binary 'create',_binary 'create',_binary '20190206043807',1,_binary 'Wiki user',0,0,_binary 'VPN',9,_binary 'Created page with \"<h2>Installation</h2>  In the event that the openvpn server gets destroyed. It can be rebuilt quickly because the entire installation is automated through ansible. The playboo...\"',0,_binary 'a:1:{s:17:\"associated_rev_id\";i:23;}',0),(14,_binary 'create',_binary 'create',_binary '20190206054723',1,_binary 'Wiki user',0,0,_binary 'User_Support',10,_binary 'Created page with \"* Hope Matters ** Secrets *** Using Secrets *** Keys *** Other Options ** Custom Forms *** Using Custom Forms\"',0,_binary 'a:1:{s:17:\"associated_rev_id\";i:31;}',0),(15,_binary 'create',_binary 'create',_binary '20190206054915',1,_binary 'Wiki user',0,0,_binary 'Using_Secrets',11,_binary 'Created page with \"[[File:using_secrets.mp4]]\"',0,_binary 'a:1:{s:17:\"associated_rev_id\";i:33;}',0),(16,_binary 'upload',_binary 'upload',_binary '20190206054937',1,_binary 'Wiki user',0,6,_binary 'Using_secrets.mp4',12,'',0,_binary 'a:3:{s:8:\"img_sha1\";s:31:\"7lxy0p5zqe4ir2smm9tbxtfgsr7rt0n\";s:13:\"img_timestamp\";s:14:\"20190206054937\";s:17:\"associated_rev_id\";i:34;}',0),(17,_binary 'create',_binary 'create',_binary '20190206054937',1,_binary 'Wiki user',0,6,_binary 'Using_secrets.mp4',12,'',0,_binary 'a:1:{s:17:\"associated_rev_id\";i:34;}',0),(18,_binary 'create',_binary 'create',_binary '20190206061432',1,_binary 'Wiki user',0,8,_binary 'Common.css',13,_binary 'Created page with \".scaled-video img {     max-width: 75%;     height: auto;     width: auto\\9; }\"',0,_binary 'a:1:{s:17:\"associated_rev_id\";i:39;}',0),(19,_binary 'create',_binary 'create',_binary '20190206064952',1,_binary 'Wiki user',0,0,_binary 'Keys',14,_binary 'Created page with \"[[File: using_secrets_keys.mp4|1000px|center]]\"',0,_binary 'a:1:{s:17:\"associated_rev_id\";i:53;}',0),(20,_binary 'upload',_binary 'upload',_binary '20190206065005',1,_binary 'Wiki user',0,6,_binary 'Using_secrets_keys.mp4',15,'',0,_binary 'a:3:{s:8:\"img_sha1\";s:31:\"4f1fqh9bm3p2vj2gpddizjlqpb4rb0s\";s:13:\"img_timestamp\";s:14:\"20190206065005\";s:17:\"associated_rev_id\";i:54;}',0),(21,_binary 'create',_binary 'create',_binary '20190206065005',1,_binary 'Wiki user',0,6,_binary 'Using_secrets_keys.mp4',15,'',0,_binary 'a:1:{s:17:\"associated_rev_id\";i:54;}',0),(22,_binary 'create',_binary 'create',_binary '20190206065128',1,_binary 'Wiki user',0,0,_binary 'Other_Options',16,_binary 'Created page with \"[[File: using_secrets_keys.mp4|1000px|center]]\"',0,_binary 'a:1:{s:17:\"associated_rev_id\";i:55;}',0),(23,_binary 'upload',_binary 'upload',_binary '20190206065207',1,_binary 'Wiki user',0,6,_binary 'Using_secrets_other_options.mp4',17,'',0,_binary 'a:3:{s:8:\"img_sha1\";s:31:\"r8z0g14gho7tkoy65ilu483e8jsy75x\";s:13:\"img_timestamp\";s:14:\"20190206065207\";s:17:\"associated_rev_id\";i:57;}',0),(24,_binary 'create',_binary 'create',_binary '20190206065207',1,_binary 'Wiki user',0,6,_binary 'Using_secrets_other_options.mp4',17,'',0,_binary 'a:1:{s:17:\"associated_rev_id\";i:57;}',0),(25,_binary 'create',_binary 'create',_binary '20190206065327',1,_binary 'Wiki user',0,0,_binary 'Using_Custom_Forms',18,_binary 'Created page with \"[[File: using_custom_forms.mp4|1000px|center]]\"',0,_binary 'a:1:{s:17:\"associated_rev_id\";i:58;}',0),(26,_binary 'upload',_binary 'upload',_binary '20190206065341',1,_binary 'Wiki user',0,6,_binary 'Using_custom_forms.mp4',19,'',0,_binary 'a:3:{s:8:\"img_sha1\";s:31:\"3m2xtvpth39lul52rzswb01dsm7das6\";s:13:\"img_timestamp\";s:14:\"20190206065341\";s:17:\"associated_rev_id\";i:59;}',0),(27,_binary 'create',_binary 'create',_binary '20190206065341',1,_binary 'Wiki user',0,6,_binary 'Using_custom_forms.mp4',19,'',0,_binary 'a:1:{s:17:\"associated_rev_id\";i:59;}',0),(28,_binary 'create',_binary 'create',_binary '20190206070155',1,_binary 'Wiki user',0,0,_binary 'Custom_Forms',20,_binary 'Created page with \"[[File: administring_custom_forms.mp4|1000px|center]]\"',0,_binary 'a:1:{s:17:\"associated_rev_id\";i:61;}',0),(29,_binary 'upload',_binary 'upload',_binary '20190206070205',1,_binary 'Wiki user',0,6,_binary 'Administring_custom_forms.mp4',21,'',0,_binary 'a:3:{s:8:\"img_sha1\";s:31:\"94scdxcq9th2mzy5ze84obex15kykav\";s:13:\"img_timestamp\";s:14:\"20190206070205\";s:17:\"associated_rev_id\";i:62;}',0),(30,_binary 'create',_binary 'create',_binary '20190206070205',1,_binary 'Wiki user',0,6,_binary 'Administring_custom_forms.mp4',21,'',0,_binary 'a:1:{s:17:\"associated_rev_id\";i:62;}',0);
/*!40000 ALTER TABLE `logging` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module_deps`
--

DROP TABLE IF EXISTS `module_deps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `module_deps` (
  `md_module` varbinary(255) NOT NULL,
  `md_skin` varbinary(32) NOT NULL,
  `md_deps` mediumblob NOT NULL,
  PRIMARY KEY (`md_module`,`md_skin`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_deps`
--

LOCK TABLES `module_deps` WRITE;
/*!40000 ALTER TABLE `module_deps` DISABLE KEYS */;
INSERT INTO `module_deps` VALUES (_binary 'jquery.makeCollapsible.styles',_binary 'vector|en',_binary '[\"resources/src/jquery/jquery.makeCollapsible.styles.less\"]'),(_binary 'jquery.spinner',_binary 'vector|en',_binary '[\"resources/src/jquery.spinner/images/spinner-large.gif\",\"resources/src/jquery.spinner/images/spinner.gif\"]'),(_binary 'mediawiki.action.edit.styles',_binary 'vector|en',_binary '[\"resources/src/mediawiki.action/mediawiki.action.edit.styles.less\"]'),(_binary 'mediawiki.action.view.categoryPage.styles',_binary 'vector|en',_binary '[\"resources/src/mediawiki.action/mediawiki.action.view.categoryPage.less\",\"resources/src/mediawiki.less/mediawiki.mixins.less\"]'),(_binary 'mediawiki.action.view.filepage',_binary 'vector|en',_binary '[\"resources/src/mediawiki.action/images/checker.png\"]'),(_binary 'mediawiki.action.view.postEdit',_binary 'vector|en',_binary '[\"resources/src/mediawiki.action/images/close.png\",\"resources/src/mediawiki.action/images/close.svg\",\"resources/src/mediawiki.action/images/green-checkmark.png\",\"resources/src/mediawiki.action/mediawiki.action.view.postEdit.less\",\"resources/src/mediawiki.less/mediawiki.mixins.less\"]'),(_binary 'mediawiki.editfont.styles',_binary 'vector|en',_binary '[\"resources/src/mediawiki.editfont.less\"]'),(_binary 'mediawiki.feedlink',_binary 'vector|en',_binary '[\"resources/src/mediawiki.feedlink/images/feed-icon.png\",\"resources/src/mediawiki.feedlink/images/feed-icon.svg\"]'),(_binary 'mediawiki.helplink',_binary 'vector|en',_binary '[\"resources/src/mediawiki.helplink/helplink.less\",\"resources/src/mediawiki.helplink/images/help.png\",\"resources/src/mediawiki.helplink/images/help.svg\",\"resources/src/mediawiki.less/mediawiki.mixins.less\"]'),(_binary 'mediawiki.htmlform.ooui.styles',_binary 'vector|en',_binary '[\"resources/src/mediawiki.htmlform.ooui.styles.less\",\"resources/src/mediawiki.less/mediawiki.mixins.less\"]'),(_binary 'mediawiki.htmlform.styles',_binary 'vector|en',_binary '[\"resources/src/mediawiki.htmlform.styles/images/question.png\",\"resources/src/mediawiki.htmlform.styles/images/question.svg\"]'),(_binary 'mediawiki.icon',_binary 'vector|en',_binary '[\"resources/src/mediawiki.icon/icon.less\",\"resources/src/mediawiki.icon/images/arrow-collapsed-ltr.png\",\"resources/src/mediawiki.icon/images/arrow-collapsed-ltr.svg\",\"resources/src/mediawiki.icon/images/arrow-expanded.png\",\"resources/src/mediawiki.icon/images/arrow-expanded.svg\",\"resources/src/mediawiki.less/mediawiki.mixins.less\"]'),(_binary 'mediawiki.legacy.shared',_binary 'vector|en',_binary '[\"resources/src/mediawiki.legacy/images/ajax-loader.gif\",\"resources/src/mediawiki.legacy/images/spinner.gif\"]'),(_binary 'mediawiki.notification',_binary 'vector|en',_binary '[\"resources/src/mediawiki.less/mediawiki.ui/variables.less\",\"skins/Vector/skinStyles/mediawiki.notification.less\"]'),(_binary 'mediawiki.pager.tablePager',_binary 'vector|en',_binary '[\"resources/src/mediawiki.less/mediawiki.mixins.less\",\"resources/src/mediawiki.pager.tablePager/TablePager.less\",\"resources/src/mediawiki.pager.tablePager/images/arrow-sort-ascending.png\",\"resources/src/mediawiki.pager.tablePager/images/arrow-sort-ascending.svg\",\"resources/src/mediawiki.pager.tablePager/images/arrow-sort-descending.png\",\"resources/src/mediawiki.pager.tablePager/images/arrow-sort-descending.svg\"]'),(_binary 'mediawiki.rcfilters.filters.base.styles',_binary 'vector|en',_binary '[\"resources/src/mediawiki.less/mediawiki.mixins.animation.less\",\"resources/src/mediawiki.less/mediawiki.mixins.less\",\"resources/src/mediawiki.less/mediawiki.ui/variables.less\",\"resources/src/mediawiki.rcfilters/styles/mw.rcfilters.less\",\"resources/src/mediawiki.rcfilters/styles/mw.rcfilters.mixins.less\",\"resources/src/mediawiki.rcfilters/styles/mw.rcfilters.variables.less\"]'),(_binary 'mediawiki.rcfilters.filters.ui',_binary 'vector|en',_binary '[\"resources/src/mediawiki.less/mediawiki.mixins.less\",\"resources/src/mediawiki.less/mediawiki.ui/variables.less\",\"resources/src/mediawiki.rcfilters/styles/mw.rcfilters.mixins.less\",\"resources/src/mediawiki.rcfilters/styles/mw.rcfilters.ui.ChangesLimitPopupWidget.less\",\"resources/src/mediawiki.rcfilters/styles/mw.rcfilters.ui.ChangesListWrapperWidget.less\",\"resources/src/mediawiki.rcfilters/styles/mw.rcfilters.ui.DatePopupWidget.less\",\"resources/src/mediawiki.rcfilters/styles/mw.rcfilters.ui.FilterItemHighlightButton.less\",\"resources/src/mediawiki.rcfilters/styles/mw.rcfilters.ui.FilterMenuHeaderWidget.less\",\"resources/src/mediawiki.rcfilters/styles/mw.rcfilters.ui.FilterMenuOptionWidget.less\",\"resources/src/mediawiki.rcfilters/styles/mw.rcfilters.ui.FilterMenuSectionOptionWidget.less\",\"resources/src/mediawiki.rcfilters/styles/mw.rcfilters.ui.FilterTagMultiselectWidget.less\",\"resources/src/mediawiki.rcfilters/styles/mw.rcfilters.ui.FilterWrapperWidget.less\",\"resources/src/mediawiki.rcfilters/styles/mw.rcfilters.ui.HighlightColorPickerWidget.less\",\"resources/src/mediawiki.rcfilters/styles/mw.rcfilters.ui.ItemMenuOptionWidget.less\",\"resources/src/mediawiki.rcfilters/styles/mw.rcfilters.ui.LiveUpdateButtonWidget.less\",\"resources/src/mediawiki.rcfilters/styles/mw.rcfilters.ui.MenuSelectWidget.less\",\"resources/src/mediawiki.rcfilters/styles/mw.rcfilters.ui.Overlay.less\",\"resources/src/mediawiki.rcfilters/styles/mw.rcfilters.ui.Overlay.vector.less\",\"resources/src/mediawiki.rcfilters/styles/mw.rcfilters.ui.RcTopSectionWidget.less\",\"resources/src/mediawiki.rcfilters/styles/mw.rcfilters.ui.RclTargetPageWidget.less\",\"resources/src/mediawiki.rcfilters/styles/mw.rcfilters.ui.RclToOrFromWidget.less\",\"resources/src/mediawiki.rcfilters/styles/mw.rcfilters.ui.SaveFiltersPopupButtonWidget.less\",\"resources/src/mediawiki.rcfilters/styles/mw.rcfilters.ui.SavedLinksListItemWidget.less\",\"resources/src/mediawiki.rcfilters/styles/mw.rcfilters.ui.SavedLinksListWidget.less\",\"resources/src/mediawiki.rcfilters/styles/mw.rcfilters.ui.TagItemWidget.less\",\"resources/src/mediawiki.rcfilters/styles/mw.rcfilters.ui.ValuePickerWidget.less\",\"resources/src/mediawiki.rcfilters/styles/mw.rcfilters.ui.ViewSwitchWidget.less\",\"resources/src/mediawiki.rcfilters/styles/mw.rcfilters.ui.WatchlistTopSectionWidget.less\",\"resources/src/mediawiki.rcfilters/styles/mw.rcfilters.ui.less\",\"resources/src/mediawiki.rcfilters/styles/mw.rcfilters.variables.less\"]'),(_binary 'mediawiki.rcfilters.highlightCircles.seenunseen.styles',_binary 'vector|en',_binary '[\"resources/src/mediawiki.less/mediawiki.mixins.less\",\"resources/src/mediawiki.less/mediawiki.ui/variables.less\",\"resources/src/mediawiki.rcfilters/styles/mw.rcfilters.mixins.less\",\"resources/src/mediawiki.rcfilters/styles/mw.rcfilters.ui.ChangesListWrapperWidget.highlightCircles.seenunseen.less\",\"resources/src/mediawiki.rcfilters/styles/mw.rcfilters.variables.less\"]'),(_binary 'mediawiki.skinning.interface',_binary 'vector|en',_binary '[\"resources/src/mediawiki.skinning/images/magnify-clip-ltr.png\",\"resources/src/mediawiki.skinning/images/magnify-clip-ltr.svg\",\"resources/src/mediawiki.skinning/images/magnify-clip-rtl.png\",\"resources/src/mediawiki.skinning/images/magnify-clip-rtl.svg\"]'),(_binary 'mediawiki.special',_binary 'vector|en',_binary '[\"resources/src/mediawiki.less/mediawiki.mixins.less\",\"resources/src/mediawiki.special/comparepages.less\",\"resources/src/mediawiki.special/newpages.less\",\"skins/Vector/skinStyles/mediawiki.special.less\"]'),(_binary 'mediawiki.special.preferences.styles.ooui',_binary 'vector|en',_binary '[\"resources/src/mediawiki.less/mediawiki.mixins.less\",\"resources/src/mediawiki.special.preferences.styles.ooui.less\"]'),(_binary 'mediawiki.special.userlogin.common.styles',_binary 'vector|en',_binary '[\"resources/src/mediawiki.special.userlogin.common.styles/images/icon-lock.png\"]'),(_binary 'mediawiki.special.userlogin.login.styles',_binary 'vector|en',_binary '[\"resources/src/mediawiki.special.userlogin.login.styles/images/glyph-people-large.png\"]'),(_binary 'mediawiki.ui',_binary 'vector|en',_binary '[\"resources/src/mediawiki.less/mediawiki.mixins.less\",\"resources/src/mediawiki.less/mediawiki.ui/mixins.less\",\"resources/src/mediawiki.less/mediawiki.ui/variables.less\",\"resources/src/mediawiki.ui/components/forms.less\",\"resources/src/mediawiki.ui/components/utilities.less\",\"resources/src/mediawiki.ui/default.less\"]'),(_binary 'mediawiki.ui.button',_binary 'vector|en',_binary '[\"resources/src/mediawiki.less/mediawiki.mixins.less\",\"resources/src/mediawiki.less/mediawiki.ui/mixins.less\",\"resources/src/mediawiki.less/mediawiki.ui/variables.less\",\"resources/src/mediawiki.ui/components/buttons.less\"]'),(_binary 'mediawiki.ui.checkbox',_binary 'vector|en',_binary '[\"resources/src/mediawiki.less/mediawiki.mixins.less\",\"resources/src/mediawiki.less/mediawiki.ui/variables.less\",\"resources/src/mediawiki.ui/components/checkbox.less\",\"resources/src/mediawiki.ui/components/images/checkbox-checked.png\",\"resources/src/mediawiki.ui/components/images/checkbox-checked.svg\"]'),(_binary 'mediawiki.ui.input',_binary 'vector|en',_binary '[\"resources/src/mediawiki.less/mediawiki.mixins.less\",\"resources/src/mediawiki.less/mediawiki.ui/mixins.less\",\"resources/src/mediawiki.less/mediawiki.ui/variables.less\",\"resources/src/mediawiki.ui/components/inputs.less\"]'),(_binary 'mediawiki.ui.radio',_binary 'vector|en',_binary '[\"resources/src/mediawiki.less/mediawiki.mixins.less\",\"resources/src/mediawiki.less/mediawiki.ui/variables.less\",\"resources/src/mediawiki.ui/components/radio.less\"]'),(_binary 'mediawiki.widgets',_binary 'vector|en',_binary '[\"resources/src/mediawiki.less/mediawiki.mixins.less\",\"resources/src/mediawiki.widgets/images/page-disambiguation-ltr.svg\",\"resources/src/mediawiki.widgets/images/page-existing-ltr.svg\",\"resources/src/mediawiki.widgets/images/page-not-found-he-yi.svg\",\"resources/src/mediawiki.widgets/images/page-not-found-ltr.svg\",\"resources/src/mediawiki.widgets/images/page-redirect-ltr.svg\",\"resources/src/mediawiki.widgets/mw.widgets.TitleWidget.less\"]'),(_binary 'mediawiki.widgets.DateInputWidget',_binary 'vector|en',_binary '[\"resources/src/mediawiki.less/mediawiki.mixins.less\",\"resources/src/mediawiki.widgets/mw.widgets.CalendarWidget.less\",\"resources/src/mediawiki.widgets/mw.widgets.DateInputWidget.less\"]'),(_binary 'mediawiki.widgets.DateInputWidget.styles',_binary 'vector|en',_binary '[\"resources/src/mediawiki.widgets/mw.widgets.DateInputWidget.styles.less\"]'),(_binary 'oojs-ui-core.styles',_binary 'vector|en',_binary '[\"resources/lib/ooui/themes/wikimediaui/images/textures/pending.gif\",\"resources/lib/ooui/wikimedia-ui-base.less\",\"resources/src/mediawiki.less/mediawiki.ui/variables.less\",\"skins/Vector/skinStyles/ooui.less\",\"skins/Vector/variables.less\"]'),(_binary 'oojs-ui-widgets',_binary 'vector|en',_binary '[\"resources/lib/ooui/images/grab.cur\",\"resources/lib/ooui/images/grabbing.cur\"]'),(_binary 'oojs-ui-widgets.styles',_binary 'vector|en',_binary '[\"resources/lib/ooui/images/grab.cur\",\"resources/lib/ooui/images/grabbing.cur\"]'),(_binary 'skins.vector.styles',_binary 'vector|en',_binary '[\"resources/src/mediawiki.less/mediawiki.mixins.animation.less\",\"resources/src/mediawiki.less/mediawiki.mixins.less\",\"resources/src/mediawiki.less/mediawiki.mixins.rotation.less\",\"resources/src/mediawiki.less/mediawiki.ui/variables.less\",\"skins/Vector/components/common.less\",\"skins/Vector/components/externalLinks.less\",\"skins/Vector/components/footer.less\",\"skins/Vector/components/navigation.less\",\"skins/Vector/components/personalMenu.less\",\"skins/Vector/components/search.less\",\"skins/Vector/components/tabs.less\",\"skins/Vector/components/watchstar.less\",\"skins/Vector/images/arrow-down.png\",\"skins/Vector/images/arrow-down.svg\",\"skins/Vector/images/bullet-icon.png\",\"skins/Vector/images/bullet-icon.svg\",\"skins/Vector/images/external-link-ltr-icon.png\",\"skins/Vector/images/external-link-ltr-icon.svg\",\"skins/Vector/images/page-fade.png\",\"skins/Vector/images/portal-break.png\",\"skins/Vector/images/search-fade.png\",\"skins/Vector/images/search-ltr.png\",\"skins/Vector/images/search-ltr.svg\",\"skins/Vector/images/tab-break.png\",\"skins/Vector/images/tab-current-fade.png\",\"skins/Vector/images/tab-normal-fade.png\",\"skins/Vector/images/unwatch-icon-hl.png\",\"skins/Vector/images/unwatch-icon-hl.svg\",\"skins/Vector/images/unwatch-icon.png\",\"skins/Vector/images/unwatch-icon.svg\",\"skins/Vector/images/user-avatar.png\",\"skins/Vector/images/user-avatar.svg\",\"skins/Vector/images/watch-icon-hl.png\",\"skins/Vector/images/watch-icon-hl.svg\",\"skins/Vector/images/watch-icon-loading.png\",\"skins/Vector/images/watch-icon-loading.svg\",\"skins/Vector/images/watch-icon.png\",\"skins/Vector/images/watch-icon.svg\",\"skins/Vector/print.less\",\"skins/Vector/screen-hd.less\",\"skins/Vector/screen.less\",\"skins/Vector/variables.less\"]');
/*!40000 ALTER TABLE `module_deps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objectcache`
--

DROP TABLE IF EXISTS `objectcache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `objectcache` (
  `keyname` varbinary(255) NOT NULL DEFAULT '',
  `value` mediumblob,
  `exptime` datetime DEFAULT NULL,
  PRIMARY KEY (`keyname`),
  KEY `exptime` (`exptime`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objectcache`
--

LOCK TABLES `objectcache` WRITE;
/*!40000 ALTER TABLE `objectcache` DISABLE KEYS */;
INSERT INTO `objectcache` VALUES (_binary 'my_wiki:MWSession:29prd269e378tr2tvd4mo9f95i6s7kjj',_binary '�Q\�n\�0��*_\�G����PP$�z\�\�\�jAHd;m%Ŀ\�8�����\�\�\�Y��:U�\�ꨋ�V\"ט�\�+� \�V`<\�b\Z%�\�r\"�4@&��gC�H�,N2�\�_V;[�Y�c*C1u\n#�p&&�\�>~\��Ao���1\�3;�2C�\�X�B\�M7Y)KJE\�ȳ\��\��(\�3�nwp���!Z	�-���K\�b\�\0ɘ�,�0\Z����$/\�n\���\r��*|)\�qN0��P\�~\r\����0HcF� ��p�	�bz:\r\��z�F�p�η�Ξ\�\�\�c\�\�lfs�y�Զ;c\�wt<�}�_���\Zy�[\�\����<���d��\�@Se�J�K�u\�\r��\�\�Ո�\�\�s\����Κf\�\�\�\�ks�u\��l��)\�','2019-02-06 07:17:10'),(_binary 'my_wiki:MWSession:dpp5ueduvcufo8v1jpa90b3eepn33eq1',_binary '���N!�_\�\�0\��d�`U�\�x\����v�\rP5i�\�\�n�zЃ\'\�??�\�|(Y\�S�LFEU̔�\\a�!�~�\�\�c,fA\�RXqJT]њiT�Za9\0\��҂f\�W�|���Ɩ�^\�t\r\�\�I �@6��\�c|[��ڠ�;b�\�\�\�ʎ\�w\�\�u�\������HGz!r~~?�\�YZ�[\�O[\0pB���Ԗ\n\�T-�m�\�pn\�> Sң\�0+i�W�u7Ǥ\rv\r!�L2�\�ҠU\�\��\Z+[3j��\�h@Au6q\�e\�\�bv>\�w\��i�\� |�\�\�ؖ�9h�\�ì/�\�w}�u8A�a�\���\���*��W��-F\�}���o�)\�c��\�1Z�\\\��V�\�\�&j�yp\��[i��\�޻~�A�t��HF\�>�\�\�H�\0','2019-02-06 07:07:51'),(_binary 'my_wiki:MWSession:ldcpa41pg2758g2haep3mr9e5pm4do62',_binary '�Q\�n\�0��*_\�gb�S\�\��U/\\�xM-A�i+!��vB�C{�\�\�\�\�\�Ύ�\"\�S�\�Q�D�1W\�WXB�\�/���IP���Dp-�`�\"��V%`\�F��\�G\�\��\�X2�\�uLe(&Na�\�\�$�x�3�\��j�C\��\���̐�3V��u{艜IFYziB\�\�o��y�2�궰���#Z�\n�\�Ra��\�!\0�sc�+0\Z�溅�$/\�n\��	\�\�*<�r�8\'�V\Z�����ec1B8@)\�\n,�\���P�⶘�Ͻ��#y8�\��w�\�ki�1\�t6��ļ~꺭�1�;:.o㳫�<uR#�rK[�_�ʡ�\�$���\�:\�\�\n]µ�o\�e�Z,G4�\�\�!ܾUJ��ݻn��z��y�\��L��)\�','2019-02-06 07:58:20'),(_binary 'my_wiki:jobqueue:htmlCacheUpdate:rootjob:0116ef89e7cdcca40d54a9defc5383b0238830f9',_binary '+�24�R220�4020303562W�\0','2019-03-06 06:53:27'),(_binary 'my_wiki:jobqueue:htmlCacheUpdate:rootjob:035a42f1b0277ca8dedb1478640c0dde9080cf26',_binary '+�24�R220�4020305�00R�\0','2019-03-06 05:48:02'),(_binary 'my_wiki:jobqueue:htmlCacheUpdate:rootjob:05da3e47fff97f7229ae57667cb0eec3000c7572',_binary '+�24�R220�4020303500U�\0','2019-03-06 06:50:05'),(_binary 'my_wiki:jobqueue:htmlCacheUpdate:rootjob:0aab1a9f3911664672950761543095964051ec36',_binary '+�24�R220�402030��J\�\0','2019-03-06 07:02:05'),(_binary 'my_wiki:jobqueue:htmlCacheUpdate:rootjob:0bc19c861865ec4e948b45f6df3e5037698c7dbf',_binary '+�24�R220�4020303561T�\0','2019-03-06 06:53:41'),(_binary 'my_wiki:jobqueue:htmlCacheUpdate:rootjob:10b067e5274b66e950cd92f87940540f2be98758',_binary '+�24�R220�4020303561T�\0','2019-03-06 06:53:41'),(_binary 'my_wiki:jobqueue:htmlCacheUpdate:rootjob:1179a9d962abaf9c9a7dbe1c6ca54a281e7e49e1',_binary '+�24�R220�40205�023�P�\0','2019-03-05 08:26:58'),(_binary 'my_wiki:jobqueue:htmlCacheUpdate:rootjob:119b78401feec80ee7170226442ef1293193054f',_binary '+�24�R220�40205�0�45T�\0','2019-03-05 08:19:51'),(_binary 'my_wiki:jobqueue:htmlCacheUpdate:rootjob:15c881b62fd984896934e66a655543bede47e3cd',_binary '+�24�R220�4020303�06V�\0','2019-03-06 06:58:33'),(_binary 'my_wiki:jobqueue:htmlCacheUpdate:rootjob:1705514643104ef5aadbf4c938d29bb9538e2225',_binary '+�24�R220�4020303176Q�\0','2019-03-06 06:47:34'),(_binary 'my_wiki:jobqueue:htmlCacheUpdate:rootjob:1bea97e65a89762433d9bd82fab74255e6ad38b2',_binary '+�24�R220�4020305�44U�\0','2019-03-06 05:49:15'),(_binary 'my_wiki:jobqueue:htmlCacheUpdate:rootjob:21d77cb092c5db01633bd078e78dc97c97291771',_binary '+�24�R220�402030453�P�\0','2019-03-06 01:56:18'),(_binary 'my_wiki:jobqueue:htmlCacheUpdate:rootjob:24dac29d00db62cc6cafe73836915b8cb6350453',_binary '+�24�R220�402030354�P�\0','2019-03-06 06:51:28'),(_binary 'my_wiki:jobqueue:htmlCacheUpdate:rootjob:2f8d705908f0e9be3c9ae202001c100b7703ec58',_binary '+�24�R220�4020303�45R�\0','2019-03-06 06:49:52'),(_binary 'my_wiki:jobqueue:htmlCacheUpdate:rootjob:30ec3884fa9adfaeb77b425b6f5b936249931220',_binary '+�24�R220�4020303176Q�\0','2019-03-06 06:47:34'),(_binary 'my_wiki:jobqueue:htmlCacheUpdate:rootjob:3cf1f139231bef347799a4b27c86faf28fb37c89',_binary '+�24�R220�4020305�40W�\0','2019-03-06 05:39:07'),(_binary 'my_wiki:jobqueue:htmlCacheUpdate:rootjob:4c7d7fd46a6dd615d785de2d49cc0795d220577b',_binary '+�24�R220�4020303545W�\0','2019-03-06 06:51:58'),(_binary 'my_wiki:jobqueue:htmlCacheUpdate:rootjob:4c9b28bcece169c906d68b2e9438f5b230747a6b',_binary '+�24�R220�4020303500U�\0','2019-03-06 06:50:05'),(_binary 'my_wiki:jobqueue:htmlCacheUpdate:rootjob:5381cd66a63429bc52df4acdda94344c99ce30c2',_binary '+�24�R220�4020301456W�\0','2019-03-06 04:15:37'),(_binary 'my_wiki:jobqueue:htmlCacheUpdate:rootjob:666c1eef4571595e17c9bfb1c83f9b4547f104d9',_binary '+�24�R220�4020305172V�\0','2019-03-06 05:47:23'),(_binary 'my_wiki:jobqueue:htmlCacheUpdate:rootjob:70d476256365fc261d47c3b9b0291376215f536c',_binary '+�24�R220�4020bC%k\0','2019-03-06 02:08:41'),(_binary 'my_wiki:jobqueue:htmlCacheUpdate:rootjob:71c8efe7b3c22435bab71497e5cefd99135c2b2e',_binary '+�24�R220�4020305�46W�\0','2019-03-06 05:49:37'),(_binary 'my_wiki:jobqueue:htmlCacheUpdate:rootjob:727fe0ec5fd028b9c5fca45659794012d579bffa',_binary '+�24�R220�4020303�45R�\0','2019-03-06 06:49:52'),(_binary 'my_wiki:jobqueue:htmlCacheUpdate:rootjob:781aec36407e395fb9719b2993bb12fc1901557d',_binary '+�24�R220�4020303500U�\0','2019-03-06 06:50:05'),(_binary 'my_wiki:jobqueue:htmlCacheUpdate:rootjob:78a35b0f55d607b3619d00e9e57ddd6924bda203',_binary '+�24�R220�4020303�00Q�\0','2019-03-06 06:48:04'),(_binary 'my_wiki:jobqueue:htmlCacheUpdate:rootjob:78c0c78f085e2bb27a9461ff789d4aa1de84587b',_binary '+�24�R220�4020301�00W�\0','2019-03-06 04:38:07'),(_binary 'my_wiki:jobqueue:htmlCacheUpdate:rootjob:79a40785f3afdb5af0d0ee755b1d64b6c8fa834f',_binary '+�24�R220�4020302614P�\0','2019-03-06 02:34:10'),(_binary 'my_wiki:jobqueue:htmlCacheUpdate:rootjob:7ca047402fa80ecc9d2d8ab54999bb88586867cb',_binary '+�24�R220�4020303520W�\0','2019-03-06 06:52:07'),(_binary 'my_wiki:jobqueue:htmlCacheUpdate:rootjob:7efff84d703b4e122a6dcaffef6656f5ee1fa254',_binary '+�24�R220�4020303561T�\0','2019-03-06 06:53:41'),(_binary 'my_wiki:jobqueue:htmlCacheUpdate:rootjob:8921aab9b3676b6544fc0fd3be7cbb8f631f0e13',_binary '+�24�R220�4020306056T�\0','2019-03-06 03:05:31'),(_binary 'my_wiki:jobqueue:htmlCacheUpdate:rootjob:8948e63276656dee53cd080445fa3c80a136d778',_binary '+�24�R220�4020303520W�\0','2019-03-06 06:52:07'),(_binary 'my_wiki:jobqueue:htmlCacheUpdate:rootjob:8ea2c23ae189dd84321ad1dcb4394e8e1c541b97',_binary '+�24�R220�4020303545W�\0','2019-03-06 06:51:58'),(_binary 'my_wiki:jobqueue:htmlCacheUpdate:rootjob:919a59d1486fa529aa46b6bb3cdadae6aa51cbfa',_binary '+�24�R220�4020305�40W�\0','2019-03-06 05:39:07'),(_binary 'my_wiki:jobqueue:htmlCacheUpdate:rootjob:92b345cc55c9dab04c5f17f800f4b9abeb289d2d',_binary '+�24�R220�4020bC%k\0','2019-03-06 02:08:41'),(_binary 'my_wiki:jobqueue:htmlCacheUpdate:rootjob:aa36221b6cefee7cf63a8752a6fc21d15d160aaa',_binary '+�24�R220�4020305�46W�\0','2019-03-06 05:49:37'),(_binary 'my_wiki:jobqueue:htmlCacheUpdate:rootjob:acf08243e57787ca55e2ef4a6764331eb2261f95',_binary '+�24�R220�4020303�00Q�\0','2019-03-06 06:48:04'),(_binary 'my_wiki:jobqueue:htmlCacheUpdate:rootjob:be443f3a5658db42a626b8d2a012d542c2d2e807',_binary '+�24�R220�4020306056T�\0','2019-03-06 03:05:31'),(_binary 'my_wiki:jobqueue:htmlCacheUpdate:rootjob:c1f212f0424d7247c42d37629c3e60153daa2227',_binary '+�24�R220�4020bS#%k\0','2019-03-06 02:05:24'),(_binary 'my_wiki:jobqueue:htmlCacheUpdate:rootjob:c24239077147ab07638a135d61f78664726b16b2',_binary '+�24�R220�4020301456W�\0','2019-03-06 04:15:37'),(_binary 'my_wiki:jobqueue:htmlCacheUpdate:rootjob:c2ed8b92f9d3c97a9a3cc9e30005d5232659844e',_binary '+�24�R220�40205�023�P�\0','2019-03-05 08:26:58'),(_binary 'my_wiki:jobqueue:htmlCacheUpdate:rootjob:c3199a3b281d2375ea7e2f5edf79d537fe6f0960',_binary '+�24�R220�4020302614P�\0','2019-03-06 02:34:10'),(_binary 'my_wiki:jobqueue:htmlCacheUpdate:rootjob:c3b59beb054f808a4d4dddd17b0de112377757f1',_binary '+�24�R220�4020301456W�\0','2019-03-06 04:15:37'),(_binary 'my_wiki:jobqueue:htmlCacheUpdate:rootjob:c57ad95adbd70a234fc238548a48bc352ec5ae86',_binary '+�24�R220�4020307045U�\0','2019-03-06 07:01:55'),(_binary 'my_wiki:jobqueue:htmlCacheUpdate:rootjob:c848daa7e597b0f6ae2a82f54aad1b534a754adf',_binary '+�24�R220�402030��J\�\0','2019-03-06 07:02:05'),(_binary 'my_wiki:jobqueue:htmlCacheUpdate:rootjob:c8b4ef201a51123216d709c1b9fc2ffd91ece68c',_binary '+�24�R220�4020305�46W�\0','2019-03-06 05:49:37'),(_binary 'my_wiki:jobqueue:htmlCacheUpdate:rootjob:caca4c8471dde3c3383c3b47984a8de765e723b5',_binary '+�24�R220�4020bC%k\0','2019-03-06 02:08:41'),(_binary 'my_wiki:jobqueue:htmlCacheUpdate:rootjob:d12a9953b8185a610cc9fbfcae89c3513468732f',_binary '+�24�R220�4020307045U�\0','2019-03-06 07:01:55'),(_binary 'my_wiki:jobqueue:htmlCacheUpdate:rootjob:d415977bca6d3c9bc53870817a23c12982276333',_binary '+�24�R220�402030��J\�\0','2019-03-06 07:02:05'),(_binary 'my_wiki:jobqueue:htmlCacheUpdate:rootjob:d7d8bfabdd213423d1473e3e89b73e97d2803640',_binary '+�24�R220�4020301454P�\0','2019-03-06 04:15:10'),(_binary 'my_wiki:jobqueue:htmlCacheUpdate:rootjob:d92a41a727138d0379f57e6bfab26f106d8aa5ab',_binary '+�24�R220�4020302614P�\0','2019-03-06 02:34:10'),(_binary 'my_wiki:jobqueue:htmlCacheUpdate:rootjob:df9c6e2826a144aee44490f1a1cdc6d38085693d',_binary '+�24�R220�4020301454P�\0','2019-03-06 04:15:10'),(_binary 'my_wiki:jobqueue:htmlCacheUpdate:rootjob:e23845771637c74cdebcdcea1ddfff7f3b28b0ca',_binary '+�24�R220�4020306056T�\0','2019-03-06 03:05:31'),(_binary 'my_wiki:jobqueue:htmlCacheUpdate:rootjob:e744dae4efd4d129bd209428cfc817405a14a41a',_binary '+�24�R220�4020303562W�\0','2019-03-06 06:53:27'),(_binary 'my_wiki:jobqueue:htmlCacheUpdate:rootjob:e8ff8d9ed453470fc9ea8b5829bf21aaafe3cd59',_binary '+�24�R220�4020305�00R�\0','2019-03-06 05:48:02'),(_binary 'my_wiki:jobqueue:htmlCacheUpdate:rootjob:ef9436522e4672e8fd9127b3200a5453a7e1e83b',_binary '+�24�R220�4020303520W�\0','2019-03-06 06:52:07'),(_binary 'my_wiki:jobqueue:htmlCacheUpdate:rootjob:f5d893004af08fc6ee0e81de2ed8ac6ec40b95d6',_binary '+�24�R220�4020303416R�\0','2019-03-06 06:14:32'),(_binary 'my_wiki:jobqueue:htmlCacheUpdate:rootjob:fa016df1f1cca375f0a946ea80885431a818a978',_binary '+�24�R220�4020303�06V�\0','2019-03-06 06:58:33'),(_binary 'my_wiki:jobqueue:refreshLinks:rootjob:0b3411474dad1f006fffdfe81b80269363d262f9',_binary '+�24�R220�4020303500U�\0','2019-03-06 06:50:05'),(_binary 'my_wiki:jobqueue:refreshLinks:rootjob:3b91b714be4947146cd0becc1f662e4423f5e32d',_binary '+�24�R220�4020302614U�\0','2019-03-06 02:34:15'),(_binary 'my_wiki:jobqueue:refreshLinks:rootjob:5d73c8b8997b1ce416660a32b95a0d698a523c93',_binary '+�24�R220�4020306056Q�\0','2019-03-06 03:05:34'),(_binary 'my_wiki:jobqueue:refreshLinks:rootjob:765fa57e4d2193982963c27c3ed34154674e2205',_binary '+�24�R220�4020303522V�\0','2019-03-06 06:52:23'),(_binary 'my_wiki:jobqueue:refreshLinks:rootjob:c31868bd2b53a595e9631bc075ee189e5e810147',_binary '+�24�R220�402030��J\�\0','2019-03-06 07:02:05'),(_binary 'my_wiki:jobqueue:refreshLinks:rootjob:d2eaf9c466a694eedf11ed5ed85f7fde67998685',_binary '+�24�R220�4020303561T�\0','2019-03-06 06:53:41'),(_binary 'my_wiki:jobqueue:refreshLinks:rootjob:e84b1cba863b9e629cbd05dc71fa5354748dd571',_binary '+�24�R220�4020305�46W�\0','2019-03-06 05:49:37'),(_binary 'my_wiki:jobqueue:refreshLinks:rootjob:fded3c63d4e7cc02283873d4d559b53dad5c9615',_binary '+�24�R220�4020301451W�\0','2019-03-06 04:15:47'),(_binary 'my_wiki:messages:en',_binary 'UP\�n\�0���O-�1��9�($D*=.\�Ď\�\���{m�\"<��3k/�����\��\�\�\�%��N\\EP\�\�H\�L�\�8NZm�\�S��Z�\�mR�T���N�67��7\�Q\��	\�m\�j.\�C%��*t\�A��^<\�\n<\�XH��g\��\�x}kѐ\�ZU\�\�\�B�.Z��\� 9h���#.J���M�D�H]n�\�\�\�܁M�._ӝC\�x5\�Ƴ$�\�\�=Yg�tE\'RpW\�:���{\\М�C�#\�\r\�ѡ�#\�w9\��p�`4F\�74ٽ-\�a\�.��\�q�\�y�N~~','2038-01-19 03:14:07'),(_binary 'my_wiki:pcache:idhash:1-0!canonical',_binary '�X{o\�6\�\����aPے츎\�(\�GR\�<\�?F�m.)���(���ϸO�;�r$?Ң\�j\�a�Ȼ\�\�ww�y\��{As\���Bg�v\�^~V\�^\�\�\�^�C��|e\�ҹ\��)�9�\�\�8�QEn��i���=\�\�]ΨG���H4\�3FF�D	U\��\�,4!\Z��Y\�&\�L\�L��\�b�h�hdF\�2�v�M\�*c�Ix�<�bZ\�)\��$��fB+w|���Ȼ�\�lԡc2�9`��)\�\\\n?�\�bjРR�\�D/h\�\��3�\�gFE4]�f�\�	\�%<>p\�1�A\�\'p8\�,v\�v�\�\0�\�E.h\�\"c9�\�)\�\\�[�X��\�oQ\�<<u\0�3*��(\�\��<��T�q��i��P}R%&�jc�T\�$\�Jc�G�\����޾�ݭe|ܰ��\��r\"�D.\�o���UM0HJy�Rad�7�\�B\"bu$`�Q\�\���!9�3\�.~�ΩPIy_9S�\�#f�0���9I��ss�2��%]2�2FsAfrA�$�� 1\r<Է�6\�@\�;\�\�y�E�3�����\\C\�3�k\�F3\r������\�{�=�W\��\�x�ɠ\��<\��RДG`\���Lh��sxqct@i\0\�!�\�^0@~J+\�a0\�\��+�`\�%�]A�\�\\q\�/2f`�@ݎ\�Ws\�	�Z\�<x\�,��篿�*b�aQR�6\��D��\�\�\�\�v��r�Y�A0B�i��g;��\�)M�R�d�Y�g�N\�s\�\�gV\�jv2�t7��\�<\�\�@�\�ywy]	Z[I��\n\�^霅\�j�\�\�:&��A�\��	zy\�\�ן_�\��u�^h\�\�o\�i{\�\�^�\�#\�哖�Ў��2{�\�a+\�\"��g\�-I����ff=\�14�Y跼\�Rp�K\�D5:\�ֲ\�s�\��yL|��q\�>{\�K+^�pq�\�!\r����� ;W�2\�l]p,b��e^xؙ�NX՞�\�ZW�\�}4�f\��Q����\�&y�\�S\�X\�=�ŷ<aW@\�hv�an\�\�\�\�[>V�8N��ᓛ���>��r�{T=\�\�\��\�أ*=5o��\�XU�\��@��QE\�R4\�ݨ\�<\�3�y�\�e<��r�q���7�g�`j\�\"\�\�=�\�p�̗�\�#̎�\Z\��c��ʸH\�zf��WT\']�udz\�<����L�4_gN92IYw\�3�M�L����ˬ�\�g~P��ـ\�2J؜%\�\�@<\�g0��/\�j\�64Z\�\"�e�=滥*.bv__<�\\�\ZI��|������L�%ԠW\Z�\"�\�|\r\�j\Z~�.�\"�\�u��\�\�\\�]���0R��fKkU3m�\���\�7������	;?�9�R!\0P\�\�1ϰr����hY�\��66����x�����X\�LczM5}عE\�	)��qU{�#�h��eWkE����d\�|x\�m\���}�����/\�\�\0�#�q&(�]�W�[v\�u�yz5�l�l�\�v\�\�C\�/���V�\�7�xV��J�����\�\�\�$�-:\�ð� \�`\�8\�ӽ҃\�\��r�&3�l5\�\�\�55\��\�ڴ��ۜ\�m?�\�ݽڽ�ل\�\0\�d9\�	��25�\\�xe��[�h�����#\�T.3f\�\�j��q�N;y�Ե׿�<\�*��/%��5Ǎ�>\n`Z\��$���<\�\�Vms��wm1F�n�\0~5l%MS\�`���c\�i*�\�\�I\0w�y�Y�e+��\Z�5\r%���\�M�\�aXRa\�\�F���0��y�?Z#\�~\"�l�\�?\�\�\"�}��k\�BM>a�\�\��-ck$�G\�9\�9�x��\���U�\�\�WoZV��\�\"\�\�͏�ϟ\r���cN3h�����O`մS��.Z\�XK�_7&G8���b��\�7\�)\�\�\��\�ۡ��n\�m��\�z���GR\�u�\�o�V��F\�\�V�e-��U&\�l�\�\�K���0\�\�','2019-02-07 04:50:20'),(_binary 'my_wiki:pcache:idhash:10-0!canonical',_binary '�W\�n\�8����P`�cI�\�DvnҤ�\�F���#167���{��	���%;CI�$\�n�5�@\�\�\�9s��g;�9�B21\�T�)\�s\����ݱ�2�tz�g���t�Ӌ$e\�*ń4\�\��S\��%��ޛ݈���g�}\�\�G=\�\�\��8`��t�v\�%�\���(�B�\�ԫ�\\=�����t\�O\��p�[o�\�S��K6\'j�\�\�$U<��\��*)WOk�w�.Vm\�x�I�D\�<\�/4���-5�ZuR���\�\\\�\�0F�;bܰ�锄<\��&Bc\�/X\0#\�ǲO,\�\ZX�~�\�\�2\�V)k�\\\�2>�c\Zq��I�X�<�DCɌ��^\� ��s�dY�C$�@\Z���\�S�E$>�2d\�%WQ��d\�\�\�ږ�\�U\�,f�6�ݭr\"տ�	\�8 <�\�\�$�#\�:\�\�;�\�ǵbҸcQ\Z�-B\�<� �=z|�`RmTBo���j�1��q�J�.I5P\�S�\�Aepg\�\�R	�\����\ZAoiZ���\'W�\�\�\�5\��	jk\�\�t\��&��yɷ>\rC�V\��n@<po���\"�g��J\r���{ftɰ�ej�\��䙭I�~���R�\��`A\�³���ڧqspL0I*\Z��v\�B���!p��ct�\�C\�\���\�\�\�\�R\��}�\r�1$3OgM�e�k�����\�\�M\�YͲ��ktY���oܳ\��ő\�\�YZ�\�v���g\�\'K!h\�g� �P9.\rԧk!�\�\��M\�\��U�q*\�AE��bUm$:\�!�1*�\�&֍+}�ʈiجt_dx\�m\�\0�G�\��\�U\�\�kaB7\�\'\�H&ֵ\�F�KhҊ}��:	��5�\�Wg>�FUe��L�\�\�P�Y����ϿPѬfN�IRM�_��\�\Z�E^\�bL�P��\�,\�&㋻\�+<^\�\�n\Z�\0F\��|�\�c\�ѫh�,��!�L\�/˒9Ъ��W�W\��l5MB\�+~�r\�P�\�\�4eA�llq,�T٣.��$Й=��\�#\�/z\�|��n�mqw�\�s�R�kkH\�PH\�L��\�������4ah<Xu�h�V�A]/MbA�\�Y:9�9$U�哵L��{\�5��\�\���^c?��|�,�Ӽf��`mĩ)gv\�P?c�Y�\r3h\�i-��g\�\�l̙�d4Mh�\�������,��ή\�m\�z�۾oo��ʹ5|Bg\0Z\�\���2\��\�<L}�6�ӄ�5���\�\�b\�ն(0\�=}}\Z\�U#qs8\�\�F�c�8��\��<+᣿p0Tשj\�Aı<�X+`�ڒ�3u����k\�`\�B+h\�6\��6����S7d5UA\0g}\0<?m\�\�\n�\�e\�\�8z�~�\0N\�6 �(�a�l-`:��.����*��\��h��A�h\�?�P\�v\�c�\"��X�\����O\�?C>\�\��Vپg\�h\�R�\�Ck��޲\�%�\�Ͱ�_M\�>�/\�!ʭp-^5_:�ź�\�_�%ݶX���M\�\��:3��wys^\\d��*�\�\�X��0��Q`\�>\Z�����һ+&���\�z�˛���\�mqs\�pz��?','2019-02-07 06:53:54'),(_binary 'my_wiki:pcache:idhash:11-0!canonical',_binary '�W\�n\�6\�o?+��Զ$\�v\"%��YR���K��`$\�\�\�Hڱ[\�#\��$;��lI����$2y\�\���k\�q}kB�d\�z��|\���K\�[\�[)+��\�\�:����1��\�\nY���N�k\�8�*\�R\�K��H[s�r�\�w\����\�OX\�\�\�ۧ�\��=�\�:c��\�q�^�t�U�P0%{I\�Y\�Gj~l�<\�\"s\�gsul\rF�E�u̎����z�O\�~\\(6�+F*�U@J(��	�T�,�h J\�M�mi\�V�|��\�x\��\� N�WuG}zr\�\�\��P\r�\�9z\�\�\�{�LH\���`y&T甆s\�\�\�vm\�\�#\���\na����O Kv\��:�	un�\�>�\�X�\�\�\�^\� 	5�	c����\�\�0\Z�|YȤ\�Yr\�x�f+�\�@~���u\�R&hs��ݜI���A\04�O\�x\�$���]�p\�]�VLv\�X�Ǡ�P1[$ٞ}\�\�\"L*��J��$b�n��gw>�r�KFr�\"2]��\�]\�9�\�ܧR	�C\r�*Aki^s�tgXg\�\�vOtm;w܁\0���s:\�E�\�/o\�&�mH\�X�U&\�_;\�\�\r�>\�D\�U���6Pt\�-]2\�bZ��㉫9ydk���b���^�y4�râk�)�	�.IE��\�nZ(\�\���\��\��`]\�t����\�飴\�\���8�@v\n�\�2�YSp�F`Ze�*�q�q�\�P����-\���#�ٰ�O�\�U\�\�\��ET��\�=\�p\��iꌍ�\�(�\��\�\0N �o\��:\��y�0����4a~˔m2<�c\\�E9�>\�ǫ�����<.\\�$�\�a��3)\�B٩��a��a3>�q3!C�c�a�\�*Cr�AX��o\�\�9L�\��*�\r���um��\�\����3�)�q�\�f�6��l��!I4E\�i�N�\�3\�\��x�e\�\0A���\�\�X5q5�1Y΄��)Fqw}z~�\�\��Z��G\rVv\n�!S\�1\'�1����(S\�B�R�+D[M���늝����]��E\�փ�\�|�<\�(B;�]݃��\�*z����n\�l�t�Tt�\�S��\�.[���\�\�\ra�\�kh\�.�\�\��mO\�7�}C\�d��/\�\r\� qH��C�\�bΖ!\�Oo�g���{~0h���^Lu\�IEB+JJG�h%n]I9�K��\�4lxB\�Ok\Z�\"o\�`�s%�izk5\�\�\Z\�uw-o�\�\��s{\�V\�ְ	�@��\���\�j�т��<ZZ!`M\�\�V\��6��\'��LEk\�\�H\�\�i\�W�M���\�\�m	\�8*�\�P5��;� 	�\��0zے\�V����\�Zu\08#\�\�\n��o�\��s��+��� �Z?��փii\��i)\0\���~=\�rV�^�!0�\��\�V����#�)V�uJ�y\\\�BO\�i{0d\�XD�B��=�����\��\�\�P\�._�ŴJ�x�j\�\�\�N�e�aˋ\�\n��V�~4���{�<\�7\�\��\�O\�\�\�͊�n[4}��w\�\�\���f�qu��\�}�ʯ\n�\'��~�0Xwz����u\�����k\�v��\�\�\�\�~�zc\��\0h\0\�?','2019-02-07 06:48:04'),(_binary 'my_wiki:pcache:idhash:12-0!canonical',_binary '�W\�n\�6\�o?+��ĩ$_�HÀ\�I\Z�m\�N�s`$\�\�HʱW\�#\��$;��bI��3`�\�9<\�\�;��z�\�Y3*$\�\\e����\�}�\���\�\�(˗ޙ\�xV\��\�.\�L\�\�lF\"sE\�R�:#\Z�XH��G\\۹�]{h��3##l�q��\���o۝\�mBc� MK�G�h$Yg4{\�6H.\�,٧�\�\�@-��{F�#\�\�\"ҀI�\n�\�+�(IC^r�atl���.Y\�m*�;\�T����IHxD9�I�F�ѵ/Μ�K��\�΂\�Y�\�<�\�\�\��\�IE�Q\�ӄ�,S+T\�۝�M\�\�t\�H�\�B��$P�Uͤ�H%x=rQ7\�\�Y-�2��I��\��]���$��\�\�E7�&�|8�\�I@�H��\"\�_;4\������8��RE#\���gN\��X�ht�p�\"\�lK\�\�/��{�>�x��r\�\�\���	\�����qր�\n����yHz�A��b����\�2�\��\�YZ>�l\����\�$�LgM�8	��JEU`#A��X\��t\�#\�=H�,��)y\Zg}�\�yé6QT�z\�V\�\�aEr��\�~U�\�\�Q��b�*Ǵ�6���F\�:;�a\�\�jt�3\r?\��l��s\�C\�\"&\�g�\�\�\�\r�\�S��qߥa�f�\�t\0�UU\�\�\�Զ~\rE_\�(M���+\�j�\�v��\�/@����\�8-�jc&Ҍ	Uf���nw�\�f\�\��_\�Q��D_��\�^%�1b\�\�ø,�hyW�\�\��l3K#l+~z��\�\0G��\��\�\�\",4\�/��;\���8�\��(u!#\�\�Ko3!��C\�\0EiM���i\�\����\�8�u2��8\�|��i\�)\�o�\����\���^�qƧ��\�\�\�	\�\ZD1\��n���\�V�\�2�Nc=\�[o�M���f��[D/�CuԮu�Y%\�Þ]s�\�~\�`��J\�\Z>@J\�\�O0\�4\�\�e\�\�\�\�\��Wz�\��I\�A\�S\�\�O\�@�&\�eɡ�\�+\�P�h�a�|���ѯ,\�%q������q\"&\�J���Q\�,\�Ա,�U\'�3D���\�p\��\�#\��`�$�^!\�O\����\�C(\�\�GI�fm�b?�\��b���\��\�\n�\���$T�\0+�G=\�B�\\B�O��*\�X�D�l_�\�6\��4x�|^\�\�����hu���=�y/g�����ǡ\�O�V�~4��\�ף�\�f�E�L�K\�<f����19\��\�|\ni�.��?\"\���\�\�/^)յ=1\\��2��/�\�O��/�\�jQL�c\�-�J����\���x-c8\�\���','2019-02-07 05:49:37'),(_binary 'my_wiki:pcache:idhash:13-0!canonical',_binary '�V\�n\�8\�s�B��\�J�%�\�(\�d\�\"��8m�4���H��|٢��3��P�\�X�����p��\�B���Ԭ\�y�\�p�?�p�\�l��6\��\'NYQ|t�u/�	8�[��p�\�M�r?��|�\r\��}�\�\�\�\n�\'7!��\�Kp\�\\/�g\�:\��\�5\�an\�!O��X�~�罏���\�,u�H\�3(4\�r\'��/�F\�hp\���/�O��\��z�NLژuv\�Ģd�\�\�p#z\�\�_��Q7f\ZRqh+&\"�\�Z*[\�QG�Naז\0%��p�H5�e�IqJ�@݈B�B\Z\0\��\�\����OKsF�d��m}�\�+�\�����\\c嶞��\�hP��\���6\�Q׻:2��b�t��\�>\�<�4��4�mH��%\r��Oy\�ʤL��m%�Ǌ\�\�\��_uz\�t#\�\�b,\�_|g�\�\�j�����@\�#S��EKZ\�\�nƝ�9(\��\�a6�~���c\�Z\�\�e6\�\�\�^sT��`/��\�l�m�kY�\��\�&\�;�@\�\�ɔ\�[+N\�\�3�\�P�\�\rBp�gKc!�)_�f���7<\��r��\�+\�k�\�~��TFً\�\�\�pP�S\��w԰\�\�8#�v��]��5$�S^F�T}}�z\�\�%6� @�N�`߿\�o�\�B\�&\�;��8-���I\�ř?H\�\�5��Z��;\�6�$\�\���\�{PU0\�s�^�S)\�Lǲ�PM\�a��F\"�G*�A�\��r�ֹ�b\�d )s%��^3�V9W���\��\�\���x���NOK\�R\�\0\"�\�\ny|��Ö�F(����\�yK�\�@�8c��\'���[�a�|�\�\�c�*�\�*ܔ\�o�L\�<��\n\�$�1[��7���k�\�$�?\"�N\�41�\�\��c\�9��M<\�#\��mjK\'��#T�\n\�|�Do�6��S�ު!�X���Z\�\���P��\�0��ą�\\�B�O4i8T_c-\�\�mƸ��a�3\��.��\�U\�\�\���,\�9\�%�\�=�&�M�N�>*�\�\��\�Wcz\�\�˿\���m>\',\'\�\�M\�\����\�UT�D�٫yZ�9��0\�(s��\�\�t��S\�j�����\�.\�\�p%��\�\�T$����','2019-02-07 06:47:34'),(_binary 'my_wiki:pcache:idhash:14-0!canonical',_binary '�W\�n\�6\�o?+��Զnv)	0�\�.M�\\ڟ-\�\�*Ҏ\�\"�aϸ\'\�9eK�\�v\�$�\�\�s�\�G]{�\�ZV\\/d���\�\�\�w\�<#�c+i�³,w\�\�!_� �B�K%+�\��\�,ΨL����,#�N�H\�\�-s�?�ir�\����o\r{`yB\�L��c\r\�O\�\n&\�\���$w\r�\�C�c\�4H\��<�\'�3�/B�cvb$t\�W2�L�Op��V�6�\�W>��@	|5H���\�b	\"�$*\�\�߆��l5ȣ|��\�\�\�\�\����xHO��*������z\�\��}һb��	�y\�%)X��wF���D�y\�6�#\�6\�\�xd�V�G\�*\�\�\�#�!_f\�\�:�	T��<2��`��ɽ\�AJ\��\�t����\�\�0\Z\�l�6\��\�&DV�%\\�Gi2��@$I}��s�����ݭp&\�\��\�4$<\r\��	�\r=\�\�\�+kd�\�Z2ѻcI�.B��\"�\��ȝC�0!�R*x���\�ن�\�{�\��.\��\�l���s&:׻O�,x5E]	Z\�\�\�\r�+wFepڝ~�TնwW�;�ҶuN%�,5�\�\�\�D�h��R��k��b� �����E�2�4V\�K�Y�BTw<r\�?��?c�z�Z�xQy�\�7�\�\�A���I\�j7�Y0�?8\�C2rzͫ\�\�@��\�|�s\�\�a�\�3�\�O8�`\���gg퍋4\�2+\�&�7.cV\�8P��\�h�eA\�\�\�\�\�\��EX\�y��\�4\�5G�\r\�{F�\�=\�G}�\�\���\�\"��sl��\�@=5�!\�o��Z�p:PQH�;�f_��i\�\���=\�Ð�ͧn15��ӓN�\����\�\�ԌT�a�\�U:�L���\�\�3\�0�:�0\�W\�\�Ф�X7V\�\r/�ok�1]�p7�\�nVo���\�9\�=���\�{q��3>�H�v�K~<ϲz�G��)Ԥ��\�j\'cRd9+d�M1��\���X�\��7=���[P�hd�\�\�I\�4f\�\��U\�lh\�guf�H`�I�`]�\�;��8`Y\�\�?�KF�d������_\�\�VQ\�\�\r�tg��K��5�*Y�LY`K�T9���뾆\�Q\�϶\�{��iɩ�\�l\�\��\\\��\�\�\�8��-\�lb��yvϻ�\��u{9\�5\'�	�)�\�ܣ�\�M%\���\�gt�Ӱ\�	E?�ip\�ܝ�%\�U��\�Ӽ�s8jjX�$\�ߵ��[�s�\�\�\rwT�[\�&t\0\�3����B�\�a\"4�B�����\�}�DF3��k�1�{u��\�\�jl#�s(��_�p\�\�\����|\�L��BUZڃ$�cx0�N�(�%��d0�]\�5�\0�ƨ�4M\�~��C�i*2[�\� �Z\0\�O\���t\�pZJ@!�\�a74�������|Mj`:|�.���I�\���é�\�\�\�B�x\�Nۃ!=\�Z ��%Ȝ+>|��ĳ�\�]�z\�:\�\�\r�%q�ÝZ\�zÖ�\�_��\��T\��o��_�kE�!y\�\�\�~V��Wtۡ\�]�\�M�U\�j�zW\�|}s��S�U��\�#S/\Z\�\�`<p7��\�w\�}��ƚ]\�U&�t�\�\�}�\�@\�8�\�?','2019-02-07 06:51:01'),(_binary 'my_wiki:pcache:idhash:15-0!canonical',_binary '�Wmo\�6\�g�\nV@�\r�SI~I\"\r\n\'i\\$�;\�ǁ���\� R����~\�~\�~\�\�H)�d\�)0\��x\��y\�\�k;�9��`\�,�i.Mw\�߅;t\�hɶ\��{fٮi���\�#Ɣ�\�\�$\��$ci�IcL�5�\�s�c\��c��\�в�\�F\�6\�\�\�%磁e���F\�\'~KK�<\�P0c<P1H.\�\n\"Y��e��-\�=�\��r\��	�dd\���Q�N\��\�m�O\�u\�b�Ѧ��wN���\�\0\0�\�c?\��M�0���uqf�LK�!\�\"4[\� \��\�5����\'1	X*\�\�8���m\�`u\�H���<\�/ѫ�\�x��\�x\nw\�\�Y=������\�t�\Z\\�N����[c�A:\0PE\�\'�������\�$\'>\rCq\"��\Z�\\\��a��IO&��\�\0͞\�0�b	\�W\�x\�rM�َD�?^�3wS�\��`M\�ڵ�=\�O\�$\�p0A ���4JtSƌ\��C\�< ÁA�xd�=\0J\�\�x�ny�,L�����؀\�\�������ap�L���B�p�R%Ιk^��\�+dfƤ@`\�4J\�2\�\Z\'�8E)�\�Ne}T,g�Q�\�簈�/\���,E\�T\��j+YӰ��PA��0��S4�G\��=7<`-&4M>GX���\�0\ZL�6����]\�!kf�W>\�XVm��M\�\�\�\��E������ҬYM\�\�n��\n�\�hÕ5V\\\�b̳$e���Q,g\�\�\�-^3`5�W�T-)Xg�ZŰW1}\�l�0)K\�\0[\�U[�;$\"\�Γ���\�9}\�����Dp\�|�J\�TҽgK\�[\���������\r�R#A���\����N�b\�\�^�#�~��_�{�#�C��\�Ưni^����\�\�w�����\�Cu-\�?�\�\�$�6��8� e�,G\�\�\�h�\�%�Nߺ{�6\�R�5I�ꨎ\�#\�z���Ov��A��N�\�ʽ5\�f�(aT?A_S\\ӛ55�\�S]�I�����-BqW�[<M��\'&�\�,�2Z�\��w�\�ˢ��zj��+�T\r\�\�;�yt���\nF�mh�3\�\�u,n\�`�0B�h\�1�\�X�c\�9�LUp\�G\��\�q�,�:A\�q\�\�n�Y[��OmBz�W�1\�Z��?U�\n�1F��P�\��P\�2�CCEk�\�\��\�|���π\�u\\Ϋ\�V�z\�>�X��|j��޳\�$0��ת\�oMa\�_�\�8�0YEQ?�!z\�\�m/\�� \'��\�\�����x\��[dz�;�^{\�+\�:��Z\�\�W�\���\�\�\�\�\�\�����b-�N\�\�֜ү<rZT_�\�Of,\0\�f\���','2019-02-07 06:50:05'),(_binary 'my_wiki:pcache:idhash:16-0!canonical',_binary '�W\�N\�H\�\�<\�\�R�]�!�\�$\����%��\'\Z\�!�\�7\�LB\�\nia�q�d\���\�8\�j�A�3g\�ܿ󍧾\��֌\n\�\�t����|\��H\�[\�[)+��\�L��u�%	*\��L1a\�\��,\�,/y\�r\"Exh\�J�`\�\�{�\�\�� e���?=�����gxJ\�L&�\��\�Z�l~#Y(��7����\�\��Lg���\�\Z{�Eb\�\�:��c�\"\�:a�VJW}�\�\'�m�	.��#\�* ���W��y�D�@l%�`w�\ZO�\�^�O<a�K!��\��\�`���n\�o�w�\�\'�s�0����\\��\\�\�1\rc\�S\�\�v\�ٮ=�\�#\��2\�Vk�\�C\�އuFS\�A��\�&���g\�ZYH��O 4\�#\�h�E�w�h�%o\�3�E\�!�2d\�%W\�Q�G�,І\�ҟ\�\�9˘�\�\�\�\�\�\\����YDx&\�&�w�`\�\�\�&\�\�%�k\�dE��E\n�\�\�w\�ä\"Z��ē����\���*�.)4\�\�\�\"�<�s6:׻Τ��\Z�QW�\�6Ң\�~\�Ψθ\�\�\�\����jmO\�餗�&��y�ʷ!M�V�p\�?P�7>�`�qH_\�&\�@\�=�t\�0�Uh�\��br\�\�$]\�`\���^�yS�θo�)��	�.IEӢ\�nZ(\�\��{\�\��\���:�\�|�sƳ{iԷ��8�@v�\�s�Y[p�E`Z\�.�q�q��\���\�7E8�i	\'\\�͖-}\�$��\�\�\�O��d�>葇k\�\�!��Ҙ�\��x\�#�/a��\�WTQ_�{H!\�Jg=��WaQ\�\��G\�+��\�sǛ\��D\�\�\��\'o\����\�\�he���0W�M\�\�\Z\���;��j0�.��\��v`Μ�\�a\�\��?���X7VO�N��k�1o_�h�4\�\�mV/C���ˆO2$��\�<γ;>�JE��%��\�y=�w �FE\�i���\�ɘ��`B5Z����\\}9ò@�V�\�_����:�II\�X��\�&l:�>�R\�Bc��_^!J\�j�\'<\\\�\����\�C�,j7\"ĥ\�Ez�c\n\�\�\�u��\�c�\�\��*�g��3��=���%�r��\�r��C\�n�\Z�G3>�vs\��Mk\�\�2٨\�+\nCAH*Ҡ�C\��淜�U�\�\�V\�>\�m�[\�a\�\��U�К�\�\�KZ�\�TRM��\�~FG;\r\�\�ԙ���\�:Xr`\�}��:\�;&����EI��m\�O~\�s^���\�jukل\�\0�\�\�\�f�\�j�т��<IZZ!`MSߓ���̬kQ	\�}}\�\n\�\�j��\�9�\�ܽJ8��\�\�\�\�\n>�p&\�סjQ\�@��<X\'`��%M��2�]۵�\0pƨ�4M\�n��\�\�Td�\�A\0�~<?�\�\�	�\�\�R\�u�\�\� z\�\r*\�. �C`H�L\���m�G@R��?\�VT�2�Ѕ&��\�v`Ȍ��\�ec	{��\���\�=ĳ�\�m���\�:\�\�\r��㲀�>����-O#+8:\��M\����߻kWG�!}\�W�~^�\�Wtۡ\�]��h�&?\��8+��\��O���\\ש��\�z��\��ugo�\�mn���j\�5Ҍ5�\�W�<7\�/W/\�\0m3�','2019-02-07 06:52:23'),(_binary 'my_wiki:pcache:idhash:17-0!canonical',_binary '�W\�j\�H\�o=\�TP؅8�\�[\"-\�I\Z�\�6q\��\\&\�Ğ�nhF������ϸO�\�\�H�$KNa\r3\�̹~\�9\�k;����`\�<�i.Mw\�߅;t\�\�m�\�	wlٮi���\�#ƌ�,$\��$ci�IcB�5�\�s�c\�\�c��\�б\�ZF\�6\�\�\�%g��e��F\�\'~KK�<\�P0c�xP6H.\�\n,Y��e�@-\��\��b\��	�dd\��Q��\�\�\��h[\�SW]��e��\�\�!���H�\�\�\�&�_�G\�:\�C�<\�$\�=�\�l���2\�л\�5�(��\'1	X*ר8��\�m\�\�t\�H�\�B��ؗ�U\�\�x��\�x\n=��n\�\�K\�Z�e8C�\\N���\�q�A8����N]����\�$\'>\rCq\"�t5 h\��a��IO&��ʁFϒnV�L\�W\�x\�rM�َD�?^�3wSu\��`M\�ڵ\�=\�O\�$\�\��`\"��4JpSa�!p�\�\� \�Ql\0\�74^借?ӣ�\�~�2\0x4�dVI\�YS0�p-��*�� \\��dI\�W<d\�\��\n��1)H\"אi�b\�i�Pw��4BP��Vϝ\��4�H\�Z\�T�\�\��X2��\�v[�c.��e1\r�U� \�.�Uȿd\n���\�Z^q\��E�	͒\�\0�\�j�׌S�O\�>\�}�yȚ\�\�ӥx�UY/���5}�$~⫯4kVSO�\�$�&x�o4��w�\�\"�f1Y��L\�\��Y\�\�\'\���7\�f\�\��^�R`�\�b�\�\�^\��1d��ô,�hyW�\�\��l�HB\�\�*~�ց\�\'�\��\�\",\�/��{\��78�\�\�H(u!#\�\Z6\�K\�=/z>�C\�\0E�l�\�Xu��H�ި���\�h\�a���]šH�k\�W\�6�H�~�u\�\�w\�����0L�$-�\0\�\�\� �y��8u#\�\�,w\�\�\�h�\�u6��\�z{�3\\Ի�\�)j�t\�Q�\�-\�z���=;�ޠ�^g�\�J\�\Z>@J\�\�O0\�\��e\r\�\�\�\�T�Wj�\�\r�I\�a\�S\�UOC�&\�\�ɡ�śFS�h7y�,K��7򿒸J\�FL�&A]\��\�Z	�\�64̙\�\�:�7\��Gh��4uN�\r��1\��J\�����,K+��[Єru��Do\�\�+�S�\�\��+X��_��}�OB���\�\� Ε�ȅ!\���H\�\�P1\�\Z$�G�t&�����3\��.�\�UH�K�oh,SxG���wl3\rLo浲�[FSX�|3	)lVQ\�O\����Ӷ�\�S�\�1n\��S@Sty���^\�NgW^�Jy��\�\�z���\�~�u�tt:x}a��Z�\�$\�kN�W��\�קw\�\�\0�{?�','2019-02-07 06:52:07'),(_binary 'my_wiki:pcache:idhash:18-0!canonical',_binary '�W\�n\�6\�o?+��Զ$ˎ#%\n�iR���K��`$\�\�Dʗ�{\�=\�Ρ([�\�\�\� �\�C��w>\�Ƶlט\�L�\�&�i.\rױ\�\��Ft\�\�\���kY\�\�5N�$~H�85|K�gյY�P\'1�\�%XBD\�\Z)S�߷\��ئُX�\�?�\�S\�\�\r\�\�\��3\���\���\������D\�fI�^�:Y�@.N��c\Zd��|!O����	٩\�uW\�q�e�o<�\�\�rE�AE��H)%�\� ~\�,	!$���E\�f�6�8`\�^�H�\�<d\�H\���\'}zv\�Wه�P��\�9y\�\�\�5[M�$\��$ci�\�΄�\�#\�۴�M\��G�9t\na\�g��!_f\��&��U��\\2��`�\��A\� ���\"2\"lD\�\�pO<ڊ�\�K��L�$#K.��\�$``%G$I}\�[\�,fmnvv�!���/�\�\�\�M�\�\�A\�6����M7��\�=�\�t�\��\";�\���	I�R���,U\�\�w\�·u\�`u\�H�@Efy\�Kܥ�3ѹ\�C,d\�S���gU%hm+Mk\�\��\�;\�m\�>w @�m\�JzQj�ۛ��x\�\�0o����\�xC\��&Q�te\"i�\�sG��X�\�\�Xq� OlC�\�7\�W7U\�.T,\\k\�5_�\�\�A���Q\�h7%\�\�\��;ͫ\��@���<���\��0<\�\�g�O �@0�$\�)��0-��*0q�q�\���\��(L�s\�JFh�aP\���ە�ˠ\"9BG\�p\�5\'�mk����\�\�=NE�;F3q�b\'��\�1Y\�t�\�&|48�¢XP�8�l\r\"{-�Њ�\�0�v�]�M+\�Q@\�\��u->��b\Z6S3T)6C[�`\�1�	\�{tMO����\�\"\�L_\'�gY���^0\Z\\BW�c�>\'A֊\�lW\�|���\�;�GS�IL�x\�\�_h\�,sA�IR\r�_iCM\Z�:�f2�Y��Lֺ����\\\��²@���mY\r���\�GYcqb�����\�2e6��*ѿB`��4	���\��{\��8oY\�\�?�K.�\�\'\�Q=k��\�c��i��J���\�\�2ӭ�V\�^�LY`K\�V1ʺ>l\�}\rͣ\��m��m}\�\�72t6��\�T��\�\�\�8��-\�nb�����\�;�\��\�y��Ő\�U$���tDS�Rbו����_\�\�LÖ6���)\"p��Wҝb�V�\�ᰮ!/8��oy\�:紟;\�R��M\�\0*\\\'f0buWs�l͗y\�P\nk�\�v\n�S��g]\�qܫ��W�VM��Ρ���U�Y��0x>ݕ�Q,�3��\nU!h\�\0���C\���Z��-i����\�weר�\Z��V\�\�u8�u`\�_N]�\�PT\�����LK+�^NK(��A��\ZT\�Ym@�Y�&�0�|�.���I�\���cPR\�\���.\��v\0Cz�5@\�K\�3V|���OϖB��\�<�U�\�Tc\�]\nW|h-(\�-[^�w����kFS�\n�\�\�	�OW.�C�\��\�nR���tۢ\�3]�h�&?�W7\�\�\�\�sO\�\\�T~]`=�\�\�{�ƺ\���\��C�޷]#wc\�.��&�u��\�[}�\�@ی�\�\0','2019-02-07 07:00:54'),(_binary 'my_wiki:pcache:idhash:19-0!canonical',_binary '�W\�j\�H\�o=\�TP؅8�\�KbiY(NҸ$����\�2�&�ltC3r\�-�}�}\�}�=gF�%Yr\nk0�9�3\�w\�x\�ڎk.h&X6\�e�K\�8\�w\�]3�g[iz\�=�l\�4~{\�\�c\�^�K��4ɤ1���D�ı\�\�X#k4\�l-#l��l\��\�����]L#\�?�%��K�h(�1Y<($t��S˲�`�\�\���x�d�τH2�\�K\�(NQr�a}�-����X\�2\�Tv�ʉ����@\��\�sP�/\�\�c�\�\�Cw�	\�Ei�\�Vy�u\�]�՚	I�S���,�kTX\�\�6ep�a$U\�B��ؗ�U�\�x��\�x\nw\�\�Y݉�����\�t���\"�^\�wu�\�}\�@�\�\�>9\�t}\�\�\'�8�i�Y�����e| ��Q��d\"i�h�,\�a\�\�|��.\�\�\�H��\�?s7U\�.\�T�]{ܳ\��4Nb�	�)	I��7%\�\�?$\�2\�#�\�@��ƫ�s\�\�gazԵ\�\�?@\0�&P\�*\�8k\n�q\0�e�U�ː�,q\�\\�\�}<^?2�\�S�E\�4J�2\�\Z�����\�s�r>\r*�3\�(�\Z�\�\�p����f�z�\"`�r��r+YӰ��P�2l~[c��K�0hz��\�6\�<`-\",h�|��lW;�f4�l*�1\�\�$\�C\�\�V�.}���\��{�\�\�\�P�EL�����Ҭ\�M=ஓ�Z\�\�hÕ5N���\�XdI\�2YC	Vq?�\\\�\�\�\�5C���\n��%\�U�\��2��!�\��e\�@˻\�h~�@d\�ErW�ӷ?�8\�Xp\0\��@a��~A%\�k�x����&A�����_j%\�1\��A\�\�\�\0(jR+�Xu��H�ި���\�D\����šI�k\�W�4�(�n�:\�\�C�~�a3T\�b�\�mM��ʉSwR\�r5���f^G����\�]�\��P��r��M\�\�GzX��\�}\�\�\�h�A�]g�\�ʽ5b2�����`�)�ic\r\�\�;\�T�Wj�\��I\�a\�D�+\�w���U\�\�\�p�\�SFS���n�|Y��QO-\��pU����L�<�ȃ��F�mh�3\�\�},n\�	`�\�C+i\�>�n\��c\�9�L�p\�G\��\�~�-�:\�A\�q�q7�\�\�W\�6\"�U�W,�27��c�OB���\�\�$\�\��[\�\�\�|B�up�c\r�\�}:؀\�R�\�y]���\�*�ե޷4�)<�Zp�wl3\rLo浲�[FSX�|3	)lVQ�O\���􋶗\�?Q��\�1n\��S@Sy���^\�NgW^�Jy��\�\�z���7~�u�tt:x}a��X�\�$\�kN�W��\�קwœ\0�{?�','2019-02-07 06:53:41'),(_binary 'my_wiki:pcache:idhash:2-0!canonical',_binary '�Wmo\�8\�g�\n\���\r�W\�yYkzY�fh��I��vPm5\�\�o�䴹u������K��\�\�v�n�`�ɇ\�C\�S\�q=sF�db��,W�\�w�\�\�xf�`�\���\�؃�g�\�чӈH\�/�\�ibTK1\�IF�\�z�B&�3\�:=\r\�X��M�LZ���\Z+5E��i�\ri�\�\�NeŢL�\�+f!���k�\�#�k�:^l��d�gY*\�S����\�����`\�.��ٙ8c�p��\��\�|\��9??�]\�\�\�\�\�o\�\�w�g�\�7g�\�\�݆q�Ҳ�1a��x\��3F4X��(3���sb���>v��\�BF\�c\�\�\�#\�þm7	�y@�4Q�`�\�\�H2c4�\�6H.!u�\�ٶC$�P\Z׌F{bw+�A,\"\r����5�\\ADI\Z2�\�ȱ����d	�D���;\�T���\0�1�Qj�����\�{g\��ۍb\�X�8���b�ǀ\�\�_��TD�pF$d�Za�}\�8\���\�t哻<	�$�\�lθI\��yg\�n�m�Y#�*�A�ǲ>\�5P\�\0jk�\�tҋ�&�_��\�ۀF�|�J�o�\��>\�D�b�T\�H;(�gN\��XAtu<p�\"�lC\�\�H/\�\�WT�<ײ_4I~	\�����q֪6-�\�\�!\Z�\�6ч�q	TΡz.yr/M�z���\���\0\�2��\�$\�*u�����m\�\�{ϼB�Cs�[*P0D�-zw����[[�5\�{�#�\�\�\�ǰ��GlΨVS\�\�\�rD|���HhԎ`���ޕ\���\�3�[\��\�=\0�C��&\�g�&6�\�F\�1�J\�>\�}��y\�\�\��sݜ\�\�N�6\�m(�\"GirǗ_�hg��\�>k�|�\"\�ɲ�Z\�j\'c&Ҍ	ը\rD���.W�x̀\����Q\�gUx\�2իh�<���No\�U\�\\�����ˏ=\�҈������x`Oc\�^!�\�{�X�\���;\���\�\�5�+]@3؁|\�1P�+\0u���A�\�\�Ϯ\�T{�\Zi\�f����eeǾ���\�\�$\�9տhc~	��{\�\�������z��\�7��Y�|l�\r#U ek\�Fܦ��AV\�\�Wl�Ӱmú�w��_ \�\�m,\�H5>��\�t\�94-\�\���=\�\�\���\��\�\�έ\�*H	\������bsQ�\�\�S^\�\�3�S*Z[�➾��Ei5\�8%9^�\�KA\����\�˼����\"�k�5T\�\�0	\�8D\�I���Q\�L�|����M8C�\�I����a��\�\�4d�\�I\0g�y~\����@ϧ� �\�\�͇I�|%�p>u\�g�r�u�\���5r�\��I�r\0\�\�m�0�m�g\�\��|\�J;�����H��5\�`\��I�{�����\�SD\�C�\�\�i\�3�2Ci��^��84��\�\�\�o�f0�?��(�0Ye��C�`�X+-�M!&\�@���g!\�\�\��2�\�O>�\�-\�>�\'\�\�L\�\�K�;\�\��\����Z��\�@[s+�\�\�\�~�z]ޓ1\��?�','2019-02-06 08:26:58'),(_binary 'my_wiki:pcache:idhash:20-0!canonical',_binary '�W\�n\�6\�o?+��Զ$\�N,%\n�YR���K��`$\�\�[Eʱ[\�#\��$;��lI��\�0Id��ܿ�Q7�e�Ɣ\�\�7�\�\ni��\�~\�\�5\�{���\'\\\�\Z�\�I�ď���\�\�r㬾6�R*�4a��\�K�\��S#�2s�}\�\�\�m����>�\'�y\�Z��\�3�<�s&�\��\�\�	b�p!s�\�?���i�y�\�\�řc�g\��\�9�AB\�\�<5#�\"\�*b�FL�]%\�\�4_yJ�jEo��l\�j��W��i\"�4�\�  J\�~5�$`\�^f�s1�p@g��\�>=;髒����\�霼\�vI\�=O�$\�1�$gY�\�΄�!�\�1s�mZc\�6G\�i[N�G\�2\��\�%ǐ=��v�И�*g\�\Z.�\�H�\�d��t�B@]]��\�ѹe4\�\����\�K��L�4\'.���4``�@\�J}��s�������p*\�?�\r\�$ <�\����ms|d\rm�Lt\�Y�E��\�|^\�\��h&$QJO�L�^\�1;\��\�#�B\Z��/QJ;g�s���A\r�\"�+Ak\�ݬ\�~\�ΰN�\�힩\�v\�spT\�6Ω���&��z�\�>�\"�Z\�p\�?P�W>�`��HW��F\�@\�=wt�0�Uh�\�g.C�\�V$^}ƶu3�\�� �\"tm�k��)�	�.	I\�\�nj3gXp�ddu�W�Ɂ)uE�y�sœ\'ax\�5\�o\�qh�\����9g\�\�$\0\�2\�\�&\�<.#�|0\'\nM\�фk#4\�2�\�\�\�\�\�\��eP\�9BԬ\�5�=v�\�\�\�\�\�c8���c4�Û[\�QW\�x\���\�d=�\�WaQ�\�\�\�dm\�?X�_\�2�㯫\�Wv줏li\r�VOtax߿뚼[=$4j\'j�R{\��\n�\�)lޣkz�\��[��\��\�]��\Z���\�\�5���iPD�9\�\�;\�%\�{�\�rJ{뽘�Ɍ\�?Ҽ]��K/Ҵ \�%�D�j\�Z\�q��1\�ӌ\�ѽ\��\�\�\��\��b5�u\�j\�(�5�L�\�I\�c\�nn.��\�\�\�/귀����W5;sK���s�\�6��dXď8�Ўj]�x\�<���Jo���8wX�B��US���(���}�#�냸\�khE:�l�M�g蛖�Jf�.�e�}�O�F�\�!�o9~���ׄ�}\�\�>?�\�ü/����2�5%�#������\Z\�����v\Z\���Xig\Z�2g\�`I\�)\�\�i\�\�965%�u�-o�V\�\�\���;�խe:�\n׊LZ\�\�\\�[�0?\ZJ!`M�\�F\�^x\�z\�5�\����cyek5��\�9�S_�J8\��\�\���\n>�p&\�W�*I\�A��<\�N�(��\nV���\�\ZM\0X#԰4M\�~��C�i*2[�\� �Z\0\�O\���\�\�ᴔ��mux?���A���H?��Ӥ�L��\�����#�4)\��u*��1�Ѕ&��\��`H���\�=c2`ŧ?���)t��\�#Z\'z�A�$\�2�\�CkAYo\�\�20�ko\'z?\�4���[��\�\�v\�ڈ1\�\�\���\�M\�w��nwh�@�o��\�w\�\�����\\\�v\�:�_�X�?2�>��n�F=g}\�P���{��z�ٕ\\e�Zg�\\�\�\�{L\0wG\���','2019-02-07 07:02:14'),(_binary 'my_wiki:pcache:idhash:21-0!canonical',_binary '�W\�j\�F\�\�z�Y�BqV�/I�RN\�xIl;�?\�D�\�\�\�f\�\�]\n}�>c��\�\�H�$K\�B\r	f\�e\�\��\�\�\\\�q\�9\�\�f�Lsi�\��.ܡkFK���\'\�3\�vM㗏�1�\�u>\'!��$K�L\Zc\�Y@$��K˾�kd������My�s\��h`Y\�\�.����Ē\�\�%\�4\�\����O֩e\�D0P���hxD<�X�\�gB$\�p�%D\'�[r�\��l[\�SW]��e��\�\�!���H�\�\�\�&���gǺ8��y\�I&�%�\�|���2\�л\�5�(��\'1	X*ר8��\�m\�\�t\�H�\�B��ؗ�U\�\�x��\�x\n=��\�\�\�K\�Z�e8C�\\N���ꭱ\� HPy\����[M~�t����8�E�?4\��~���ؤ\'ICu�FςnV�L\�W\�x\�rM^؎D�\�_�wSu\��`M\�\�u\��ѧqs��`\"��4JpSa�!p��c�Ql\0\�w4^借;�ӣ�\�~�d\0�hɬ����`p�L���B�p��%}�\�C\�^�96 ^?2�\�s�E\�4J�9\�@\Z(wEE�\�N\�|T$gX�T�\�\�cX0��\�Y���ʱ\�[ɲ��\��*S�a\�\�\�_0E\�{r-���\�kaB\�\�7�\n\�v�\�[F�	��\�\�O�<d\�h�\�\�4˪���\�]\�E_\�8���\�+͚\�\�s\�6I�	^�\�\�bhY\�ȫY�y��,�5�`\�\��vy�m�\\M\�\r)bK$ց�N\�\�uL�B6�=Nʒ9��\�	��ȶ�$\���rO\�:P��q̱\�\0\���.\�B��J�\�l�z�\��A\r�R2��aC�\�f\�Ӣ\�:\��P\��\�\�UW{��\�\�ziZv\�*\�T���l�ӓ\�+R�[�\��C{\�о\�o\�\�(\�s�\�8M[�(��r\�ԝ�3�\�?\�Y��ɬ~��@g080ԛ�\�(j�t\�Q]=�{\��Z\�u\�\�h�A�]g�\�J\�\Zw2�����a�)�ic\r\�\�\�T�Wj�\��K\�a\�D�+\�狧�U\�\�\�\�\�\�E��[���<_%}ԋ�_I\\�j�\0&}� �.�`b��Qj\Z\�\��t˂�u\�#�\�J���\�\��q�S%��y~\����@\�=hB9�2\�&ѻ����\�F��r��\�B�\�r\�\���P\��\�}�1�\��=rau>!\�:8T���\�	��1l��?�����\�\�}u\�\�R\�\�\Z�^\�\0-h\�\�Lӛz�\���\�\��ߌC\n�U�\�9D�=��\�%��\�dẃ{��h�W^�_G���\�W�R�k{��}e\�_p\�>�\�^\�ֲ�c\�)�\�+�E��\�C�r\�pw��','2019-02-07 07:02:05'),(_binary 'my_wiki:pcache:idhash:3-0!canonical',_binary '�W\�n\�H\�o?\�\�R�])\�\\��\�dC��K���\���o�ب\�>\�>\�>ɞ3��6�V[$��9�\�w\��ֵלQ!��MU�*\�\�:\�t{�>��2\�=;;q\�a\Z��\r)Y��\�l�\�\�����\�S\�>\�8\�V�G>[\'����	:\�D�Dq��\�ve�y�\�h\�t\����M�\��<��_�R\�\�\�X�r��-�lqT��\�5lC�c��\�\"Ɣ�\�f$\�!WD�$\�So�|\0�K\�>��o��\�i�G\�*\�b\�\�~ײ�O눆\�#^))�<\�@2c<{\�$�tHֱe9D2�q\�hp`{��\�cRƂ,�\�\n,�b���u\�m\�ҟ�\�E���pw+K�\�\���4�	�� 1\��Bڎuvb��VL\Z,L�\"T\�\�<\�#w\�\�&Ѡ�\��Y�hc\�2.V	�\�%#��_�F�B�\�8�3#�O ^*\� �m��T\�/\�\�e\�\�\�Z#�[\�A�9\�F\�\Z�������\�(�G\ry�rw7�H\�|���ؤ�bE� ��{�d\�\�5OW\�+W�\�\�$\\\�\�u�\�rA\�\������∃^�~�ER\�0�U�\�\�vs��-��vd�\�\�_\�h�B�\\�\�E�\�Z\�\�wسao�\�c�Y}c��ZŢ�aa#A\n\��\���GBO1a�\�G��2\�}\�lEآ*�qXr,|踚�\�g�[����w\����-y6\�6:���_\�9A�B�CY�/y�\�\�\�6A\�����b\"�A=~=&\�\��5\�\�=�<A�3W\�g\r[\�\�4�ʌ�ue��Q�W\�G�ob?\rX\�\�l�\�&��^g��\�\�c��Y�\�\�ϿPQ�f6L�\�\� d&�JEģym5�����&T�\�Ћ�\��\�\�\�5f|5�2\�˽(�M\��{���^E؋�>\���qR�́�{W�ﰘ\�j\�[��t��s[$�K�`벅I�>)=r>*�\��s�����\�\'�\�\�\�u\�8Q\�t�)d�U\��\�\�&kA-\�! h5T���9VU\���Q�_�K�|Z`�\�^:K98��vY�X=� �绻\�;�\�y\�\�Ys\�G�\�\nHaH>B4�S)\Zq1v~��M�\�S�1\�̃\�\��l\\cJO�F�v\�^!\�fUkW�\�n}�\�|n���R\�j:�2��p\rx��Wj\�Yi�g�\�\�)�\�\�Q=�̼\�U�(�⮾\r�Ҫl\�4\�\����q:O�~�|�/\�\�\�J�kW5�a\�aر�<\�X#a�ؒ)3u���׬�\�#B#i�\���CĩY5�2	 \�\��\�8�FKF(\�ч��\�9��+7\�G>�\�\�@�\�GK\�BݿH�|2�\�\�,�Ig\Z�G\�B�|\�J\�á��\�H\�K�\�h|��z/\�\�f�\�Ϋˀ��}\�ޑ�O\�j�i�c\�	\�\�頑�_M\�>��/\���[��x}|me�\�V��\�\�醮\�}��\��\�e|w2�\�ח\��<�f\\\�V)�\�*$\�>\�w7W����w�=m\�)\�\n�\�<�\�\�]~\�\0p�\��','2019-02-07 07:02:08'),(_binary 'my_wiki:pcache:idhash:4-0!canonical',_binary '�Z\�n\�F\�o?\�T@w[��(J�\�1�\�I\�nb�����9\'\"99�����I�;3Ë.N��k �̙9��o�܌����\�\�oJ���3�\�\�\�x4\�$w\�^wN�\�ǳ\�i䟝OY�x\�I��\�a,S\�a2|ڹY�|!ŲsV}:\�с�\�\�\�fg\�D\�\��U�Y���E�8\�\�T���,X\�3�2��:b\�2�Y(�9i@��J�\�.��\�\"\�ӑ`!לZ\�\"d*5��i�j���E�i�=c\�8gZ�\�R\�X\��؉�ղ�w\�\�\�`\�)g���vR5U1:�\��\�S�i.\�z��\�\�N�uV�{�\�rم�\�Xܝ\�=��.\�2��n���s����=~f\�\��z�o�.�Ι�g3��.�\�<\�\�\�&\�w,��d����\\p�=*.qڛ�1��t,�\�\�6FL�*�HX��r\�T�Li�\�Ka.FF;�6\\�D��/\�\\6��݁\��z2\r\�}7��\���*B���Y:�\� >��S�\���\�N����E|E�(za/<\�m�Y\�PGO;�\�\�X\�Y���\�zguZ\����\\e�\�˹��.\�}�Y��\�ka�g*A�y3�\�HŢ�`ur\�m�\'���\�\�\�4\0�uZ\�\�F]v]&�ӑ��j�\�ح1�0n� �t�\�a�\�H)vǂ/`���2�\�E�\�8d�Rst\�\\�m\�@\�ߔ{�����-��\'xoKM��\�\���\�Vz2�Re\�x�\0\�\nM\�E�2غTyX�\�\�~S%�\�LK��\�)TB9\�\�ɴ,J�b��\�_�\�\�\�|[�x��-5u��V\�x�\�\�\�\�#\�\�U�\�\�\0\Z���(�S!BԳ$X	Q�h\�j3�\�ْ���á2\�0d��̓#*C|�8�ךs�w\�+�������\�L��@\�A��d͉W\n�4[[&3�T�)UC$fY0�\���Nܓ.;��V\�_bU�_DJ��2�\�~�ief�`\�PA�^��9\�W�q\�c\�EP���P��\",�\��>W&��]6��\�\�\r\�l��}���\�j�\�E��b\���wlR\��\n�hvem0�ٜ}c5\\��W�7\���I���ɚ�<��\�κ\�\�\�\�l���\�ӟ\�@�\�ou\�LhH\�`\"�E�QP�\�\�\�\�\�EEBz��,\\/\�S��\�\�.|\���Bl�ˮtU��$�]K\�Fy\�\�&\Z\�\"�\Zhd\�\�\�Pv���\0�P��</����8\�%\�+\n��k�\"`S*�B�\�[�`G��P��2��$.\�4�yi*�4\���\�\Z`>��iC.L��r�\�O܀���\\|,i\�K\�**�۵ldҾk�z�_M7p\�\��\�͟\�W��2�2i\n-V��3\Z#\��\n\�q\�\�9�6\�ǰc�j��\�f�Z\�*i��\�H\�Lg��I�\�l�A-\Z�HC\n(\n8RK��Ad\�(YK�k�FR��T�(U\�L\�vD</\Z�1�ߓ1��6�v�Ht۝4l�u�����\�;�\�o\�4��̗�j����\�TOg6�u�V�\r��5\������f^��D�\�]73�]$\�\�ɂp�\�$\��%�\�N�� ��\�\�ּ\�\��\�K�h���c�R��p���%��36Q���qwI\�E�\�&�!F\�\�/\�Qh!�A,\�g\�Y�\�2�\�\0:��\�w������\�\�M>ooA*�X �-S�2�m\�8٤\"bͰ��!\�\�u�\"^�Rz@Ѯ�͂�&٠�ij2F\Z	L8\�%�K�1*\�jj\�\�C�֬j+T��̥j\���e$\�V!�c\�\�9αh-\�\�*�H�\�\�DL��,����.\�\�\�^mx���r\\&\Z�\��)3�\�\�Kl7u[7���\r)\�\�vM�\03u{��.�1�\�\�\�)�tNr\�gm\�JDZ\�T�.�\�{�X�8�6�\���\'�-5�?\r��\�o�\�a}o���\rb�c\�\0]�p�\�Z�Z���7x\�\'\�6��U�\�	=\�AN-�0l\�r�V��\�L\�\��Q�J+%�\�7P�j\���	\�7\�	vj\�l��i�nU\�.o\n}p���\���k�I\"i��\�� ��\�L3\�\�?�|\�\�y�?�k`B�\�WcvB\�\�]�R�\�\0�j ɘMy\\���\�o\�\\,dv̼�78Ƭ¶�\�{#@�6��\�zaXA�-d!���������\�\�{\�g}\�f\�\�\�\�f3.\����\�\07\�\�\�f\0�\'��\�{O��#�MV\�\r{w��\� y>C� ϻ�]��f�����\�ơ���S����\��25�\\\�q{o	�e���-!��^\�\�̯\�Y\�96�{w��p\�Hk�3A��f?���\�~�\�\�\�\�ݟ�`O\��~`��3?}v�q�Q`�\��iƈs-0\�a*�z-Y�N>\�\��1U������R\��\�E	�h�׫\�,R\��e�\�=F\�\�d8\�$/��%\�\�L\�E焏��\�?�\�\�\�9|��sgc\�\n$\r�?��<z�)u,�w�OƝ�-\�nC�9\�\�\�~_���#Ro���\r\�j4\�l�i:�\��\�\���\�\�\�a�D�\�\0B�[�� r\�o�l���7\�\n}�)\�;�\�)7��Q\�s9�4��\�t�~���|:����c\�.��o0\�{;�eE�Z~\\\�O�YO\�|)�?\�:\Zr��h�C\�\�Q�\�h�˿و����<�\��\��R\�| b/��\�p��\��a�\r�v\�;�\� ˎ���=\�/�\�\�8��GG�(���\���k�\�\�ZWk\�\�CQ~\�+\�bF�c �ZyW�a�\�\n�h��\�\�s�\\b�\�X���V�\0qD�Z{z�a|E/�T��Ԗ�Zw\r맷@Q�\�͚^���_�s�N\�\�\�7�\�~\�qI��Y$\�yN����\�/�t0�,\�����\�Z1Xu\\�$\�\�~�2\�ڥ\���s���\�\"Mj^ͺ\�� \�p1��h9�\"\�	�ڑ�1��\�B\0���<��ʷt�A\��i��l�a\�a��w\�\�(����7�����]\��N\�הV\�9۬\�=`����Ml��\�\��\�ݫ�-\�nD�Q�7,.\Z�\�S��\�ܼ���a\�w\�/���A(\�_+\�\�W-=ok㳀\�[�\�`�#D��\�\�;�l4�]\�ƙX,�$VZr^\�D`�\r/���1��\�۷C\�	e��\�\�\�94��>�\���% h}\�p\�qqj\�\�2G?�PV�S�Sɹ?�U.���\���\����`\�<�e{��\�P��T�8Nj��\�B*fW�\�\�\�\�C\�\r-\����`�u\��ߊ�\ZڻS}\�\�p�.��\��`[sc�97\�}\�AwG��m\�De�tq��\�X�*MQi~� �\�\�\r\�m>и�\�v\�\�\\;�\r��K։-��e��\�t�.\�\�.�7ϯ�U��&�h9n\\5|T��N�59��a̶�	�\Z�&��� �|�i\�e�A��R\��6��\0��B�<Z�eg}9,��|\�~���l�k*�?�\Z\�k>�8~����|�\�\\��/6����w\�\���7��\�OTi�����&z��7�\�}�\�%�y7\\�\�Ջ��9#Q���\����b��X\\��<\�\�\��9\�@.\�\�^���ԓ\���^���;ո\�!\���T>7\�p:\'\��\��ŉ#�o\�C�\��z�La(�Ip�{\�\�|ļ�\�u�i`ͯ�U*�]�\�\�7\�O��?','2019-02-07 05:00:24'),(_binary 'my_wiki:pcache:idhash:5-0!canonical',_binary '�W\�j\�H\�o=\�TP؅8�\�KiY(NҸ$����\�2�&�ltC3r\�-�}�}\�}�=gF�%Yr\nk0�9�3\�w\�x\�ڎk\�i&X6\�e�K\�8\�w\�]3Z��4=\�Y�k\Z��\���1e/�9	y\�%\�X�d\�S\�\"y\�\\\�X��\�X#��l-#l��l\��\����\�]L#\�?�%��K�h(�1�?($t��S˲�`�\�\���x�d�τH2�\�K\�(NQr�a}�-����X\�2\�Tv�ʉ����@\��\�sP�/\�\�c]�\�C�<\�$ƒEi�\�Vy�u\�\��՚	I�S���,�kTX\�\�6ep�a$U\�B��ؗ�U�\�x��\�x\nw\�\�Y݉�����\�t���\"�^\�wu�\�2�t�@\�m��j��j�ˇ�H��4ŉ,\��Հ|\�2>�\����Mz2�4T4ztð�ei�B\��k�\�v$\������s�k*\�\�g��i�\�\��3�FimJ�1�~țĶ�\�\��\0}K\�U�\��0=\�Z\�� �A6�ZVI\�YS0�-��*��\\��$�\'\�<d\�W\0��\�RI\�\�4^�l��!����\�s�r>	*�3L%�\�\�\�p�Q�f�z�\"P�r,�j+YӰ��P\�2lz[G�\���gz��\�67<`-\",h�|l�lW;�a4�\0\\*�1\�$\�C\�\�V�.|���\��{�\�\�\�P�E������Ҭ\�M=\�n��Z\��\�,\��qZ\�\�l\�<KR�\�\Z<��\�l|���\�k�ZM\�FK\�ա�N\�\�ULC6�=Lʖ9��wՑ�ȶ�$\����o(~�q��\�\0\���.\�B1��J�\�l�z�\��^M�R*�%aC�\�*\�\�\�:ԍ\�PԄ.�QU{��\�\�ziZLr�ͪXM���6~�(�\�֯\��\�\�9�\���0;�\�,\�>�\�\�$��8u\'\�,W\�\��h�\�u�	\�j=\��*)W�\� ]}T��u�\�#�\�Ȏ��\�u�;�\�[#& H	+�	\�6\�\�<�kL\�x�6\�\�\�T6L$�\�z�x\ZZ51nJ\�Y<a4u�\�\�&ϗEI�\�B�W\nW�\�(�I\��$ȣ�<XX+a�چ�93=\�ǲ\�f�\0�=���\�\�\����?F�\�\�TI\0w}�<?\�\�\�J�\�4�Gw�\�\�\�z\�~j#\�[5x\�k!\�q\�\n�0��$T�\0+�G}L\�B9�\\�B�O��c�A\"x�o@g��O\�?s|W\��p_]���\����\�\"�g3@���m&�\�M�V�~\�h\nk��o\�!�\�*��\�\Z���~\���\�	r�;\��\�~\nh�!�\�\�!\�\�\��\�+^)յ=\�\\�\�-)\�K]�}::��0\�_�e1	:ƚS\�!�E��\�}�V\� \\��','2019-02-07 02:08:41'),(_binary 'my_wiki:pcache:idhash:6-0!canonical',_binary '�W\�j\�H\�o=\�TP؅8�\�KiY(NҸ$����\�2�&�ltc4r\�-�}�}\�}�=gF�%Yr\nk0�9�3\�w\�x\�ڎkΩȘ�\�2ͥ\��{\�]3Z��4�\�=�,\�4~{\�\�c\�^\�s�K\"X�i���f�<b.q,�\�r��\����e�mS.v.9\r,˸\�\�4\�>�X�X�䉆3\��\�\�]�\'\�Բl�1P2\�\���x��\�gY��\���Q��\�\��h[\�SW]��	\�Tv�\�I&���(�\�\�栖�0���uqf�,3�,JC�E�X\�T֡w\�Wk�I��f<�I�R�FŁe\\mS�FRu-\�)�}�Z\�J��8���p~.\�N��4��_�3\�\�\��z���5�ҁ��}r�\���\�/N�\�ħa��Ȣ\�_\r\�.\������ؤ\'IC@�gA7�X�\�+t�p�&\�lG�\�/����:wy��\�\����>���C\\�u`F��Q\�@�\n�\�y�\��`t�=\0D\�\�x�|ny���u-���\� C-�Dp\�L\�\0B\�DT�ː�$q\�䚇\��\n��\�.�\�9M\�\�F�R9(ZX=w*瓠\"9\�T\"H��}�u���׳�R�c\�W[\�DL\�fCUȰ\�m�/�\�=��W\�\�������i���Įvz\�h0�T�c\�wI�����>]�\0_Y���2����\�K6N\�\'��JE��z�\�$I��|�\"\��qZ\�\�l\�\\$)��b9\�,\�n�V\�{\�F�\�{u��St{\�ǐ\�f��e�\�]u$�C�\�<	���\�\�[��|�k,8\0�s~���P���\�5[�\�ⴿW�ԅ�`I\�\�/�\n�x\���ucr\05�KjT\�^\0#�z��^��g�*V�&鯍_=ʼ�ĺ�\�p?�w\����=\�N=8���\�5�b�+\'N\�I9$˕�3>�mx\�j·Zt�C�J\��6HWU\�a\�C��H�;��\�\�v�\�+�ֈ	\�\0R~������54�\�\ZS9^�\r�w�&�\r	���\�+��VM���\�uOM\�\���\��eQ\�G=����\�U�6\n`\�w0	�\�\"\�J���a\�LO��l�Y\'�=B����p�}`\�\�x2U�]!\�O����\�M(\�Q\�\�$z��^��ڈ�V\r^��Z\�tܴB.��?	U,�\n�\�G��P\�\�\"�P\�\"��C\�k�\�\�\�\�|���\�\�Uź<\�W\�!�.��}��H\�\�Ђk�g�I`zS���\�Ma\�_�\�8��Y����襧_��D�y��\�9pG���b\�+�w\��w2���W\�CumO5\�#xKfꍥ.\�>�^_\�ղ�c\�)�ʐӢ����x+c\0�\�\�','2019-02-07 02:34:10'),(_binary 'my_wiki:pcache:idhash:7-0!canonical',_binary '�W\�j\�H\�o=\�TP؅8�\�KiY(NҸ$����\�2�&�ltc4r\�-�}�}\�}�=gF�%Yr\nk0�9�3\�w\�x\�ڎkΩȘ�\�2ͥ\��{\�]3Z��4�\�=�,\�4~{\�\�c\�^\�s�K\"X�i���f�<b.q,�\�r��շ�}[\�ۦ\\\�\\r>\ZX�q��i\�}\�\'�d�t\�\r3f�\�\�\�3�O֩e\�$c�d\�=�\��r�ϲ,d\�3.!�8	D\�1��Ѷԧ��b1��\�앓L���?P\0�\�c?\�A-\�a\�\�\�:\�q\'Yf,Y��\��P�\�#��C\�,�D9\�x���r��˸ڦN7��\�Z\�S����q&O\��\\ԝ8{iZK�Lg��+\�\��~Wwk,�*o�\�T\��U�_>�DىO\�0;�E��\Z�\\\��a��IO&��*�Fςnv�,\�W\�x\�rM�َD�?^�3wSu\��`M��{ֳ\��4Nbq	ցe�FimJ(^?\�\�b��\�\��\0}K\�U�\��sfzԵ\�\�?@f�l���YS0�-QX\�.CV�ā�k2�+\0\��T��i\Z�P6\�Ѝ�\�A\�\�\�S9�\��A�U\�s8ĨF��������\�J&b\Z63�\�@�Mo\�p}��L\�ѵ�\�\��E�M�π\r&v�\�F�	��\��K�<d\�l�\�\��ʪ���\�]\�E_�q?�\�W*�\�ԃ\�&I�^�\�1�W�Ӣ�f3\�\"I��5x`\�\��fyw�\���\�+6\n��ثCU��۫�>�l6{��-s\0-\�#�\"�m\�I\��]%N\�:P�\�\�\\c���]��b�%�t�\�\������\0�.TK~�U�\�C\�u����	]R���i\�\��Ҵ�\�8�U1��84Im�\�Q\�%֭_����sh\�\�7\�av\��Y�}��I\�]9q\�N\�!Y����\�l\�\�(V�\�z�+\�UR��A���B\�r�Gzݑm7h�\�,wX��FL@�V�\�5�5m��y|ט\�!�Jm��\�7�8l�Hp\�]�^�4�jbܔ��x\�h\�\�\�M�/��>ꉅ���J�Q\0���I�Gy��V\�(�\r\rsfz��e\�\�:\�zh%M݇\�\�{�8Ǔ��\0\��y~\����@\�=hB9�2\�&ћ����\�F��j��\�B�\�ra\��I�bV��>��ąr��0�:�i*\�X�D�f߀\�6\��\�\���*\�\�Ὰiu��\��E\n\�f�\\\�=\�Lӛz�\��&h\nk��o\�!�͚�\�5D/=��\�%�\�\�dẃ;��\�C^��C���\�W�R�k{���[2So,u��\�\�t��\�P��\�$\�kN�W��\�ק�\�[\0py?�','2019-02-07 03:05:31'),(_binary 'my_wiki:pcache:idhash:8-0!canonical',_binary '�W\�j\�F\�\�z�Y�BqV�/I�RX�l\�%�M�\��,ibO#Kbf\�\�]\n}�>c��\�\�H�$K\�B\r3\�~\��\�\�|\��\�9��Y��\\\����K\�\�\�{�Uv �3\��m\�����\�e>\'1_sE\�R��1\rW,\"���O<ǽp<g\�\�a�\�\�\�f\\\�|r>\Z8�u�K蚇$L\�\�\'\ZKf�\�\�\�%]�\'\�\�q\\\"�EҺc4>\"�C.\"\r��� .����4b%\�\�G\�џ�\�%LЦ��WN���\��\0�D�\'a���\�b=\�\�\�z\�q���\�\�:���b�����k�\\1��v*y���ej��Ǻ\�fN7�d�Z\�S��\n���X�T�gpa.\�N��4��_�34\�\��z�껵\��jo�\�t\�\�U��>��\�IH\�X���ܟ-\�.\���p�����REc��gA7�X�jt�p�\"\�lGֻ\�_�3�3}\��hE\�\�?\�9\�C��	��\�����묁6-��\��\\�`t�;\0D\�\�d�|nx�,\�����/�� C-\�Tp\�L�B�TT򃫘�$�\�\�3���\0�]�\�\�4K�(a\�FH\��ha�ܫ�O��\�SYC�U\�s8ĨFE��e����\�*&\Z73\�\�@�Mo\�p}�4�\�\�\�w�\�\�G�E�M\�\�\0L\�j�׌F�K\�?\�}�Fyٚ̚\�E�UUY/S����\�q�<�\�W*�\�4�\�:M�^�\�	O��Ӣ�f3\�\"͘P5x`�����\�\r^3\�j�\�(0Zb�U}�n���\�\�aR�\�����\�w�@���1w�8}\�@�S�s�E@�\�t�\�Tѽf�\���wz��P,	��W��ԡnL��\'tI��\�`�UoT\�˲b�\�l\�\��j\�\�$�u�kFYP�X�~\��ޡ}�߰�\�ig1�q|�&Q�w\�ī;)�d�~\�G�\r��XO�V끩`p`hVI�B�\�\�=�{\�\�\�uG��ݠݮ�\�a\�\�\Z1@JX\�O0\�4֌��\��]ck��+�A�ߤ\�a����{%0Ъ�qSr�\�\�	c�[\\7y�,J�\�\'�R�.\�EL�&A]\��\�Z	�\�64Ι�>�\r�\�pG衕4u^�\��1\�O�J�\�#\��a?ؖV�`\�yڸ�Do�6(�S�ު!(X���Vȅ��\'��X�?�\�c\��[\�\�\�|B�up�c\r��}:c؀\�\��㻪X���\�sL�K�\�h,2x6�\�Z\�\�f\��4he\�7A3X��|3�)lVY�\�԰~陗l/5� \'�c\�\����f�J���ȟL?\�+塺���\�kxKJ�\�\�잎N�/�\�꾘c\�+�ʐӢ�\���x+c\0q��','2019-02-07 04:15:37'),(_binary 'my_wiki:pcache:idhash:9-0!canonical',_binary '\�Y}O\�8\Z߿�)�Y\�hW3mӴ�i`\�AafX1�(\�\�\�tBn\�^�8\�8�\�hO�\�3\�\'�籝��-\�\�\"m%\�\�����s��~\�^R�3yQ��Pn\���/y0\�\�=(w/z\�~?p�\���~�є�1\��\�\�5g4�y\�\\£�\�\�4W4��\�\"u���;Hx�\�\�~{D\�a�*x�J�KYJ@��d\�TN\"�+)�,j�SEB�>aD�I�cE~-xx/a)�E\�\�Tq\��H\'<\'�P\"��EpH�b6\'4\��$fmr\rTYL�!\��h,B}�%\�\�-�*&�[�\�mĲX,\�^�L\�\\	�lg���yע���pE�\\抰�3i�I�IBȂ\�7h��Ҧ\"�\�=Og@\�\�\�\\\�*w\�x�2g)��!+�7\���/�a\�y���P�\no\�J�$\��\'���d&�6Z\�A��ol|\�\�$F1x��@ܳ�qE`\�-��0�0�P�?�\��WQ\�@\�(�)�\'�x�L�hq��ug�\"Ih\n\�s\"�PD��p��S@\�\�U��P�W3�\��Evp\�@+̤�&Yy�+\�%�@�����X��z\�\�\�&G�\�g��W�\�\��a�\�C\�t-�v�\�\�\�ڶo�ɹX�oz\�]�\�g)�Pi:�\��oKF����!�\�_`�߱�\�~\����\�gϼ\��\�K�M�ī(J��ۖw݃W\���{������%s\�\�\�xǒwLl\���}�\�\�(�\�\�r�iK�@\�%�<�H2`N���9�OL�\��i�-GZ��Q����Y!MכJ��v\'�SY\�B\�@�v�N�ќ�w��W�_\��\\8�^�K�\�R�\nɜq�Dĝ�\�r\\L~a�\�썜�X�|]��&L7\�ܖk^ڼF�E,RMP��\��v����z̸�ƂIiu(%��T|ʱ��\nA�Y\�j\�w\�A�#.s����D�\�mnx}��v�\�`C�Ò��\�\���p~(�`S\�\��+\�\"�̛t?��:�!mu��s�N 7\�=W�E����\�,w���!\�M\��s�Q\�q�?c/fћF�aT�\�8�U\�`_*�]@9��\�s�x�3�\�$Y(y9\�\�8\'K\����\�/�S�\�%6WY\nP\0GD\�p��Q�\�(\0��!\�,\�<�5�X%�R\�8�B*���\�9v\��V�d\�\�\�Y�B\'b\�y�\'\�T\���e\��`ʼtmX�5�\�=Eh\'��,\��)]\�ےq[ZC\�%<\�L\�?Kk&�\�Y��,hR�}K�ڵ�&\�?\�jߪ��{[��	)�M�\�;\��<�{4\�}\�\r�\�\�;::\���\�ݷ\'���\���\�\�9<g\�%��32�\�0a\0gC\�p�\�\�*`\�)[�k(\�vƒzi8�߶Z\�9g���$\�	7]*gDC�G�\'��z��\�\rzCo\�\�AJg\\.�v�\�y\��2�	�-��Li�3gty�y@�\�p�\�^\��	Ǣ�H\�\��N��ھ]��!B��{h���\\�2�;���?��3�����\�q� ��\���4����?Q��\�\rw�\0��v͠g`~Q9+�-f�\�4h�9.>j\�\��=\�\���/\���/�dZ���U\�C\��	A��0���2Ai�ݬ��Q\�\�:c�ը\�:\�v�%h6j���iכ����\�oB��\�o���GTj{\��\�Q��3 �KZJ��M094�s	�օ:G�LE8�,o\��2���x[޷0WD\n�c\�\Z�U0\�\�9��7�9r�7�H\�sJ\�w\�\�\�It\�ӻ\�ݣ�|�\r���7[fgwc\�4��uY\���2\�U\�V7���ty�O;(�!@������Ө����P�z�-,��3*\��E��Q\�GO\0Ӧ4nj0Ж��x��P\�c��\�ݛޞ��\0@`\�\Zt.\�C&0���~�\�~\n\�Q\�zQ���fu�1Ku������l|\�Fx\r�\�Ζ3�4\�\�Aw˺�e��e��q�T\�\�|��\'*�Q4\�z>����3��\�T\����j��W{\�0\n~����D��K\� �7\\��{\ZCY}k/�L�E2<eh��\�\�u<\�3�\n�@�*\nS�\ZF\�\rb:\�$��\�G\�p.\�f������\�\�\���M�/j�Jb	;\���\0�\r\�Ɉދ\ZQ��hFYϗF<\�\�(\�\�ч\�gᶙ٦Z6\�zoի\��$Ż\�\�\�\�i��J}S}\��\r�L�p)b.+rz\�\��\��1�*���@�\��`\�gq\0��k\\�\�\�a�\�\�\�\�\r�\��\\\�aV�Q(p���M3\�Z!�\�piD�ϾW?v%P;\�ĵ>��\�2Mkh3}S��\\;:\�\�ό\�\�\�:�\n�l`\��\�9�z\r\0�8�@��g�X����u&\�\�/1\�\��hzb,4d�Q���o,\�\ZlTb\"\r�6�\�Z/\�\n�Z\��\�t�\�tk\�\"����J�\Zb!? �x\"��n&\�\�\�I�\�NC�G�O�\�n\�\Zj$J72\r\��L~ն�\�E\�\"sS\�6��\�\�㲈�?8�?Tצ\�j0���@�m%��m,}lAス�|LsF�n��;\�bc\�4�x�\�\\\��O�O��\�`T-�%�\�|\�3˨\��op0e\�kp�D)=��--���\�\�9�,\\\�PR\r屴\�ԕC���올T��bzE��\n��\�t\�RI��5J	\��\�\�ɻ_h�\�*VCu}v��iE��k\'\�\\�-\�[�F3l�\�ϒf\0��b�/Xe�\�\�\�e.h-�\nl5z7p�H#��\�}\�w��\����E�\�Mu����O>1}k�\�m\��+�\�\\\�~���\�R\���Y��W@t\0 }p��\0','2019-02-07 05:39:07'),(_binary 'my_wiki:pcache:idoptions:1',_binary 'E��\n\�@D�%P�\�vig�\��SA\�{�\�Z\Z��\�M�\�)\�{äC\��\�[>�1j,\�A\�Y�\�M\����e4*.y��D\�\�Xˎ\�����gײ\�ȡ\��~\�\�\�S�?�\n��\�\�\��ؗ\�`ޥ�','2019-02-07 04:50:20'),(_binary 'my_wiki:pcache:idoptions:10',_binary 'E�A\n\�0E\�2(��	�g).\\D\�Wh�\�ҩ��\�\�D)\�y\��*l@\��\��c\�<�`(\r\�N\�j�Br5\�\0v\� �������!�ʸ8�Q�NQ2 �٬H�\�\����)@�Ն5[�&7?O�\�\�5��M.���ve���oϵ[>','2019-02-07 06:53:54'),(_binary 'my_wiki:pcache:idoptions:11',_binary 'E��\n\�0D�e?�lB\Z\�\�Q<x*�z�6\�=T�[E-�w�x\�=f\ZԠM{\�\�A�H(1+�\rG�]s�\�vU\n-f\��\�?��\�\'RXU�Oq\�dR\�%\��p9N쿞�lj�\�ٻ��]�\�\�.㛂����+\�ǧ\�]�yi\��','2019-02-07 06:48:04'),(_binary 'my_wiki:pcache:idoptions:12',_binary 'E�A\n�0D\�� ?1�f�,.�J۽\�@���x�&\�nxo�i\�@\�\���8B�U�4h�J\�\��_O!߁�n�:�[�$Q�ڤ\n[��\'�_\�Ā4+ǚ-Wƕ�\�{�Y\�8}\�G\�\�0ggwws\�/�>�\��\�','2019-02-07 05:49:37'),(_binary 'my_wiki:pcache:idoptions:13',_binary 'E��\n\�0D�e?�lb\Z\�\�Q<�T�^\�9TKW�R�\�&H�6\�{̴�A�\�v�s�PbQ\Z.*};�\��:0�UQ%p�ISKA�M���\�\�pb��\�8�eS�e\�\�\�w?\�n\��=\�\�C!��93���\�1�4}\�	\�','2019-02-07 06:47:34'),(_binary 'my_wiki:pcache:idoptions:14',_binary 'E��\n\�0D�e?�\�\�&���x�T�^m�{��n��\�M�\�m���i�fض\�>%`˳2�x\�\�5\�$���o�xF�ٟ�G��|�E�J�9��LH\�2P\�2g\�\��\�)R�:KH�֬\�\�5\��/\\����\�S�˾\�\�n��','2019-02-07 06:51:01'),(_binary 'my_wiki:pcache:idoptions:15',_binary 'E��\n\�0D�e?�lB����x�T\��؀9TKWD)�w�B�6�7̴h@��v��4F�Ǣ04^5\��JχR\��XVE�Eg͔�\�6�J*W�\�\��K�8�eӰea�\�~�v\�?S��jq\�\�\�\�\��\�\�i(޻��\0','2019-02-07 06:50:05'),(_binary 'my_wiki:pcache:idoptions:16',_binary 'E��\n\�0D�e?�lb\�\�Q<x*�z�v�{��n��\�M�\�m���i�&ضמ�\�Ѭd,A<)w\�0\���Z24a\�\�O�#^T>aQ��|\�Q�	�;S��\�\�`b��ܔM�=zg\�\�\�\�\�۽\��*_b�3~e~J~\�w�;�/','2019-02-07 06:52:23'),(_binary 'my_wiki:pcache:idoptions:17',_binary 'E��\n\�0D�e?�lB����x�T�^l�=TKWD)�w�x\�f:��]�����\�(��gMC7=\�qW�=˪h���Y3���M�\n�+\�pv��BȲi\�r\�\�-\�?j�\��=\���(h�c..l\�^R^C�\�','2019-02-07 06:52:07'),(_binary 'my_wiki:pcache:idoptions:18',_binary 'E��\n\�0D�e?�lB\�\�Q<x*�z�6\�=DK��Z�\�&H�6\�{\�4Tl\�k��\"��YHi�t�\�5\�\���@hI\�̄A�?��t�D��\��9��M\�\��\�U�d���\�Kc4�\Z5:\� ڟ�Wo�\Zx|C`�\�`�Sne��\��\�\n�>,_','2019-02-07 07:00:54'),(_binary 'my_wiki:pcache:idoptions:19',_binary 'E�A\n\�0D\��P~b�\�R\\tUu_l�,��_���\�&Bq7�7̴�cw\�K\Z\"�b(\r\Z��v|�\�S(t`���\�\�\'ɔ�\�6�\�U�d\�\���\n1 \�ʳf\�\���Q��N󘦅BB\�sqnw\��I\�鋷>l_','2019-02-07 06:53:41'),(_binary 'my_wiki:pcache:idoptions:2',_binary 'E��\n\�0D�e?�lB\�\�Q<x*�z/6`\�\�QJ�ݬP�\r\�\r3ZЮ�\�򩌙\���g\�C7=\�\�.�z0�U��\�Y*�$�M�	�\�l�����lZ�\�9\�\�\�ڭ�Oe�P*��1��;\�Wїà>��','2019-02-06 08:26:58'),(_binary 'my_wiki:pcache:idoptions:20',_binary 'E��\n\�0D�e?�\�4���x�T�^m�{��n��\�M�\�m���i�fض\�>%\��ge2�k�I\�7\�2�,�^�?��xQ���r�\�s5��x\�@�+l΄��\�scR�n\�\�\�3��{\r2��W\�b�#��CxJ~\�w�;�\�','2019-02-07 07:02:14'),(_binary 'my_wiki:pcache:idoptions:21',_binary 'E��\n�0D�e?@6!�:9�<	�\�]j�{��E��&\�e\�f[Ԡcwċ�PbU\Z�\Z�v|\�\�:0\�MQ%q��&JAS�L\���\�\��K�8�eS�eχt\��{\�4�2-�w\�\��ݝ\�G�\�\�۰}','2019-02-07 07:02:05'),(_binary 'my_wiki:pcache:idoptions:3',_binary 'E�\�\n\�0�\�e�lb\�\�Q<x*�z�6Ѐ��[E)}w�B��}˔(@�\�Ѹ�o!\�,P\Z\�^\�\�\�0���f�\�@2�\�S3:i�gMv\�\�\�\�F	:)�\�$i̊�O\�&iVk6�7_[�y\�\�\�\�/Y�ܤ�����\�\�ǕS�a��\0','2019-02-07 07:02:08'),(_binary 'my_wiki:pcache:idoptions:4',_binary 'E���@D��@�\�@�h<x\"1\���@��F%��\�(�\�̼\�LM���t|���\n�#K\�#��8\�m�\��4�����{��f�BF5��q\�ie�\�\��Ԙ���TA`2�\�\�6�޿��a\�Th\�a�h��]�\�s��J��\�1-1n����Բk�o\�/','2019-02-07 05:00:24'),(_binary 'my_wiki:pcache:idoptions:5',_binary 'E��\n\�0D�e?�\�\�\�Q<x*�^l���[\�R�\�&B�0�7\�6�A\�\����4D\��Bh�j\�qN��R\��X7�\�\�\'͔�\�6I\�*[�pv��B,Ȱ\�l\�\��V~\�\�\�gL\�B!�;\�\\�\�]ߩ|9�\��\�','2019-02-07 02:08:41'),(_binary 'my_wiki:pcache:idoptions:6',_binary 'E��\n\�0D�e?�\�1���x�T�^l���+�����P�\r\�\r3-\ZЮ�\�\�)\r��\�l\rg�};>\�\�n:0\�\�Pgq��eJ�r���+Y8��R!�,\r+{֍�Q]{������\�;\�\��\��\�ˡ/^\\X�','2019-02-07 02:34:10'),(_binary 'my_wiki:pcache:idoptions:7',_binary 'E��\n�0D�e?@vc:9�z�\�]j�9؊[JE��&\�mxo�iр�\�\�q�\n�Bh�h\�\��%߃�n�:�k�5Q�\�$�+l\�\�\���2� \�Ұa\�%W���\�{\�\�\�|D\�,svnw]x\��r\Z�\�/','2019-02-07 03:05:31'),(_binary 'my_wiki:pcache:idoptions:8',_binary 'E��\n\�0D�e?�\�\�4���x\� \�؀9TKW�R�\�&B�6�7̴�A�\�v\�8B�E!4\\4�\���χ�\��XVE�\�5L�(yMm�\�6g\�\��K�X�a�ٰc+\�n��f\�\�c�>\�#*g��s�;�9旦\�ވ_�','2019-02-07 04:15:37'),(_binary 'my_wiki:pcache:idoptions:9',_binary 'E�A�@E\�\��\�\0��4.\\�u�\�h a\�hww wM\�k_���/79h+�c��������޻@����`a\�\�Y��ԍv׈��\"��dѧh\� ��$�gÑ���Mɖ\�i\�n\�\�\�۾{>\��\�x���\�\�se\�\�<e?}','2019-02-07 05:39:07'),(_binary 'my_wiki:specialversion-ext-version-text:/var/lib/mediawiki/mediawiki-1.32.0/extensions/EmbedVideo/extension.json:',_binary 'K�2��δ2�N\�L+Ck? i$k','2019-02-07 04:55:20'),(_binary 'my_wiki:specialversion-ext-version-text:/var/lib/mediawiki/mediawiki-1.32.0/extensions/SyntaxHighlight_GeSHi/extension.json:',_binary 'K�2��δ2�N\�L+Ck? i$k','2019-02-07 04:55:20'),(_binary 'my_wiki:specialversion-ext-version-text:/var/lib/mediawiki/mediawiki-1.32.0/skins/MonoBook/skin.json:',_binary 'K�2��δ2�N\�L+Ck? i$k','2019-02-07 04:55:20'),(_binary 'my_wiki:specialversion-ext-version-text:/var/lib/mediawiki/mediawiki-1.32.0/skins/Timeless/skin.json:',_binary 'K�2��δ2�N\�L+Ck? i$k','2019-02-07 04:55:20'),(_binary 'my_wiki:specialversion-ext-version-text:/var/lib/mediawiki/mediawiki-1.32.0/skins/Vector/skin.json:',_binary 'K�2��δ2�N\�L+Ck? i$k','2019-02-07 04:55:20');
/*!40000 ALTER TABLE `objectcache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oldimage`
--

DROP TABLE IF EXISTS `oldimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oldimage` (
  `oi_name` varbinary(255) NOT NULL DEFAULT '',
  `oi_archive_name` varbinary(255) NOT NULL DEFAULT '',
  `oi_size` int(10) unsigned NOT NULL DEFAULT '0',
  `oi_width` int(11) NOT NULL DEFAULT '0',
  `oi_height` int(11) NOT NULL DEFAULT '0',
  `oi_bits` int(11) NOT NULL DEFAULT '0',
  `oi_description` varbinary(767) NOT NULL DEFAULT '',
  `oi_description_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `oi_user` int(10) unsigned NOT NULL DEFAULT '0',
  `oi_user_text` varbinary(255) NOT NULL DEFAULT '',
  `oi_actor` bigint(20) unsigned NOT NULL DEFAULT '0',
  `oi_timestamp` binary(14) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `oi_metadata` mediumblob NOT NULL,
  `oi_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE','3D') DEFAULT NULL,
  `oi_major_mime` enum('unknown','application','audio','image','text','video','message','model','multipart','chemical') NOT NULL DEFAULT 'unknown',
  `oi_minor_mime` varbinary(100) NOT NULL DEFAULT 'unknown',
  `oi_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `oi_sha1` varbinary(32) NOT NULL DEFAULT '',
  KEY `oi_usertext_timestamp` (`oi_user_text`,`oi_timestamp`),
  KEY `oi_actor_timestamp` (`oi_actor`,`oi_timestamp`),
  KEY `oi_name_timestamp` (`oi_name`,`oi_timestamp`),
  KEY `oi_name_archive_name` (`oi_name`,`oi_archive_name`(14)),
  KEY `oi_sha1` (`oi_sha1`(10))
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oldimage`
--

LOCK TABLES `oldimage` WRITE;
/*!40000 ALTER TABLE `oldimage` DISABLE KEYS */;
/*!40000 ALTER TABLE `oldimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page`
--

DROP TABLE IF EXISTS `page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page` (
  `page_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_namespace` int(11) NOT NULL,
  `page_title` varbinary(255) NOT NULL,
  `page_restrictions` tinyblob NOT NULL,
  `page_is_redirect` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `page_is_new` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `page_random` double unsigned NOT NULL,
  `page_touched` binary(14) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `page_links_updated` varbinary(14) DEFAULT NULL,
  `page_latest` int(10) unsigned NOT NULL,
  `page_len` int(10) unsigned NOT NULL,
  `page_content_model` varbinary(32) DEFAULT NULL,
  `page_lang` varbinary(35) DEFAULT NULL,
  PRIMARY KEY (`page_id`),
  UNIQUE KEY `name_title` (`page_namespace`,`page_title`),
  KEY `page_random` (`page_random`),
  KEY `page_len` (`page_len`),
  KEY `page_redirect_namespace_len` (`page_is_redirect`,`page_namespace`,`page_len`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page`
--

LOCK TABLES `page` WRITE;
/*!40000 ALTER TABLE `page` DISABLE KEYS */;
INSERT INTO `page` VALUES (1,0,_binary 'Main_Page','',0,1,0.518018454533,_binary '20190205080506',NULL,1,735,_binary 'wikitext',NULL),(2,8,_binary 'Sidebar','',0,0,0.343279177381,_binary '20190205082658',_binary '20190205082659',6,256,_binary 'wikitext',NULL),(3,0,_binary 'Administration','',0,0,0.8200768931,_binary '20190206070158',_binary '20190206065923',60,44,_binary 'wikitext',NULL),(4,0,_binary 'VeraCrypt','',0,0,0.08477205463,_binary '20190206042036',_binary '20190206041603',20,3414,_binary 'wikitext',NULL),(5,6,_binary 'Veracrypt_1.png','',0,1,0.356503541182,_binary '20190206020955',_binary '20190206020841',10,0,_binary 'wikitext',NULL),(6,6,_binary 'Veracrypt_2.png','',0,1,0.764060214416,_binary '20190206023410',_binary '20190206023415',14,0,_binary 'wikitext',NULL),(7,6,_binary 'Veracrypt_3.png','',0,1,0.414105229438,_binary '20190206030531',_binary '20190206030534',16,0,_binary 'wikitext',NULL),(8,6,_binary 'Veracrypt_4.png','',0,1,0.166259077748,_binary '20190206041537',_binary '20190206041547',21,0,_binary 'wikitext',NULL),(9,0,_binary 'VPN','',0,0,0.111301772085,_binary '20190206053906',_binary '20190206053908',30,2217,_binary 'wikitext',NULL),(10,0,_binary 'User_Support','',0,0,0.339072889239,_binary '20190206065350',_binary '20190206054802',32,125,_binary 'wikitext',NULL),(11,0,_binary 'Using_Secrets','',0,0,0.449671650311,_binary '20190206064804',_binary '20190206064804',52,41,_binary 'wikitext',NULL),(12,6,_binary 'Using_secrets.mp4','',0,1,0.199213934474,_binary '20190206054937',_binary '20190206054937',34,0,_binary 'wikitext',NULL),(13,8,_binary 'Common.css','',0,0,0.520551856364,_binary '20190206064734',_binary '20190206064734',51,0,_binary 'css',NULL),(14,0,_binary 'Keys','',0,1,0.229096681939,_binary '20190206065057',_binary '20190206065100',53,46,_binary 'wikitext',NULL),(15,6,_binary 'Using_secrets_keys.mp4','',0,1,0.577372605712,_binary '20190206065158',_binary '20190206065005',54,0,_binary 'wikitext',NULL),(16,0,_binary 'Other_Options','',0,0,0.269287082135,_binary '20190206065343',_binary '20190206065329',56,55,_binary 'wikitext',NULL),(17,6,_binary 'Using_secrets_other_options.mp4','',0,1,0.543985474959,_binary '20190206065207',_binary '20190206065223',57,0,_binary 'wikitext',NULL),(18,0,_binary 'Using_Custom_Forms','',0,1,0.073038294417,_binary '20190206065524',_binary '20190206065526',58,46,_binary 'wikitext',NULL),(19,6,_binary 'Using_custom_forms.mp4','',0,1,0.615905386512,_binary '20190206065341',_binary '20190206065341',59,0,_binary 'wikitext',NULL),(20,0,_binary 'Custom_Forms','',0,1,0.031035082877,_binary '20190206070221',_binary '20190206070217',61,53,_binary 'wikitext',NULL),(21,6,_binary 'Administring_custom_forms.mp4','',0,1,0.775784852826,_binary '20190206070205',_binary '20190206070205',62,0,_binary 'wikitext',NULL);
/*!40000 ALTER TABLE `page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_props`
--

DROP TABLE IF EXISTS `page_props`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_props` (
  `pp_page` int(11) NOT NULL,
  `pp_propname` varbinary(60) NOT NULL,
  `pp_value` blob NOT NULL,
  `pp_sortkey` float DEFAULT NULL,
  PRIMARY KEY (`pp_page`,`pp_propname`),
  UNIQUE KEY `pp_propname_page` (`pp_propname`,`pp_page`),
  UNIQUE KEY `pp_propname_sortkey_page` (`pp_propname`,`pp_sortkey`,`pp_page`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_props`
--

LOCK TABLES `page_props` WRITE;
/*!40000 ALTER TABLE `page_props` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_props` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_restrictions`
--

DROP TABLE IF EXISTS `page_restrictions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_restrictions` (
  `pr_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pr_page` int(11) NOT NULL,
  `pr_type` varbinary(60) NOT NULL,
  `pr_level` varbinary(60) NOT NULL,
  `pr_cascade` tinyint(4) NOT NULL,
  `pr_user` int(10) unsigned DEFAULT NULL,
  `pr_expiry` varbinary(14) DEFAULT NULL,
  PRIMARY KEY (`pr_id`),
  UNIQUE KEY `pr_pagetype` (`pr_page`,`pr_type`),
  KEY `pr_typelevel` (`pr_type`,`pr_level`),
  KEY `pr_level` (`pr_level`),
  KEY `pr_cascade` (`pr_cascade`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_restrictions`
--

LOCK TABLES `page_restrictions` WRITE;
/*!40000 ALTER TABLE `page_restrictions` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_restrictions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagelinks`
--

DROP TABLE IF EXISTS `pagelinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagelinks` (
  `pl_from` int(10) unsigned NOT NULL DEFAULT '0',
  `pl_from_namespace` int(11) NOT NULL DEFAULT '0',
  `pl_namespace` int(11) NOT NULL DEFAULT '0',
  `pl_title` varbinary(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`pl_from`,`pl_namespace`,`pl_title`),
  KEY `pl_namespace` (`pl_namespace`,`pl_title`,`pl_from`),
  KEY `pl_backlinks_namespace` (`pl_from_namespace`,`pl_namespace`,`pl_title`,`pl_from`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagelinks`
--

LOCK TABLES `pagelinks` WRITE;
/*!40000 ALTER TABLE `pagelinks` DISABLE KEYS */;
INSERT INTO `pagelinks` VALUES (3,0,0,_binary 'Custom_Forms'),(10,0,0,_binary 'Keys'),(10,0,0,_binary 'Other_Options'),(10,0,0,_binary 'Using_Custom_Forms'),(10,0,0,_binary 'Using_Secrets'),(3,0,0,_binary 'VPN'),(3,0,0,_binary 'VeraCrypt');
/*!40000 ALTER TABLE `pagelinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `protected_titles`
--

DROP TABLE IF EXISTS `protected_titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `protected_titles` (
  `pt_namespace` int(11) NOT NULL,
  `pt_title` varbinary(255) NOT NULL,
  `pt_user` int(10) unsigned NOT NULL,
  `pt_reason` varbinary(767) DEFAULT '',
  `pt_reason_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `pt_timestamp` binary(14) NOT NULL,
  `pt_expiry` varbinary(14) NOT NULL DEFAULT '',
  `pt_create_perm` varbinary(60) NOT NULL,
  PRIMARY KEY (`pt_namespace`,`pt_title`),
  KEY `pt_timestamp` (`pt_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `protected_titles`
--

LOCK TABLES `protected_titles` WRITE;
/*!40000 ALTER TABLE `protected_titles` DISABLE KEYS */;
/*!40000 ALTER TABLE `protected_titles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `querycache`
--

DROP TABLE IF EXISTS `querycache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `querycache` (
  `qc_type` varbinary(32) NOT NULL,
  `qc_value` int(10) unsigned NOT NULL DEFAULT '0',
  `qc_namespace` int(11) NOT NULL DEFAULT '0',
  `qc_title` varbinary(255) NOT NULL DEFAULT '',
  KEY `qc_type` (`qc_type`,`qc_value`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `querycache`
--

LOCK TABLES `querycache` WRITE;
/*!40000 ALTER TABLE `querycache` DISABLE KEYS */;
/*!40000 ALTER TABLE `querycache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `querycache_info`
--

DROP TABLE IF EXISTS `querycache_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `querycache_info` (
  `qci_type` varbinary(32) NOT NULL DEFAULT '',
  `qci_timestamp` binary(14) NOT NULL DEFAULT '19700101000000',
  PRIMARY KEY (`qci_type`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `querycache_info`
--

LOCK TABLES `querycache_info` WRITE;
/*!40000 ALTER TABLE `querycache_info` DISABLE KEYS */;
INSERT INTO `querycache_info` VALUES (_binary 'activeusers',_binary '20190206070220');
/*!40000 ALTER TABLE `querycache_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `querycachetwo`
--

DROP TABLE IF EXISTS `querycachetwo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `querycachetwo` (
  `qcc_type` varbinary(32) NOT NULL,
  `qcc_value` int(10) unsigned NOT NULL DEFAULT '0',
  `qcc_namespace` int(11) NOT NULL DEFAULT '0',
  `qcc_title` varbinary(255) NOT NULL DEFAULT '',
  `qcc_namespacetwo` int(11) NOT NULL DEFAULT '0',
  `qcc_titletwo` varbinary(255) NOT NULL DEFAULT '',
  KEY `qcc_type` (`qcc_type`,`qcc_value`),
  KEY `qcc_title` (`qcc_type`,`qcc_namespace`,`qcc_title`),
  KEY `qcc_titletwo` (`qcc_type`,`qcc_namespacetwo`,`qcc_titletwo`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `querycachetwo`
--

LOCK TABLES `querycachetwo` WRITE;
/*!40000 ALTER TABLE `querycachetwo` DISABLE KEYS */;
INSERT INTO `querycachetwo` VALUES (_binary 'activeusers',1549354791,2,_binary 'Wiki user',0,'');
/*!40000 ALTER TABLE `querycachetwo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recentchanges`
--

DROP TABLE IF EXISTS `recentchanges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recentchanges` (
  `rc_id` int(11) NOT NULL AUTO_INCREMENT,
  `rc_timestamp` varbinary(14) NOT NULL DEFAULT '',
  `rc_user` int(10) unsigned NOT NULL DEFAULT '0',
  `rc_user_text` varbinary(255) NOT NULL DEFAULT '',
  `rc_actor` bigint(20) unsigned NOT NULL DEFAULT '0',
  `rc_namespace` int(11) NOT NULL DEFAULT '0',
  `rc_title` varbinary(255) NOT NULL DEFAULT '',
  `rc_comment` varbinary(767) NOT NULL DEFAULT '',
  `rc_comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `rc_minor` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rc_bot` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rc_new` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rc_cur_id` int(10) unsigned NOT NULL DEFAULT '0',
  `rc_this_oldid` int(10) unsigned NOT NULL DEFAULT '0',
  `rc_last_oldid` int(10) unsigned NOT NULL DEFAULT '0',
  `rc_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rc_source` varbinary(16) NOT NULL DEFAULT '',
  `rc_patrolled` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rc_ip` varbinary(40) NOT NULL DEFAULT '',
  `rc_old_len` int(11) DEFAULT NULL,
  `rc_new_len` int(11) DEFAULT NULL,
  `rc_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rc_logid` int(10) unsigned NOT NULL DEFAULT '0',
  `rc_log_type` varbinary(255) DEFAULT NULL,
  `rc_log_action` varbinary(255) DEFAULT NULL,
  `rc_params` blob,
  PRIMARY KEY (`rc_id`),
  KEY `rc_timestamp` (`rc_timestamp`),
  KEY `rc_namespace_title_timestamp` (`rc_namespace`,`rc_title`,`rc_timestamp`),
  KEY `rc_cur_id` (`rc_cur_id`),
  KEY `new_name_timestamp` (`rc_new`,`rc_namespace`,`rc_timestamp`),
  KEY `rc_ip` (`rc_ip`),
  KEY `rc_ns_usertext` (`rc_namespace`,`rc_user_text`),
  KEY `rc_ns_actor` (`rc_namespace`,`rc_actor`),
  KEY `rc_user_text` (`rc_user_text`,`rc_timestamp`),
  KEY `rc_actor` (`rc_actor`,`rc_timestamp`),
  KEY `rc_name_type_patrolled_timestamp` (`rc_namespace`,`rc_type`,`rc_patrolled`,`rc_timestamp`),
  KEY `rc_this_oldid` (`rc_this_oldid`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recentchanges`
--

LOCK TABLES `recentchanges` WRITE;
/*!40000 ALTER TABLE `recentchanges` DISABLE KEYS */;
INSERT INTO `recentchanges` VALUES (1,_binary '20190205081951',1,_binary 'Wiki user',0,8,_binary 'Sidebar',_binary 'Created page with \" * navigation ** mainpage|mainpage-description ** recentchanges-url|recentchanges * new heading ** randompage-url|randompage ** helppage|help-mediawiki * SEARCH * TOOLBOX * LA...\"',0,0,0,1,2,2,0,1,_binary 'mw.new',2,_binary '10.0.0.253',0,182,0,0,NULL,'',''),(2,_binary '20190205082155',1,_binary 'Wiki user',0,8,_binary 'Sidebar','',0,0,0,0,2,3,2,0,_binary 'mw.edit',2,_binary '10.0.0.253',182,227,0,0,NULL,'',''),(3,_binary '20190205082357',1,_binary 'Wiki user',0,8,_binary 'Sidebar','',0,0,0,0,2,4,3,0,_binary 'mw.edit',2,_binary '10.0.0.253',227,243,0,0,NULL,'',''),(4,_binary '20190205082442',1,_binary 'Wiki user',0,8,_binary 'Sidebar','',0,0,0,0,2,5,4,0,_binary 'mw.edit',2,_binary '10.0.0.253',243,256,0,0,NULL,'',''),(5,_binary '20190205082658',1,_binary 'Wiki user',0,8,_binary 'Sidebar','',0,0,0,0,2,6,5,0,_binary 'mw.edit',2,_binary '10.0.0.253',256,256,0,0,NULL,'',''),(6,_binary '20190206015618',1,_binary 'Wiki user',0,0,_binary 'Administration',_binary 'Created page with \"* VeraCrypt\"',0,0,0,1,3,7,0,1,_binary 'mw.new',2,_binary '10.0.0.253',0,11,0,0,NULL,'',''),(7,_binary '20190206015638',1,_binary 'Wiki user',0,0,_binary 'Administration','',0,0,0,0,3,8,7,0,_binary 'mw.edit',2,_binary '10.0.0.253',11,15,0,0,NULL,'',''),(8,_binary '20190206020524',1,_binary 'Wiki user',0,0,_binary 'VeraCrypt',_binary 'Created page with \"<h2>Overview</h2>  VeraCrypt provides a clinician\'s laptop with full disk encryption. This protects the data stored on the laptop in the event of thief. The link to the utilit...\"',0,0,0,1,4,9,0,1,_binary 'mw.new',2,_binary '10.0.0.253',0,376,0,0,NULL,'',''),(9,_binary '20190206020841',1,_binary 'Wiki user',0,6,_binary 'Veracrypt_1.png','',0,0,0,0,5,10,0,3,_binary 'mw.log',2,_binary '10.0.0.253',NULL,NULL,0,5,_binary 'upload',_binary 'upload',_binary 'a:2:{s:8:\"img_sha1\";s:31:\"2qtkri5zfjrrvnkm6z2xshuzmz8xh4x\";s:13:\"img_timestamp\";s:14:\"20190206020841\";}'),(10,_binary '20190206020955',1,_binary 'Wiki user',0,0,_binary 'VeraCrypt','',0,0,0,0,4,11,9,0,_binary 'mw.edit',2,_binary '10.0.0.253',376,401,0,0,NULL,'',''),(11,_binary '20190206022525',1,_binary 'Wiki user',0,0,_binary 'VeraCrypt','',0,0,0,0,4,12,11,0,_binary 'mw.edit',2,_binary '10.0.0.253',401,605,0,0,NULL,'',''),(12,_binary '20190206023352',1,_binary 'Wiki user',0,0,_binary 'VeraCrypt','',0,0,0,0,4,13,12,0,_binary 'mw.edit',2,_binary '10.0.0.253',605,695,0,0,NULL,'',''),(13,_binary '20190206023410',1,_binary 'Wiki user',0,6,_binary 'Veracrypt_2.png','',0,0,0,0,6,14,0,3,_binary 'mw.log',2,_binary '10.0.0.253',NULL,NULL,0,7,_binary 'upload',_binary 'upload',_binary 'a:2:{s:8:\"img_sha1\";s:31:\"psrywqwxbrgclfdrwemttjrth4a2x7w\";s:13:\"img_timestamp\";s:14:\"20190206023410\";}'),(14,_binary '20190206030508',1,_binary 'Wiki user',0,0,_binary 'VeraCrypt','',0,0,0,0,4,15,13,0,_binary 'mw.edit',2,_binary '10.0.0.253',695,1378,0,0,NULL,'',''),(15,_binary '20190206030531',1,_binary 'Wiki user',0,6,_binary 'Veracrypt_3.png','',0,0,0,0,7,16,0,3,_binary 'mw.log',2,_binary '10.0.0.253',NULL,NULL,0,9,_binary 'upload',_binary 'upload',_binary 'a:2:{s:8:\"img_sha1\";s:31:\"g5aql4cxkpbx6ndxwo66tr3el0pkno6\";s:13:\"img_timestamp\";s:14:\"20190206030531\";}'),(16,_binary '20190206033126',1,_binary 'Wiki user',0,0,_binary 'VeraCrypt','',0,0,0,0,4,17,15,0,_binary 'mw.edit',2,_binary '10.0.0.253',1378,2171,0,0,NULL,'',''),(17,_binary '20190206035426',1,_binary 'Wiki user',0,0,_binary 'VeraCrypt','',0,0,0,0,4,18,17,0,_binary 'mw.edit',2,_binary '10.0.0.253',2171,2528,0,0,NULL,'',''),(18,_binary '20190206041433',1,_binary 'Wiki user',0,0,_binary 'VeraCrypt','',0,0,0,0,4,19,18,0,_binary 'mw.edit',2,_binary '10.0.0.253',2528,3416,0,0,NULL,'',''),(19,_binary '20190206041510',1,_binary 'Wiki user',0,0,_binary 'VeraCrypt','',0,0,0,0,4,20,19,0,_binary 'mw.edit',2,_binary '10.0.0.253',3416,3414,0,0,NULL,'',''),(20,_binary '20190206041537',1,_binary 'Wiki user',0,6,_binary 'Veracrypt_4.png','',0,0,0,0,8,21,0,3,_binary 'mw.log',2,_binary '10.0.0.253',NULL,NULL,0,11,_binary 'upload',_binary 'upload',_binary 'a:2:{s:8:\"img_sha1\";s:31:\"7hucpp8ieqt0o2vcgy8hf157c5mby73\";s:13:\"img_timestamp\";s:14:\"20190206041537\";}'),(21,_binary '20190206042312',1,_binary 'Wiki user',0,0,_binary 'Administration','',0,0,0,0,3,22,8,0,_binary 'mw.edit',2,_binary '10.0.0.253',15,25,0,0,NULL,'',''),(22,_binary '20190206043807',1,_binary 'Wiki user',0,0,_binary 'VPN',_binary 'Created page with \"<h2>Installation</h2>  In the event that the openvpn server gets destroyed. It can be rebuilt quickly because the entire installation is automated through ansible. The playboo...\"',0,0,0,1,9,23,0,1,_binary 'mw.new',2,_binary '10.0.0.253',0,529,0,0,NULL,'',''),(23,_binary '20190206045504',1,_binary 'Wiki user',0,0,_binary 'VPN','',0,0,0,0,9,24,23,0,_binary 'mw.edit',2,_binary '10.0.0.253',529,815,0,0,NULL,'',''),(24,_binary '20190206050910',1,_binary 'Wiki user',0,0,_binary 'VPN','',0,0,0,0,9,25,24,0,_binary 'mw.edit',2,_binary '10.0.0.253',815,1441,0,0,NULL,'',''),(25,_binary '20190206052456',1,_binary 'Wiki user',0,0,_binary 'VPN','',0,0,0,0,9,26,25,0,_binary 'mw.edit',2,_binary '10.0.0.253',1441,1459,0,0,NULL,'',''),(26,_binary '20190206052545',1,_binary 'Wiki user',0,0,_binary 'VPN','',0,0,0,0,9,27,26,0,_binary 'mw.edit',2,_binary '10.0.0.253',1459,1465,0,0,NULL,'',''),(27,_binary '20190206052604',1,_binary 'Wiki user',0,0,_binary 'VPN','',0,0,0,0,9,28,27,0,_binary 'mw.edit',2,_binary '10.0.0.253',1465,1483,0,0,NULL,'',''),(28,_binary '20190206052729',1,_binary 'Wiki user',0,0,_binary 'VPN','',0,0,0,0,9,29,28,0,_binary 'mw.edit',2,_binary '10.0.0.253',1483,1477,0,0,NULL,'',''),(29,_binary '20190206053906',1,_binary 'Wiki user',0,0,_binary 'VPN','',0,0,0,0,9,30,29,0,_binary 'mw.edit',2,_binary '10.0.0.253',1477,2217,0,0,NULL,'',''),(30,_binary '20190206054723',1,_binary 'Wiki user',0,0,_binary 'User_Support',_binary 'Created page with \"* Hope Matters ** Secrets *** Using Secrets *** Keys *** Other Options ** Custom Forms *** Using Custom Forms\"',0,0,0,1,10,31,0,1,_binary 'mw.new',2,_binary '10.0.0.253',0,109,0,0,NULL,'',''),(31,_binary '20190206054802',1,_binary 'Wiki user',0,0,_binary 'User_Support','',0,0,0,0,10,32,31,0,_binary 'mw.edit',2,_binary '10.0.0.253',109,125,0,0,NULL,'',''),(32,_binary '20190206054915',1,_binary 'Wiki user',0,0,_binary 'Using_Secrets',_binary 'Created page with \"[[File:using_secrets.mp4]]\"',0,0,0,1,11,33,0,1,_binary 'mw.new',2,_binary '10.0.0.253',0,26,0,0,NULL,'',''),(33,_binary '20190206054937',1,_binary 'Wiki user',0,6,_binary 'Using_secrets.mp4','',0,0,0,0,12,34,0,3,_binary 'mw.log',2,_binary '10.0.0.253',NULL,NULL,0,16,_binary 'upload',_binary 'upload',_binary 'a:2:{s:8:\"img_sha1\";s:31:\"7lxy0p5zqe4ir2smm9tbxtfgsr7rt0n\";s:13:\"img_timestamp\";s:14:\"20190206054937\";}'),(34,_binary '20190206055442',1,_binary 'Wiki user',0,0,_binary 'Using_Secrets','',0,0,0,0,11,35,33,0,_binary 'mw.edit',2,_binary '10.0.0.253',26,41,0,0,NULL,'',''),(35,_binary '20190206060130',1,_binary 'Wiki user',0,0,_binary 'Using_Secrets','',0,0,0,0,11,36,35,0,_binary 'mw.edit',2,_binary '10.0.0.253',41,40,0,0,NULL,'',''),(36,_binary '20190206060648',1,_binary 'Wiki user',0,0,_binary 'Using_Secrets','',0,0,0,0,11,37,36,0,_binary 'mw.edit',2,_binary '10.0.0.253',40,37,0,0,NULL,'',''),(37,_binary '20190206061233',1,_binary 'Wiki user',0,0,_binary 'Using_Secrets','',0,0,0,0,11,38,37,0,_binary 'mw.edit',2,_binary '10.0.0.253',37,154,0,0,NULL,'',''),(38,_binary '20190206061432',1,_binary 'Wiki user',0,8,_binary 'Common.css',_binary 'Created page with \".scaled-video img {     max-width: 75%;     height: auto;     width: auto\\9; }\"',0,0,0,1,13,39,0,1,_binary 'mw.new',2,_binary '10.0.0.253',0,78,0,0,NULL,'',''),(39,_binary '20190206061556',1,_binary 'Wiki user',0,0,_binary 'Using_Secrets','',0,0,0,0,11,40,38,0,_binary 'mw.edit',2,_binary '10.0.0.253',154,79,0,0,NULL,'',''),(40,_binary '20190206061845',1,_binary 'Wiki user',0,8,_binary 'Common.css','',0,0,0,0,13,41,39,0,_binary 'mw.edit',2,_binary '10.0.0.253',78,74,0,0,NULL,'',''),(41,_binary '20190206062213',1,_binary 'Wiki user',0,8,_binary 'Common.css','',0,0,0,0,13,42,41,0,_binary 'mw.edit',2,_binary '10.0.0.253',74,66,0,0,NULL,'',''),(42,_binary '20190206062358',1,_binary 'Wiki user',0,0,_binary 'Using_Secrets','',0,0,0,0,11,43,40,0,_binary 'mw.edit',2,_binary '10.0.0.253',79,61,0,0,NULL,'',''),(43,_binary '20190206062501',1,_binary 'Wiki user',0,8,_binary 'Common.css','',0,0,0,0,13,44,42,0,_binary 'mw.edit',2,_binary '10.0.0.253',66,35,0,0,NULL,'',''),(44,_binary '20190206062510',1,_binary 'Wiki user',0,8,_binary 'Common.css','',0,0,0,0,13,45,44,0,_binary 'mw.edit',2,_binary '10.0.0.253',35,37,0,0,NULL,'',''),(45,_binary '20190206062746',1,_binary 'Wiki user',0,8,_binary 'Common.css',_binary 'Blanked the page',0,0,0,0,13,46,45,0,_binary 'mw.edit',2,_binary '10.0.0.253',37,0,0,0,NULL,'',''),(46,_binary '20190206063947',1,_binary 'Wiki user',0,0,_binary 'Using_Secrets','',0,0,0,0,11,47,43,0,_binary 'mw.edit',2,_binary '10.0.0.253',61,41,0,0,NULL,'',''),(47,_binary '20190206064236',1,_binary 'Wiki user',0,8,_binary 'Common.css','',0,0,0,0,13,48,46,0,_binary 'mw.edit',2,_binary '10.0.0.253',0,48,0,0,NULL,'',''),(48,_binary '20190206064540',1,_binary 'Wiki user',0,0,_binary 'Using_Secrets','',0,0,0,0,11,49,47,0,_binary 'mw.edit',2,_binary '10.0.0.253',41,54,0,0,NULL,'',''),(49,_binary '20190206064558',1,_binary 'Wiki user',0,8,_binary 'Common.css','',0,0,0,0,13,50,48,0,_binary 'mw.edit',2,_binary '10.0.0.253',48,54,0,0,NULL,'',''),(50,_binary '20190206064734',1,_binary 'Wiki user',0,8,_binary 'Common.css',_binary 'Blanked the page',0,0,0,0,13,51,50,0,_binary 'mw.edit',2,_binary '10.0.0.253',54,0,0,0,NULL,'',''),(51,_binary '20190206064804',1,_binary 'Wiki user',0,0,_binary 'Using_Secrets','',0,0,0,0,11,52,49,0,_binary 'mw.edit',2,_binary '10.0.0.253',54,41,0,0,NULL,'',''),(52,_binary '20190206064952',1,_binary 'Wiki user',0,0,_binary 'Keys',_binary 'Created page with \"[[File: using_secrets_keys.mp4|1000px|center]]\"',0,0,0,1,14,53,0,1,_binary 'mw.new',2,_binary '10.0.0.253',0,46,0,0,NULL,'',''),(53,_binary '20190206065005',1,_binary 'Wiki user',0,6,_binary 'Using_secrets_keys.mp4','',0,0,0,0,15,54,0,3,_binary 'mw.log',2,_binary '10.0.0.253',NULL,NULL,0,20,_binary 'upload',_binary 'upload',_binary 'a:2:{s:8:\"img_sha1\";s:31:\"4f1fqh9bm3p2vj2gpddizjlqpb4rb0s\";s:13:\"img_timestamp\";s:14:\"20190206065005\";}'),(54,_binary '20190206065128',1,_binary 'Wiki user',0,0,_binary 'Other_Options',_binary 'Created page with \"[[File: using_secrets_keys.mp4|1000px|center]]\"',0,0,0,1,16,55,0,1,_binary 'mw.new',2,_binary '10.0.0.253',0,46,0,0,NULL,'',''),(55,_binary '20190206065157',1,_binary 'Wiki user',0,0,_binary 'Other_Options','',0,0,0,0,16,56,55,0,_binary 'mw.edit',2,_binary '10.0.0.253',46,55,0,0,NULL,'',''),(56,_binary '20190206065207',1,_binary 'Wiki user',0,6,_binary 'Using_secrets_other_options.mp4','',0,0,0,0,17,57,0,3,_binary 'mw.log',2,_binary '10.0.0.253',NULL,NULL,0,23,_binary 'upload',_binary 'upload',_binary 'a:2:{s:8:\"img_sha1\";s:31:\"r8z0g14gho7tkoy65ilu483e8jsy75x\";s:13:\"img_timestamp\";s:14:\"20190206065207\";}'),(57,_binary '20190206065327',1,_binary 'Wiki user',0,0,_binary 'Using_Custom_Forms',_binary 'Created page with \"[[File: using_custom_forms.mp4|1000px|center]]\"',0,0,0,1,18,58,0,1,_binary 'mw.new',2,_binary '10.0.0.253',0,46,0,0,NULL,'',''),(58,_binary '20190206065341',1,_binary 'Wiki user',0,6,_binary 'Using_custom_forms.mp4','',0,0,0,0,19,59,0,3,_binary 'mw.log',2,_binary '10.0.0.253',NULL,NULL,0,26,_binary 'upload',_binary 'upload',_binary 'a:2:{s:8:\"img_sha1\";s:31:\"3m2xtvpth39lul52rzswb01dsm7das6\";s:13:\"img_timestamp\";s:14:\"20190206065341\";}'),(59,_binary '20190206065833',1,_binary 'Wiki user',0,0,_binary 'Administration','',0,0,0,0,3,60,22,0,_binary 'mw.edit',2,_binary '10.0.0.253',25,44,0,0,NULL,'',''),(60,_binary '20190206070155',1,_binary 'Wiki user',0,0,_binary 'Custom_Forms',_binary 'Created page with \"[[File: administring_custom_forms.mp4|1000px|center]]\"',0,0,0,1,20,61,0,1,_binary 'mw.new',2,_binary '10.0.0.253',0,53,0,0,NULL,'',''),(61,_binary '20190206070205',1,_binary 'Wiki user',0,6,_binary 'Administring_custom_forms.mp4','',0,0,0,0,21,62,0,3,_binary 'mw.log',2,_binary '10.0.0.253',NULL,NULL,0,29,_binary 'upload',_binary 'upload',_binary 'a:2:{s:8:\"img_sha1\";s:31:\"94scdxcq9th2mzy5ze84obex15kykav\";s:13:\"img_timestamp\";s:14:\"20190206070205\";}');
/*!40000 ALTER TABLE `recentchanges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `redirect`
--

DROP TABLE IF EXISTS `redirect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `redirect` (
  `rd_from` int(10) unsigned NOT NULL DEFAULT '0',
  `rd_namespace` int(11) NOT NULL DEFAULT '0',
  `rd_title` varbinary(255) NOT NULL DEFAULT '',
  `rd_interwiki` varbinary(32) DEFAULT NULL,
  `rd_fragment` varbinary(255) DEFAULT NULL,
  PRIMARY KEY (`rd_from`),
  KEY `rd_ns_title` (`rd_namespace`,`rd_title`,`rd_from`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `redirect`
--

LOCK TABLES `redirect` WRITE;
/*!40000 ALTER TABLE `redirect` DISABLE KEYS */;
/*!40000 ALTER TABLE `redirect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revision`
--

DROP TABLE IF EXISTS `revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revision` (
  `rev_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rev_page` int(10) unsigned NOT NULL,
  `rev_text_id` int(10) unsigned NOT NULL DEFAULT '0',
  `rev_comment` varbinary(767) NOT NULL DEFAULT '',
  `rev_user` int(10) unsigned NOT NULL DEFAULT '0',
  `rev_user_text` varbinary(255) NOT NULL DEFAULT '',
  `rev_timestamp` binary(14) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `rev_minor_edit` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rev_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rev_len` int(10) unsigned DEFAULT NULL,
  `rev_parent_id` int(10) unsigned DEFAULT NULL,
  `rev_sha1` varbinary(32) NOT NULL DEFAULT '',
  `rev_content_model` varbinary(32) DEFAULT NULL,
  `rev_content_format` varbinary(64) DEFAULT NULL,
  PRIMARY KEY (`rev_id`),
  KEY `rev_page_id` (`rev_page`,`rev_id`),
  KEY `rev_timestamp` (`rev_timestamp`),
  KEY `page_timestamp` (`rev_page`,`rev_timestamp`),
  KEY `user_timestamp` (`rev_user`,`rev_timestamp`),
  KEY `usertext_timestamp` (`rev_user_text`,`rev_timestamp`),
  KEY `page_user_timestamp` (`rev_page`,`rev_user`,`rev_timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=binary MAX_ROWS=10000000 AVG_ROW_LENGTH=1024;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revision`
--

LOCK TABLES `revision` WRITE;
/*!40000 ALTER TABLE `revision` DISABLE KEYS */;
INSERT INTO `revision` VALUES (1,1,1,'',0,_binary 'MediaWiki default',_binary '20190205080506',0,0,735,0,_binary 'a5wehuldd0go2uniagwvx66n6c80irq',NULL,NULL),(2,2,2,_binary 'Created page with \" * navigation ** mainpage|mainpage-description ** recentchanges-url|recentchanges * new heading ** randompage-url|randompage ** helppage|help-mediawiki * SEARCH * TOOLBOX * LA...\"',1,_binary 'Wiki user',_binary '20190205081951',0,0,182,0,_binary 'qnirei0amkyic0rhlbn6kraca4uc1ug',NULL,NULL),(3,2,3,'',1,_binary 'Wiki user',_binary '20190205082155',0,0,227,2,_binary 'n996q47vuw1acm5szeai01yt6a735wv',NULL,NULL),(4,2,4,'',1,_binary 'Wiki user',_binary '20190205082357',0,0,243,3,_binary '1cfhir1fdhtvc83xh623rgjrsdjqi8q',NULL,NULL),(5,2,5,'',1,_binary 'Wiki user',_binary '20190205082442',0,0,256,4,_binary '1x5f9d3xq9osyeczhd653vnt2q7zzv5',NULL,NULL),(6,2,6,'',1,_binary 'Wiki user',_binary '20190205082658',0,0,256,5,_binary '86f2i9ucij0tkdqshggfj41s703w9d6',NULL,NULL),(7,3,7,_binary 'Created page with \"* VeraCrypt\"',1,_binary 'Wiki user',_binary '20190206015618',0,0,11,0,_binary 'tal59t60dbpbkydz0n16dqk2t1smsir',NULL,NULL),(8,3,8,'',1,_binary 'Wiki user',_binary '20190206015638',0,0,15,7,_binary 'lnkztzieh2gbqiooasyd2oqc5z3ocbh',NULL,NULL),(9,4,9,_binary 'Created page with \"<h2>Overview</h2>  VeraCrypt provides a clinician\'s laptop with full disk encryption. This protects the data stored on the laptop in the event of thief. The link to the utilit...\"',1,_binary 'Wiki user',_binary '20190206020524',0,0,376,0,_binary 'o7r499hrpfjal5hzzzydn5yxqul1b3w',NULL,NULL),(10,5,10,'',1,_binary 'Wiki user',_binary '20190206020841',0,0,0,0,_binary 'phoiac9h4m842xq45sp7s6u21eteeq1',NULL,NULL),(11,4,11,'',1,_binary 'Wiki user',_binary '20190206020955',0,0,401,9,_binary 'cvvkssp2zxsw0p5dxu7w457j0w8uxzz',NULL,NULL),(12,4,12,'',1,_binary 'Wiki user',_binary '20190206022525',0,0,605,11,_binary 'gp5js5jmusp8nn4nk67654bykqxplzi',NULL,NULL),(13,4,13,'',1,_binary 'Wiki user',_binary '20190206023352',0,0,695,12,_binary 'p22x5z6pmerqvdzn2x8tf8llqq2n05a',NULL,NULL),(14,6,14,'',1,_binary 'Wiki user',_binary '20190206023410',0,0,0,0,_binary 'phoiac9h4m842xq45sp7s6u21eteeq1',NULL,NULL),(15,4,15,'',1,_binary 'Wiki user',_binary '20190206030508',0,0,1378,13,_binary 'rwdvui3b7tol6ir2fxvfxoawt5gyve2',NULL,NULL),(16,7,16,'',1,_binary 'Wiki user',_binary '20190206030531',0,0,0,0,_binary 'phoiac9h4m842xq45sp7s6u21eteeq1',NULL,NULL),(17,4,17,'',1,_binary 'Wiki user',_binary '20190206033126',0,0,2171,15,_binary '9igce8v3z2hh4nqawim5aook61uphx0',NULL,NULL),(18,4,18,'',1,_binary 'Wiki user',_binary '20190206035426',0,0,2528,17,_binary 'pz36zb9s41b1ecc48qyt24bqenzy31w',NULL,NULL),(19,4,19,'',1,_binary 'Wiki user',_binary '20190206041433',0,0,3416,18,_binary '7424aj2kqfeysblv7hewpy001i34gly',NULL,NULL),(20,4,20,'',1,_binary 'Wiki user',_binary '20190206041510',0,0,3414,19,_binary 'l9oakz1jk1d6p303eyw7frec6afc4oh',NULL,NULL),(21,8,21,'',1,_binary 'Wiki user',_binary '20190206041537',0,0,0,0,_binary 'phoiac9h4m842xq45sp7s6u21eteeq1',NULL,NULL),(22,3,22,'',1,_binary 'Wiki user',_binary '20190206042312',0,0,25,8,_binary '659w59x7c02m2bt1htumidotxnry5sg',NULL,NULL),(23,9,23,_binary 'Created page with \"<h2>Installation</h2>  In the event that the openvpn server gets destroyed. It can be rebuilt quickly because the entire installation is automated through ansible. The playboo...\"',1,_binary 'Wiki user',_binary '20190206043807',0,0,529,0,_binary 'jy7vcq53rd8cth67vf16im6nd593buu',NULL,NULL),(24,9,24,'',1,_binary 'Wiki user',_binary '20190206045504',0,0,815,23,_binary '5qja47tv93k39cksmj6mhr0enh6x63z',NULL,NULL),(25,9,25,'',1,_binary 'Wiki user',_binary '20190206050910',0,0,1441,24,_binary 'l7v3pibb0ekxrakfguhduzui3djihxj',NULL,NULL),(26,9,26,'',1,_binary 'Wiki user',_binary '20190206052456',0,0,1459,25,_binary 'czsmzvjo19qerf6zkkc61gfl13xcn5o',NULL,NULL),(27,9,27,'',1,_binary 'Wiki user',_binary '20190206052545',0,0,1465,26,_binary 'gd6lgxfh4hk7tlafn2j01cjpeha93gp',NULL,NULL),(28,9,28,'',1,_binary 'Wiki user',_binary '20190206052604',0,0,1483,27,_binary 'qdg5m38k7mql336nwia3k879jl7bupq',NULL,NULL),(29,9,29,'',1,_binary 'Wiki user',_binary '20190206052729',0,0,1477,28,_binary 'c09bj096x67uau29w7qeoj1e3n6qcyb',NULL,NULL),(30,9,30,'',1,_binary 'Wiki user',_binary '20190206053906',0,0,2217,29,_binary 'huyth0kwupv6ozoo6zg9w78kdc9w4li',NULL,NULL),(31,10,31,_binary 'Created page with \"* Hope Matters ** Secrets *** Using Secrets *** Keys *** Other Options ** Custom Forms *** Using Custom Forms\"',1,_binary 'Wiki user',_binary '20190206054723',0,0,109,0,_binary 'dyhbkxs0yuvxe3skjz5r7hjbomrk6tn',NULL,NULL),(32,10,32,'',1,_binary 'Wiki user',_binary '20190206054802',0,0,125,31,_binary 'r84of5qkys0ewefbzvwmhpyz4gzumf5',NULL,NULL),(33,11,33,_binary 'Created page with \"[[File:using_secrets.mp4]]\"',1,_binary 'Wiki user',_binary '20190206054915',0,0,26,0,_binary '7eism4u5mltxd8e7w66s3rzm3lmh1os',NULL,NULL),(34,12,34,'',1,_binary 'Wiki user',_binary '20190206054937',0,0,0,0,_binary 'phoiac9h4m842xq45sp7s6u21eteeq1',NULL,NULL),(35,11,35,'',1,_binary 'Wiki user',_binary '20190206055442',0,0,41,33,_binary '7wvw2d8fyhn91g4p9c73thm7mxrtswg',NULL,NULL),(36,11,36,'',1,_binary 'Wiki user',_binary '20190206060130',0,0,40,35,_binary 'kx615d3kcicaeme1j9p2xzavojc4efk',NULL,NULL),(37,11,37,'',1,_binary 'Wiki user',_binary '20190206060648',0,0,37,36,_binary 'iphhqkn8aw12ynxd6pdb1ttempmdgdl',NULL,NULL),(38,11,38,'',1,_binary 'Wiki user',_binary '20190206061233',0,0,154,37,_binary 'dmbffl54mzr3ihdlp19synb7l9x7aoz',NULL,NULL),(39,13,39,_binary 'Created page with \".scaled-video img {     max-width: 75%;     height: auto;     width: auto\\9; }\"',1,_binary 'Wiki user',_binary '20190206061432',0,0,78,0,_binary '6c3d2e8s3r96bnbubmejj50hbfmqc5c',NULL,NULL),(40,11,40,'',1,_binary 'Wiki user',_binary '20190206061556',0,0,79,38,_binary '8hj5tk2wuh95ra3dsd2xh2ez0wrn734',NULL,NULL),(41,13,41,'',1,_binary 'Wiki user',_binary '20190206061845',0,0,74,39,_binary 'lw5svqcfvm82mxtqpbd7t4wm6tjcj44',NULL,NULL),(42,13,42,'',1,_binary 'Wiki user',_binary '20190206062213',0,0,66,41,_binary 'dhzsc5h4j781ukcturpkukyzvzdmrsh',NULL,NULL),(43,11,43,'',1,_binary 'Wiki user',_binary '20190206062358',0,0,61,40,_binary 'gw4r3ytz4oxdehlewzilfv8a40itpnt',NULL,NULL),(44,13,44,'',1,_binary 'Wiki user',_binary '20190206062501',0,0,35,42,_binary '8v6rrb6nwtuz07uak826s26bj3mr36y',NULL,NULL),(45,13,45,'',1,_binary 'Wiki user',_binary '20190206062510',0,0,37,44,_binary 'prv7sdccyisl88q0rdodvq3i8lcg8yp',NULL,NULL),(46,13,46,_binary 'Blanked the page',1,_binary 'Wiki user',_binary '20190206062746',0,0,0,45,_binary 'phoiac9h4m842xq45sp7s6u21eteeq1',NULL,NULL),(47,11,47,'',1,_binary 'Wiki user',_binary '20190206063947',0,0,41,43,_binary 'a5qcpr16ksiyrvi0ohn91io52pum3wy',NULL,NULL),(48,13,48,'',1,_binary 'Wiki user',_binary '20190206064236',0,0,48,46,_binary '1xbpazcxxqml0umi0nuwwyjbth6piib',NULL,NULL),(49,11,49,'',1,_binary 'Wiki user',_binary '20190206064540',0,0,54,47,_binary 'opuqg0sd5zn2gmmfcxvmpxw6pww13mn',NULL,NULL),(50,13,50,'',1,_binary 'Wiki user',_binary '20190206064558',0,0,54,48,_binary 'gy5u3mj0jugbcj0lo24r16sv0h9xp0m',NULL,NULL),(51,13,51,_binary 'Blanked the page',1,_binary 'Wiki user',_binary '20190206064734',0,0,0,50,_binary 'phoiac9h4m842xq45sp7s6u21eteeq1',NULL,NULL),(52,11,52,'',1,_binary 'Wiki user',_binary '20190206064804',0,0,41,49,_binary 'a5qcpr16ksiyrvi0ohn91io52pum3wy',NULL,NULL),(53,14,53,_binary 'Created page with \"[[File: using_secrets_keys.mp4|1000px|center]]\"',1,_binary 'Wiki user',_binary '20190206064952',0,0,46,0,_binary 's1cegvkd58t07e2gkyp5ifbqr8keehy',NULL,NULL),(54,15,54,'',1,_binary 'Wiki user',_binary '20190206065005',0,0,0,0,_binary 'phoiac9h4m842xq45sp7s6u21eteeq1',NULL,NULL),(55,16,55,_binary 'Created page with \"[[File: using_secrets_keys.mp4|1000px|center]]\"',1,_binary 'Wiki user',_binary '20190206065128',0,0,46,0,_binary 's1cegvkd58t07e2gkyp5ifbqr8keehy',NULL,NULL),(56,16,56,'',1,_binary 'Wiki user',_binary '20190206065157',0,0,55,55,_binary 't1q7nkw0knfz1mcs3f5z4kka3nvkwqg',NULL,NULL),(57,17,57,'',1,_binary 'Wiki user',_binary '20190206065207',0,0,0,0,_binary 'phoiac9h4m842xq45sp7s6u21eteeq1',NULL,NULL),(58,18,58,_binary 'Created page with \"[[File: using_custom_forms.mp4|1000px|center]]\"',1,_binary 'Wiki user',_binary '20190206065327',0,0,46,0,_binary 'qyhgrxvr7sg3dw0r8p2ctjzx1k5ktr3',NULL,NULL),(59,19,59,'',1,_binary 'Wiki user',_binary '20190206065341',0,0,0,0,_binary 'phoiac9h4m842xq45sp7s6u21eteeq1',NULL,NULL),(60,3,60,'',1,_binary 'Wiki user',_binary '20190206065833',0,0,44,22,_binary 'cuawt2y5xdvr04odayxdb9jpldefxkn',NULL,NULL),(61,20,61,_binary 'Created page with \"[[File: administring_custom_forms.mp4|1000px|center]]\"',1,_binary 'Wiki user',_binary '20190206070155',0,0,53,0,_binary 'tmbcf0owe312nnn10gk876hiz4j2xx3',NULL,NULL),(62,21,62,'',1,_binary 'Wiki user',_binary '20190206070205',0,0,0,0,_binary 'phoiac9h4m842xq45sp7s6u21eteeq1',NULL,NULL);
/*!40000 ALTER TABLE `revision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revision_actor_temp`
--

DROP TABLE IF EXISTS `revision_actor_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revision_actor_temp` (
  `revactor_rev` int(10) unsigned NOT NULL,
  `revactor_actor` bigint(20) unsigned NOT NULL,
  `revactor_timestamp` binary(14) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `revactor_page` int(10) unsigned NOT NULL,
  PRIMARY KEY (`revactor_rev`,`revactor_actor`),
  UNIQUE KEY `revactor_rev` (`revactor_rev`),
  KEY `actor_timestamp` (`revactor_actor`,`revactor_timestamp`),
  KEY `page_actor_timestamp` (`revactor_page`,`revactor_actor`,`revactor_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revision_actor_temp`
--

LOCK TABLES `revision_actor_temp` WRITE;
/*!40000 ALTER TABLE `revision_actor_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `revision_actor_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revision_comment_temp`
--

DROP TABLE IF EXISTS `revision_comment_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revision_comment_temp` (
  `revcomment_rev` int(10) unsigned NOT NULL,
  `revcomment_comment_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`revcomment_rev`,`revcomment_comment_id`),
  UNIQUE KEY `revcomment_rev` (`revcomment_rev`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revision_comment_temp`
--

LOCK TABLES `revision_comment_temp` WRITE;
/*!40000 ALTER TABLE `revision_comment_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `revision_comment_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searchindex` (
  `si_page` int(10) unsigned NOT NULL,
  `si_title` varchar(255) NOT NULL DEFAULT '',
  `si_text` mediumtext NOT NULL,
  UNIQUE KEY `si_page` (`si_page`),
  FULLTEXT KEY `si_title` (`si_title`),
  FULLTEXT KEY `si_text` (`si_text`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
INSERT INTO `searchindex` VALUES (2,'sidebar',' * navigation ** mainpage mainpage-description ** recentchanges-urlu800 recentchanges ** randompage-urlu800 randompage ** helppage help-mediawiki * itu800 ** user support user support look here foru800 help ** administration administration * search * toolbox * languages '),(3,'administration',' * veracrypt * vpnu800 * custom forms '),(4,'veracrypt',' overview veracrypt provides au800 clinician clinician\'su800 laptop with full disk encryption. this protects theu800 data stored onu800 theu800 laptop inu800 theu800 event ofu800 thief. au800 link tou800 theu800 utility isu800 below. setup 1u800. start theu800 veracrypt utility. select create volume andu800 then encrypt theu800 system partition oru800 entire system drive . file veracrypt 1u800u82epngu800 2u800. type ofu800 system encryption normal . 3u800. area tou800 encrypt encrypt theu800 whole drive 4u800. encryption ofu800 host protected area nou800 5u800. number ofu800 operating systems single-boot 6u800. encrypt options leave default should look like theu800 following. file veracrypt 2u800u82epngu800 7u800. provide your administrative password. 8u800. youu800 will then seeu800 this some what unusual window. file veracrypt 3u800u82epngu800 system entropy randomness isu800 needed inu800 order tou800 encrypt theu800 disk inu800 au800 wayu800 that isu800 unpredictable tou800 au800 sophisticated attacker. move theu800 mouse around inu800 circles randomly until theu800 randomness meter isu800 full andu800 then click next. 9u800. click next onu800 theu800 keys generated page. backup ofu800 theu800 header andu800 master keys areu800 included inu800 theu800 rescue disk that youu800 will create later. 10u800. click next onu800 theu800 rescue disk when prompted select theu800 topu800 option iu800 have nou800 cdu800 dvdu800 burner butu800 iu800 will store theu800 rescue disk isou800 image onu800 au800 removable drive eu800u82egu800. usbu800 flash drive . 11u800. youu800 will getu800 au800 popu800 upu800 telling youu800 tou800 copy theu800 created rescue disk tou800 au800 usbu800 drive. useu800 your external hddu800. dou800 notu800 lose theu800 rescue disk. itu800 isu800 need inu800 au800 case were theu800 user forgets their password oru800 ifu800 theu800 veracrypt header becomes corrupt. 12u800. wipe mode none fastest with modern storage wiping more then once unnecessary. although there areu800 organizations that require itu800. 13u800. system encrypt pretest click test . youu800 will then need tou800 reboot. 14u800. once youu800 have logged inu800 andu800 canu800 seeu800 theu800 \"pretest completed\" page select encrypt . theu800 disk will then start encrypting this canu800 take au800 long time depending onu800 howu800 much data youu800 areu800 encrypting. inu800 some cases au800 couple ofu800 hours. 15u800. when theu800 encryption isu800 done select finish andu800 then reu800-open theu800 veracrypt utility. youu800 areu800 reu800-opening itu800 because youu800 need tou800 change theu800 password tou800 theu800 user user\'su800 password. 16u800. click select device... andu800 then pick theu800 harddisk 0u800 atu800 theu800 topu800. then volume tools - change password . have theu800 user provide there password inu800 theu800 newu800 group boxu800. change theu800 wipe mode tou800 au800 single pass. when asked dou800 notu800 create another rescue disk. emergency rescue this portion ofu800 theu800 instructions should beu800 followed inu800 theu800 event that theu800 user hasu800 forgot their password oru800 theu800 volume header isu800 corrupt. this isu800 foru800 emergencies only. ifu800 youu800 just need tou800 dou800 au800 lotu800 ofu800 work onu800 theu800 laptop while theu800 user isu800 away youu800 should have theu800 user change theu800 password tou800 au800 temp password before they leave. 1u800. burn theu800 rescue isou800 tou800 au800 cdu800 dvdu800 oru800 make au800 bootable usbu800 drive using itu800. 2u800. boot theu800 computer from theu800 rescue disk. 3u800. press f8u800 . youu800 should beu800 brought tou800 au800 menu that looks like theu800 following. file veracrypt 4u800u82epngu800 4u800. select option 3u800 restore keyu800 data volume header . provide your admin password. youu800 will beu800 asked ifu800 youu800 want tou800 modify theu800 theu800 drive. youu800 should respond with yu800 . press escu800 andu800 youu800 will beu800 taken back tou800 theu800 previous menu were youu800 canu800 decrypt theu800 drive using your admin password. '),(5,'veracrypt 1u800u82epngu800',' '),(6,'veracrypt 2u800u82epngu800',' '),(7,'veracrypt 3u800u82epngu800',' '),(8,'veracrypt 4u800u82epngu800',' '),(9,'vpnu800',' installation inu800 theu800 event that theu800 openvpn server gets destroyed. itu800 canu800 beu800 rebuilt quickly because theu800 entire installation isu800 automated through ansible. theu800 playbook isu800 located inu800 theu800 hope_matters_server_deployment repository. tou800 install itu800 first edit theu800 appropriate variables inu800 theu800 following files. hosts vars then runu800 theu800 playbook. ansible-playbook openvpnu82eymlu800 adding au800 user youu800 canu800 addu800 au800 newu800 vpnu800 user byu800 running theu800 following command asu800 root onu800 theu800 server. vpnadd below isu800 sample output. root vpnu800 # vpnadd andrew using sslu800 openssl openssl 1u800u82e1u800u82e0gu800 2u800 novu800 2017 generating au800 2048 bitu800 rsau800 private keyu800 ................................ ......................................................................................................... writing newu800 private keyu800 tou800 \' etcu800 openvpn easy-rsau800 pkiu800 private andrewu82ekeyu800u82ebttvbmzry9\' enter pemu800 pass phrase verifying - enter pemu800 pass phrase ----- using configuration from . safessl-easyrsau82ecnfu800 check that theu800 request matches theu800 signature signature oku800 theu800 subject subject\'su800 distinguished name isu800 asu800 follows commonname asnu800u82e1u800 12u800 \'andrew\' certificate isu800 tou800 beu800 certified until febu800 3u800 04u800 36u800 35u800 2029 gmtu800 3650 days write outu800 database with 1u800 newu800 entries data base updated client andrew added configuration isu800 available atu800 root andrewu82eovpn notice howu800 theu800 script tells youu800 theu800 location ofu800 theu800 config atu800 theu800 endu800. youu800 need tou800 provide au800 copy ofu800 this config tou800 theu800 client sou800 that they canu800 connect. removing au800 user vpndel below isu800 sample output. root vpnu800 # vpndel select theu800 existing client certificate youu800 want tou800 revoke 1u800 admin 2u800 andrew select oneu800 client 1u800-2u800 2u800 using configuration from . safessl-easyrsau82ecnfu800 revoking certificate 33a330271bc7f092cc0bbe49dd5978ec. data base updated using sslu800 openssl openssl 1u800u82e1u800u82e0gu800 2u800 novu800 2017 using configuration from . safessl-easyrsau82ecnfu800 anu800 updated crlu800 hasu800 been created. crlu800 file etcu800 openvpn easy-rsau800 pkiu800 crlu800u82epemu800 '),(10,'user support',' * hope matters ** secrets *** using secrets *** keys *** other options ** custom forms *** using custom forms '),(11,'using secrets',' file using_secretsu82emp4u800 1000px center '),(12,'using secretsu82emp4u800',' '),(14,'keys',' file using_secrets_keysu82emp4u800 1000px center '),(13,'commonu82ecssu800',' '),(15,'using secrets keysu82emp4u800',' '),(16,'other options',' file using_secrets_other_optionsu82emp4u800 1000px center '),(17,'using secrets other optionsu82emp4u800',' '),(18,'using custom forms',' file using_custom_formsu82emp4u800 1000px center '),(19,'using custom formsu82emp4u800',' '),(20,'custom forms',' file administring_custom_formsu82emp4u800 1000px center '),(21,'administring custom formsu82emp4u800',' ');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_identifiers`
--

DROP TABLE IF EXISTS `site_identifiers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_identifiers` (
  `si_site` int(10) unsigned NOT NULL,
  `si_type` varbinary(32) NOT NULL,
  `si_key` varbinary(32) NOT NULL,
  PRIMARY KEY (`si_type`,`si_key`),
  KEY `site_ids_site` (`si_site`),
  KEY `site_ids_key` (`si_key`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_identifiers`
--

LOCK TABLES `site_identifiers` WRITE;
/*!40000 ALTER TABLE `site_identifiers` DISABLE KEYS */;
/*!40000 ALTER TABLE `site_identifiers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_stats`
--

DROP TABLE IF EXISTS `site_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_stats` (
  `ss_row_id` int(10) unsigned NOT NULL,
  `ss_total_edits` bigint(20) unsigned DEFAULT NULL,
  `ss_good_articles` bigint(20) unsigned DEFAULT NULL,
  `ss_total_pages` bigint(20) unsigned DEFAULT NULL,
  `ss_users` bigint(20) unsigned DEFAULT NULL,
  `ss_active_users` bigint(20) unsigned DEFAULT NULL,
  `ss_images` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`ss_row_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_stats`
--

LOCK TABLES `site_stats` WRITE;
/*!40000 ALTER TABLE `site_stats` DISABLE KEYS */;
INSERT INTO `site_stats` VALUES (1,61,2,20,0,0,9);
/*!40000 ALTER TABLE `site_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `site_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_global_key` varbinary(32) NOT NULL,
  `site_type` varbinary(32) NOT NULL,
  `site_group` varbinary(32) NOT NULL,
  `site_source` varbinary(32) NOT NULL,
  `site_language` varbinary(32) NOT NULL,
  `site_protocol` varbinary(32) NOT NULL,
  `site_domain` varbinary(255) NOT NULL,
  `site_data` blob NOT NULL,
  `site_forward` tinyint(1) NOT NULL,
  `site_config` blob NOT NULL,
  PRIMARY KEY (`site_id`),
  UNIQUE KEY `sites_global_key` (`site_global_key`),
  KEY `sites_type` (`site_type`),
  KEY `sites_group` (`site_group`),
  KEY `sites_source` (`site_source`),
  KEY `sites_language` (`site_language`),
  KEY `sites_protocol` (`site_protocol`),
  KEY `sites_domain` (`site_domain`),
  KEY `sites_forward` (`site_forward`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slot_roles`
--

DROP TABLE IF EXISTS `slot_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slot_roles` (
  `role_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `role_name` varbinary(64) NOT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_name` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slot_roles`
--

LOCK TABLES `slot_roles` WRITE;
/*!40000 ALTER TABLE `slot_roles` DISABLE KEYS */;
INSERT INTO `slot_roles` VALUES (1,_binary 'main');
/*!40000 ALTER TABLE `slot_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slots`
--

DROP TABLE IF EXISTS `slots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slots` (
  `slot_revision_id` bigint(20) unsigned NOT NULL,
  `slot_role_id` smallint(5) unsigned NOT NULL,
  `slot_content_id` bigint(20) unsigned NOT NULL,
  `slot_origin` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`slot_revision_id`,`slot_role_id`),
  KEY `slot_revision_origin_role` (`slot_revision_id`,`slot_origin`,`slot_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slots`
--

LOCK TABLES `slots` WRITE;
/*!40000 ALTER TABLE `slots` DISABLE KEYS */;
INSERT INTO `slots` VALUES (1,1,1,1),(2,1,2,2),(3,1,3,3),(4,1,4,4),(5,1,5,5),(6,1,6,6),(7,1,7,7),(8,1,8,8),(9,1,9,9),(10,1,10,10),(11,1,11,11),(12,1,12,12),(13,1,13,13),(14,1,14,14),(15,1,15,15),(16,1,16,16),(17,1,17,17),(18,1,18,18),(19,1,19,19),(20,1,20,20),(21,1,21,21),(22,1,22,22),(23,1,23,23),(24,1,24,24),(25,1,25,25),(26,1,26,26),(27,1,27,27),(28,1,28,28),(29,1,29,29),(30,1,30,30),(31,1,31,31),(32,1,32,32),(33,1,33,33),(34,1,34,34),(35,1,35,35),(36,1,36,36),(37,1,37,37),(38,1,38,38),(39,1,39,39),(40,1,40,40),(41,1,41,41),(42,1,42,42),(43,1,43,43),(44,1,44,44),(45,1,45,45),(46,1,46,46),(47,1,47,47),(48,1,48,48),(49,1,49,49),(50,1,50,50),(51,1,51,51),(52,1,52,52),(53,1,53,53),(54,1,54,54),(55,1,55,55),(56,1,56,56),(57,1,57,57),(58,1,58,58),(59,1,59,59),(60,1,60,60),(61,1,61,61),(62,1,62,62);
/*!40000 ALTER TABLE `slots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_summary`
--

DROP TABLE IF EXISTS `tag_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag_summary` (
  `ts_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts_rc_id` int(11) DEFAULT NULL,
  `ts_log_id` int(10) unsigned DEFAULT NULL,
  `ts_rev_id` int(10) unsigned DEFAULT NULL,
  `ts_tags` blob NOT NULL,
  PRIMARY KEY (`ts_id`),
  UNIQUE KEY `tag_summary_rc_id` (`ts_rc_id`),
  UNIQUE KEY `tag_summary_log_id` (`ts_log_id`),
  UNIQUE KEY `tag_summary_rev_id` (`ts_rev_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_summary`
--

LOCK TABLES `tag_summary` WRITE;
/*!40000 ALTER TABLE `tag_summary` DISABLE KEYS */;
INSERT INTO `tag_summary` VALUES (1,45,NULL,46,_binary 'mw-blank'),(2,50,NULL,51,_binary 'mw-blank');
/*!40000 ALTER TABLE `tag_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templatelinks`
--

DROP TABLE IF EXISTS `templatelinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templatelinks` (
  `tl_from` int(10) unsigned NOT NULL DEFAULT '0',
  `tl_from_namespace` int(11) NOT NULL DEFAULT '0',
  `tl_namespace` int(11) NOT NULL DEFAULT '0',
  `tl_title` varbinary(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`tl_from`,`tl_namespace`,`tl_title`),
  KEY `tl_namespace` (`tl_namespace`,`tl_title`,`tl_from`),
  KEY `tl_backlinks_namespace` (`tl_from_namespace`,`tl_namespace`,`tl_title`,`tl_from`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templatelinks`
--

LOCK TABLES `templatelinks` WRITE;
/*!40000 ALTER TABLE `templatelinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `templatelinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `text`
--

DROP TABLE IF EXISTS `text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `text` (
  `old_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `old_text` mediumblob NOT NULL,
  `old_flags` tinyblob NOT NULL,
  PRIMARY KEY (`old_id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=binary MAX_ROWS=10000000 AVG_ROW_LENGTH=10240;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `text`
--

LOCK TABLES `text` WRITE;
/*!40000 ALTER TABLE `text` DISABLE KEYS */;
INSERT INTO `text` VALUES (1,_binary '<strong>MediaWiki has been installed.</strong>\n\nConsult the [https://www.mediawiki.org/wiki/Special:MyLanguage/Help:Contents User\'s Guide] for information on using the wiki software.\n\n== Getting started ==\n* [https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:Configuration_settings Configuration settings list]\n* [https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:FAQ MediaWiki FAQ]\n* [https://lists.wikimedia.org/mailman/listinfo/mediawiki-announce MediaWiki release mailing list]\n* [https://www.mediawiki.org/wiki/Special:MyLanguage/Localisation#Translation_resources Localise MediaWiki for your language]\n* [https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:Combating_spam Learn how to combat spam on your wiki]',_binary 'utf-8'),(2,_binary '\n* navigation\n** mainpage|mainpage-description\n** recentchanges-url|recentchanges\n* new heading\n** randompage-url|randompage\n** helppage|help-mediawiki\n* SEARCH\n* TOOLBOX\n* LANGUAGES',_binary 'utf-8'),(3,_binary '\n* navigation\n** mainpage|mainpage-description\n** recentchanges-url|recentchanges\n** randompage-url|randompage\n** helppage|help-mediawiki\n* IT\n** User support (look here for help)\n** Administation\n* SEARCH\n* TOOLBOX\n* LANGUAGES',_binary 'utf-8'),(4,_binary '\n* navigation\n** mainpage|mainpage-description\n** recentchanges-url|recentchanges\n** randompage-url|randompage\n** helppage|help-mediawiki\n* IT\n** User support (look here for help)\n** Administration|Administration\n* SEARCH\n* TOOLBOX\n* LANGUAGES',_binary 'utf-8'),(5,_binary '\n* navigation\n** mainpage|mainpage-description\n** recentchanges-url|recentchanges\n** randompage-url|randompage\n** helppage|help-mediawiki\n* IT\n** User support|User support (look here for help)\n** Administration|Administration\n* SEARCH\n* TOOLBOX\n* LANGUAGES',_binary 'utf-8'),(6,_binary '\n* navigation\n** mainpage|mainpage-description\n** recentchanges-url|recentchanges\n** randompage-url|randompage\n** helppage|help-mediawiki\n* IT\n** User Support|User Support (look here for help)\n** Administration|Administration\n* SEARCH\n* TOOLBOX\n* LANGUAGES',_binary 'utf-8'),(7,_binary '* VeraCrypt',_binary 'utf-8'),(8,_binary '* [[VeraCrypt]]',_binary 'utf-8'),(9,_binary '<h2>Overview</h2>\n\nVeraCrypt provides a clinician\'s laptop with full disk encryption. This protects the data stored on the laptop in the event of thief. The link to the utility is below.\n\nhttps://www.veracrypt.fr/en/Downloads.html\n\n<h2>Setup</h2>\n\n1. Start the VeraCrypt utility. Select <b>Create Volume</b> and then <b>Encrypt the system partition or entire system drive</b>.',_binary 'utf-8'),(10,'',_binary 'utf-8'),(11,_binary '<h2>Overview</h2>\n\nVeraCrypt provides a clinician\'s laptop with full disk encryption. This protects the data stored on the laptop in the event of thief. The link to the utility is below.\n\nhttps://www.veracrypt.fr/en/Downloads.html\n\n<h2>Setup</h2>\n\n1. Start the VeraCrypt utility. Select <b>Create Volume</b> and then <b>Encrypt the system partition or entire system drive</b>.\n[[File:Veracrypt 1.png]]',_binary 'utf-8'),(12,_binary '<h2>Overview</h2>\n\nVeraCrypt provides a clinician\'s laptop with full disk encryption. This protects the data stored on the laptop in the event of thief. The link to the utility is below.\n\nhttps://www.veracrypt.fr/en/Downloads.html\n\n<h2>Setup</h2>\n\n1. Start the VeraCrypt utility. Select <b>Create Volume</b> and then <b>Encrypt the system partition or entire system drive</b>.\n\n[[File:Veracrypt 1.png]]\n\n2. Type of system Encryption, <b>normal</b>.\n\n3. Area to Encrypt, <b>Encrypt the whole drive</b>\n\n4. Encryption of Host Protected Area, <b>no</b>\n\n5. Number of Operating Systems, <b>Single-boot</b>\n\n6.',_binary 'utf-8'),(13,_binary '<h2>Overview</h2>\n\nVeraCrypt provides a clinician\'s laptop with full disk encryption. This protects the data stored on the laptop in the event of thief. The link to the utility is below.\n\nhttps://www.veracrypt.fr/en/Downloads.html\n\n<h2>Setup</h2>\n\n1. Start the VeraCrypt utility. Select <b>Create Volume</b> and then <b>Encrypt the system partition or entire system drive</b>.\n\n[[File:Veracrypt 1.png]]\n\n2. Type of system Encryption, <b>normal</b>.\n\n3. Area to Encrypt, <b>Encrypt the whole drive</b>\n\n4. Encryption of Host Protected Area, <b>no</b>\n\n5. Number of Operating Systems, <b>Single-boot</b>\n\n6. Encrypt Options, leave default, should look like the following.\n\n[[File:Veracrypt 2.png]]',_binary 'utf-8'),(14,'',_binary 'utf-8'),(15,_binary '<h2>Overview</h2>\n\nVeraCrypt provides a clinician\'s laptop with full disk encryption. This protects the data stored on the laptop in the event of thief. The link to the utility is below.\n\nhttps://www.veracrypt.fr/en/Downloads.html\n\n<h2>Setup</h2>\n\n1. Start the VeraCrypt utility. Select <b>Create Volume</b> and then <b>Encrypt the system partition or entire system drive</b>.\n\n[[File:Veracrypt 1.png]]\n\n2. Type of system Encryption, <b>normal</b>.\n\n3. Area to Encrypt, <b>Encrypt the whole drive</b>\n\n4. Encryption of Host Protected Area, <b>no</b>\n\n5. Number of Operating Systems, <b>Single-boot</b>\n\n6. Encrypt Options, leave default, should look like the following.\n\n[[File:Veracrypt 2.png]]\n\n7. Provide your administrative password.\n\n8. You will then see this some what unusual window.\n\n[[File:Veracrypt 3.png]]\n\nSystem entropy/randomness is needed in order to encrypt the disk in a way that is unpredictable to a sophisticated attacker. Move the mouse around in circles randomly until the randomness meter is full and then click next.\n\n9. Click next on the Keys Generated page. Backup of the header and master keys are included in the rescue disk that you will create later. \n\n10. Click next on the rescue disk, when prompted select the top option, <b>I have no CD/DVD burner but I will store the Rescue Disk ISO image on a removable drive (e.g. USB flash drive)</b>.\n\n11.',_binary 'utf-8'),(16,'',_binary 'utf-8'),(17,_binary '<h2>Overview</h2>\n\nVeraCrypt provides a clinician\'s laptop with full disk encryption. This protects the data stored on the laptop in the event of thief. The link to the utility is below.\n\nhttps://www.veracrypt.fr/en/Downloads.html\n\n<h2>Setup</h2>\n\n1. Start the VeraCrypt utility. Select <b>Create Volume</b> and then <b>Encrypt the system partition or entire system drive</b>.\n\n[[File:Veracrypt 1.png]]\n\n2. Type of system Encryption, <b>normal</b>.\n\n3. Area to Encrypt, <b>Encrypt the whole drive</b>\n\n4. Encryption of Host Protected Area, <b>no</b>\n\n5. Number of Operating Systems, <b>Single-boot</b>\n\n6. Encrypt Options, leave default, should look like the following.\n\n[[File:Veracrypt 2.png]]\n\n7. Provide your administrative password.\n\n8. You will then see this some what unusual window.\n\n[[File:Veracrypt 3.png]]\n\nSystem entropy/randomness is needed in order to encrypt the disk in a way that is unpredictable to a sophisticated attacker. Move the mouse around in circles randomly until the randomness meter is full and then click next.\n\n9. Click next on the Keys Generated page. Backup of the header and master keys are included in the rescue disk that you will create later. \n\n10. Click next on the rescue disk, when prompted select the top option, <b>I have no CD/DVD burner but I will store the Rescue Disk ISO image on a removable drive (e.g. USB flash drive)</b>.\n\n11. You will get a pop up telling you to copy the created rescue disk to a USB drive. Use your external HDD. Do not lose the rescue disk. It is need in a case were the user forgets their password or if the VeraCrypt header becomes corrupt.\n\n12. Wipe Mode, <b>None (fastest)</b>, with modern storage wiping more then once unnecessary. Although, there are organizations that require it. \n\n13. System Encrypt Pretest, click <b>Test</b>. You will then need to reboot.\n\n14. Once you have logged in and can see the \"Pretest Completed\" page, select <b>Encrypt</b>. The disk will then start encrypting, this can take a long time depending on how much data you are encrypting. In some cases, a couple of hours.\n\n15. When the encryption is done, select <b>Finish</b> and then re-open the VeraCrypt utility.',_binary 'utf-8'),(18,_binary '<h2>Overview</h2>\n\nVeraCrypt provides a clinician\'s laptop with full disk encryption. This protects the data stored on the laptop in the event of thief. The link to the utility is below.\n\nhttps://www.veracrypt.fr/en/Downloads.html\n\n<h2>Setup</h2>\n\n1. Start the VeraCrypt utility. Select <b>Create Volume</b> and then <b>Encrypt the system partition or entire system drive</b>.\n\n[[File:Veracrypt 1.png]]\n\n2. Type of system Encryption, <b>normal</b>.\n\n3. Area to Encrypt, <b>Encrypt the whole drive</b>\n\n4. Encryption of Host Protected Area, <b>no</b>\n\n5. Number of Operating Systems, <b>Single-boot</b>\n\n6. Encrypt Options, leave default, should look like the following.\n\n[[File:Veracrypt 2.png]]\n\n7. Provide your administrative password.\n\n8. You will then see this some what unusual window.\n\n[[File:Veracrypt 3.png]]\n\nSystem entropy/randomness is needed in order to encrypt the disk in a way that is unpredictable to a sophisticated attacker. Move the mouse around in circles randomly until the randomness meter is full and then click next.\n\n9. Click next on the Keys Generated page. Backup of the header and master keys are included in the rescue disk that you will create later. \n\n10. Click next on the rescue disk, when prompted select the top option, <b>I have no CD/DVD burner but I will store the Rescue Disk ISO image on a removable drive (e.g. USB flash drive)</b>.\n\n11. You will get a pop up telling you to copy the created rescue disk to a USB drive. Use your external HDD. Do not lose the rescue disk. It is need in a case were the user forgets their password or if the VeraCrypt header becomes corrupt.\n\n12. Wipe Mode, <b>None (fastest)</b>, with modern storage wiping more then once unnecessary. Although, there are organizations that require it. \n\n13. System Encrypt Pretest, click <b>Test</b>. You will then need to reboot.\n\n14. Once you have logged in and can see the \"Pretest Completed\" page, select <b>Encrypt</b>. The disk will then start encrypting, this can take a long time depending on how much data you are encrypting. In some cases, a couple of hours.\n\n15. When the encryption is done, select <b>Finish</b> and then re-open the VeraCrypt utility. You are re-opening it because you need to change the password to the user\'s password.\n\n16. Click <b>Select Device...</b> and then pick the Harddisk 0 at the top. Then, <b>Volume Tools</b>-><b>Change Password</b>. Have the user provide there password in the new group box. Change the wipe mode to a single pass. When asked do not create another rescue disk.',_binary 'utf-8'),(19,_binary '<h2>Overview</h2>\n\nVeraCrypt provides a clinician\'s laptop with full disk encryption. This protects the data stored on the laptop in the event of thief. The link to the utility is below.\n\nhttps://www.veracrypt.fr/en/Downloads.html\n\n<h2>Setup</h2>\n\n1. Start the VeraCrypt utility. Select <b>Create Volume</b> and then <b>Encrypt the system partition or entire system drive</b>.\n\n[[File:Veracrypt 1.png]]\n\n2. Type of system Encryption, <b>normal</b>.\n\n3. Area to Encrypt, <b>Encrypt the whole drive</b>\n\n4. Encryption of Host Protected Area, <b>no</b>\n\n5. Number of Operating Systems, <b>Single-boot</b>\n\n6. Encrypt Options, leave default, should look like the following.\n\n[[File:Veracrypt 2.png]]\n\n7. Provide your administrative password.\n\n8. You will then see this some what unusual window.\n\n[[File:Veracrypt 3.png]]\n\nSystem entropy/randomness is needed in order to encrypt the disk in a way that is unpredictable to a sophisticated attacker. Move the mouse around in circles randomly until the randomness meter is full and then click next.\n\n9. Click next on the Keys Generated page. Backup of the header and master keys are included in the rescue disk that you will create later. \n\n10. Click next on the rescue disk, when prompted select the top option, <b>I have no CD/DVD burner but I will store the Rescue Disk ISO image on a removable drive (e.g. USB flash drive)</b>.\n\n11. You will get a pop up telling you to copy the created rescue disk to a USB drive. Use your external HDD. Do not lose the rescue disk. It is need in a case were the user forgets their password or if the VeraCrypt header becomes corrupt.\n\n12. Wipe Mode, <b>None (fastest)</b>, with modern storage wiping more then once unnecessary. Although, there are organizations that require it. \n\n13. System Encrypt Pretest, click <b>Test</b>. You will then need to reboot.\n\n14. Once you have logged in and can see the \"Pretest Completed\" page, select <b>Encrypt</b>. The disk will then start encrypting, this can take a long time depending on how much data you are encrypting. In some cases, a couple of hours.\n\n15. When the encryption is done, select <b>Finish</b> and then re-open the VeraCrypt utility. You are re-opening it because you need to change the password to the user\'s password.\n\n16. Click <b>Select Device...</b> and then pick the Harddisk 0 at the top. Then, <b>Volume Tools</b>-><b>Change Password</b>. Have the user provide there password in the new group box. Change the wipe mode to a single pass. When asked do not create another rescue disk.\n\n<h2>Emergency Rescue</h2>\n\nThis portion of the instructions should be followed in the event that the user has forgot their password or the volume header is corrupt. <b>This is for emergencies only. If you just need to do a lot of work on the laptop while the user is away, you should have the user change the password to a temp password before they leave.</b>\n\n1. Burn the rescue iso to a cd/dvd or make a bootable USB drive using it.\n\n2. Boot the computer from the rescue disk. \n\n3. Press <b>F8</b>. You should be brought to a menu that looks like the following.\n\n[[File:Veracrypt 4.png]]\n\n4. Select option 3, <b>Restore key data (volume header)</b>. Provide your admin password. You will be asked if you want to modify the the drive. You should respond with <b>y</b>. Press esc, and you will be taken back to the previous menu were you can decrypt the drive using your admin password.',_binary 'utf-8'),(20,_binary '<h2>Overview</h2>\n\nVeraCrypt provides a clinician\'s laptop with full disk encryption. This protects the data stored on the laptop in the event of thief. A link to the utility is below.\n\nhttps://www.veracrypt.fr/en/Downloads.html\n\n<h2>Setup</h2>\n\n1. Start the VeraCrypt utility. Select <b>Create Volume</b> and then <b>Encrypt the system partition or entire system drive</b>.\n\n[[File:Veracrypt 1.png]]\n\n2. Type of system Encryption, <b>normal</b>.\n\n3. Area to Encrypt, <b>Encrypt the whole drive</b>\n\n4. Encryption of Host Protected Area, <b>no</b>\n\n5. Number of Operating Systems, <b>Single-boot</b>\n\n6. Encrypt Options, leave default, should look like the following.\n\n[[File:Veracrypt 2.png]]\n\n7. Provide your administrative password.\n\n8. You will then see this some what unusual window.\n\n[[File:Veracrypt 3.png]]\n\nSystem entropy/randomness is needed in order to encrypt the disk in a way that is unpredictable to a sophisticated attacker. Move the mouse around in circles randomly until the randomness meter is full and then click next.\n\n9. Click next on the Keys Generated page. Backup of the header and master keys are included in the rescue disk that you will create later. \n\n10. Click next on the rescue disk, when prompted select the top option, <b>I have no CD/DVD burner but I will store the Rescue Disk ISO image on a removable drive (e.g. USB flash drive)</b>.\n\n11. You will get a pop up telling you to copy the created rescue disk to a USB drive. Use your external HDD. Do not lose the rescue disk. It is need in a case were the user forgets their password or if the VeraCrypt header becomes corrupt.\n\n12. Wipe Mode, <b>None (fastest)</b>, with modern storage wiping more then once unnecessary. Although, there are organizations that require it. \n\n13. System Encrypt Pretest, click <b>Test</b>. You will then need to reboot.\n\n14. Once you have logged in and can see the \"Pretest Completed\" page, select <b>Encrypt</b>. The disk will then start encrypting, this can take a long time depending on how much data you are encrypting. In some cases, a couple of hours.\n\n15. When the encryption is done, select <b>Finish</b> and then re-open the VeraCrypt utility. You are re-opening it because you need to change the password to the user\'s password.\n\n16. Click <b>Select Device...</b> and then pick the Harddisk 0 at the top. Then, <b>Volume Tools</b>-><b>Change Password</b>. Have the user provide there password in the new group box. Change the wipe mode to a single pass. When asked do not create another rescue disk.\n\n<h2>Emergency Rescue</h2>\n\nThis portion of the instructions should be followed in the event that the user has forgot their password or the volume header is corrupt. <b>This is for emergencies only. If you just need to do a lot of work on the laptop while the user is away, you should have the user change the password to a temp password before they leave.</b>\n\n1. Burn the rescue iso to a cd/dvd or make a bootable USB drive using it.\n\n2. Boot the computer from the rescue disk. \n\n3. Press <b>F8</b>. You should be brought to a menu that looks like the following.\n\n[[File:Veracrypt 4.png]]\n\n4. Select option 3, <b>Restore key data (volume header)</b>. Provide your admin password. You will be asked if you want to modify the the drive. You should respond with <b>y</b>. Press esc, and you will be taken back to the previous menu were you can decrypt the drive using your admin password.',_binary 'utf-8'),(21,'',_binary 'utf-8'),(22,_binary '* [[VeraCrypt]]\n* [[VPN]]',_binary 'utf-8'),(23,_binary '<h2>Installation</h2>\n\nIn the event that the openvpn server gets destroyed. It can be rebuilt quickly because the entire installation is automated through ansible. The playbook is located in the hope_matters_server_deployment repository. \n\nTo install, it first edit the appropriate variables in the following files.\n\nhosts\nvars\n\nThen run the playbook.\n\nansible-playbook openvpn.yml\n\n<h2>Adding a user</h2>\n\nYou can add a new vpn user by running the following command as root on the server.\n\nvpnadd <user>\n\nBelow is sample output.',_binary 'utf-8'),(24,_binary '<h2>Installation</h2>\n\nIn the event that the openvpn server gets destroyed. It can be rebuilt quickly because the entire installation is automated through ansible. The playbook is located in the hope_matters_server_deployment repository. \n\nTo install, it first edit the appropriate variables in the following files.\n\nhosts\nvars\n\nThen run the playbook.\n\nansible-playbook openvpn.yml\n\n\n<source lang=\"javascript\" line start=\"2\" highlight=\"4-6\">\n// SyntaxHighlighter makes your code snippets beautiful without tiring your servers.\n// http://alexgorbatchev.com\nvar setArray = function(elems) {\n    this.length = 0;\n    push.apply(this, elems);\n    return this;\n}\n</source>\n\n<h2>Adding a user</h2>\n\nYou can add a new vpn user by running the following command as root on the server.\n\nvpnadd <user>\n\nBelow is sample output.',_binary 'utf-8'),(25,_binary '<h2>Installation</h2>\n\nIn the event that the openvpn server gets destroyed. It can be rebuilt quickly because the entire installation is automated through ansible. The playbook is located in the hope_matters_server_deployment repository. \n\nTo install, it first edit the appropriate variables in the following files.\n\nhosts\nvars\n\nThen run the playbook.\n\n<syntaxhighlight>\nansible-playbook openvpn.yml\n</syntaxhighlight>\n\n<h2>Adding a user</h2>\n\nYou can add a new vpn user by running the following command as root on the server.\n\n<syntaxhighlight>\nvpnadd <user>\n</syntaxhighlight>\n\nBelow is sample output.\n\n<syntaxhighlight>\nroot@vpn:~# vpnadd andrew\n\nUsing SSL: openssl OpenSSL 1.1.0g  2 Nov 2017\nGenerating a 2048 bit RSA private key\n................................+++\n.........................................................................................................+++\nwriting new private key to \'/etc/openvpn/easy-rsa/pki/private/andrew.key.BttvBmZRy9\'\nEnter PEM pass phrase:\nVerifying - Enter PEM pass phrase:\n-----\nUsing configuration from ./safessl-easyrsa.cnf\nCheck that the request matches the signature\nSignature ok\nThe Subject\'s Distinguished Name is as follows\ncommonName            :ASN.1 12:\'andrew\'\nCertificate is to be certified until Feb  3 04:36:35 2029 GMT (3650 days)\n\nWrite out database with 1 new entries\nData Base Updated\n\nClient andrew added, configuration is available at: /root/andrew.ovpn\n</syntaxhighlight>',_binary 'utf-8'),(26,_binary '<h2>Installation</h2>\n\nIn the event that the openvpn server gets destroyed. It can be rebuilt quickly because the entire installation is automated through ansible. The playbook is located in the hope_matters_server_deployment repository. \n\nTo install, it first edit the appropriate variables in the following files.\n\nhosts\nvars\n\nThen run the playbook.\n\n<syntaxhighlight lang=>\nansible-playbook openvpn.yml\n</syntaxhighlight>\n\n<h2>Adding a user</h2>\n\nYou can add a new vpn user by running the following command as root on the server.\n\n<syntaxhighlight lang=>\nvpnadd <user>\n</syntaxhighlight>\n\nBelow is sample output.\n\n<syntaxhighlight lang=>\nroot@vpn:~# vpnadd andrew\n\nUsing SSL: openssl OpenSSL 1.1.0g  2 Nov 2017\nGenerating a 2048 bit RSA private key\n................................+++\n.........................................................................................................+++\nwriting new private key to \'/etc/openvpn/easy-rsa/pki/private/andrew.key.BttvBmZRy9\'\nEnter PEM pass phrase:\nVerifying - Enter PEM pass phrase:\n-----\nUsing configuration from ./safessl-easyrsa.cnf\nCheck that the request matches the signature\nSignature ok\nThe Subject\'s Distinguished Name is as follows\ncommonName            :ASN.1 12:\'andrew\'\nCertificate is to be certified until Feb  3 04:36:35 2029 GMT (3650 days)\n\nWrite out database with 1 new entries\nData Base Updated\n\nClient andrew added, configuration is available at: /root/andrew.ovpn\n</syntaxhighlight>',_binary 'utf-8'),(27,_binary '<h2>Installation</h2>\n\nIn the event that the openvpn server gets destroyed. It can be rebuilt quickly because the entire installation is automated through ansible. The playbook is located in the hope_matters_server_deployment repository. \n\nTo install, it first edit the appropriate variables in the following files.\n\nhosts\nvars\n\nThen run the playbook.\n\n<syntaxhighlight lang=\"\">\nansible-playbook openvpn.yml\n</syntaxhighlight>\n\n<h2>Adding a user</h2>\n\nYou can add a new vpn user by running the following command as root on the server.\n\n<syntaxhighlight lang=\"\">\nvpnadd <user>\n</syntaxhighlight>\n\nBelow is sample output.\n\n<syntaxhighlight lang=\"\">\nroot@vpn:~# vpnadd andrew\n\nUsing SSL: openssl OpenSSL 1.1.0g  2 Nov 2017\nGenerating a 2048 bit RSA private key\n................................+++\n.........................................................................................................+++\nwriting new private key to \'/etc/openvpn/easy-rsa/pki/private/andrew.key.BttvBmZRy9\'\nEnter PEM pass phrase:\nVerifying - Enter PEM pass phrase:\n-----\nUsing configuration from ./safessl-easyrsa.cnf\nCheck that the request matches the signature\nSignature ok\nThe Subject\'s Distinguished Name is as follows\ncommonName            :ASN.1 12:\'andrew\'\nCertificate is to be certified until Feb  3 04:36:35 2029 GMT (3650 days)\n\nWrite out database with 1 new entries\nData Base Updated\n\nClient andrew added, configuration is available at: /root/andrew.ovpn\n</syntaxhighlight>',_binary 'utf-8'),(28,_binary '<h2>Installation</h2>\n\nIn the event that the openvpn server gets destroyed. It can be rebuilt quickly because the entire installation is automated through ansible. The playbook is located in the hope_matters_server_deployment repository. \n\nTo install, it first edit the appropriate variables in the following files.\n\nhosts\nvars\n\nThen run the playbook.\n\n<syntaxhighlight lang=\"Python\">\nansible-playbook openvpn.yml\n</syntaxhighlight>\n\n<h2>Adding a user</h2>\n\nYou can add a new vpn user by running the following command as root on the server.\n\n<syntaxhighlight lang=\"Python\">\nvpnadd <user>\n</syntaxhighlight>\n\nBelow is sample output.\n\n<syntaxhighlight lang=\"Python\">\nroot@vpn:~# vpnadd andrew\n\nUsing SSL: openssl OpenSSL 1.1.0g  2 Nov 2017\nGenerating a 2048 bit RSA private key\n................................+++\n.........................................................................................................+++\nwriting new private key to \'/etc/openvpn/easy-rsa/pki/private/andrew.key.BttvBmZRy9\'\nEnter PEM pass phrase:\nVerifying - Enter PEM pass phrase:\n-----\nUsing configuration from ./safessl-easyrsa.cnf\nCheck that the request matches the signature\nSignature ok\nThe Subject\'s Distinguished Name is as follows\ncommonName            :ASN.1 12:\'andrew\'\nCertificate is to be certified until Feb  3 04:36:35 2029 GMT (3650 days)\n\nWrite out database with 1 new entries\nData Base Updated\n\nClient andrew added, configuration is available at: /root/andrew.ovpn\n</syntaxhighlight>',_binary 'utf-8'),(29,_binary '<h2>Installation</h2>\n\nIn the event that the openvpn server gets destroyed. It can be rebuilt quickly because the entire installation is automated through ansible. The playbook is located in the hope_matters_server_deployment repository. \n\nTo install, it first edit the appropriate variables in the following files.\n\nhosts\nvars\n\nThen run the playbook.\n\n<syntaxhighlight lang=\"bash\">\nansible-playbook openvpn.yml\n</syntaxhighlight>\n\n<h2>Adding a user</h2>\n\nYou can add a new vpn user by running the following command as root on the server.\n\n<syntaxhighlight lang=\"bash\">\nvpnadd <user>\n</syntaxhighlight>\n\nBelow is sample output.\n\n<syntaxhighlight lang=\"bash\">\nroot@vpn:~# vpnadd andrew\n\nUsing SSL: openssl OpenSSL 1.1.0g  2 Nov 2017\nGenerating a 2048 bit RSA private key\n................................+++\n.........................................................................................................+++\nwriting new private key to \'/etc/openvpn/easy-rsa/pki/private/andrew.key.BttvBmZRy9\'\nEnter PEM pass phrase:\nVerifying - Enter PEM pass phrase:\n-----\nUsing configuration from ./safessl-easyrsa.cnf\nCheck that the request matches the signature\nSignature ok\nThe Subject\'s Distinguished Name is as follows\ncommonName            :ASN.1 12:\'andrew\'\nCertificate is to be certified until Feb  3 04:36:35 2029 GMT (3650 days)\n\nWrite out database with 1 new entries\nData Base Updated\n\nClient andrew added, configuration is available at: /root/andrew.ovpn\n</syntaxhighlight>',_binary 'utf-8'),(30,_binary '<h2>Installation</h2>\n\nIn the event that the openvpn server gets destroyed. It can be rebuilt quickly because the entire installation is automated through ansible. The playbook is located in the hope_matters_server_deployment repository. \n\nTo install, it first edit the appropriate variables in the following files.\n\nhosts\nvars\n\nThen run the playbook.\n\n<syntaxhighlight lang=\"bash\">\nansible-playbook openvpn.yml\n</syntaxhighlight>\n\n<h2>Adding a user</h2>\n\nYou can add a new vpn user by running the following command as root on the server.\n\n<syntaxhighlight lang=\"bash\">\nvpnadd <user>\n</syntaxhighlight>\n\nBelow is sample output.\n\n<syntaxhighlight lang=\"bash\">\nroot@vpn:~# vpnadd andrew\n\nUsing SSL: openssl OpenSSL 1.1.0g  2 Nov 2017\nGenerating a 2048 bit RSA private key\n................................+++\n.........................................................................................................+++\nwriting new private key to \'/etc/openvpn/easy-rsa/pki/private/andrew.key.BttvBmZRy9\'\nEnter PEM pass phrase:\nVerifying - Enter PEM pass phrase:\n-----\nUsing configuration from ./safessl-easyrsa.cnf\nCheck that the request matches the signature\nSignature ok\nThe Subject\'s Distinguished Name is as follows\ncommonName            :ASN.1 12:\'andrew\'\nCertificate is to be certified until Feb  3 04:36:35 2029 GMT (3650 days)\n\nWrite out database with 1 new entries\nData Base Updated\n\nClient andrew added, configuration is available at: /root/andrew.ovpn\n</syntaxhighlight>\n\nNotice how the script tells you the location of the config at the end. You need to provide a copy of this config to the client so that they can connect.\n\n<h2>Removing a user</h2>\n\n<syntaxhighlight lang=\"bash\">\nvpndel\n</syntaxhighlight>\n\nBelow is sample output.\n\n<syntaxhighlight lang=\"bash\">\nroot@vpn:~# vpndel\n\nSelect the existing client certificate you want to revoke:\n     1) admin\n     2) andrew\nSelect one client [1-2]: 2\n\nUsing configuration from ./safessl-easyrsa.cnf\nRevoking Certificate 33A330271BC7F092CC0BBE49DD5978EC.\nData Base Updated\n\nUsing SSL: openssl OpenSSL 1.1.0g  2 Nov 2017\nUsing configuration from ./safessl-easyrsa.cnf\n\nAn updated CRL has been created.\nCRL file: /etc/openvpn/easy-rsa/pki/crl.pem\n</syntaxhighlight>',_binary 'utf-8'),(31,_binary '* Hope Matters\n** Secrets\n*** Using Secrets\n*** Keys\n*** Other Options\n** Custom Forms\n*** Using Custom Forms',_binary 'utf-8'),(32,_binary '* Hope Matters\n** Secrets\n*** [[Using Secrets]]\n*** [[Keys]]\n*** [[Other Options]]\n** Custom Forms\n*** [[Using Custom Forms]]',_binary 'utf-8'),(33,_binary '[[File:using_secrets.mp4]]',_binary 'utf-8'),(34,'',_binary 'utf-8'),(35,_binary '[[File:using_secrets.mp4|middle|720x480]]',_binary 'utf-8'),(36,_binary '[[File:using_secrets.mp4|center|1200px]]',_binary 'utf-8'),(37,_binary '[[File:using_secrets.mp4|1000x350px]]',_binary 'utf-8'),(38,_binary '<div class=\"topbanner\">\n[[File: using_secrets.mp4|frameless|1800px|]]\n</div>\n\n.topbanner img {\n    max-width: 100%;\n    height: auto;\n    width: auto\\9;\n}',_binary 'utf-8'),(39,_binary '.scaled-video img {\n    max-width: 75%;\n    height: auto;\n    width: auto\\9;\n}',_binary 'utf-8'),(40,_binary '<div class=\"scaled-video\">\n[[File: using_secrets.mp4|frameless|1800px|]]\n</div>',_binary 'utf-8'),(41,_binary '.scaled-video {\n    max-width: 75%;\n    height: auto;\n    width: auto\\9;\n}',_binary 'utf-8'),(42,_binary 'video {\n    max-width: 75%;\n    height: auto;\n    width: auto\\9;\n}',_binary 'utf-8'),(43,_binary '<div class=\"scaled-video\">\n[[File: using_secrets.mp4]]\n</div>',_binary 'utf-8'),(44,_binary '.scaled-video {\n    height: 1000;\n}',_binary 'utf-8'),(45,_binary '.scaled-video {\n    height: 1000px;\n}',_binary 'utf-8'),(46,'',_binary 'utf-8'),(47,_binary '[[File: using_secrets.mp4|1000px|center]]',_binary 'utf-8'),(48,_binary 'video {\n    height: 1080px;\n    width: 1920px;\n}',_binary 'utf-8'),(49,_binary '\n<div class=\"temp\">\n[[File: using_secrets.mp4]]\n</div>',_binary 'utf-8'),(50,_binary '.temp video {\n    height: 1080px;\n    width: 1920px;\n}',_binary 'utf-8'),(51,'',_binary 'utf-8'),(52,_binary '[[File: using_secrets.mp4|1000px|center]]',_binary 'utf-8'),(53,_binary '[[File: using_secrets_keys.mp4|1000px|center]]',_binary 'utf-8'),(54,'',_binary 'utf-8'),(55,_binary '[[File: using_secrets_keys.mp4|1000px|center]]',_binary 'utf-8'),(56,_binary '[[File: using_secrets_other_options.mp4|1000px|center]]',_binary 'utf-8'),(57,'',_binary 'utf-8'),(58,_binary '[[File: using_custom_forms.mp4|1000px|center]]',_binary 'utf-8'),(59,'',_binary 'utf-8'),(60,_binary '* [[VeraCrypt]]\n* [[VPN]]\n* [[Custom Forms]]',_binary 'utf-8'),(61,_binary '[[File: administring_custom_forms.mp4|1000px|center]]',_binary 'utf-8'),(62,'',_binary 'utf-8');
/*!40000 ALTER TABLE `text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `updatelog`
--

DROP TABLE IF EXISTS `updatelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updatelog` (
  `ul_key` varbinary(255) NOT NULL,
  `ul_value` blob,
  PRIMARY KEY (`ul_key`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `updatelog`
--

LOCK TABLES `updatelog` WRITE;
/*!40000 ALTER TABLE `updatelog` DISABLE KEYS */;
INSERT INTO `updatelog` VALUES (_binary 'PingBack',_binary '05df95957ccd19d49a5ddf2732206f45'),(_binary 'Pingback-1.32.0',_binary '1549353991'),(_binary 'filearchive-fa_major_mime-patch-fa_major_mime-chemical.sql',NULL),(_binary 'image-img_major_mime-patch-img_major_mime-chemical.sql',NULL),(_binary 'oldimage-oi_major_mime-patch-oi_major_mime-chemical.sql',NULL),(_binary 'user_former_groups-ufg_group-patch-ufg_group-length-increase-255.sql',NULL),(_binary 'user_groups-ug_group-patch-ug_group-length-increase-255.sql',NULL),(_binary 'user_properties-up_property-patch-up_property.sql',NULL);
/*!40000 ALTER TABLE `updatelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uploadstash`
--

DROP TABLE IF EXISTS `uploadstash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uploadstash` (
  `us_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `us_user` int(10) unsigned NOT NULL,
  `us_key` varbinary(255) NOT NULL,
  `us_orig_path` varbinary(255) NOT NULL,
  `us_path` varbinary(255) NOT NULL,
  `us_source_type` varbinary(50) DEFAULT NULL,
  `us_timestamp` varbinary(14) NOT NULL,
  `us_status` varbinary(50) NOT NULL,
  `us_chunk_inx` int(10) unsigned DEFAULT NULL,
  `us_props` blob,
  `us_size` int(10) unsigned NOT NULL,
  `us_sha1` varbinary(31) NOT NULL,
  `us_mime` varbinary(255) DEFAULT NULL,
  `us_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE','3D') DEFAULT NULL,
  `us_image_width` int(10) unsigned DEFAULT NULL,
  `us_image_height` int(10) unsigned DEFAULT NULL,
  `us_image_bits` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`us_id`),
  UNIQUE KEY `us_key` (`us_key`),
  KEY `us_user` (`us_user`),
  KEY `us_timestamp` (`us_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uploadstash`
--

LOCK TABLES `uploadstash` WRITE;
/*!40000 ALTER TABLE `uploadstash` DISABLE KEYS */;
/*!40000 ALTER TABLE `uploadstash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varbinary(255) NOT NULL DEFAULT '',
  `user_real_name` varbinary(255) NOT NULL DEFAULT '',
  `user_password` tinyblob NOT NULL,
  `user_newpassword` tinyblob NOT NULL,
  `user_newpass_time` binary(14) DEFAULT NULL,
  `user_email` tinyblob NOT NULL,
  `user_touched` binary(14) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `user_token` binary(32) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `user_email_authenticated` binary(14) DEFAULT NULL,
  `user_email_token` binary(32) DEFAULT NULL,
  `user_email_token_expires` binary(14) DEFAULT NULL,
  `user_registration` binary(14) DEFAULT NULL,
  `user_editcount` int(11) DEFAULT NULL,
  `user_password_expires` varbinary(14) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`),
  KEY `user_email_token` (`user_email_token`),
  KEY `user_email` (`user_email`(50))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,_binary 'Wiki user','',_binary ':pbkdf2:sha512:30000:64:hH7Fqx1XHDT4+apg6wR03Q==:BYkzmpxjapR5KjMJa1zpRr+khsxOWlF+nbbOvNElBlypLxUIIYwkpuEZQwvgKWYDnr9/1JMIG3072qQUz3SkMg==','',NULL,_binary 'none@none.net',_binary '20190206052906',_binary '6e49104b5386576f23bddd18820fb69f',NULL,NULL,NULL,_binary '20190205080506',61,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_former_groups`
--

DROP TABLE IF EXISTS `user_former_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_former_groups` (
  `ufg_user` int(10) unsigned NOT NULL DEFAULT '0',
  `ufg_group` varbinary(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ufg_user`,`ufg_group`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_former_groups`
--

LOCK TABLES `user_former_groups` WRITE;
/*!40000 ALTER TABLE `user_former_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_former_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_groups`
--

DROP TABLE IF EXISTS `user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_groups` (
  `ug_user` int(10) unsigned NOT NULL DEFAULT '0',
  `ug_group` varbinary(255) NOT NULL DEFAULT '',
  `ug_expiry` varbinary(14) DEFAULT NULL,
  PRIMARY KEY (`ug_user`,`ug_group`),
  KEY `ug_group` (`ug_group`),
  KEY `ug_expiry` (`ug_expiry`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_groups`
--

LOCK TABLES `user_groups` WRITE;
/*!40000 ALTER TABLE `user_groups` DISABLE KEYS */;
INSERT INTO `user_groups` VALUES (1,_binary 'bureaucrat',NULL),(1,_binary 'interface-admin',NULL),(1,_binary 'sysop',NULL);
/*!40000 ALTER TABLE `user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_newtalk`
--

DROP TABLE IF EXISTS `user_newtalk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_newtalk` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_ip` varbinary(40) NOT NULL DEFAULT '',
  `user_last_timestamp` varbinary(14) DEFAULT NULL,
  KEY `un_user_id` (`user_id`),
  KEY `un_user_ip` (`user_ip`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_newtalk`
--

LOCK TABLES `user_newtalk` WRITE;
/*!40000 ALTER TABLE `user_newtalk` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_newtalk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_properties`
--

DROP TABLE IF EXISTS `user_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_properties` (
  `up_user` int(10) unsigned NOT NULL,
  `up_property` varbinary(255) NOT NULL,
  `up_value` blob,
  PRIMARY KEY (`up_user`,`up_property`),
  KEY `user_properties_property` (`up_property`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_properties`
--

LOCK TABLES `user_properties` WRITE;
/*!40000 ALTER TABLE `user_properties` DISABLE KEYS */;
INSERT INTO `user_properties` VALUES (1,_binary 'rcfilters-limit',_binary '50'),(1,_binary 'rcfilters-rc-collapsed',_binary '0'),(1,_binary 'rcfilters-saved-queries',_binary '{\"queries\":{},\"version\":\"2\"}'),(1,_binary 'rcfilters-wl-collapsed',_binary '0'),(1,_binary 'rcfilters-wl-saved-queries',_binary '{\"queries\":{},\"version\":\"2\"}');
/*!40000 ALTER TABLE `user_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valid_tag`
--

DROP TABLE IF EXISTS `valid_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `valid_tag` (
  `vt_tag` varbinary(255) NOT NULL,
  PRIMARY KEY (`vt_tag`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valid_tag`
--

LOCK TABLES `valid_tag` WRITE;
/*!40000 ALTER TABLE `valid_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `valid_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watchlist`
--

DROP TABLE IF EXISTS `watchlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `watchlist` (
  `wl_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wl_user` int(10) unsigned NOT NULL,
  `wl_namespace` int(11) NOT NULL DEFAULT '0',
  `wl_title` varbinary(255) NOT NULL DEFAULT '',
  `wl_notificationtimestamp` varbinary(14) DEFAULT NULL,
  PRIMARY KEY (`wl_id`),
  UNIQUE KEY `wl_user` (`wl_user`,`wl_namespace`,`wl_title`),
  KEY `namespace_title` (`wl_namespace`,`wl_title`),
  KEY `wl_user_notificationtimestamp` (`wl_user`,`wl_notificationtimestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watchlist`
--

LOCK TABLES `watchlist` WRITE;
/*!40000 ALTER TABLE `watchlist` DISABLE KEYS */;
INSERT INTO `watchlist` VALUES (1,1,8,_binary 'Sidebar',NULL),(2,1,9,_binary 'Sidebar',NULL);
/*!40000 ALTER TABLE `watchlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `mysql`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mysql` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `mysql`;

--
-- Table structure for table `columns_priv`
--

DROP TABLE IF EXISTS `columns_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `columns_priv` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Table_name` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Column_name` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Column_priv` set('Select','Insert','Update','References') CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`Host`,`Db`,`User`,`Table_name`,`Column_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `columns_priv`
--

LOCK TABLES `columns_priv` WRITE;
/*!40000 ALTER TABLE `columns_priv` DISABLE KEYS */;
/*!40000 ALTER TABLE `columns_priv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db`
--

DROP TABLE IF EXISTS `db`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Select_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Insert_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Update_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Delete_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Drop_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Grant_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `References_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Index_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Alter_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_tmp_table_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Lock_tables_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_view_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Show_view_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_routine_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Alter_routine_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Execute_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Event_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Trigger_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  PRIMARY KEY (`Host`,`Db`,`User`),
  KEY `User` (`User`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db`
--

LOCK TABLES `db` WRITE;
/*!40000 ALTER TABLE `db` DISABLE KEYS */;
INSERT INTO `db` VALUES ('localhost','performance_schema','mysql.session','Y','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N'),('localhost','sys','mysql.sys','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','Y'),('localhost','my_wiki','wiki_user','Y','Y','Y','Y','Y','Y','N','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y');
/*!40000 ALTER TABLE `db` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine_cost`
--

DROP TABLE IF EXISTS `engine_cost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine_cost` (
  `engine_name` varchar(64) NOT NULL,
  `device_type` int(11) NOT NULL,
  `cost_name` varchar(64) NOT NULL,
  `cost_value` float DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `comment` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`cost_name`,`engine_name`,`device_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine_cost`
--

LOCK TABLES `engine_cost` WRITE;
/*!40000 ALTER TABLE `engine_cost` DISABLE KEYS */;
INSERT INTO `engine_cost` VALUES ('default',0,'io_block_read_cost',NULL,'2019-02-06 01:54:14',NULL),('default',0,'memory_block_read_cost',NULL,'2019-02-06 01:54:14',NULL);
/*!40000 ALTER TABLE `engine_cost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event` (
  `db` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `name` char(64) NOT NULL DEFAULT '',
  `body` longblob NOT NULL,
  `definer` char(93) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `execute_at` datetime DEFAULT NULL,
  `interval_value` int(11) DEFAULT NULL,
  `interval_field` enum('YEAR','QUARTER','MONTH','DAY','HOUR','MINUTE','WEEK','SECOND','MICROSECOND','YEAR_MONTH','DAY_HOUR','DAY_MINUTE','DAY_SECOND','HOUR_MINUTE','HOUR_SECOND','MINUTE_SECOND','DAY_MICROSECOND','HOUR_MICROSECOND','MINUTE_MICROSECOND','SECOND_MICROSECOND') DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_executed` datetime DEFAULT NULL,
  `starts` datetime DEFAULT NULL,
  `ends` datetime DEFAULT NULL,
  `status` enum('ENABLED','DISABLED','SLAVESIDE_DISABLED') NOT NULL DEFAULT 'ENABLED',
  `on_completion` enum('DROP','PRESERVE') NOT NULL DEFAULT 'DROP',
  `sql_mode` set('REAL_AS_FLOAT','PIPES_AS_CONCAT','ANSI_QUOTES','IGNORE_SPACE','NOT_USED','ONLY_FULL_GROUP_BY','NO_UNSIGNED_SUBTRACTION','NO_DIR_IN_CREATE','POSTGRESQL','ORACLE','MSSQL','DB2','MAXDB','NO_KEY_OPTIONS','NO_TABLE_OPTIONS','NO_FIELD_OPTIONS','MYSQL323','MYSQL40','ANSI','NO_AUTO_VALUE_ON_ZERO','NO_BACKSLASH_ESCAPES','STRICT_TRANS_TABLES','STRICT_ALL_TABLES','NO_ZERO_IN_DATE','NO_ZERO_DATE','INVALID_DATES','ERROR_FOR_DIVISION_BY_ZERO','TRADITIONAL','NO_AUTO_CREATE_USER','HIGH_NOT_PRECEDENCE','NO_ENGINE_SUBSTITUTION','PAD_CHAR_TO_FULL_LENGTH') NOT NULL DEFAULT '',
  `comment` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `originator` int(10) unsigned NOT NULL,
  `time_zone` char(64) CHARACTER SET latin1 NOT NULL DEFAULT 'SYSTEM',
  `character_set_client` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `collation_connection` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `db_collation` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `body_utf8` longblob,
  PRIMARY KEY (`db`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Events';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `func`
--

DROP TABLE IF EXISTS `func`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `func` (
  `name` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ret` tinyint(1) NOT NULL DEFAULT '0',
  `dl` char(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `type` enum('function','aggregate') CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User defined functions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `func`
--

LOCK TABLES `func` WRITE;
/*!40000 ALTER TABLE `func` DISABLE KEYS */;
/*!40000 ALTER TABLE `func` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gtid_executed`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `gtid_executed` (
  `source_uuid` char(36) NOT NULL COMMENT 'uuid of the source where the transaction was originally executed.',
  `interval_start` bigint(20) NOT NULL COMMENT 'First number of interval.',
  `interval_end` bigint(20) NOT NULL COMMENT 'Last number of interval.',
  PRIMARY KEY (`source_uuid`,`interval_start`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `help_category`
--

DROP TABLE IF EXISTS `help_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `help_category` (
  `help_category_id` smallint(5) unsigned NOT NULL,
  `name` char(64) NOT NULL,
  `parent_category_id` smallint(5) unsigned DEFAULT NULL,
  `url` text NOT NULL,
  PRIMARY KEY (`help_category_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 COMMENT='help categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `help_category`
--

LOCK TABLES `help_category` WRITE;
/*!40000 ALTER TABLE `help_category` DISABLE KEYS */;
INSERT INTO `help_category` VALUES (1,'Account Management',6,''),(2,'Administration',6,''),(3,'Bit Functions',13,''),(4,'Comparison operators',13,''),(5,'Compound Statements',6,''),(6,'Contents',0,''),(7,'Control flow functions',13,''),(8,'Data Definition',6,''),(9,'Data Manipulation',6,''),(10,'Data Types',6,''),(11,'Date and Time Functions',13,''),(12,'Encryption Functions',13,''),(13,'Functions',6,''),(14,'Functions and Modifiers for Use with GROUP BY',6,''),(15,'Geographic',0,''),(16,'Geographic Features',6,''),(17,'Geometry constructors',16,''),(18,'Geometry properties',16,''),(19,'Geometry relations',16,''),(20,'GeometryCollection properties',15,''),(21,'Help Metadata',6,''),(22,'Information Functions',13,''),(23,'Language Structure',6,''),(24,'LineString properties',16,''),(25,'Locking Functions',13,''),(26,'Logical operators',13,''),(27,'MBR',16,''),(28,'Miscellaneous Functions',13,''),(29,'Numeric Functions',13,''),(30,'Plugins',6,''),(31,'Point properties',16,''),(32,'Polygon properties',16,''),(33,'Procedures',6,''),(34,'Storage Engines',6,''),(35,'String Functions',13,''),(36,'Table Maintenance',6,''),(37,'Transactions',6,''),(38,'User-Defined Functions',6,''),(39,'Utility',6,''),(40,'WKB',16,''),(41,'WKT',16,'');
/*!40000 ALTER TABLE `help_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `help_keyword`
--

DROP TABLE IF EXISTS `help_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `help_keyword` (
  `help_keyword_id` int(10) unsigned NOT NULL,
  `name` char(64) NOT NULL,
  PRIMARY KEY (`help_keyword_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 COMMENT='help keywords';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `help_keyword`
--

LOCK TABLES `help_keyword` WRITE;
/*!40000 ALTER TABLE `help_keyword` DISABLE KEYS */;
INSERT INTO `help_keyword` VALUES (0,'(JSON'),(1,'->'),(2,'->>'),(3,'<>'),(4,'ACCOUNT'),(5,'ACTION'),(6,'ADD'),(7,'AES_DECRYPT'),(8,'AES_ENCRYPT'),(9,'AFTER'),(10,'AGAINST'),(11,'AGGREGATE'),(12,'ALGORITHM'),(13,'ALL'),(14,'ALTER'),(15,'ANALYSE'),(16,'ANALYZE'),(17,'AND'),(18,'ANY_VALUE'),(19,'ARCHIVE'),(20,'AREA'),(21,'AS'),(22,'ASBINARY'),(23,'ASC'),(24,'ASTEXT'),(25,'ASWKB'),(26,'ASWKT'),(27,'AT'),(28,'AUTOCOMMIT'),(29,'AUTOEXTEND_SIZE'),(30,'AUTO_INCREMENT'),(31,'AVG_ROW_LENGTH'),(32,'BEFORE'),(33,'BEGIN'),(34,'BETWEEN'),(35,'BIGINT'),(36,'BINARY'),(37,'BINLOG'),(38,'BOOL'),(39,'BOOLEAN'),(40,'BOTH'),(41,'BTREE'),(42,'BUFFER'),(43,'BY'),(44,'BYTE'),(45,'CACHE'),(46,'CALL'),(47,'CASCADE'),(48,'CASE'),(49,'CATALOG_NAME'),(50,'CEIL'),(51,'CEILING'),(52,'CENTROID'),(53,'CHAIN'),(54,'CHANGE'),(55,'CHANNEL'),(56,'CHAR'),(57,'CHARACTER'),(58,'CHARSET'),(59,'CHECK'),(60,'CHECKSUM'),(61,'CIPHER'),(62,'CLASS_ORIGIN'),(63,'CLIENT'),(64,'CLOSE'),(65,'COALESCE'),(66,'CODE'),(67,'COLLATE'),(68,'COLLATION'),(69,'COLUMN'),(70,'COLUMNS'),(71,'COLUMN_NAME'),(72,'COMMENT'),(73,'COMMIT'),(74,'COMMITTED'),(75,'COMPACT'),(76,'COMPLETION'),(77,'COMPRESSED'),(78,'COMPRESSION'),(79,'CONCURRENT'),(80,'CONDITION'),(81,'CONNECTION'),(82,'CONSISTENT'),(83,'CONSTRAINT'),(84,'CONSTRAINT_CATALOG'),(85,'CONSTRAINT_NAME'),(86,'CONSTRAINT_SCHEMA'),(87,'CONTAINS'),(88,'CONTINUE'),(89,'CONVERT'),(90,'CONVEXHULL'),(91,'COUNT'),(92,'CREATE'),(93,'CREATE_DH_PARAMETERS'),(94,'CROSS'),(95,'CROSSES'),(96,'CSV'),(97,'CURRENT_USER'),(98,'CURSOR'),(99,'CURSOR_NAME'),(100,'DATA'),(101,'DATABASE'),(102,'DATABASES'),(103,'DATAFILE'),(104,'DATE'),(105,'DATETIME'),(106,'DATE_ADD'),(107,'DATE_SUB'),(108,'DAY'),(109,'DAY_HOUR'),(110,'DAY_MINUTE'),(111,'DAY_SECOND'),(112,'DEALLOCATE'),(113,'DEC'),(114,'DECIMAL'),(115,'DECLARE'),(116,'DEFAULT'),(117,'DEFAULT_AUTH'),(118,'DEFINER'),(119,'DELAYED'),(120,'DELAY_KEY_WRITE'),(121,'DELETE'),(122,'DESC'),(123,'DESCRIBE'),(124,'DES_KEY_FILE'),(125,'DIAGNOSTICS'),(126,'DIMENSION'),(127,'DIRECTORY'),(128,'DISABLE'),(129,'DISCARD'),(130,'DISJOINT'),(131,'DISTANCE'),(132,'DISTINCT'),(133,'DISTINCTROW'),(134,'DO'),(135,'DROP'),(136,'DUAL'),(137,'DUMPFILE'),(138,'DUPLICATE'),(139,'DYNAMIC'),(140,'ELSE'),(141,'ELSEIF'),(142,'ENABLE'),(143,'ENCLOSED'),(144,'ENCRYPTION'),(145,'END'),(146,'ENDPOINT'),(147,'ENDS'),(148,'ENGINE'),(149,'ENGINES'),(150,'ENVELOPE'),(151,'EQUALS'),(152,'ERROR'),(153,'ERRORS'),(154,'ESCAPE'),(155,'ESCAPED'),(156,'EVENT'),(157,'EVENTS'),(158,'EVERY'),(159,'EXCHANGE'),(160,'EXECUTE'),(161,'EXISTS'),(162,'EXIT'),(163,'EXPANSION'),(164,'EXPIRE'),(165,'EXPLAIN'),(166,'EXPORT'),(167,'EXTENDED'),(168,'EXTENT_SIZE'),(169,'EXTERIORRING'),(170,'EXTRACTION)'),(171,'FALSE'),(172,'FAST'),(173,'FEDERATED'),(174,'FETCH'),(175,'FIELDS'),(176,'FILE'),(177,'FILE_BLOCK_SIZE'),(178,'FILTER'),(179,'FIRST'),(180,'FIXED'),(181,'FLOAT4'),(182,'FLOAT8'),(183,'FLOOR'),(184,'FLUSH'),(185,'FOR'),(186,'FORCE'),(187,'FOREIGN'),(188,'FORMAT'),(189,'FROM'),(190,'FULL'),(191,'FULLTEXT'),(192,'FUNCTION'),(193,'GENERAL'),(194,'GEOMCOLLFROMTEXT'),(195,'GEOMCOLLFROMWKB'),(196,'GEOMETRYCOLLECTION'),(197,'GEOMETRYCOLLECTIONFROMTEXT'),(198,'GEOMETRYCOLLECTIONFROMWKB'),(199,'GEOMETRYFROMTEXT'),(200,'GEOMETRYFROMWKB'),(201,'GEOMETRYN'),(202,'GEOMETRYTYPE'),(203,'GEOMFROMTEXT'),(204,'GEOMFROMWKB'),(205,'GET'),(206,'GLENGTH'),(207,'GLOBAL'),(208,'GRANT'),(209,'GRANTS'),(210,'GROUP'),(211,'HANDLER'),(212,'HAVING'),(213,'HEAP'),(214,'HELP'),(215,'HELP_DATE'),(216,'HELP_VERSION'),(217,'HIGH_PRIORITY'),(218,'HOST'),(219,'HOSTS'),(220,'HOUR'),(221,'HOUR_MINUTE'),(222,'HOUR_SECOND'),(223,'IDENTIFIED'),(224,'IF'),(225,'IGNORE'),(226,'IGNORE_SERVER_IDS'),(227,'IMPORT'),(228,'IN'),(229,'INDEX'),(230,'INDEXES'),(231,'INFILE'),(232,'INITIAL_SIZE'),(233,'INLINE'),(234,'INNER'),(235,'INNODB'),(236,'INSERT'),(237,'INSERT_METHOD'),(238,'INSTALL'),(239,'INSTANCE'),(240,'INT1'),(241,'INT2'),(242,'INT3'),(243,'INT4'),(244,'INT8'),(245,'INTEGER'),(246,'INTERIORRINGN'),(247,'INTERSECTS'),(248,'INTERVAL'),(249,'INTO'),(250,'IO_THREAD'),(251,'IS'),(252,'ISCLOSED'),(253,'ISEMPTY'),(254,'ISOLATION'),(255,'ISSIMPLE'),(256,'ISSUER'),(257,'ITERATE'),(258,'JOIN'),(259,'JSON'),(260,'JSON_APPEND'),(261,'JSON_ARRAY'),(262,'JSON_ARRAYAGG'),(263,'JSON_ARRAY_APPEND'),(264,'JSON_ARRAY_INSERT'),(265,'JSON_CONTAINS'),(266,'JSON_CONTAINS_PATH'),(267,'JSON_DEPTH'),(268,'JSON_EXTRACT'),(269,'JSON_INSERT'),(270,'JSON_KEYS'),(271,'JSON_LENGTH'),(272,'JSON_MERGE'),(273,'JSON_MERGE_PATCH'),(274,'JSON_MERGE_PRESERVE'),(275,'JSON_OBJECT'),(276,'JSON_OBJECTAGG'),(277,'JSON_PRETTY'),(278,'JSON_QUOTE'),(279,'JSON_REMOVE'),(280,'JSON_REPLACE'),(281,'JSON_SEARCH'),(282,'JSON_SET'),(283,'JSON_STORAGE_SIZE'),(284,'JSON_TYPE'),(285,'JSON_UNQUOTE'),(286,'JSON_VALID'),(287,'KEY'),(288,'KEYS'),(289,'KEY_BLOCK_SIZE'),(290,'KILL'),(291,'LAST'),(292,'LEADING'),(293,'LEAVE'),(294,'LEFT'),(295,'LEVEL'),(296,'LIKE'),(297,'LIMIT'),(298,'LINEFROMTEXT'),(299,'LINEFROMWKB'),(300,'LINES'),(301,'LINESTRING'),(302,'LINESTRINGFROMTEXT'),(303,'LINESTRINGFROMWKB'),(304,'LOAD'),(305,'LOCAL'),(306,'LOCK'),(307,'LOGFILE'),(308,'LOGS'),(309,'LONG'),(310,'LONGBINARY'),(311,'LOOP'),(312,'LOW_PRIORITY'),(313,'MASTER'),(314,'MASTER_AUTO_POSITION'),(315,'MASTER_BIND'),(316,'MASTER_CONNECT_RETRY'),(317,'MASTER_HEARTBEAT_PERIOD'),(318,'MASTER_HOST'),(319,'MASTER_LOG_FILE'),(320,'MASTER_LOG_POS'),(321,'MASTER_PASSWORD'),(322,'MASTER_PORT'),(323,'MASTER_RETRY_COUNT'),(324,'MASTER_SSL'),(325,'MASTER_SSL_CA'),(326,'MASTER_SSL_CERT'),(327,'MASTER_SSL_CIPHER'),(328,'MASTER_SSL_CRL'),(329,'MASTER_SSL_CRLPATH'),(330,'MASTER_SSL_KEY'),(331,'MASTER_SSL_VERIFY_SERVER_CERT'),(332,'MASTER_TLS_VERSION'),(333,'MASTER_USER'),(334,'MATCH'),(335,'MAX_CONNECTIONS_PER_HOUR'),(336,'MAX_QUERIES_PER_HOUR'),(337,'MAX_ROWS'),(338,'MAX_SIZE'),(339,'MAX_UPDATES_PER_HOUR'),(340,'MAX_USER_CONNECTIONS'),(341,'MBRCONTAINS'),(342,'MBRDISJOINT'),(343,'MBREQUAL'),(344,'MBRINTERSECTS'),(345,'MBROVERLAPS'),(346,'MBRTOUCHES'),(347,'MBRWITHIN'),(348,'MEDIUM'),(349,'MEMORY'),(350,'MERGE'),(351,'MESSAGE_TEXT'),(352,'MIDDLEINT'),(353,'MINUTE'),(354,'MINUTE_SECOND'),(355,'MIN_ROWS'),(356,'MLINEFROMTEXT'),(357,'MLINEFROMWKB'),(358,'MOD'),(359,'MODE'),(360,'MODIFY'),(361,'MONTH'),(362,'MPOINTFROMTEXT'),(363,'MPOINTFROMWKB'),(364,'MPOLYFROMTEXT'),(365,'MPOLYFROMWKB'),(366,'MRG_MYISAM'),(367,'MULTILINESTRING'),(368,'MULTILINESTRINGFROMTEXT'),(369,'MULTILINESTRINGFROMWKB'),(370,'MULTIPOINT'),(371,'MULTIPOINTFROMTEXT'),(372,'MULTIPOINTFROMWKB'),(373,'MULTIPOLYGON'),(374,'MULTIPOLYGONFROMTEXT'),(375,'MULTIPOLYGONFROMWKB'),(376,'MUTEX'),(377,'MYISAM'),(378,'MYSQL_ERRNO'),(379,'NAME'),(380,'NAMES'),(381,'NATIONAL'),(382,'NATURAL'),(383,'NCHAR'),(384,'NDB'),(385,'NDBCLUSTER'),(386,'NEVER'),(387,'NEXT'),(388,'NO'),(389,'NODEGROUP'),(390,'NONE'),(391,'NOT'),(392,'NO_WRITE_TO_BINLOG'),(393,'NULL'),(394,'NUMBER'),(395,'NUMERIC'),(396,'NUMGEOMETRIES'),(397,'NUMINTERIORRINGS'),(398,'NUMPOINTS'),(399,'NVARCHAR'),(400,'OFFSET'),(401,'ON'),(402,'ONLY'),(403,'OPEN'),(404,'OPTIMIZE'),(405,'OPTIMIZER_COSTS'),(406,'OPTION'),(407,'OPTIONALLY'),(408,'OPTIONS'),(409,'OR'),(410,'ORDER'),(411,'OUTER'),(412,'OUTFILE'),(413,'OVERLAPS'),(414,'OWNER'),(415,'PACK_KEYS'),(416,'PARSER'),(417,'PARTIAL'),(418,'PARTITION'),(419,'PARTITIONING'),(420,'PARTITIONS'),(421,'PASSWORD'),(422,'PATH)'),(423,'PLUGIN'),(424,'PLUGINS'),(425,'PLUGIN_DIR'),(426,'POINT'),(427,'POINTFROMTEXT'),(428,'POINTFROMWKB'),(429,'POINTN'),(430,'POLYFROMTEXT'),(431,'POLYFROMWKB'),(432,'POLYGON'),(433,'POLYGONFROMTEXT'),(434,'POLYGONFROMWKB'),(435,'PORT'),(436,'POW'),(437,'POWER'),(438,'PRECISION'),(439,'PREPARE'),(440,'PRESERVE'),(441,'PREV'),(442,'PRIMARY'),(443,'PRIVILEGES'),(444,'PROCEDURE'),(445,'PROCESS'),(446,'PROCESSLIST'),(447,'PROFILE'),(448,'PROFILES'),(449,'PROXY'),(450,'PURGE'),(451,'QUERY'),(452,'QUICK'),(453,'RANDOM_BYTES'),(454,'READ'),(455,'REAL'),(456,'REBUILD'),(457,'RECOVER'),(458,'REDUNDANT'),(459,'REFERENCES'),(460,'RELAY'),(461,'RELAYLOG'),(462,'RELAY_LOG_FILE'),(463,'RELAY_LOG_POS'),(464,'RELEASE'),(465,'RELOAD'),(466,'REMOVE'),(467,'RENAME'),(468,'REORGANIZE'),(469,'REPAIR'),(470,'REPEAT'),(471,'REPEATABLE'),(472,'REPLACE'),(473,'REPLICATE_DO_DB'),(474,'REPLICATE_DO_TABLE'),(475,'REPLICATE_IGNORE_DB'),(476,'REPLICATE_IGNORE_TABLE'),(477,'REPLICATE_REWRITE_DB'),(478,'REPLICATE_WILD_DO_TABLE'),(479,'REPLICATE_WILD_IGNORE_TABLE'),(480,'REPLICATION'),(481,'REQUIRE'),(482,'RESET'),(483,'RESIGNAL'),(484,'RESTRICT'),(485,'RETURN'),(486,'RETURNED_SQLSTATE'),(487,'RETURNS'),(488,'REVOKE'),(489,'RIGHT'),(490,'RLIKE'),(491,'ROLLBACK'),(492,'ROWS'),(493,'ROW_COUNT'),(494,'ROW_FORMAT'),(495,'SAVEPOINT'),(496,'SCHEDULE'),(497,'SCHEMA'),(498,'SCHEMAS'),(499,'SCHEMA_NAME'),(500,'SECOND'),(501,'SECURITY'),(502,'SELECT'),(503,'SEPARATOR'),(504,'SERIAL'),(505,'SERIALIZABLE'),(506,'SERVER'),(507,'SESSION'),(508,'SET'),(509,'SHA'),(510,'SHA1'),(511,'SHA2'),(512,'SHARE'),(513,'SHOW'),(514,'SHUTDOWN'),(515,'SIGNAL'),(516,'SIGNED'),(517,'SLAVE'),(518,'SLOW'),(519,'SNAPSHOT'),(520,'SOCKET'),(521,'SONAME'),(522,'SOUNDS'),(523,'SPATIAL'),(524,'SQLSTATE'),(525,'SQL_AFTER_GTIDS'),(526,'SQL_AFTER_MTS_GAPS'),(527,'SQL_BEFORE_GTIDS'),(528,'SQL_BIG_RESULT'),(529,'SQL_BUFFER_RESULT'),(530,'SQL_CACHE'),(531,'SQL_CALC_FOUND_ROWS'),(532,'SQL_LOG_BIN'),(533,'SQL_NO_CACHE'),(534,'SQL_SLAVE_SKIP_COUNTER'),(535,'SQL_SMALL_RESULT'),(536,'SQL_THREAD'),(537,'SRID'),(538,'SSL'),(539,'START'),(540,'STARTING'),(541,'STARTPOINT'),(542,'STARTS'),(543,'STATS_AUTO_RECALC'),(544,'STATS_PERSISTENT'),(545,'STATS_SAMPLE_PAGES'),(546,'STATUS'),(547,'STD'),(548,'STDDEV'),(549,'STOP'),(550,'STORAGE'),(551,'STORED'),(552,'STRAIGHT_JOIN'),(553,'STRING'),(554,'ST_AREA'),(555,'ST_ASBINARY'),(556,'ST_ASGEOJSON'),(557,'ST_ASTEXT'),(558,'ST_ASWKB'),(559,'ST_ASWKT'),(560,'ST_BUFFER'),(561,'ST_BUFFER_STRATEGY'),(562,'ST_CENTROID'),(563,'ST_CONTAINS'),(564,'ST_CONVEXHULL'),(565,'ST_CROSSES'),(566,'ST_DIFFERENCE'),(567,'ST_DIMENSION'),(568,'ST_DISJOINT'),(569,'ST_DISTANCE'),(570,'ST_DISTANCE_SPHERE'),(571,'ST_ENDPOINT'),(572,'ST_ENVELOPE'),(573,'ST_EQUALS'),(574,'ST_EXTERIORRING'),(575,'ST_GEOHASH'),(576,'ST_GEOMCOLLFROMTEXT'),(577,'ST_GEOMCOLLFROMWKB'),(578,'ST_GEOMETRYCOLLECTIONFROMTEXT'),(579,'ST_GEOMETRYCOLLECTIONFROMWKB'),(580,'ST_GEOMETRYFROMTEXT'),(581,'ST_GEOMETRYFROMWKB'),(582,'ST_GEOMETRYN'),(583,'ST_GEOMETRYTYPE'),(584,'ST_GEOMFROMGEOJSON'),(585,'ST_GEOMFROMTEXT'),(586,'ST_GEOMFROMWKB'),(587,'ST_INTERIORRINGN'),(588,'ST_INTERSECTION'),(589,'ST_INTERSECTS'),(590,'ST_ISCLOSED'),(591,'ST_ISEMPTY'),(592,'ST_ISSIMPLE'),(593,'ST_ISVALID'),(594,'ST_LATFROMGEOHASH'),(595,'ST_LINEFROMTEXT'),(596,'ST_LINEFROMWKB'),(597,'ST_LINESTRINGFROMTEXT'),(598,'ST_LINESTRINGFROMWKB'),(599,'ST_LONGFROMGEOHASH'),(600,'ST_MAKEENVELOPE'),(601,'ST_MLINEFROMTEXT'),(602,'ST_MLINEFROMWKB'),(603,'ST_MPOINTFROMTEXT'),(604,'ST_MPOINTFROMWKB'),(605,'ST_MPOLYFROMTEXT'),(606,'ST_MPOLYFROMWKB'),(607,'ST_MULTILINESTRINGFROMTEXT'),(608,'ST_MULTILINESTRINGFROMWKB'),(609,'ST_MULTIPOINTFROMTEXT'),(610,'ST_MULTIPOINTFROMWKB'),(611,'ST_MULTIPOLYGONFROMTEXT'),(612,'ST_MULTIPOLYGONFROMWKB'),(613,'ST_NUMGEOMETRIES'),(614,'ST_NUMINTERIORRING'),(615,'ST_NUMINTERIORRINGS'),(616,'ST_NUMPOINTS'),(617,'ST_OVERLAPS'),(618,'ST_POINTFROMGEOHASH'),(619,'ST_POINTFROMTEXT'),(620,'ST_POINTFROMWKB'),(621,'ST_POINTN'),(622,'ST_POLYFROMTEXT'),(623,'ST_POLYFROMWKB'),(624,'ST_POLYGONFROMTEXT'),(625,'ST_POLYGONFROMWKB'),(626,'ST_SIMPLIFY'),(627,'ST_SRID'),(628,'ST_STARTPOINT'),(629,'ST_SYMDIFFERENCE'),(630,'ST_TOUCHES'),(631,'ST_UNION'),(632,'ST_VALIDATE'),(633,'ST_WITHIN'),(634,'ST_X'),(635,'ST_Y'),(636,'SUBCLASS_ORIGIN'),(637,'SUBJECT'),(638,'SUPER'),(639,'TABLE'),(640,'TABLES'),(641,'TABLESPACE'),(642,'TABLE_NAME'),(643,'TEMPORARY'),(644,'TERMINATED'),(645,'THEN'),(646,'TIME'),(647,'TIMESTAMP'),(648,'TO'),(649,'TOUCHES'),(650,'TRADITIONAL'),(651,'TRAILING'),(652,'TRANSACTION'),(653,'TRIGGER'),(654,'TRIGGERS'),(655,'TRUE'),(656,'TRUNCATE'),(657,'TYPE'),(658,'UNCOMMITTED'),(659,'UNDO'),(660,'UNINSTALL'),(661,'UNION'),(662,'UNIQUE'),(663,'UNLOCK'),(664,'UNSIGNED'),(665,'UNTIL'),(666,'UPDATE'),(667,'UPGRADE'),(668,'USAGE'),(669,'USE'),(670,'USER'),(671,'USER_RESOURCES'),(672,'USE_FRM'),(673,'USING'),(674,'VALUE'),(675,'VALUES'),(676,'VARCHARACTER'),(677,'VARIABLE'),(678,'VARIABLES'),(679,'VARYING'),(680,'VIEW'),(681,'VIRTUAL'),(682,'WAIT'),(683,'WARNINGS'),(684,'WHEN'),(685,'WHERE'),(686,'WHILE'),(687,'WITH'),(688,'WITHIN'),(689,'WORK'),(690,'WRAPPER'),(691,'WRITE'),(692,'X'),(693,'X509'),(694,'XA'),(695,'Y'),(696,'YEAR'),(697,'YEAR_MONTH'),(698,'ZEROFILL');
/*!40000 ALTER TABLE `help_keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `help_relation`
--

DROP TABLE IF EXISTS `help_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `help_relation` (
  `help_topic_id` int(10) unsigned NOT NULL,
  `help_keyword_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`help_keyword_id`,`help_topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 COMMENT='keyword-topic relation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `help_relation`
--

LOCK TABLES `help_relation` WRITE;
/*!40000 ALTER TABLE `help_relation` DISABLE KEYS */;
INSERT INTO `help_relation` VALUES (8,0),(9,0),(8,1),(9,2),(1,3),(34,4),(121,4),(99,5),(118,5),(32,6),(33,6),(119,6),(490,6),(23,7),(24,8),(32,9),(329,10),(113,11),(32,12),(219,13),(415,13),(419,13),(429,13),(604,13),(25,14),(26,14),(27,14),(28,14),(29,14),(30,14),(31,14),(32,14),(33,14),(34,14),(35,14),(219,14),(490,14),(396,15),(32,16),(36,16),(37,17),(57,17),(38,18),(118,19),(39,20),(34,21),(121,21),(266,21),(315,21),(429,21),(40,22),(221,23),(429,23),(45,24),(40,25),(45,26),(111,27),(494,28),(119,29),(32,30),(32,31),(118,31),(397,32),(55,33),(494,33),(634,33),(57,34),(163,35),(102,36),(199,36),(397,36),(441,36),(62,37),(442,37),(71,38),(589,38),(329,39),(589,39),(595,40),(114,41),(72,42),(32,43),(34,43),(118,43),(121,43),(157,43),(219,43),(221,43),(308,43),(310,43),(429,43),(606,43),(84,44),(73,45),(199,45),(200,45),(309,45),(413,45),(74,46),(99,47),(118,47),(174,47),(178,47),(75,48),(76,48),(215,49),(416,49),(483,49),(78,50),(79,51),(80,52),(494,53),(32,54),(81,54),(82,54),(81,55),(199,55),(415,55),(472,55),(474,55),(493,55),(500,55),(84,56),(102,56),(25,57),(32,57),(83,57),(110,57),(118,57),(308,57),(310,57),(429,57),(432,57),(440,57),(443,57),(619,57),(432,58),(32,59),(89,59),(118,59),(32,60),(90,60),(118,60),(34,61),(121,61),(219,61),(215,62),(416,62),(483,62),(219,63),(91,64),(224,64),(32,65),(459,66),(467,66),(25,67),(32,67),(110,67),(118,67),(440,68),(444,68),(32,69),(32,70),(118,70),(308,70),(440,70),(445,70),(215,71),(416,71),(483,71),(26,72),(32,72),(111,72),(114,72),(118,72),(119,72),(494,73),(634,73),(257,74),(118,75),(26,76),(111,76),(118,77),(32,78),(308,79),(310,79),(150,80),(32,81),(118,81),(189,81),(294,81),(494,82),(634,82),(32,83),(118,83),(215,84),(416,84),(483,84),(215,85),(416,85),(483,85),(215,86),(416,86),(483,86),(100,87),(152,88),(77,89),(102,89),(104,90),(108,91),(457,91),(480,91),(110,92),(111,92),(112,92),(113,92),(114,92),(115,92),(116,92),(117,92),(118,92),(119,92),(120,92),(121,92),(122,92),(440,92),(446,92),(447,92),(448,92),(449,92),(450,92),(452,92),(490,92),(125,93),(266,94),(127,95),(118,96),(308,96),(26,97),(111,97),(151,98),(215,99),(416,99),(483,99),(25,100),(32,100),(117,100),(118,100),(308,100),(25,101),(110,101),(117,101),(167,101),(440,101),(446,101),(440,102),(454,102),(33,103),(119,103),(102,104),(135,104),(136,104),(139,104),(102,105),(139,106),(139,107),(139,108),(139,109),(139,110),(139,111),(147,112),(149,113),(102,114),(113,114),(148,114),(150,115),(151,115),(152,115),(153,115),(25,116),(32,116),(34,116),(53,116),(99,116),(110,116),(118,116),(121,116),(153,116),(239,116),(411,116),(493,117),(26,118),(111,118),(239,119),(240,119),(411,119),(32,120),(118,120),(99,121),(118,121),(157,121),(189,122),(221,122),(429,122),(189,123),(199,124),(215,125),(160,126),(25,127),(32,127),(118,127),(26,128),(32,128),(111,128),(32,129),(161,130),(162,131),(54,132),(108,132),(221,132),(330,132),(349,132),(429,132),(574,132),(604,132),(429,133),(26,134),(111,134),(164,134),(630,134),(32,135),(33,135),(147,135),(167,135),(168,135),(169,135),(170,135),(171,135),(172,135),(173,135),(174,135),(175,135),(176,135),(177,135),(178,135),(179,136),(429,137),(239,138),(118,139),(75,140),(76,140),(232,141),(26,142),(32,142),(111,142),(308,143),(32,144),(55,145),(75,145),(76,145),(232,145),(321,145),(410,145),(630,145),(634,145),(183,146),(111,147),(32,148),(33,148),(118,148),(119,148),(175,148),(199,148),(440,148),(455,148),(440,149),(456,149),(185,150),(186,151),(199,152),(440,153),(457,153),(303,154),(308,155),(26,156),(111,156),(168,156),(447,156),(442,157),(458,157),(472,157),(111,158),(32,159),(187,160),(219,160),(34,161),(110,161),(111,161),(121,161),(167,161),(168,161),(173,161),(174,161),(177,161),(178,161),(152,162),(329,163),(34,164),(121,164),(189,165),(199,166),(189,167),(408,167),(119,168),(191,169),(8,170),(596,171),(89,172),(118,173),(194,174),(308,175),(440,175),(445,175),(219,176),(119,177),(82,178),(32,179),(118,179),(224,179),(118,180),(149,180),(197,181),(165,182),(163,183),(199,184),(200,184),(81,185),(150,185),(151,185),(152,185),(189,185),(199,185),(415,185),(429,185),(436,185),(440,185),(472,185),(474,185),(493,185),(500,185),(266,186),(32,187),(99,187),(117,187),(118,187),(189,188),(157,189),(429,189),(440,189),(442,189),(445,189),(462,189),(472,189),(595,189),(118,190),(440,190),(445,190),(469,190),(477,190),(32,191),(114,191),(118,191),(27,192),(112,192),(113,192),(116,192),(169,192),(170,192),(172,192),(440,192),(448,192),(459,192),(460,192),(199,193),(206,194),(207,195),(210,196),(206,197),(207,198),(213,199),(214,200),(211,201),(212,202),(213,203),(214,204),(215,205),(218,206),(257,207),(431,207),(434,207),(475,207),(479,207),(219,208),(419,208),(440,209),(461,209),(29,210),(115,210),(119,210),(429,210),(152,211),(224,211),(429,212),(118,213),(225,214),(226,214),(227,215),(228,216),(239,217),(429,217),(117,218),(199,219),(440,219),(473,219),(139,220),(139,221),(139,222),(34,223),(121,223),(219,223),(310,223),(34,224),(110,224),(111,224),(121,224),(167,224),(168,224),(173,224),(174,224),(177,224),(178,224),(231,224),(232,224),(239,225),(266,225),(308,225),(310,225),(429,225),(606,225),(81,226),(32,227),(308,227),(329,228),(429,228),(442,228),(445,228),(462,228),(472,228),(32,229),(73,229),(114,229),(118,229),(171,229),(266,229),(309,229),(440,229),(462,229),(490,229),(440,230),(308,231),(310,231),(33,232),(119,232),(9,233),(266,234),(118,235),(440,235),(239,236),(240,236),(241,236),(242,236),(32,237),(118,237),(243,238),(28,239),(589,240),(486,241),(344,242),(245,243),(58,244),(102,245),(113,245),(245,245),(247,246),(248,247),(34,248),(111,248),(121,248),(139,248),(239,249),(309,249),(411,249),(429,249),(493,250),(500,250),(250,251),(251,251),(252,251),(253,251),(254,252),(255,253),(257,254),(258,255),(34,256),(121,256),(219,256),(265,257),(266,258),(429,258),(102,259),(189,259),(267,260),(268,261),(269,262),(270,263),(271,264),(272,265),(273,266),(274,267),(275,268),(276,269),(277,270),(278,271),(279,272),(280,273),(281,274),(282,275),(283,276),(284,277),(285,278),(286,279),(287,280),(288,281),(289,282),(290,283),(291,284),(292,285),(293,286),(32,287),(99,287),(118,287),(239,287),(490,287),(32,288),(440,288),(462,288),(32,289),(118,289),(294,290),(224,291),(595,292),(300,293),(266,294),(257,295),(440,296),(445,296),(488,296),(157,297),(224,297),(429,297),(442,297),(472,297),(606,297),(304,298),(305,299),(308,300),(310,300),(306,301),(304,302),(305,303),(308,304),(309,304),(36,305),(199,305),(308,305),(310,305),(315,305),(377,305),(408,305),(32,306),(34,306),(121,306),(199,306),(315,306),(429,306),(29,307),(115,307),(119,307),(199,308),(397,308),(440,308),(441,308),(319,309),(319,310),(321,311),(157,312),(239,312),(308,312),(310,312),(315,312),(411,312),(606,312),(81,313),(397,313),(413,313),(414,313),(441,313),(463,313),(81,314),(81,315),(81,316),(81,317),(81,318),(81,319),(81,320),(81,321),(81,322),(81,323),(81,324),(81,325),(81,326),(81,327),(81,328),(81,329),(81,330),(81,331),(81,332),(81,333),(329,334),(34,335),(121,335),(219,335),(34,336),(121,336),(219,336),(32,337),(118,337),(119,338),(34,339),(121,339),(219,339),(34,340),(121,340),(219,340),(332,341),(335,342),(336,343),(338,344),(339,345),(340,346),(341,347),(89,348),(429,349),(118,350),(215,351),(416,351),(483,351),(344,352),(139,353),(139,354),(32,355),(118,355),(351,356),(352,357),(2,358),(353,358),(329,359),(429,359),(32,360),(139,361),(356,362),(357,363),(358,364),(359,365),(118,366),(360,367),(351,368),(352,369),(361,370),(356,371),(357,372),(362,373),(358,374),(359,375),(440,376),(455,376),(118,377),(215,378),(416,378),(483,378),(25,379),(435,380),(83,381),(619,381),(266,382),(83,383),(118,384),(118,385),(34,386),(121,386),(224,387),(99,388),(118,388),(119,389),(219,390),(0,391),(110,391),(111,391),(121,391),(251,391),(252,391),(36,392),(199,392),(377,392),(408,392),(99,393),(252,393),(253,393),(215,394),(149,395),(370,396),(371,397),(372,398),(619,399),(429,400),(26,401),(99,401),(111,401),(266,401),(257,402),(494,402),(634,402),(224,403),(376,403),(440,403),(464,403),(32,404),(377,404),(199,405),(219,406),(419,406),(308,407),(31,408),(117,408),(378,409),(32,410),(157,410),(221,410),(429,410),(606,410),(266,411),(429,412),(380,413),(117,414),(32,415),(118,415),(32,416),(114,416),(118,416),(118,417),(32,418),(118,418),(157,418),(239,418),(266,418),(308,418),(411,418),(429,418),(32,419),(189,420),(32,421),(34,421),(117,421),(121,421),(219,421),(436,421),(493,421),(9,422),(243,423),(440,423),(603,423),(465,424),(493,425),(385,426),(386,427),(387,428),(388,429),(389,430),(390,431),(391,432),(389,433),(390,434),(117,435),(393,436),(394,437),(165,438),(147,439),(395,439),(634,439),(26,440),(111,440),(224,441),(32,442),(199,443),(219,443),(419,443),(466,443),(30,444),(116,444),(172,444),(396,444),(429,444),(440,444),(449,444),(467,444),(468,444),(219,445),(440,446),(469,446),(470,447),(471,448),(419,449),(397,450),(199,451),(200,451),(294,451),(329,451),(413,451),(89,452),(157,452),(408,452),(402,453),(199,454),(224,454),(257,454),(315,454),(494,454),(634,454),(113,455),(165,455),(32,456),(634,457),(118,458),(99,459),(118,459),(219,459),(199,460),(472,461),(81,462),(81,463),(425,464),(494,464),(634,464),(219,465),(32,466),(26,467),(32,467),(406,467),(407,467),(32,468),(32,469),(408,469),(410,470),(257,471),(308,472),(310,472),(411,472),(82,473),(82,474),(82,475),(82,476),(82,477),(82,478),(82,479),(82,480),(219,480),(34,481),(121,481),(219,481),(200,482),(413,482),(414,482),(415,482),(416,483),(99,484),(174,484),(178,484),(417,485),(215,486),(113,487),(419,488),(266,489),(403,490),(425,491),(494,491),(634,491),(310,492),(215,493),(32,494),(118,494),(425,495),(26,496),(111,496),(25,497),(110,497),(167,497),(440,497),(446,497),(440,498),(454,498),(215,499),(416,499),(483,499),(139,500),(219,501),(189,502),(239,502),(242,502),(411,502),(429,502),(221,503),(53,504),(118,504),(257,505),(31,506),(117,506),(173,506),(257,507),(431,507),(475,507),(479,507),(25,508),(32,508),(99,508),(110,508),(118,508),(239,508),(308,508),(310,508),(411,508),(416,508),(429,508),(431,508),(432,508),(434,508),(435,508),(436,508),(437,508),(440,508),(443,508),(483,508),(494,508),(606,508),(438,509),(438,510),(439,511),(429,512),(440,513),(441,513),(442,513),(443,513),(444,513),(445,513),(446,513),(447,513),(448,513),(449,513),(450,513),(452,513),(454,513),(455,513),(456,513),(457,513),(458,513),(459,513),(460,513),(461,513),(462,513),(463,513),(464,513),(465,513),(466,513),(467,513),(468,513),(469,513),(470,513),(471,513),(472,513),(473,513),(474,513),(475,513),(476,513),(477,513),(478,513),(479,513),(480,513),(219,514),(481,514),(483,515),(102,516),(26,517),(111,517),(413,517),(415,517),(473,517),(474,517),(493,517),(500,517),(199,518),(494,519),(634,519),(117,520),(113,521),(488,522),(32,523),(114,523),(416,524),(483,524),(493,525),(493,526),(493,527),(429,528),(429,529),(429,530),(429,531),(437,532),(429,533),(434,534),(429,535),(493,536),(500,536),(492,537),(34,538),(121,538),(219,538),(493,539),(494,539),(634,539),(308,540),(495,541),(111,542),(32,543),(118,543),(32,544),(118,544),(32,545),(118,545),(199,546),(440,546),(455,546),(460,546),(463,546),(468,546),(474,546),(475,546),(476,546),(496,547),(497,548),(500,549),(456,550),(118,551),(266,552),(429,552),(113,553),(503,554),(504,555),(505,556),(506,557),(504,558),(506,559),(507,560),(508,561),(509,562),(510,563),(511,564),(512,565),(513,566),(514,567),(515,568),(516,569),(517,570),(518,571),(519,572),(520,573),(521,574),(522,575),(523,576),(524,577),(523,578),(524,579),(528,580),(529,581),(525,582),(526,583),(527,584),(528,585),(529,586),(530,587),(531,588),(532,589),(533,590),(534,591),(535,592),(536,593),(537,594),(539,595),(540,596),(539,597),(540,598),(541,599),(542,600),(543,601),(544,602),(545,603),(546,604),(547,605),(548,606),(543,607),(544,608),(545,609),(546,610),(547,611),(548,612),(549,613),(550,614),(550,615),(551,616),(552,617),(553,618),(554,619),(555,620),(556,621),(557,622),(558,623),(557,624),(558,625),(559,626),(560,627),(561,628),(562,629),(563,630),(564,631),(565,632),(566,633),(567,634),(568,635),(215,636),(416,636),(483,636),(34,637),(121,637),(219,637),(219,638),(32,639),(36,639),(89,639),(90,639),(118,639),(174,639),(377,639),(406,639),(408,639),(440,639),(450,639),(476,639),(490,639),(598,639),(199,640),(315,640),(440,640),(464,640),(477,640),(32,641),(33,641),(119,641),(175,641),(215,642),(416,642),(483,642),(174,643),(308,644),(75,645),(76,645),(232,645),(102,646),(579,646),(580,646),(582,647),(583,647),(81,648),(397,648),(425,648),(591,649),(189,650),(595,651),(257,652),(494,652),(120,653),(176,653),(440,653),(440,654),(478,654),(596,655),(32,656),(598,656),(32,657),(257,658),(152,659),(603,660),(32,661),(604,661),(32,662),(34,663),(121,663),(315,663),(58,664),(102,664),(149,664),(165,664),(197,664),(245,664),(589,664),(410,665),(99,666),(239,666),(429,666),(606,666),(25,667),(32,667),(89,667),(219,668),(119,669),(266,669),(609,669),(34,670),(117,670),(121,670),(177,670),(407,670),(452,670),(493,670),(199,671),(408,672),(157,673),(187,673),(266,673),(53,674),(239,674),(411,674),(416,674),(483,674),(239,675),(411,675),(619,676),(431,677),(440,678),(479,678),(619,679),(35,680),(122,680),(178,680),(118,681),(33,682),(119,682),(440,683),(480,683),(75,684),(76,684),(157,685),(224,685),(445,685),(462,685),(606,685),(630,686),(32,687),(34,687),(114,687),(118,687),(121,687),(199,687),(219,687),(329,687),(631,688),(494,689),(117,690),(257,691),(315,691),(494,691),(634,691),(633,692),(34,693),(121,693),(219,693),(634,694),(636,695),(139,696),(139,697),(58,698),(149,698),(165,698),(197,698),(245,698),(589,698);
/*!40000 ALTER TABLE `help_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `help_topic`
--

DROP TABLE IF EXISTS `help_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `help_topic` (
  `help_topic_id` int(10) unsigned NOT NULL,
  `name` char(64) NOT NULL,
  `help_category_id` smallint(5) unsigned NOT NULL,
  `description` text NOT NULL,
  `example` text NOT NULL,
  `url` text NOT NULL,
  PRIMARY KEY (`help_topic_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 COMMENT='help topics';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `help_topic`
--

LOCK TABLES `help_topic` WRITE;
/*!40000 ALTER TABLE `help_topic` DISABLE KEYS */;
/*!40000 ALTER TABLE `help_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `innodb_index_stats`
--

DROP TABLE IF EXISTS `innodb_index_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `innodb_index_stats` (
  `database_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(199) COLLATE utf8_bin NOT NULL,
  `index_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `stat_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `stat_value` bigint(20) unsigned NOT NULL,
  `sample_size` bigint(20) unsigned DEFAULT NULL,
  `stat_description` varchar(1024) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`database_name`,`table_name`,`index_name`,`stat_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin STATS_PERSISTENT=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `innodb_index_stats`
--

LOCK TABLES `innodb_index_stats` WRITE;
/*!40000 ALTER TABLE `innodb_index_stats` DISABLE KEYS */;
INSERT INTO `innodb_index_stats` VALUES ('my_wiki','actor','PRIMARY','2019-02-06 01:55:04','n_diff_pfx01',0,1,'actor_id'),('my_wiki','actor','PRIMARY','2019-02-06 01:55:04','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','actor','PRIMARY','2019-02-06 01:55:04','size',1,NULL,'Number of pages in the index'),('my_wiki','actor','actor_name','2019-02-06 01:55:04','n_diff_pfx01',0,1,'actor_name'),('my_wiki','actor','actor_name','2019-02-06 01:55:04','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','actor','actor_name','2019-02-06 01:55:04','size',1,NULL,'Number of pages in the index'),('my_wiki','actor','actor_user','2019-02-06 01:55:04','n_diff_pfx01',0,1,'actor_user'),('my_wiki','actor','actor_user','2019-02-06 01:55:04','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','actor','actor_user','2019-02-06 01:55:04','size',1,NULL,'Number of pages in the index'),('my_wiki','archive','PRIMARY','2019-02-06 01:55:04','n_diff_pfx01',0,1,'ar_id'),('my_wiki','archive','PRIMARY','2019-02-06 01:55:04','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','archive','PRIMARY','2019-02-06 01:55:04','size',1,NULL,'Number of pages in the index'),('my_wiki','archive','ar_actor_timestamp','2019-02-06 01:55:04','n_diff_pfx01',0,1,'ar_actor'),('my_wiki','archive','ar_actor_timestamp','2019-02-06 01:55:04','n_diff_pfx02',0,1,'ar_actor,ar_timestamp'),('my_wiki','archive','ar_actor_timestamp','2019-02-06 01:55:04','n_diff_pfx03',0,1,'ar_actor,ar_timestamp,ar_id'),('my_wiki','archive','ar_actor_timestamp','2019-02-06 01:55:04','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','archive','ar_actor_timestamp','2019-02-06 01:55:04','size',1,NULL,'Number of pages in the index'),('my_wiki','archive','ar_revid_uniq','2019-02-06 01:55:04','n_diff_pfx01',0,1,'ar_rev_id'),('my_wiki','archive','ar_revid_uniq','2019-02-06 01:55:04','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','archive','ar_revid_uniq','2019-02-06 01:55:04','size',1,NULL,'Number of pages in the index'),('my_wiki','archive','ar_usertext_timestamp','2019-02-06 01:55:04','n_diff_pfx01',0,1,'ar_user_text'),('my_wiki','archive','ar_usertext_timestamp','2019-02-06 01:55:04','n_diff_pfx02',0,1,'ar_user_text,ar_timestamp'),('my_wiki','archive','ar_usertext_timestamp','2019-02-06 01:55:04','n_diff_pfx03',0,1,'ar_user_text,ar_timestamp,ar_id'),('my_wiki','archive','ar_usertext_timestamp','2019-02-06 01:55:04','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','archive','ar_usertext_timestamp','2019-02-06 01:55:04','size',1,NULL,'Number of pages in the index'),('my_wiki','archive','name_title_timestamp','2019-02-06 01:55:04','n_diff_pfx01',0,1,'ar_namespace'),('my_wiki','archive','name_title_timestamp','2019-02-06 01:55:04','n_diff_pfx02',0,1,'ar_namespace,ar_title'),('my_wiki','archive','name_title_timestamp','2019-02-06 01:55:04','n_diff_pfx03',0,1,'ar_namespace,ar_title,ar_timestamp'),('my_wiki','archive','name_title_timestamp','2019-02-06 01:55:04','n_diff_pfx04',0,1,'ar_namespace,ar_title,ar_timestamp,ar_id'),('my_wiki','archive','name_title_timestamp','2019-02-06 01:55:04','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','archive','name_title_timestamp','2019-02-06 01:55:04','size',1,NULL,'Number of pages in the index'),('my_wiki','bot_passwords','PRIMARY','2019-02-06 01:55:04','n_diff_pfx01',0,1,'bp_user'),('my_wiki','bot_passwords','PRIMARY','2019-02-06 01:55:04','n_diff_pfx02',0,1,'bp_user,bp_app_id'),('my_wiki','bot_passwords','PRIMARY','2019-02-06 01:55:04','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','bot_passwords','PRIMARY','2019-02-06 01:55:04','size',1,NULL,'Number of pages in the index'),('my_wiki','category','PRIMARY','2019-02-06 07:02:44','n_diff_pfx01',0,1,'cat_id'),('my_wiki','category','PRIMARY','2019-02-06 07:02:44','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','category','PRIMARY','2019-02-06 07:02:44','size',1,NULL,'Number of pages in the index'),('my_wiki','category','cat_pages','2019-02-06 07:02:44','n_diff_pfx01',0,1,'cat_pages'),('my_wiki','category','cat_pages','2019-02-06 07:02:44','n_diff_pfx02',0,1,'cat_pages,cat_id'),('my_wiki','category','cat_pages','2019-02-06 07:02:44','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','category','cat_pages','2019-02-06 07:02:44','size',1,NULL,'Number of pages in the index'),('my_wiki','category','cat_title','2019-02-06 07:02:44','n_diff_pfx01',0,1,'cat_title'),('my_wiki','category','cat_title','2019-02-06 07:02:44','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','category','cat_title','2019-02-06 07:02:44','size',1,NULL,'Number of pages in the index'),('my_wiki','categorylinks','PRIMARY','2019-02-06 07:02:24','n_diff_pfx01',0,1,'cl_from'),('my_wiki','categorylinks','PRIMARY','2019-02-06 07:02:24','n_diff_pfx02',0,1,'cl_from,cl_to'),('my_wiki','categorylinks','PRIMARY','2019-02-06 07:02:24','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','categorylinks','PRIMARY','2019-02-06 07:02:24','size',1,NULL,'Number of pages in the index'),('my_wiki','categorylinks','cl_collation_ext','2019-02-06 07:02:24','n_diff_pfx01',0,1,'cl_collation'),('my_wiki','categorylinks','cl_collation_ext','2019-02-06 07:02:24','n_diff_pfx02',0,1,'cl_collation,cl_to'),('my_wiki','categorylinks','cl_collation_ext','2019-02-06 07:02:24','n_diff_pfx03',0,1,'cl_collation,cl_to,cl_type'),('my_wiki','categorylinks','cl_collation_ext','2019-02-06 07:02:24','n_diff_pfx04',0,1,'cl_collation,cl_to,cl_type,cl_from'),('my_wiki','categorylinks','cl_collation_ext','2019-02-06 07:02:24','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','categorylinks','cl_collation_ext','2019-02-06 07:02:24','size',1,NULL,'Number of pages in the index'),('my_wiki','categorylinks','cl_sortkey','2019-02-06 07:02:24','n_diff_pfx01',0,1,'cl_to'),('my_wiki','categorylinks','cl_sortkey','2019-02-06 07:02:24','n_diff_pfx02',0,1,'cl_to,cl_type'),('my_wiki','categorylinks','cl_sortkey','2019-02-06 07:02:24','n_diff_pfx03',0,1,'cl_to,cl_type,cl_sortkey'),('my_wiki','categorylinks','cl_sortkey','2019-02-06 07:02:24','n_diff_pfx04',0,1,'cl_to,cl_type,cl_sortkey,cl_from'),('my_wiki','categorylinks','cl_sortkey','2019-02-06 07:02:24','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','categorylinks','cl_sortkey','2019-02-06 07:02:24','size',1,NULL,'Number of pages in the index'),('my_wiki','categorylinks','cl_timestamp','2019-02-06 07:02:24','n_diff_pfx01',0,1,'cl_to'),('my_wiki','categorylinks','cl_timestamp','2019-02-06 07:02:24','n_diff_pfx02',0,1,'cl_to,cl_timestamp'),('my_wiki','categorylinks','cl_timestamp','2019-02-06 07:02:24','n_diff_pfx03',0,1,'cl_to,cl_timestamp,cl_from'),('my_wiki','categorylinks','cl_timestamp','2019-02-06 07:02:24','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','categorylinks','cl_timestamp','2019-02-06 07:02:24','size',1,NULL,'Number of pages in the index'),('my_wiki','change_tag','PRIMARY','2019-02-06 06:47:34','n_diff_pfx01',2,1,'ct_id'),('my_wiki','change_tag','PRIMARY','2019-02-06 06:47:34','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','change_tag','PRIMARY','2019-02-06 06:47:34','size',1,NULL,'Number of pages in the index'),('my_wiki','change_tag','change_tag_log_tag_id','2019-02-06 06:47:34','n_diff_pfx01',1,1,'ct_log_id'),('my_wiki','change_tag','change_tag_log_tag_id','2019-02-06 06:47:34','n_diff_pfx02',1,1,'ct_log_id,ct_tag_id'),('my_wiki','change_tag','change_tag_log_tag_id','2019-02-06 06:47:34','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','change_tag','change_tag_log_tag_id','2019-02-06 06:47:34','size',1,NULL,'Number of pages in the index'),('my_wiki','change_tag','change_tag_log_tag_nonuniq','2019-02-06 06:47:34','n_diff_pfx01',1,1,'ct_log_id'),('my_wiki','change_tag','change_tag_log_tag_nonuniq','2019-02-06 06:47:34','n_diff_pfx02',1,1,'ct_log_id,ct_tag'),('my_wiki','change_tag','change_tag_log_tag_nonuniq','2019-02-06 06:47:34','n_diff_pfx03',2,1,'ct_log_id,ct_tag,ct_id'),('my_wiki','change_tag','change_tag_log_tag_nonuniq','2019-02-06 06:47:34','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','change_tag','change_tag_log_tag_nonuniq','2019-02-06 06:47:34','size',1,NULL,'Number of pages in the index'),('my_wiki','change_tag','change_tag_rc_tag_id','2019-02-06 06:47:34','n_diff_pfx01',2,1,'ct_rc_id'),('my_wiki','change_tag','change_tag_rc_tag_id','2019-02-06 06:47:34','n_diff_pfx02',2,1,'ct_rc_id,ct_tag_id'),('my_wiki','change_tag','change_tag_rc_tag_id','2019-02-06 06:47:34','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','change_tag','change_tag_rc_tag_id','2019-02-06 06:47:34','size',1,NULL,'Number of pages in the index'),('my_wiki','change_tag','change_tag_rc_tag_nonuniq','2019-02-06 06:47:34','n_diff_pfx01',2,1,'ct_rc_id'),('my_wiki','change_tag','change_tag_rc_tag_nonuniq','2019-02-06 06:47:34','n_diff_pfx02',2,1,'ct_rc_id,ct_tag'),('my_wiki','change_tag','change_tag_rc_tag_nonuniq','2019-02-06 06:47:34','n_diff_pfx03',2,1,'ct_rc_id,ct_tag,ct_id'),('my_wiki','change_tag','change_tag_rc_tag_nonuniq','2019-02-06 06:47:34','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','change_tag','change_tag_rc_tag_nonuniq','2019-02-06 06:47:34','size',1,NULL,'Number of pages in the index'),('my_wiki','change_tag','change_tag_rev_tag_id','2019-02-06 06:47:34','n_diff_pfx01',2,1,'ct_rev_id'),('my_wiki','change_tag','change_tag_rev_tag_id','2019-02-06 06:47:34','n_diff_pfx02',2,1,'ct_rev_id,ct_tag_id'),('my_wiki','change_tag','change_tag_rev_tag_id','2019-02-06 06:47:34','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','change_tag','change_tag_rev_tag_id','2019-02-06 06:47:34','size',1,NULL,'Number of pages in the index'),('my_wiki','change_tag','change_tag_rev_tag_nonuniq','2019-02-06 06:47:34','n_diff_pfx01',2,1,'ct_rev_id'),('my_wiki','change_tag','change_tag_rev_tag_nonuniq','2019-02-06 06:47:34','n_diff_pfx02',2,1,'ct_rev_id,ct_tag'),('my_wiki','change_tag','change_tag_rev_tag_nonuniq','2019-02-06 06:47:34','n_diff_pfx03',2,1,'ct_rev_id,ct_tag,ct_id'),('my_wiki','change_tag','change_tag_rev_tag_nonuniq','2019-02-06 06:47:34','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','change_tag','change_tag_rev_tag_nonuniq','2019-02-06 06:47:34','size',1,NULL,'Number of pages in the index'),('my_wiki','change_tag','change_tag_tag_id','2019-02-06 06:47:34','n_diff_pfx01',1,1,'ct_tag'),('my_wiki','change_tag','change_tag_tag_id','2019-02-06 06:47:34','n_diff_pfx02',2,1,'ct_tag,ct_rc_id'),('my_wiki','change_tag','change_tag_tag_id','2019-02-06 06:47:34','n_diff_pfx03',2,1,'ct_tag,ct_rc_id,ct_rev_id'),('my_wiki','change_tag','change_tag_tag_id','2019-02-06 06:47:34','n_diff_pfx04',2,1,'ct_tag,ct_rc_id,ct_rev_id,ct_log_id'),('my_wiki','change_tag','change_tag_tag_id','2019-02-06 06:47:34','n_diff_pfx05',2,1,'ct_tag,ct_rc_id,ct_rev_id,ct_log_id,ct_id'),('my_wiki','change_tag','change_tag_tag_id','2019-02-06 06:47:34','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','change_tag','change_tag_tag_id','2019-02-06 06:47:34','size',1,NULL,'Number of pages in the index'),('my_wiki','change_tag','change_tag_tag_id_id','2019-02-06 06:47:34','n_diff_pfx01',1,1,'ct_tag_id'),('my_wiki','change_tag','change_tag_tag_id_id','2019-02-06 06:47:34','n_diff_pfx02',2,1,'ct_tag_id,ct_rc_id'),('my_wiki','change_tag','change_tag_tag_id_id','2019-02-06 06:47:34','n_diff_pfx03',2,1,'ct_tag_id,ct_rc_id,ct_rev_id'),('my_wiki','change_tag','change_tag_tag_id_id','2019-02-06 06:47:34','n_diff_pfx04',2,1,'ct_tag_id,ct_rc_id,ct_rev_id,ct_log_id'),('my_wiki','change_tag','change_tag_tag_id_id','2019-02-06 06:47:34','n_diff_pfx05',2,1,'ct_tag_id,ct_rc_id,ct_rev_id,ct_log_id,ct_id'),('my_wiki','change_tag','change_tag_tag_id_id','2019-02-06 06:47:34','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','change_tag','change_tag_tag_id_id','2019-02-06 06:47:34','size',1,NULL,'Number of pages in the index'),('my_wiki','change_tag_def','PRIMARY','2019-02-06 06:27:46','n_diff_pfx01',1,1,'ctd_id'),('my_wiki','change_tag_def','PRIMARY','2019-02-06 06:27:46','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','change_tag_def','PRIMARY','2019-02-06 06:27:46','size',1,NULL,'Number of pages in the index'),('my_wiki','change_tag_def','ctd_count','2019-02-06 06:27:46','n_diff_pfx01',1,1,'ctd_count'),('my_wiki','change_tag_def','ctd_count','2019-02-06 06:27:46','n_diff_pfx02',1,1,'ctd_count,ctd_id'),('my_wiki','change_tag_def','ctd_count','2019-02-06 06:27:46','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','change_tag_def','ctd_count','2019-02-06 06:27:46','size',1,NULL,'Number of pages in the index'),('my_wiki','change_tag_def','ctd_name','2019-02-06 06:27:46','n_diff_pfx01',1,1,'ctd_name'),('my_wiki','change_tag_def','ctd_name','2019-02-06 06:27:46','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','change_tag_def','ctd_name','2019-02-06 06:27:46','size',1,NULL,'Number of pages in the index'),('my_wiki','change_tag_def','ctd_user_defined','2019-02-06 06:27:46','n_diff_pfx01',1,1,'ctd_user_defined'),('my_wiki','change_tag_def','ctd_user_defined','2019-02-06 06:27:46','n_diff_pfx02',1,1,'ctd_user_defined,ctd_id'),('my_wiki','change_tag_def','ctd_user_defined','2019-02-06 06:27:46','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','change_tag_def','ctd_user_defined','2019-02-06 06:27:46','size',1,NULL,'Number of pages in the index'),('my_wiki','comment','PRIMARY','2019-02-06 01:55:05','n_diff_pfx01',0,1,'comment_id'),('my_wiki','comment','PRIMARY','2019-02-06 01:55:05','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','comment','PRIMARY','2019-02-06 01:55:05','size',1,NULL,'Number of pages in the index'),('my_wiki','comment','comment_hash','2019-02-06 01:55:05','n_diff_pfx01',0,1,'comment_hash'),('my_wiki','comment','comment_hash','2019-02-06 01:55:05','n_diff_pfx02',0,1,'comment_hash,comment_id'),('my_wiki','comment','comment_hash','2019-02-06 01:55:05','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','comment','comment_hash','2019-02-06 01:55:05','size',1,NULL,'Number of pages in the index'),('my_wiki','content','PRIMARY','2019-02-06 06:53:45','n_diff_pfx01',59,1,'content_id'),('my_wiki','content','PRIMARY','2019-02-06 06:53:45','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','content','PRIMARY','2019-02-06 06:53:45','size',1,NULL,'Number of pages in the index'),('my_wiki','content_models','PRIMARY','2019-02-06 01:55:05','n_diff_pfx01',0,1,'model_id'),('my_wiki','content_models','PRIMARY','2019-02-06 01:55:05','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','content_models','PRIMARY','2019-02-06 01:55:05','size',1,NULL,'Number of pages in the index'),('my_wiki','content_models','model_name','2019-02-06 01:55:05','n_diff_pfx01',0,1,'model_name'),('my_wiki','content_models','model_name','2019-02-06 01:55:05','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','content_models','model_name','2019-02-06 01:55:05','size',1,NULL,'Number of pages in the index'),('my_wiki','externallinks','PRIMARY','2019-02-06 01:55:05','n_diff_pfx01',0,1,'el_id'),('my_wiki','externallinks','PRIMARY','2019-02-06 01:55:05','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','externallinks','PRIMARY','2019-02-06 01:55:05','size',1,NULL,'Number of pages in the index'),('my_wiki','externallinks','el_from','2019-02-06 01:55:05','n_diff_pfx01',0,1,'el_from'),('my_wiki','externallinks','el_from','2019-02-06 01:55:05','n_diff_pfx02',0,1,'el_from,el_to'),('my_wiki','externallinks','el_from','2019-02-06 01:55:05','n_diff_pfx03',0,1,'el_from,el_to,el_id'),('my_wiki','externallinks','el_from','2019-02-06 01:55:05','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','externallinks','el_from','2019-02-06 01:55:05','size',1,NULL,'Number of pages in the index'),('my_wiki','externallinks','el_from_index_60','2019-02-06 01:55:05','n_diff_pfx01',0,1,'el_from'),('my_wiki','externallinks','el_from_index_60','2019-02-06 01:55:05','n_diff_pfx02',0,1,'el_from,el_index_60'),('my_wiki','externallinks','el_from_index_60','2019-02-06 01:55:05','n_diff_pfx03',0,1,'el_from,el_index_60,el_id'),('my_wiki','externallinks','el_from_index_60','2019-02-06 01:55:05','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','externallinks','el_from_index_60','2019-02-06 01:55:05','size',1,NULL,'Number of pages in the index'),('my_wiki','externallinks','el_index','2019-02-06 01:55:05','n_diff_pfx01',0,1,'el_index'),('my_wiki','externallinks','el_index','2019-02-06 01:55:05','n_diff_pfx02',0,1,'el_index,el_id'),('my_wiki','externallinks','el_index','2019-02-06 01:55:05','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','externallinks','el_index','2019-02-06 01:55:05','size',1,NULL,'Number of pages in the index'),('my_wiki','externallinks','el_index_60','2019-02-06 01:55:05','n_diff_pfx01',0,1,'el_index_60'),('my_wiki','externallinks','el_index_60','2019-02-06 01:55:05','n_diff_pfx02',0,1,'el_index_60,el_id'),('my_wiki','externallinks','el_index_60','2019-02-06 01:55:05','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','externallinks','el_index_60','2019-02-06 01:55:05','size',1,NULL,'Number of pages in the index'),('my_wiki','externallinks','el_to','2019-02-06 01:55:05','n_diff_pfx01',0,1,'el_to'),('my_wiki','externallinks','el_to','2019-02-06 01:55:05','n_diff_pfx02',0,1,'el_to,el_from'),('my_wiki','externallinks','el_to','2019-02-06 01:55:05','n_diff_pfx03',0,1,'el_to,el_from,el_id'),('my_wiki','externallinks','el_to','2019-02-06 01:55:05','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','externallinks','el_to','2019-02-06 01:55:05','size',1,NULL,'Number of pages in the index'),('my_wiki','filearchive','PRIMARY','2019-02-06 01:55:05','n_diff_pfx01',0,1,'fa_id'),('my_wiki','filearchive','PRIMARY','2019-02-06 01:55:05','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','filearchive','PRIMARY','2019-02-06 01:55:05','size',1,NULL,'Number of pages in the index'),('my_wiki','filearchive','fa_actor_timestamp','2019-02-06 01:55:05','n_diff_pfx01',0,1,'fa_actor'),('my_wiki','filearchive','fa_actor_timestamp','2019-02-06 01:55:05','n_diff_pfx02',0,1,'fa_actor,fa_timestamp'),('my_wiki','filearchive','fa_actor_timestamp','2019-02-06 01:55:05','n_diff_pfx03',0,1,'fa_actor,fa_timestamp,fa_id'),('my_wiki','filearchive','fa_actor_timestamp','2019-02-06 01:55:05','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','filearchive','fa_actor_timestamp','2019-02-06 01:55:05','size',1,NULL,'Number of pages in the index'),('my_wiki','filearchive','fa_deleted_timestamp','2019-02-06 01:55:05','n_diff_pfx01',0,1,'fa_deleted_timestamp'),('my_wiki','filearchive','fa_deleted_timestamp','2019-02-06 01:55:05','n_diff_pfx02',0,1,'fa_deleted_timestamp,fa_id'),('my_wiki','filearchive','fa_deleted_timestamp','2019-02-06 01:55:05','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','filearchive','fa_deleted_timestamp','2019-02-06 01:55:05','size',1,NULL,'Number of pages in the index'),('my_wiki','filearchive','fa_name','2019-02-06 01:55:05','n_diff_pfx01',0,1,'fa_name'),('my_wiki','filearchive','fa_name','2019-02-06 01:55:05','n_diff_pfx02',0,1,'fa_name,fa_timestamp'),('my_wiki','filearchive','fa_name','2019-02-06 01:55:05','n_diff_pfx03',0,1,'fa_name,fa_timestamp,fa_id'),('my_wiki','filearchive','fa_name','2019-02-06 01:55:05','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','filearchive','fa_name','2019-02-06 01:55:05','size',1,NULL,'Number of pages in the index'),('my_wiki','filearchive','fa_sha1','2019-02-06 01:55:05','n_diff_pfx01',0,1,'fa_sha1'),('my_wiki','filearchive','fa_sha1','2019-02-06 01:55:05','n_diff_pfx02',0,1,'fa_sha1,fa_id'),('my_wiki','filearchive','fa_sha1','2019-02-06 01:55:05','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','filearchive','fa_sha1','2019-02-06 01:55:05','size',1,NULL,'Number of pages in the index'),('my_wiki','filearchive','fa_storage_group','2019-02-06 01:55:05','n_diff_pfx01',0,1,'fa_storage_group'),('my_wiki','filearchive','fa_storage_group','2019-02-06 01:55:05','n_diff_pfx02',0,1,'fa_storage_group,fa_storage_key'),('my_wiki','filearchive','fa_storage_group','2019-02-06 01:55:05','n_diff_pfx03',0,1,'fa_storage_group,fa_storage_key,fa_id'),('my_wiki','filearchive','fa_storage_group','2019-02-06 01:55:05','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','filearchive','fa_storage_group','2019-02-06 01:55:05','size',1,NULL,'Number of pages in the index'),('my_wiki','filearchive','fa_user_timestamp','2019-02-06 01:55:05','n_diff_pfx01',0,1,'fa_user_text'),('my_wiki','filearchive','fa_user_timestamp','2019-02-06 01:55:05','n_diff_pfx02',0,1,'fa_user_text,fa_timestamp'),('my_wiki','filearchive','fa_user_timestamp','2019-02-06 01:55:05','n_diff_pfx03',0,1,'fa_user_text,fa_timestamp,fa_id'),('my_wiki','filearchive','fa_user_timestamp','2019-02-06 01:55:05','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','filearchive','fa_user_timestamp','2019-02-06 01:55:05','size',1,NULL,'Number of pages in the index'),('my_wiki','image','PRIMARY','2019-02-06 06:53:41','n_diff_pfx01',8,1,'img_name'),('my_wiki','image','PRIMARY','2019-02-06 06:53:41','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','image','PRIMARY','2019-02-06 06:53:41','size',1,NULL,'Number of pages in the index'),('my_wiki','image','img_actor_timestamp','2019-02-06 06:53:41','n_diff_pfx01',1,1,'img_actor'),('my_wiki','image','img_actor_timestamp','2019-02-06 06:53:41','n_diff_pfx02',8,1,'img_actor,img_timestamp'),('my_wiki','image','img_actor_timestamp','2019-02-06 06:53:41','n_diff_pfx03',8,1,'img_actor,img_timestamp,img_name'),('my_wiki','image','img_actor_timestamp','2019-02-06 06:53:41','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','image','img_actor_timestamp','2019-02-06 06:53:41','size',1,NULL,'Number of pages in the index'),('my_wiki','image','img_media_mime','2019-02-06 06:53:41','n_diff_pfx01',2,1,'img_media_type'),('my_wiki','image','img_media_mime','2019-02-06 06:53:41','n_diff_pfx02',2,1,'img_media_type,img_major_mime'),('my_wiki','image','img_media_mime','2019-02-06 06:53:41','n_diff_pfx03',2,1,'img_media_type,img_major_mime,img_minor_mime'),('my_wiki','image','img_media_mime','2019-02-06 06:53:41','n_diff_pfx04',8,1,'img_media_type,img_major_mime,img_minor_mime,img_name'),('my_wiki','image','img_media_mime','2019-02-06 06:53:41','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','image','img_media_mime','2019-02-06 06:53:41','size',1,NULL,'Number of pages in the index'),('my_wiki','image','img_sha1','2019-02-06 06:53:41','n_diff_pfx01',8,1,'img_sha1'),('my_wiki','image','img_sha1','2019-02-06 06:53:41','n_diff_pfx02',8,1,'img_sha1,img_name'),('my_wiki','image','img_sha1','2019-02-06 06:53:41','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','image','img_sha1','2019-02-06 06:53:41','size',1,NULL,'Number of pages in the index'),('my_wiki','image','img_size','2019-02-06 06:53:41','n_diff_pfx01',8,1,'img_size'),('my_wiki','image','img_size','2019-02-06 06:53:41','n_diff_pfx02',8,1,'img_size,img_name'),('my_wiki','image','img_size','2019-02-06 06:53:41','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','image','img_size','2019-02-06 06:53:41','size',1,NULL,'Number of pages in the index'),('my_wiki','image','img_timestamp','2019-02-06 06:53:41','n_diff_pfx01',8,1,'img_timestamp'),('my_wiki','image','img_timestamp','2019-02-06 06:53:41','n_diff_pfx02',8,1,'img_timestamp,img_name'),('my_wiki','image','img_timestamp','2019-02-06 06:53:41','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','image','img_timestamp','2019-02-06 06:53:41','size',1,NULL,'Number of pages in the index'),('my_wiki','image','img_user_timestamp','2019-02-06 06:53:41','n_diff_pfx01',1,1,'img_user'),('my_wiki','image','img_user_timestamp','2019-02-06 06:53:41','n_diff_pfx02',8,1,'img_user,img_timestamp'),('my_wiki','image','img_user_timestamp','2019-02-06 06:53:41','n_diff_pfx03',8,1,'img_user,img_timestamp,img_name'),('my_wiki','image','img_user_timestamp','2019-02-06 06:53:41','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','image','img_user_timestamp','2019-02-06 06:53:41','size',1,NULL,'Number of pages in the index'),('my_wiki','image','img_usertext_timestamp','2019-02-06 06:53:41','n_diff_pfx01',1,1,'img_user_text'),('my_wiki','image','img_usertext_timestamp','2019-02-06 06:53:41','n_diff_pfx02',8,1,'img_user_text,img_timestamp'),('my_wiki','image','img_usertext_timestamp','2019-02-06 06:53:41','n_diff_pfx03',8,1,'img_user_text,img_timestamp,img_name'),('my_wiki','image','img_usertext_timestamp','2019-02-06 06:53:41','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','image','img_usertext_timestamp','2019-02-06 06:53:41','size',1,NULL,'Number of pages in the index'),('my_wiki','imagelinks','PRIMARY','2019-02-06 06:53:37','n_diff_pfx01',5,1,'il_from'),('my_wiki','imagelinks','PRIMARY','2019-02-06 06:53:37','n_diff_pfx02',8,1,'il_from,il_to'),('my_wiki','imagelinks','PRIMARY','2019-02-06 06:53:37','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','imagelinks','PRIMARY','2019-02-06 06:53:37','size',1,NULL,'Number of pages in the index'),('my_wiki','imagelinks','il_backlinks_namespace','2019-02-06 06:53:37','n_diff_pfx01',1,1,'il_from_namespace'),('my_wiki','imagelinks','il_backlinks_namespace','2019-02-06 06:53:37','n_diff_pfx02',8,1,'il_from_namespace,il_to'),('my_wiki','imagelinks','il_backlinks_namespace','2019-02-06 06:53:37','n_diff_pfx03',8,1,'il_from_namespace,il_to,il_from'),('my_wiki','imagelinks','il_backlinks_namespace','2019-02-06 06:53:37','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','imagelinks','il_backlinks_namespace','2019-02-06 06:53:37','size',1,NULL,'Number of pages in the index'),('my_wiki','imagelinks','il_to','2019-02-06 06:53:37','n_diff_pfx01',8,1,'il_to'),('my_wiki','imagelinks','il_to','2019-02-06 06:53:37','n_diff_pfx02',8,1,'il_to,il_from'),('my_wiki','imagelinks','il_to','2019-02-06 06:53:37','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','imagelinks','il_to','2019-02-06 06:53:37','size',1,NULL,'Number of pages in the index'),('my_wiki','interwiki','PRIMARY','2019-02-06 01:55:19','n_diff_pfx01',66,1,'iw_prefix'),('my_wiki','interwiki','PRIMARY','2019-02-06 01:55:19','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','interwiki','PRIMARY','2019-02-06 01:55:19','size',1,NULL,'Number of pages in the index'),('my_wiki','ip_changes','PRIMARY','2019-02-06 01:55:06','n_diff_pfx01',0,1,'ipc_rev_id'),('my_wiki','ip_changes','PRIMARY','2019-02-06 01:55:06','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','ip_changes','PRIMARY','2019-02-06 01:55:06','size',1,NULL,'Number of pages in the index'),('my_wiki','ip_changes','ipc_hex_time','2019-02-06 01:55:06','n_diff_pfx01',0,1,'ipc_hex'),('my_wiki','ip_changes','ipc_hex_time','2019-02-06 01:55:06','n_diff_pfx02',0,1,'ipc_hex,ipc_rev_timestamp'),('my_wiki','ip_changes','ipc_hex_time','2019-02-06 01:55:06','n_diff_pfx03',0,1,'ipc_hex,ipc_rev_timestamp,ipc_rev_id'),('my_wiki','ip_changes','ipc_hex_time','2019-02-06 01:55:06','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','ip_changes','ipc_hex_time','2019-02-06 01:55:06','size',1,NULL,'Number of pages in the index'),('my_wiki','ip_changes','ipc_rev_timestamp','2019-02-06 01:55:06','n_diff_pfx01',0,1,'ipc_rev_timestamp'),('my_wiki','ip_changes','ipc_rev_timestamp','2019-02-06 01:55:06','n_diff_pfx02',0,1,'ipc_rev_timestamp,ipc_rev_id'),('my_wiki','ip_changes','ipc_rev_timestamp','2019-02-06 01:55:06','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','ip_changes','ipc_rev_timestamp','2019-02-06 01:55:06','size',1,NULL,'Number of pages in the index'),('my_wiki','ipblocks','PRIMARY','2019-02-06 01:55:06','n_diff_pfx01',0,1,'ipb_id'),('my_wiki','ipblocks','PRIMARY','2019-02-06 01:55:06','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','ipblocks','PRIMARY','2019-02-06 01:55:06','size',1,NULL,'Number of pages in the index'),('my_wiki','ipblocks','ipb_address','2019-02-06 01:55:06','n_diff_pfx01',0,1,'ipb_address'),('my_wiki','ipblocks','ipb_address','2019-02-06 01:55:06','n_diff_pfx02',0,1,'ipb_address,ipb_user'),('my_wiki','ipblocks','ipb_address','2019-02-06 01:55:06','n_diff_pfx03',0,1,'ipb_address,ipb_user,ipb_auto'),('my_wiki','ipblocks','ipb_address','2019-02-06 01:55:06','n_diff_pfx04',0,1,'ipb_address,ipb_user,ipb_auto,ipb_anon_only'),('my_wiki','ipblocks','ipb_address','2019-02-06 01:55:06','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','ipblocks','ipb_address','2019-02-06 01:55:06','size',1,NULL,'Number of pages in the index'),('my_wiki','ipblocks','ipb_expiry','2019-02-06 01:55:06','n_diff_pfx01',0,1,'ipb_expiry'),('my_wiki','ipblocks','ipb_expiry','2019-02-06 01:55:06','n_diff_pfx02',0,1,'ipb_expiry,ipb_id'),('my_wiki','ipblocks','ipb_expiry','2019-02-06 01:55:06','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','ipblocks','ipb_expiry','2019-02-06 01:55:06','size',1,NULL,'Number of pages in the index'),('my_wiki','ipblocks','ipb_parent_block_id','2019-02-06 01:55:06','n_diff_pfx01',0,1,'ipb_parent_block_id'),('my_wiki','ipblocks','ipb_parent_block_id','2019-02-06 01:55:06','n_diff_pfx02',0,1,'ipb_parent_block_id,ipb_id'),('my_wiki','ipblocks','ipb_parent_block_id','2019-02-06 01:55:06','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','ipblocks','ipb_parent_block_id','2019-02-06 01:55:06','size',1,NULL,'Number of pages in the index'),('my_wiki','ipblocks','ipb_range','2019-02-06 01:55:06','n_diff_pfx01',0,1,'ipb_range_start'),('my_wiki','ipblocks','ipb_range','2019-02-06 01:55:06','n_diff_pfx02',0,1,'ipb_range_start,ipb_range_end'),('my_wiki','ipblocks','ipb_range','2019-02-06 01:55:06','n_diff_pfx03',0,1,'ipb_range_start,ipb_range_end,ipb_id'),('my_wiki','ipblocks','ipb_range','2019-02-06 01:55:06','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','ipblocks','ipb_range','2019-02-06 01:55:06','size',1,NULL,'Number of pages in the index'),('my_wiki','ipblocks','ipb_timestamp','2019-02-06 01:55:06','n_diff_pfx01',0,1,'ipb_timestamp'),('my_wiki','ipblocks','ipb_timestamp','2019-02-06 01:55:06','n_diff_pfx02',0,1,'ipb_timestamp,ipb_id'),('my_wiki','ipblocks','ipb_timestamp','2019-02-06 01:55:06','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','ipblocks','ipb_timestamp','2019-02-06 01:55:06','size',1,NULL,'Number of pages in the index'),('my_wiki','ipblocks','ipb_user','2019-02-06 01:55:06','n_diff_pfx01',0,1,'ipb_user'),('my_wiki','ipblocks','ipb_user','2019-02-06 01:55:06','n_diff_pfx02',0,1,'ipb_user,ipb_id'),('my_wiki','ipblocks','ipb_user','2019-02-06 01:55:06','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','ipblocks','ipb_user','2019-02-06 01:55:06','size',1,NULL,'Number of pages in the index'),('my_wiki','ipblocks_restrictions','PRIMARY','2019-02-06 01:55:06','n_diff_pfx01',0,1,'ir_ipb_id'),('my_wiki','ipblocks_restrictions','PRIMARY','2019-02-06 01:55:06','n_diff_pfx02',0,1,'ir_ipb_id,ir_type'),('my_wiki','ipblocks_restrictions','PRIMARY','2019-02-06 01:55:06','n_diff_pfx03',0,1,'ir_ipb_id,ir_type,ir_value'),('my_wiki','ipblocks_restrictions','PRIMARY','2019-02-06 01:55:06','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','ipblocks_restrictions','PRIMARY','2019-02-06 01:55:06','size',1,NULL,'Number of pages in the index'),('my_wiki','ipblocks_restrictions','ir_type_value','2019-02-06 01:55:06','n_diff_pfx01',0,1,'ir_type'),('my_wiki','ipblocks_restrictions','ir_type_value','2019-02-06 01:55:06','n_diff_pfx02',0,1,'ir_type,ir_value'),('my_wiki','ipblocks_restrictions','ir_type_value','2019-02-06 01:55:06','n_diff_pfx03',0,1,'ir_type,ir_value,ir_ipb_id'),('my_wiki','ipblocks_restrictions','ir_type_value','2019-02-06 01:55:06','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','ipblocks_restrictions','ir_type_value','2019-02-06 01:55:06','size',1,NULL,'Number of pages in the index'),('my_wiki','iwlinks','PRIMARY','2019-02-06 01:55:06','n_diff_pfx01',0,1,'iwl_from'),('my_wiki','iwlinks','PRIMARY','2019-02-06 01:55:06','n_diff_pfx02',0,1,'iwl_from,iwl_prefix'),('my_wiki','iwlinks','PRIMARY','2019-02-06 01:55:06','n_diff_pfx03',0,1,'iwl_from,iwl_prefix,iwl_title'),('my_wiki','iwlinks','PRIMARY','2019-02-06 01:55:06','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','iwlinks','PRIMARY','2019-02-06 01:55:06','size',1,NULL,'Number of pages in the index'),('my_wiki','iwlinks','iwl_prefix_from_title','2019-02-06 01:55:06','n_diff_pfx01',0,1,'iwl_prefix'),('my_wiki','iwlinks','iwl_prefix_from_title','2019-02-06 01:55:06','n_diff_pfx02',0,1,'iwl_prefix,iwl_from'),('my_wiki','iwlinks','iwl_prefix_from_title','2019-02-06 01:55:06','n_diff_pfx03',0,1,'iwl_prefix,iwl_from,iwl_title'),('my_wiki','iwlinks','iwl_prefix_from_title','2019-02-06 01:55:06','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','iwlinks','iwl_prefix_from_title','2019-02-06 01:55:06','size',1,NULL,'Number of pages in the index'),('my_wiki','iwlinks','iwl_prefix_title_from','2019-02-06 01:55:06','n_diff_pfx01',0,1,'iwl_prefix'),('my_wiki','iwlinks','iwl_prefix_title_from','2019-02-06 01:55:06','n_diff_pfx02',0,1,'iwl_prefix,iwl_title'),('my_wiki','iwlinks','iwl_prefix_title_from','2019-02-06 01:55:06','n_diff_pfx03',0,1,'iwl_prefix,iwl_title,iwl_from'),('my_wiki','iwlinks','iwl_prefix_title_from','2019-02-06 01:55:06','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','iwlinks','iwl_prefix_title_from','2019-02-06 01:55:06','size',1,NULL,'Number of pages in the index'),('my_wiki','job','PRIMARY','2019-02-06 07:02:54','n_diff_pfx01',0,1,'job_id'),('my_wiki','job','PRIMARY','2019-02-06 07:02:54','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','job','PRIMARY','2019-02-06 07:02:54','size',1,NULL,'Number of pages in the index'),('my_wiki','job','job_cmd','2019-02-06 07:02:54','n_diff_pfx01',0,1,'job_cmd'),('my_wiki','job','job_cmd','2019-02-06 07:02:54','n_diff_pfx02',0,1,'job_cmd,job_namespace'),('my_wiki','job','job_cmd','2019-02-06 07:02:54','n_diff_pfx03',0,1,'job_cmd,job_namespace,job_title'),('my_wiki','job','job_cmd','2019-02-06 07:02:54','n_diff_pfx04',0,1,'job_cmd,job_namespace,job_title,job_params'),('my_wiki','job','job_cmd','2019-02-06 07:02:54','n_diff_pfx05',0,1,'job_cmd,job_namespace,job_title,job_params,job_id'),('my_wiki','job','job_cmd','2019-02-06 07:02:54','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','job','job_cmd','2019-02-06 07:02:54','size',1,NULL,'Number of pages in the index'),('my_wiki','job','job_cmd_token','2019-02-06 07:02:54','n_diff_pfx01',0,1,'job_cmd'),('my_wiki','job','job_cmd_token','2019-02-06 07:02:54','n_diff_pfx02',0,1,'job_cmd,job_token'),('my_wiki','job','job_cmd_token','2019-02-06 07:02:54','n_diff_pfx03',0,1,'job_cmd,job_token,job_random'),('my_wiki','job','job_cmd_token','2019-02-06 07:02:54','n_diff_pfx04',0,1,'job_cmd,job_token,job_random,job_id'),('my_wiki','job','job_cmd_token','2019-02-06 07:02:54','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','job','job_cmd_token','2019-02-06 07:02:54','size',1,NULL,'Number of pages in the index'),('my_wiki','job','job_cmd_token_id','2019-02-06 07:02:54','n_diff_pfx01',0,1,'job_cmd'),('my_wiki','job','job_cmd_token_id','2019-02-06 07:02:54','n_diff_pfx02',0,1,'job_cmd,job_token'),('my_wiki','job','job_cmd_token_id','2019-02-06 07:02:54','n_diff_pfx03',0,1,'job_cmd,job_token,job_id'),('my_wiki','job','job_cmd_token_id','2019-02-06 07:02:54','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','job','job_cmd_token_id','2019-02-06 07:02:54','size',1,NULL,'Number of pages in the index'),('my_wiki','job','job_sha1','2019-02-06 07:02:54','n_diff_pfx01',0,1,'job_sha1'),('my_wiki','job','job_sha1','2019-02-06 07:02:54','n_diff_pfx02',0,1,'job_sha1,job_id'),('my_wiki','job','job_sha1','2019-02-06 07:02:54','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','job','job_sha1','2019-02-06 07:02:54','size',1,NULL,'Number of pages in the index'),('my_wiki','job','job_timestamp','2019-02-06 07:02:54','n_diff_pfx01',0,1,'job_timestamp'),('my_wiki','job','job_timestamp','2019-02-06 07:02:54','n_diff_pfx02',0,1,'job_timestamp,job_id'),('my_wiki','job','job_timestamp','2019-02-06 07:02:54','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','job','job_timestamp','2019-02-06 07:02:54','size',1,NULL,'Number of pages in the index'),('my_wiki','l10n_cache','PRIMARY','2019-02-06 04:55:15','n_diff_pfx01',0,2,'lc_lang'),('my_wiki','l10n_cache','PRIMARY','2019-02-06 04:55:15','n_diff_pfx02',6507,20,'lc_lang,lc_key'),('my_wiki','l10n_cache','PRIMARY','2019-02-06 04:55:15','n_leaf_pages',69,NULL,'Number of leaf pages in the index'),('my_wiki','l10n_cache','PRIMARY','2019-02-06 04:55:15','size',144,NULL,'Number of pages in the index'),('my_wiki','langlinks','PRIMARY','2019-02-06 01:55:07','n_diff_pfx01',0,1,'ll_from'),('my_wiki','langlinks','PRIMARY','2019-02-06 01:55:07','n_diff_pfx02',0,1,'ll_from,ll_lang'),('my_wiki','langlinks','PRIMARY','2019-02-06 01:55:07','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','langlinks','PRIMARY','2019-02-06 01:55:07','size',1,NULL,'Number of pages in the index'),('my_wiki','langlinks','ll_lang','2019-02-06 01:55:07','n_diff_pfx01',0,1,'ll_lang'),('my_wiki','langlinks','ll_lang','2019-02-06 01:55:07','n_diff_pfx02',0,1,'ll_lang,ll_title'),('my_wiki','langlinks','ll_lang','2019-02-06 01:55:07','n_diff_pfx03',0,1,'ll_lang,ll_title,ll_from'),('my_wiki','langlinks','ll_lang','2019-02-06 01:55:07','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','langlinks','ll_lang','2019-02-06 01:55:07','size',1,NULL,'Number of pages in the index'),('my_wiki','log_search','PRIMARY','2019-02-06 06:53:50','n_diff_pfx01',1,1,'ls_field'),('my_wiki','log_search','PRIMARY','2019-02-06 06:53:50','n_diff_pfx02',19,1,'ls_field,ls_value'),('my_wiki','log_search','PRIMARY','2019-02-06 06:53:50','n_diff_pfx03',27,1,'ls_field,ls_value,ls_log_id'),('my_wiki','log_search','PRIMARY','2019-02-06 06:53:50','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','log_search','PRIMARY','2019-02-06 06:53:50','size',1,NULL,'Number of pages in the index'),('my_wiki','log_search','ls_log_id','2019-02-06 06:53:50','n_diff_pfx01',27,1,'ls_log_id'),('my_wiki','log_search','ls_log_id','2019-02-06 06:53:50','n_diff_pfx02',27,1,'ls_log_id,ls_field'),('my_wiki','log_search','ls_log_id','2019-02-06 06:53:50','n_diff_pfx03',27,1,'ls_log_id,ls_field,ls_value'),('my_wiki','log_search','ls_log_id','2019-02-06 06:53:50','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','log_search','ls_log_id','2019-02-06 06:53:50','size',1,NULL,'Number of pages in the index'),('my_wiki','logging','PRIMARY','2019-02-06 06:54:00','n_diff_pfx01',27,1,'log_id'),('my_wiki','logging','PRIMARY','2019-02-06 06:54:00','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','logging','PRIMARY','2019-02-06 06:54:00','size',1,NULL,'Number of pages in the index'),('my_wiki','logging','actor_time','2019-02-06 06:54:00','n_diff_pfx01',1,1,'log_actor'),('my_wiki','logging','actor_time','2019-02-06 06:54:00','n_diff_pfx02',19,1,'log_actor,log_timestamp'),('my_wiki','logging','actor_time','2019-02-06 06:54:00','n_diff_pfx03',27,1,'log_actor,log_timestamp,log_id'),('my_wiki','logging','actor_time','2019-02-06 06:54:00','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','logging','actor_time','2019-02-06 06:54:00','size',1,NULL,'Number of pages in the index'),('my_wiki','logging','log_actor_type_time','2019-02-06 06:54:00','n_diff_pfx01',1,1,'log_actor'),('my_wiki','logging','log_actor_type_time','2019-02-06 06:54:00','n_diff_pfx02',2,1,'log_actor,log_type'),('my_wiki','logging','log_actor_type_time','2019-02-06 06:54:00','n_diff_pfx03',27,1,'log_actor,log_type,log_timestamp'),('my_wiki','logging','log_actor_type_time','2019-02-06 06:54:00','n_diff_pfx04',27,1,'log_actor,log_type,log_timestamp,log_id'),('my_wiki','logging','log_actor_type_time','2019-02-06 06:54:00','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','logging','log_actor_type_time','2019-02-06 06:54:00','size',1,NULL,'Number of pages in the index'),('my_wiki','logging','log_page_id_time','2019-02-06 06:54:00','n_diff_pfx01',19,1,'log_page'),('my_wiki','logging','log_page_id_time','2019-02-06 06:54:00','n_diff_pfx02',19,1,'log_page,log_timestamp'),('my_wiki','logging','log_page_id_time','2019-02-06 06:54:00','n_diff_pfx03',27,1,'log_page,log_timestamp,log_id'),('my_wiki','logging','log_page_id_time','2019-02-06 06:54:00','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','logging','log_page_id_time','2019-02-06 06:54:00','size',1,NULL,'Number of pages in the index'),('my_wiki','logging','log_type_action','2019-02-06 06:54:00','n_diff_pfx01',2,1,'log_type'),('my_wiki','logging','log_type_action','2019-02-06 06:54:00','n_diff_pfx02',2,1,'log_type,log_action'),('my_wiki','logging','log_type_action','2019-02-06 06:54:00','n_diff_pfx03',27,1,'log_type,log_action,log_timestamp'),('my_wiki','logging','log_type_action','2019-02-06 06:54:00','n_diff_pfx04',27,1,'log_type,log_action,log_timestamp,log_id'),('my_wiki','logging','log_type_action','2019-02-06 06:54:00','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','logging','log_type_action','2019-02-06 06:54:00','size',1,NULL,'Number of pages in the index'),('my_wiki','logging','log_user_text_time','2019-02-06 06:54:00','n_diff_pfx01',2,1,'log_user_text'),('my_wiki','logging','log_user_text_time','2019-02-06 06:54:00','n_diff_pfx02',19,1,'log_user_text,log_timestamp'),('my_wiki','logging','log_user_text_time','2019-02-06 06:54:00','n_diff_pfx03',27,1,'log_user_text,log_timestamp,log_id'),('my_wiki','logging','log_user_text_time','2019-02-06 06:54:00','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','logging','log_user_text_time','2019-02-06 06:54:00','size',1,NULL,'Number of pages in the index'),('my_wiki','logging','log_user_text_type_time','2019-02-06 06:54:00','n_diff_pfx01',2,1,'log_user_text'),('my_wiki','logging','log_user_text_type_time','2019-02-06 06:54:00','n_diff_pfx02',3,1,'log_user_text,log_type'),('my_wiki','logging','log_user_text_type_time','2019-02-06 06:54:00','n_diff_pfx03',27,1,'log_user_text,log_type,log_timestamp'),('my_wiki','logging','log_user_text_type_time','2019-02-06 06:54:00','n_diff_pfx04',27,1,'log_user_text,log_type,log_timestamp,log_id'),('my_wiki','logging','log_user_text_type_time','2019-02-06 06:54:00','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','logging','log_user_text_type_time','2019-02-06 06:54:00','size',1,NULL,'Number of pages in the index'),('my_wiki','logging','log_user_type_time','2019-02-06 06:54:00','n_diff_pfx01',2,1,'log_user'),('my_wiki','logging','log_user_type_time','2019-02-06 06:54:00','n_diff_pfx02',3,1,'log_user,log_type'),('my_wiki','logging','log_user_type_time','2019-02-06 06:54:00','n_diff_pfx03',27,1,'log_user,log_type,log_timestamp'),('my_wiki','logging','log_user_type_time','2019-02-06 06:54:00','n_diff_pfx04',27,1,'log_user,log_type,log_timestamp,log_id'),('my_wiki','logging','log_user_type_time','2019-02-06 06:54:00','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','logging','log_user_type_time','2019-02-06 06:54:00','size',1,NULL,'Number of pages in the index'),('my_wiki','logging','page_time','2019-02-06 06:54:00','n_diff_pfx01',3,1,'log_namespace'),('my_wiki','logging','page_time','2019-02-06 06:54:00','n_diff_pfx02',19,1,'log_namespace,log_title'),('my_wiki','logging','page_time','2019-02-06 06:54:00','n_diff_pfx03',19,1,'log_namespace,log_title,log_timestamp'),('my_wiki','logging','page_time','2019-02-06 06:54:00','n_diff_pfx04',27,1,'log_namespace,log_title,log_timestamp,log_id'),('my_wiki','logging','page_time','2019-02-06 06:54:00','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','logging','page_time','2019-02-06 06:54:00','size',1,NULL,'Number of pages in the index'),('my_wiki','logging','times','2019-02-06 06:54:00','n_diff_pfx01',19,1,'log_timestamp'),('my_wiki','logging','times','2019-02-06 06:54:00','n_diff_pfx02',27,1,'log_timestamp,log_id'),('my_wiki','logging','times','2019-02-06 06:54:00','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','logging','times','2019-02-06 06:54:00','size',1,NULL,'Number of pages in the index'),('my_wiki','logging','type_time','2019-02-06 06:54:00','n_diff_pfx01',2,1,'log_type'),('my_wiki','logging','type_time','2019-02-06 06:54:00','n_diff_pfx02',27,1,'log_type,log_timestamp'),('my_wiki','logging','type_time','2019-02-06 06:54:00','n_diff_pfx03',27,1,'log_type,log_timestamp,log_id'),('my_wiki','logging','type_time','2019-02-06 06:54:00','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','logging','type_time','2019-02-06 06:54:00','size',1,NULL,'Number of pages in the index'),('my_wiki','logging','user_time','2019-02-06 06:54:00','n_diff_pfx01',2,1,'log_user'),('my_wiki','logging','user_time','2019-02-06 06:54:00','n_diff_pfx02',19,1,'log_user,log_timestamp'),('my_wiki','logging','user_time','2019-02-06 06:54:00','n_diff_pfx03',27,1,'log_user,log_timestamp,log_id'),('my_wiki','logging','user_time','2019-02-06 06:54:00','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','logging','user_time','2019-02-06 06:54:00','size',1,NULL,'Number of pages in the index'),('my_wiki','module_deps','PRIMARY','2019-02-06 05:50:09','n_diff_pfx01',35,1,'md_module'),('my_wiki','module_deps','PRIMARY','2019-02-06 05:50:09','n_diff_pfx02',35,1,'md_module,md_skin'),('my_wiki','module_deps','PRIMARY','2019-02-06 05:50:09','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','module_deps','PRIMARY','2019-02-06 05:50:09','size',1,NULL,'Number of pages in the index'),('my_wiki','objectcache','PRIMARY','2019-02-06 07:02:34','n_diff_pfx01',116,4,'keyname'),('my_wiki','objectcache','PRIMARY','2019-02-06 07:02:34','n_leaf_pages',4,NULL,'Number of leaf pages in the index'),('my_wiki','objectcache','PRIMARY','2019-02-06 07:02:34','size',5,NULL,'Number of pages in the index'),('my_wiki','objectcache','exptime','2019-02-06 07:02:34','n_diff_pfx01',58,1,'exptime'),('my_wiki','objectcache','exptime','2019-02-06 07:02:34','n_diff_pfx02',116,1,'exptime,keyname'),('my_wiki','objectcache','exptime','2019-02-06 07:02:34','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','objectcache','exptime','2019-02-06 07:02:34','size',1,NULL,'Number of pages in the index'),('my_wiki','oldimage','GEN_CLUST_INDEX','2019-02-06 01:55:07','n_diff_pfx01',0,1,'DB_ROW_ID'),('my_wiki','oldimage','GEN_CLUST_INDEX','2019-02-06 01:55:07','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','oldimage','GEN_CLUST_INDEX','2019-02-06 01:55:07','size',1,NULL,'Number of pages in the index'),('my_wiki','oldimage','oi_actor_timestamp','2019-02-06 01:55:07','n_diff_pfx01',0,1,'oi_actor'),('my_wiki','oldimage','oi_actor_timestamp','2019-02-06 01:55:07','n_diff_pfx02',0,1,'oi_actor,oi_timestamp'),('my_wiki','oldimage','oi_actor_timestamp','2019-02-06 01:55:07','n_diff_pfx03',0,1,'oi_actor,oi_timestamp,DB_ROW_ID'),('my_wiki','oldimage','oi_actor_timestamp','2019-02-06 01:55:07','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','oldimage','oi_actor_timestamp','2019-02-06 01:55:07','size',1,NULL,'Number of pages in the index'),('my_wiki','oldimage','oi_name_archive_name','2019-02-06 01:55:07','n_diff_pfx01',0,1,'oi_name'),('my_wiki','oldimage','oi_name_archive_name','2019-02-06 01:55:07','n_diff_pfx02',0,1,'oi_name,oi_archive_name'),('my_wiki','oldimage','oi_name_archive_name','2019-02-06 01:55:07','n_diff_pfx03',0,1,'oi_name,oi_archive_name,DB_ROW_ID'),('my_wiki','oldimage','oi_name_archive_name','2019-02-06 01:55:07','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','oldimage','oi_name_archive_name','2019-02-06 01:55:07','size',1,NULL,'Number of pages in the index'),('my_wiki','oldimage','oi_name_timestamp','2019-02-06 01:55:07','n_diff_pfx01',0,1,'oi_name'),('my_wiki','oldimage','oi_name_timestamp','2019-02-06 01:55:07','n_diff_pfx02',0,1,'oi_name,oi_timestamp'),('my_wiki','oldimage','oi_name_timestamp','2019-02-06 01:55:07','n_diff_pfx03',0,1,'oi_name,oi_timestamp,DB_ROW_ID'),('my_wiki','oldimage','oi_name_timestamp','2019-02-06 01:55:07','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','oldimage','oi_name_timestamp','2019-02-06 01:55:07','size',1,NULL,'Number of pages in the index'),('my_wiki','oldimage','oi_sha1','2019-02-06 01:55:07','n_diff_pfx01',0,1,'oi_sha1'),('my_wiki','oldimage','oi_sha1','2019-02-06 01:55:07','n_diff_pfx02',0,1,'oi_sha1,DB_ROW_ID'),('my_wiki','oldimage','oi_sha1','2019-02-06 01:55:07','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','oldimage','oi_sha1','2019-02-06 01:55:07','size',1,NULL,'Number of pages in the index'),('my_wiki','oldimage','oi_usertext_timestamp','2019-02-06 01:55:07','n_diff_pfx01',0,1,'oi_user_text'),('my_wiki','oldimage','oi_usertext_timestamp','2019-02-06 01:55:07','n_diff_pfx02',0,1,'oi_user_text,oi_timestamp'),('my_wiki','oldimage','oi_usertext_timestamp','2019-02-06 01:55:07','n_diff_pfx03',0,1,'oi_user_text,oi_timestamp,DB_ROW_ID'),('my_wiki','oldimage','oi_usertext_timestamp','2019-02-06 01:55:07','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','oldimage','oi_usertext_timestamp','2019-02-06 01:55:07','size',1,NULL,'Number of pages in the index'),('my_wiki','page','PRIMARY','2019-02-06 06:58:33','n_diff_pfx01',19,1,'page_id'),('my_wiki','page','PRIMARY','2019-02-06 06:58:33','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','page','PRIMARY','2019-02-06 06:58:33','size',1,NULL,'Number of pages in the index'),('my_wiki','page','name_title','2019-02-06 06:58:33','n_diff_pfx01',3,1,'page_namespace'),('my_wiki','page','name_title','2019-02-06 06:58:33','n_diff_pfx02',19,1,'page_namespace,page_title'),('my_wiki','page','name_title','2019-02-06 06:58:33','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','page','name_title','2019-02-06 06:58:33','size',1,NULL,'Number of pages in the index'),('my_wiki','page','page_len','2019-02-06 06:58:33','n_diff_pfx01',10,1,'page_len'),('my_wiki','page','page_len','2019-02-06 06:58:33','n_diff_pfx02',19,1,'page_len,page_id'),('my_wiki','page','page_len','2019-02-06 06:58:33','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','page','page_len','2019-02-06 06:58:33','size',1,NULL,'Number of pages in the index'),('my_wiki','page','page_random','2019-02-06 06:58:33','n_diff_pfx01',19,1,'page_random'),('my_wiki','page','page_random','2019-02-06 06:58:33','n_diff_pfx02',19,1,'page_random,page_id'),('my_wiki','page','page_random','2019-02-06 06:58:33','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','page','page_random','2019-02-06 06:58:33','size',1,NULL,'Number of pages in the index'),('my_wiki','page','page_redirect_namespace_len','2019-02-06 06:58:33','n_diff_pfx01',1,1,'page_is_redirect'),('my_wiki','page','page_redirect_namespace_len','2019-02-06 06:58:33','n_diff_pfx02',3,1,'page_is_redirect,page_namespace'),('my_wiki','page','page_redirect_namespace_len','2019-02-06 06:58:33','n_diff_pfx03',11,1,'page_is_redirect,page_namespace,page_len'),('my_wiki','page','page_redirect_namespace_len','2019-02-06 06:58:33','n_diff_pfx04',19,1,'page_is_redirect,page_namespace,page_len,page_id'),('my_wiki','page','page_redirect_namespace_len','2019-02-06 06:58:33','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','page','page_redirect_namespace_len','2019-02-06 06:58:33','size',1,NULL,'Number of pages in the index'),('my_wiki','page_props','PRIMARY','2019-02-06 01:55:07','n_diff_pfx01',0,1,'pp_page'),('my_wiki','page_props','PRIMARY','2019-02-06 01:55:07','n_diff_pfx02',0,1,'pp_page,pp_propname'),('my_wiki','page_props','PRIMARY','2019-02-06 01:55:07','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','page_props','PRIMARY','2019-02-06 01:55:07','size',1,NULL,'Number of pages in the index'),('my_wiki','page_props','pp_propname_page','2019-02-06 01:55:07','n_diff_pfx01',0,1,'pp_propname'),('my_wiki','page_props','pp_propname_page','2019-02-06 01:55:07','n_diff_pfx02',0,1,'pp_propname,pp_page'),('my_wiki','page_props','pp_propname_page','2019-02-06 01:55:07','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','page_props','pp_propname_page','2019-02-06 01:55:07','size',1,NULL,'Number of pages in the index'),('my_wiki','page_props','pp_propname_sortkey_page','2019-02-06 01:55:07','n_diff_pfx01',0,1,'pp_propname'),('my_wiki','page_props','pp_propname_sortkey_page','2019-02-06 01:55:07','n_diff_pfx02',0,1,'pp_propname,pp_sortkey'),('my_wiki','page_props','pp_propname_sortkey_page','2019-02-06 01:55:07','n_diff_pfx03',0,1,'pp_propname,pp_sortkey,pp_page'),('my_wiki','page_props','pp_propname_sortkey_page','2019-02-06 01:55:07','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','page_props','pp_propname_sortkey_page','2019-02-06 01:55:07','size',1,NULL,'Number of pages in the index'),('my_wiki','page_restrictions','PRIMARY','2019-02-06 01:55:08','n_diff_pfx01',0,1,'pr_id'),('my_wiki','page_restrictions','PRIMARY','2019-02-06 01:55:08','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','page_restrictions','PRIMARY','2019-02-06 01:55:08','size',1,NULL,'Number of pages in the index'),('my_wiki','page_restrictions','pr_cascade','2019-02-06 01:55:08','n_diff_pfx01',0,1,'pr_cascade'),('my_wiki','page_restrictions','pr_cascade','2019-02-06 01:55:08','n_diff_pfx02',0,1,'pr_cascade,pr_id'),('my_wiki','page_restrictions','pr_cascade','2019-02-06 01:55:08','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','page_restrictions','pr_cascade','2019-02-06 01:55:08','size',1,NULL,'Number of pages in the index'),('my_wiki','page_restrictions','pr_level','2019-02-06 01:55:08','n_diff_pfx01',0,1,'pr_level'),('my_wiki','page_restrictions','pr_level','2019-02-06 01:55:08','n_diff_pfx02',0,1,'pr_level,pr_id'),('my_wiki','page_restrictions','pr_level','2019-02-06 01:55:08','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','page_restrictions','pr_level','2019-02-06 01:55:08','size',1,NULL,'Number of pages in the index'),('my_wiki','page_restrictions','pr_pagetype','2019-02-06 01:55:08','n_diff_pfx01',0,1,'pr_page'),('my_wiki','page_restrictions','pr_pagetype','2019-02-06 01:55:08','n_diff_pfx02',0,1,'pr_page,pr_type'),('my_wiki','page_restrictions','pr_pagetype','2019-02-06 01:55:08','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','page_restrictions','pr_pagetype','2019-02-06 01:55:08','size',1,NULL,'Number of pages in the index'),('my_wiki','page_restrictions','pr_typelevel','2019-02-06 01:55:08','n_diff_pfx01',0,1,'pr_type'),('my_wiki','page_restrictions','pr_typelevel','2019-02-06 01:55:08','n_diff_pfx02',0,1,'pr_type,pr_level'),('my_wiki','page_restrictions','pr_typelevel','2019-02-06 01:55:08','n_diff_pfx03',0,1,'pr_type,pr_level,pr_id'),('my_wiki','page_restrictions','pr_typelevel','2019-02-06 01:55:08','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','page_restrictions','pr_typelevel','2019-02-06 01:55:08','size',1,NULL,'Number of pages in the index'),('my_wiki','pagelinks','PRIMARY','2019-02-06 05:48:12','n_diff_pfx01',2,1,'pl_from'),('my_wiki','pagelinks','PRIMARY','2019-02-06 05:48:12','n_diff_pfx02',2,1,'pl_from,pl_namespace'),('my_wiki','pagelinks','PRIMARY','2019-02-06 05:48:12','n_diff_pfx03',6,1,'pl_from,pl_namespace,pl_title'),('my_wiki','pagelinks','PRIMARY','2019-02-06 05:48:12','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','pagelinks','PRIMARY','2019-02-06 05:48:12','size',1,NULL,'Number of pages in the index'),('my_wiki','pagelinks','pl_backlinks_namespace','2019-02-06 05:48:12','n_diff_pfx01',1,1,'pl_from_namespace'),('my_wiki','pagelinks','pl_backlinks_namespace','2019-02-06 05:48:12','n_diff_pfx02',1,1,'pl_from_namespace,pl_namespace'),('my_wiki','pagelinks','pl_backlinks_namespace','2019-02-06 05:48:12','n_diff_pfx03',6,1,'pl_from_namespace,pl_namespace,pl_title'),('my_wiki','pagelinks','pl_backlinks_namespace','2019-02-06 05:48:12','n_diff_pfx04',6,1,'pl_from_namespace,pl_namespace,pl_title,pl_from'),('my_wiki','pagelinks','pl_backlinks_namespace','2019-02-06 05:48:12','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','pagelinks','pl_backlinks_namespace','2019-02-06 05:48:12','size',1,NULL,'Number of pages in the index'),('my_wiki','pagelinks','pl_namespace','2019-02-06 05:48:12','n_diff_pfx01',1,1,'pl_namespace'),('my_wiki','pagelinks','pl_namespace','2019-02-06 05:48:12','n_diff_pfx02',6,1,'pl_namespace,pl_title'),('my_wiki','pagelinks','pl_namespace','2019-02-06 05:48:12','n_diff_pfx03',6,1,'pl_namespace,pl_title,pl_from'),('my_wiki','pagelinks','pl_namespace','2019-02-06 05:48:12','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','pagelinks','pl_namespace','2019-02-06 05:48:12','size',1,NULL,'Number of pages in the index'),('my_wiki','protected_titles','PRIMARY','2019-02-06 01:55:08','n_diff_pfx01',0,1,'pt_namespace'),('my_wiki','protected_titles','PRIMARY','2019-02-06 01:55:08','n_diff_pfx02',0,1,'pt_namespace,pt_title'),('my_wiki','protected_titles','PRIMARY','2019-02-06 01:55:08','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','protected_titles','PRIMARY','2019-02-06 01:55:08','size',1,NULL,'Number of pages in the index'),('my_wiki','protected_titles','pt_timestamp','2019-02-06 01:55:08','n_diff_pfx01',0,1,'pt_timestamp'),('my_wiki','protected_titles','pt_timestamp','2019-02-06 01:55:08','n_diff_pfx02',0,1,'pt_timestamp,pt_namespace'),('my_wiki','protected_titles','pt_timestamp','2019-02-06 01:55:08','n_diff_pfx03',0,1,'pt_timestamp,pt_namespace,pt_title'),('my_wiki','protected_titles','pt_timestamp','2019-02-06 01:55:08','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','protected_titles','pt_timestamp','2019-02-06 01:55:08','size',1,NULL,'Number of pages in the index'),('my_wiki','querycache','GEN_CLUST_INDEX','2019-02-06 01:55:08','n_diff_pfx01',0,1,'DB_ROW_ID'),('my_wiki','querycache','GEN_CLUST_INDEX','2019-02-06 01:55:08','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','querycache','GEN_CLUST_INDEX','2019-02-06 01:55:08','size',1,NULL,'Number of pages in the index'),('my_wiki','querycache','qc_type','2019-02-06 01:55:08','n_diff_pfx01',0,1,'qc_type'),('my_wiki','querycache','qc_type','2019-02-06 01:55:08','n_diff_pfx02',0,1,'qc_type,qc_value'),('my_wiki','querycache','qc_type','2019-02-06 01:55:08','n_diff_pfx03',0,1,'qc_type,qc_value,DB_ROW_ID'),('my_wiki','querycache','qc_type','2019-02-06 01:55:08','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','querycache','qc_type','2019-02-06 01:55:08','size',1,NULL,'Number of pages in the index'),('my_wiki','querycache_info','PRIMARY','2019-02-06 01:55:08','n_diff_pfx01',0,1,'qci_type'),('my_wiki','querycache_info','PRIMARY','2019-02-06 01:55:08','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','querycache_info','PRIMARY','2019-02-06 01:55:08','size',1,NULL,'Number of pages in the index'),('my_wiki','querycachetwo','GEN_CLUST_INDEX','2019-02-06 01:55:08','n_diff_pfx01',0,1,'DB_ROW_ID'),('my_wiki','querycachetwo','GEN_CLUST_INDEX','2019-02-06 01:55:08','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','querycachetwo','GEN_CLUST_INDEX','2019-02-06 01:55:08','size',1,NULL,'Number of pages in the index'),('my_wiki','querycachetwo','qcc_title','2019-02-06 01:55:08','n_diff_pfx01',0,1,'qcc_type'),('my_wiki','querycachetwo','qcc_title','2019-02-06 01:55:08','n_diff_pfx02',0,1,'qcc_type,qcc_namespace'),('my_wiki','querycachetwo','qcc_title','2019-02-06 01:55:08','n_diff_pfx03',0,1,'qcc_type,qcc_namespace,qcc_title'),('my_wiki','querycachetwo','qcc_title','2019-02-06 01:55:08','n_diff_pfx04',0,1,'qcc_type,qcc_namespace,qcc_title,DB_ROW_ID'),('my_wiki','querycachetwo','qcc_title','2019-02-06 01:55:08','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','querycachetwo','qcc_title','2019-02-06 01:55:08','size',1,NULL,'Number of pages in the index'),('my_wiki','querycachetwo','qcc_titletwo','2019-02-06 01:55:08','n_diff_pfx01',0,1,'qcc_type'),('my_wiki','querycachetwo','qcc_titletwo','2019-02-06 01:55:08','n_diff_pfx02',0,1,'qcc_type,qcc_namespacetwo'),('my_wiki','querycachetwo','qcc_titletwo','2019-02-06 01:55:08','n_diff_pfx03',0,1,'qcc_type,qcc_namespacetwo,qcc_titletwo'),('my_wiki','querycachetwo','qcc_titletwo','2019-02-06 01:55:08','n_diff_pfx04',0,1,'qcc_type,qcc_namespacetwo,qcc_titletwo,DB_ROW_ID'),('my_wiki','querycachetwo','qcc_titletwo','2019-02-06 01:55:08','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','querycachetwo','qcc_titletwo','2019-02-06 01:55:08','size',1,NULL,'Number of pages in the index'),('my_wiki','querycachetwo','qcc_type','2019-02-06 01:55:08','n_diff_pfx01',0,1,'qcc_type'),('my_wiki','querycachetwo','qcc_type','2019-02-06 01:55:08','n_diff_pfx02',0,1,'qcc_type,qcc_value'),('my_wiki','querycachetwo','qcc_type','2019-02-06 01:55:08','n_diff_pfx03',0,1,'qcc_type,qcc_value,DB_ROW_ID'),('my_wiki','querycachetwo','qcc_type','2019-02-06 01:55:08','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','querycachetwo','qcc_type','2019-02-06 01:55:08','size',1,NULL,'Number of pages in the index'),('my_wiki','recentchanges','PRIMARY','2019-02-06 06:51:57','n_diff_pfx01',55,1,'rc_id'),('my_wiki','recentchanges','PRIMARY','2019-02-06 06:51:57','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','recentchanges','PRIMARY','2019-02-06 06:51:57','size',1,NULL,'Number of pages in the index'),('my_wiki','recentchanges','new_name_timestamp','2019-02-06 06:51:57','n_diff_pfx01',2,1,'rc_new'),('my_wiki','recentchanges','new_name_timestamp','2019-02-06 06:51:57','n_diff_pfx02',5,1,'rc_new,rc_namespace'),('my_wiki','recentchanges','new_name_timestamp','2019-02-06 06:51:57','n_diff_pfx03',55,1,'rc_new,rc_namespace,rc_timestamp'),('my_wiki','recentchanges','new_name_timestamp','2019-02-06 06:51:57','n_diff_pfx04',55,1,'rc_new,rc_namespace,rc_timestamp,rc_id'),('my_wiki','recentchanges','new_name_timestamp','2019-02-06 06:51:57','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','recentchanges','new_name_timestamp','2019-02-06 06:51:57','size',1,NULL,'Number of pages in the index'),('my_wiki','recentchanges','rc_actor','2019-02-06 06:51:57','n_diff_pfx01',1,1,'rc_actor'),('my_wiki','recentchanges','rc_actor','2019-02-06 06:51:57','n_diff_pfx02',55,1,'rc_actor,rc_timestamp'),('my_wiki','recentchanges','rc_actor','2019-02-06 06:51:57','n_diff_pfx03',55,1,'rc_actor,rc_timestamp,rc_id'),('my_wiki','recentchanges','rc_actor','2019-02-06 06:51:57','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','recentchanges','rc_actor','2019-02-06 06:51:57','size',1,NULL,'Number of pages in the index'),('my_wiki','recentchanges','rc_cur_id','2019-02-06 06:51:57','n_diff_pfx01',15,1,'rc_cur_id'),('my_wiki','recentchanges','rc_cur_id','2019-02-06 06:51:57','n_diff_pfx02',55,1,'rc_cur_id,rc_id'),('my_wiki','recentchanges','rc_cur_id','2019-02-06 06:51:57','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','recentchanges','rc_cur_id','2019-02-06 06:51:57','size',1,NULL,'Number of pages in the index'),('my_wiki','recentchanges','rc_ip','2019-02-06 06:51:57','n_diff_pfx01',1,1,'rc_ip'),('my_wiki','recentchanges','rc_ip','2019-02-06 06:51:57','n_diff_pfx02',55,1,'rc_ip,rc_id'),('my_wiki','recentchanges','rc_ip','2019-02-06 06:51:57','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','recentchanges','rc_ip','2019-02-06 06:51:57','size',1,NULL,'Number of pages in the index'),('my_wiki','recentchanges','rc_name_type_patrolled_timestamp','2019-02-06 06:51:57','n_diff_pfx01',3,1,'rc_namespace'),('my_wiki','recentchanges','rc_name_type_patrolled_timestamp','2019-02-06 06:51:57','n_diff_pfx02',5,1,'rc_namespace,rc_type'),('my_wiki','recentchanges','rc_name_type_patrolled_timestamp','2019-02-06 06:51:57','n_diff_pfx03',5,1,'rc_namespace,rc_type,rc_patrolled'),('my_wiki','recentchanges','rc_name_type_patrolled_timestamp','2019-02-06 06:51:57','n_diff_pfx04',55,1,'rc_namespace,rc_type,rc_patrolled,rc_timestamp'),('my_wiki','recentchanges','rc_name_type_patrolled_timestamp','2019-02-06 06:51:57','n_diff_pfx05',55,1,'rc_namespace,rc_type,rc_patrolled,rc_timestamp,rc_id'),('my_wiki','recentchanges','rc_name_type_patrolled_timestamp','2019-02-06 06:51:57','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','recentchanges','rc_name_type_patrolled_timestamp','2019-02-06 06:51:57','size',1,NULL,'Number of pages in the index'),('my_wiki','recentchanges','rc_namespace_title_timestamp','2019-02-06 06:51:57','n_diff_pfx01',3,1,'rc_namespace'),('my_wiki','recentchanges','rc_namespace_title_timestamp','2019-02-06 06:51:57','n_diff_pfx02',15,1,'rc_namespace,rc_title'),('my_wiki','recentchanges','rc_namespace_title_timestamp','2019-02-06 06:51:57','n_diff_pfx03',55,1,'rc_namespace,rc_title,rc_timestamp'),('my_wiki','recentchanges','rc_namespace_title_timestamp','2019-02-06 06:51:57','n_diff_pfx04',55,1,'rc_namespace,rc_title,rc_timestamp,rc_id'),('my_wiki','recentchanges','rc_namespace_title_timestamp','2019-02-06 06:51:57','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','recentchanges','rc_namespace_title_timestamp','2019-02-06 06:51:57','size',1,NULL,'Number of pages in the index'),('my_wiki','recentchanges','rc_ns_actor','2019-02-06 06:51:57','n_diff_pfx01',3,1,'rc_namespace'),('my_wiki','recentchanges','rc_ns_actor','2019-02-06 06:51:57','n_diff_pfx02',3,1,'rc_namespace,rc_actor'),('my_wiki','recentchanges','rc_ns_actor','2019-02-06 06:51:57','n_diff_pfx03',55,1,'rc_namespace,rc_actor,rc_id'),('my_wiki','recentchanges','rc_ns_actor','2019-02-06 06:51:57','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','recentchanges','rc_ns_actor','2019-02-06 06:51:57','size',1,NULL,'Number of pages in the index'),('my_wiki','recentchanges','rc_ns_usertext','2019-02-06 06:51:57','n_diff_pfx01',3,1,'rc_namespace'),('my_wiki','recentchanges','rc_ns_usertext','2019-02-06 06:51:57','n_diff_pfx02',3,1,'rc_namespace,rc_user_text'),('my_wiki','recentchanges','rc_ns_usertext','2019-02-06 06:51:57','n_diff_pfx03',55,1,'rc_namespace,rc_user_text,rc_id'),('my_wiki','recentchanges','rc_ns_usertext','2019-02-06 06:51:57','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','recentchanges','rc_ns_usertext','2019-02-06 06:51:57','size',1,NULL,'Number of pages in the index'),('my_wiki','recentchanges','rc_this_oldid','2019-02-06 06:51:57','n_diff_pfx01',55,1,'rc_this_oldid'),('my_wiki','recentchanges','rc_this_oldid','2019-02-06 06:51:57','n_diff_pfx02',55,1,'rc_this_oldid,rc_id'),('my_wiki','recentchanges','rc_this_oldid','2019-02-06 06:51:57','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','recentchanges','rc_this_oldid','2019-02-06 06:51:57','size',1,NULL,'Number of pages in the index'),('my_wiki','recentchanges','rc_timestamp','2019-02-06 06:51:57','n_diff_pfx01',55,1,'rc_timestamp'),('my_wiki','recentchanges','rc_timestamp','2019-02-06 06:51:57','n_diff_pfx02',55,1,'rc_timestamp,rc_id'),('my_wiki','recentchanges','rc_timestamp','2019-02-06 06:51:57','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','recentchanges','rc_timestamp','2019-02-06 06:51:57','size',1,NULL,'Number of pages in the index'),('my_wiki','recentchanges','rc_user_text','2019-02-06 06:51:57','n_diff_pfx01',1,1,'rc_user_text'),('my_wiki','recentchanges','rc_user_text','2019-02-06 06:51:57','n_diff_pfx02',55,1,'rc_user_text,rc_timestamp'),('my_wiki','recentchanges','rc_user_text','2019-02-06 06:51:57','n_diff_pfx03',55,1,'rc_user_text,rc_timestamp,rc_id'),('my_wiki','recentchanges','rc_user_text','2019-02-06 06:51:57','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','recentchanges','rc_user_text','2019-02-06 06:51:57','size',1,NULL,'Number of pages in the index'),('my_wiki','redirect','PRIMARY','2019-02-06 01:55:08','n_diff_pfx01',0,1,'rd_from'),('my_wiki','redirect','PRIMARY','2019-02-06 01:55:08','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','redirect','PRIMARY','2019-02-06 01:55:08','size',1,NULL,'Number of pages in the index'),('my_wiki','redirect','rd_ns_title','2019-02-06 01:55:08','n_diff_pfx01',0,1,'rd_namespace'),('my_wiki','redirect','rd_ns_title','2019-02-06 01:55:08','n_diff_pfx02',0,1,'rd_namespace,rd_title'),('my_wiki','redirect','rd_ns_title','2019-02-06 01:55:08','n_diff_pfx03',0,1,'rd_namespace,rd_title,rd_from'),('my_wiki','redirect','rd_ns_title','2019-02-06 01:55:08','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','redirect','rd_ns_title','2019-02-06 01:55:08','size',1,NULL,'Number of pages in the index'),('my_wiki','revision','PRIMARY','2019-02-06 06:53:41','n_diff_pfx01',59,1,'rev_id'),('my_wiki','revision','PRIMARY','2019-02-06 06:53:41','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','revision','PRIMARY','2019-02-06 06:53:41','size',1,NULL,'Number of pages in the index'),('my_wiki','revision','page_timestamp','2019-02-06 06:53:41','n_diff_pfx01',19,1,'rev_page'),('my_wiki','revision','page_timestamp','2019-02-06 06:53:41','n_diff_pfx02',59,1,'rev_page,rev_timestamp'),('my_wiki','revision','page_timestamp','2019-02-06 06:53:41','n_diff_pfx03',59,1,'rev_page,rev_timestamp,rev_id'),('my_wiki','revision','page_timestamp','2019-02-06 06:53:41','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','revision','page_timestamp','2019-02-06 06:53:41','size',1,NULL,'Number of pages in the index'),('my_wiki','revision','page_user_timestamp','2019-02-06 06:53:41','n_diff_pfx01',19,1,'rev_page'),('my_wiki','revision','page_user_timestamp','2019-02-06 06:53:41','n_diff_pfx02',19,1,'rev_page,rev_user'),('my_wiki','revision','page_user_timestamp','2019-02-06 06:53:41','n_diff_pfx03',59,1,'rev_page,rev_user,rev_timestamp'),('my_wiki','revision','page_user_timestamp','2019-02-06 06:53:41','n_diff_pfx04',59,1,'rev_page,rev_user,rev_timestamp,rev_id'),('my_wiki','revision','page_user_timestamp','2019-02-06 06:53:41','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','revision','page_user_timestamp','2019-02-06 06:53:41','size',1,NULL,'Number of pages in the index'),('my_wiki','revision','rev_page_id','2019-02-06 06:53:41','n_diff_pfx01',19,1,'rev_page'),('my_wiki','revision','rev_page_id','2019-02-06 06:53:41','n_diff_pfx02',59,1,'rev_page,rev_id'),('my_wiki','revision','rev_page_id','2019-02-06 06:53:41','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','revision','rev_page_id','2019-02-06 06:53:41','size',1,NULL,'Number of pages in the index'),('my_wiki','revision','rev_timestamp','2019-02-06 06:53:41','n_diff_pfx01',59,1,'rev_timestamp'),('my_wiki','revision','rev_timestamp','2019-02-06 06:53:41','n_diff_pfx02',59,1,'rev_timestamp,rev_id'),('my_wiki','revision','rev_timestamp','2019-02-06 06:53:41','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','revision','rev_timestamp','2019-02-06 06:53:41','size',1,NULL,'Number of pages in the index'),('my_wiki','revision','user_timestamp','2019-02-06 06:53:41','n_diff_pfx01',2,1,'rev_user'),('my_wiki','revision','user_timestamp','2019-02-06 06:53:41','n_diff_pfx02',59,1,'rev_user,rev_timestamp'),('my_wiki','revision','user_timestamp','2019-02-06 06:53:41','n_diff_pfx03',59,1,'rev_user,rev_timestamp,rev_id'),('my_wiki','revision','user_timestamp','2019-02-06 06:53:41','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','revision','user_timestamp','2019-02-06 06:53:41','size',1,NULL,'Number of pages in the index'),('my_wiki','revision','usertext_timestamp','2019-02-06 06:53:41','n_diff_pfx01',2,1,'rev_user_text'),('my_wiki','revision','usertext_timestamp','2019-02-06 06:53:41','n_diff_pfx02',59,1,'rev_user_text,rev_timestamp'),('my_wiki','revision','usertext_timestamp','2019-02-06 06:53:41','n_diff_pfx03',59,1,'rev_user_text,rev_timestamp,rev_id'),('my_wiki','revision','usertext_timestamp','2019-02-06 06:53:41','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','revision','usertext_timestamp','2019-02-06 06:53:41','size',1,NULL,'Number of pages in the index'),('my_wiki','revision_actor_temp','PRIMARY','2019-02-06 01:55:09','n_diff_pfx01',0,1,'revactor_rev'),('my_wiki','revision_actor_temp','PRIMARY','2019-02-06 01:55:09','n_diff_pfx02',0,1,'revactor_rev,revactor_actor'),('my_wiki','revision_actor_temp','PRIMARY','2019-02-06 01:55:09','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','revision_actor_temp','PRIMARY','2019-02-06 01:55:09','size',1,NULL,'Number of pages in the index'),('my_wiki','revision_actor_temp','actor_timestamp','2019-02-06 01:55:09','n_diff_pfx01',0,1,'revactor_actor'),('my_wiki','revision_actor_temp','actor_timestamp','2019-02-06 01:55:09','n_diff_pfx02',0,1,'revactor_actor,revactor_timestamp'),('my_wiki','revision_actor_temp','actor_timestamp','2019-02-06 01:55:09','n_diff_pfx03',0,1,'revactor_actor,revactor_timestamp,revactor_rev'),('my_wiki','revision_actor_temp','actor_timestamp','2019-02-06 01:55:09','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','revision_actor_temp','actor_timestamp','2019-02-06 01:55:09','size',1,NULL,'Number of pages in the index'),('my_wiki','revision_actor_temp','page_actor_timestamp','2019-02-06 01:55:09','n_diff_pfx01',0,1,'revactor_page'),('my_wiki','revision_actor_temp','page_actor_timestamp','2019-02-06 01:55:09','n_diff_pfx02',0,1,'revactor_page,revactor_actor'),('my_wiki','revision_actor_temp','page_actor_timestamp','2019-02-06 01:55:09','n_diff_pfx03',0,1,'revactor_page,revactor_actor,revactor_timestamp'),('my_wiki','revision_actor_temp','page_actor_timestamp','2019-02-06 01:55:09','n_diff_pfx04',0,1,'revactor_page,revactor_actor,revactor_timestamp,revactor_rev'),('my_wiki','revision_actor_temp','page_actor_timestamp','2019-02-06 01:55:09','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','revision_actor_temp','page_actor_timestamp','2019-02-06 01:55:09','size',1,NULL,'Number of pages in the index'),('my_wiki','revision_actor_temp','revactor_rev','2019-02-06 01:55:09','n_diff_pfx01',0,1,'revactor_rev'),('my_wiki','revision_actor_temp','revactor_rev','2019-02-06 01:55:09','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','revision_actor_temp','revactor_rev','2019-02-06 01:55:09','size',1,NULL,'Number of pages in the index'),('my_wiki','revision_comment_temp','PRIMARY','2019-02-06 01:55:09','n_diff_pfx01',0,1,'revcomment_rev'),('my_wiki','revision_comment_temp','PRIMARY','2019-02-06 01:55:09','n_diff_pfx02',0,1,'revcomment_rev,revcomment_comment_id'),('my_wiki','revision_comment_temp','PRIMARY','2019-02-06 01:55:09','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','revision_comment_temp','PRIMARY','2019-02-06 01:55:09','size',1,NULL,'Number of pages in the index'),('my_wiki','revision_comment_temp','revcomment_rev','2019-02-06 01:55:09','n_diff_pfx01',0,1,'revcomment_rev'),('my_wiki','revision_comment_temp','revcomment_rev','2019-02-06 01:55:09','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','revision_comment_temp','revcomment_rev','2019-02-06 01:55:09','size',1,NULL,'Number of pages in the index'),('my_wiki','site_identifiers','PRIMARY','2019-02-06 01:55:09','n_diff_pfx01',0,1,'si_type'),('my_wiki','site_identifiers','PRIMARY','2019-02-06 01:55:09','n_diff_pfx02',0,1,'si_type,si_key'),('my_wiki','site_identifiers','PRIMARY','2019-02-06 01:55:09','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','site_identifiers','PRIMARY','2019-02-06 01:55:09','size',1,NULL,'Number of pages in the index'),('my_wiki','site_identifiers','site_ids_key','2019-02-06 01:55:09','n_diff_pfx01',0,1,'si_key'),('my_wiki','site_identifiers','site_ids_key','2019-02-06 01:55:09','n_diff_pfx02',0,1,'si_key,si_type'),('my_wiki','site_identifiers','site_ids_key','2019-02-06 01:55:09','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','site_identifiers','site_ids_key','2019-02-06 01:55:09','size',1,NULL,'Number of pages in the index'),('my_wiki','site_identifiers','site_ids_site','2019-02-06 01:55:09','n_diff_pfx01',0,1,'si_site'),('my_wiki','site_identifiers','site_ids_site','2019-02-06 01:55:09','n_diff_pfx02',0,1,'si_site,si_type'),('my_wiki','site_identifiers','site_ids_site','2019-02-06 01:55:09','n_diff_pfx03',0,1,'si_site,si_type,si_key'),('my_wiki','site_identifiers','site_ids_site','2019-02-06 01:55:09','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','site_identifiers','site_ids_site','2019-02-06 01:55:09','size',1,NULL,'Number of pages in the index'),('my_wiki','site_stats','PRIMARY','2019-02-06 01:55:09','n_diff_pfx01',0,1,'ss_row_id'),('my_wiki','site_stats','PRIMARY','2019-02-06 01:55:09','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','site_stats','PRIMARY','2019-02-06 01:55:09','size',1,NULL,'Number of pages in the index'),('my_wiki','sites','PRIMARY','2019-02-06 01:55:09','n_diff_pfx01',0,1,'site_id'),('my_wiki','sites','PRIMARY','2019-02-06 01:55:09','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','sites','PRIMARY','2019-02-06 01:55:09','size',1,NULL,'Number of pages in the index'),('my_wiki','sites','sites_domain','2019-02-06 01:55:09','n_diff_pfx01',0,1,'site_domain'),('my_wiki','sites','sites_domain','2019-02-06 01:55:09','n_diff_pfx02',0,1,'site_domain,site_id'),('my_wiki','sites','sites_domain','2019-02-06 01:55:09','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','sites','sites_domain','2019-02-06 01:55:09','size',1,NULL,'Number of pages in the index'),('my_wiki','sites','sites_forward','2019-02-06 01:55:09','n_diff_pfx01',0,1,'site_forward'),('my_wiki','sites','sites_forward','2019-02-06 01:55:09','n_diff_pfx02',0,1,'site_forward,site_id'),('my_wiki','sites','sites_forward','2019-02-06 01:55:09','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','sites','sites_forward','2019-02-06 01:55:09','size',1,NULL,'Number of pages in the index'),('my_wiki','sites','sites_global_key','2019-02-06 01:55:09','n_diff_pfx01',0,1,'site_global_key'),('my_wiki','sites','sites_global_key','2019-02-06 01:55:09','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','sites','sites_global_key','2019-02-06 01:55:09','size',1,NULL,'Number of pages in the index'),('my_wiki','sites','sites_group','2019-02-06 01:55:09','n_diff_pfx01',0,1,'site_group'),('my_wiki','sites','sites_group','2019-02-06 01:55:09','n_diff_pfx02',0,1,'site_group,site_id'),('my_wiki','sites','sites_group','2019-02-06 01:55:09','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','sites','sites_group','2019-02-06 01:55:09','size',1,NULL,'Number of pages in the index'),('my_wiki','sites','sites_language','2019-02-06 01:55:09','n_diff_pfx01',0,1,'site_language'),('my_wiki','sites','sites_language','2019-02-06 01:55:09','n_diff_pfx02',0,1,'site_language,site_id'),('my_wiki','sites','sites_language','2019-02-06 01:55:09','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','sites','sites_language','2019-02-06 01:55:09','size',1,NULL,'Number of pages in the index'),('my_wiki','sites','sites_protocol','2019-02-06 01:55:09','n_diff_pfx01',0,1,'site_protocol'),('my_wiki','sites','sites_protocol','2019-02-06 01:55:09','n_diff_pfx02',0,1,'site_protocol,site_id'),('my_wiki','sites','sites_protocol','2019-02-06 01:55:09','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','sites','sites_protocol','2019-02-06 01:55:09','size',1,NULL,'Number of pages in the index'),('my_wiki','sites','sites_source','2019-02-06 01:55:09','n_diff_pfx01',0,1,'site_source'),('my_wiki','sites','sites_source','2019-02-06 01:55:09','n_diff_pfx02',0,1,'site_source,site_id'),('my_wiki','sites','sites_source','2019-02-06 01:55:09','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','sites','sites_source','2019-02-06 01:55:09','size',1,NULL,'Number of pages in the index'),('my_wiki','sites','sites_type','2019-02-06 01:55:09','n_diff_pfx01',0,1,'site_type'),('my_wiki','sites','sites_type','2019-02-06 01:55:09','n_diff_pfx02',0,1,'site_type,site_id'),('my_wiki','sites','sites_type','2019-02-06 01:55:09','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','sites','sites_type','2019-02-06 01:55:09','size',1,NULL,'Number of pages in the index'),('my_wiki','slot_roles','PRIMARY','2019-02-06 01:55:09','n_diff_pfx01',0,1,'role_id'),('my_wiki','slot_roles','PRIMARY','2019-02-06 01:55:09','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','slot_roles','PRIMARY','2019-02-06 01:55:09','size',1,NULL,'Number of pages in the index'),('my_wiki','slot_roles','role_name','2019-02-06 01:55:09','n_diff_pfx01',0,1,'role_name'),('my_wiki','slot_roles','role_name','2019-02-06 01:55:09','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','slot_roles','role_name','2019-02-06 01:55:09','size',1,NULL,'Number of pages in the index'),('my_wiki','slots','PRIMARY','2019-02-06 06:53:50','n_diff_pfx01',59,1,'slot_revision_id'),('my_wiki','slots','PRIMARY','2019-02-06 06:53:50','n_diff_pfx02',59,1,'slot_revision_id,slot_role_id'),('my_wiki','slots','PRIMARY','2019-02-06 06:53:50','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','slots','PRIMARY','2019-02-06 06:53:50','size',1,NULL,'Number of pages in the index'),('my_wiki','slots','slot_revision_origin_role','2019-02-06 06:53:50','n_diff_pfx01',59,1,'slot_revision_id'),('my_wiki','slots','slot_revision_origin_role','2019-02-06 06:53:50','n_diff_pfx02',59,1,'slot_revision_id,slot_origin'),('my_wiki','slots','slot_revision_origin_role','2019-02-06 06:53:50','n_diff_pfx03',59,1,'slot_revision_id,slot_origin,slot_role_id'),('my_wiki','slots','slot_revision_origin_role','2019-02-06 06:53:50','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','slots','slot_revision_origin_role','2019-02-06 06:53:50','size',1,NULL,'Number of pages in the index'),('my_wiki','tag_summary','PRIMARY','2019-02-06 06:47:34','n_diff_pfx01',2,1,'ts_id'),('my_wiki','tag_summary','PRIMARY','2019-02-06 06:47:34','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','tag_summary','PRIMARY','2019-02-06 06:47:34','size',1,NULL,'Number of pages in the index'),('my_wiki','tag_summary','tag_summary_log_id','2019-02-06 06:47:34','n_diff_pfx01',1,1,'ts_log_id'),('my_wiki','tag_summary','tag_summary_log_id','2019-02-06 06:47:34','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','tag_summary','tag_summary_log_id','2019-02-06 06:47:34','size',1,NULL,'Number of pages in the index'),('my_wiki','tag_summary','tag_summary_rc_id','2019-02-06 06:47:34','n_diff_pfx01',2,1,'ts_rc_id'),('my_wiki','tag_summary','tag_summary_rc_id','2019-02-06 06:47:34','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','tag_summary','tag_summary_rc_id','2019-02-06 06:47:34','size',1,NULL,'Number of pages in the index'),('my_wiki','tag_summary','tag_summary_rev_id','2019-02-06 06:47:34','n_diff_pfx01',2,1,'ts_rev_id'),('my_wiki','tag_summary','tag_summary_rev_id','2019-02-06 06:47:34','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','tag_summary','tag_summary_rev_id','2019-02-06 06:47:34','size',1,NULL,'Number of pages in the index'),('my_wiki','templatelinks','PRIMARY','2019-02-06 01:55:09','n_diff_pfx01',0,1,'tl_from'),('my_wiki','templatelinks','PRIMARY','2019-02-06 01:55:09','n_diff_pfx02',0,1,'tl_from,tl_namespace'),('my_wiki','templatelinks','PRIMARY','2019-02-06 01:55:09','n_diff_pfx03',0,1,'tl_from,tl_namespace,tl_title'),('my_wiki','templatelinks','PRIMARY','2019-02-06 01:55:09','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','templatelinks','PRIMARY','2019-02-06 01:55:09','size',1,NULL,'Number of pages in the index'),('my_wiki','templatelinks','tl_backlinks_namespace','2019-02-06 01:55:09','n_diff_pfx01',0,1,'tl_from_namespace'),('my_wiki','templatelinks','tl_backlinks_namespace','2019-02-06 01:55:09','n_diff_pfx02',0,1,'tl_from_namespace,tl_namespace'),('my_wiki','templatelinks','tl_backlinks_namespace','2019-02-06 01:55:09','n_diff_pfx03',0,1,'tl_from_namespace,tl_namespace,tl_title'),('my_wiki','templatelinks','tl_backlinks_namespace','2019-02-06 01:55:09','n_diff_pfx04',0,1,'tl_from_namespace,tl_namespace,tl_title,tl_from'),('my_wiki','templatelinks','tl_backlinks_namespace','2019-02-06 01:55:09','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','templatelinks','tl_backlinks_namespace','2019-02-06 01:55:09','size',1,NULL,'Number of pages in the index'),('my_wiki','templatelinks','tl_namespace','2019-02-06 01:55:09','n_diff_pfx01',0,1,'tl_namespace'),('my_wiki','templatelinks','tl_namespace','2019-02-06 01:55:09','n_diff_pfx02',0,1,'tl_namespace,tl_title'),('my_wiki','templatelinks','tl_namespace','2019-02-06 01:55:09','n_diff_pfx03',0,1,'tl_namespace,tl_title,tl_from'),('my_wiki','templatelinks','tl_namespace','2019-02-06 01:55:09','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','templatelinks','tl_namespace','2019-02-06 01:55:09','size',1,NULL,'Number of pages in the index'),('my_wiki','text','PRIMARY','2019-02-06 06:53:41','n_diff_pfx01',59,3,'old_id'),('my_wiki','text','PRIMARY','2019-02-06 06:53:41','n_leaf_pages',3,NULL,'Number of leaf pages in the index'),('my_wiki','text','PRIMARY','2019-02-06 06:53:41','size',4,NULL,'Number of pages in the index'),('my_wiki','updatelog','PRIMARY','2019-02-06 01:55:29','n_diff_pfx01',8,1,'ul_key'),('my_wiki','updatelog','PRIMARY','2019-02-06 01:55:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','updatelog','PRIMARY','2019-02-06 01:55:29','size',1,NULL,'Number of pages in the index'),('my_wiki','uploadstash','PRIMARY','2019-02-06 01:55:09','n_diff_pfx01',0,1,'us_id'),('my_wiki','uploadstash','PRIMARY','2019-02-06 01:55:09','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','uploadstash','PRIMARY','2019-02-06 01:55:09','size',1,NULL,'Number of pages in the index'),('my_wiki','uploadstash','us_key','2019-02-06 01:55:09','n_diff_pfx01',0,1,'us_key'),('my_wiki','uploadstash','us_key','2019-02-06 01:55:09','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','uploadstash','us_key','2019-02-06 01:55:09','size',1,NULL,'Number of pages in the index'),('my_wiki','uploadstash','us_timestamp','2019-02-06 01:55:09','n_diff_pfx01',0,1,'us_timestamp'),('my_wiki','uploadstash','us_timestamp','2019-02-06 01:55:09','n_diff_pfx02',0,1,'us_timestamp,us_id'),('my_wiki','uploadstash','us_timestamp','2019-02-06 01:55:09','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','uploadstash','us_timestamp','2019-02-06 01:55:09','size',1,NULL,'Number of pages in the index'),('my_wiki','uploadstash','us_user','2019-02-06 01:55:09','n_diff_pfx01',0,1,'us_user'),('my_wiki','uploadstash','us_user','2019-02-06 01:55:09','n_diff_pfx02',0,1,'us_user,us_id'),('my_wiki','uploadstash','us_user','2019-02-06 01:55:09','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','uploadstash','us_user','2019-02-06 01:55:09','size',1,NULL,'Number of pages in the index'),('my_wiki','user','PRIMARY','2019-02-06 01:55:10','n_diff_pfx01',0,1,'user_id'),('my_wiki','user','PRIMARY','2019-02-06 01:55:10','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','user','PRIMARY','2019-02-06 01:55:10','size',1,NULL,'Number of pages in the index'),('my_wiki','user','user_email','2019-02-06 01:55:10','n_diff_pfx01',0,1,'user_email'),('my_wiki','user','user_email','2019-02-06 01:55:10','n_diff_pfx02',0,1,'user_email,user_id'),('my_wiki','user','user_email','2019-02-06 01:55:10','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','user','user_email','2019-02-06 01:55:10','size',1,NULL,'Number of pages in the index'),('my_wiki','user','user_email_token','2019-02-06 01:55:10','n_diff_pfx01',0,1,'user_email_token'),('my_wiki','user','user_email_token','2019-02-06 01:55:10','n_diff_pfx02',0,1,'user_email_token,user_id'),('my_wiki','user','user_email_token','2019-02-06 01:55:10','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','user','user_email_token','2019-02-06 01:55:10','size',1,NULL,'Number of pages in the index'),('my_wiki','user','user_name','2019-02-06 01:55:10','n_diff_pfx01',0,1,'user_name'),('my_wiki','user','user_name','2019-02-06 01:55:10','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','user','user_name','2019-02-06 01:55:10','size',1,NULL,'Number of pages in the index'),('my_wiki','user_former_groups','PRIMARY','2019-02-06 01:55:10','n_diff_pfx01',0,1,'ufg_user'),('my_wiki','user_former_groups','PRIMARY','2019-02-06 01:55:10','n_diff_pfx02',0,1,'ufg_user,ufg_group'),('my_wiki','user_former_groups','PRIMARY','2019-02-06 01:55:10','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','user_former_groups','PRIMARY','2019-02-06 01:55:10','size',1,NULL,'Number of pages in the index'),('my_wiki','user_groups','PRIMARY','2019-02-06 01:55:39','n_diff_pfx01',1,1,'ug_user'),('my_wiki','user_groups','PRIMARY','2019-02-06 01:55:39','n_diff_pfx02',3,1,'ug_user,ug_group'),('my_wiki','user_groups','PRIMARY','2019-02-06 01:55:39','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','user_groups','PRIMARY','2019-02-06 01:55:39','size',1,NULL,'Number of pages in the index'),('my_wiki','user_groups','ug_expiry','2019-02-06 01:55:39','n_diff_pfx01',1,1,'ug_expiry'),('my_wiki','user_groups','ug_expiry','2019-02-06 01:55:39','n_diff_pfx02',1,1,'ug_expiry,ug_user'),('my_wiki','user_groups','ug_expiry','2019-02-06 01:55:39','n_diff_pfx03',3,1,'ug_expiry,ug_user,ug_group'),('my_wiki','user_groups','ug_expiry','2019-02-06 01:55:39','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','user_groups','ug_expiry','2019-02-06 01:55:39','size',1,NULL,'Number of pages in the index'),('my_wiki','user_groups','ug_group','2019-02-06 01:55:39','n_diff_pfx01',3,1,'ug_group'),('my_wiki','user_groups','ug_group','2019-02-06 01:55:39','n_diff_pfx02',3,1,'ug_group,ug_user'),('my_wiki','user_groups','ug_group','2019-02-06 01:55:39','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','user_groups','ug_group','2019-02-06 01:55:39','size',1,NULL,'Number of pages in the index'),('my_wiki','user_newtalk','GEN_CLUST_INDEX','2019-02-06 01:55:10','n_diff_pfx01',0,1,'DB_ROW_ID'),('my_wiki','user_newtalk','GEN_CLUST_INDEX','2019-02-06 01:55:10','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','user_newtalk','GEN_CLUST_INDEX','2019-02-06 01:55:10','size',1,NULL,'Number of pages in the index'),('my_wiki','user_newtalk','un_user_id','2019-02-06 01:55:10','n_diff_pfx01',0,1,'user_id'),('my_wiki','user_newtalk','un_user_id','2019-02-06 01:55:10','n_diff_pfx02',0,1,'user_id,DB_ROW_ID'),('my_wiki','user_newtalk','un_user_id','2019-02-06 01:55:10','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','user_newtalk','un_user_id','2019-02-06 01:55:10','size',1,NULL,'Number of pages in the index'),('my_wiki','user_newtalk','un_user_ip','2019-02-06 01:55:10','n_diff_pfx01',0,1,'user_ip'),('my_wiki','user_newtalk','un_user_ip','2019-02-06 01:55:10','n_diff_pfx02',0,1,'user_ip,DB_ROW_ID'),('my_wiki','user_newtalk','un_user_ip','2019-02-06 01:55:10','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','user_newtalk','un_user_ip','2019-02-06 01:55:10','size',1,NULL,'Number of pages in the index'),('my_wiki','user_properties','PRIMARY','2019-02-06 05:29:17','n_diff_pfx01',1,1,'up_user'),('my_wiki','user_properties','PRIMARY','2019-02-06 05:29:17','n_diff_pfx02',5,1,'up_user,up_property'),('my_wiki','user_properties','PRIMARY','2019-02-06 05:29:17','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','user_properties','PRIMARY','2019-02-06 05:29:17','size',1,NULL,'Number of pages in the index'),('my_wiki','user_properties','user_properties_property','2019-02-06 05:29:17','n_diff_pfx01',5,1,'up_property'),('my_wiki','user_properties','user_properties_property','2019-02-06 05:29:17','n_diff_pfx02',5,1,'up_property,up_user'),('my_wiki','user_properties','user_properties_property','2019-02-06 05:29:17','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','user_properties','user_properties_property','2019-02-06 05:29:17','size',1,NULL,'Number of pages in the index'),('my_wiki','valid_tag','PRIMARY','2019-02-06 01:55:10','n_diff_pfx01',0,1,'vt_tag'),('my_wiki','valid_tag','PRIMARY','2019-02-06 01:55:10','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','valid_tag','PRIMARY','2019-02-06 01:55:10','size',1,NULL,'Number of pages in the index'),('my_wiki','watchlist','PRIMARY','2019-02-06 02:33:53','n_diff_pfx01',2,1,'wl_id'),('my_wiki','watchlist','PRIMARY','2019-02-06 02:33:53','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','watchlist','PRIMARY','2019-02-06 02:33:53','size',1,NULL,'Number of pages in the index'),('my_wiki','watchlist','namespace_title','2019-02-06 02:33:53','n_diff_pfx01',2,1,'wl_namespace'),('my_wiki','watchlist','namespace_title','2019-02-06 02:33:53','n_diff_pfx02',2,1,'wl_namespace,wl_title'),('my_wiki','watchlist','namespace_title','2019-02-06 02:33:53','n_diff_pfx03',2,1,'wl_namespace,wl_title,wl_id'),('my_wiki','watchlist','namespace_title','2019-02-06 02:33:53','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','watchlist','namespace_title','2019-02-06 02:33:53','size',1,NULL,'Number of pages in the index'),('my_wiki','watchlist','wl_user','2019-02-06 02:33:53','n_diff_pfx01',1,1,'wl_user'),('my_wiki','watchlist','wl_user','2019-02-06 02:33:53','n_diff_pfx02',2,1,'wl_user,wl_namespace'),('my_wiki','watchlist','wl_user','2019-02-06 02:33:53','n_diff_pfx03',2,1,'wl_user,wl_namespace,wl_title'),('my_wiki','watchlist','wl_user','2019-02-06 02:33:53','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','watchlist','wl_user','2019-02-06 02:33:53','size',1,NULL,'Number of pages in the index'),('my_wiki','watchlist','wl_user_notificationtimestamp','2019-02-06 02:33:53','n_diff_pfx01',1,1,'wl_user'),('my_wiki','watchlist','wl_user_notificationtimestamp','2019-02-06 02:33:53','n_diff_pfx02',1,1,'wl_user,wl_notificationtimestamp'),('my_wiki','watchlist','wl_user_notificationtimestamp','2019-02-06 02:33:53','n_diff_pfx03',2,1,'wl_user,wl_notificationtimestamp,wl_id'),('my_wiki','watchlist','wl_user_notificationtimestamp','2019-02-06 02:33:53','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('my_wiki','watchlist','wl_user_notificationtimestamp','2019-02-06 02:33:53','size',1,NULL,'Number of pages in the index'),('mysql','gtid_executed','PRIMARY','2019-02-06 01:54:14','n_diff_pfx01',0,1,'source_uuid'),('mysql','gtid_executed','PRIMARY','2019-02-06 01:54:14','n_diff_pfx02',0,1,'source_uuid,interval_start'),('mysql','gtid_executed','PRIMARY','2019-02-06 01:54:14','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('mysql','gtid_executed','PRIMARY','2019-02-06 01:54:14','size',1,NULL,'Number of pages in the index'),('sys','sys_config','PRIMARY','2019-02-06 01:54:15','n_diff_pfx01',6,1,'variable'),('sys','sys_config','PRIMARY','2019-02-06 01:54:15','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('sys','sys_config','PRIMARY','2019-02-06 01:54:15','size',1,NULL,'Number of pages in the index');
/*!40000 ALTER TABLE `innodb_index_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `innodb_table_stats`
--

DROP TABLE IF EXISTS `innodb_table_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `innodb_table_stats` (
  `database_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(199) COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `n_rows` bigint(20) unsigned NOT NULL,
  `clustered_index_size` bigint(20) unsigned NOT NULL,
  `sum_of_other_index_sizes` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`database_name`,`table_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin STATS_PERSISTENT=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `innodb_table_stats`
--

LOCK TABLES `innodb_table_stats` WRITE;
/*!40000 ALTER TABLE `innodb_table_stats` DISABLE KEYS */;
INSERT INTO `innodb_table_stats` VALUES ('my_wiki','actor','2019-02-06 01:55:04',0,1,2),('my_wiki','archive','2019-02-06 01:55:04',0,1,4),('my_wiki','bot_passwords','2019-02-06 01:55:04',0,1,0),('my_wiki','category','2019-02-06 07:02:44',0,1,2),('my_wiki','categorylinks','2019-02-06 07:02:24',0,1,3),('my_wiki','change_tag','2019-02-06 06:47:34',2,1,8),('my_wiki','change_tag_def','2019-02-06 06:27:46',1,1,3),('my_wiki','comment','2019-02-06 01:55:05',0,1,1),('my_wiki','content','2019-02-06 06:53:45',59,1,0),('my_wiki','content_models','2019-02-06 01:55:05',0,1,1),('my_wiki','externallinks','2019-02-06 01:55:05',0,1,5),('my_wiki','filearchive','2019-02-06 01:55:05',0,1,6),('my_wiki','image','2019-02-06 06:53:41',8,1,7),('my_wiki','imagelinks','2019-02-06 06:53:37',8,1,2),('my_wiki','interwiki','2019-02-06 01:55:19',66,1,0),('my_wiki','ip_changes','2019-02-06 01:55:06',0,1,2),('my_wiki','ipblocks','2019-02-06 01:55:06',0,1,6),('my_wiki','ipblocks_restrictions','2019-02-06 01:55:06',0,1,1),('my_wiki','iwlinks','2019-02-06 01:55:06',0,1,2),('my_wiki','job','2019-02-06 07:02:54',0,1,5),('my_wiki','l10n_cache','2019-02-06 04:55:15',6507,144,0),('my_wiki','langlinks','2019-02-06 01:55:07',0,1,1),('my_wiki','log_search','2019-02-06 06:53:50',27,1,1),('my_wiki','logging','2019-02-06 06:54:00',27,1,11),('my_wiki','module_deps','2019-02-06 05:50:09',35,1,0),('my_wiki','objectcache','2019-02-06 07:02:34',116,5,1),('my_wiki','oldimage','2019-02-06 01:55:07',0,1,5),('my_wiki','page','2019-02-06 06:58:33',19,1,4),('my_wiki','page_props','2019-02-06 01:55:07',0,1,2),('my_wiki','page_restrictions','2019-02-06 01:55:08',0,1,4),('my_wiki','pagelinks','2019-02-06 05:48:12',6,1,2),('my_wiki','protected_titles','2019-02-06 01:55:08',0,1,1),('my_wiki','querycache','2019-02-06 01:55:08',0,1,1),('my_wiki','querycache_info','2019-02-06 01:55:08',0,1,0),('my_wiki','querycachetwo','2019-02-06 01:55:08',0,1,3),('my_wiki','recentchanges','2019-02-06 06:51:57',55,1,11),('my_wiki','redirect','2019-02-06 01:55:08',0,1,1),('my_wiki','revision','2019-02-06 06:53:41',59,1,6),('my_wiki','revision_actor_temp','2019-02-06 01:55:09',0,1,3),('my_wiki','revision_comment_temp','2019-02-06 01:55:09',0,1,1),('my_wiki','site_identifiers','2019-02-06 01:55:09',0,1,2),('my_wiki','site_stats','2019-02-06 01:55:09',0,1,0),('my_wiki','sites','2019-02-06 01:55:09',0,1,8),('my_wiki','slot_roles','2019-02-06 01:55:09',0,1,1),('my_wiki','slots','2019-02-06 06:53:50',59,1,1),('my_wiki','tag_summary','2019-02-06 06:47:34',2,1,3),('my_wiki','templatelinks','2019-02-06 01:55:09',0,1,2),('my_wiki','text','2019-02-06 06:53:41',59,4,0),('my_wiki','updatelog','2019-02-06 01:55:29',8,1,0),('my_wiki','uploadstash','2019-02-06 01:55:09',0,1,3),('my_wiki','user','2019-02-06 01:55:10',0,1,3),('my_wiki','user_former_groups','2019-02-06 01:55:10',0,1,0),('my_wiki','user_groups','2019-02-06 01:55:39',3,1,2),('my_wiki','user_newtalk','2019-02-06 01:55:10',0,1,2),('my_wiki','user_properties','2019-02-06 05:29:17',5,1,1),('my_wiki','valid_tag','2019-02-06 01:55:10',0,1,0),('my_wiki','watchlist','2019-02-06 02:33:53',2,1,3),('mysql','gtid_executed','2019-02-06 01:54:14',0,1,0),('sys','sys_config','2019-02-06 01:54:15',6,1,0);
/*!40000 ALTER TABLE `innodb_table_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ndb_binlog_index`
--

DROP TABLE IF EXISTS `ndb_binlog_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ndb_binlog_index` (
  `Position` bigint(20) unsigned NOT NULL,
  `File` varchar(255) NOT NULL,
  `epoch` bigint(20) unsigned NOT NULL,
  `inserts` int(10) unsigned NOT NULL,
  `updates` int(10) unsigned NOT NULL,
  `deletes` int(10) unsigned NOT NULL,
  `schemaops` int(10) unsigned NOT NULL,
  `orig_server_id` int(10) unsigned NOT NULL,
  `orig_epoch` bigint(20) unsigned NOT NULL,
  `gci` int(10) unsigned NOT NULL,
  `next_position` bigint(20) unsigned NOT NULL,
  `next_file` varchar(255) NOT NULL,
  PRIMARY KEY (`epoch`,`orig_server_id`,`orig_epoch`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ndb_binlog_index`
--

LOCK TABLES `ndb_binlog_index` WRITE;
/*!40000 ALTER TABLE `ndb_binlog_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `ndb_binlog_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin`
--

DROP TABLE IF EXISTS `plugin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin` (
  `name` varchar(64) NOT NULL DEFAULT '',
  `dl` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 COMMENT='MySQL plugins';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin`
--

LOCK TABLES `plugin` WRITE;
/*!40000 ALTER TABLE `plugin` DISABLE KEYS */;
INSERT INTO `plugin` VALUES ('auth_socket','auth_socket.so');
/*!40000 ALTER TABLE `plugin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proc`
--

DROP TABLE IF EXISTS `proc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proc` (
  `db` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `name` char(64) NOT NULL DEFAULT '',
  `type` enum('FUNCTION','PROCEDURE') NOT NULL,
  `specific_name` char(64) NOT NULL DEFAULT '',
  `language` enum('SQL') NOT NULL DEFAULT 'SQL',
  `sql_data_access` enum('CONTAINS_SQL','NO_SQL','READS_SQL_DATA','MODIFIES_SQL_DATA') NOT NULL DEFAULT 'CONTAINS_SQL',
  `is_deterministic` enum('YES','NO') NOT NULL DEFAULT 'NO',
  `security_type` enum('INVOKER','DEFINER') NOT NULL DEFAULT 'DEFINER',
  `param_list` blob NOT NULL,
  `returns` longblob NOT NULL,
  `body` longblob NOT NULL,
  `definer` char(93) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sql_mode` set('REAL_AS_FLOAT','PIPES_AS_CONCAT','ANSI_QUOTES','IGNORE_SPACE','NOT_USED','ONLY_FULL_GROUP_BY','NO_UNSIGNED_SUBTRACTION','NO_DIR_IN_CREATE','POSTGRESQL','ORACLE','MSSQL','DB2','MAXDB','NO_KEY_OPTIONS','NO_TABLE_OPTIONS','NO_FIELD_OPTIONS','MYSQL323','MYSQL40','ANSI','NO_AUTO_VALUE_ON_ZERO','NO_BACKSLASH_ESCAPES','STRICT_TRANS_TABLES','STRICT_ALL_TABLES','NO_ZERO_IN_DATE','NO_ZERO_DATE','INVALID_DATES','ERROR_FOR_DIVISION_BY_ZERO','TRADITIONAL','NO_AUTO_CREATE_USER','HIGH_NOT_PRECEDENCE','NO_ENGINE_SUBSTITUTION','PAD_CHAR_TO_FULL_LENGTH') NOT NULL DEFAULT '',
  `comment` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `character_set_client` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `collation_connection` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `db_collation` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `body_utf8` longblob,
  PRIMARY KEY (`db`,`name`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stored Procedures';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proc`
--

LOCK TABLES `proc` WRITE;
/*!40000 ALTER TABLE `proc` DISABLE KEYS */;
/*!40000 ALTER TABLE `proc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procs_priv`
--

DROP TABLE IF EXISTS `procs_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `procs_priv` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Routine_name` char(64) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `Routine_type` enum('FUNCTION','PROCEDURE') COLLATE utf8_bin NOT NULL,
  `Grantor` char(93) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Proc_priv` set('Execute','Alter Routine','Grant') CHARACTER SET utf8 NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Host`,`Db`,`User`,`Routine_name`,`Routine_type`),
  KEY `Grantor` (`Grantor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Procedure privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procs_priv`
--

LOCK TABLES `procs_priv` WRITE;
/*!40000 ALTER TABLE `procs_priv` DISABLE KEYS */;
/*!40000 ALTER TABLE `procs_priv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proxies_priv`
--

DROP TABLE IF EXISTS `proxies_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proxies_priv` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Proxied_host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Proxied_user` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `With_grant` tinyint(1) NOT NULL DEFAULT '0',
  `Grantor` char(93) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Host`,`User`,`Proxied_host`,`Proxied_user`),
  KEY `Grantor` (`Grantor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User proxy privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proxies_priv`
--

LOCK TABLES `proxies_priv` WRITE;
/*!40000 ALTER TABLE `proxies_priv` DISABLE KEYS */;
INSERT INTO `proxies_priv` VALUES ('localhost','root','','',1,'boot@connecting host','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `proxies_priv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server_cost`
--

DROP TABLE IF EXISTS `server_cost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server_cost` (
  `cost_name` varchar(64) NOT NULL,
  `cost_value` float DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `comment` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`cost_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_cost`
--

LOCK TABLES `server_cost` WRITE;
/*!40000 ALTER TABLE `server_cost` DISABLE KEYS */;
INSERT INTO `server_cost` VALUES ('disk_temptable_create_cost',NULL,'2019-02-06 01:54:14',NULL),('disk_temptable_row_cost',NULL,'2019-02-06 01:54:14',NULL),('key_compare_cost',NULL,'2019-02-06 01:54:14',NULL),('memory_temptable_create_cost',NULL,'2019-02-06 01:54:14',NULL),('memory_temptable_row_cost',NULL,'2019-02-06 01:54:14',NULL),('row_evaluate_cost',NULL,'2019-02-06 01:54:14',NULL);
/*!40000 ALTER TABLE `server_cost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servers`
--

DROP TABLE IF EXISTS `servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servers` (
  `Server_name` char(64) NOT NULL DEFAULT '',
  `Host` char(64) NOT NULL DEFAULT '',
  `Db` char(64) NOT NULL DEFAULT '',
  `Username` char(64) NOT NULL DEFAULT '',
  `Password` char(64) NOT NULL DEFAULT '',
  `Port` int(4) NOT NULL DEFAULT '0',
  `Socket` char(64) NOT NULL DEFAULT '',
  `Wrapper` char(64) NOT NULL DEFAULT '',
  `Owner` char(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`Server_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 COMMENT='MySQL Foreign Servers table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servers`
--

LOCK TABLES `servers` WRITE;
/*!40000 ALTER TABLE `servers` DISABLE KEYS */;
/*!40000 ALTER TABLE `servers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slave_master_info`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `slave_master_info` (
  `Number_of_lines` int(10) unsigned NOT NULL COMMENT 'Number of lines in the file.',
  `Master_log_name` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'The name of the master binary log currently being read from the master.',
  `Master_log_pos` bigint(20) unsigned NOT NULL COMMENT 'The master log position of the last read event.',
  `Host` char(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'The host name of the master.',
  `User_name` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The user name used to connect to the master.',
  `User_password` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The password used to connect to the master.',
  `Port` int(10) unsigned NOT NULL COMMENT 'The network port used to connect to the master.',
  `Connect_retry` int(10) unsigned NOT NULL COMMENT 'The period (in seconds) that the slave will wait before trying to reconnect to the master.',
  `Enabled_ssl` tinyint(1) NOT NULL COMMENT 'Indicates whether the server supports SSL connections.',
  `Ssl_ca` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The file used for the Certificate Authority (CA) certificate.',
  `Ssl_capath` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The path to the Certificate Authority (CA) certificates.',
  `Ssl_cert` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The name of the SSL certificate file.',
  `Ssl_cipher` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The name of the cipher in use for the SSL connection.',
  `Ssl_key` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The name of the SSL key file.',
  `Ssl_verify_server_cert` tinyint(1) NOT NULL COMMENT 'Whether to verify the server certificate.',
  `Heartbeat` float NOT NULL,
  `Bind` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'Displays which interface is employed when connecting to the MySQL server',
  `Ignored_server_ids` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The number of server IDs to be ignored, followed by the actual server IDs',
  `Uuid` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The master server uuid.',
  `Retry_count` bigint(20) unsigned NOT NULL COMMENT 'Number of reconnect attempts, to the master, before giving up.',
  `Ssl_crl` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The file used for the Certificate Revocation List (CRL)',
  `Ssl_crlpath` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The path used for Certificate Revocation List (CRL) files',
  `Enabled_auto_position` tinyint(1) NOT NULL COMMENT 'Indicates whether GTIDs will be used to retrieve events from the master.',
  `Channel_name` char(64) NOT NULL COMMENT 'The channel on which the slave is connected to a source. Used in Multisource Replication',
  `Tls_version` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'Tls version',
  PRIMARY KEY (`Channel_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 COMMENT='Master Information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `slave_relay_log_info`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `slave_relay_log_info` (
  `Number_of_lines` int(10) unsigned NOT NULL COMMENT 'Number of lines in the file or rows in the table. Used to version table definitions.',
  `Relay_log_name` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'The name of the current relay log file.',
  `Relay_log_pos` bigint(20) unsigned NOT NULL COMMENT 'The relay log position of the last executed event.',
  `Master_log_name` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'The name of the master binary log file from which the events in the relay log file were read.',
  `Master_log_pos` bigint(20) unsigned NOT NULL COMMENT 'The master log position of the last executed event.',
  `Sql_delay` int(11) NOT NULL COMMENT 'The number of seconds that the slave must lag behind the master.',
  `Number_of_workers` int(10) unsigned NOT NULL,
  `Id` int(10) unsigned NOT NULL COMMENT 'Internal Id that uniquely identifies this record.',
  `Channel_name` char(64) NOT NULL COMMENT 'The channel on which the slave is connected to a source. Used in Multisource Replication',
  PRIMARY KEY (`Channel_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 COMMENT='Relay Log Information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `slave_worker_info`
--

DROP TABLE IF EXISTS `slave_worker_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slave_worker_info` (
  `Id` int(10) unsigned NOT NULL,
  `Relay_log_name` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Relay_log_pos` bigint(20) unsigned NOT NULL,
  `Master_log_name` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Master_log_pos` bigint(20) unsigned NOT NULL,
  `Checkpoint_relay_log_name` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Checkpoint_relay_log_pos` bigint(20) unsigned NOT NULL,
  `Checkpoint_master_log_name` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Checkpoint_master_log_pos` bigint(20) unsigned NOT NULL,
  `Checkpoint_seqno` int(10) unsigned NOT NULL,
  `Checkpoint_group_size` int(10) unsigned NOT NULL,
  `Checkpoint_group_bitmap` blob NOT NULL,
  `Channel_name` char(64) NOT NULL COMMENT 'The channel on which the slave is connected to a source. Used in Multisource Replication',
  PRIMARY KEY (`Channel_name`,`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 COMMENT='Worker Information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slave_worker_info`
--

LOCK TABLES `slave_worker_info` WRITE;
/*!40000 ALTER TABLE `slave_worker_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `slave_worker_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tables_priv`
--

DROP TABLE IF EXISTS `tables_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tables_priv` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Table_name` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Grantor` char(93) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Table_priv` set('Select','Insert','Update','Delete','Create','Drop','Grant','References','Index','Alter','Create View','Show view','Trigger') CHARACTER SET utf8 NOT NULL DEFAULT '',
  `Column_priv` set('Select','Insert','Update','References') CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`Host`,`Db`,`User`,`Table_name`),
  KEY `Grantor` (`Grantor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tables_priv`
--

LOCK TABLES `tables_priv` WRITE;
/*!40000 ALTER TABLE `tables_priv` DISABLE KEYS */;
INSERT INTO `tables_priv` VALUES ('localhost','mysql','mysql.session','user','boot@connecting host','0000-00-00 00:00:00','Select',''),('localhost','sys','mysql.sys','sys_config','root@localhost','2019-02-06 01:54:15','Select','');
/*!40000 ALTER TABLE `tables_priv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_zone`
--

DROP TABLE IF EXISTS `time_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_zone` (
  `Time_zone_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Use_leap_seconds` enum('Y','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`Time_zone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 COMMENT='Time zones';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_zone`
--

LOCK TABLES `time_zone` WRITE;
/*!40000 ALTER TABLE `time_zone` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_zone_leap_second`
--

DROP TABLE IF EXISTS `time_zone_leap_second`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_zone_leap_second` (
  `Transition_time` bigint(20) NOT NULL,
  `Correction` int(11) NOT NULL,
  PRIMARY KEY (`Transition_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 COMMENT='Leap seconds information for time zones';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_zone_leap_second`
--

LOCK TABLES `time_zone_leap_second` WRITE;
/*!40000 ALTER TABLE `time_zone_leap_second` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone_leap_second` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_zone_name`
--

DROP TABLE IF EXISTS `time_zone_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_zone_name` (
  `Name` char(64) NOT NULL,
  `Time_zone_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 COMMENT='Time zone names';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_zone_name`
--

LOCK TABLES `time_zone_name` WRITE;
/*!40000 ALTER TABLE `time_zone_name` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_zone_transition`
--

DROP TABLE IF EXISTS `time_zone_transition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_zone_transition` (
  `Time_zone_id` int(10) unsigned NOT NULL,
  `Transition_time` bigint(20) NOT NULL,
  `Transition_type_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Time_zone_id`,`Transition_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 COMMENT='Time zone transitions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_zone_transition`
--

LOCK TABLES `time_zone_transition` WRITE;
/*!40000 ALTER TABLE `time_zone_transition` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone_transition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_zone_transition_type`
--

DROP TABLE IF EXISTS `time_zone_transition_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_zone_transition_type` (
  `Time_zone_id` int(10) unsigned NOT NULL,
  `Transition_type_id` int(10) unsigned NOT NULL,
  `Offset` int(11) NOT NULL DEFAULT '0',
  `Is_DST` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Abbreviation` char(8) NOT NULL DEFAULT '',
  PRIMARY KEY (`Time_zone_id`,`Transition_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 COMMENT='Time zone transition types';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_zone_transition_type`
--

LOCK TABLES `time_zone_transition_type` WRITE;
/*!40000 ALTER TABLE `time_zone_transition_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone_transition_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Select_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Insert_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Update_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Delete_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Drop_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Reload_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Shutdown_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Process_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `File_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Grant_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `References_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Index_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Alter_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Show_db_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Super_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_tmp_table_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Lock_tables_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Execute_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Repl_slave_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Repl_client_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_view_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Show_view_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_routine_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Alter_routine_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_user_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Event_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Trigger_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_tablespace_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `ssl_type` enum('','ANY','X509','SPECIFIED') CHARACTER SET utf8 NOT NULL DEFAULT '',
  `ssl_cipher` blob NOT NULL,
  `x509_issuer` blob NOT NULL,
  `x509_subject` blob NOT NULL,
  `max_questions` int(11) unsigned NOT NULL DEFAULT '0',
  `max_updates` int(11) unsigned NOT NULL DEFAULT '0',
  `max_connections` int(11) unsigned NOT NULL DEFAULT '0',
  `max_user_connections` int(11) unsigned NOT NULL DEFAULT '0',
  `plugin` char(64) COLLATE utf8_bin NOT NULL DEFAULT 'mysql_native_password',
  `authentication_string` text COLLATE utf8_bin,
  `password_expired` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `password_last_changed` timestamp NULL DEFAULT NULL,
  `password_lifetime` smallint(5) unsigned DEFAULT NULL,
  `account_locked` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  PRIMARY KEY (`Host`,`User`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and global privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('localhost','root','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','','','','',0,0,0,0,'auth_socket','','N','2019-02-06 01:54:15',NULL,'N'),('localhost','mysql.session','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','Y','N','N','N','N','N','N','N','N','N','N','N','N','N','','','','',0,0,0,0,'mysql_native_password','*THISISNOTAVALIDPASSWORDTHATCANBEUSEDHERE','N','2019-02-06 01:54:15',NULL,'Y'),('localhost','mysql.sys','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','','','','',0,0,0,0,'mysql_native_password','*THISISNOTAVALIDPASSWORDTHATCANBEUSEDHERE','N','2019-02-06 01:54:15',NULL,'Y'),('localhost','debian-sys-maint','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','','','','',0,0,0,0,'mysql_native_password','*DD1325F23A9F59C2B5E4DD4F6338F838345A62AC','N','2019-02-06 01:54:16',NULL,'N'),('localhost','wiki_user','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','','','','',0,0,0,0,'mysql_native_password','*C35E172A8B0199E7F39ACAE3FF42CEEFC0E291DD','N','2019-02-06 01:55:03',NULL,'N'),('%','andrew','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','N','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','','','','',0,0,0,0,'mysql_native_password','*23AE809DDACAF96AF0FD78ED04B6A265E05AA257','N','2019-02-08 08:21:01',NULL,'N');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `general_log`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `general_log` (
  `event_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `user_host` mediumtext NOT NULL,
  `thread_id` bigint(21) unsigned NOT NULL,
  `server_id` int(10) unsigned NOT NULL,
  `command_type` varchar(64) NOT NULL,
  `argument` mediumblob NOT NULL
) ENGINE=CSV DEFAULT CHARSET=utf8 COMMENT='General log';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `slow_log`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `slow_log` (
  `start_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `user_host` mediumtext NOT NULL,
  `query_time` time(6) NOT NULL,
  `lock_time` time(6) NOT NULL,
  `rows_sent` int(11) NOT NULL,
  `rows_examined` int(11) NOT NULL,
  `db` varchar(512) NOT NULL,
  `last_insert_id` int(11) NOT NULL,
  `insert_id` int(11) NOT NULL,
  `server_id` int(10) unsigned NOT NULL,
  `sql_text` mediumblob NOT NULL,
  `thread_id` bigint(21) unsigned NOT NULL
) ENGINE=CSV DEFAULT CHARSET=utf8 COMMENT='Slow log';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-08  8:23:38