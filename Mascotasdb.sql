-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: mascotasdb
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `adopcion`
--

DROP TABLE IF EXISTS `adopcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `adopcion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idmascota` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_mascota_idx` (`idmascota`),
  KEY `id_usuario_idx` (`idusuario`),
  CONSTRAINT `id_mascota` FOREIGN KEY (`idmascota`) REFERENCES `mascota` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adopcion`
--

LOCK TABLES `adopcion` WRITE;
/*!40000 ALTER TABLE `adopcion` DISABLE KEYS */;
INSERT INTO `adopcion` VALUES (1,2,1),(2,3,2),(3,3,1),(4,1,1),(5,2,1),(6,2,1),(7,2,1),(8,2,4),(9,2,3);
/*!40000 ALTER TABLE `adopcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `adopuserpet`
--

DROP TABLE IF EXISTS `adopuserpet`;
/*!50001 DROP VIEW IF EXISTS `adopuserpet`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `adopuserpet` AS SELECT 
 1 AS `id`,
 1 AS `idUSer`,
 1 AS `nombre`,
 1 AS `idPet`,
 1 AS `mascota`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Perro'),(2,'Gato'),(3,'Conejo'),(4,'Perico');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mascota`
--

DROP TABLE IF EXISTS `mascota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mascota` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `edad` int(11) NOT NULL,
  `idcategoria` int(11) NOT NULL,
  `raza` varchar(45) NOT NULL,
  `tamaño` varchar(45) NOT NULL,
  `descripcion` varchar(280) NOT NULL,
  `idong` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_categoria_idx` (`idcategoria`),
  KEY `id_ong_idx` (`idong`),
  CONSTRAINT `id_categoria` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_ong` FOREIGN KEY (`idong`) REFERENCES `ong` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mascota`
--

LOCK TABLES `mascota` WRITE;
/*!40000 ALTER TABLE `mascota` DISABLE KEYS */;
INSERT INTO `mascota` VALUES (1,'Atenea',4,1,'Nose','pequeña','Loca',1),(2,'Kaiser',2,1,'Perro Criollo','mediano','loco',1),(3,'Poppy',3,1,'Golden Retriver','Grande','Jugueton',1),(4,'Micho',2,2,'Gatito','pequeño','cute',13),(5,'Shiro',2,3,'Cabeza de León','Pequeño','Malhumorado',14),(6,'Pancha',14,4,'Perico Chocoyo','Pequeño','Perico curioso, me encanta morder',14),(7,'Stan Lee',6,1,'Criollo','Mediano','Juguetón, amoroso, excelsior',1),(8,'Milu',1,2,'Gato Fiero','Pequeño','Gato hermoso, juguetón y cazador',11);
/*!40000 ALTER TABLE `mascota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `mascota_view`
--

DROP TABLE IF EXISTS `mascota_view`;
/*!50001 DROP VIEW IF EXISTS `mascota_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `mascota_view` AS SELECT 
 1 AS `id`,
 1 AS `nombre`,
 1 AS `edad`,
 1 AS `categoria`,
 1 AS `raza`,
 1 AS `tamaño`,
 1 AS `descripcion`,
 1 AS `ong`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ong`
--

DROP TABLE IF EXISTS `ong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ong` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `contacto` varchar(45) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `ncuenta` int(11) NOT NULL,
  `link` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ong`
--

LOCK TABLES `ong` WRITE;
/*!40000 ALTER TABLE `ong` DISABLE KEYS */;
INSERT INTO `ong` VALUES (1,'PuppyOng','puppyong@gmail.com','Puppys forever',123456,'/puppylife'),(2,'doggo','doggo@gmail.com','mascotas al rescaste',123498765,'/doggoslife'),(3,'AteneaDog','atenea@gmail.com','dogs',123467895,'/ateforlife'),(6,'Ate','ate@gmail.com','ate',123409,'/ate'),(7,'colocha','colochos@gmail.com','colochita',12093,'/colochos'),(9,'escandolosos','escandalosos@gmail.com','ositos',98712,'/pardopolarpanda'),(10,'douglaslovespets','douglas.jaja@gmail.com','buena onda',23456,'www.doug'),(11,'Gatitos','gatitos@gmail.com','Gatitos forever',10,'gatitox'),(13,'GatosONG','Gatos@gmail.com','Gatitos',1,'/12gatitos'),(14,'Paola','pao@ong.com','Soy una ONG muy kul',22324444,'www.facebook.com');
/*!40000 ALTER TABLE `ong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `fechanacimiento` varchar(20) NOT NULL,
  `genero` varchar(10) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `contraseña` varchar(45) NOT NULL,
  `telefono` int(11) DEFAULT NULL,
  `nivel` int(11) NOT NULL COMMENT '1-Administrador\n2-Usuario cualquiera',
  PRIMARY KEY (`id`),
  UNIQUE KEY `correo_UNIQUE` (`correo`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Michelle','Beltran','01/04/99','F','michelle@gmail.com','1234',77976529,1),(2,'Roberto','Ramirez','01/10/97','Masculino','r@gmail.com','12345',77900000,2),(3,'Andrea','Beltran','01/04/99','Femenino','a@gmail.com','12345',77654532,2),(4,'Paola','Escobar','14 de Agosto de 1998','Femenino','pao@gmail.com','12345',22131455,1),(7,'Andrea','Bel','01/04/99','Femenino','am@gmail.com','123456',78654323,2),(8,'Ernesto','Norio','23/02/98','Masculino','Norio@gmail.com','12345',74567634,2);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `adopuserpet`
--

/*!50001 DROP VIEW IF EXISTS `adopuserpet`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `adopuserpet` AS select `adopcion`.`id` AS `id`,`us`.`id` AS `idUSer`,`us`.`nombre` AS `nombre`,`pet`.`id` AS `idPet`,`pet`.`nombre` AS `mascota` from (`usuario` `us` join (`mascota` `pet` join `adopcion`)) where ((`us`.`id` = `adopcion`.`idusuario`) and (`pet`.`id` = `adopcion`.`idmascota`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mascota_view`
--

/*!50001 DROP VIEW IF EXISTS `mascota_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mascota_view` AS select `a`.`id` AS `id`,`a`.`nombre` AS `nombre`,`a`.`edad` AS `edad`,`b`.`categoria` AS `categoria`,`a`.`raza` AS `raza`,`a`.`tamaño` AS `tamaño`,`a`.`descripcion` AS `descripcion`,`c`.`nombre` AS `ong` from ((`mascota` `a` join `categoria` `b` on((`a`.`idcategoria` = `b`.`id`))) join `ong` `c` on((`a`.`idong` = `c`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-22 16:00:41
