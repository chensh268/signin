CREATE DATABASE  IF NOT EXISTS `db_signin` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `db_signin`;
-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: db_signin
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
-- Table structure for table `t_class_list`
--

DROP TABLE IF EXISTS `t_class_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_class_list` (
  `class_id` int(11) NOT NULL COMMENT '课程编号',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '课程名称',
  `semester` int(6) NOT NULL COMMENT '所属学期：如201801',
  `size` int(11) NOT NULL COMMENT '班级人数',
  `teacher_id` int(11) NOT NULL COMMENT '老师教工号',
  `student_ids` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'csv格式的学生学号集合',
  `address` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '教室位置,格式:"教学楼","教室号"',
  PRIMARY KEY (`class_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='课程信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_class_list`
--

LOCK TABLES `t_class_list` WRITE;
/*!40000 ALTER TABLE `t_class_list` DISABLE KEYS */;
INSERT INTO `t_class_list` VALUES (1500030004,'Java程序设计',201801,22,147,'0,1,2','理工楼L1,401'),(1502880001,'基于Web的编程',201801,45,147,'0,1,2,2016150011','理工楼L1,211');
/*!40000 ALTER TABLE `t_class_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_location_list`
--

DROP TABLE IF EXISTS `t_location_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_location_list` (
  `id` int(3) NOT NULL COMMENT '自增ID',
  `campus` int(1) NOT NULL COMMENT '校区:0后海;1西丽',
  `building` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '教学楼名称',
  `lat` decimal(10,7) NOT NULL COMMENT '纬度',
  `lng` decimal(10,7) NOT NULL COMMENT '经度',
  PRIMARY KEY (`id`),
  UNIQUE KEY `building_UNIQUE` (`building`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='教学楼(教室)对应位置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_location_list`
--

LOCK TABLES `t_location_list` WRITE;
/*!40000 ALTER TABLE `t_location_list` DISABLE KEYS */;
INSERT INTO `t_location_list` VALUES (1,0,'冬筑',22.5297370,113.9397600),(2,0,'理工楼L1',22.5280500,113.9394000),(3,0,'理工楼L2',22.5285200,113.9397600),(4,0,'理工楼L3',22.5283843,113.9403301),(5,0,'南区计算机大楼',22.5254806,113.9367950);
/*!40000 ALTER TABLE `t_location_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_signin_list`
--

DROP TABLE IF EXISTS `t_signin_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_signin_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `class_id` int(11) NOT NULL COMMENT '课程编号',
  `week_start_time` int(11) NOT NULL COMMENT '上课该周的周一零点时间戳',
  `week` int(2) NOT NULL COMMENT '学期第几周',
  `signin_ids` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'csv格式的已签到学号列表',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='每堂课的签到情况';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_signin_list`
--

LOCK TABLES `t_signin_list` WRITE;
/*!40000 ALTER TABLE `t_signin_list` DISABLE KEYS */;
INSERT INTO `t_signin_list` VALUES (1,1502880001,1543766400,14,'1,2016150011'),(3,1502880001,1544371200,15,'2016150011'),(4,1502880001,1544976000,16,'0,2');
/*!40000 ALTER TABLE `t_signin_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_student_list`
--

DROP TABLE IF EXISTS `t_student_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_student_list` (
  `student_id` int(11) NOT NULL COMMENT '学号',
  `card_id` int(6) DEFAULT '0' COMMENT '校园卡号',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '名称',
  `password` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `create_time` int(11) NOT NULL,
  `class_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'csv格式的课程ID集合',
  `sex` int(1) DEFAULT NULL COMMENT '性别：1男；0女',
  `wechat` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '微信号',
  PRIMARY KEY (`student_id`) USING BTREE,
  UNIQUE KEY `student_id_UNIQUE` (`student_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='学生信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_student_list`
--

LOCK TABLES `t_student_list` WRITE;
/*!40000 ALTER TABLE `t_student_list` DISABLE KEYS */;
INSERT INTO `t_student_list` VALUES (0,0,'test','123',20181208,'1,2,3',1,'666'),(1,1,'学生1','123',20181222,'1,2,3',NULL,NULL),(2,2,'学生2','123',20181222,'1,2,3,1502880001',NULL,NULL),(2016150011,2016150011,'王国骅','2d27f79c0de522245d7dc3f944affc23',1545811413,'1502880001',NULL,NULL),(2016150012,2016150012,'梁仕钢','dfc75db171d19cb4ae9a159dd585cefa',1545802114,'',NULL,NULL);
/*!40000 ALTER TABLE `t_student_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_teacher_list`
--

DROP TABLE IF EXISTS `t_teacher_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_teacher_list` (
  `teacher_id` int(11) NOT NULL COMMENT '教工号',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '名称',
  `password` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '密码',
  `create_time` int(11) NOT NULL,
  `class_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'csv格式的课程ID集合',
  PRIMARY KEY (`teacher_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='教师信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_teacher_list`
--

LOCK TABLES `t_teacher_list` WRITE;
/*!40000 ALTER TABLE `t_teacher_list` DISABLE KEYS */;
INSERT INTO `t_teacher_list` VALUES (147,'于仕琪','5f4dcc3b5aa765d61d8327deb882cf99',20181208,'1502880001,1500030004'),(180120,'王国骅','password',1544535519,'');
/*!40000 ALTER TABLE `t_teacher_list` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-26 16:09:14
