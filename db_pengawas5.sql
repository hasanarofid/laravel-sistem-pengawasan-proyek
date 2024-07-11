-- MySQL dump 10.13  Distrib 8.0.37, for Linux (x86_64)
--
-- Host: localhost    Database: db_pengawasan3
-- ------------------------------------------------------
-- Server version	8.0.37-0ubuntu0.22.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cuti`
--

DROP TABLE IF EXISTS `cuti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuti` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_pegawai` bigint unsigned NOT NULL,
  `tipe_cuti` enum('Tahunan','Besar','Bersama','Hamil','Sakit','Penting') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tgl_pengajuan` date NOT NULL,
  `tgl_mulai` date NOT NULL,
  `tgl_selesai` date NOT NULL,
  `ket` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Disetujui HRD','Ditolak HRD','Disetujui Atasan','Ditolak Atasan','Diproses') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tgl_disetujui_atasan` date DEFAULT NULL,
  `tgl_disetujui_hrd` date DEFAULT NULL,
  `tgl_ditolak_atasan` date DEFAULT NULL,
  `tgl_ditolak_hrd` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cuti_id_pegawai_index` (`id_pegawai`),
  CONSTRAINT `cuti_id_pegawai_foreign` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuti`
--

LOCK TABLES `cuti` WRITE;
/*!40000 ALTER TABLE `cuti` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `divisi`
--

DROP TABLE IF EXISTS `divisi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `divisi` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nm_divisi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `divisi`
--

LOCK TABLES `divisi` WRITE;
/*!40000 ALTER TABLE `divisi` DISABLE KEYS */;
INSERT INTO `divisi` VALUES (1,'Non-Divisi',NULL,NULL),(2,'Business Development',NULL,NULL),(3,'Finance',NULL,NULL),(4,'Technology Officer',NULL,NULL);
/*!40000 ALTER TABLE `divisi` ENABLE KEYS */;
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
-- Table structure for table `gaji`
--

DROP TABLE IF EXISTS `gaji`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gaji` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_pegawai` bigint unsigned NOT NULL,
  `tanggal` date NOT NULL,
  `gaji_pokok` int unsigned DEFAULT NULL,
  `jml_tunjangan` int unsigned DEFAULT NULL,
  `jml_potongan` int unsigned DEFAULT NULL,
  `tot_gaji_diterima` int unsigned DEFAULT NULL,
  `dikirim_tgl` date DEFAULT NULL,
  `is_sent` tinyint(1) DEFAULT '0',
  `path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gaji_id_pegawai_index` (`id_pegawai`),
  CONSTRAINT `gaji_id_pegawai_foreign` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gaji`
--

LOCK TABLES `gaji` WRITE;
/*!40000 ALTER TABLE `gaji` DISABLE KEYS */;
/*!40000 ALTER TABLE `gaji` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icons`
--

DROP TABLE IF EXISTS `icons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `icons` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1146 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icons`
--

