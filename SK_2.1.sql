-- MariaDB dump 10.17  Distrib 10.4.15-MariaDB, for Linux (x86_64)
--
-- Host: mysql.hostinger.ro    Database: u574849695_20
-- ------------------------------------------------------
-- Server version	10.4.15-MariaDB-cll-lve

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `gym`
--
/* Моя база данных - схема работы спортивного клуба */


DROP TABLE IF EXISTS `gym`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gym` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title_gym` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT ' ',
  `id_respons_per` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pers_user_id` (`id_respons_per`),
  CONSTRAINT `pers_user_id` FOREIGN KEY (`id_respons_per`) REFERENCES `personal` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gym`
--

LOCK TABLES `gym` WRITE;
/*!40000 ALTER TABLE `gym` DISABLE KEYS */;
INSERT INTO `gym` VALUES (1,'Quibusdam modi laborum natus similique enim.',1),(2,'Mollitia voluptas ut autem doloribus eveniet.',2),(3,'Vel doloribus sunt ex ratione quas doloremque voluptates.',3),(4,'Sed illo animi quae.',4),(5,'Nisi ullam ratione inventore officia et facilis eos.',5);
/*!40000 ALTER TABLE `gym` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `part_in_competitions`
--

DROP TABLE IF EXISTS `part_in_competitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `part_in_competitions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `member_user_one_id` bigint(20) unsigned NOT NULL,
  `member_user_two_id` bigint(20) unsigned NOT NULL,
  `member_user_three_id` bigint(20) unsigned NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT ' ',
  `date_of_competitions` date DEFAULT NULL,
  `id_personal` bigint(20) unsigned DEFAULT NULL,
  `id_gym` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_gym` (`id_gym`),
  KEY `id_personal` (`id_personal`),
  KEY `member_user_one_id` (`member_user_one_id`),
  KEY `member_user_two_id` (`member_user_two_id`),
  KEY `member_user_three_id` (`member_user_three_id`),
  CONSTRAINT `part_in_competitions_ibfk_1` FOREIGN KEY (`id_gym`) REFERENCES `gym` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `part_in_competitions_ibfk_2` FOREIGN KEY (`id_personal`) REFERENCES `personal` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `part_in_competitions_ibfk_3` FOREIGN KEY (`member_user_one_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `part_in_competitions_ibfk_4` FOREIGN KEY (`member_user_two_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `part_in_competitions_ibfk_5` FOREIGN KEY (`member_user_three_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part_in_competitions`
--

LOCK TABLES `part_in_competitions` WRITE;
/*!40000 ALTER TABLE `part_in_competitions` DISABLE KEYS */;
INSERT INTO `part_in_competitions` VALUES (1,1,1,1,'Saepe illum sapiente voluptates vero ut.','1992-02-24',1,1),(2,2,2,2,'Consequatur eaque quis sit assumenda reprehenderit et.','2008-05-29',2,2),(3,3,3,3,'Odio corporis qui et cupiditate.','1985-03-19',3,3),(4,4,4,4,'Quia quo odio quia qui qui qui quidem voluptas.','1976-12-12',4,4),(5,5,5,5,'Rerum quas sit molestiae deserunt ut sit est doloremque.','2012-06-07',5,5),(6,6,6,6,'Sequi minima quidem natus vero.','2018-11-03',6,1),(7,7,7,7,'Ut molestias commodi eaque ratione.','1992-01-28',7,2),(8,8,8,8,'Quibusdam aut atque ipsum totam esse cum totam.','2013-12-29',8,3),(9,9,9,9,'Beatae assumenda vitae quam est omnis numquam eaque porro.','1973-03-25',9,4),(10,10,10,10,'Qui voluptas modi rem eum.','1991-05-26',10,5);
/*!40000 ALTER TABLE `part_in_competitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal`
--

DROP TABLE IF EXISTS `personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal` (
  `user_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `education` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT ' ',
  `sporting_merit` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT ' ',
  `date_of_begin_work` date DEFAULT NULL,
  `salary` float NOT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `sk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal`
--

LOCK TABLES `personal` WRITE;
/*!40000 ALTER TABLE `personal` DISABLE KEYS */;
INSERT INTO `personal` VALUES (1,' secondary',' ','1979-06-19',119642),(2,' secondary special',' ','1978-11-13',60419.2),(3,' secondary special',' ','1994-04-12',107560),(4,' secondary',' ','1976-11-20',99655.9),(5,'higher',' ','2012-12-28',138820),(6,' secondary special',' ','2018-11-18',130874),(7,' secondary',' ','2011-04-10',106531),(8,' secondary',' ','2013-06-07',22118.4),(9,'higher',' ','2018-02-16',66162.9),(10,' secondary',' ','2005-08-08',137853),(11,'higher',' ','1985-12-06',103349),(12,'higher',' ','1977-03-26',65984.6),(13,'higher',' ','1997-07-14',111756),(14,' secondary',' ','1973-01-01',48840),(15,'higher',' ','1994-09-17',126189);
/*!40000 ALTER TABLE `personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title_servic` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT ' ',
  `id_gym` bigint(20) unsigned DEFAULT NULL,
  `id_personal` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_gym` (`id_gym`),
  KEY `id_personal` (`id_personal`),
  CONSTRAINT `services_ibfk_1` FOREIGN KEY (`id_gym`) REFERENCES `gym` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `services_ibfk_2` FOREIGN KEY (`id_personal`) REFERENCES `personal` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'Debitis voluptatum laborum enim dolores quae ratione laborum.',1,1),(2,'At enim voluptatum placeat vero quae corporis qui.',2,2),(3,'Sit accusamus perspiciatis et officiis.',3,3),(4,'Voluptas atque veritatis error dolorum.',4,4),(5,'Modi et ea tenetur mollitia.',5,5),(6,'Repellendus nemo commodi a perspiciatis et ex.',1,6),(7,'Sed necessitatibus explicabo expedita repellat.',2,7),(8,'Cumque repellendus et maxime totam pariatur ab maxime.',3,8),(9,'Quidem odit officia ullam sint nostrum ipsa ullam.',4,9),(10,'Illo aliquid laudantium ut ad quia repellendus aspernatur.',5,10);
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sport_section`
--

DROP TABLE IF EXISTS `sport_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sport_section` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title_sport_section` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT ' ',
  `price` float NOT NULL,
  `id_gym` bigint(20) unsigned DEFAULT NULL,
  `id_personal` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_gym` (`id_gym`),
  KEY `id_personal` (`id_personal`),
  CONSTRAINT `sport_section_ibfk_1` FOREIGN KEY (`id_gym`) REFERENCES `gym` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sport_section_ibfk_2` FOREIGN KEY (`id_personal`) REFERENCES `personal` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sport_section`
--

LOCK TABLES `sport_section` WRITE;
/*!40000 ALTER TABLE `sport_section` DISABLE KEYS */;
INSERT INTO `sport_section` VALUES (1,'Quas quaerat illo veritatis animi.',4104,1,1),(2,'Ea molestiae iusto ut recusandae sapiente aliquam rerum.',8123960,2,2),(3,'Cum nisi quod commodi illum est praesentium.',3474860,3,3),(4,'Delectus praesentium non velit non repellat.',12.7556,4,4),(5,'Et consequatur voluptates illo voluptates dignissimos corporis vitae.',3395380,5,5),(6,'Id nisi reprehenderit ea ex.',34760.8,1,6),(7,'Sint qui maiores laudantium aut minus quos et.',1.48241,2,7),(8,'Rerum in aut iste quae.',0,3,8),(9,'Non nihil modi quibusdam perferendis nihil qui.',66227600,4,9),(10,'A voluptatem vitae placeat deleniti mollitia ut est.',8.46,5,10),(11,'Ipsum iure non repellat dolorem reprehenderit rerum esse.',585.2,1,11),(12,'Non eius rem nesciunt iste rerum laudantium velit.',16626300,2,12),(13,'Quis et nostrum eum.',8.19274,3,13),(14,'Magni vel et optio voluptatem libero et porro.',22.248,4,14),(15,'Et natus modi necessitatibus.',1792.66,5,15),(16,'Soluta nihil voluptatem nisi consectetur aut aliquam.',1880.39,1,1),(17,'Minima nihil nisi facere accusamus aspernatur.',0,2,2),(18,'Aut maxime ex totam.',7544.78,3,3),(19,'Expedita atque facere eaque.',526381,4,4),(20,'Fugit et recusandae illo ab.',99172900,5,5);
/*!40000 ALTER TABLE `sport_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sport_shop`
--

DROP TABLE IF EXISTS `sport_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sport_shop` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sport_product` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT ' ',
  `price` float NOT NULL,
  `id_personal` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_personal` (`id_personal`),
  CONSTRAINT `sport_shop_ibfk_1` FOREIGN KEY (`id_personal`) REFERENCES `personal` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sport_shop`
--

LOCK TABLES `sport_shop` WRITE;
/*!40000 ALTER TABLE `sport_shop` DISABLE KEYS */;
INSERT INTO `sport_shop` VALUES (1,' ',0.25017,1),(2,' ',38269.9,2),(3,' ',29624.8,3),(4,' ',25941300,4),(5,' ',2.54855,5),(6,' ',2930.21,6),(7,' ',9699500,7),(8,' ',50790100,8),(9,' ',323351,9),(10,' ',4788.47,10),(11,' ',229515000,11),(12,' ',1407.6,12),(13,' ',272731,13),(14,' ',0,14),(15,' ',2.669,15),(16,' ',10.1,1),(17,' ',424.608,2),(18,' ',21507,3),(19,' ',7424090,4),(20,' ',542.24,5),(21,' ',112180,6),(22,' ',14.8463,7),(23,' ',406185000,8),(24,' ',86.07,9),(25,' ',62514.3,10),(26,' ',23612900,11),(27,' ',58565900,12),(28,' ',16.0497,13),(29,' ',4184030,14),(30,' ',242114000,15),(31,' ',56684500,1),(32,' ',55317.4,2),(33,' ',18,3),(34,' ',1085,4),(35,' ',774,5),(36,' ',185375,6),(37,' ',0,7),(38,' ',133599000,8),(39,' ',290989000,9),(40,' ',850.752,10),(41,' ',39.0286,11),(42,' ',24.5,12),(43,' ',0,13),(44,' ',0,14),(45,' ',26404300,15),(46,' ',0,1),(47,' ',71.2883,2),(48,' ',728616,3),(49,' ',478677000,4),(50,' ',227074,5),(51,' ',92.3973,6),(52,' ',130,7),(53,' ',307.21,8),(54,' ',2443880,9),(55,' ',18457900,10),(56,' ',32070400,11),(57,' ',0,12),(58,' ',5.1,13),(59,' ',0,14),(60,' ',0,15),(61,' ',288.65,1),(62,' ',0,2),(63,' ',59706100,3),(64,' ',9.8,4),(65,' ',4440.72,5),(66,' ',42330.2,6),(67,' ',14451500,7),(68,' ',366355,8),(69,' ',186013,9),(70,' ',695.014,10),(71,' ',388.528,11),(72,' ',826664,12),(73,' ',37703100,13),(74,' ',5797990,14),(75,' ',127984,15),(76,' ',109266,1),(77,' ',203.633,2),(78,' ',69244.9,3),(79,' ',193786,4),(80,' ',23373.6,5),(81,' ',8308620,6),(82,' ',160294000,7),(83,' ',549607,8),(84,' ',1099,9),(85,' ',12970600,10),(86,' ',4231.01,11),(87,' ',350895,12),(88,' ',195166,13),(89,' ',0,14),(90,' ',0,15),(91,' ',347903000,1),(92,' ',122731,2),(93,' ',235407,3),(94,' ',373,4),(95,' ',0.549058,5),(96,' ',482.12,6),(97,' ',22553.3,7),(98,' ',670.612,8),(99,' ',48294900,9),(100,' ',3.7368,10);
/*!40000 ALTER TABLE `sport_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sports_equipment`
--

DROP TABLE IF EXISTS `sports_equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sports_equipment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT ' ',
  `amount` int(11) NOT NULL,
  `id_gym` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_gym` (`id_gym`),
  CONSTRAINT `sports_equipment_ibfk_1` FOREIGN KEY (`id_gym`) REFERENCES `gym` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sports_equipment`
--

LOCK TABLES `sports_equipment` WRITE;
/*!40000 ALTER TABLE `sports_equipment` DISABLE KEYS */;
INSERT INTO `sports_equipment` VALUES (1,'Inventore beatae sint esse.',8,1),(2,'Rerum est quam cum vel sunt ea.',10,2),(3,'Minima aut velit dignissimos expedita.',1,3),(4,'Exercitationem facilis quo nobis atque veritatis iure laboriosam.',9,4),(5,'Aspernatur quo non autem qui similique iure doloremque.',3,5),(6,'Porro placeat sint architecto unde voluptatem nihil expedita et.',7,1),(7,'Sint ut similique excepturi ut facere.',5,2),(8,'Quas aut voluptatem ad reiciendis.',9,3),(9,'Illo excepturi rem rem sed ducimus.',6,4),(10,'Omnis eveniet est temporibus quo.',5,5),(11,'Et qui omnis temporibus repellendus.',3,1),(12,'Hic iure et tempora quasi id consequuntur.',8,2),(13,'Commodi tempore qui assumenda assumenda aperiam est.',4,3),(14,'Non quas rerum necessitatibus est dolorum.',6,4),(15,'Consequatur esse est animi.',1,5),(16,'Harum veniam perferendis doloremque.',7,1),(17,'Eveniet rem dignissimos et atque temporibus.',8,2),(18,'Dicta voluptas repellendus ullam porro facere iure.',5,3),(19,'Quisquam aut sint aliquid nobis quisquam eius qui non.',7,4),(20,'Temporibus et placeat explicabo culpa.',4,5),(21,'Voluptates aliquam ipsam officiis.',6,1),(22,'Sed suscipit omnis accusantium autem laudantium odio omnis.',7,2),(23,'Reiciendis odio officia sed nisi debitis.',9,3),(24,'Dolorem voluptas sequi non maxime sint qui sapiente.',4,4),(25,'Corporis soluta consequuntur consequatur qui sit.',8,5),(26,'Eaque consectetur quo ipsa autem possimus consequuntur.',7,1),(27,'Nulla vitae est accusantium.',5,2),(28,'Fuga illo quis sint deleniti culpa autem.',3,3),(29,'Facilis dolor nihil molestiae repudiandae rerum ducimus.',6,4),(30,'Iure id incidunt accusantium eos at corrupti ut.',1,5),(31,'Similique asperiores perferendis iusto molestiae est ducimus voluptates.',0,1),(32,'Ratione itaque nesciunt sint saepe voluptates.',2,2),(33,'Occaecati placeat repellat eum autem.',1,3),(34,'Ipsa provident voluptatem a aut beatae.',3,4),(35,'Quo fugiat error ducimus eaque ipsum.',2,5),(36,'Quia soluta sed facere ipsum ut praesentium qui.',5,1),(37,'Similique in illo aperiam neque sunt nulla quia aut.',2,2),(38,'Ut non temporibus labore delectus.',2,3),(39,'Perspiciatis praesentium tempora rerum quia qui assumenda.',5,4),(40,'Et aliquid ad doloremque officiis minima dolores sed laborum.',6,5),(41,'Recusandae nihil similique quisquam totam ducimus non harum et.',7,1),(42,'Harum id facere sunt atque dolor.',1,2),(43,'Id quia placeat nisi aliquid.',4,3),(44,'Dolorem vel maiores natus.',9,4),(45,'Laboriosam ipsa quo facere alias.',10,5),(46,'Est dolor assumenda dignissimos quas excepturi.',10,1),(47,'Totam totam nam dignissimos error at libero.',4,2),(48,'Cupiditate velit est quos dolores eos.',0,3),(49,'Nam vel atque consectetur suscipit quibusdam quo.',7,4),(50,'Aut nam est accusamus et.',9,5),(51,'Nemo voluptatem fugiat est voluptates nemo.',4,1),(52,'Neque et amet odio rerum.',10,2),(53,'Eos at omnis voluptas reiciendis in consectetur.',7,3),(54,'Ut molestiae voluptate qui vitae rem.',8,4),(55,'Qui voluptatem iure quas quia corporis occaecati.',3,5),(56,'Nobis mollitia aut distinctio minus ea doloribus sunt.',8,1),(57,'Voluptatem impedit dicta et iusto.',8,2),(58,'Ad aspernatur iusto saepe voluptatem enim.',6,3),(59,'Quia beatae aut nihil dolorum.',2,4),(60,'Dolor ratione cupiditate quo ut quo eius quibusdam et.',4,5),(61,'Sequi et ea ut sunt quibusdam possimus.',10,1),(62,'Ab distinctio praesentium inventore eos provident voluptatum ut.',7,2),(63,'Quia repellat consectetur qui.',3,3),(64,'Consequatur tempora ut aperiam qui nemo aut et.',9,4),(65,'Ut voluptatem doloribus non nam voluptate facere vel voluptate.',8,5),(66,'Aut earum quam alias incidunt dolorum.',4,1),(67,'Animi fuga quaerat corporis facere.',7,2),(68,'Voluptas unde vel nulla facilis quas reprehenderit eaque.',10,3),(69,'Magni quos ut ipsa natus qui qui.',7,4),(70,'Quod perferendis quasi ratione.',3,5),(71,'Facilis quis harum inventore aut consectetur commodi corrupti.',6,1),(72,'Quis molestias quibusdam doloremque incidunt.',6,2),(73,'Quis ut perspiciatis quod iste quibusdam cupiditate nobis ut.',0,3),(74,'Expedita dolor temporibus odit modi quia velit sunt.',8,4),(75,'Eius officiis quaerat architecto qui.',5,5),(76,'Et accusantium magnam excepturi ut.',10,1),(77,'Beatae placeat exercitationem perspiciatis eos vero.',9,2),(78,'Odit consectetur velit distinctio.',2,3),(79,'Ut temporibus facere rerum quo similique est.',4,4),(80,'Ut non et omnis sed excepturi qui perspiciatis.',2,5),(81,'Molestiae beatae sed velit odit molestiae debitis officia et.',6,1),(82,'Ex quia dolor et qui nam voluptatem tempore.',9,2),(83,'Non qui ea illum aliquam aspernatur fugit.',4,3),(84,'Perspiciatis est et praesentium qui pariatur reiciendis.',0,4),(85,'Sit qui ea ut culpa eligendi hic ducimus.',1,5),(86,'Exercitationem exercitationem ut omnis in non ad assumenda qui.',2,1),(87,'Quibusdam porro maxime error sed minima qui ipsum error.',6,2),(88,'Harum mollitia mollitia optio soluta tempore corporis earum.',1,3),(89,'Libero fuga temporibus quam adipisci ipsam itaque alias molestiae.',4,4),(90,'Quo qui quod nostrum magnam reiciendis dignissimos debitis.',2,5),(91,'Error provident soluta quae enim doloremque.',2,1),(92,'Et nihil voluptas voluptatum non.',5,2),(93,'Sed repudiandae aut necessitatibus quo totam provident quo necessitatibus.',3,3),(94,'Qui perspiciatis suscipit iure tempore sunt asperiores officiis.',9,4),(95,'Odio eligendi dolore sunt est aut.',1,5),(96,'Reiciendis et at eum et voluptas eos vero.',8,1),(97,'Totam consequatur laudantium reprehenderit.',7,2),(98,'Quia non libero quod quia ullam quia in.',4,3),(99,'Ex consequatur rerum natus repudiandae.',4,4),(100,'Enim ex vero velit quaerat ipsum in eaque qui.',2,5),(101,'Ut nobis tempora id omnis dicta autem atque.',7,1),(102,'Quae dolorum enim dolor consequatur sint recusandae et.',0,2),(103,'Ut laborum voluptas a fugit molestias et.',5,3),(104,'Quaerat laboriosam doloribus velit eaque et sint.',7,4),(105,'Impedit quibusdam voluptate ipsum sequi omnis.',8,5),(106,'Iusto nobis rem quis ullam dolorum enim enim non.',3,1),(107,'Sapiente sequi fugit harum.',10,2),(108,'Ex aperiam atque qui vitae.',3,3),(109,'Ducimus rem odio est deleniti.',0,4),(110,'Totam atque voluptatum velit consequatur quod.',2,5),(111,'Et delectus rem qui quis officiis voluptatem molestiae.',7,1),(112,'Excepturi culpa ea et.',9,2),(113,'Provident velit molestias minus sint temporibus qui aut aut.',2,3),(114,'Repellendus pariatur consequuntur voluptate eum ea temporibus et voluptatibus.',3,4),(115,'Ut aliquam totam aperiam quas beatae amet.',9,5),(116,'Totam deleniti sit repellat.',10,1),(117,'Ex numquam nulla doloribus illo officiis autem est nihil.',8,2),(118,'Repellendus dolorem voluptatem consectetur eius autem reiciendis.',8,3),(119,'Minus enim ut molestiae.',5,4),(120,'Qui officia odio omnis qui.',1,5),(121,'Autem rerum saepe nisi qui.',3,1),(122,'Eligendi iste eius rerum molestiae quod.',7,2),(123,'Quisquam neque nesciunt laborum eum facere eum et.',5,3),(124,'Aut quia culpa non alias cupiditate.',4,4),(125,'Necessitatibus reprehenderit ipsam beatae sit velit labore et qui.',8,5),(126,'Ut temporibus voluptate sunt necessitatibus eos.',1,1),(127,'Ad vel ut dolores molestiae neque.',0,2),(128,'Officiis dolor sunt et minus.',7,3),(129,'Sint sed quia fuga eligendi est laborum inventore.',9,4),(130,'Aperiam laudantium maiores iste aut ex.',6,5),(131,'Temporibus velit veniam dicta aliquam.',9,1),(132,'Earum quis ut non est et assumenda facere.',8,2),(133,'Eligendi vero consequuntur recusandae mollitia.',3,3),(134,'Sunt officia in eius rerum quidem saepe sunt.',0,4),(135,'Nihil odio hic quis ducimus.',6,5),(136,'Porro odit id qui aut ut architecto.',9,1),(137,'Necessitatibus tempore enim nisi minima eveniet qui.',9,2),(138,'Corrupti iste odit maiores ipsa dolor velit.',6,3),(139,'Voluptates veniam consequatur id voluptatem quis rerum nam.',7,4),(140,'Ipsum asperiores officiis doloribus quo explicabo consequatur.',1,5),(141,'Quod dignissimos rerum impedit qui sed eligendi rerum.',7,1),(142,'In reiciendis adipisci voluptas quam corporis itaque.',4,2),(143,'Omnis qui excepturi voluptas ea sint voluptatem.',7,3),(144,'Sint impedit libero sed et et ipsam minus in.',4,4),(145,'Culpa rerum occaecati sit dolorem voluptatibus.',0,5),(146,'Necessitatibus assumenda amet iste id sapiente cumque.',9,1),(147,'Iusto eaque porro similique.',5,2),(148,'Possimus sequi vel nostrum eveniet rerum provident.',2,3),(149,'Et optio sed rerum quis.',5,4),(150,'Et sit nesciunt ut commodi perferendis sunt.',0,5),(151,'Ipsum optio est quisquam illum.',6,1),(152,'Harum voluptatibus sunt non.',5,2),(153,'Et quam odit dolorem quos optio dolores eum.',6,3),(154,'Odio harum quia saepe fuga voluptate ea.',5,4),(155,'Ut aut ea consequatur magnam quia et.',7,5),(156,'Qui laborum sapiente rerum labore.',5,1),(157,'Aliquam laboriosam aut nihil quidem nostrum corporis.',4,2),(158,'Nisi molestiae odit cumque reiciendis et eaque repellendus nisi.',5,3),(159,'Nihil a dignissimos totam reprehenderit omnis est omnis.',2,4),(160,'Sapiente est laborum quos velit culpa.',0,5),(161,'Deleniti nihil quas non velit.',6,1),(162,'Aliquid ducimus ut soluta sint voluptate ut corrupti.',5,2),(163,'Ut aut repellat et libero.',3,3),(164,'Et voluptatem impedit quia ad et a.',3,4),(165,'Nobis temporibus dignissimos sint magni dolorum dolores.',10,5),(166,'Necessitatibus eos fugiat nihil perspiciatis et.',7,1),(167,'Mollitia assumenda voluptas est aliquam.',1,2),(168,'Enim aut accusantium facere cumque a quis qui.',2,3),(169,'Autem earum dolor quam id.',5,4),(170,'Sunt rerum assumenda nostrum iusto.',5,5),(171,'Pariatur quia ratione laudantium.',1,1),(172,'Quia iusto nostrum nesciunt unde omnis sunt qui.',2,2),(173,'Et voluptatem est debitis assumenda suscipit sint autem.',9,3),(174,'Porro aut et sit distinctio adipisci.',4,4),(175,'Similique sint debitis non quidem vel voluptas quo.',7,5),(176,'Officiis dolorem iste qui dolore aut.',0,1),(177,'Inventore praesentium quis voluptatem autem ipsum nihil rerum.',3,2),(178,'Omnis eos molestias non.',6,3),(179,'Qui non error quisquam aut ut dolorem ipsa.',7,4),(180,'Odio maiores ea eos labore perspiciatis aliquid.',2,5),(181,'Ad in libero veritatis consequatur.',6,1),(182,'Error vitae ut dicta.',3,2),(183,'Distinctio consectetur aut aperiam hic et ea.',10,3),(184,'Vitae et velit veritatis deleniti provident sed.',5,4),(185,'Voluptatem ea harum est quia earum.',4,5),(186,'Labore dignissimos error doloremque.',6,1),(187,'Dolorum repudiandae sequi eum.',3,2),(188,'Et explicabo unde nesciunt temporibus nemo totam rem.',7,3),(189,'Rerum sed omnis eligendi optio.',2,4),(190,'Qui laborum et voluptatem nesciunt quas qui id sit.',4,5),(191,'Quasi consequatur ut et voluptates porro cumque similique.',8,1),(192,'Unde enim facilis nostrum quia nihil.',0,2),(193,'Aspernatur maiores cumque suscipit eveniet ad aut.',6,3),(194,'Nihil nisi optio tempore tenetur eius et.',8,4),(195,'Et maiores in dolore maiores quia.',9,5),(196,'Praesentium maiores doloremque sunt totam sapiente quas delectus et.',3,1),(197,'Rem repellat accusantium quos voluptatum et.',5,2),(198,'Accusamus sequi perspiciatis architecto sunt maiores.',3,3),(199,'Distinctio sunt fugit voluptatem deserunt autem molestiae dignissimos consequatur.',4,4),(200,'Aperiam nisi ratione totam.',3,5),(201,'Ut quo est voluptatibus illum.',5,1),(202,'Ad placeat debitis aut.',5,2),(203,'Corporis qui deserunt autem voluptatem ratione.',9,3),(204,'Eius eos est et facere.',2,4),(205,'Consectetur qui non sunt.',3,5),(206,'Dolore repellat neque nesciunt nam aperiam.',7,1),(207,'Amet similique et saepe.',5,2),(208,'Explicabo qui nihil sed quia nihil et.',5,3),(209,'Et est autem aut eum.',8,4),(210,'Cupiditate nulla consequuntur dolore a inventore nihil facilis.',7,5),(211,'Maxime facere nisi iusto hic sunt expedita.',8,1),(212,'Odio voluptate illum id dicta autem tenetur enim.',4,2),(213,'Quo in fugiat repellendus qui asperiores.',8,3),(214,'Expedita est soluta voluptates molestias.',4,4),(215,'Inventore sint harum dicta odio.',6,5),(216,'Sit voluptate assumenda inventore veritatis illum.',2,1),(217,'Quo qui quaerat temporibus hic ut est dolorum.',2,2),(218,'Repudiandae nulla sit reiciendis natus.',3,3),(219,'Dolorum temporibus non quos aut.',9,4),(220,'Accusantium non in assumenda sed illo quidem aliquam.',5,5),(221,'Qui eos sed voluptas saepe eos fugit.',10,1),(222,'Ea reprehenderit accusamus nostrum velit ducimus.',9,2),(223,'Ducimus consequatur dolor assumenda dolores et nulla libero.',4,3),(224,'Consequatur quae sit nostrum aut ad et molestias aspernatur.',10,4),(225,'Vitae aspernatur omnis quo sit eum.',7,5),(226,'Nam ex cum possimus aut.',10,1),(227,'Voluptas perspiciatis est temporibus et aperiam at dicta.',4,2),(228,'Dolorem autem dolorem architecto nihil quia molestiae rerum.',5,3),(229,'Placeat et qui officia accusantium et sit.',3,4),(230,'Ad nostrum iste consequuntur esse commodi non.',4,5),(231,'Nisi qui et harum voluptate aspernatur earum ipsam.',7,1),(232,'Id dolor beatae quis.',9,2),(233,'Quo nam necessitatibus et itaque.',0,3),(234,'Dolor atque ipsam tenetur perferendis.',5,4),(235,'Exercitationem in accusantium harum odio ea.',1,5),(236,'Velit nihil aut rerum facere recusandae aut harum.',5,1),(237,'Sint aut iusto omnis perferendis.',1,2),(238,'A dolorem accusamus consequuntur error quidem expedita et error.',2,3),(239,'Et dolore quibusdam veritatis perferendis.',8,4),(240,'Placeat et doloribus exercitationem magni.',7,5),(241,'Suscipit quia facere et cumque.',4,1),(242,'Aut nobis quia voluptate aut rem sequi molestias.',3,2),(243,'Perspiciatis soluta enim sunt neque.',6,3),(244,'Unde sed numquam corrupti quia ut doloremque recusandae.',1,4),(245,'Autem doloribus quia iste hic.',9,5),(246,'Hic praesentium maiores architecto quibusdam unde.',3,1),(247,'Odit rerum eos velit aspernatur rerum sit voluptas fugit.',8,2),(248,'Sit ea iusto aut provident beatae repellat quia.',7,3),(249,'Ut quam laudantium in et rerum voluptates.',9,4),(250,'Minus quas rerum id esse expedita laborum ullam.',5,5),(251,'Fugit voluptas reiciendis numquam itaque nulla qui accusantium.',9,1),(252,'Deleniti porro voluptatum excepturi consequatur.',3,2),(253,'Corrupti commodi aliquid ut animi.',1,3),(254,'Omnis ut neque sed perferendis nisi repellendus.',8,4),(255,'Rerum qui eius asperiores inventore placeat quam.',1,5),(256,'Ut recusandae placeat iste asperiores numquam est.',9,1),(257,'Ea natus eius similique voluptatibus error corrupti voluptas aperiam.',10,2),(258,'Ut eum nemo ipsam atque distinctio ea perferendis.',10,3),(259,'Praesentium quasi molestiae voluptatem omnis.',9,4),(260,'Earum et deleniti non minus est ut accusantium.',1,5),(261,'Illo incidunt voluptate eligendi blanditiis quia ea.',9,1),(262,'Labore totam officiis amet facilis labore quidem vitae.',3,2),(263,'Similique qui numquam cum fugiat eligendi impedit.',9,3),(264,'Consectetur nihil a dolores nostrum odio dicta.',0,4),(265,'Aliquid minus quis voluptate exercitationem deserunt alias perspiciatis.',6,5),(266,'Fuga voluptas id sint minima vel eius.',0,1),(267,'Quo quasi natus qui qui.',9,2),(268,'Cumque debitis aut autem in eos sapiente.',2,3),(269,'Iste praesentium iure deleniti assumenda voluptate sint exercitationem recusandae.',3,4),(270,'Vel corporis voluptas quis sapiente unde harum enim.',2,5),(271,'Et accusantium ut mollitia.',8,1),(272,'Modi est qui dicta doloribus iste.',3,2),(273,'Voluptatem sed occaecati dolorem nulla ea porro.',1,3),(274,'Modi nisi voluptatem et.',2,4),(275,'Iusto et dicta possimus dolor.',7,5),(276,'Velit et perferendis rerum incidunt blanditiis sit sed.',8,1),(277,'Non quod ea est veniam eveniet saepe.',6,2),(278,'Recusandae quos consequatur aliquam vero consequatur.',5,3),(279,'Est reprehenderit itaque accusamus voluptatem deserunt.',8,4),(280,'Veniam tenetur earum voluptatem modi aut vel reprehenderit fugiat.',3,5),(281,'Non culpa officia reprehenderit et autem repudiandae et et.',6,1),(282,'Dolorum optio eaque omnis ipsam et quam.',4,2),(283,'Qui dolor sint aut est.',1,3),(284,'Earum eum voluptate quia error qui velit.',2,4),(285,'Omnis qui unde sed iusto nihil laborum consequatur.',8,5),(286,'Quia hic officia ut sint quos impedit.',5,1),(287,'Natus aperiam quia dicta delectus porro aut et.',3,2),(288,'Consequatur deleniti ab ut et ut.',8,3),(289,'Recusandae blanditiis est est facilis eum.',9,4),(290,'Est sed sit et sit ut aspernatur.',4,5),(291,'Voluptas nisi corrupti dolores.',5,1),(292,'Adipisci qui sunt et et.',7,2),(293,'Officia qui soluta quibusdam cum eos nihil sint distinctio.',4,3),(294,'Vel deleniti qui sequi deserunt ut accusantium.',9,4),(295,'Earum expedita voluptas quidem non.',7,5),(296,'Quia in sunt magnam atque fugit facere.',3,1),(297,'Voluptatem quasi libero eligendi quasi ut et ut voluptates.',7,2),(298,'Consectetur sit autem rerum aut cumque ipsum.',4,3),(299,'Veniam et et voluptatem expedita maxime eos et.',5,4),(300,'Quos quo perferendis explicabo facere illo facilis consectetur.',6,5);
/*!40000 ALTER TABLE `sports_equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `signed_up_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT ' ',
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT ' ',
  `gender` enum('m','f','nb','ud') COLLATE utf8mb4_unicode_ci DEFAULT 'ud',
  `date_of_birth` date DEFAULT NULL,
  `phone_number` bigint(20) unsigned DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_sport_section` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone_number` (`phone_number`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'1991-02-22 03:29:15','Jalen','Witting','f','1983-06-24',79209076252,'krogahn@example.org',NULL),(2,'2001-12-02 11:39:40','Grayson','O\'Kon','m','1976-08-11',79131035963,'ubechtelar@example.net',NULL),(3,'1995-04-15 12:26:12','Katlyn','Kautzer','m','1977-12-13',79367970839,'fritsch.keegan@example.com',NULL),(4,'2014-07-14 11:36:06','Dawn','Luettgen','f','1972-07-28',79517877087,'tjenkins@example.org',NULL),(5,'2018-10-27 02:11:51','Leopold','Blanda','m','1970-01-02',79457191534,'ethelyn.gutmann@example.org',NULL),(6,'1989-06-10 04:09:08','Amir','Wisozk','m','1991-12-29',79107747271,'ruth.koelpin@example.com',NULL),(7,'1981-05-16 06:22:45','Maryse','Kling','m','1995-09-09',79556519388,'abner.ferry@example.org',NULL),(8,'1992-05-29 23:28:01','Tressie','Morar','m','1988-03-15',79630277658,'marley11@example.com',NULL),(9,'2009-07-12 17:39:45','Estel','Rippin','m','1981-11-13',79393317925,'electa74@example.com',NULL),(10,'1970-12-21 11:03:21','Michael','Christiansen','f','1970-11-05',79654794008,'ceasar.denesik@example.net',NULL),(11,'1990-08-07 16:21:13','Orville','Koss','f','2003-11-21',79051853719,'dewitt35@example.com',NULL),(12,'2012-11-08 01:13:18','Tobin','Beatty','f','1977-06-14',79917981393,'anna.zieme@example.org',NULL),(13,'1996-10-13 01:09:07','Carlie','Balistreri','f','1980-09-03',79756468066,'tkeeling@example.com',NULL),(14,'1998-08-24 06:51:03','Dan','Lakin','m','1982-06-21',79647218569,'lucas64@example.com',NULL),(15,'1991-10-01 03:33:44','Edd','Fisher','m','2015-06-28',79183908113,'rlangosh@example.org',NULL),(16,'1981-11-22 12:01:31','Lesly','Bode','f','1988-11-05',79714462186,'lucienne.rowe@example.org',NULL),(17,'1977-10-19 16:51:29','Koby','Mueller','m','2004-01-05',79622375793,'williamson.gerald@example.com',NULL),(18,'2005-06-16 12:16:46','Merritt','Brakus','f','1975-09-22',79913161042,'robel.ilene@example.net',NULL),(19,'2016-05-24 13:52:02','Samson','Wilkinson','m','1987-07-17',79170822855,'o\'conner.myrl@example.net',NULL),(20,'1972-12-29 01:14:23','Rodolfo','Lueilwitz','m','1979-04-04',79956185273,'gracie.hyatt@example.org',NULL),(21,'1996-04-21 07:52:53','Lizzie','Hane','m','2001-05-04',79728370351,'kerluke.bulah@example.com',NULL),(22,'2004-11-01 22:39:51','Reynold','Rohan','m','1984-06-06',79757084284,'pmante@example.org',NULL),(23,'2017-03-14 07:57:57','Chad','Miller','m','1982-08-17',79028679468,'zackery69@example.com',NULL),(24,'1989-04-20 04:06:57','Demario','Armstrong','f','2011-06-13',79725940494,'patrick88@example.com',NULL),(25,'2009-03-30 22:51:41','Donald','Zulauf','f','2006-11-13',79590644783,'gmorar@example.org',NULL),(26,'2002-09-05 14:26:12','Pierce','Thompson','f','1983-10-14',79079087428,'zita97@example.com',NULL),(27,'2018-05-27 05:20:07','Sylvester','Bogisich','m','2004-04-27',79078247484,'medhurst.ayla@example.org',NULL),(28,'1977-01-11 14:29:01','Henriette','Shields','m','2016-11-30',79673932583,'roy88@example.net',NULL),(29,'2018-04-23 02:29:57','Delaney','Witting','f','1992-01-03',79164711083,'kaylie24@example.com',NULL),(30,'1976-07-21 22:14:24','Rahsaan','Nicolas','m','1970-04-28',79399119329,'aharber@example.com',NULL),(31,'1973-11-30 08:44:25','Shana','Cassin','f','2010-09-02',79277473137,'jeanette.stoltenberg@example.org',NULL),(32,'1997-07-30 16:58:46','Jamie','Greenfelder','f','2015-11-03',79582700723,'vrippin@example.com',NULL),(33,'2012-10-21 21:46:47','David','Kirlin','m','2019-10-14',79296915674,'jovani.muller@example.net',NULL),(34,'2014-02-28 23:15:30','Hipolito','O\'Keefe','f','1982-12-13',79575467939,'ccarter@example.net',NULL),(35,'1977-01-10 20:42:58','Kacey','Hegmann','m','2015-02-10',79749409710,'pasquale85@example.org',NULL),(36,'1989-06-21 08:19:09','Mandy','Bradtke','m','1987-12-23',79821788806,'stone.gulgowski@example.org',NULL),(37,'1970-09-05 21:28:44','Colt','Toy','m','1984-05-03',79121002647,'rempel.garnet@example.org',NULL),(38,'2015-11-14 11:11:05','Tito','Wilkinson','f','2000-06-21',79986138821,'beatty.donnie@example.net',NULL),(39,'1983-06-03 22:32:47','Nikita','Pagac','m','1999-07-30',79016952150,'rosario96@example.net',NULL),(40,'1977-11-21 08:19:59','Dorothea','Schaefer','f','2014-12-12',79893281441,'sheathcote@example.com',NULL),(41,'1987-07-03 07:30:32','Carmela','Stiedemann','f','2014-01-17',79428248951,'bryana16@example.org',NULL),(42,'2011-11-26 11:57:28','Hermann','Kreiger','m','2019-08-20',79498255542,'jeanne.schmidt@example.net',NULL),(43,'2020-03-30 06:09:21','Micah','Lang','m','1973-03-12',79668930424,'bode.trever@example.com',NULL),(44,'1995-01-25 04:09:23','Faye','O\'Connell','m','2014-07-20',79983276752,'haag.mallory@example.net',NULL),(45,'1977-03-28 03:38:42','Danielle','Graham','m','2017-01-15',79306305457,'fjast@example.com',NULL),(46,'2009-10-28 11:36:32','Christ','Waelchi','f','2020-11-11',79159992845,'zhills@example.net',NULL),(47,'1994-02-12 07:45:19','Fabiola','Halvorson','f','2017-05-19',79069834186,'deron68@example.net',NULL),(48,'2000-02-22 09:52:29','Tracey','Weber','m','1988-05-11',79335439651,'jewell.zboncak@example.net',NULL),(49,'1983-10-09 04:56:02','Sabryna','Hammes','m','1971-09-25',79519164257,'marisol.beahan@example.org',NULL),(50,'1996-11-30 05:09:20','Art','Homenick','m','1998-05-02',79490424500,'hkautzer@example.org',NULL),(51,'2012-11-05 17:45:43','Felipe','Berge','f','1988-11-13',79249951715,'kenna69@example.net',NULL),(52,'1984-01-27 16:24:28','Roslyn','Prohaska','f','2002-05-13',79520177917,'keith.daniel@example.org',NULL),(53,'1971-07-05 01:26:59','Green','Okuneva','f','1999-05-01',79044938863,'margot53@example.com',NULL),(54,'1977-07-07 16:00:54','Javon','Pollich','f','1983-01-31',79017395660,'randy50@example.com',NULL),(55,'1987-09-07 16:39:44','Margot','Erdman','m','1981-10-26',79784408936,'maximillia.spencer@example.org',NULL),(56,'2000-11-09 22:37:07','Amina','Dibbert','f','2005-11-03',79191978568,'omari79@example.org',NULL),(57,'1976-03-29 13:57:23','Roman','Grimes','f','1984-04-15',79179492592,'cstracke@example.org',NULL),(58,'1978-03-24 14:19:55','Beatrice','Abbott','f','1974-01-27',79673110137,'johnson19@example.com',NULL),(59,'1991-05-15 05:38:25','Keven','Robel','f','1992-06-11',79597062751,'ishanahan@example.com',NULL),(60,'1975-01-13 11:04:41','Leonel','Olson','f','1986-11-02',79978050019,'johnson.gunner@example.org',NULL),(61,'1991-10-02 14:27:57','Colin','Smitham','m','2001-08-24',79893670441,'rlesch@example.com',NULL),(62,'2002-07-22 13:10:10','Elisabeth','Lubowitz','m','2019-02-06',79067610517,'douglas.stehr@example.net',NULL),(63,'1983-11-11 16:55:08','Eusebio','Goyette','m','1973-05-14',79458025276,'kailyn22@example.org',NULL),(64,'1987-12-27 18:43:10','Alvera','Kemmer','f','1984-08-08',79488852084,'jazmyn.bergstrom@example.com',NULL),(65,'1982-05-27 13:46:25','Talia','Heidenreich','m','1978-10-07',79681477626,'berge.aiyana@example.com',NULL),(66,'1983-11-06 13:53:58','Alicia','Crooks','m','1973-09-23',79362951602,'afton.lueilwitz@example.net',NULL),(67,'2015-01-19 18:33:58','Susanna','Fahey','m','2015-08-18',79535837302,'elmer38@example.net',NULL),(68,'2005-11-11 05:30:42','Elbert','Leannon','f','1974-03-11',79783611296,'stephania25@example.net',NULL),(69,'1983-02-06 04:15:23','Sydnie','Mann','f','2016-05-16',79624154392,'rwisozk@example.com',NULL),(70,'2007-02-25 05:32:17','Sim','Schultz','m','2005-12-31',79155740042,'ericka.dare@example.com',NULL),(71,'2016-12-24 15:27:09','Savanah','Bechtelar','f','2014-11-12',79258782073,'pjacobson@example.org',NULL),(72,'2005-01-15 21:23:13','Clementina','Nicolas','f','1998-06-11',79335764814,'clark56@example.com',NULL),(73,'1986-11-12 14:10:14','Jarret','Parker','f','1988-12-07',79600126305,'cwiegand@example.org',NULL),(74,'2011-04-17 17:25:28','Francis','Rath','m','1981-09-17',79188211282,'dstoltenberg@example.net',NULL),(75,'2015-03-11 04:35:38','Karson','Senger','f','2014-01-28',79706877129,'jzemlak@example.com',NULL),(76,'2004-12-27 20:32:35','Camden','Klocko','m','1989-11-27',79053825549,'eldora28@example.net',NULL),(77,'1986-12-18 19:15:03','Kristoffer','Rolfson','f','2000-02-11',79697507739,'leta.dickinson@example.org',NULL),(78,'1986-04-21 00:23:31','Ashtyn','Russel','f','2012-07-13',79768771928,'royce.rodriguez@example.net',NULL),(79,'1990-08-07 11:38:26','Bill','Ward','m','2011-12-20',79286453029,'thompson.garrett@example.com',NULL),(80,'2018-09-04 22:41:52','Liam','Trantow','f','2013-06-25',79576310329,'robb50@example.com',NULL),(81,'1987-01-16 23:57:10','Otho','Boehm','m','2010-11-24',79765935398,'fstracke@example.com',NULL),(82,'2000-04-20 05:18:36','Ima','Nolan','m','1980-04-12',79075163515,'alta.fay@example.org',NULL),(83,'1977-04-06 20:52:01','Amya','Swaniawski','m','2001-03-12',79041984607,'herminio38@example.com',NULL),(84,'1983-10-03 05:14:28','Tomas','Robel','m','1995-01-24',79535898904,'qmitchell@example.net',NULL),(85,'2018-09-26 11:12:54','Miguel','Quigley','f','2008-03-24',79940763551,'cayla63@example.com',NULL),(86,'1975-01-12 22:16:04','Keagan','Kovacek','m','1986-10-16',79729992258,'gswaniawski@example.net',NULL),(87,'2010-08-02 19:48:58','Vernie','McClure','f','1987-06-03',79172714215,'ima96@example.net',NULL),(88,'1989-05-30 21:04:02','Koby','Keebler','f','2021-01-14',79803313020,'lolson@example.net',NULL),(89,'2021-05-31 20:46:52','Beatrice','Reinger','m','1973-07-13',79531278888,'kamron98@example.net',NULL),(90,'1989-06-06 17:46:06','Rosendo','Krajcik','m','2006-06-24',79769364503,'nickolas.kuphal@example.org',NULL),(91,'1991-04-25 04:53:20','Sandra','Casper','m','2004-08-17',79513995835,'simeon.bruen@example.org',NULL),(92,'2003-12-24 16:44:23','Omer','Schmeler','m','1984-07-01',79287245648,'franecki.leatha@example.com',NULL),(93,'1982-09-20 21:05:40','Dorothea','Steuber','m','2020-10-01',79971229903,'walter.novella@example.com',NULL),(94,'1996-11-20 18:52:22','Novella','Cartwright','f','2013-07-17',79201458205,'ynicolas@example.com',NULL),(95,'2000-07-23 04:01:41','Lamont','McDermott','m','1979-02-19',79608098833,'abbey.osinski@example.net',NULL),(96,'1976-10-29 15:50:59','Vernice','Hamill','f','1995-06-26',79717740892,'hjacobs@example.com',NULL),(97,'1994-08-23 12:09:14','Marvin','Cruickshank','m','1980-08-04',79320626995,'ahamill@example.net',NULL),(98,'1981-02-07 21:49:15','Justice','Willms','m','1971-06-09',79647398085,'lfranecki@example.net',NULL),(99,'1984-05-17 16:57:21','Mandy','Tillman','f','1983-11-19',79137872699,'haleigh24@example.net',NULL),(100,'2013-05-18 22:32:03','Bo','Daugherty','f','1971-10-10',79429529564,'goyette.trenton@example.net',NULL);
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

-- Dump completed on 2021-10-04 15:23:41