LOCK TABLES `icons` WRITE;
/*!40000 ALTER TABLE `icons` DISABLE KEYS */;
INSERT INTO `icons` VALUES (1,'icon-home',NULL,NULL),(2,'icon-home2',NULL,NULL),(3,'icon-home5',NULL,NULL),(4,'icon-home7',NULL,NULL),(5,'icon-home8',NULL,NULL),(6,'icon-home9',NULL,NULL),(7,'icon-office',NULL,NULL),(8,'icon-city',NULL,NULL),(9,'icon-newspaper',NULL,NULL),(10,'icon-magazine',NULL,NULL),(11,'icon-design',NULL,NULL),(12,'icon-pencil',NULL,NULL),(13,'icon-pencil3',NULL,NULL),(14,'icon-pencil4',NULL,NULL),(15,'icon-pencil5',NULL,NULL),(16,'icon-pencil6',NULL,NULL),(17,'icon-pencil7',NULL,NULL),(18,'icon-eraser',NULL,NULL),(19,'icon-eraser2',NULL,NULL),(20,'icon-eraser3',NULL,NULL),(21,'icon-quill2',NULL,NULL),(22,'icon-quill4',NULL,NULL),(23,'icon-pen',NULL,NULL),(24,'icon-pen-plus',NULL,NULL),(25,'icon-pen-minus',NULL,NULL),(26,'icon-pen2',NULL,NULL),(27,'icon-blog',NULL,NULL),(28,'icon-pen6',NULL,NULL),(29,'icon-brush',NULL,NULL),(30,'icon-spray',NULL,NULL),(31,'icon-color-sampler',NULL,NULL),(32,'icon-toggle',NULL,NULL),(33,'icon-bucket',NULL,NULL),(34,'icon-gradient',NULL,NULL),(35,'icon-eyedropper',NULL,NULL),(36,'icon-eyedropper2',NULL,NULL),(37,'icon-eyedropper3',NULL,NULL),(38,'icon-droplet',NULL,NULL),(39,'icon-droplet2',NULL,NULL),(40,'icon-color-clear',NULL,NULL),(41,'icon-paint-format',NULL,NULL),(42,'icon-stamp',NULL,NULL),(43,'icon-image2',NULL,NULL),(44,'icon-image-compare',NULL,NULL),(45,'icon-images2',NULL,NULL),(46,'icon-image3',NULL,NULL),(47,'icon-images3',NULL,NULL),(48,'icon-image4',NULL,NULL),(49,'icon-image5',NULL,NULL),(50,'icon-camera',NULL,NULL),(51,'icon-shutter',NULL,NULL),(52,'icon-headphones',NULL,NULL),(53,'icon-headset',NULL,NULL),(54,'icon-music',NULL,NULL),(55,'icon-album',NULL,NULL),(56,'icon-tape',NULL,NULL),(57,'icon-piano',NULL,NULL),(58,'icon-speakers',NULL,NULL),(59,'icon-play',NULL,NULL),(60,'icon-clapboard-play',NULL,NULL),(61,'icon-clapboard',NULL,NULL),(62,'icon-media',NULL,NULL),(63,'icon-presentation',NULL,NULL),(64,'icon-movie',NULL,NULL),(65,'icon-film',NULL,NULL),(66,'icon-film2',NULL,NULL),(67,'icon-film3',NULL,NULL),(68,'icon-film4',NULL,NULL),(69,'icon-video-camera',NULL,NULL),(70,'icon-video-camera2',NULL,NULL),(71,'icon-video-camera-slash',NULL,NULL),(72,'icon-video-camera3',NULL,NULL),(73,'icon-dice',NULL,NULL),(74,'icon-chess-king',NULL,NULL),(75,'icon-chess-queen',NULL,NULL),(76,'icon-chess',NULL,NULL),(77,'icon-megaphone',NULL,NULL),(78,'icon-new',NULL,NULL),(79,'icon-connection',NULL,NULL),(80,'icon-station',NULL,NULL),(81,'icon-satellite-dish2',NULL,NULL),(82,'icon-feed',NULL,NULL),(83,'icon-mic2',NULL,NULL),(84,'icon-mic-off2',NULL,NULL),(85,'icon-book',NULL,NULL),(86,'icon-book2',NULL,NULL),(87,'icon-book-play',NULL,NULL),(88,'icon-book3',NULL,NULL),(89,'icon-bookmark',NULL,NULL),(90,'icon-books',NULL,NULL),(91,'icon-archive',NULL,NULL),(92,'icon-reading',NULL,NULL),(93,'icon-library2',NULL,NULL),(94,'icon-graduation2',NULL,NULL),(95,'icon-file-text',NULL,NULL),(96,'icon-profile',NULL,NULL),(97,'icon-file-empty',NULL,NULL),(98,'icon-file-empty2',NULL,NULL),(99,'icon-files-empty',NULL,NULL),(100,'icon-files-empty2',NULL,NULL),(101,'icon-file-plus',NULL,NULL),(102,'icon-file-plus2',NULL,NULL),(103,'icon-file-minus',NULL,NULL),(104,'icon-file-minus2',NULL,NULL),(105,'icon-file-download',NULL,NULL),(106,'icon-file-download2',NULL,NULL),(107,'icon-file-upload',NULL,NULL),(108,'icon-file-upload2',NULL,NULL),(109,'icon-file-check',NULL,NULL),(110,'icon-file-check2',NULL,NULL),(111,'icon-file-eye',NULL,NULL),(112,'icon-file-eye2',NULL,NULL),(113,'icon-file-text2',NULL,NULL),(114,'icon-file-text3',NULL,NULL),(115,'icon-file-picture',NULL,NULL),(116,'icon-file-picture2',NULL,NULL),(117,'icon-file-music',NULL,NULL),(118,'icon-file-music2',NULL,NULL),(119,'icon-file-play',NULL,NULL),(120,'icon-file-play2',NULL,NULL),(121,'icon-file-video',NULL,NULL),(122,'icon-file-video2',NULL,NULL),(123,'icon-copy',NULL,NULL),(124,'icon-copy2',NULL,NULL),(125,'icon-file-zip',NULL,NULL),(126,'icon-file-zip2',NULL,NULL),(127,'icon-file-xml',NULL,NULL),(128,'icon-file-xml2',NULL,NULL),(129,'icon-file-css',NULL,NULL),(130,'icon-file-css2',NULL,NULL),(131,'icon-file-presentation',NULL,NULL),(132,'icon-file-presentation2',NULL,NULL),(133,'icon-file-stats',NULL,NULL),(134,'icon-file-stats2',NULL,NULL),(135,'icon-file-locked',NULL,NULL),(136,'icon-file-locked2',NULL,NULL),(137,'icon-file-spreadsheet',NULL,NULL),(138,'icon-file-spreadsheet2',NULL,NULL),(139,'icon-copy3',NULL,NULL),(140,'icon-copy4',NULL,NULL),(141,'icon-paste',NULL,NULL),(142,'icon-paste2',NULL,NULL),(143,'icon-paste3',NULL,NULL),(144,'icon-paste4',NULL,NULL),(145,'icon-stack',NULL,NULL),(146,'icon-stack2',NULL,NULL),(147,'icon-stack3',NULL,NULL),(148,'icon-folder',NULL,NULL),(149,'icon-folder-search',NULL,NULL),(150,'icon-folder-download',NULL,NULL),(151,'icon-folder-upload',NULL,NULL),(152,'icon-folder-plus',NULL,NULL),(153,'icon-folder-plus2',NULL,NULL),(154,'icon-folder-minus',NULL,NULL),(155,'icon-folder-minus2',NULL,NULL),(156,'icon-folder-check',NULL,NULL),(157,'icon-folder-heart',NULL,NULL),(158,'icon-folder-remove',NULL,NULL),(159,'icon-folder2',NULL,NULL),(160,'icon-folder-open',NULL,NULL),(161,'icon-folder3',NULL,NULL),(162,'icon-folder4',NULL,NULL),(163,'icon-folder-plus3',NULL,NULL),(164,'icon-folder-minus3',NULL,NULL),(165,'icon-folder-plus4',NULL,NULL),(166,'icon-folder-minus4',NULL,NULL),(167,'icon-folder-download2',NULL,NULL),(168,'icon-folder-upload2',NULL,NULL),(169,'icon-folder-download3',NULL,NULL),(170,'icon-folder-upload3',NULL,NULL),(171,'icon-folder5',NULL,NULL),(172,'icon-folder-open2',NULL,NULL),(173,'icon-folder6',NULL,NULL),(174,'icon-folder-open3',NULL,NULL),(175,'icon-certificate',NULL,NULL),(176,'icon-cc',NULL,NULL),(177,'icon-price-tag',NULL,NULL),(178,'icon-price-tag2',NULL,NULL),(179,'icon-price-tags',NULL,NULL),(180,'icon-price-tag3',NULL,NULL),(181,'icon-price-tags2',NULL,NULL),(182,'icon-barcode2',NULL,NULL),(183,'icon-qrcode',NULL,NULL),(184,'icon-ticket',NULL,NULL),(185,'icon-theater',NULL,NULL),(186,'icon-store',NULL,NULL),(187,'icon-store2',NULL,NULL),(188,'icon-cart',NULL,NULL),(189,'icon-cart2',NULL,NULL),(190,'icon-cart4',NULL,NULL),(191,'icon-cart5',NULL,NULL),(192,'icon-cart-add',NULL,NULL),(193,'icon-cart-add2',NULL,NULL),(194,'icon-cart-remove',NULL,NULL),(195,'icon-basket',NULL,NULL),(196,'icon-bag',NULL,NULL),(197,'icon-percent',NULL,NULL),(198,'icon-coins',NULL,NULL),(199,'icon-coin-dollar',NULL,NULL),(200,'icon-coin-euro',NULL,NULL),(201,'icon-coin-pound',NULL,NULL),(202,'icon-coin-yen',NULL,NULL),(203,'icon-piggy-bank',NULL,NULL),(204,'icon-wallet',NULL,NULL),(205,'icon-cash',NULL,NULL),(206,'icon-cash2',NULL,NULL),(207,'icon-cash3',NULL,NULL),(208,'icon-cash4',NULL,NULL),(209,'icon-credit-card',NULL,NULL),(210,'icon-credit-card2',NULL,NULL),(211,'icon-calculator4',NULL,NULL),(212,'icon-calculator2',NULL,NULL),(213,'icon-calculator3',NULL,NULL),(214,'icon-chip',NULL,NULL),(215,'icon-lifebuoy',NULL,NULL),(216,'icon-phone',NULL,NULL),(217,'icon-phone2',NULL,NULL),(218,'icon-phone-slash',NULL,NULL),(219,'icon-phone-wave',NULL,NULL),(220,'icon-phone-plus',NULL,NULL),(221,'icon-phone-minus',NULL,NULL),(222,'icon-phone-plus2',NULL,NULL),(223,'icon-phone-minus2',NULL,NULL),(224,'icon-phone-incoming',NULL,NULL),(225,'icon-phone-outgoing',NULL,NULL),(226,'icon-phone-hang-up',NULL,NULL),(227,'icon-address-book',NULL,NULL),(228,'icon-address-book2',NULL,NULL),(229,'icon-address-book3',NULL,NULL),(230,'icon-notebook',NULL,NULL),(231,'icon-envelop',NULL,NULL),(232,'icon-envelop2',NULL,NULL),(233,'icon-envelop3',NULL,NULL),(234,'icon-envelop4',NULL,NULL),(235,'icon-envelop5',NULL,NULL),(236,'icon-mailbox',NULL,NULL),(237,'icon-pushpin',NULL,NULL),(238,'icon-location3',NULL,NULL),(239,'icon-location4',NULL,NULL),(240,'icon-compass4',NULL,NULL),(241,'icon-map',NULL,NULL),(242,'icon-map4',NULL,NULL),(243,'icon-map5',NULL,NULL),(244,'icon-direction',NULL,NULL),(245,'icon-reset',NULL,NULL),(246,'icon-history',NULL,NULL),(247,'icon-watch',NULL,NULL),(248,'icon-watch2',NULL,NULL),(249,'icon-alarm',NULL,NULL),(250,'icon-alarm-add',NULL,NULL),(251,'icon-alarm-check',NULL,NULL),(252,'icon-alarm-cancel',NULL,NULL),(253,'icon-bell2',NULL,NULL),(254,'icon-bell3',NULL,NULL),(255,'icon-bell-plus',NULL,NULL),(256,'icon-bell-minus',NULL,NULL),(257,'icon-bell-check',NULL,NULL),(258,'icon-bell-cross',NULL,NULL),(259,'icon-calendar',NULL,NULL),(260,'icon-calendar2',NULL,NULL),(261,'icon-calendar3',NULL,NULL),(262,'icon-calendar52',NULL,NULL),(263,'icon-printer',NULL,NULL),(264,'icon-printer2',NULL,NULL),(265,'icon-printer4',NULL,NULL),(266,'icon-shredder',NULL,NULL),(267,'icon-mouse',NULL,NULL),(268,'icon-mouse-left',NULL,NULL),(269,'icon-mouse-right',NULL,NULL),(270,'icon-keyboard',NULL,NULL),(271,'icon-typewriter',NULL,NULL),(272,'icon-display',NULL,NULL),(273,'icon-display4',NULL,NULL),(274,'icon-laptop',NULL,NULL),(275,'icon-mobile',NULL,NULL),(276,'icon-mobile2',NULL,NULL),(277,'icon-tablet',NULL,NULL),(278,'icon-mobile3',NULL,NULL),(279,'icon-tv',NULL,NULL),(280,'icon-radio',NULL,NULL),(281,'icon-cabinet',NULL,NULL),(282,'icon-drawer',NULL,NULL),(283,'icon-drawer2',NULL,NULL),(284,'icon-drawer-out',NULL,NULL),(285,'icon-drawer-in',NULL,NULL),(286,'icon-drawer3',NULL,NULL),(287,'icon-box',NULL,NULL),(288,'icon-box-add',NULL,NULL),(289,'icon-box-remove',NULL,NULL),(290,'icon-download',NULL,NULL),(291,'icon-upload',NULL,NULL),(292,'icon-floppy-disk',NULL,NULL),(293,'icon-floppy-disks',NULL,NULL),(294,'icon-usb-stick',NULL,NULL),(295,'icon-drive',NULL,NULL),(296,'icon-server',NULL,NULL),(297,'icon-database',NULL,NULL),(298,'icon-database2',NULL,NULL),(299,'icon-database4',NULL,NULL),(300,'icon-database-menu',NULL,NULL),(301,'icon-database-add',NULL,NULL),(302,'icon-database-remove',NULL,NULL),(303,'icon-database-insert',NULL,NULL),(304,'icon-database-export',NULL,NULL),(305,'icon-database-upload',NULL,NULL),(306,'icon-database-refresh',NULL,NULL),(307,'icon-database-diff',NULL,NULL),(308,'icon-database-edit2',NULL,NULL),(309,'icon-database-check',NULL,NULL),(310,'icon-database-arrow',NULL,NULL),(311,'icon-database-time2',NULL,NULL),(312,'icon-undo',NULL,NULL),(313,'icon-redo',NULL,NULL),(314,'icon-rotate-ccw',NULL,NULL),(315,'icon-rotate-cw',NULL,NULL),(316,'icon-rotate-ccw2',NULL,NULL),(317,'icon-rotate-cw2',NULL,NULL),(318,'icon-rotate-ccw3',NULL,NULL),(319,'icon-rotate-cw3',NULL,NULL),(320,'icon-flip-vertical2',NULL,NULL),(321,'icon-flip-horizontal2',NULL,NULL),(322,'icon-flip-vertical3',NULL,NULL),(323,'icon-flip-vertical4',NULL,NULL),(324,'icon-angle',NULL,NULL),(325,'icon-shear',NULL,NULL),(326,'icon-align-left',NULL,NULL),(327,'icon-align-center-horizontal',NULL,NULL),(328,'icon-align-right',NULL,NULL),(329,'icon-align-top',NULL,NULL),(330,'icon-align-center-vertical',NULL,NULL),(331,'icon-align-bottom',NULL,NULL),(332,'icon-undo2',NULL,NULL),(333,'icon-redo2',NULL,NULL),(334,'icon-forward',NULL,NULL),(335,'icon-reply',NULL,NULL),(336,'icon-reply-all',NULL,NULL),(337,'icon-bubble',NULL,NULL),(338,'icon-bubbles',NULL,NULL),(339,'icon-bubbles2',NULL,NULL),(340,'icon-bubble2',NULL,NULL),(341,'icon-bubbles3',NULL,NULL),(342,'icon-bubbles4',NULL,NULL),(343,'icon-bubble-notification',NULL,NULL),(344,'icon-bubbles5',NULL,NULL),(345,'icon-bubbles6',NULL,NULL),(346,'icon-bubble6',NULL,NULL),(347,'icon-bubbles7',NULL,NULL),(348,'icon-bubble7',NULL,NULL),(349,'icon-bubbles8',NULL,NULL),(350,'icon-bubble8',NULL,NULL),(351,'icon-bubble-dots3',NULL,NULL),(352,'icon-bubble-lines3',NULL,NULL),(353,'icon-bubble9',NULL,NULL),(354,'icon-bubble-dots4',NULL,NULL),(355,'icon-bubble-lines4',NULL,NULL),(356,'icon-bubbles9',NULL,NULL),(357,'icon-bubbles10',NULL,NULL),(358,'icon-user',NULL,NULL),(359,'icon-users',NULL,NULL),(360,'icon-user-plus',NULL,NULL),(361,'icon-user-minus',NULL,NULL),(362,'icon-user-cancel',NULL,NULL),(363,'icon-user-block',NULL,NULL),(364,'icon-user-lock',NULL,NULL),(365,'icon-user-check',NULL,NULL),(366,'icon-users2',NULL,NULL),(367,'icon-users4',NULL,NULL),(368,'icon-user-tie',NULL,NULL),(369,'icon-collaboration',NULL,NULL),(370,'icon-vcard',NULL,NULL),(371,'icon-hat',NULL,NULL),(372,'icon-bowtie',NULL,NULL),(373,'icon-quotes-left',NULL,NULL),(374,'icon-quotes-right',NULL,NULL),(375,'icon-quotes-left2',NULL,NULL),(376,'icon-quotes-right2',NULL,NULL),(377,'icon-hour-glass',NULL,NULL),(378,'icon-hour-glass2',NULL,NULL),(379,'icon-hour-glass3',NULL,NULL),(380,'icon-spinner',NULL,NULL),(381,'icon-spinner2',NULL,NULL),(382,'icon-spinner3',NULL,NULL),(383,'icon-spinner4',NULL,NULL),(384,'icon-spinner6',NULL,NULL),(385,'icon-spinner9',NULL,NULL),(386,'icon-spinner10',NULL,NULL),(387,'icon-spinner11',NULL,NULL),(388,'icon-microscope',NULL,NULL),(389,'icon-enlarge',NULL,NULL),(390,'icon-shrink',NULL,NULL),(391,'icon-enlarge3',NULL,NULL),(392,'icon-shrink3',NULL,NULL),(393,'icon-enlarge5',NULL,NULL),(394,'icon-shrink5',NULL,NULL),(395,'icon-enlarge6',NULL,NULL),(396,'icon-shrink6',NULL,NULL),(397,'icon-enlarge7',NULL,NULL),(398,'icon-shrink7',NULL,NULL),(399,'icon-key',NULL,NULL),(400,'icon-lock',NULL,NULL),(401,'icon-lock2',NULL,NULL),(402,'icon-lock4',NULL,NULL),(403,'icon-unlocked',NULL,NULL),(404,'icon-lock5',NULL,NULL),(405,'icon-unlocked2',NULL,NULL),(406,'icon-safe',NULL,NULL),(407,'icon-wrench',NULL,NULL),(408,'icon-wrench2',NULL,NULL),(409,'icon-wrench3',NULL,NULL),(410,'icon-equalizer',NULL,NULL),(411,'icon-equalizer2',NULL,NULL),(412,'icon-equalizer3',NULL,NULL),(413,'icon-equalizer4',NULL,NULL),(414,'icon-cog',NULL,NULL),(415,'icon-cogs',NULL,NULL),(416,'icon-cog2',NULL,NULL),(417,'icon-cog3',NULL,NULL),(418,'icon-cog4',NULL,NULL),(419,'icon-cog52',NULL,NULL),(420,'icon-cog6',NULL,NULL),(421,'icon-cog7',NULL,NULL),(422,'icon-hammer',NULL,NULL),(423,'icon-hammer-wrench',NULL,NULL),(424,'icon-magic-wand',NULL,NULL),(425,'icon-magic-wand2',NULL,NULL),(426,'icon-pulse2',NULL,NULL),(427,'icon-aid-kit',NULL,NULL),(428,'icon-bug2',NULL,NULL),(429,'icon-construction',NULL,NULL),(430,'icon-traffic-cone',NULL,NULL),(431,'icon-traffic-lights',NULL,NULL),(432,'icon-pie-chart',NULL,NULL),(433,'icon-pie-chart2',NULL,NULL),(434,'icon-pie-chart3',NULL,NULL),(435,'icon-pie-chart4',NULL,NULL),(436,'icon-pie-chart5',NULL,NULL),(437,'icon-pie-chart6',NULL,NULL),(438,'icon-pie-chart7',NULL,NULL),(439,'icon-stats-dots',NULL,NULL),(440,'icon-stats-bars',NULL,NULL),(441,'icon-pie-chart8',NULL,NULL),(442,'icon-stats-bars2',NULL,NULL),(443,'icon-stats-bars3',NULL,NULL),(444,'icon-stats-bars4',NULL,NULL),(445,'icon-chart',NULL,NULL),(446,'icon-stats-growth',NULL,NULL),(447,'icon-stats-decline',NULL,NULL),(448,'icon-stats-growth2',NULL,NULL),(449,'icon-stats-decline2',NULL,NULL),(450,'icon-stairs-up',NULL,NULL),(451,'icon-stairs-down',NULL,NULL),(452,'icon-stairs',NULL,NULL),(453,'icon-ladder',NULL,NULL),(454,'icon-rating',NULL,NULL),(455,'icon-rating2',NULL,NULL),(456,'icon-rating3',NULL,NULL),(457,'icon-podium',NULL,NULL),(458,'icon-stars',NULL,NULL),(459,'icon-medal-star',NULL,NULL),(460,'icon-medal',NULL,NULL),(461,'icon-medal2',NULL,NULL),(462,'icon-medal-first',NULL,NULL),(463,'icon-medal-second',NULL,NULL),(464,'icon-medal-third',NULL,NULL),(465,'icon-crown',NULL,NULL),(466,'icon-trophy2',NULL,NULL),(467,'icon-trophy3',NULL,NULL),(468,'icon-diamond',NULL,NULL),(469,'icon-trophy4',NULL,NULL),(470,'icon-gift',NULL,NULL),(471,'icon-pipe',NULL,NULL),(472,'icon-mustache',NULL,NULL),(473,'icon-cup2',NULL,NULL),(474,'icon-coffee',NULL,NULL),(475,'icon-paw',NULL,NULL),(476,'icon-footprint',NULL,NULL),(477,'icon-rocket',NULL,NULL),(478,'icon-meter2',NULL,NULL),(479,'icon-meter-slow',NULL,NULL),(480,'icon-meter-fast',NULL,NULL),(481,'icon-hammer2',NULL,NULL),(482,'icon-balance',NULL,NULL),(483,'icon-fire',NULL,NULL),(484,'icon-fire2',NULL,NULL),(485,'icon-lab',NULL,NULL),(486,'icon-atom',NULL,NULL),(487,'icon-atom2',NULL,NULL),(488,'icon-bin',NULL,NULL),(489,'icon-bin2',NULL,NULL),(490,'icon-briefcase',NULL,NULL),(491,'icon-briefcase3',NULL,NULL),(492,'icon-airplane2',NULL,NULL),(493,'icon-airplane3',NULL,NULL),(494,'icon-airplane4',NULL,NULL),(495,'icon-paperplane',NULL,NULL),(496,'icon-car',NULL,NULL),(497,'icon-steering-wheel',NULL,NULL),(498,'icon-car2',NULL,NULL),(499,'icon-gas',NULL,NULL),(500,'icon-bus',NULL,NULL),(501,'icon-truck',NULL,NULL),(502,'icon-bike',NULL,NULL),(503,'icon-road',NULL,NULL),(504,'icon-train',NULL,NULL),(505,'icon-train2',NULL,NULL),(506,'icon-ship',NULL,NULL),(507,'icon-boat',NULL,NULL),(508,'icon-chopper',NULL,NULL),(509,'icon-cube',NULL,NULL),(510,'icon-cube2',NULL,NULL),(511,'icon-cube3',NULL,NULL),(512,'icon-cube4',NULL,NULL),(513,'icon-pyramid',NULL,NULL),(514,'icon-pyramid2',NULL,NULL),(515,'icon-package',NULL,NULL),(516,'icon-puzzle',NULL,NULL),(517,'icon-puzzle2',NULL,NULL),(518,'icon-puzzle3',NULL,NULL),(519,'icon-puzzle4',NULL,NULL),(520,'icon-glasses-3d2',NULL,NULL),(521,'icon-brain',NULL,NULL),(522,'icon-accessibility',NULL,NULL),(523,'icon-accessibility2',NULL,NULL),(524,'icon-strategy',NULL,NULL),(525,'icon-target',NULL,NULL),(526,'icon-target2',NULL,NULL),(527,'icon-shield-check',NULL,NULL),(528,'icon-shield-notice',NULL,NULL),(529,'icon-shield2',NULL,NULL),(530,'icon-racing',NULL,NULL),(531,'icon-finish',NULL,NULL),(532,'icon-power2',NULL,NULL),(533,'icon-power3',NULL,NULL),(534,'icon-switch',NULL,NULL),(535,'icon-switch22',NULL,NULL),(536,'icon-power-cord',NULL,NULL),(537,'icon-clipboard',NULL,NULL),(538,'icon-clipboard2',NULL,NULL),(539,'icon-clipboard3',NULL,NULL),(540,'icon-clipboard4',NULL,NULL),(541,'icon-clipboard5',NULL,NULL),(542,'icon-clipboard6',NULL,NULL),(543,'icon-playlist',NULL,NULL),(544,'icon-playlist-add',NULL,NULL),(545,'icon-list-numbered',NULL,NULL),(546,'icon-list',NULL,NULL),(547,'icon-list2',NULL,NULL),(548,'icon-more',NULL,NULL),(549,'icon-more2',NULL,NULL),(550,'icon-grid',NULL,NULL),(551,'icon-grid2',NULL,NULL),(552,'icon-grid3',NULL,NULL),(553,'icon-grid4',NULL,NULL),(554,'icon-grid52',NULL,NULL),(555,'icon-grid6',NULL,NULL),(556,'icon-grid7',NULL,NULL),(557,'icon-tree5',NULL,NULL),(558,'icon-tree6',NULL,NULL),(559,'icon-tree7',NULL,NULL),(560,'icon-lan',NULL,NULL),(561,'icon-lan2',NULL,NULL),(562,'icon-lan3',NULL,NULL),(563,'icon-menu',NULL,NULL),(564,'icon-circle-small',NULL,NULL),(565,'icon-menu2',NULL,NULL),(566,'icon-menu3',NULL,NULL),(567,'icon-menu4',NULL,NULL),(568,'icon-menu5',NULL,NULL),(569,'icon-menu62',NULL,NULL),(570,'icon-menu7',NULL,NULL),(571,'icon-menu8',NULL,NULL),(572,'icon-menu9',NULL,NULL),(573,'icon-menu10',NULL,NULL),(574,'icon-cloud',NULL,NULL),(575,'icon-cloud-download',NULL,NULL),(576,'icon-cloud-upload',NULL,NULL),(577,'icon-cloud-check',NULL,NULL),(578,'icon-cloud2',NULL,NULL),(579,'icon-cloud-download2',NULL,NULL),(580,'icon-cloud-upload2',NULL,NULL),(581,'icon-cloud-check2',NULL,NULL),(582,'icon-import',NULL,NULL),(583,'icon-download4',NULL,NULL),(584,'icon-upload4',NULL,NULL),(585,'icon-download7',NULL,NULL),(586,'icon-upload7',NULL,NULL),(587,'icon-download10',NULL,NULL),(588,'icon-upload10',NULL,NULL),(589,'icon-sphere',NULL,NULL),(590,'icon-sphere3',NULL,NULL),(591,'icon-earth',NULL,NULL),(592,'icon-link',NULL,NULL),(593,'icon-unlink',NULL,NULL),(594,'icon-link2',NULL,NULL),(595,'icon-unlink2',NULL,NULL),(596,'icon-anchor',NULL,NULL),(597,'icon-flag3',NULL,NULL),(598,'icon-flag4',NULL,NULL),(599,'icon-flag7',NULL,NULL),(600,'icon-flag8',NULL,NULL),(601,'icon-attachment',NULL,NULL),(602,'icon-attachment2',NULL,NULL),(603,'icon-eye',NULL,NULL),(604,'icon-eye-plus',NULL,NULL),(605,'icon-eye-minus',NULL,NULL),(606,'icon-eye-blocked',NULL,NULL),(607,'icon-eye2',NULL,NULL),(608,'icon-eye-blocked2',NULL,NULL),(609,'icon-eye4',NULL,NULL),(610,'icon-bookmark2',NULL,NULL),(611,'icon-bookmark3',NULL,NULL),(612,'icon-bookmarks',NULL,NULL),(613,'icon-bookmark4',NULL,NULL),(614,'icon-spotlight2',NULL,NULL),(615,'icon-starburst',NULL,NULL),(616,'icon-snowflake',NULL,NULL),(617,'icon-weather-windy',NULL,NULL),(618,'icon-fan',NULL,NULL),(619,'icon-umbrella',NULL,NULL),(620,'icon-sun3',NULL,NULL),(621,'icon-contrast',NULL,NULL),(622,'icon-bed2',NULL,NULL),(623,'icon-furniture',NULL,NULL),(624,'icon-chair',NULL,NULL),(625,'icon-star-empty3',NULL,NULL),(626,'icon-star-half',NULL,NULL),(627,'icon-star-full2',NULL,NULL),(628,'icon-heart5',NULL,NULL),(629,'icon-heart6',NULL,NULL),(630,'icon-heart-broken2',NULL,NULL),(631,'icon-thumbs-up2',NULL,NULL),(632,'icon-thumbs-down2',NULL,NULL),(633,'icon-thumbs-up3',NULL,NULL),(634,'icon-thumbs-down3',NULL,NULL),(635,'icon-height',NULL,NULL),(636,'icon-man',NULL,NULL),(637,'icon-woman',NULL,NULL),(638,'icon-man-woman',NULL,NULL),(639,'icon-yin-yang',NULL,NULL),(640,'icon-cursor',NULL,NULL),(641,'icon-cursor2',NULL,NULL),(642,'icon-lasso2',NULL,NULL),(643,'icon-select2',NULL,NULL),(644,'icon-point-up',NULL,NULL),(645,'icon-point-right',NULL,NULL),(646,'icon-point-down',NULL,NULL),(647,'icon-point-left',NULL,NULL),(648,'icon-pointer',NULL,NULL),(649,'icon-reminder',NULL,NULL),(650,'icon-drag-left-right',NULL,NULL),(651,'icon-drag-left',NULL,NULL),(652,'icon-drag-right',NULL,NULL),(653,'icon-touch',NULL,NULL),(654,'icon-multitouch',NULL,NULL),(655,'icon-touch-zoom',NULL,NULL),(656,'icon-touch-pinch',NULL,NULL),(657,'icon-hand',NULL,NULL),(658,'icon-grab',NULL,NULL),(659,'icon-stack-empty',NULL,NULL),(660,'icon-stack-plus',NULL,NULL),(661,'icon-stack-minus',NULL,NULL),(662,'icon-stack-star',NULL,NULL),(663,'icon-stack-picture',NULL,NULL),(664,'icon-stack-down',NULL,NULL),(665,'icon-stack-up',NULL,NULL),(666,'icon-stack-cancel',NULL,NULL),(667,'icon-stack-check',NULL,NULL),(668,'icon-stack-text',NULL,NULL),(669,'icon-stack4',NULL,NULL),(670,'icon-stack-music',NULL,NULL),(671,'icon-stack-play',NULL,NULL),(672,'icon-move',NULL,NULL),(673,'icon-dots',NULL,NULL),(674,'icon-warning',NULL,NULL),(675,'icon-warning22',NULL,NULL),(676,'icon-notification2',NULL,NULL),(677,'icon-question3',NULL,NULL),(678,'icon-question4',NULL,NULL),(679,'icon-plus3',NULL,NULL),(680,'icon-minus3',NULL,NULL),(681,'icon-plus-circle2',NULL,NULL),(682,'icon-minus-circle2',NULL,NULL),(683,'icon-cancel-circle2',NULL,NULL),(684,'icon-blocked',NULL,NULL),(685,'icon-cancel-square',NULL,NULL),(686,'icon-cancel-square2',NULL,NULL),(687,'icon-spam',NULL,NULL),(688,'icon-cross2',NULL,NULL),(689,'icon-cross3',NULL,NULL),(690,'icon-checkmark',NULL,NULL),(691,'icon-checkmark3',NULL,NULL),(692,'icon-checkmark2',NULL,NULL),(693,'icon-checkmark4',NULL,NULL),(694,'icon-spell-check',NULL,NULL),(695,'icon-spell-check2',NULL,NULL),(696,'icon-enter',NULL,NULL),(697,'icon-exit',NULL,NULL),(698,'icon-enter2',NULL,NULL),(699,'icon-exit2',NULL,NULL),(700,'icon-enter3',NULL,NULL),(701,'icon-exit3',NULL,NULL),(702,'icon-wall',NULL,NULL),(703,'icon-fence',NULL,NULL),(704,'icon-play3',NULL,NULL),(705,'icon-pause',NULL,NULL),(706,'icon-stop',NULL,NULL),(707,'icon-previous',NULL,NULL),(708,'icon-next',NULL,NULL),(709,'icon-backward',NULL,NULL),(710,'icon-forward2',NULL,NULL),(711,'icon-play4',NULL,NULL),(712,'icon-pause2',NULL,NULL),(713,'icon-stop2',NULL,NULL),(714,'icon-backward2',NULL,NULL),(715,'icon-forward3',NULL,NULL),(716,'icon-first',NULL,NULL),(717,'icon-last',NULL,NULL),(718,'icon-previous2',NULL,NULL),(719,'icon-next2',NULL,NULL),(720,'icon-eject',NULL,NULL),(721,'icon-volume-high',NULL,NULL),(722,'icon-volume-medium',NULL,NULL),(723,'icon-volume-low',NULL,NULL),(724,'icon-volume-mute',NULL,NULL),(725,'icon-speaker-left',NULL,NULL),(726,'icon-speaker-right',NULL,NULL),(727,'icon-volume-mute2',NULL,NULL),(728,'icon-volume-increase',NULL,NULL),(729,'icon-volume-decrease',NULL,NULL),(730,'icon-volume-mute5',NULL,NULL),(731,'icon-loop',NULL,NULL),(732,'icon-loop3',NULL,NULL),(733,'icon-infinite-square',NULL,NULL),(734,'icon-infinite',NULL,NULL),(735,'icon-loop4',NULL,NULL),(736,'icon-shuffle',NULL,NULL),(737,'icon-wave',NULL,NULL),(738,'icon-wave2',NULL,NULL),(739,'icon-split',NULL,NULL),(740,'icon-merge',NULL,NULL),(741,'icon-arrow-up5',NULL,NULL),(742,'icon-arrow-right5',NULL,NULL),(743,'icon-arrow-down5',NULL,NULL),(744,'icon-arrow-left5',NULL,NULL),(745,'icon-arrow-up-left2',NULL,NULL),(746,'icon-arrow-up7',NULL,NULL),(747,'icon-arrow-up-right2',NULL,NULL),(748,'icon-arrow-right7',NULL,NULL),(749,'icon-arrow-down-right2',NULL,NULL),(750,'icon-arrow-down7',NULL,NULL),(751,'icon-arrow-down-left2',NULL,NULL),(752,'icon-arrow-left7',NULL,NULL),(753,'icon-arrow-up-left3',NULL,NULL),(754,'icon-arrow-up8',NULL,NULL),(755,'icon-arrow-up-right3',NULL,NULL),(756,'icon-arrow-right8',NULL,NULL),(757,'icon-arrow-down-right3',NULL,NULL),(758,'icon-arrow-down8',NULL,NULL),(759,'icon-arrow-down-left3',NULL,NULL),(760,'icon-arrow-left8',NULL,NULL),(761,'icon-circle-up2',NULL,NULL),(762,'icon-circle-right2',NULL,NULL),(763,'icon-circle-down2',NULL,NULL),(764,'icon-circle-left2',NULL,NULL),(765,'icon-arrow-resize7',NULL,NULL),(766,'icon-arrow-resize8',NULL,NULL),(767,'icon-square-up-left',NULL,NULL),(768,'icon-square-up',NULL,NULL),(769,'icon-square-up-right',NULL,NULL),(770,'icon-square-right',NULL,NULL),(771,'icon-square-down-right',NULL,NULL),(772,'icon-square-down',NULL,NULL),(773,'icon-square-down-left',NULL,NULL),(774,'icon-square-left',NULL,NULL),(775,'icon-arrow-up15',NULL,NULL),(776,'icon-arrow-right15',NULL,NULL),(777,'icon-arrow-down15',NULL,NULL),(778,'icon-arrow-left15',NULL,NULL),(779,'icon-arrow-up16',NULL,NULL),(780,'icon-arrow-right16',NULL,NULL),(781,'icon-arrow-down16',NULL,NULL),(782,'icon-arrow-left16',NULL,NULL),(783,'icon-menu-open',NULL,NULL),(784,'icon-menu-open2',NULL,NULL),(785,'icon-menu-close',NULL,NULL),(786,'icon-menu-close2',NULL,NULL),(787,'icon-enter5',NULL,NULL),(788,'icon-esc',NULL,NULL),(789,'icon-enter6',NULL,NULL),(790,'icon-backspace',NULL,NULL),(791,'icon-backspace2',NULL,NULL),(792,'icon-tab',NULL,NULL),(793,'icon-transmission',NULL,NULL),(794,'icon-sort',NULL,NULL),(795,'icon-move-up2',NULL,NULL),(796,'icon-move-down2',NULL,NULL),(797,'icon-sort-alpha-asc',NULL,NULL),(798,'icon-sort-alpha-desc',NULL,NULL),(799,'icon-sort-numeric-asc',NULL,NULL),(800,'icon-sort-numberic-desc',NULL,NULL),(801,'icon-sort-amount-asc',NULL,NULL),(802,'icon-sort-amount-desc',NULL,NULL),(803,'icon-sort-time-asc',NULL,NULL),(804,'icon-sort-time-desc',NULL,NULL),(805,'icon-battery-6',NULL,NULL),(806,'icon-battery-0',NULL,NULL),(807,'icon-battery-charging',NULL,NULL),(808,'icon-command',NULL,NULL),(809,'icon-shift',NULL,NULL),(810,'icon-ctrl',NULL,NULL),(811,'icon-opt',NULL,NULL),(812,'icon-checkbox-checked',NULL,NULL),(813,'icon-checkbox-unchecked',NULL,NULL),(814,'icon-checkbox-partial',NULL,NULL),(815,'icon-square',NULL,NULL),(816,'icon-triangle',NULL,NULL),(817,'icon-triangle2',NULL,NULL),(818,'icon-diamond3',NULL,NULL),(819,'icon-diamond4',NULL,NULL),(820,'icon-checkbox-checked2',NULL,NULL),(821,'icon-checkbox-unchecked2',NULL,NULL),(822,'icon-checkbox-partial2',NULL,NULL),(823,'icon-radio-checked',NULL,NULL),(824,'icon-radio-checked2',NULL,NULL),(825,'icon-radio-unchecked',NULL,NULL),(826,'icon-checkmark-circle',NULL,NULL),(827,'icon-circle',NULL,NULL),(828,'icon-circle2',NULL,NULL),(829,'icon-circles',NULL,NULL),(830,'icon-circles2',NULL,NULL),(831,'icon-crop',NULL,NULL),(832,'icon-crop2',NULL,NULL),(833,'icon-make-group',NULL,NULL),(834,'icon-ungroup',NULL,NULL),(835,'icon-vector',NULL,NULL),(836,'icon-vector2',NULL,NULL),(837,'icon-rulers',NULL,NULL),(838,'icon-pencil-ruler',NULL,NULL),(839,'icon-scissors',NULL,NULL),(840,'icon-filter3',NULL,NULL),(841,'icon-filter4',NULL,NULL),(842,'icon-font',NULL,NULL),(843,'icon-ampersand2',NULL,NULL),(844,'icon-ligature',NULL,NULL),(845,'icon-font-size',NULL,NULL),(846,'icon-typography',NULL,NULL),(847,'icon-text-height',NULL,NULL),(848,'icon-text-width',NULL,NULL),(849,'icon-height2',NULL,NULL),(850,'icon-width',NULL,NULL),(851,'icon-strikethrough2',NULL,NULL),(852,'icon-font-size2',NULL,NULL),(853,'icon-bold2',NULL,NULL),(854,'icon-underline2',NULL,NULL),(855,'icon-italic2',NULL,NULL),(856,'icon-strikethrough3',NULL,NULL),(857,'icon-omega',NULL,NULL),(858,'icon-sigma',NULL,NULL),(859,'icon-nbsp',NULL,NULL),(860,'icon-page-break',NULL,NULL),(861,'icon-page-break2',NULL,NULL),(862,'icon-superscript',NULL,NULL),(863,'icon-subscript',NULL,NULL),(864,'icon-superscript2',NULL,NULL),(865,'icon-subscript2',NULL,NULL),(866,'icon-text-color',NULL,NULL),(867,'icon-highlight',NULL,NULL),(868,'icon-pagebreak',NULL,NULL),(869,'icon-clear-formatting',NULL,NULL),(870,'icon-table',NULL,NULL),(871,'icon-table2',NULL,NULL),(872,'icon-insert-template',NULL,NULL),(873,'icon-pilcrow',NULL,NULL),(874,'icon-ltr',NULL,NULL),(875,'icon-rtl',NULL,NULL),(876,'icon-ltr2',NULL,NULL),(877,'icon-rtl2',NULL,NULL),(878,'icon-section',NULL,NULL),(879,'icon-paragraph-left2',NULL,NULL),(880,'icon-paragraph-center2',NULL,NULL),(881,'icon-paragraph-right2',NULL,NULL),(882,'icon-paragraph-justify2',NULL,NULL),(883,'icon-indent-increase',NULL,NULL),(884,'icon-indent-decrease',NULL,NULL),(885,'icon-paragraph-left3',NULL,NULL),(886,'icon-paragraph-center3',NULL,NULL),(887,'icon-paragraph-right3',NULL,NULL),(888,'icon-paragraph-justify3',NULL,NULL),(889,'icon-indent-increase2',NULL,NULL),(890,'icon-indent-decrease2',NULL,NULL),(891,'icon-share',NULL,NULL),(892,'icon-share2',NULL,NULL),(893,'icon-new-tab',NULL,NULL),(894,'icon-new-tab2',NULL,NULL),(895,'icon-popout',NULL,NULL),(896,'icon-embed',NULL,NULL),(897,'icon-embed2',NULL,NULL),(898,'icon-markup',NULL,NULL),(899,'icon-regexp',NULL,NULL),(900,'icon-regexp2',NULL,NULL),(901,'icon-code',NULL,NULL),(902,'icon-circle-css',NULL,NULL),(903,'icon-circle-code',NULL,NULL),(904,'icon-terminal',NULL,NULL),(905,'icon-unicode',NULL,NULL),(906,'icon-seven-segment-0',NULL,NULL),(907,'icon-seven-segment-1',NULL,NULL),(908,'icon-seven-segment-2',NULL,NULL),(909,'icon-seven-segment-3',NULL,NULL),(910,'icon-seven-segment-4',NULL,NULL),(911,'icon-seven-segment-5',NULL,NULL),(912,'icon-seven-segment-6',NULL,NULL),(913,'icon-seven-segment-7',NULL,NULL),(914,'icon-seven-segment-8',NULL,NULL),(915,'icon-seven-segment-9',NULL,NULL),(916,'icon-share3',NULL,NULL),(917,'icon-share4',NULL,NULL),(918,'icon-google',NULL,NULL),(919,'icon-google-plus',NULL,NULL),(920,'icon-google-plus2',NULL,NULL),(921,'icon-google-drive',NULL,NULL),(922,'icon-facebook',NULL,NULL),(923,'icon-facebook2',NULL,NULL),(924,'icon-instagram',NULL,NULL),(925,'icon-twitter',NULL,NULL),(926,'icon-twitter2',NULL,NULL),(927,'icon-feed2',NULL,NULL),(928,'icon-feed3',NULL,NULL),(929,'icon-youtube',NULL,NULL),(930,'icon-youtube2',NULL,NULL),(931,'icon-youtube3',NULL,NULL),(932,'icon-vimeo',NULL,NULL),(933,'icon-vimeo2',NULL,NULL),(934,'icon-lanyrd',NULL,NULL),(935,'icon-flickr',NULL,NULL),(936,'icon-flickr2',NULL,NULL),(937,'icon-flickr3',NULL,NULL),(938,'icon-picassa',NULL,NULL),(939,'icon-picassa2',NULL,NULL),(940,'icon-dribbble',NULL,NULL),(941,'icon-dribbble2',NULL,NULL),(942,'icon-dribbble3',NULL,NULL),(943,'icon-forrst',NULL,NULL),(944,'icon-forrst2',NULL,NULL),(945,'icon-deviantart',NULL,NULL),(946,'icon-deviantart2',NULL,NULL),(947,'icon-steam',NULL,NULL),(948,'icon-steam2',NULL,NULL),(949,'icon-dropbox',NULL,NULL),(950,'icon-onedrive',NULL,NULL),(951,'icon-github',NULL,NULL),(952,'icon-github4',NULL,NULL),(953,'icon-github5',NULL,NULL),(954,'icon-wordpress',NULL,NULL),(955,'icon-wordpress2',NULL,NULL),(956,'icon-joomla',NULL,NULL),(957,'icon-blogger',NULL,NULL),(958,'icon-blogger2',NULL,NULL),(959,'icon-tumblr',NULL,NULL),(960,'icon-tumblr2',NULL,NULL),(961,'icon-yahoo',NULL,NULL),(962,'icon-tux',NULL,NULL),(963,'icon-apple2',NULL,NULL),(964,'icon-finder',NULL,NULL),(965,'icon-android',NULL,NULL),(966,'icon-windows',NULL,NULL),(967,'icon-windows8',NULL,NULL),(968,'icon-soundcloud',NULL,NULL),(969,'icon-soundcloud2',NULL,NULL),(970,'icon-skype',NULL,NULL),(971,'icon-reddit',NULL,NULL),(972,'icon-linkedin',NULL,NULL),(973,'icon-linkedin2',NULL,NULL),(974,'icon-lastfm',NULL,NULL),(975,'icon-lastfm2',NULL,NULL),(976,'icon-delicious',NULL,NULL),(977,'icon-stumbleupon',NULL,NULL),(978,'icon-stumbleupon2',NULL,NULL),(979,'icon-stackoverflow',NULL,NULL),(980,'icon-pinterest2',NULL,NULL),(981,'icon-xing',NULL,NULL),(982,'icon-flattr',NULL,NULL),(983,'icon-foursquare',NULL,NULL),(984,'icon-paypal',NULL,NULL),(985,'icon-paypal2',NULL,NULL),(986,'icon-yelp',NULL,NULL),(987,'icon-file-pdf',NULL,NULL),(988,'icon-file-openoffice',NULL,NULL),(989,'icon-file-word',NULL,NULL),(990,'icon-file-excel',NULL,NULL),(991,'icon-libreoffice',NULL,NULL),(992,'icon-html5',NULL,NULL),(993,'icon-html52',NULL,NULL),(994,'icon-css3',NULL,NULL),(995,'icon-git',NULL,NULL),(996,'icon-svg',NULL,NULL),(997,'icon-codepen',NULL,NULL),(998,'icon-chrome',NULL,NULL),(999,'icon-firefox',NULL,NULL),(1000,'icon-IE',NULL,NULL),(1001,'icon-opera',NULL,NULL),(1002,'icon-safari',NULL,NULL),(1003,'icon-check2',NULL,NULL),(1004,'icon-home4',NULL,NULL),(1005,'icon-people',NULL,NULL),(1006,'icon-checkmark-circle2',NULL,NULL),(1007,'icon-arrow-up-left32',NULL,NULL),(1008,'icon-arrow-up52',NULL,NULL),(1009,'icon-arrow-up-right32',NULL,NULL),(1010,'icon-arrow-right6',NULL,NULL),(1011,'icon-arrow-down-right32',NULL,NULL),(1012,'icon-arrow-down52',NULL,NULL),(1013,'icon-arrow-down-left32',NULL,NULL),(1014,'icon-arrow-left52',NULL,NULL),(1015,'icon-calendar5',NULL,NULL),(1016,'icon-move-alt1',NULL,NULL),(1017,'icon-reload-alt',NULL,NULL),(1018,'icon-move-vertical',NULL,NULL),(1019,'icon-move-horizontal',NULL,NULL),(1020,'icon-hash',NULL,NULL),(1021,'icon-bars-alt',NULL,NULL),(1022,'icon-eye8',NULL,NULL),(1023,'icon-search4',NULL,NULL),(1024,'icon-zoomin3',NULL,NULL),(1025,'icon-zoomout3',NULL,NULL),(1026,'icon-add',NULL,NULL),(1027,'icon-subtract',NULL,NULL),(1028,'icon-exclamation',NULL,NULL),(1029,'icon-question6',NULL,NULL),(1030,'icon-close2',NULL,NULL),(1031,'icon-task',NULL,NULL),(1032,'icon-inbox',NULL,NULL),(1033,'icon-inbox-alt',NULL,NULL),(1034,'icon-envelope',NULL,NULL),(1035,'icon-compose',NULL,NULL),(1036,'icon-newspaper2',NULL,NULL),(1037,'icon-calendar22',NULL,NULL),(1038,'icon-hyperlink',NULL,NULL),(1039,'icon-trash',NULL,NULL),(1040,'icon-trash-alt',NULL,NULL),(1041,'icon-grid5',NULL,NULL),(1042,'icon-grid-alt',NULL,NULL),(1043,'icon-menu6',NULL,NULL),(1044,'icon-list3',NULL,NULL),(1045,'icon-gallery',NULL,NULL),(1046,'icon-calculator',NULL,NULL),(1047,'icon-windows2',NULL,NULL),(1048,'icon-browser',NULL,NULL),(1049,'icon-portfolio',NULL,NULL),(1050,'icon-comments',NULL,NULL),(1051,'icon-screen3',NULL,NULL),(1052,'icon-iphone',NULL,NULL),(1053,'icon-ipad',NULL,NULL),(1054,'icon-googleplus5',NULL,NULL),(1055,'icon-pin',NULL,NULL),(1056,'icon-pin-alt',NULL,NULL),(1057,'icon-cog5',NULL,NULL),(1058,'icon-graduation',NULL,NULL),(1059,'icon-air',NULL,NULL),(1060,'icon-droplets',NULL,NULL),(1061,'icon-statistics',NULL,NULL),(1062,'icon-pie5',NULL,NULL),(1063,'icon-cross',NULL,NULL),(1064,'icon-minus2',NULL,NULL),(1065,'icon-plus2',NULL,NULL),(1066,'icon-info3',NULL,NULL),(1067,'icon-info22',NULL,NULL),(1068,'icon-question7',NULL,NULL),(1069,'icon-help',NULL,NULL),(1070,'icon-warning2',NULL,NULL),(1071,'icon-add-to-list',NULL,NULL),(1072,'icon-arrow-left12',NULL,NULL),(1073,'icon-arrow-down12',NULL,NULL),(1074,'icon-arrow-up12',NULL,NULL),(1075,'icon-arrow-right13',NULL,NULL),(1076,'icon-arrow-left22',NULL,NULL),(1077,'icon-arrow-down22',NULL,NULL),(1078,'icon-arrow-up22',NULL,NULL),(1079,'icon-arrow-right22',NULL,NULL),(1080,'icon-arrow-left32',NULL,NULL),(1081,'icon-arrow-down32',NULL,NULL),(1082,'icon-arrow-up32',NULL,NULL),(1083,'icon-arrow-right32',NULL,NULL),(1084,'icon-switch2',NULL,NULL),(1085,'icon-checkmark5',NULL,NULL),(1086,'icon-ampersand',NULL,NULL),(1087,'icon-alert',NULL,NULL),(1088,'icon-alignment-align',NULL,NULL),(1089,'icon-alignment-aligned-to',NULL,NULL),(1090,'icon-alignment-unalign',NULL,NULL),(1091,'icon-arrow-down132',NULL,NULL),(1092,'icon-arrow-up13',NULL,NULL),(1093,'icon-arrow-left13',NULL,NULL),(1094,'icon-arrow-right14',NULL,NULL),(1095,'icon-arrow-small-down',NULL,NULL),(1096,'icon-arrow-small-left',NULL,NULL),(1097,'icon-arrow-small-right',NULL,NULL),(1098,'icon-arrow-small-up',NULL,NULL),(1099,'icon-check',NULL,NULL),(1100,'icon-chevron-down',NULL,NULL),(1101,'icon-chevron-left',NULL,NULL),(1102,'icon-chevron-right',NULL,NULL),(1103,'icon-chevron-up',NULL,NULL),(1104,'icon-clippy',NULL,NULL),(1105,'icon-comment',NULL,NULL),(1106,'icon-comment-discussion',NULL,NULL),(1107,'icon-dash',NULL,NULL),(1108,'icon-diff',NULL,NULL),(1109,'icon-diff-added',NULL,NULL),(1110,'icon-diff-ignored',NULL,NULL),(1111,'icon-diff-modified',NULL,NULL),(1112,'icon-diff-removed',NULL,NULL),(1113,'icon-diff-renamed',NULL,NULL),(1114,'icon-file-media',NULL,NULL),(1115,'icon-fold',NULL,NULL),(1116,'icon-gear',NULL,NULL),(1117,'icon-git-branch',NULL,NULL),(1118,'icon-git-commit',NULL,NULL),(1119,'icon-git-compare',NULL,NULL),(1120,'icon-git-merge',NULL,NULL),(1121,'icon-git-pull-request',NULL,NULL),(1122,'icon-graph',NULL,NULL),(1123,'icon-law',NULL,NULL),(1124,'icon-list-ordered',NULL,NULL),(1125,'icon-list-unordered',NULL,NULL),(1126,'icon-mail5',NULL,NULL),(1127,'icon-mail-read',NULL,NULL),(1128,'icon-mention',NULL,NULL),(1129,'icon-mirror',NULL,NULL),(1130,'icon-move-down',NULL,NULL),(1131,'icon-move-left',NULL,NULL),(1132,'icon-move-right',NULL,NULL),(1133,'icon-move-up',NULL,NULL),(1134,'icon-person',NULL,NULL),(1135,'icon-plus22',NULL,NULL),(1136,'icon-primitive-dot',NULL,NULL),(1137,'icon-primitive-square',NULL,NULL),(1138,'icon-repo-forked',NULL,NULL),(1139,'icon-screen-full',NULL,NULL),(1140,'icon-screen-normal',NULL,NULL),(1141,'icon-sync',NULL,NULL),(1142,'icon-three-bars',NULL,NULL),(1143,'icon-unfold',NULL,NULL),(1144,'icon-versions',NULL,NULL),(1145,'icon-x',NULL,NULL);
/*!40000 ALTER TABLE `icons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jabatan`
--

DROP TABLE IF EXISTS `jabatan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jabatan` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nm_jabatan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gaji_pokok` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jabatan`
--

LOCK TABLES `jabatan` WRITE;
/*!40000 ALTER TABLE `jabatan` DISABLE KEYS */;
INSERT INTO `jabatan` VALUES (1,'Chief Executive Officer',20000000,NULL,NULL),(2,'Head of Business Development',10000000,NULL,NULL),(3,'Chief Technology Officer',10000000,NULL,NULL),(4,'Head of Finance',10000000,NULL,NULL),(5,'Finance Staff',9000000,NULL,NULL),(6,'FE Manager',7000000,NULL,NULL),(7,'BE Manager',7000000,NULL,NULL),(8,'Mobile Manager',7000000,NULL,NULL),(9,'DevOps Manager',7000000,NULL,NULL),(10,'Elite Engineer ',7000000,NULL,NULL),(11,'Engineer Staff ',7000000,NULL,NULL),(12,'R & D Director',5000000,NULL,NULL),(13,'Engineer Platform',9000000,NULL,NULL),(14,'Training Director',9000000,NULL,NULL),(15,'Training Manager',9000000,NULL,NULL),(16,'Training Staff',9000000,NULL,NULL),(17,'PM',9000000,NULL,NULL),(18,'QA Coord.',9000000,NULL,NULL),(19,'QA Staff',9000000,NULL,NULL),(20,'Marketing & Admin Coord.',9000000,NULL,NULL),(21,'Admin Staff',9000000,NULL,NULL),(22,'Content Coord.',9000000,NULL,NULL),(23,'Content Staff',9000000,NULL,NULL),(24,'HRD Coord.',9000000,NULL,NULL),(25,'HR Staff',9000000,NULL,NULL),(26,'Operasional',9000000,NULL,NULL);
/*!40000 ALTER TABLE `jabatan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laporan_harian_t`
--

DROP TABLE IF EXISTS `laporan_harian_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `laporan_harian_t` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tanggal` date NOT NULL,
  `barang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kegiatan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dokumentasi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `jumlah_pekerjaan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alat_digunakan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_user` int NOT NULL,
  `keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24060002 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laporan_harian_t`
--

LOCK TABLES `laporan_harian_t` WRITE;
/*!40000 ALTER TABLE `laporan_harian_t` DISABLE KEYS */;
INSERT INTO `laporan_harian_t` VALUES (24060001,'2024-06-30','barang 1','kegiatan q','barang 1_3006241425.jpg','12','12',24060001,'aktif',NULL,NULL);
/*!40000 ALTER TABLE `laporan_harian_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master_dokumen`
--

DROP TABLE IF EXISTS `master_dokumen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `master_dokumen` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal` date NOT NULL,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_user_create` int NOT NULL,
  `id_user_update` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_dokumen`
--

LOCK TABLES `master_dokumen` WRITE;
/*!40000 ALTER TABLE `master_dokumen` DISABLE KEYS */;
INSERT INTO `master_dokumen` VALUES (2,'laporanUmum','Laporan Umum 1','2024-06-26','Laporan Umum 1_3006241456.docx',24060001,NULL,'2024-06-30 07:56:14','2024-06-30 07:56:14');
/*!40000 ALTER TABLE `master_dokumen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_parent` bigint unsigned DEFAULT NULL,
  `judul` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_hak_akses` bigint unsigned DEFAULT NULL,
  `order` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menus_id_parent_index` (`id_parent`),
  KEY `menus_id_hak_akses_index` (`id_hak_akses`),
  CONSTRAINT `menus_id_hak_akses_foreign` FOREIGN KEY (`id_hak_akses`) REFERENCES `permissions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `menus_id_parent_foreign` FOREIGN KEY (`id_parent`) REFERENCES `menus` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,NULL,'Dashboard Admin','superAdmin','icon-rocket',1,0,NULL,NULL),(2,NULL,'Dashboard HRD','hrd','icon-rocket',2,1,NULL,NULL),(3,NULL,'Menu Staff',NULL,'icon-user',3,2,NULL,NULL),(4,3,'Dashboard Staff','staff',NULL,3,3,NULL,NULL),(5,3,'Riwayat Pengajuan Cuti','staffCuti',NULL,3,4,NULL,NULL),(6,3,'Buat Pengajuan Cuti','staffCuti/create',NULL,3,5,NULL,NULL),(7,3,'Pengajuan Cuti (Tahap Atasan)','staffPengajuanCuti',NULL,3,6,NULL,NULL),(8,NULL,'Manajemen Role & Menu','manajemen','icon-key',4,7,NULL,NULL),(9,NULL,'Manajemen Perusahaan','perusahaan',' icon-highlight',14,8,NULL,NULL),(10,NULL,'Kebijakan Cuti & Jam Kantor','peraturan','icon-info3',5,9,NULL,NULL),(11,NULL,'Data Pegawai','pegawai','icon-users4',6,10,NULL,NULL),(12,NULL,'Data Jabatan',NULL,'icon-user-tie',7,11,NULL,NULL),(13,12,'List Data Jabatan','jabatan',NULL,7,12,NULL,NULL),(14,12,'Data Riwayat Jabatan','riwayatJabatan',NULL,7,13,NULL,NULL),(15,NULL,'Data Divisi',NULL,'icon-hat',8,14,NULL,NULL),(16,15,'List Data Divisi','divisi',NULL,8,15,NULL,NULL),(17,15,'Data Riwayat Divisi','riwayatDivisi',NULL,8,16,NULL,NULL),(18,NULL,'Data Presensi',NULL,'icon-notebook',3,17,NULL,NULL),(19,18,'List Data Presensi','presensi',NULL,3,18,NULL,NULL),(20,18,'Rekapan Data Presensi Pegawai','rekapPresensi',NULL,3,19,NULL,NULL),(21,NULL,'Data Cuti',NULL,'icon-furniture',10,20,NULL,NULL),(22,21,'List Data Cuti','cuti',NULL,10,21,NULL,NULL),(23,21,'Atur Tanggal Cuti Bersama','cuti/cutiBersama',NULL,10,22,NULL,NULL),(24,21,'Pengajuan Cuti (Tahap HRD)','hrdPengajuanCuti',NULL,10,23,NULL,NULL),(25,21,'Rekapan Data Cuti Pegawai','rekapCuti',NULL,10,24,NULL,NULL),(26,NULL,'Data Gaji',NULL,'icon-cash3',11,25,NULL,NULL),(27,26,'Data Tunjangan','tunjangan',NULL,11,26,NULL,NULL),(28,26,'Data Potongan','potongan',NULL,11,27,NULL,NULL),(29,26,'Data Slip Gaji ','gaji',NULL,11,28,NULL,NULL),(30,NULL,'Surat Peringatan','suratPeringatan',' icon-file-text2',12,29,NULL,NULL),(31,NULL,'Export Kinerja Pegawai','report','icon-magazine',13,30,NULL,NULL),(32,3,'Penilaian Karyawan','penilaian',NULL,3,31,NULL,NULL),(33,NULL,'Laporan Harian','laporanHarian','icon-archive',16,8,NULL,NULL),(34,NULL,'Surat Kontak',NULL,'icon-books',16,9,NULL,NULL),(35,34,'Perencanaan','perencanaan',NULL,16,10,NULL,NULL),(36,34,'Pengawas','pengawas',NULL,16,11,NULL,NULL),(37,34,'Pelaksana','pelaksana',NULL,16,12,NULL,NULL),(38,NULL,'Dokumen Gambar','dokumenGambar','icon-image-compare',16,13,NULL,NULL),(39,NULL,'Time shedule','timeShedule','icon-table2',16,6,NULL,NULL),(40,NULL,'Laporan Umum','laporanUmum','icon-bookmark',16,7,NULL,NULL),(41,NULL,'Laporan Progres','laporanProgres','icon-file-check2',16,5,NULL,NULL),(42,NULL,'Kerangka Acuan Kerja','kerangkaAcuanKerja','icon-color-sampler',16,14,NULL,NULL),(43,NULL,'Surat Surat',NULL,'icon-files-empty',16,15,NULL,NULL),(45,43,'Surat Ijin Pekerjaan','suratIjinPekerjaan',NULL,16,16,NULL,NULL),(46,43,'Surat Undangan Rapat','suratUndanganRapat',NULL,3,44,NULL,NULL),(47,43,'Surat Pemberitahuan','suratPemberitahuan',NULL,3,45,NULL,NULL),(48,NULL,'Memo Lapangan','memoLapangan','icon-file-eye2',16,20,NULL,NULL),(50,NULL,'Dashboard Pengawas','pengawasDashboard','icon-home',16,1,NULL,NULL),(51,NULL,'Data Presensi',NULL,'icon-notebook',16,2,NULL,NULL),(52,51,'List Data Presensi','presensi',NULL,16,3,NULL,NULL),(53,51,'Rekapan Data Presensi Pegawai','rekapPresensi',NULL,16,4,NULL,NULL);
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
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
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2020_01_09_133758_create_permission_tables',1),(5,'2021_02_27_143833_create_jabatans_table',1),(6,'2021_02_27_144019_create_divisis_table',1),(7,'2021_02_27_181740_create_pegawais_table',1),(8,'2021_02_28_021611_create_cutis_table',1),(9,'2021_02_28_021828_create_presensi_harians_table',1),(10,'2021_02_28_022252_create_riwayat_jabatans_table',1),(11,'2021_02_28_022637_create_riwayat_divisis_table',1),(12,'2021_03_15_232901_create_peraturans_table',1),(13,'2021_05_11_100655_create_menus_table',1),(14,'2021_05_17_115302_create_tunjangans_table',1),(15,'2021_05_17_115713_create_potongans_table',1),(16,'2021_05_18_070004_create_gajis_table',1),(17,'2021_05_25_055722_create_surat_peringatans_table',1),(18,'2021_05_29_094121_create_pegawai_potongans_table',1),(19,'2021_05_29_095550_create_pegawai_tunjangans_table',1),(20,'2021_06_03_050657_create_icons_table',1),(21,'2021_06_15_063430_create_perusahaans_table',1),(22,'2021_07_15_063302_create_penilaian_pegawais_table',1),(23,'2024_06_17_132425_create_laporan_harian_t_table',2),(24,'2024_06_30_125949_add_dashboard_pengawas_permission',3),(25,'2024_06_30_133547_create_master_dokumen_table',4),(26,'2024_06_30_141413_create_master_dokumen_table',5);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` VALUES (1,'App\\Models\\Pegawai',24060001),(2,'App\\Models\\Pegawai',24060002),(5,'App\\Models\\Pegawai',24060003);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
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
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pegawai`
--

DROP TABLE IF EXISTS `pegawai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pegawai` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_role` bigint unsigned DEFAULT NULL,
  `nik` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `jk` enum('Pria','Wanita') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `agama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tempat_lahir` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tgl_lahir` date NOT NULL,
  `alamat_ktp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat_dom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Menikah','Lajang') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `jml_anak` int NOT NULL,
  `no_hp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tgl_masuk` date NOT NULL,
  `id_atasan` bigint unsigned DEFAULT NULL,
  `id_jabatan` bigint unsigned DEFAULT NULL,
  `id_divisi` bigint unsigned DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pegawai_nik_unique` (`nik`),
  UNIQUE KEY `pegawai_email_unique` (`email`),
  KEY `pegawai_id_jabatan_index` (`id_jabatan`),
  KEY `pegawai_id_divisi_index` (`id_divisi`),
  KEY `pegawai_id_role_index` (`id_role`),
  KEY `pegawai_id_atasan_foreign` (`id_atasan`),
  CONSTRAINT `pegawai_id_atasan_foreign` FOREIGN KEY (`id_atasan`) REFERENCES `pegawai` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `pegawai_id_divisi_foreign` FOREIGN KEY (`id_divisi`) REFERENCES `divisi` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `pegawai_id_jabatan_foreign` FOREIGN KEY (`id_jabatan`) REFERENCES `jabatan` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `pegawai_id_role_foreign` FOREIGN KEY (`id_role`) REFERENCES `roles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24060004 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pegawai`
--

LOCK TABLES `pegawai` WRITE;
/*!40000 ALTER TABLE `pegawai` DISABLE KEYS */;
INSERT INTO `pegawai` VALUES (24060001,1,'3307800512068339','Bangbang Bimantoro','Pria','Islam','Lubuklinggau','2002-07-28','Ds. Bappenas No. 399','Jr. Ters. Buah Batu No. 238','Menikah',5,'0519 5509 859','admin@gmail.com','$2y$10$1t3oAJOTP/bIIUTuPgeQsO2WhGwGfYKTyD5zm43quC50.YOGbBU7O','1997-01-17',NULL,8,3,'foto.jpg',NULL,'2024-06-17 05:17:01','2024-06-17 05:17:01',NULL),(24060002,2,'6571334808151579','Bangbang Bimantoro','Pria','Islam','Singkawang','2011-01-10','Jln. Thamrin No. 471','Kpg. Taman No. 54','Menikah',2,'(+62) 437 8458 279','hrd@gmail.com','$2y$10$IA9WBPRaAojOIu.5Hlq89eqB.64irU4zoQT5U4Tu6PApA129TgVbm','1993-03-28',NULL,1,3,'foto.jpg',NULL,'2024-06-17 05:17:01','2024-06-17 05:17:01',NULL),(24060003,5,'3207886810135213','Hasan Arofid','Pria','Islam','Pagar Alam','1982-06-24','Gg. Dipatiukur No. 886','Jln. B.Agam Dlm No. 354','Menikah',4,'(+62) 383 6456 4419','pengawas@gmail.com','$2y$10$M.1C5c/aXNgg7QwdbrZsoeirDHGYfGs66B/DH7g9PS.j9Rv6tj9Y.','2019-01-31',NULL,5,3,'foto.jpg',NULL,'2024-06-17 05:17:02','2024-07-10 19:53:12',NULL);
/*!40000 ALTER TABLE `pegawai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pegawai_potongan`
--

DROP TABLE IF EXISTS `pegawai_potongan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pegawai_potongan` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `pegawai_id` bigint unsigned NOT NULL,
  `potongan_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pegawai_potongan_potongan_id_index` (`potongan_id`),
  KEY `pegawai_potongan_pegawai_id_index` (`pegawai_id`),
  CONSTRAINT `pegawai_potongan_pegawai_id_foreign` FOREIGN KEY (`pegawai_id`) REFERENCES `pegawai` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pegawai_potongan_potongan_id_foreign` FOREIGN KEY (`potongan_id`) REFERENCES `potongan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pegawai_potongan`
--

LOCK TABLES `pegawai_potongan` WRITE;
/*!40000 ALTER TABLE `pegawai_potongan` DISABLE KEYS */;
/*!40000 ALTER TABLE `pegawai_potongan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pegawai_tunjangan`
--

DROP TABLE IF EXISTS `pegawai_tunjangan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pegawai_tunjangan` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `pegawai_id` bigint unsigned NOT NULL,
  `tunjangan_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pegawai_tunjangan_tunjangan_id_index` (`tunjangan_id`),
  KEY `pegawai_tunjangan_pegawai_id_index` (`pegawai_id`),
  CONSTRAINT `pegawai_tunjangan_pegawai_id_foreign` FOREIGN KEY (`pegawai_id`) REFERENCES `pegawai` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pegawai_tunjangan_tunjangan_id_foreign` FOREIGN KEY (`tunjangan_id`) REFERENCES `tunjangan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pegawai_tunjangan`
--

LOCK TABLES `pegawai_tunjangan` WRITE;
/*!40000 ALTER TABLE `pegawai_tunjangan` DISABLE KEYS */;
/*!40000 ALTER TABLE `pegawai_tunjangan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `penilaian_pegawai`
--

DROP TABLE IF EXISTS `penilaian_pegawai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `penilaian_pegawai` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_pegawai` bigint unsigned NOT NULL,
  `tanggal` date NOT NULL,
  `responsible` int NOT NULL,
  `initiate` int NOT NULL,
  `teamwork` int NOT NULL,
  `discipline` int NOT NULL,
  `work_performance` int NOT NULL,
  `final_value` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `penilaian_pegawai_id_pegawai_index` (`id_pegawai`),
  CONSTRAINT `penilaian_pegawai_id_pegawai_foreign` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penilaian_pegawai`
--

LOCK TABLES `penilaian_pegawai` WRITE;
/*!40000 ALTER TABLE `penilaian_pegawai` DISABLE KEYS */;
/*!40000 ALTER TABLE `penilaian_pegawai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peraturan`
--

DROP TABLE IF EXISTS `peraturan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `peraturan` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `jam_masuk` time DEFAULT NULL,
  `jam_plg` time DEFAULT NULL,
  `jml_cuti_tahunan` int unsigned DEFAULT '12',
  `jml_cuti_besar` int unsigned DEFAULT '12',
  `jml_cuti_bersama` int unsigned DEFAULT '12',
  `jml_cuti_hamil` int unsigned DEFAULT '12',
  `jml_cuti_sakit` int unsigned DEFAULT '12',
  `jml_cuti_penting` int unsigned DEFAULT '12',
  `syarat_bulan_cuti_tahunan` int unsigned DEFAULT '0',
  `syarat_bulan_cuti_besar` int unsigned DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peraturan`
--

LOCK TABLES `peraturan` WRITE;
/*!40000 ALTER TABLE `peraturan` DISABLE KEYS */;
INSERT INTO `peraturan` VALUES (1,'08:30:00','16:30:00',12,30,12,45,99,15,12,60,NULL,NULL);
/*!40000 ALTER TABLE `peraturan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'dashboard-admin','web','2024-06-17 05:17:00','2024-06-17 05:17:00'),(2,'dashboard-hrd','web','2024-06-17 05:17:00','2024-06-17 05:17:00'),(3,'menu-staff','web','2024-06-17 05:17:00','2024-06-17 05:17:00'),(4,'manajemen-role','web','2024-06-17 05:17:00','2024-06-17 05:17:00'),(5,'menu-kebijakan-kantor','web','2024-06-17 05:17:01','2024-06-17 05:17:01'),(6,'menu-pegawai','web','2024-06-17 05:17:01','2024-06-17 05:17:01'),(7,'menu-jabatan','web','2024-06-17 05:17:01','2024-06-17 05:17:01'),(8,'menu-divisi','web','2024-06-17 05:17:01','2024-06-17 05:17:01'),(9,'menu-presensi','web','2024-06-17 05:17:01','2024-06-17 05:17:01'),(10,'menu-cuti','web','2024-06-17 05:17:01','2024-06-17 05:17:01'),(11,'menu-gaji','web','2024-06-17 05:17:01','2024-06-17 05:17:01'),(12,'menu-surat-peringatan','web','2024-06-17 05:17:01','2024-06-17 05:17:01'),(13,'menu-export-kinerja','web','2024-06-17 05:17:01','2024-06-17 05:17:01'),(14,'manajemen-perusahaan','web','2024-06-17 05:17:01','2024-06-17 05:17:01'),(16,'dashboard-pengawas','web','2024-06-30 06:00:37','2024-06-30 06:00:37');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perusahaan`
--

DROP TABLE IF EXISTS `perusahaan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `perusahaan` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `kota` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_telp` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_public` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `path_logo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_private` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `perusahaan_email_public_unique` (`email_public`),
  UNIQUE KEY `perusahaan_email_private_unique` (`email_private`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perusahaan`
--

LOCK TABLES `perusahaan` WRITE;
/*!40000 ALTER TABLE `perusahaan` DISABLE KEYS */;
INSERT INTO `perusahaan` VALUES (1,'PT. PRABU CIPTA TEHNIK','Jl. Otto Iskandar Dinata No. 392 Graha LDA lt.2 Suite 06 RT. 001 RW. 001 Kel. Nyengseret Kec. Astana Anyar KotanBandung 40242 Nomor Induk Berusaha ','Bandung','0220204122324','info@prabucipta.com','path/to/logo.png','admin@prabucipta.com','$2y$10$IS8P0I.LqhEAXVLYKVc4WeXOY.iNfsLfAHVbdGaqUn2KgllPGjC2i','2024-06-17 05:17:03','2024-06-17 05:17:03');
/*!40000 ALTER TABLE `perusahaan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `potongan`
--

DROP TABLE IF EXISTS `potongan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `potongan` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `jumlah` int NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `is_shown` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `potongan`
--

LOCK TABLES `potongan` WRITE;
/*!40000 ALTER TABLE `potongan` DISABLE KEYS */;
INSERT INTO `potongan` VALUES (1,'Potongan Keterlambatan (per Hari)',50000,1,0,NULL,NULL),(2,'Potongan Membolos Kerja (per Hari)',150000,1,0,NULL,NULL),(3,'Potongan BPJS Kesehatan',0,1,0,NULL,NULL),(4,'Potongan BPJS Ketenagakerjaan',0,1,0,NULL,NULL),(5,'Potongan PPH 21',0,1,0,NULL,NULL);
/*!40000 ALTER TABLE `potongan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `presensi_harian`
--

DROP TABLE IF EXISTS `presensi_harian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `presensi_harian` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_pegawai` bigint unsigned NOT NULL,
  `tanggal` date NOT NULL,
  `ket` enum('Hadir','Cuti','Alpha') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `jam_dtg` time DEFAULT NULL,
  `jam_plg` time DEFAULT NULL,
  `is_wfh` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `presensi_harian_id_pegawai_index` (`id_pegawai`),
  CONSTRAINT `presensi_harian_id_pegawai_foreign` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `presensi_harian`
--

LOCK TABLES `presensi_harian` WRITE;
/*!40000 ALTER TABLE `presensi_harian` DISABLE KEYS */;
INSERT INTO `presensi_harian` VALUES (1,24060003,'2024-07-10','Hadir','08:00:00','15:00:00',0,'2024-07-09 18:46:00','2024-07-09 18:46:00');
/*!40000 ALTER TABLE `presensi_harian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `riwayat_divisi`
--

DROP TABLE IF EXISTS `riwayat_divisi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `riwayat_divisi` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_pegawai` bigint unsigned NOT NULL,
  `id_divisi` bigint unsigned NOT NULL,
  `tgl_mulai` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `riwayat_divisi_id_pegawai_index` (`id_pegawai`),
  KEY `riwayat_divisi_id_divisi_index` (`id_divisi`),
  CONSTRAINT `riwayat_divisi_id_divisi_foreign` FOREIGN KEY (`id_divisi`) REFERENCES `divisi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `riwayat_divisi_id_pegawai_foreign` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `riwayat_divisi`
--

LOCK TABLES `riwayat_divisi` WRITE;
/*!40000 ALTER TABLE `riwayat_divisi` DISABLE KEYS */;
INSERT INTO `riwayat_divisi` VALUES (1,24060003,3,'2024-07-11','2024-07-10 19:53:12','2024-07-10 19:53:12');
/*!40000 ALTER TABLE `riwayat_divisi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `riwayat_jabatan`
--

DROP TABLE IF EXISTS `riwayat_jabatan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `riwayat_jabatan` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_pegawai` bigint unsigned NOT NULL,
  `id_jabatan` bigint unsigned NOT NULL,
  `tgl_mulai` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `riwayat_jabatan_id_pegawai_index` (`id_pegawai`),
  KEY `riwayat_jabatan_id_jabatan_index` (`id_jabatan`),
  CONSTRAINT `riwayat_jabatan_id_jabatan_foreign` FOREIGN KEY (`id_jabatan`) REFERENCES `jabatan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `riwayat_jabatan_id_pegawai_foreign` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `riwayat_jabatan`
--

LOCK TABLES `riwayat_jabatan` WRITE;
/*!40000 ALTER TABLE `riwayat_jabatan` DISABLE KEYS */;
INSERT INTO `riwayat_jabatan` VALUES (1,24060003,5,'2024-07-11','2024-07-10 19:53:12','2024-07-10 19:53:12');
/*!40000 ALTER TABLE `riwayat_jabatan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
INSERT INTO `role_has_permissions` VALUES (1,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(2,2),(3,2),(6,2),(9,2),(10,2),(11,2),(12,2),(13,2),(3,3),(16,5);
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ADMIN','web','2024-06-17 05:17:01','2024-06-17 05:17:01'),(2,'HRD','web','2024-06-17 05:17:01','2024-06-17 05:17:01'),(3,'STAFF','web','2024-06-17 05:17:01','2024-06-17 05:17:01'),(5,'PENGAWAS','web','2024-07-10 19:46:42','2024-07-10 19:46:42');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surat_peringatan`
--

DROP TABLE IF EXISTS `surat_peringatan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `surat_peringatan` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_pegawai` bigint unsigned NOT NULL,
  `tanggal` date NOT NULL,
  `tingkat` enum('I','II','III') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pelanggaran` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `surat_peringatan_id_pegawai_index` (`id_pegawai`),
  CONSTRAINT `surat_peringatan_id_pegawai_foreign` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surat_peringatan`
--

LOCK TABLES `surat_peringatan` WRITE;
/*!40000 ALTER TABLE `surat_peringatan` DISABLE KEYS */;
INSERT INTO `surat_peringatan` VALUES (1,24060001,'2024-06-30','I','[\"sd\"]','2024-06-30 07:25:44','2024-06-30 07:25:44');
/*!40000 ALTER TABLE `surat_peringatan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tunjangan`
--

DROP TABLE IF EXISTS `tunjangan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tunjangan` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `jumlah` int NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `is_shown` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tunjangan`
--

LOCK TABLES `tunjangan` WRITE;
/*!40000 ALTER TABLE `tunjangan` DISABLE KEYS */;
INSERT INTO `tunjangan` VALUES (1,'Tunjangan Makan',200000,1,1,NULL,NULL),(2,'Tunjangan Anak (Per Anak)',2,1,0,NULL,NULL),(3,'Tunjangan Keluarga',10,1,0,NULL,NULL),(4,'Tunjangan Kinerja',300000,1,0,NULL,NULL);
/*!40000 ALTER TABLE `tunjangan` ENABLE KEYS */;
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
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'db_pengawasan3'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-11 13:35:41
