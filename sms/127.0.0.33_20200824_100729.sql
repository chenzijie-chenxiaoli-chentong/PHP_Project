-- MySQL dump 10.13  Distrib 5.5.62, for Linux (x86_64)
--
-- Host: localhost    Database: 127.0.0.33
-- ------------------------------------------------------
-- Server version	5.5.62-log

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
-- Table structure for table `sms_admin`
--

DROP TABLE IF EXISTS `sms_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '密码盐',
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '头像',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `loginfailure` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '失败次数',
  `logintime` int(10) DEFAULT NULL COMMENT '登录时间',
  `loginip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '登录IP',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `token` varchar(59) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Session标识',
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='管理员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_admin`
--

LOCK TABLES `sms_admin` WRITE;
/*!40000 ALTER TABLE `sms_admin` DISABLE KEYS */;
INSERT INTO `sms_admin` VALUES (1,'admin','Admin','d2e2e4b3df2533674b93c681f340ec73','53c283','/assets/img/avatar.png','admin@admin.com',0,1598233059,'60.220.124.75',1492186163,1598233059,'0e3b7df2-39db-4d7e-85e8-7d4145d75113','normal');
/*!40000 ALTER TABLE `sms_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_admin_log`
--

DROP TABLE IF EXISTS `sms_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_admin_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '管理员名字',
  `url` varchar(1500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '操作页面',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '日志标题',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  `ip` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'User-Agent',
  `createtime` int(10) DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `name` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=326 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='管理员日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_admin_log`
--

LOCK TABLES `sms_admin_log` WRITE;
/*!40000 ALTER TABLE `sms_admin_log` DISABLE KEYS */;
INSERT INTO `sms_admin_log` VALUES (1,1,'admin','/FgGbQMjdVY.php/index/login?url=%2FFgGbQMjdVY.php','登录','{\"url\":\"\\/FgGbQMjdVY.php\",\"__token__\":\"cb123f4d42894ba584af5feb066097cb\",\"username\":\"admin\",\"captcha\":\"5amv\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598137904),(3,1,'admin','/FgGbQMjdVY.php/index/index','','{\"action\":\"refreshmenu\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598137984),(4,1,'admin','/FgGbQMjdVY.php/cms/modelx/del/ids/3','CMS管理 模型管理 删除','{\"action\":\"del\",\"ids\":\"3\",\"params\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598138032),(5,1,'admin','/FgGbQMjdVY.php/cms/modelx/del/ids/2','CMS管理 模型管理 删除','{\"action\":\"del\",\"ids\":\"2\",\"params\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598138036),(6,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_template_list','CMS管理','{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"list_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"list_news.html\",\"searchField\":[\"name\"],\"type\":\"list\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598138045),(7,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_template_list','CMS管理','{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"show_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"show_news.html\",\"searchField\":[\"name\"],\"type\":\"show\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598138046),(8,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"zhong\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598138057),(9,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"z\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598138057),(10,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"\\u4e2d\\u56fd\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598138059),(11,1,'admin','/FgGbQMjdVY.php/cms/channel/check_element_available','CMS管理 栏目管理','{\"id\":\"\\u4e2d\\u56fd\",\"name\":\"row[name]\",\"value\":\"\\u4e2d\\u56fd\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598138066),(12,1,'admin','/FgGbQMjdVY.php/cms/channel/check_element_available','CMS管理 栏目管理','{\"name\":\"row[diyname]\",\"value\":\"zhongguo\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598138067),(13,1,'admin','/FgGbQMjdVY.php/cms/channel/add?dialog=1','CMS管理 栏目管理 添加','{\"dialog\":\"1\",\"row\":{\"type\":\"list\",\"model_id\":\"1\",\"parent_id\":\"0\",\"name\":\"\\u4e2d\\u56fd\",\"image\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"diyname\":\"zhongguo\",\"outlink\":\"\",\"channeltpl\":\"\",\"listtpl\":\"list_news.html\",\"showtpl\":\"show_news.html\",\"pagesize\":\"10\",\"status\":\"normal\"}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598138067),(14,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_template_list','CMS管理','{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"list_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"list_news.html\",\"searchField\":[\"name\"],\"type\":\"list\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598138071),(15,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_template_list','CMS管理','{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"show_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"show_news.html\",\"searchField\":[\"name\"],\"type\":\"show\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598138072),(16,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"\\u7f8e\\u56fd\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598138078),(17,1,'admin','/FgGbQMjdVY.php/cms/channel/check_element_available','CMS管理 栏目管理','{\"id\":\"\\u7f8e\\u56fd\",\"name\":\"row[name]\",\"value\":\"\\u7f8e\\u56fd\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598138079),(18,1,'admin','/FgGbQMjdVY.php/cms/channel/check_element_available','CMS管理 栏目管理','{\"name\":\"row[diyname]\",\"value\":\"meiguo\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598138080),(19,1,'admin','/FgGbQMjdVY.php/cms/channel/add?dialog=1','CMS管理 栏目管理 添加','{\"dialog\":\"1\",\"row\":{\"type\":\"list\",\"model_id\":\"1\",\"parent_id\":\"0\",\"name\":\"\\u7f8e\\u56fd\",\"image\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"diyname\":\"meiguo\",\"outlink\":\"\",\"channeltpl\":\"\",\"listtpl\":\"list_news.html\",\"showtpl\":\"show_news.html\",\"pagesize\":\"10\",\"status\":\"normal\"}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598138080),(20,1,'admin','/FgGbQMjdVY.php/cms/archives/get_channel_fields','CMS管理 内容管理','{\"channel_id\":\"2\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598138088),(21,1,'admin','/FgGbQMjdVY.php/user/user/index','会员管理 会员管理 查看','{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"nickname\",\"keyField\":\"id\",\"searchField\":[\"nickname\"],\"nickname\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598138093),(22,1,'admin','/FgGbQMjdVY.php/user/user/index','会员管理 会员管理 查看','{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"nickname\",\"keyField\":\"id\",\"searchField\":[\"nickname\"],\"nickname\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598138100),(23,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"1\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598138108),(24,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"13\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598138108),(25,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"132\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598138109),(26,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"13233\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598138109),(27,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"1323333\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598138110),(28,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"13233332\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598138110),(29,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"1323333222\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598138111),(30,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"13233332222\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598138112),(31,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"13233332222\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598138144),(32,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"13233332222f\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598138144),(33,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"13233332222f\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598138144),(34,1,'admin','/FgGbQMjdVY.php/cms/archives/check_element_available','CMS管理 内容管理','{\"name\":\"row[diyname]\",\"value\":\"13233332222f\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598138146),(35,1,'admin','/FgGbQMjdVY.php/cms/archives/add?channel=&dialog=1','CMS管理 内容管理 添加','{\"channel\":\"\",\"dialog\":\"1\",\"row\":{\"style\":\"\",\"channel_id\":\"2\",\"user_id\":\"\",\"special_ids\":\"\",\"title\":\"13233332222f\",\"image\":\"\",\"images\":\"\",\"tags\":\"\",\"diyname\":\"13233332222f\",\"content\":\"1111\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"price\":\"0\",\"author\":\"\",\"views\":\"0\",\"comments\":\"0\",\"likes\":\"0\",\"dislikes\":\"0\",\"weigh\":\"0\",\"status\":\"normal\",\"isguest\":\"10\",\"iscomment\":\"10\",\"publishtime\":\"2020-08-23 07:14:48\",\"channel_ids\":[\"\"],\"flag\":[\"\"]}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598138147),(36,1,'admin','/FgGbQMjdVY.php/cms/archives/get_channel_fields','CMS管理 内容管理','{\"channel_id\":\"2\",\"archives_id\":\"1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598138273),(37,1,'admin','/FgGbQMjdVY.php/user/user/index','会员管理 会员管理 查看','{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"showField\":\"nickname\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"nickname\"]}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598138274),(38,0,'Unknown','/FgGbQMjdVY.php/index/login?url=%2FFgGbQMjdVY.php%2Faddon%3Fref%3Daddtabs','登录','{\"url\":\"\\/FgGbQMjdVY.php\\/addon?ref=addtabs\",\"__token__\":\"972f100bcc3dd065cdf6db89980cc37b\",\"username\":\"admin\",\"captcha\":\"2x7u\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224363),(39,0,'Unknown','/FgGbQMjdVY.php/index/login?url=%2FFgGbQMjdVY.php%2Faddon%3Fref%3Daddtabs','登录','{\"url\":\"\\/FgGbQMjdVY.php\\/addon?ref=addtabs\",\"__token__\":\"b8845c862b61fb4abfd9da1e0f269bc0\",\"username\":\"admin\",\"captcha\":\"dxvr\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224374),(40,1,'admin','/FgGbQMjdVY.php/index/login?url=%2FFgGbQMjdVY.php%2Faddon%3Fref%3Daddtabs','登录','{\"url\":\"\\/FgGbQMjdVY.php\\/addon?ref=addtabs\",\"__token__\":\"3a32aaf8cfced25984ff6c635d6d5242\",\"username\":\"admin\",\"captcha\":\"jxrp\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224387),(41,1,'admin','/FgGbQMjdVY.php/cms/archives/get_channel_fields','CMS管理 内容管理','{\"channel_id\":\"2\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224399),(42,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"131\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224404),(43,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"13144\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224404),(44,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"131444\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224405),(45,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"1314444\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224405),(46,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"13144444\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224405),(47,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"1314444444\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224406),(48,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"13144444444\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224406),(49,1,'admin','/FgGbQMjdVY.php/cms/archives/check_element_available','CMS管理 内容管理','{\"name\":\"row[diyname]\",\"value\":\"13144444444a\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224411),(50,1,'admin','/FgGbQMjdVY.php/cms/archives/add?channel=&dialog=1','CMS管理 内容管理 添加','{\"channel\":\"\",\"dialog\":\"1\",\"row\":{\"style\":\"\",\"channel_id\":\"2\",\"user_id\":\"\",\"special_ids\":\"\",\"title\":\"13144444444\",\"image\":\"\",\"images\":\"\",\"tags\":\"\",\"diyname\":\"13144444444a\",\"content\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"price\":\"0\",\"author\":\"\",\"views\":\"0\",\"comments\":\"0\",\"likes\":\"0\",\"dislikes\":\"0\",\"weigh\":\"0\",\"status\":\"normal\",\"isguest\":\"10\",\"iscomment\":\"10\",\"publishtime\":\"2020-08-24 07:13:19\",\"channel_ids\":[\"\"],\"flag\":[\"\"]}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224412),(51,1,'admin','/FgGbQMjdVY.php/cms/archives/get_channel_fields','CMS管理 内容管理','{\"channel_id\":\"2\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224414),(52,1,'admin','/FgGbQMjdVY.php/cms/special/index','CMS管理 专题管理 查看','{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"title\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"title\",\"keyField\":\"id\",\"searchField\":[\"title\"],\"title\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224417),(53,1,'admin','/FgGbQMjdVY.php/user/user/index','会员管理 会员管理 查看','{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"nickname\",\"keyField\":\"id\",\"searchField\":[\"nickname\"],\"nickname\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224417),(54,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"131\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224420),(55,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"13144\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224420),(56,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"13144444444\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224422),(57,1,'admin','/FgGbQMjdVY.php/cms/archives/check_element_available','CMS管理 内容管理','{\"name\":\"row[diyname]\",\"value\":\"13144444444b\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224425),(58,1,'admin','/FgGbQMjdVY.php/cms/archives/add?channel=&dialog=1','CMS管理 内容管理 添加','{\"channel\":\"\",\"dialog\":\"1\",\"row\":{\"style\":\"\",\"channel_id\":\"2\",\"user_id\":\"\",\"special_ids\":\"\",\"title\":\"13144444444\",\"image\":\"\",\"images\":\"\",\"tags\":\"\",\"diyname\":\"13144444444b\",\"content\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"price\":\"0\",\"author\":\"\",\"views\":\"0\",\"comments\":\"0\",\"likes\":\"0\",\"dislikes\":\"0\",\"weigh\":\"0\",\"status\":\"normal\",\"isguest\":\"10\",\"iscomment\":\"10\",\"publishtime\":\"2020-08-24 07:13:34\",\"channel_ids\":[\"\"],\"flag\":[\"\"]}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224426),(59,1,'admin','/FgGbQMjdVY.php/cms/archives/get_channel_fields','CMS管理 内容管理','{\"channel_id\":\"2\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224429),(60,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"131\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224431),(61,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"1314\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224432),(62,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"131444\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224433),(63,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"131444444\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224433),(64,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"13144444444\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224433),(65,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"1314444\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224433),(66,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"13144444\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224433),(67,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"131444444442\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224434),(68,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"1314444444\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224434),(69,1,'admin','/FgGbQMjdVY.php/cms/archives/check_element_available','CMS管理 内容管理','{\"name\":\"row[diyname]\",\"value\":\"1314444444a\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224437),(70,1,'admin','/FgGbQMjdVY.php/cms/archives/add?channel=&dialog=1','CMS管理 内容管理 添加','{\"channel\":\"\",\"dialog\":\"1\",\"row\":{\"style\":\"\",\"channel_id\":\"2\",\"user_id\":\"\",\"special_ids\":\"\",\"title\":\"131444444442\",\"image\":\"\",\"images\":\"\",\"tags\":\"\",\"diyname\":\"1314444444a\",\"content\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"price\":\"0\",\"author\":\"\",\"views\":\"0\",\"comments\":\"0\",\"likes\":\"0\",\"dislikes\":\"0\",\"weigh\":\"0\",\"status\":\"normal\",\"isguest\":\"10\",\"iscomment\":\"10\",\"publishtime\":\"2020-08-24 07:13:49\",\"channel_ids\":[\"\"],\"flag\":[\"\"]}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224438),(71,1,'admin','/FgGbQMjdVY.php/cms/archives/get_channel_fields','CMS管理 内容管理','{\"channel_id\":\"2\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224443),(72,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"141\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224448),(73,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"141444\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224449),(74,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"1414444\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224449),(75,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"1414444444\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224449),(76,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"14144444444\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224450),(77,1,'admin','/FgGbQMjdVY.php/cms/archives/check_element_available','CMS管理 内容管理','{\"name\":\"row[diyname]\",\"value\":\"1414444444411a\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224459),(78,1,'admin','/FgGbQMjdVY.php/cms/archives/add?channel=&dialog=1','CMS管理 内容管理 添加','{\"channel\":\"\",\"dialog\":\"1\",\"row\":{\"style\":\"\",\"channel_id\":\"2\",\"user_id\":\"\",\"special_ids\":\"\",\"title\":\"14144444444\",\"image\":\"\",\"images\":\"\",\"tags\":\"\",\"diyname\":\"1414444444411a\",\"content\":\"1\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"price\":\"0\",\"author\":\"\",\"views\":\"0\",\"comments\":\"0\",\"likes\":\"0\",\"dislikes\":\"0\",\"weigh\":\"0\",\"status\":\"normal\",\"isguest\":\"10\",\"iscomment\":\"10\",\"publishtime\":\"2020-08-24 07:14:03\",\"channel_ids\":[\"\"],\"flag\":[\"\"]}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224459),(79,1,'admin','/FgGbQMjdVY.php/cms/archives/get_channel_fields','CMS管理 内容管理','{\"channel_id\":\"2\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224461),(80,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"13\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224463),(81,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"133\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224463),(82,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"1333\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224464),(83,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"13333\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224464),(84,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"133333\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224464),(85,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"1333333\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224465),(86,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"13333333333\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224465),(87,1,'admin','/FgGbQMjdVY.php/cms/archives/check_element_available','CMS管理 内容管理','{\"name\":\"row[diyname]\",\"value\":\"13333333333a\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224466),(88,1,'admin','/FgGbQMjdVY.php/cms/archives/add?channel=&dialog=1','CMS管理 内容管理 添加','{\"channel\":\"\",\"dialog\":\"1\",\"row\":{\"style\":\"\",\"channel_id\":\"2\",\"user_id\":\"\",\"special_ids\":\"\",\"title\":\"13333333333\",\"image\":\"\",\"images\":\"\",\"tags\":\"\",\"diyname\":\"13333333333a\",\"content\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"price\":\"0\",\"author\":\"\",\"views\":\"0\",\"comments\":\"0\",\"likes\":\"0\",\"dislikes\":\"0\",\"weigh\":\"0\",\"status\":\"normal\",\"isguest\":\"10\",\"iscomment\":\"10\",\"publishtime\":\"2020-08-24 07:14:21\",\"channel_ids\":[\"\"],\"flag\":[\"\"]}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224467),(89,1,'admin','/FgGbQMjdVY.php/cms/archives/get_channel_fields','CMS管理 内容管理','{\"channel_id\":\"2\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224469),(90,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"1\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224471),(91,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"13\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224471),(92,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"131\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224472),(93,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"1312\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224473),(94,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"131222\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224473),(95,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"13122222\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224473),(96,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"131222222\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224473),(97,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"1312222222\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224474),(98,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"13122222222\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224474),(99,1,'admin','/FgGbQMjdVY.php/cms/archives/check_element_available','CMS管理 内容管理','{\"name\":\"row[diyname]\",\"value\":\"1312222222a\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224475),(100,1,'admin','/FgGbQMjdVY.php/cms/archives/add?channel=&dialog=1','CMS管理 内容管理 添加','{\"channel\":\"\",\"dialog\":\"1\",\"row\":{\"style\":\"\",\"channel_id\":\"2\",\"user_id\":\"\",\"special_ids\":\"\",\"title\":\"13122222222\",\"image\":\"\",\"images\":\"\",\"tags\":\"\",\"diyname\":\"13122222222\",\"content\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"price\":\"0\",\"author\":\"\",\"views\":\"0\",\"comments\":\"0\",\"likes\":\"0\",\"dislikes\":\"0\",\"weigh\":\"0\",\"status\":\"normal\",\"isguest\":\"10\",\"iscomment\":\"10\",\"publishtime\":\"2020-08-24 07:14:28\",\"channel_ids\":[\"\"],\"flag\":[\"\"]}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224475),(101,1,'admin','/FgGbQMjdVY.php/cms/archives/get_channel_fields','CMS管理 内容管理','{\"channel_id\":\"2\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224477),(102,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"131\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224479),(103,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"1312222\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224480),(104,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"13122221\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224480),(105,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"131222211\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224481),(106,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"1312222111\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224481),(107,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"13122221111a\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224481),(108,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"13122221111\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224482),(109,1,'admin','/FgGbQMjdVY.php/cms/archives/check_element_available','CMS管理 内容管理','{\"name\":\"row[diyname]\",\"value\":\"13122221111a\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224484),(110,1,'admin','/FgGbQMjdVY.php/cms/archives/add?channel=&dialog=1','CMS管理 内容管理 添加','{\"channel\":\"\",\"dialog\":\"1\",\"row\":{\"style\":\"\",\"channel_id\":\"2\",\"user_id\":\"\",\"special_ids\":\"\",\"title\":\"13122221111a\",\"image\":\"\",\"images\":\"\",\"tags\":\"\",\"diyname\":\"13122221111a\",\"content\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"price\":\"0\",\"author\":\"\",\"views\":\"0\",\"comments\":\"0\",\"likes\":\"0\",\"dislikes\":\"0\",\"weigh\":\"0\",\"status\":\"normal\",\"isguest\":\"10\",\"iscomment\":\"10\",\"publishtime\":\"2020-08-24 07:14:36\",\"channel_ids\":[\"\"],\"flag\":[\"\"]}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224486),(111,1,'admin','/FgGbQMjdVY.php/cms/archives/get_channel_fields','CMS管理 内容管理','{\"channel_id\":\"2\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224488),(112,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"131\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224490),(113,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"13144\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224491),(114,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"1314444\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224491),(115,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"13144445\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224492),(116,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"1314444555\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224492),(117,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"13144445555\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224492),(118,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"131444455551\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224493),(119,1,'admin','/FgGbQMjdVY.php/cms/archives/check_element_available','CMS管理 内容管理','{\"name\":\"row[diyname]\",\"value\":\"131444455551a\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224494),(120,1,'admin','/FgGbQMjdVY.php/cms/archives/add?channel=&dialog=1','CMS管理 内容管理 添加','{\"channel\":\"\",\"dialog\":\"1\",\"row\":{\"style\":\"\",\"channel_id\":\"2\",\"user_id\":\"\",\"special_ids\":\"\",\"title\":\"131444455551\",\"image\":\"\",\"images\":\"\",\"tags\":\"\",\"diyname\":\"131444455551a\",\"content\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"price\":\"0\",\"author\":\"\",\"views\":\"0\",\"comments\":\"0\",\"likes\":\"0\",\"dislikes\":\"0\",\"weigh\":\"0\",\"status\":\"normal\",\"isguest\":\"10\",\"iscomment\":\"10\",\"publishtime\":\"2020-08-24 07:14:48\",\"channel_ids\":[\"\"],\"flag\":[\"\"]}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224495),(121,1,'admin','/FgGbQMjdVY.php/cms/archives/get_channel_fields','CMS管理 内容管理','{\"channel_id\":\"2\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224497),(122,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"131\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224499),(123,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"13155\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224499),(124,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"1315565\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224499),(125,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"13155655\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224500),(126,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"131556556666\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224500),(127,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"131556556666a\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224501),(128,1,'admin','/FgGbQMjdVY.php/cms/archives/check_element_available','CMS管理 内容管理','{\"name\":\"row[diyname]\",\"value\":\"131556556666a\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224502),(129,1,'admin','/FgGbQMjdVY.php/cms/archives/add?channel=&dialog=1','CMS管理 内容管理 添加','{\"channel\":\"\",\"dialog\":\"1\",\"row\":{\"style\":\"\",\"channel_id\":\"2\",\"user_id\":\"\",\"special_ids\":\"\",\"title\":\"131556556666a\",\"image\":\"\",\"images\":\"\",\"tags\":\"\",\"diyname\":\"131556556666a\",\"content\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"price\":\"0\",\"author\":\"\",\"views\":\"0\",\"comments\":\"0\",\"likes\":\"0\",\"dislikes\":\"0\",\"weigh\":\"0\",\"status\":\"normal\",\"isguest\":\"10\",\"iscomment\":\"10\",\"publishtime\":\"2020-08-24 07:14:57\",\"channel_ids\":[\"\"],\"flag\":[\"\"]}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598224503),(130,1,'admin','/FgGbQMjdVY.php/cms/archives/get_channel_fields','CMS管理 内容管理','{\"channel_id\":\"2\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598225118),(131,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"1\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598225123),(132,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"11\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598225123),(133,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"111\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598225124),(134,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"1111\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598225124),(135,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"11113333\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598225125),(136,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"111133331313\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598225125),(137,1,'admin','/FgGbQMjdVY.php/cms/archives/check_element_available','CMS管理 内容管理','{\"name\":\"row[diyname]\",\"value\":\"111133331313a\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598225127),(138,1,'admin','/FgGbQMjdVY.php/cms/archives/add?channel=&dialog=1','CMS管理 内容管理 添加','{\"channel\":\"\",\"dialog\":\"1\",\"row\":{\"style\":\"\",\"channel_id\":\"2\",\"user_id\":\"\",\"special_ids\":\"\",\"title\":\"111133331313\",\"image\":\"\",\"images\":\"\",\"tags\":\"\",\"diyname\":\"111133331313a\",\"content\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"price\":\"0\",\"author\":\"\",\"views\":\"0\",\"comments\":\"0\",\"likes\":\"0\",\"dislikes\":\"0\",\"weigh\":\"0\",\"status\":\"normal\",\"isguest\":\"10\",\"iscomment\":\"10\",\"publishtime\":\"2020-08-24 07:25:18\",\"channel_ids\":[\"\"],\"flag\":[\"\"]}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598225128),(139,1,'admin','/FgGbQMjdVY.php/cms/archives/get_channel_fields','CMS管理 内容管理','{\"channel_id\":\"2\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598225130),(140,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"131\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598225139),(141,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"131444\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598225140),(142,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"1314444\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598225140),(143,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"13144444444\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598225141),(144,1,'admin','/FgGbQMjdVY.php/cms/archives/check_element_available','CMS管理 内容管理','{\"name\":\"row[diyname]\",\"value\":\"13144444444a\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598225148),(145,1,'admin','/FgGbQMjdVY.php/cms/archives/check_element_available','CMS管理 内容管理','{\"name\":\"row[diyname]\",\"value\":\"13144444444ab\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598225153),(146,1,'admin','/FgGbQMjdVY.php/cms/archives/add?channel=&dialog=1','CMS管理 内容管理 添加','{\"channel\":\"\",\"dialog\":\"1\",\"row\":{\"style\":\"\",\"channel_id\":\"2\",\"user_id\":\"\",\"special_ids\":\"\",\"title\":\"13144444444\",\"image\":\"\",\"images\":\"\",\"tags\":\"\",\"diyname\":\"13144444444ab\",\"content\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"price\":\"0\",\"author\":\"\",\"views\":\"0\",\"comments\":\"0\",\"likes\":\"0\",\"dislikes\":\"0\",\"weigh\":\"0\",\"status\":\"normal\",\"isguest\":\"10\",\"iscomment\":\"10\",\"publishtime\":\"2020-08-24 07:25:30\",\"channel_ids\":[\"\"],\"flag\":[\"\"]}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598225153),(147,1,'admin','/FgGbQMjdVY.php/cms/archives/get_channel_fields','CMS管理 内容管理','{\"channel_id\":\"2\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598225164),(148,1,'admin','/FgGbQMjdVY.php/user/user/index','会员管理 会员管理 查看','{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"nickname\",\"keyField\":\"id\",\"searchField\":[\"nickname\"],\"nickname\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598225165),(149,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"1\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598225167),(150,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"13\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598225168),(151,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"134\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598225168),(152,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"1345\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598225168),(153,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"1345555\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598225169),(154,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"13455555555\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598225170),(155,1,'admin','/FgGbQMjdVY.php/cms/archives/check_element_available','CMS管理 内容管理','{\"name\":\"row[diyname]\",\"value\":\"13455555555a\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598225171),(156,1,'admin','/FgGbQMjdVY.php/cms/archives/add?channel=&dialog=1','CMS管理 内容管理 添加','{\"channel\":\"\",\"dialog\":\"1\",\"row\":{\"style\":\"\",\"channel_id\":\"2\",\"user_id\":\"\",\"special_ids\":\"\",\"title\":\"13455555555\",\"image\":\"\",\"images\":\"\",\"tags\":\"\",\"diyname\":\"13455555555a\",\"content\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"price\":\"0\",\"author\":\"\",\"views\":\"0\",\"comments\":\"0\",\"likes\":\"0\",\"dislikes\":\"0\",\"weigh\":\"0\",\"status\":\"normal\",\"isguest\":\"10\",\"iscomment\":\"10\",\"publishtime\":\"2020-08-24 07:26:04\",\"channel_ids\":[\"\"],\"flag\":[\"\"]}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598225172),(157,1,'admin','/FgGbQMjdVY.php/cms/archives/get_channel_fields','CMS管理 内容管理','{\"channel_id\":\"2\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598225173),(158,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"1\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598225175),(159,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"14\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598225176),(160,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"145\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598225176),(161,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"14566666666\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598225178),(162,1,'admin','/FgGbQMjdVY.php/cms/archives/check_element_available','CMS管理 内容管理','{\"name\":\"row[diyname]\",\"value\":\"14566666666a\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598225180),(163,1,'admin','/FgGbQMjdVY.php/cms/archives/add?channel=&dialog=1','CMS管理 内容管理 添加','{\"channel\":\"\",\"dialog\":\"1\",\"row\":{\"style\":\"\",\"channel_id\":\"2\",\"user_id\":\"\",\"special_ids\":\"\",\"title\":\"14566666666\",\"image\":\"\",\"images\":\"\",\"tags\":\"\",\"diyname\":\"14566666666a\",\"content\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"price\":\"0\",\"author\":\"\",\"views\":\"0\",\"comments\":\"0\",\"likes\":\"0\",\"dislikes\":\"0\",\"weigh\":\"0\",\"status\":\"normal\",\"isguest\":\"10\",\"iscomment\":\"10\",\"publishtime\":\"2020-08-24 07:26:13\",\"channel_ids\":[\"\"],\"flag\":[\"\"]}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598225181),(164,1,'admin','/FgGbQMjdVY.php/cms/archives/get_channel_fields','CMS管理 内容管理','{\"channel_id\":\"2\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598225193),(165,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"13\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598225196),(166,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"135\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598225196),(167,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"1357\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598225197),(168,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"1357777\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598225198),(169,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"13577777777\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598225198),(170,1,'admin','/FgGbQMjdVY.php/cms/archives/check_element_available','CMS管理 内容管理','{\"name\":\"row[diyname]\",\"value\":\"13577777777a\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598225200),(171,1,'admin','/FgGbQMjdVY.php/cms/archives/add?channel=&dialog=1','CMS管理 内容管理 添加','{\"channel\":\"\",\"dialog\":\"1\",\"row\":{\"style\":\"\",\"channel_id\":\"2\",\"user_id\":\"\",\"special_ids\":\"\",\"title\":\"13577777777\",\"image\":\"\",\"images\":\"\",\"tags\":\"\",\"diyname\":\"13577777777a\",\"content\":\"a\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"price\":\"0\",\"author\":\"\",\"views\":\"0\",\"comments\":\"0\",\"likes\":\"0\",\"dislikes\":\"0\",\"weigh\":\"0\",\"status\":\"normal\",\"isguest\":\"10\",\"iscomment\":\"10\",\"publishtime\":\"2020-08-24 07:26:33\",\"channel_ids\":[\"\"],\"flag\":[\"\"]}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598225205),(172,1,'admin','/FgGbQMjdVY.php/cms/config?addtabs=1','CMS管理 站点配置 修改','{\"addtabs\":\"1\",\"row\":{\"system_user_id\":\"1\",\"sitename\":\"\\u6211\\u7684CMS\\u7f51\\u7ad9\",\"sitelogo\":\"\\/assets\\/addons\\/cms\\/img\\/logo.png\",\"title\":\"\",\"keywords\":\"\",\"description\":\"\",\"theme\":\"default\",\"qrcode\":\"\\/assets\\/addons\\/cms\\/img\\/qrcode.png\",\"wxapp\":\"\\/assets\\/addons\\/cms\\/img\\/qrcode.png\",\"donateimage\":\"\\/assets\\/addons\\/cms\\/img\\/qrcode.png\",\"default_archives_img\":\"\\/assets\\/addons\\/cms\\/img\\/noimage.jpg\",\"default_channel_img\":\"\\/assets\\/addons\\/cms\\/img\\/noimage.jpg\",\"default_block_img\":\"\\/assets\\/addons\\/cms\\/img\\/noimage.jpg\",\"default_page_img\":\"\\/assets\\/addons\\/cms\\/img\\/noimage.jpg\",\"default_special_img\":\"\\/assets\\/addons\\/cms\\/img\\/noimage.jpg\",\"downloadtype\":\"{&quot;baidu&quot;:&quot;\\\\u767e\\\\u5ea6\\\\u7f51\\\\u76d8&quot;,&quot;local&quot;:&quot;\\\\u672c\\\\u5730&quot;,&quot;other&quot;:&quot;\\\\u5176\\\\u5b83&quot;}\",\"archivesratio\":\"1:0\",\"score\":\"{&quot;postarchives&quot;:0,&quot;postcomment&quot;:0}\",\"limitscore\":\"{&quot;postarchives&quot;:0,&quot;postcomment&quot;:0}\",\"userpage\":\"1\",\"domain\":\"\",\"rewrite\":\"{&quot;index\\\\\\/index&quot;:&quot;\\\\\\/cms\\\\\\/$&quot;,&quot;tags\\\\\\/index&quot;:&quot;\\\\\\/cms\\\\\\/t\\\\\\/[:name]$&quot;,&quot;page\\\\\\/index&quot;:&quot;\\\\\\/cms\\\\\\/p\\\\\\/[:diyname]$&quot;,&quot;search\\\\\\/index&quot;:&quot;\\\\\\/cms\\\\\\/s$&quot;,&quot;diyform\\\\\\/index&quot;:&quot;\\\\\\/cms\\\\\\/d\\\\\\/[:diyname]&quot;,&quot;special\\\\\\/index&quot;:&quot;\\\\\\/cms\\\\\\/special\\\\\\/[:diyname]&quot;,&quot;archives\\\\\\/index&quot;:&quot;\\\\\\/cms\\\\\\/a\\\\\\/[:diyname]$&quot;,&quot;channel\\\\\\/index&quot;:&quot;\\\\\\/cms\\\\\\/c\\\\\\/[:diyname]$&quot;,&quot;user\\\\\\/index&quot;:&quot;\\\\\\/u\\\\\\/[:id]&quot;}\",\"wxappid\":\"\",\"wxappsecret\":\"\",\"ispaylogin\":\"1\",\"paytypelist\":[\"wechat\",\"alipay\",\"balance\"],\"defaultpaytype\":\"balance\",\"isarchivesaudit\":\"1\",\"iscommentaudit\":\"-1\",\"audittype\":\"local\",\"nlptype\":\"local\",\"aip_appid\":\"\",\"aip_apikey\":\"\",\"aip_secretkey\":\"\",\"apikey\":\"\",\"archiveseditmode\":\"dialog\",\"auditnotice\":\"none\",\"noticetemplateid\":\"1\",\"channelallocate\":\"0\",\"archivesdatalimit\":\"all\",\"specialdatalimit\":\"all\",\"pagedatalimit\":\"all\",\"diyformdatalimit\":\"all\",\"contactqq\":\"\",\"autolinks\":\"{&quot;\\\\u670d\\\\u52a1\\\\u5668&quot;:&quot;https:\\\\\\/\\\\\\/www.fastadmin.net\\\\\\/go\\\\\\/aliyun&quot;,&quot;\\\\u963f\\\\u91cc\\\\u4e91&quot;:&quot;https:\\\\\\/\\\\\\/www.fastadmin.net\\\\\\/go\\\\\\/aliyun&quot;}\",\"searchtype\":\"local\",\"autopinyin\":\"1\",\"baidupush\":\"0\",\"usersidenav\":[\"myarchives\",\"postarchives\",\"myorder\",\"mycomment\"],\"loadmode\":\"paging\",\"pagemode\":\"full\",\"cachelifetime\":\"true\",\"flagtype\":\"{&quot;hot&quot;:&quot;\\\\u70ed\\\\u95e8&quot;,&quot;new&quot;:&quot;\\\\u65b0&quot;,&quot;recommend&quot;:&quot;\\\\u63a8\\\\u8350&quot;,&quot;top&quot;:&quot;\\\\u7f6e\\\\u9876&quot;}\",\"urlsuffix\":\"html\"}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598227128),(173,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_template_list','CMS管理','{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"list_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"list_news.html\",\"searchField\":[\"name\"],\"type\":\"list\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598227702),(174,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_template_list','CMS管理','{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"show_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"show_news.html\",\"searchField\":[\"name\"],\"type\":\"show\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598227702),(175,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"\\u4e2d\\u56fd\\u5927\\u9646\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598227705),(176,1,'admin','/FgGbQMjdVY.php/cms/channel/check_element_available','CMS管理 栏目管理','{\"id\":\"\\u4e2d\\u56fd\\u5927\\u9646\",\"name\":\"row[name]\",\"value\":\"\\u4e2d\\u56fd\\u5927\\u9646\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598227708),(177,1,'admin','/FgGbQMjdVY.php/cms/channel/check_element_available','CMS管理 栏目管理','{\"name\":\"row[diyname]\",\"value\":\"zhongguodalu\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598227708),(178,1,'admin','/FgGbQMjdVY.php/cms/channel/add?dialog=1','CMS管理 栏目管理 添加','{\"dialog\":\"1\",\"row\":{\"type\":\"list\",\"model_id\":\"1\",\"parent_id\":\"0\",\"name\":\"\\u4e2d\\u56fd\\u5927\\u9646\",\"image\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"diyname\":\"zhongguodalu\",\"outlink\":\"\",\"channeltpl\":\"\",\"listtpl\":\"list_news.html\",\"showtpl\":\"show_news.html\",\"pagesize\":\"10\",\"status\":\"normal\"}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598227708),(179,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_template_list','CMS管理','{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"list_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"list_news.html\",\"searchField\":[\"name\"],\"type\":\"list\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598227710),(180,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_template_list','CMS管理','{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"show_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"show_news.html\",\"searchField\":[\"name\"],\"type\":\"show\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598227710),(181,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"z\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598227713),(182,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"\\u4e2d\\u56fd\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598227715),(183,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"\\u4e2d\\u56fd\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598227716),(184,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"\\u4e2d\\u56fd\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598227716),(185,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"\\u4e2d\\u56fd\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598227717),(186,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"\\u4e2d\\u56fd\\u6e2f\\u6fb3\\u53f0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598227717),(187,1,'admin','/FgGbQMjdVY.php/cms/channel/check_element_available','CMS管理 栏目管理','{\"id\":\"\\u4e2d\\u56fd\\u6e2f\\u6fb3\\u53f0\",\"name\":\"row[name]\",\"value\":\"\\u4e2d\\u56fd\\u6e2f\\u6fb3\\u53f0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598227718),(188,1,'admin','/FgGbQMjdVY.php/cms/channel/check_element_available','CMS管理 栏目管理','{\"name\":\"row[diyname]\",\"value\":\"zhongguogangaotai\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598227718),(189,1,'admin','/FgGbQMjdVY.php/cms/channel/add?dialog=1','CMS管理 栏目管理 添加','{\"dialog\":\"1\",\"row\":{\"type\":\"list\",\"model_id\":\"1\",\"parent_id\":\"0\",\"name\":\"\\u4e2d\\u56fd\\u6e2f\\u6fb3\\u53f0\",\"image\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"diyname\":\"zhongguogangaotai\",\"outlink\":\"\",\"channeltpl\":\"\",\"listtpl\":\"list_news.html\",\"showtpl\":\"show_news.html\",\"pagesize\":\"10\",\"status\":\"normal\"}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598227719),(190,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_template_list','CMS管理','{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"list_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"list_news.html\",\"searchField\":[\"name\"],\"type\":\"list\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598227732),(191,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_template_list','CMS管理','{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"show_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"show_news.html\",\"searchField\":[\"name\"],\"type\":\"show\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598227732),(192,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"\\u7f8e\\u56fd\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598227738),(193,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"\\u7f8e\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598227741),(194,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"\\u82f1\\u56fd\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598227743),(195,1,'admin','/FgGbQMjdVY.php/cms/channel/check_element_available','CMS管理 栏目管理','{\"id\":\"\\u82f1\\u56fd\",\"name\":\"row[name]\",\"value\":\"\\u82f1\\u56fd\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598227744),(196,1,'admin','/FgGbQMjdVY.php/cms/channel/check_element_available','CMS管理 栏目管理','{\"name\":\"row[diyname]\",\"value\":\"yingguo\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598227744),(197,1,'admin','/FgGbQMjdVY.php/cms/channel/add?dialog=1','CMS管理 栏目管理 添加','{\"dialog\":\"1\",\"row\":{\"type\":\"list\",\"model_id\":\"1\",\"parent_id\":\"0\",\"name\":\"\\u82f1\\u56fd\",\"image\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"diyname\":\"yingguo\",\"outlink\":\"\",\"channeltpl\":\"\",\"listtpl\":\"list_news.html\",\"showtpl\":\"show_news.html\",\"pagesize\":\"10\",\"status\":\"normal\"}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598227744),(198,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_template_list','CMS管理','{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"list_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"list_news.html\",\"searchField\":[\"name\"],\"type\":\"list\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598227746),(199,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_template_list','CMS管理','{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"show_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"show_news.html\",\"searchField\":[\"name\"],\"type\":\"show\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598227746),(200,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"\\u5fb7\\u56fd\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598227749),(201,1,'admin','/FgGbQMjdVY.php/cms/channel/check_element_available','CMS管理 栏目管理','{\"id\":\"\\u5fb7\\u56fd\",\"name\":\"row[name]\",\"value\":\"\\u5fb7\\u56fd\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598227750),(202,1,'admin','/FgGbQMjdVY.php/cms/channel/check_element_available','CMS管理 栏目管理','{\"name\":\"row[diyname]\",\"value\":\"deguo\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598227750),(203,1,'admin','/FgGbQMjdVY.php/cms/channel/add?dialog=1','CMS管理 栏目管理 添加','{\"dialog\":\"1\",\"row\":{\"type\":\"list\",\"model_id\":\"1\",\"parent_id\":\"0\",\"name\":\"\\u5fb7\\u56fd\",\"image\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"diyname\":\"deguo\",\"outlink\":\"\",\"channeltpl\":\"\",\"listtpl\":\"list_news.html\",\"showtpl\":\"show_news.html\",\"pagesize\":\"10\",\"status\":\"normal\"}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598227751),(204,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_template_list','CMS管理','{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"show_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"show_news.html\",\"searchField\":[\"name\"],\"type\":\"show\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598227752),(205,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_template_list','CMS管理','{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"list_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"list_news.html\",\"searchField\":[\"name\"],\"type\":\"list\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598227752),(206,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"\\u6fb3\\u5927\\u5229\\u4e9a\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598227757),(207,1,'admin','/FgGbQMjdVY.php/cms/channel/check_element_available','CMS管理 栏目管理','{\"id\":\"\\u6fb3\\u5927\\u5229\\u4e9a\",\"name\":\"row[name]\",\"value\":\"\\u6fb3\\u5927\\u5229\\u4e9a\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598227758),(208,1,'admin','/FgGbQMjdVY.php/cms/channel/check_element_available','CMS管理 栏目管理','{\"name\":\"row[diyname]\",\"value\":\"aodaliya\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598227758),(209,1,'admin','/FgGbQMjdVY.php/cms/channel/add?dialog=1','CMS管理 栏目管理 添加','{\"dialog\":\"1\",\"row\":{\"type\":\"list\",\"model_id\":\"1\",\"parent_id\":\"0\",\"name\":\"\\u6fb3\\u5927\\u5229\\u4e9a\",\"image\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"diyname\":\"aodaliya\",\"outlink\":\"\",\"channeltpl\":\"\",\"listtpl\":\"list_news.html\",\"showtpl\":\"show_news.html\",\"pagesize\":\"10\",\"status\":\"normal\"}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598227758),(210,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_template_list','CMS管理','{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"show_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"show_news.html\",\"searchField\":[\"name\"],\"type\":\"show\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598227759),(211,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_template_list','CMS管理','{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"list_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"list_news.html\",\"searchField\":[\"name\"],\"type\":\"list\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598227760),(212,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"\\u4fc4\\u7f57\\u65af\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598227763),(213,1,'admin','/FgGbQMjdVY.php/cms/channel/check_element_available','CMS管理 栏目管理','{\"id\":\"\\u4fc4\\u7f57\\u65af\",\"name\":\"row[name]\",\"value\":\"\\u4fc4\\u7f57\\u65af\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598227763),(214,1,'admin','/FgGbQMjdVY.php/cms/channel/check_element_available','CMS管理 栏目管理','{\"name\":\"row[diyname]\",\"value\":\"eluosi\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598227764),(215,1,'admin','/FgGbQMjdVY.php/cms/channel/add?dialog=1','CMS管理 栏目管理 添加','{\"dialog\":\"1\",\"row\":{\"type\":\"list\",\"model_id\":\"1\",\"parent_id\":\"0\",\"name\":\"\\u4fc4\\u7f57\\u65af\",\"image\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"diyname\":\"eluosi\",\"outlink\":\"\",\"channeltpl\":\"\",\"listtpl\":\"list_news.html\",\"showtpl\":\"show_news.html\",\"pagesize\":\"10\",\"status\":\"normal\"}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598227764),(216,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_template_list','CMS管理','{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"list_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"list_news.html\",\"searchField\":[\"name\"],\"type\":\"list\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598227765),(217,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_template_list','CMS管理','{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"show_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"show_news.html\",\"searchField\":[\"name\"],\"type\":\"show\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598227765),(218,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"\\u4e1c\\u5357\\u4e9a\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598227769),(219,1,'admin','/FgGbQMjdVY.php/cms/channel/check_element_available','CMS管理 栏目管理','{\"id\":\"\\u4e1c\\u5357\\u4e9a\",\"name\":\"row[name]\",\"value\":\"\\u4e1c\\u5357\\u4e9a\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598227770),(220,1,'admin','/FgGbQMjdVY.php/cms/channel/check_element_available','CMS管理 栏目管理','{\"name\":\"row[diyname]\",\"value\":\"dongnanya\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598227771),(221,1,'admin','/FgGbQMjdVY.php/cms/channel/add?dialog=1','CMS管理 栏目管理 添加','{\"dialog\":\"1\",\"row\":{\"type\":\"list\",\"model_id\":\"1\",\"parent_id\":\"0\",\"name\":\"\\u4e1c\\u5357\\u4e9a\",\"image\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"diyname\":\"dongnanya\",\"outlink\":\"\",\"channeltpl\":\"\",\"listtpl\":\"list_news.html\",\"showtpl\":\"show_news.html\",\"pagesize\":\"10\",\"status\":\"normal\"}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598227771),(222,1,'admin','/FgGbQMjdVY.php/cms/archives/get_channel_fields','CMS管理 内容管理','{\"channel_id\":\"2\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598227803),(223,1,'admin','/FgGbQMjdVY.php/user/user/index','会员管理 会员管理 查看','{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"nickname\",\"keyField\":\"id\",\"searchField\":[\"nickname\"],\"nickname\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598227804),(224,1,'admin','/FgGbQMjdVY.php/cms/archives/get_channel_fields','CMS管理 内容管理','{\"channel_id\":\"9\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598227808),(225,1,'admin','/FgGbQMjdVY.php/user/user/index','会员管理 会员管理 查看','{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"nickname\",\"keyField\":\"id\",\"searchField\":[\"nickname\"],\"nickname\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598227809),(226,1,'admin','/FgGbQMjdVY.php/user/user/index','会员管理 会员管理 查看','{\"q_word\":[\"1\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"nickname\",\"keyField\":\"id\",\"searchField\":[\"nickname\"],\"nickname\":\"1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598227810),(227,1,'admin','/FgGbQMjdVY.php/user/user/index','会员管理 会员管理 查看','{\"q_word\":[\"1\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"nickname\",\"keyField\":\"id\",\"searchField\":[\"nickname\"],\"nickname\":\"1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598227811),(228,1,'admin','/FgGbQMjdVY.php/user/user/index','会员管理 会员管理 查看','{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"nickname\",\"keyField\":\"id\",\"searchField\":[\"nickname\"],\"nickname\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598227812),(229,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"131\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598227813),(230,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"1315\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598227813),(231,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"131555\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598227814),(232,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_title_pinyin','CMS管理','{\"title\":\"13155555555\",\"delimiter\":\"-\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598227815),(233,1,'admin','/FgGbQMjdVY.php/cms/archives/check_element_available','CMS管理 内容管理','{\"name\":\"row[diyname]\",\"value\":\"13155555555a\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598227820),(234,1,'admin','/FgGbQMjdVY.php/cms/archives/add?channel=&dialog=1','CMS管理 内容管理 添加','{\"channel\":\"\",\"dialog\":\"1\",\"row\":{\"style\":\"\",\"channel_id\":\"9\",\"user_id\":\"\",\"special_ids\":\"\",\"title\":\"13155555555\",\"image\":\"\",\"images\":\"\",\"tags\":\"\",\"diyname\":\"13155555555a\",\"content\":\"a\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"price\":\"0\",\"author\":\"\",\"views\":\"0\",\"comments\":\"0\",\"likes\":\"0\",\"dislikes\":\"0\",\"weigh\":\"0\",\"status\":\"normal\",\"isguest\":\"10\",\"iscomment\":\"10\",\"publishtime\":\"2020-08-24 08:10:03\",\"channel_ids\":[\"\"],\"flag\":[\"\"]}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598227831),(235,1,'admin','/FgGbQMjdVY.php/auth/rule/multi/ids/4','权限管理 菜单规则','{\"action\":\"\",\"ids\":\"4\",\"params\":\"ismenu=0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598231020),(236,1,'admin','/FgGbQMjdVY.php/index/index','','{\"action\":\"refreshmenu\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598231021),(237,1,'admin','/FgGbQMjdVY.php/auth/rule/edit/ids/85?dialog=1','权限管理 菜单规则 编辑','{\"dialog\":\"1\",\"__token__\":\"b6bdb7c6f7cf5875c5e96223b1b760e2\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"cms\",\"title\":\"\\u77ed\\u4fe1\\u7ba1\\u7406\",\"icon\":\"fa fa-list\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"85\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598231040),(238,1,'admin','/FgGbQMjdVY.php/index/index','','{\"action\":\"refreshmenu\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598231040),(239,1,'admin','/FgGbQMjdVY.php/auth/rule/del/ids/3','权限管理 菜单规则 删除','{\"action\":\"del\",\"ids\":\"3\",\"params\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598231046),(240,1,'admin','/FgGbQMjdVY.php/index/index','','{\"action\":\"refreshmenu\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598231046),(241,1,'admin','/FgGbQMjdVY.php/auth/rule/del/ids/66','权限管理 菜单规则 删除','{\"action\":\"del\",\"ids\":\"66\",\"params\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598231060),(242,1,'admin','/FgGbQMjdVY.php/index/index','','{\"action\":\"refreshmenu\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598231060),(243,1,'admin','/FgGbQMjdVY.php/auth/rule/del/ids/170','权限管理 菜单规则 删除','{\"action\":\"del\",\"ids\":\"170\",\"params\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598231088),(244,1,'admin','/FgGbQMjdVY.php/index/index','','{\"action\":\"refreshmenu\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598231088),(245,1,'admin','/FgGbQMjdVY.php/auth/rule/del/ids/164','权限管理 菜单规则 删除','{\"action\":\"del\",\"ids\":\"164\",\"params\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598231091),(246,1,'admin','/FgGbQMjdVY.php/index/index','','{\"action\":\"refreshmenu\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598231092),(247,1,'admin','/FgGbQMjdVY.php/auth/rule/edit/ids/142?dialog=1','权限管理 菜单规则 编辑','{\"dialog\":\"1\",\"__token__\":\"45ad551ce969d9430ac3e8341adcd607\",\"row\":{\"ismenu\":\"1\",\"pid\":\"85\",\"name\":\"cms\\/comment\",\"title\":\"\\u77ed\\u4fe1\\u5185\\u5bb9\\u7ba1\\u7406\",\"icon\":\"fa fa-comment\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\\u7528\\u4e8e\\u7ba1\\u7406\\u7528\\u6237\\u5728\\u7f51\\u7ad9\\u4e0a\\u53d1\\u8868\\u7684\\u8bc4\\u8bba\\uff0c\\u53ef\\u4efb\\u610f\\u4fee\\u6539\\u6216\\u9690\\u85cf\\u8bc4\\u8bba\",\"status\":\"normal\"},\"ids\":\"142\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598231109),(248,1,'admin','/FgGbQMjdVY.php/index/index','','{\"action\":\"refreshmenu\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598231110),(249,1,'admin','/FgGbQMjdVY.php/auth/rule/del/ids/127','权限管理 菜单规则 删除','{\"action\":\"del\",\"ids\":\"127\",\"params\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598231115),(250,1,'admin','/FgGbQMjdVY.php/index/index','','{\"action\":\"refreshmenu\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598231115),(251,1,'admin','/FgGbQMjdVY.php/cms/config?addtabs=1','短信管理 站点配置 修改','{\"addtabs\":\"1\",\"row\":{\"system_user_id\":\"1\",\"sitename\":\"\\u77ed\\u4fe1\\u53d1\\u7801\\u5e73\\u53f0\",\"sitelogo\":\"\\/assets\\/addons\\/cms\\/img\\/logo.png\",\"title\":\"\",\"keywords\":\"\",\"description\":\"\",\"theme\":\"default\",\"qrcode\":\"\\/assets\\/addons\\/cms\\/img\\/qrcode.png\",\"wxapp\":\"\\/assets\\/addons\\/cms\\/img\\/qrcode.png\",\"donateimage\":\"\\/assets\\/addons\\/cms\\/img\\/qrcode.png\",\"default_archives_img\":\"\\/assets\\/addons\\/cms\\/img\\/noimage.jpg\",\"default_channel_img\":\"\\/assets\\/addons\\/cms\\/img\\/noimage.jpg\",\"default_block_img\":\"\\/assets\\/addons\\/cms\\/img\\/noimage.jpg\",\"default_page_img\":\"\\/assets\\/addons\\/cms\\/img\\/noimage.jpg\",\"default_special_img\":\"\\/assets\\/addons\\/cms\\/img\\/noimage.jpg\",\"downloadtype\":\"{&quot;baidu&quot;:&quot;\\\\u767e\\\\u5ea6\\\\u7f51\\\\u76d8&quot;,&quot;local&quot;:&quot;\\\\u672c\\\\u5730&quot;,&quot;other&quot;:&quot;\\\\u5176\\\\u5b83&quot;}\",\"archivesratio\":\"1:0\",\"score\":\"{&quot;postarchives&quot;:0,&quot;postcomment&quot;:0}\",\"limitscore\":\"{&quot;postarchives&quot;:0,&quot;postcomment&quot;:0}\",\"userpage\":\"1\",\"domain\":\"\",\"rewrite\":\"{&quot;index\\\\\\/index&quot;:&quot;\\\\\\/cms\\\\\\/$&quot;,&quot;tags\\\\\\/index&quot;:&quot;\\\\\\/cms\\\\\\/t\\\\\\/[:name]$&quot;,&quot;page\\\\\\/index&quot;:&quot;\\\\\\/cms\\\\\\/p\\\\\\/[:diyname]$&quot;,&quot;search\\\\\\/index&quot;:&quot;\\\\\\/cms\\\\\\/s$&quot;,&quot;diyform\\\\\\/index&quot;:&quot;\\\\\\/cms\\\\\\/d\\\\\\/[:diyname]&quot;,&quot;special\\\\\\/index&quot;:&quot;\\\\\\/cms\\\\\\/special\\\\\\/[:diyname]&quot;,&quot;archives\\\\\\/index&quot;:&quot;\\\\\\/cms\\\\\\/a\\\\\\/[:diyname]$&quot;,&quot;channel\\\\\\/index&quot;:&quot;\\\\\\/cms\\\\\\/c\\\\\\/[:diyname]$&quot;,&quot;user\\\\\\/index&quot;:&quot;\\\\\\/u\\\\\\/[:id]&quot;}\",\"wxappid\":\"\",\"wxappsecret\":\"\",\"ispaylogin\":\"1\",\"paytypelist\":[\"wechat\",\"alipay\",\"balance\"],\"defaultpaytype\":\"balance\",\"isarchivesaudit\":\"1\",\"iscommentaudit\":\"-1\",\"audittype\":\"local\",\"nlptype\":\"local\",\"aip_appid\":\"\",\"aip_apikey\":\"\",\"aip_secretkey\":\"\",\"apikey\":\"\",\"archiveseditmode\":\"dialog\",\"auditnotice\":\"none\",\"noticetemplateid\":\"1\",\"channelallocate\":\"0\",\"archivesdatalimit\":\"all\",\"specialdatalimit\":\"all\",\"pagedatalimit\":\"all\",\"diyformdatalimit\":\"all\",\"contactqq\":\"\",\"autolinks\":\"{&quot;\\\\u670d\\\\u52a1\\\\u5668&quot;:&quot;https:\\\\\\/\\\\\\/www.fastadmin.net\\\\\\/go\\\\\\/aliyun&quot;,&quot;\\\\u963f\\\\u91cc\\\\u4e91&quot;:&quot;https:\\\\\\/\\\\\\/www.fastadmin.net\\\\\\/go\\\\\\/aliyun&quot;}\",\"searchtype\":\"local\",\"autopinyin\":\"1\",\"baidupush\":\"0\",\"usersidenav\":[\"myarchives\",\"postarchives\",\"myorder\",\"mycomment\"],\"loadmode\":\"paging\",\"pagemode\":\"full\",\"cachelifetime\":\"true\",\"flagtype\":\"{&quot;hot&quot;:&quot;\\\\u70ed\\\\u95e8&quot;,&quot;new&quot;:&quot;\\\\u65b0&quot;,&quot;recommend&quot;:&quot;\\\\u63a8\\\\u8350&quot;,&quot;top&quot;:&quot;\\\\u7f6e\\\\u9876&quot;}\",\"urlsuffix\":\"html\"}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598231141),(252,1,'admin','/FgGbQMjdVY.php/cms/channel/multi/ids/2','短信管理 栏目管理 批量更新','{\"action\":\"\",\"ids\":\"2\",\"params\":\"weigh=100\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598231316),(253,1,'admin','/FgGbQMjdVY.php/cms/channel/del/ids/1','短信管理 栏目管理 删除','{\"action\":\"del\",\"ids\":\"1\",\"params\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598231324),(254,1,'admin','/FgGbQMjdVY.php/cms/channel/multi/ids/3','短信管理 栏目管理 批量更新','{\"action\":\"\",\"ids\":\"3\",\"params\":\"weigh=99\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598231327),(255,1,'admin','/FgGbQMjdVY.php/cms/channel/multi/ids/4','短信管理 栏目管理 批量更新','{\"action\":\"\",\"ids\":\"4\",\"params\":\"weigh=98\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598231333),(256,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_template_list','短信管理','{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"list_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"list_news.html\",\"searchField\":[\"name\"],\"type\":\"list\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598231339),(257,1,'admin','/FgGbQMjdVY.php/cms/ajax/get_template_list','短信管理','{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"show_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"show_news.html\",\"searchField\":[\"name\"],\"type\":\"show\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598231339),(258,1,'admin','/FgGbQMjdVY.php/index/login?url=%2FFgGbQMjdVY.php%2Fcms%2Farchives%3Fref%3Daddtabs','登录','{\"url\":\"\\/FgGbQMjdVY.php\\/cms\\/archives?ref=addtabs\",\"__token__\":\"8d8b1d5a8e431e57af2dc34f13be4875\",\"username\":\"admin\",\"captcha\":\"cpwa\"}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233059),(259,1,'admin','/FgGbQMjdVY.php/cms/fields/edit/model_id/1/ids/5?dialog=1','短信管理 字段管理 修改','{\"dialog\":\"1\",\"row\":{\"model_id\":\"1\",\"diyform_id\":\"0\",\"oldname\":\"author\",\"name\":\"quhao\",\"type\":\"string\",\"decimals\":\"0\",\"minimum\":\"0\",\"maximum\":\"0\",\"title\":\"\\u533a\\u53f7\",\"content\":\"value1|title1\\r\\nvalue2|title2\",\"defaultvalue\":\"\",\"rule\":\"\",\"msg\":\"\",\"ok\":\"\",\"tip\":\"\",\"length\":\"50\",\"isfilter\":\"1\",\"iscontribute\":\"1\",\"extend\":\"\",\"weigh\":\"136\",\"status\":\"normal\"},\"model_id\":\"1\",\"ids\":\"5\"}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233084),(260,1,'admin','/FgGbQMjdVY.php/cms/archives/get_channel_fields','短信管理 内容管理','{\"channel_id\":\"9\",\"archives_id\":\"16\"}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233093),(261,1,'admin','/FgGbQMjdVY.php/user/user/index','','{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"showField\":\"nickname\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"nickname\"]}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233093),(262,1,'admin','/FgGbQMjdVY.php/cms/archives/check_element_available','短信管理 内容管理','{\"id\":\"16\",\"name\":\"row[diyname]\",\"value\":\"13155555555a\"}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233096),(263,1,'admin','/FgGbQMjdVY.php/cms/archives/edit/ids/16?dialog=1','短信管理 内容管理 修改','{\"dialog\":\"1\",\"row\":{\"style\":\"\",\"channel_id\":\"9\",\"user_id\":\"0\",\"special_ids\":\"\",\"title\":\"13155555555\",\"image\":\"\",\"images\":\"\",\"tags\":\"\",\"diyname\":\"13155555555a\",\"content\":\"a\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"price\":\"0.00\",\"quhao\":\"121\",\"views\":\"0\",\"comments\":\"0\",\"likes\":\"0\",\"dislikes\":\"0\",\"weigh\":\"0\",\"status\":\"normal\",\"isguest\":\"10\",\"iscomment\":\"10\",\"createtime\":\"2020-08-24 08:10:31\",\"publishtime\":\"2020-08-24 08:10:03\",\"channel_ids\":[\"\"],\"flag\":[\"\"]},\"ids\":\"16\"}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233096),(264,1,'admin','/FgGbQMjdVY.php/cms/archives/get_channel_fields','短信管理 内容管理','{\"channel_id\":\"2\",\"archives_id\":\"15\"}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233099),(265,1,'admin','/FgGbQMjdVY.php/user/user/index','','{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"showField\":\"nickname\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"nickname\"]}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233100),(266,1,'admin','/FgGbQMjdVY.php/cms/archives/check_element_available','短信管理 内容管理','{\"id\":\"15\",\"name\":\"row[diyname]\",\"value\":\"13577777777a\"}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233101),(267,1,'admin','/FgGbQMjdVY.php/cms/archives/edit/ids/15?dialog=1','短信管理 内容管理 修改','{\"dialog\":\"1\",\"row\":{\"style\":\"\",\"channel_id\":\"2\",\"user_id\":\"0\",\"special_ids\":\"\",\"title\":\"13577777777\",\"image\":\"\",\"images\":\"\",\"tags\":\"\",\"diyname\":\"13577777777a\",\"content\":\"a\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"price\":\"0.00\",\"quhao\":\"133\",\"views\":\"2\",\"comments\":\"0\",\"likes\":\"0\",\"dislikes\":\"0\",\"weigh\":\"0\",\"status\":\"normal\",\"isguest\":\"10\",\"iscomment\":\"10\",\"createtime\":\"2020-08-24 07:26:45\",\"publishtime\":\"2020-08-24 07:26:33\",\"channel_ids\":[\"\"],\"flag\":[\"\"]},\"ids\":\"15\"}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233102),(268,1,'admin','/FgGbQMjdVY.php/cms/archives/get_channel_fields','短信管理 内容管理','{\"channel_id\":\"2\",\"archives_id\":\"14\"}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233104),(269,1,'admin','/FgGbQMjdVY.php/user/user/index','','{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"showField\":\"nickname\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"nickname\"]}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233104),(270,1,'admin','/FgGbQMjdVY.php/cms/archives/check_element_available','短信管理 内容管理','{\"id\":\"14\",\"name\":\"row[diyname]\",\"value\":\"14566666666a\"}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233108),(271,1,'admin','/FgGbQMjdVY.php/cms/archives/edit/ids/14?dialog=1','短信管理 内容管理 修改','{\"dialog\":\"1\",\"row\":{\"style\":\"\",\"channel_id\":\"2\",\"user_id\":\"0\",\"special_ids\":\"\",\"title\":\"14566666666\",\"image\":\"\",\"images\":\"\",\"tags\":\"\",\"diyname\":\"14566666666a\",\"content\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"price\":\"0.00\",\"quhao\":\"532\",\"views\":\"0\",\"comments\":\"0\",\"likes\":\"0\",\"dislikes\":\"0\",\"weigh\":\"0\",\"status\":\"normal\",\"isguest\":\"10\",\"iscomment\":\"10\",\"createtime\":\"2020-08-24 07:26:20\",\"publishtime\":\"2020-08-24 07:26:13\",\"channel_ids\":[\"\"],\"flag\":[\"\"]},\"ids\":\"14\"}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233108),(272,1,'admin','/FgGbQMjdVY.php/cms/archives/get_channel_fields','短信管理 内容管理','{\"channel_id\":\"2\",\"archives_id\":\"13\"}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233110),(273,1,'admin','/FgGbQMjdVY.php/user/user/index','','{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"showField\":\"nickname\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"nickname\"]}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233110),(274,1,'admin','/FgGbQMjdVY.php/cms/archives/check_element_available','短信管理 内容管理','{\"id\":\"13\",\"name\":\"row[diyname]\",\"value\":\"13455555555a\"}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233114),(275,1,'admin','/FgGbQMjdVY.php/cms/archives/edit/ids/13?dialog=1','短信管理 内容管理 修改','{\"dialog\":\"1\",\"row\":{\"style\":\"\",\"channel_id\":\"2\",\"user_id\":\"0\",\"special_ids\":\"\",\"title\":\"13455555555\",\"image\":\"\",\"images\":\"\",\"tags\":\"\",\"diyname\":\"13455555555a\",\"content\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"price\":\"0.00\",\"quhao\":\"556\",\"views\":\"0\",\"comments\":\"0\",\"likes\":\"0\",\"dislikes\":\"0\",\"weigh\":\"0\",\"status\":\"normal\",\"isguest\":\"10\",\"iscomment\":\"10\",\"createtime\":\"2020-08-24 07:26:11\",\"publishtime\":\"2020-08-24 07:26:04\",\"channel_ids\":[\"\"],\"flag\":[\"\"]},\"ids\":\"13\"}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233114),(276,1,'admin','/FgGbQMjdVY.php/cms/archives/get_channel_fields','短信管理 内容管理','{\"channel_id\":\"2\",\"archives_id\":\"12\"}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233116),(277,1,'admin','/FgGbQMjdVY.php/user/user/index','','{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"showField\":\"nickname\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"nickname\"]}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233117),(278,1,'admin','/FgGbQMjdVY.php/cms/archives/check_element_available','短信管理 内容管理','{\"id\":\"12\",\"name\":\"row[diyname]\",\"value\":\"13144444444ab\"}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233119),(279,1,'admin','/FgGbQMjdVY.php/cms/archives/edit/ids/12?dialog=1','短信管理 内容管理 修改','{\"dialog\":\"1\",\"row\":{\"style\":\"\",\"channel_id\":\"2\",\"user_id\":\"0\",\"special_ids\":\"\",\"title\":\"13144444444\",\"image\":\"\",\"images\":\"\",\"tags\":\"\",\"diyname\":\"13144444444ab\",\"content\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"price\":\"0.00\",\"quhao\":\"322\",\"views\":\"0\",\"comments\":\"0\",\"likes\":\"0\",\"dislikes\":\"0\",\"weigh\":\"0\",\"status\":\"normal\",\"isguest\":\"10\",\"iscomment\":\"10\",\"createtime\":\"2020-08-24 07:25:53\",\"publishtime\":\"2020-08-24 07:25:30\",\"channel_ids\":[\"\"],\"flag\":[\"\"]},\"ids\":\"12\"}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233119),(280,1,'admin','/FgGbQMjdVY.php/cms/archives/get_channel_fields','短信管理 内容管理','{\"channel_id\":\"2\",\"archives_id\":\"11\"}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233122),(281,1,'admin','/FgGbQMjdVY.php/user/user/index','','{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"showField\":\"nickname\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"nickname\"]}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233122),(282,1,'admin','/FgGbQMjdVY.php/cms/archives/check_element_available','短信管理 内容管理','{\"id\":\"11\",\"name\":\"row[diyname]\",\"value\":\"111133331313a\"}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233128),(283,1,'admin','/FgGbQMjdVY.php/cms/archives/edit/ids/11?dialog=1','短信管理 内容管理 修改','{\"dialog\":\"1\",\"row\":{\"style\":\"\",\"channel_id\":\"2\",\"user_id\":\"0\",\"special_ids\":\"\",\"title\":\"111133331313\",\"image\":\"\",\"images\":\"\",\"tags\":\"\",\"diyname\":\"111133331313a\",\"content\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"price\":\"0.00\",\"quhao\":\"556\",\"views\":\"0\",\"comments\":\"0\",\"likes\":\"0\",\"dislikes\":\"0\",\"weigh\":\"0\",\"status\":\"normal\",\"isguest\":\"10\",\"iscomment\":\"10\",\"createtime\":\"2020-08-24 07:25:28\",\"publishtime\":\"2020-08-24 07:25:18\",\"channel_ids\":[\"\"],\"flag\":[\"\"]},\"ids\":\"11\"}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233128),(284,1,'admin','/FgGbQMjdVY.php/cms/archives/get_channel_fields','短信管理 内容管理','{\"channel_id\":\"2\",\"archives_id\":\"10\"}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233132),(285,1,'admin','/FgGbQMjdVY.php/user/user/index','','{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"showField\":\"nickname\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"nickname\"]}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233132),(286,1,'admin','/FgGbQMjdVY.php/cms/archives/check_element_available','短信管理 内容管理','{\"id\":\"10\",\"name\":\"row[diyname]\",\"value\":\"131556556666a\"}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233135),(287,1,'admin','/FgGbQMjdVY.php/cms/archives/edit/ids/10?dialog=1','短信管理 内容管理 修改','{\"dialog\":\"1\",\"row\":{\"style\":\"\",\"channel_id\":\"2\",\"user_id\":\"0\",\"special_ids\":\"\",\"title\":\"131556556666a\",\"image\":\"\",\"images\":\"\",\"tags\":\"\",\"diyname\":\"131556556666a\",\"content\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"price\":\"0.00\",\"quhao\":\"678\",\"views\":\"5\",\"comments\":\"2\",\"likes\":\"0\",\"dislikes\":\"0\",\"weigh\":\"0\",\"status\":\"normal\",\"isguest\":\"10\",\"iscomment\":\"10\",\"createtime\":\"2020-08-24 07:15:03\",\"publishtime\":\"2020-08-24 07:14:57\",\"channel_ids\":[\"\"],\"flag\":[\"\"]},\"ids\":\"10\"}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233135),(288,1,'admin','/FgGbQMjdVY.php/cms/archives/get_channel_fields','短信管理 内容管理','{\"channel_id\":\"2\",\"archives_id\":\"9\"}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233137),(289,1,'admin','/FgGbQMjdVY.php/user/user/index','','{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"showField\":\"nickname\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"nickname\"]}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233137),(290,1,'admin','/FgGbQMjdVY.php/cms/archives/check_element_available','短信管理 内容管理','{\"id\":\"9\",\"name\":\"row[diyname]\",\"value\":\"131444455551a\"}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233140),(291,1,'admin','/FgGbQMjdVY.php/cms/archives/edit/ids/9?dialog=1','短信管理 内容管理 修改','{\"dialog\":\"1\",\"row\":{\"style\":\"\",\"channel_id\":\"2\",\"user_id\":\"0\",\"special_ids\":\"\",\"title\":\"131444455551\",\"image\":\"\",\"images\":\"\",\"tags\":\"\",\"diyname\":\"131444455551a\",\"content\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"price\":\"0.00\",\"quhao\":\"789\",\"views\":\"0\",\"comments\":\"0\",\"likes\":\"0\",\"dislikes\":\"0\",\"weigh\":\"0\",\"status\":\"normal\",\"isguest\":\"10\",\"iscomment\":\"10\",\"createtime\":\"2020-08-24 07:14:55\",\"publishtime\":\"2020-08-24 07:14:48\",\"channel_ids\":[\"\"],\"flag\":[\"\"]},\"ids\":\"9\"}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233140),(292,1,'admin','/FgGbQMjdVY.php/cms/archives/get_channel_fields','短信管理 内容管理','{\"channel_id\":\"2\",\"archives_id\":\"9\"}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233142),(293,1,'admin','/FgGbQMjdVY.php/user/user/index','','{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"showField\":\"nickname\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"nickname\"]}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233143),(294,1,'admin','/FgGbQMjdVY.php/cms/archives/get_channel_fields','短信管理 内容管理','{\"channel_id\":\"2\",\"archives_id\":\"8\"}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233149),(295,1,'admin','/FgGbQMjdVY.php/user/user/index','','{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"showField\":\"nickname\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"nickname\"]}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233149),(296,1,'admin','/FgGbQMjdVY.php/cms/archives/check_element_available','短信管理 内容管理','{\"id\":\"8\",\"name\":\"row[diyname]\",\"value\":\"13122221111a\"}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233153),(297,1,'admin','/FgGbQMjdVY.php/cms/archives/edit/ids/8?dialog=1','短信管理 内容管理 修改','{\"dialog\":\"1\",\"row\":{\"style\":\"\",\"channel_id\":\"2\",\"user_id\":\"0\",\"special_ids\":\"\",\"title\":\"13122221111a\",\"image\":\"\",\"images\":\"\",\"tags\":\"\",\"diyname\":\"13122221111a\",\"content\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"price\":\"0.00\",\"quhao\":\"233\",\"views\":\"0\",\"comments\":\"0\",\"likes\":\"0\",\"dislikes\":\"0\",\"weigh\":\"0\",\"status\":\"normal\",\"isguest\":\"10\",\"iscomment\":\"10\",\"createtime\":\"2020-08-24 07:14:45\",\"publishtime\":\"2020-08-24 07:14:36\",\"channel_ids\":[\"\"],\"flag\":[\"\"]},\"ids\":\"8\"}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233153),(298,1,'admin','/FgGbQMjdVY.php/cms/archives/get_channel_fields','短信管理 内容管理','{\"channel_id\":\"2\",\"archives_id\":\"7\"}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233156),(299,1,'admin','/FgGbQMjdVY.php/user/user/index','','{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"showField\":\"nickname\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"nickname\"]}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233156),(300,1,'admin','/FgGbQMjdVY.php/cms/archives/check_element_available','短信管理 内容管理','{\"id\":\"7\",\"name\":\"row[diyname]\",\"value\":\"13122222222b\"}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233163),(301,1,'admin','/FgGbQMjdVY.php/cms/archives/edit/ids/7?dialog=1','短信管理 内容管理 修改','{\"dialog\":\"1\",\"row\":{\"style\":\"\",\"channel_id\":\"2\",\"user_id\":\"0\",\"special_ids\":\"\",\"title\":\"13122222222\",\"image\":\"\",\"images\":\"\",\"tags\":\"\",\"diyname\":\"13122222222b\",\"content\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"price\":\"0.00\",\"quhao\":\"675\",\"views\":\"0\",\"comments\":\"0\",\"likes\":\"0\",\"dislikes\":\"0\",\"weigh\":\"0\",\"status\":\"normal\",\"isguest\":\"10\",\"iscomment\":\"10\",\"createtime\":\"2020-08-24 07:14:35\",\"publishtime\":\"2020-08-24 07:14:28\",\"channel_ids\":[\"\"],\"flag\":[\"\"]},\"ids\":\"7\"}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233164),(302,1,'admin','/FgGbQMjdVY.php/cms/archives/get_channel_fields','短信管理 内容管理','{\"channel_id\":\"2\",\"archives_id\":\"6\"}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233167),(303,1,'admin','/FgGbQMjdVY.php/user/user/index','','{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"showField\":\"nickname\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"nickname\"]}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233167),(304,1,'admin','/FgGbQMjdVY.php/cms/archives/check_element_available','短信管理 内容管理','{\"id\":\"6\",\"name\":\"row[diyname]\",\"value\":\"13333333333a\"}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233170),(305,1,'admin','/FgGbQMjdVY.php/cms/archives/edit/ids/6?dialog=1','短信管理 内容管理 修改','{\"dialog\":\"1\",\"row\":{\"style\":\"\",\"channel_id\":\"2\",\"user_id\":\"0\",\"special_ids\":\"\",\"title\":\"13333333333\",\"image\":\"\",\"images\":\"\",\"tags\":\"\",\"diyname\":\"13333333333a\",\"content\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"price\":\"0.00\",\"quhao\":\"122\",\"views\":\"28\",\"comments\":\"0\",\"likes\":\"0\",\"dislikes\":\"0\",\"weigh\":\"0\",\"status\":\"normal\",\"isguest\":\"10\",\"iscomment\":\"10\",\"createtime\":\"2020-08-24 07:14:26\",\"publishtime\":\"2020-08-24 07:14:21\",\"channel_ids\":[\"\"],\"flag\":[\"\"]},\"ids\":\"6\"}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233170),(306,1,'admin','/FgGbQMjdVY.php/cms/archives/get_channel_fields','短信管理 内容管理','{\"channel_id\":\"2\",\"archives_id\":\"5\"}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233172),(307,1,'admin','/FgGbQMjdVY.php/user/user/index','','{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"showField\":\"nickname\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"nickname\"]}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233173),(308,1,'admin','/FgGbQMjdVY.php/cms/archives/check_element_available','短信管理 内容管理','{\"id\":\"5\",\"name\":\"row[diyname]\",\"value\":\"1414444444411a\"}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233175),(309,1,'admin','/FgGbQMjdVY.php/cms/archives/edit/ids/5?dialog=1','短信管理 内容管理 修改','{\"dialog\":\"1\",\"row\":{\"style\":\"\",\"channel_id\":\"2\",\"user_id\":\"0\",\"special_ids\":\"\",\"title\":\"14144444444\",\"image\":\"\",\"images\":\"\",\"tags\":\"\",\"diyname\":\"1414444444411a\",\"content\":\"1\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"price\":\"0.00\",\"quhao\":\"345\",\"views\":\"0\",\"comments\":\"0\",\"likes\":\"0\",\"dislikes\":\"0\",\"weigh\":\"0\",\"status\":\"normal\",\"isguest\":\"10\",\"iscomment\":\"10\",\"createtime\":\"2020-08-24 07:14:19\",\"publishtime\":\"2020-08-24 07:14:03\",\"channel_ids\":[\"\"],\"flag\":[\"\"]},\"ids\":\"5\"}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233175),(310,1,'admin','/FgGbQMjdVY.php/cms/archives/get_channel_fields','短信管理 内容管理','{\"channel_id\":\"2\",\"archives_id\":\"4\"}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233177),(311,1,'admin','/FgGbQMjdVY.php/user/user/index','','{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"showField\":\"nickname\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"nickname\"]}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233177),(312,1,'admin','/FgGbQMjdVY.php/cms/archives/check_element_available','短信管理 内容管理','{\"id\":\"4\",\"name\":\"row[diyname]\",\"value\":\"1314444444a\"}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233182),(313,1,'admin','/FgGbQMjdVY.php/cms/archives/edit/ids/4?dialog=1','短信管理 内容管理 修改','{\"dialog\":\"1\",\"row\":{\"style\":\"\",\"channel_id\":\"2\",\"user_id\":\"0\",\"special_ids\":\"\",\"title\":\"131444444442\",\"image\":\"\",\"images\":\"\",\"tags\":\"\",\"diyname\":\"1314444444a\",\"content\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"price\":\"0.00\",\"quhao\":\"12\",\"views\":\"0\",\"comments\":\"0\",\"likes\":\"0\",\"dislikes\":\"0\",\"weigh\":\"0\",\"status\":\"normal\",\"isguest\":\"10\",\"iscomment\":\"10\",\"createtime\":\"2020-08-24 07:13:58\",\"publishtime\":\"2020-08-24 07:13:49\",\"channel_ids\":[\"\"],\"flag\":[\"\"]},\"ids\":\"4\"}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233182),(314,1,'admin','/FgGbQMjdVY.php/cms/archives/get_channel_fields','短信管理 内容管理','{\"channel_id\":\"2\",\"archives_id\":\"4\"}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233184),(315,1,'admin','/FgGbQMjdVY.php/user/user/index','','{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"showField\":\"nickname\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"nickname\"]}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233185),(316,1,'admin','/FgGbQMjdVY.php/cms/archives/get_channel_fields','短信管理 内容管理','{\"channel_id\":\"2\",\"archives_id\":\"2\"}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233219),(317,1,'admin','/FgGbQMjdVY.php/user/user/index','','{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"showField\":\"nickname\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"nickname\"]}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233219),(318,1,'admin','/FgGbQMjdVY.php/cms/archives/check_element_available','短信管理 内容管理','{\"id\":\"2\",\"name\":\"row[diyname]\",\"value\":\"13144444444a\"}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233222),(319,1,'admin','/FgGbQMjdVY.php/cms/archives/edit/ids/2?dialog=1','短信管理 内容管理 修改','{\"dialog\":\"1\",\"row\":{\"style\":\"\",\"channel_id\":\"2\",\"user_id\":\"0\",\"special_ids\":\"\",\"title\":\"13144444444\",\"image\":\"\",\"images\":\"\",\"tags\":\"\",\"diyname\":\"13144444444a\",\"content\":\"\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"price\":\"0.00\",\"quhao\":\"544\",\"views\":\"1\",\"comments\":\"0\",\"likes\":\"0\",\"dislikes\":\"0\",\"weigh\":\"0\",\"status\":\"normal\",\"isguest\":\"10\",\"iscomment\":\"10\",\"createtime\":\"2020-08-24 07:13:31\",\"publishtime\":\"2020-08-24 07:13:19\",\"channel_ids\":[\"\"],\"flag\":[\"\"]},\"ids\":\"2\"}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233223),(320,1,'admin','/FgGbQMjdVY.php/cms/archives/get_channel_fields','短信管理 内容管理','{\"channel_id\":\"2\",\"archives_id\":\"1\"}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233226),(321,1,'admin','/FgGbQMjdVY.php/user/user/index','','{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"showField\":\"nickname\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"nickname\"]}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233226),(322,1,'admin','/FgGbQMjdVY.php/cms/archives/check_element_available','短信管理 内容管理','{\"id\":\"1\",\"name\":\"row[diyname]\",\"value\":\"13233332222f\"}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233229),(323,1,'admin','/FgGbQMjdVY.php/cms/archives/edit/ids/1?dialog=1','短信管理 内容管理 修改','{\"dialog\":\"1\",\"row\":{\"style\":\"\",\"channel_id\":\"2\",\"user_id\":\"0\",\"special_ids\":\"\",\"title\":\"13233332222f\",\"image\":\"\",\"images\":\"\",\"tags\":\"\",\"diyname\":\"13233332222f\",\"content\":\"1111\",\"seotitle\":\"\",\"keywords\":\"\",\"description\":\"\",\"price\":\"0.00\",\"quhao\":\"788\",\"views\":\"2\",\"comments\":\"0\",\"likes\":\"0\",\"dislikes\":\"0\",\"weigh\":\"0\",\"status\":\"normal\",\"isguest\":\"10\",\"iscomment\":\"10\",\"createtime\":\"2020-08-23 07:15:46\",\"publishtime\":\"2020-08-23 07:14:48\",\"channel_ids\":[\"\"],\"flag\":[\"\"]},\"ids\":\"1\"}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233229),(324,1,'admin','/FgGbQMjdVY.php/cms/fields/edit/model_id/1/ids/5?dialog=1','短信管理 字段管理 修改','{\"dialog\":\"1\",\"row\":{\"model_id\":\"1\",\"diyform_id\":\"0\",\"oldname\":\"quhao\",\"name\":\"author\",\"type\":\"string\",\"decimals\":\"0\",\"minimum\":\"0\",\"maximum\":\"0\",\"title\":\"\\u533a\\u53f7\",\"content\":\"value1|title1\\r\\nvalue2|title2\",\"defaultvalue\":\"\",\"rule\":\"\",\"msg\":\"\",\"ok\":\"\",\"tip\":\"\",\"length\":\"50\",\"isfilter\":\"1\",\"iscontribute\":\"1\",\"extend\":\"\",\"weigh\":\"136\",\"status\":\"normal\"},\"model_id\":\"1\",\"ids\":\"5\"}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233499),(325,1,'admin','/FgGbQMjdVY.php/cms/fields/edit/model_id/1/ids/5?dialog=1','短信管理 字段管理 修改','{\"dialog\":\"1\",\"row\":{\"model_id\":\"1\",\"diyform_id\":\"0\",\"oldname\":\"author\",\"name\":\"quhao\",\"type\":\"string\",\"decimals\":\"0\",\"minimum\":\"0\",\"maximum\":\"0\",\"title\":\"\\u533a\\u53f7\",\"content\":\"value1|title1\\r\\nvalue2|title2\",\"defaultvalue\":\"\",\"rule\":\"\",\"msg\":\"\",\"ok\":\"\",\"tip\":\"\",\"length\":\"50\",\"isfilter\":\"1\",\"iscontribute\":\"1\",\"extend\":\"\",\"weigh\":\"136\",\"status\":\"normal\"},\"model_id\":\"1\",\"ids\":\"5\"}','60.220.124.75','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1598233690);
/*!40000 ALTER TABLE `sms_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_attachment`
--

DROP TABLE IF EXISTS `sms_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_attachment` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '物理路径',
  `imagewidth` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '宽度',
  `imageheight` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '高度',
  `imagetype` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '图片类型',
  `imageframes` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '图片帧数',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `mimetype` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'mime类型',
  `extparam` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '透传数据',
  `createtime` int(10) DEFAULT NULL COMMENT '创建日期',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `uploadtime` int(10) DEFAULT NULL COMMENT '上传时间',
  `storage` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `sha1` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='附件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_attachment`
--

LOCK TABLES `sms_attachment` WRITE;
/*!40000 ALTER TABLE `sms_attachment` DISABLE KEYS */;
INSERT INTO `sms_attachment` VALUES (1,1,0,'/assets/img/qrcode.png','150','150','png',0,21859,'image/png','',1499681848,1499681848,1499681848,'local','17163603d0263e4838b9387ff2cd4877e8b018f6');
/*!40000 ALTER TABLE `sms_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_auth_group`
--

DROP TABLE IF EXISTS `sms_auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_auth_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父组别',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '组名',
  `rules` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '规则ID',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='分组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_auth_group`
--

LOCK TABLES `sms_auth_group` WRITE;
/*!40000 ALTER TABLE `sms_auth_group` DISABLE KEYS */;
INSERT INTO `sms_auth_group` VALUES (1,0,'Admin group','*',1490883540,149088354,'normal'),(2,1,'Second group','13,14,16,15,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,1,9,10,11,7,6,8,2,4,5',1490883540,1505465692,'normal'),(3,2,'Third group','1,4,9,10,11,13,14,15,16,17,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,5',1490883540,1502205322,'normal'),(4,1,'Second group 2','1,4,13,14,15,16,17,55,56,57,58,59,60,61,62,63,64,65',1490883540,1502205350,'normal'),(5,2,'Third group 2','1,2,6,7,8,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34',1490883540,1502205344,'normal');
/*!40000 ALTER TABLE `sms_auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_auth_group_access`
--

DROP TABLE IF EXISTS `sms_auth_group_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '会员ID',
  `group_id` int(10) unsigned NOT NULL COMMENT '级别ID',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='权限分组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_auth_group_access`
--

LOCK TABLES `sms_auth_group_access` WRITE;
/*!40000 ALTER TABLE `sms_auth_group_access` DISABLE KEYS */;
INSERT INTO `sms_auth_group_access` VALUES (1,1);
/*!40000 ALTER TABLE `sms_auth_group_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_auth_rule`
--

DROP TABLE IF EXISTS `sms_auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_auth_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('menu','file') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'file' COMMENT 'menu为菜单,file为权限节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '规则名称',
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '图标',
  `condition` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '条件',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为菜单',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `pid` (`pid`),
  KEY `weigh` (`weigh`)
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='节点表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_auth_rule`
--

LOCK TABLES `sms_auth_rule` WRITE;
/*!40000 ALTER TABLE `sms_auth_rule` DISABLE KEYS */;
INSERT INTO `sms_auth_rule` VALUES (1,'file',0,'dashboard','Dashboard','fa fa-dashboard','','Dashboard tips',1,1497429920,1497429920,143,'normal'),(2,'file',0,'general','General','fa fa-cogs','','',1,1497429920,1497430169,137,'normal'),(4,'file',0,'addon','Addon','fa fa-rocket','','Addon tips',0,1502035509,1598231020,0,'normal'),(5,'file',0,'auth','Auth','fa fa-group','','',1,1497429920,1497430092,99,'normal'),(6,'file',2,'general/config','Config','fa fa-cog','','Config tips',1,1497429920,1497430683,60,'normal'),(7,'file',2,'general/attachment','Attachment','fa fa-file-image-o','','Attachment tips',1,1497429920,1497430699,53,'normal'),(8,'file',2,'general/profile','Profile','fa fa-user','','',1,1497429920,1497429920,34,'normal'),(9,'file',5,'auth/admin','Admin','fa fa-user','','Admin tips',1,1497429920,1497430320,118,'normal'),(10,'file',5,'auth/adminlog','Admin log','fa fa-list-alt','','Admin log tips',1,1497429920,1497430307,113,'normal'),(11,'file',5,'auth/group','Group','fa fa-group','','Group tips',1,1497429920,1497429920,109,'normal'),(12,'file',5,'auth/rule','Rule','fa fa-bars','','Rule tips',1,1497429920,1497430581,104,'normal'),(13,'file',1,'dashboard/index','View','fa fa-circle-o','','',0,1497429920,1497429920,136,'normal'),(14,'file',1,'dashboard/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,135,'normal'),(15,'file',1,'dashboard/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,133,'normal'),(16,'file',1,'dashboard/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,134,'normal'),(17,'file',1,'dashboard/multi','Multi','fa fa-circle-o','','',0,1497429920,1497429920,132,'normal'),(18,'file',6,'general/config/index','View','fa fa-circle-o','','',0,1497429920,1497429920,52,'normal'),(19,'file',6,'general/config/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,51,'normal'),(20,'file',6,'general/config/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,50,'normal'),(21,'file',6,'general/config/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,49,'normal'),(22,'file',6,'general/config/multi','Multi','fa fa-circle-o','','',0,1497429920,1497429920,48,'normal'),(23,'file',7,'general/attachment/index','View','fa fa-circle-o','','Attachment tips',0,1497429920,1497429920,59,'normal'),(24,'file',7,'general/attachment/select','Select attachment','fa fa-circle-o','','',0,1497429920,1497429920,58,'normal'),(25,'file',7,'general/attachment/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,57,'normal'),(26,'file',7,'general/attachment/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,56,'normal'),(27,'file',7,'general/attachment/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,55,'normal'),(28,'file',7,'general/attachment/multi','Multi','fa fa-circle-o','','',0,1497429920,1497429920,54,'normal'),(29,'file',8,'general/profile/index','View','fa fa-circle-o','','',0,1497429920,1497429920,33,'normal'),(30,'file',8,'general/profile/update','Update profile','fa fa-circle-o','','',0,1497429920,1497429920,32,'normal'),(31,'file',8,'general/profile/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,31,'normal'),(32,'file',8,'general/profile/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,30,'normal'),(33,'file',8,'general/profile/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,29,'normal'),(34,'file',8,'general/profile/multi','Multi','fa fa-circle-o','','',0,1497429920,1497429920,28,'normal'),(40,'file',9,'auth/admin/index','View','fa fa-circle-o','','Admin tips',0,1497429920,1497429920,117,'normal'),(41,'file',9,'auth/admin/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,116,'normal'),(42,'file',9,'auth/admin/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,115,'normal'),(43,'file',9,'auth/admin/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,114,'normal'),(44,'file',10,'auth/adminlog/index','View','fa fa-circle-o','','Admin log tips',0,1497429920,1497429920,112,'normal'),(45,'file',10,'auth/adminlog/detail','Detail','fa fa-circle-o','','',0,1497429920,1497429920,111,'normal'),(46,'file',10,'auth/adminlog/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,110,'normal'),(47,'file',11,'auth/group/index','View','fa fa-circle-o','','Group tips',0,1497429920,1497429920,108,'normal'),(48,'file',11,'auth/group/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,107,'normal'),(49,'file',11,'auth/group/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,106,'normal'),(50,'file',11,'auth/group/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,105,'normal'),(51,'file',12,'auth/rule/index','View','fa fa-circle-o','','Rule tips',0,1497429920,1497429920,103,'normal'),(52,'file',12,'auth/rule/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,102,'normal'),(53,'file',12,'auth/rule/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,101,'normal'),(54,'file',12,'auth/rule/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,100,'normal'),(55,'file',4,'addon/index','View','fa fa-circle-o','','Addon tips',0,1502035509,1502035509,0,'normal'),(56,'file',4,'addon/add','Add','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(57,'file',4,'addon/edit','Edit','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(58,'file',4,'addon/del','Delete','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(59,'file',4,'addon/downloaded','Local addon','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(60,'file',4,'addon/state','Update state','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(63,'file',4,'addon/config','Setting','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(64,'file',4,'addon/refresh','Refresh','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(65,'file',4,'addon/multi','Multi','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(85,'file',0,'cms','短信管理','fa fa-list','','',1,1598137965,1598231040,0,'normal'),(86,'file',85,'cms/config','站点配置','fa fa-gears','','',1,1598137965,1598137965,0,'normal'),(87,'file',86,'cms/config/index','修改','fa fa-circle-o','','',0,1598137965,1598137965,0,'normal'),(88,'file',85,'cms/statistics','统计控制台','fa fa-bar-chart','','',1,1598137965,1598137965,0,'normal'),(89,'file',88,'cms/statistics/index','查看','fa fa-circle-o','','',0,1598137965,1598137965,0,'normal'),(90,'file',85,'cms/channel','栏目管理','fa fa-list','','用于管理网站的分类，可进行无限级分类，注意只有类型为列表的才可以添加文章',1,1598137965,1598137965,0,'normal'),(91,'file',90,'cms/channel/index','查看','fa fa-circle-o','','',0,1598137965,1598137965,0,'normal'),(92,'file',90,'cms/channel/add','添加','fa fa-circle-o','','',0,1598137965,1598137965,0,'normal'),(93,'file',90,'cms/channel/edit','修改','fa fa-circle-o','','',0,1598137965,1598137965,0,'normal'),(94,'file',90,'cms/channel/del','删除','fa fa-circle-o','','',0,1598137965,1598137965,0,'normal'),(95,'file',90,'cms/channel/multi','批量更新','fa fa-circle-o','','',0,1598137965,1598137965,0,'normal'),(96,'file',90,'cms/channel/admin','栏目授权','fa fa-circle-o','','分配管理员可管理的栏目数据，此功能需要先开启插件管理CMS配置的栏目授权开关',0,1598137966,1598137966,0,'normal'),(97,'file',85,'cms/archives','内容管理','fa fa-file-text-o','','',1,1598137966,1598137966,0,'normal'),(98,'file',97,'cms/archives/index','查看','fa fa-circle-o','','',0,1598137966,1598137966,0,'normal'),(99,'file',97,'cms/archives/content','副表管理','fa fa-circle-o','','用于管理模型副表的数据列表,不建议在此进行删除操作',0,1598137966,1598137966,0,'normal'),(100,'file',97,'cms/archives/add','添加','fa fa-circle-o','','',0,1598137966,1598137966,0,'normal'),(101,'file',97,'cms/archives/edit','修改','fa fa-circle-o','','',0,1598137966,1598137966,0,'normal'),(102,'file',97,'cms/archives/del','删除','fa fa-circle-o','','',0,1598137966,1598137966,0,'normal'),(103,'file',97,'cms/archives/multi','批量更新','fa fa-circle-o','','',0,1598137966,1598137966,0,'normal'),(104,'file',97,'cms/archives/recyclebin','回收站','fa fa-circle-o','','',0,1598137966,1598137966,0,'normal'),(105,'file',97,'cms/archives/restore','还原','fa fa-circle-o','','',0,1598137966,1598137966,0,'normal'),(106,'file',97,'cms/archives/destroy','真实删除','fa fa-circle-o','','',0,1598137966,1598137966,0,'normal'),(107,'file',85,'cms/modelx','模型管理','fa fa-th','','在线添加修改删除模型，管理模型字段和相关模型数据',1,1598137966,1598137966,0,'normal'),(108,'file',107,'cms/modelx/index','查看','fa fa-circle-o','','',0,1598137966,1598137966,0,'normal'),(109,'file',107,'cms/modelx/add','添加','fa fa-circle-o','','',0,1598137966,1598137966,0,'normal'),(110,'file',107,'cms/modelx/edit','修改','fa fa-circle-o','','',0,1598137966,1598137966,0,'normal'),(111,'file',107,'cms/modelx/del','删除','fa fa-circle-o','','',0,1598137966,1598137966,0,'normal'),(112,'file',107,'cms/modelx/duplicate','复制','fa fa-circle-o','','',0,1598137966,1598137966,0,'normal'),(113,'file',107,'cms/modelx/multi','批量更新','fa fa-circle-o','','',0,1598137966,1598137966,0,'normal'),(114,'file',107,'cms/fields','字段管理','fa fa-fields','','用于管理模型或表单的字段，进行相关的增删改操作，灰色为主表字段无法修改',0,1598137966,1598137966,0,'normal'),(115,'file',114,'cms/fields/index','查看','fa fa-circle-o','','',0,1598137967,1598137967,0,'normal'),(116,'file',114,'cms/fields/add','添加','fa fa-circle-o','','',0,1598137967,1598137967,0,'normal'),(117,'file',114,'cms/fields/edit','修改','fa fa-circle-o','','',0,1598137967,1598137967,0,'normal'),(118,'file',114,'cms/fields/del','删除','fa fa-circle-o','','',0,1598137967,1598137967,0,'normal'),(119,'file',114,'cms/fields/duplicate','复制','fa fa-circle-o','','',0,1598137967,1598137967,0,'normal'),(120,'file',114,'cms/fields/multi','批量更新','fa fa-circle-o','','',0,1598137967,1598137967,0,'normal'),(121,'file',85,'cms/tags','标签管理','fa fa-tags','','用于管理文章关联的标签,标签的添加在添加文章时自动维护,无需手动添加标签',1,1598137967,1598137967,0,'normal'),(122,'file',121,'cms/tags/index','查看','fa fa-circle-o','','',0,1598137967,1598137967,0,'normal'),(123,'file',121,'cms/tags/add','添加','fa fa-circle-o','','',0,1598137967,1598137967,0,'normal'),(124,'file',121,'cms/tags/edit','修改','fa fa-circle-o','','',0,1598137967,1598137967,0,'normal'),(125,'file',121,'cms/tags/del','删除','fa fa-circle-o','','',0,1598137967,1598137967,0,'normal'),(126,'file',121,'cms/tags/multi','批量更新','fa fa-circle-o','','',0,1598137967,1598137967,0,'normal'),(133,'file',85,'cms/page','单页管理','fa fa-file','','用于管理网站的单页面，可任意创建修改删除单页面',1,1598137968,1598137968,0,'normal'),(134,'file',133,'cms/page/index','查看','fa fa-circle-o','','',0,1598137968,1598137968,0,'normal'),(135,'file',133,'cms/page/add','添加','fa fa-circle-o','','',0,1598137968,1598137968,0,'normal'),(136,'file',133,'cms/page/edit','修改','fa fa-circle-o','','',0,1598137968,1598137968,0,'normal'),(137,'file',133,'cms/page/del','删除','fa fa-circle-o','','',0,1598137968,1598137968,0,'normal'),(138,'file',133,'cms/page/multi','批量更新','fa fa-circle-o','','',0,1598137968,1598137968,0,'normal'),(139,'file',133,'cms/page/recyclebin','回收站','fa fa-circle-o','','',0,1598137968,1598137968,0,'normal'),(140,'file',133,'cms/page/restore','还原','fa fa-circle-o','','',0,1598137968,1598137968,0,'normal'),(141,'file',133,'cms/page/destroy','真实删除','fa fa-circle-o','','',0,1598137968,1598137968,0,'normal'),(142,'file',85,'cms/comment','短信内容管理','fa fa-comment','','用于管理用户在网站上发表的评论，可任意修改或隐藏评论',1,1598137968,1598231109,0,'normal'),(143,'file',142,'cms/comment/index','查看','fa fa-circle-o','','',0,1598137968,1598137968,0,'normal'),(144,'file',142,'cms/comment/add','添加','fa fa-circle-o','','',0,1598137968,1598137968,0,'normal'),(145,'file',142,'cms/comment/edit','修改','fa fa-circle-o','','',0,1598137968,1598137968,0,'normal'),(146,'file',142,'cms/comment/del','删除','fa fa-circle-o','','',0,1598137968,1598137968,0,'normal'),(147,'file',142,'cms/comment/multi','批量更新','fa fa-circle-o','','',0,1598137968,1598137968,0,'normal'),(148,'file',142,'cms/comment/recyclebin','回收站','fa fa-circle-o','','',0,1598137968,1598137968,0,'normal'),(149,'file',142,'cms/comment/restore','还原','fa fa-circle-o','','',0,1598137968,1598137968,0,'normal'),(150,'file',142,'cms/comment/destroy','真实删除','fa fa-circle-o','','',0,1598137968,1598137968,0,'normal'),(151,'file',85,'cms/diyform','自定义表单管理','fa fa-list','','可在线创建自定义表单，管理表单字段和数据列表',1,1598137968,1598137968,0,'normal'),(152,'file',151,'cms/diyform/index','查看','fa fa-circle-o','','',0,1598137968,1598137968,0,'normal'),(153,'file',151,'cms/diyform/add','添加','fa fa-circle-o','','',0,1598137969,1598137969,0,'normal'),(154,'file',151,'cms/diyform/edit','修改','fa fa-circle-o','','',0,1598137969,1598137969,0,'normal'),(155,'file',151,'cms/diyform/del','删除','fa fa-circle-o','','',0,1598137969,1598137969,0,'normal'),(156,'file',151,'cms/diyform/multi','批量更新','fa fa-circle-o','','',0,1598137969,1598137969,0,'normal'),(157,'file',85,'cms/diydata','自定义表单数据管理','fa fa-list','','可在线管理自定义表单的数据列表',0,1598137969,1598137969,0,'normal'),(158,'file',157,'cms/diydata/index','查看','fa fa-circle-o','','',0,1598137969,1598137969,0,'normal'),(159,'file',157,'cms/diydata/add','添加','fa fa-circle-o','','',0,1598137969,1598137969,0,'normal'),(160,'file',157,'cms/diydata/edit','修改','fa fa-circle-o','','',0,1598137969,1598137969,0,'normal'),(161,'file',157,'cms/diydata/del','删除','fa fa-circle-o','','',0,1598137969,1598137969,0,'normal'),(162,'file',157,'cms/diydata/multi','批量更新','fa fa-circle-o','','',0,1598137969,1598137969,0,'normal'),(163,'file',157,'cms/diydata/import','导入','fa fa-circle-o','','',0,1598137969,1598137969,0,'normal');
/*!40000 ALTER TABLE `sms_auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_category`
--

DROP TABLE IF EXISTS `sms_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '栏目类型',
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `nickname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `flag` set('hot','index','recommend') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '图片',
  `keywords` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '描述',
  `diyname` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '自定义名称',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `weigh` (`weigh`,`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_category`
--

LOCK TABLES `sms_category` WRITE;
/*!40000 ALTER TABLE `sms_category` DISABLE KEYS */;
INSERT INTO `sms_category` VALUES (1,0,'page','官方新闻','news','recommend','/assets/img/qrcode.png','','','news',1495262190,1495262190,1,'normal'),(2,0,'page','移动应用','mobileapp','hot','/assets/img/qrcode.png','','','mobileapp',1495262244,1495262244,2,'normal'),(3,2,'page','微信公众号','wechatpublic','index','/assets/img/qrcode.png','','','wechatpublic',1495262288,1495262288,3,'normal'),(4,2,'page','Android开发','android','recommend','/assets/img/qrcode.png','','','android',1495262317,1495262317,4,'normal'),(5,0,'page','软件产品','software','recommend','/assets/img/qrcode.png','','','software',1495262336,1499681850,5,'normal'),(6,5,'page','网站建站','website','recommend','/assets/img/qrcode.png','','','website',1495262357,1495262357,6,'normal'),(7,5,'page','企业管理软件','company','index','/assets/img/qrcode.png','','','company',1495262391,1495262391,7,'normal'),(8,6,'page','PC端','website-pc','recommend','/assets/img/qrcode.png','','','website-pc',1495262424,1495262424,8,'normal'),(9,6,'page','移动端','website-mobile','recommend','/assets/img/qrcode.png','','','website-mobile',1495262456,1495262456,9,'normal'),(10,7,'page','CRM系统 ','company-crm','recommend','/assets/img/qrcode.png','','','company-crm',1495262487,1495262487,10,'normal'),(11,7,'page','SASS平台软件','company-sass','recommend','/assets/img/qrcode.png','','','company-sass',1495262515,1495262515,11,'normal'),(12,0,'test','测试1','test1','recommend','/assets/img/qrcode.png','','','test1',1497015727,1497015727,12,'normal'),(13,0,'test','测试2','test2','recommend','/assets/img/qrcode.png','','','test2',1497015738,1497015738,13,'normal');
/*!40000 ALTER TABLE `sms_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_cms_addondownload`
--

DROP TABLE IF EXISTS `sms_cms_addondownload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_cms_addondownload` (
  `id` int(10) NOT NULL,
  `content` longtext NOT NULL,
  `os` set('windows','linux','mac','ubuntu') DEFAULT '' COMMENT '操作系统',
  `version` varchar(255) DEFAULT '' COMMENT '最新版本',
  `filesize` varchar(255) DEFAULT '' COMMENT '文件大小',
  `language` set('zh-cn','en') DEFAULT '' COMMENT '语言',
  `downloadurl` varchar(1500) DEFAULT '' COMMENT '下载地址',
  `screenshots` varchar(1500) DEFAULT '' COMMENT '预览截图',
  `price` decimal(10,2) DEFAULT '0.00' COMMENT '价格',
  `downloads` varchar(10) DEFAULT '0' COMMENT '下载次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='下载';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_cms_addondownload`
--

LOCK TABLES `sms_cms_addondownload` WRITE;
/*!40000 ALTER TABLE `sms_cms_addondownload` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_cms_addondownload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_cms_addonnews`
--

DROP TABLE IF EXISTS `sms_cms_addonnews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_cms_addonnews` (
  `id` int(10) NOT NULL,
  `content` longtext NOT NULL,
  `quhao` varchar(50) DEFAULT '' COMMENT '区号',
  `price` decimal(10,2) DEFAULT '0.00' COMMENT '价格',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='新闻';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_cms_addonnews`
--

LOCK TABLES `sms_cms_addonnews` WRITE;
/*!40000 ALTER TABLE `sms_cms_addonnews` DISABLE KEYS */;
INSERT INTO `sms_cms_addonnews` VALUES (1,'1111','788',0.00),(2,'','544',0.00),(3,'','',0.00),(4,'','12',0.00),(5,'1','345',0.00),(6,'','122',0.00),(7,'','675',0.00),(8,'','233',0.00),(9,'','789',0.00),(10,'','678',0.00),(11,'','556',0.00),(12,'','322',0.00),(13,'','556',0.00),(14,'','532',0.00),(15,'a','133',0.00),(16,'a','121',0.00);
/*!40000 ALTER TABLE `sms_cms_addonnews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_cms_addonproduct`
--

DROP TABLE IF EXISTS `sms_cms_addonproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_cms_addonproduct` (
  `id` int(10) NOT NULL,
  `content` longtext NOT NULL,
  `productdata` varchar(1500) DEFAULT '' COMMENT '产品列表',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_cms_addonproduct`
--

LOCK TABLES `sms_cms_addonproduct` WRITE;
/*!40000 ALTER TABLE `sms_cms_addonproduct` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_cms_addonproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_cms_archives`
--

DROP TABLE IF EXISTS `sms_cms_archives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_cms_archives` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `channel_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '栏目ID',
  `channel_ids` varchar(255) DEFAULT '' COMMENT '副栏目ID集合',
  `model_id` int(10) NOT NULL DEFAULT '0' COMMENT '模型ID',
  `special_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '专题ID集合',
  `admin_id` int(10) unsigned DEFAULT '0' COMMENT '管理员ID',
  `title` varchar(80) NOT NULL DEFAULT '' COMMENT '文章标题',
  `style` varchar(100) DEFAULT '' COMMENT '样式',
  `flag` varchar(100) DEFAULT '' COMMENT '标志',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '缩略图',
  `images` varchar(1500) NOT NULL DEFAULT '' COMMENT '组图',
  `seotitle` varchar(255) NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `tags` varchar(255) NOT NULL DEFAULT '' COMMENT 'TAG',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `views` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `comments` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论次数',
  `likes` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点赞数',
  `dislikes` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点踩数',
  `diyname` varchar(50) NOT NULL DEFAULT '' COMMENT '自定义URL',
  `isguest` tinyint(1) unsigned DEFAULT '1' COMMENT '是否访客访问',
  `iscomment` tinyint(1) unsigned DEFAULT '1' COMMENT '是否允许评论',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `publishtime` int(10) DEFAULT NULL COMMENT '发布时间',
  `deletetime` int(10) DEFAULT NULL COMMENT '删除时间',
  `memo` varchar(100) DEFAULT '' COMMENT '备注',
  `status` enum('normal','hidden','rejected','pulloff') NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`channel_id`,`status`),
  KEY `channel` (`channel_id`,`weigh`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='内容表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_cms_archives`
--

LOCK TABLES `sms_cms_archives` WRITE;
/*!40000 ALTER TABLE `sms_cms_archives` DISABLE KEYS */;
INSERT INTO `sms_cms_archives` VALUES (1,0,2,'',1,'',1,'13233332222f ','','','','','','','','',0,2,0,0,0,'13233332222f',10,10,1598138146,1598233229,1598138088,NULL,'','normal'),(2,0,2,'',1,'',1,'13144444444','','','','','','','','',0,1,0,0,0,'13144444444a',10,10,1598224411,1598233223,1598224399,NULL,'','normal'),(3,0,2,'',1,'',1,'13144444444','','','','','','','','',0,0,0,0,0,'13144444444b',10,10,1598224425,1598224425,1598224414,NULL,'','normal'),(4,0,2,'',1,'',1,'131444444442','','','','','','','','',0,0,0,0,0,'1314444444a',10,10,1598224438,1598233182,1598224429,NULL,'','normal'),(5,0,2,'',1,'',1,'14144444444','','','','','','','','',0,0,0,0,0,'1414444444411a',10,10,1598224459,1598233175,1598224443,NULL,'','normal'),(6,0,2,'',1,'',1,'13333333333','','','','','','','','',0,28,0,0,0,'13333333333a',10,10,1598224466,1598233170,1598224461,NULL,'','normal'),(7,0,2,'',1,'',1,'13122222222','','','','','','','','',0,0,0,0,0,'13122222222b',10,10,1598224475,1598233164,1598224468,NULL,'','normal'),(8,0,2,'',1,'',1,'13122221111a','','','','','','','','',0,0,0,0,0,'13122221111a',10,10,1598224485,1598233153,1598224476,NULL,'','normal'),(9,0,2,'',1,'',1,'131444455551','','','','','','','','',0,0,0,0,0,'131444455551a',10,10,1598224495,1598233140,1598224488,NULL,'','normal'),(10,0,2,'',1,'',1,'131556556666a','','','','','','','','',0,5,2,0,0,'131556556666a',10,10,1598224503,1598233135,1598224497,NULL,'','normal'),(11,0,2,'',1,'',1,'111133331313','','','','','','','','',0,0,0,0,0,'111133331313a',10,10,1598225128,1598233128,1598225118,NULL,'','normal'),(12,0,2,'',1,'',1,'13144444444','','','','','','','','',0,0,0,0,0,'13144444444ab',10,10,1598225153,1598233119,1598225130,NULL,'','normal'),(13,0,2,'',1,'',1,'13455555555','','','','','','','','',0,0,0,0,0,'13455555555a',10,10,1598225171,1598233114,1598225164,NULL,'','normal'),(14,0,2,'',1,'',1,'14566666666','','','','','','','','',0,0,0,0,0,'14566666666a',10,10,1598225180,1598233108,1598225173,NULL,'','normal'),(15,0,2,'',1,'',1,'13577777777','','','','','','','','',0,4,0,0,0,'13577777777a',10,10,1598225205,1598233102,1598225193,NULL,'','normal'),(16,0,9,'',1,'',1,'13155555555','','','','','','','','',0,0,0,0,0,'13155555555a',10,10,1598227831,1598233096,1598227803,NULL,'','normal');
/*!40000 ALTER TABLE `sms_cms_archives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_cms_block`
--

DROP TABLE IF EXISTS `sms_cms_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_cms_block` (
  `id` smallint(8) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '类型',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `url` varchar(100) NOT NULL DEFAULT '' COMMENT '链接',
  `content` mediumtext COMMENT '内容',
  `weigh` int(10) DEFAULT '0' COMMENT '权重',
  `createtime` int(10) DEFAULT NULL COMMENT '添加时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `begintime` int(10) DEFAULT NULL COMMENT '开始时间',
  `endtime` int(10) DEFAULT NULL COMMENT '结束时间',
  `status` enum('normal','hidden') NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='区块表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_cms_block`
--

LOCK TABLES `sms_cms_block` WRITE;
/*!40000 ALTER TABLE `sms_cms_block` DISABLE KEYS */;
INSERT INTO `sms_cms_block` VALUES (1,'焦点图','indexfocus','首页焦点图标题1','https://cdn.fastadmin.net/uploads/focus/25.jpg','http://www.fastadmin.net','',1,1553606219,1553606219,NULL,NULL,'normal'),(2,'焦点图','indexfocus','首页焦点图标题2','https://cdn.fastadmin.net/uploads/focus/6.jpg','http://www.fastadmin.net','',2,1553606219,1553606219,NULL,NULL,'normal'),(3,'焦点图','indexfocus','首页焦点图标题3','https://cdn.fastadmin.net/uploads/focus/24.jpg','http://www.fastadmin.net','',3,1553606219,1553606219,NULL,NULL,'normal'),(4,'文字','contactus','联系我们','','','',4,1553606219,1553606219,NULL,NULL,'normal'),(5,'文字','partner','合作伙伴','','','<li><a href=\"/\"><img src=\"__ADDON__/img/logo/58.png\" /></a></li><li><a href=\"/\"><img src=\"__ADDON__/img/logo/360.png\" /></a></li><li><a href=\"/\"><img src=\"__ADDON__/img/logo/alipay.png\" /></a></li><li><a href=\"/\"><img src=\"__ADDON__/img/logo/baidu.png\" /></a></li><li><a href=\"/\"><img src=\"__ADDON__/img/logo/boc.png\" /></a></li><li><a href=\"/\"><img src=\"__ADDON__/img/logo/cctv.png\" /></a></li><li><a href=\"/\"><img src=\"__ADDON__/img/logo/didi.png\" /></a></li><li><a href=\"/\"><img src=\"__ADDON__/img/logo/iqiyi.png\" /></a></li><li><a href=\"/\"><img src=\"__ADDON__/img/logo/qq.png\" /></a></li><li><a href=\"/\"><img src=\"__ADDON__/img/logo/suning.png\" /></a></li><li><a href=\"/\"><img src=\"__ADDON__/img/logo/taobao.png\" /></a></li><li><a href=\"/\"><img src=\"__ADDON__/img/logo/tuniu.png\" /></a></li><li><a href=\"/\"><img src=\"__ADDON__/img/logo/weibo.png\" /></a></li>',5,1553606219,1553757753,NULL,NULL,'normal'),(6,'文字','footer','底部链接','','','<div class=\"col-md-3 col-sm-3\">\n                            <div class=\"footer-logo\">\n                                <a href=\"#\"><i class=\"fa fa-bookmark\"></i></a>\n                            </div>\n                            <p class=\"copyright\"><small>© 2017-2020. All Rights Reserved. <br>\n                                    FastAdmin\n                                </small>\n                            </p>\n                        </div>\n                        <div class=\"col-md-5 col-md-push-1 col-sm-5 col-sm-push-1\">\n                            <div class=\"row\">\n                                <div class=\"col-xs-4\">\n                                    <ul class=\"links\">\n                                        <li><a href=\"#\">关于我们</a></li>\n                                        <li><a href=\"#\">发展历程</a></li>\n                                        <li><a href=\"#\">服务项目</a></li>\n                                        <li><a href=\"#\">团队成员</a></li>\n                                    </ul>\n                                </div>\n                                <div class=\"col-xs-4\">\n                                    <ul class=\"links\">\n                                        <li><a href=\"#\">新闻</a></li>\n                                        <li><a href=\"#\">资讯</a></li>\n                                        <li><a href=\"#\">推荐</a></li>\n                                        <li><a href=\"#\">博客</a></li>\n                                    </ul>\n                                </div>\n                                <div class=\"col-xs-4\">\n                                    <ul class=\"links\">\n                                        <li><a href=\"#\">服务</a></li>\n                                        <li><a href=\"#\">圈子</a></li>\n                                        <li><a href=\"#\">论坛</a></li>\n                                        <li><a href=\"#\">广告</a></li>\n                                    </ul>\n                                </div>\n                            </div>\n                        </div>\n                        <div class=\"col-md-3 col-sm-3 col-md-push-1 col-sm-push-1\">\n                            <div class=\"footer-social\">\n                                <a href=\"#\"><i class=\"fa fa-weibo\"></i></a>\n                                <a href=\"#\"><i class=\"fa fa-qq\"></i></a>\n                                <a href=\"#\"><i class=\"fa fa-wechat\"></i></a>\n                            </div>\n                        </div>',6,1553606219,1553606219,NULL,NULL,'normal'),(7,'文字','friendlink','友情链接 ','','','<a href=\"https://www.fastadmin.net\" title=\"FastAdmin - 极速后台开发框架\">FastAdmin</a> <a href=\"https://gitee.com\" title=\"FastAdmin码云仓库\">码云</a> <a href=\"https://github.com\" title=\"FastAdminGithub仓库\">Github</a> <a href=\"https://doc.fastadmin.net\" title=\"FastAdmin文档 - 极速后台开发框架\">FastAdmin文档</a> <a href=\"https://ask.fastadmin.net\" title=\"FastAdmin问答社区 - 极速后台开发框架\">FastAdmin问答社区</a>',7,1553606219,1553757863,NULL,NULL,'normal'),(8,'边栏','sidebarad1','边栏广告1','https://cdn.fastadmin.net/assets/addons/ask/img/sidebar/howto.png','http://www.fastadmin.net','<a href=\"https://www.fastadmin.net/store/ask.html\">\r\n    <img src=\"https://cdn.fastadmin.net/assets/addons/ask/img/sidebar/howto.png\" class=\"img-responsive\">\r\n</a>',8,1553606219,1553958914,NULL,NULL,'normal'),(9,'边栏','sidebarad2','边栏广告2','https://cdn.fastadmin.net/uploads/store/aliyun-sidebar.png','http://www.fastadmin.net','<a href=\"https://www.fastadmin.net/go/aliyun\" rel=\"nofollow\" title=\"FastAdmin推荐企业服务器\" target=\"_blank\">\r\n        <img src=\"https://cdn.fastadmin.net/uploads/store/aliyun-sidebar.png\" class=\"img-responsive\" alt=\"\">\r\n</a>',9,1553606219,1553958942,NULL,NULL,'normal'),(10,'焦点图','downloadfocus','下载中心焦点图标题1','https://cdn.fastadmin.net/uploads/focus/4.jpg','/','',10,1553606219,1553606257,NULL,NULL,'normal'),(11,'焦点图','downloadfocus','下载中心焦点图标题2','https://cdn.fastadmin.net/uploads/focus/5.jpg','/','',11,1553606243,1553606273,NULL,NULL,'normal'),(12,'焦点图','downloadfocus','下载中心焦点图标题3','https://cdn.fastadmin.net/uploads/focus/6.jpg','/','',12,1553607965,1553607965,NULL,NULL,'normal'),(13,'焦点图','downloadfocus','下载中心焦点图标题4','https://cdn.fastadmin.net/uploads/focus/7.jpg','/','',13,1553608006,1553608006,NULL,NULL,'normal'),(14,'焦点图','downloadfocus','下载中心焦点图标题5','https://cdn.fastadmin.net/uploads/focus/8.jpg','/','',14,1553608049,1553608049,NULL,NULL,'normal'),(15,'焦点图','downloadfocus','下载中心焦点图标题6','https://cdn.fastadmin.net/uploads/focus/9.jpg','/','',15,1553608086,1553608086,NULL,NULL,'normal'),(16,'焦点图','newsfocus','新闻中心焦点图标题1','https://cdn.fastadmin.net/uploads/focus/10.jpg','/','',16,1553606219,1553606257,NULL,NULL,'normal'),(17,'焦点图','newsfocus','新闻中心焦点图标题2','https://cdn.fastadmin.net/uploads/focus/11.jpg','/','',17,1553606243,1553606273,NULL,NULL,'normal'),(18,'焦点图','newsfocus','新闻中心焦点图标题3','https://cdn.fastadmin.net/uploads/focus/12.jpg','/','',18,1553607965,1553607965,NULL,NULL,'normal'),(19,'焦点图','newsfocus','新闻中心焦点图标题4','https://cdn.fastadmin.net/uploads/focus/13.jpg','/','',19,1553608006,1553608006,NULL,NULL,'normal'),(20,'焦点图','newsfocus','新闻中心焦点图标题5','https://cdn.fastadmin.net/uploads/focus/14.jpg','/','',20,1553608049,1553608049,NULL,NULL,'normal'),(21,'焦点图','newsfocus','新闻中心焦点图标题6','https://cdn.fastadmin.net/uploads/focus/15.jpg','/','',21,1553608086,1553608086,NULL,NULL,'normal'),(22,'焦点图','productfocus','产品中心焦点图标题1','https://cdn.fastadmin.net/uploads/focus/16.jpg','/','',22,1553606219,1553606257,NULL,NULL,'normal'),(23,'焦点图','productfocus','产品中心焦点图标题2','https://cdn.fastadmin.net/uploads/focus/17.jpg','/','',23,1553606243,1553606273,NULL,NULL,'normal'),(24,'焦点图','productfocus','产品中心焦点图标题3','https://cdn.fastadmin.net/uploads/focus/18.jpg','/','',24,1553607965,1553607965,NULL,NULL,'normal'),(25,'焦点图','productfocus','产品中心焦点图标题4','https://cdn.fastadmin.net/uploads/focus/19.jpg','/','',25,1553608006,1553608006,NULL,NULL,'normal'),(26,'焦点图','productfocus','产品中心焦点图标题5','https://cdn.fastadmin.net/uploads/focus/20.jpg','/','',26,1553608049,1553608049,NULL,NULL,'normal'),(27,'焦点图','productfocus','产品中心焦点图标题6','https://cdn.fastadmin.net/uploads/focus/21.jpg','/','',27,1553608086,1553608086,NULL,NULL,'normal'),(28,'边栏','sidebarad3','边栏广告3','https://cdn.fastadmin.net/uploads/store/enterprisehost.png','http://www.fastadmin.net/go/aliyun','',9,1553606219,1553958942,NULL,NULL,'normal');
/*!40000 ALTER TABLE `sms_cms_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_cms_channel`
--

DROP TABLE IF EXISTS `sms_cms_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_cms_channel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('channel','page','link','list') NOT NULL COMMENT '类型',
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型ID',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '名称',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `flag` varchar(100) DEFAULT '' COMMENT '标志',
  `seotitle` varchar(255) NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `diyname` varchar(30) NOT NULL DEFAULT '' COMMENT '自定义名称',
  `outlink` varchar(255) NOT NULL DEFAULT '' COMMENT '外部链接',
  `items` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '文章数量',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `channeltpl` varchar(100) NOT NULL DEFAULT '' COMMENT '栏目页模板',
  `listtpl` varchar(100) NOT NULL DEFAULT '' COMMENT '列表页模板',
  `showtpl` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页模板',
  `pagesize` smallint(5) NOT NULL DEFAULT '0' COMMENT '分页大小',
  `iscontribute` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否可投稿',
  `isnav` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否导航显示',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `status` enum('normal','hidden') NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `diyname` (`diyname`),
  KEY `weigh` (`weigh`,`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='栏目表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_cms_channel`
--

LOCK TABLES `sms_cms_channel` WRITE;
/*!40000 ALTER TABLE `sms_cms_channel` DISABLE KEYS */;
INSERT INTO `sms_cms_channel` VALUES (2,'list',1,0,'美国','','','','','','meiguo','',15,100,'','list_news.html','show_news.html',10,0,1,1598138080,1598231316,'normal'),(3,'list',1,0,'中国大陆','','','','','','zhongguodalu','',0,99,'','list_news.html','show_news.html',10,0,1,1598227708,1598231327,'normal'),(4,'list',1,0,'中国港澳台','','','','','','zhongguogangaotai','',0,98,'','list_news.html','show_news.html',10,0,1,1598227719,1598231333,'normal'),(5,'list',1,0,'英国','','','','','','yingguo','',0,5,'','list_news.html','show_news.html',10,0,1,1598227744,1598227744,'normal'),(6,'list',1,0,'德国','','','','','','deguo','',0,6,'','list_news.html','show_news.html',10,0,1,1598227751,1598227751,'normal'),(7,'list',1,0,'澳大利亚','','','','','','aodaliya','',0,7,'','list_news.html','show_news.html',10,0,1,1598227758,1598227758,'normal'),(8,'list',1,0,'俄罗斯','','','','','','eluosi','',0,8,'','list_news.html','show_news.html',10,0,1,1598227764,1598227764,'normal'),(9,'list',1,0,'东南亚','','','','','','dongnanya','',1,9,'','list_news.html','show_news.html',10,0,1,1598227771,1598227771,'normal');
/*!40000 ALTER TABLE `sms_cms_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_cms_channel_admin`
--

DROP TABLE IF EXISTS `sms_cms_channel_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_cms_channel_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `channel_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '栏目ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_id` (`admin_id`,`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='栏目权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_cms_channel_admin`
--

LOCK TABLES `sms_cms_channel_admin` WRITE;
/*!40000 ALTER TABLE `sms_cms_channel_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_cms_channel_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_cms_comment`
--

DROP TABLE IF EXISTS `sms_cms_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_cms_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `type` enum('archives','page','special') NOT NULL DEFAULT 'archives' COMMENT '类型',
  `aid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联ID',
  `pid` int(10) NOT NULL DEFAULT '0' COMMENT '父ID',
  `content` text COMMENT '内容',
  `comments` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `ip` varchar(50) NOT NULL DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) NOT NULL DEFAULT '' COMMENT 'User Agent',
  `subscribe` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '订阅',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `deletetime` int(10) DEFAULT NULL COMMENT '删除时间',
  `status` enum('normal','hidden') NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `post_id` (`aid`,`pid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_cms_comment`
--

LOCK TABLES `sms_cms_comment` WRITE;
/*!40000 ALTER TABLE `sms_cms_comment` DISABLE KEYS */;
INSERT INTO `sms_cms_comment` VALUES (1,2,'archives',10,0,'121212',0,'127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1,1598224547,1598224547,NULL,'normal'),(2,2,'archives',10,0,'2323232324121212',0,'127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',1,1598224591,1598224591,NULL,'normal');
/*!40000 ALTER TABLE `sms_cms_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_cms_diyform`
--

DROP TABLE IF EXISTS `sms_cms_diyform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_cms_diyform` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` int(10) unsigned DEFAULT '0' COMMENT '管理员ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '表单名称',
  `title` varchar(100) DEFAULT NULL COMMENT '表单标题',
  `seotitle` varchar(255) NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `keywords` varchar(100) DEFAULT NULL COMMENT '关键字',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `table` varchar(50) NOT NULL DEFAULT '' COMMENT '表名',
  `fields` text COMMENT '字段列表',
  `needlogin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否需要登录',
  `successtips` varchar(255) DEFAULT NULL COMMENT '成功提示文字',
  `redirecturl` varchar(100) DEFAULT NULL COMMENT '成功后跳转链接',
  `formtpl` varchar(30) NOT NULL DEFAULT '' COMMENT '表单页模板',
  `diyname` varchar(30) DEFAULT NULL COMMENT '自定义名称',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `setting` varchar(1500) DEFAULT NULL COMMENT '表单配置',
  `status` enum('normal','hidden') DEFAULT 'hidden' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='自定义表单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_cms_diyform`
--

LOCK TABLES `sms_cms_diyform` WRITE;
/*!40000 ALTER TABLE `sms_cms_diyform` DISABLE KEYS */;
INSERT INTO `sms_cms_diyform` VALUES (1,0,'站内留言','发表留言','','留言板','欢迎给我们留言反馈你的问题','cms_message','name,telephone,qq,content,image',0,'留言已成功提交，我们会在第一时间进行处理','','diyform.html','message',1540091957,1545931244,'','normal');
/*!40000 ALTER TABLE `sms_cms_diyform` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_cms_fields`
--

DROP TABLE IF EXISTS `sms_cms_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_cms_fields` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `model_id` int(10) NOT NULL DEFAULT '0' COMMENT '模型ID',
  `diyform_id` int(10) NOT NULL DEFAULT '0' COMMENT '表单ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '名称',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '类型',
  `title` varchar(30) NOT NULL DEFAULT '' COMMENT '标题',
  `content` text COMMENT '内容',
  `defaultvalue` varchar(100) NOT NULL DEFAULT '' COMMENT '默认值',
  `rule` varchar(100) DEFAULT '' COMMENT '验证规则',
  `msg` varchar(30) DEFAULT '0' COMMENT '错误消息',
  `ok` varchar(30) DEFAULT '0' COMMENT '成功消息',
  `tip` varchar(30) DEFAULT '' COMMENT '提示消息',
  `decimals` tinyint(1) DEFAULT NULL COMMENT '小数点',
  `length` mediumint(8) DEFAULT NULL COMMENT '长度',
  `minimum` smallint(6) DEFAULT NULL COMMENT '最小数量',
  `maximum` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '最大数量',
  `extend` varchar(255) NOT NULL DEFAULT '' COMMENT '扩展信息',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `createtime` int(10) DEFAULT NULL COMMENT '添加时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `iscontribute` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否可投稿',
  `isfilter` tinyint(1) NOT NULL DEFAULT '0' COMMENT '筛选',
  `status` enum('normal','hidden') NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `model_id` (`model_id`) USING BTREE,
  KEY `diyform_id` (`diyform_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='模型字段表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_cms_fields`
--

LOCK TABLES `sms_cms_fields` WRITE;
/*!40000 ALTER TABLE `sms_cms_fields` DISABLE KEYS */;
INSERT INTO `sms_cms_fields` VALUES (1,0,1,'name','string','姓名','value1|title1\r\nvalue2|title2','','required','','','',0,50,0,0,'',136,1540110334,1540110334,1,0,'normal'),(2,0,1,'telephone','string','手机','value1|title1\r\nvalue2|title2','','required,mobile','','','',0,50,0,0,'',135,1540110369,1540110369,1,0,'normal'),(3,0,1,'qq','string','QQ','value1|title1\r\nvalue2|title2','','digits','','','',0,30,0,0,'',134,1540110394,1540110394,1,0,'normal'),(4,0,1,'content','editor','内容','value1|title1\r\nvalue2|title2','','required','','','',0,255,0,0,'',133,1540110415,1540110415,1,0,'normal'),(5,1,0,'quhao','string','区号','value1|title1\r\nvalue2|title2','','','','','',0,50,0,0,'',136,1508990735,1598233690,1,1,'normal'),(6,2,0,'productdata','images','产品列表','value1|title1\r\nvalue2|title2','','required','','','',0,1500,0,20,'',139,1508992518,1508992518,1,1,'normal'),(7,1,0,'price','number','价格','value1|title1\r\nvalue2|title2','0','','','','',2,10,0,0,'',140,1508992093,1553759366,1,1,'normal'),(8,0,1,'image','image','图片','value1|title1\r\nvalue2|title2','','','','','',0,255,0,0,'',132,1545931244,1553996445,1,0,'normal'),(9,3,0,'os','checkbox','操作系统','windows|Windows\r\nlinux|Linux\r\nmac|Mac\r\nubuntu|Ubuntu','','','','','',0,255,0,0,'',143,1553508185,1553508185,1,1,'normal'),(10,3,0,'version','string','最新版本','value1|title1\r\nvalue2|title2','','','','','',0,255,0,0,'',144,1553508231,1553775383,1,0,'normal'),(11,3,0,'filesize','string','文件大小','value1|title1\r\nvalue2|title2','','','','','',0,255,0,0,'',145,1553508273,1553775381,1,0,'normal'),(12,3,0,'language','checkbox','语言','zh-cn|中文\r\nen|英文','','','','','',0,255,0,0,'',146,1553508324,1553775371,1,1,'normal'),(13,3,0,'downloadurl','array','下载地址','local|本地下载地址\r\nbaidu|百度网盘地址','','','','','',0,255,0,0,'',147,1553508466,1553775368,1,0,'normal'),(14,3,0,'screenshots','images','预览截图','value1|title1\r\nvalue2|title2','','','','','',0,1500,0,0,'',148,1553509260,1553775364,1,0,'normal'),(15,3,0,'price','number','价格','value1|title1\r\nvalue2|title2','0','','','','',2,10,0,0,'',149,1553527695,1553775363,1,0,'normal'),(16,3,0,'downloads','string','下载次数','value1|title1\r\nvalue2|title2','0','','','','',0,10,0,0,'',150,1553744995,1553775359,1,0,'normal');
/*!40000 ALTER TABLE `sms_cms_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_cms_message`
--

DROP TABLE IF EXISTS `sms_cms_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_cms_message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL COMMENT '会员ID',
  `createtime` int(10) DEFAULT NULL COMMENT '添加时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `name` varchar(50) DEFAULT '' COMMENT '姓名',
  `telephone` varchar(100) DEFAULT '' COMMENT '电话',
  `qq` varchar(30) DEFAULT '' COMMENT 'QQ',
  `content` text COMMENT '内容',
  `image` varchar(100) DEFAULT '' COMMENT '图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='站内留言';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_cms_message`
--

LOCK TABLES `sms_cms_message` WRITE;
/*!40000 ALTER TABLE `sms_cms_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_cms_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_cms_model`
--

DROP TABLE IF EXISTS `sms_cms_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_cms_model` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(30) NOT NULL DEFAULT '' COMMENT '模型名称',
  `table` char(20) NOT NULL DEFAULT '' COMMENT '表名',
  `fields` text COMMENT '字段列表',
  `channeltpl` varchar(30) NOT NULL DEFAULT '' COMMENT '栏目页模板',
  `listtpl` varchar(30) NOT NULL DEFAULT '' COMMENT '列表页模板',
  `showtpl` varchar(30) NOT NULL DEFAULT '' COMMENT '详情页模板',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `setting` text COMMENT '模型配置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='内容模型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_cms_model`
--

LOCK TABLES `sms_cms_model` WRITE;
/*!40000 ALTER TABLE `sms_cms_model` DISABLE KEYS */;
INSERT INTO `sms_cms_model` VALUES (1,'新闻','cms_addonnews','quhao,price','channel_news.html','list_news.html','show_news.html',1508990659,1598233690,'{\"contibutefields\":[\"image\",\"tags\",\"content\"]}');
/*!40000 ALTER TABLE `sms_cms_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_cms_order`
--

DROP TABLE IF EXISTS `sms_cms_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_cms_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `orderid` varchar(50) DEFAULT '' COMMENT '订单ID',
  `user_id` int(10) unsigned DEFAULT '0' COMMENT '会员ID',
  `archives_id` int(10) unsigned DEFAULT '0' COMMENT '文档ID',
  `title` varchar(100) DEFAULT NULL COMMENT '订单标题',
  `amount` double(10,2) unsigned DEFAULT '0.00' COMMENT '订单金额',
  `payamount` double(10,2) unsigned DEFAULT '0.00' COMMENT '支付金额',
  `paytype` varchar(50) DEFAULT NULL COMMENT '支付类型',
  `paytime` int(10) DEFAULT NULL COMMENT '支付时间',
  `ip` varchar(50) DEFAULT NULL COMMENT 'IP地址',
  `useragent` varchar(255) DEFAULT NULL COMMENT 'UserAgent',
  `memo` varchar(255) DEFAULT NULL COMMENT '备注',
  `createtime` int(10) DEFAULT NULL COMMENT '添加时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `status` enum('created','paid','expired') DEFAULT 'created' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `archives_id` (`archives_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_cms_order`
--

LOCK TABLES `sms_cms_order` WRITE;
/*!40000 ALTER TABLE `sms_cms_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_cms_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_cms_page`
--

DROP TABLE IF EXISTS `sms_cms_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_cms_page` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `category_id` int(10) NOT NULL DEFAULT '0' COMMENT '分类ID',
  `admin_id` int(10) unsigned DEFAULT '0' COMMENT '管理员ID',
  `type` varchar(50) NOT NULL DEFAULT '' COMMENT '类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `seotitle` varchar(255) NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `flag` varchar(100) DEFAULT '' COMMENT '标志',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '头像',
  `content` text COMMENT '内容',
  `icon` varchar(50) NOT NULL DEFAULT '' COMMENT '图标',
  `views` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击',
  `likes` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点赞',
  `dislikes` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点踩',
  `comments` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论',
  `diyname` varchar(50) NOT NULL DEFAULT '' COMMENT '自定义',
  `showtpl` varchar(50) NOT NULL DEFAULT '' COMMENT '视图模板',
  `iscomment` tinyint(1) unsigned DEFAULT '1' COMMENT '是否允许评论',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `deletetime` int(10) DEFAULT NULL COMMENT '删除时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='单页表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_cms_page`
--

LOCK TABLES `sms_cms_page` WRITE;
/*!40000 ALTER TABLE `sms_cms_page` DISABLE KEYS */;
INSERT INTO `sms_cms_page` VALUES (1,0,0,'page','FastAdmin - 基于ThinkPHP5和Bootstrap的极速后台开发框架','','','','','','<p>FastAdmin是一款基于ThinkPHP5+Bootstrap的极速后台开发框架。</p><h2 style=\"font-family:&quot;PingFang SC&quot;;white-space:normal;\">主要特性</h2><ul><li><p>基于<code>Auth</code>验证的权限管理系统</p><ul><li>支持无限级父子级权限继承，父级的管理员可任意增删改子级管理员及权限设置</li><li>支持单管理员多角色</li><li>支持管理子级数据或个人数据</li></ul></li><li><p>强大的一键生成功能</p><ul><li>一键生成CRUD,包括控制器、模型、视图、JS、语言包、菜单等</li><li>一键压缩打包JS和CSS文件，一键CDN静态资源部署</li><li>一键生成控制器菜单和规则</li><li>一键生成API接口文档</li></ul></li><li><p>完善的前端功能组件开发</p><ul><li>基于<code>AdminLTE</code>二次开发</li><li>基于<code>Bootstrap</code>开发，自适应手机、平板、PC</li><li>基于<code>RequireJS</code>进行JS模块管理，按需加载</li><li>基于<code>Less</code>进行样式开发</li><li>基于<code>Bower</code>进行前端组件包管理</li></ul></li><li><p>强大的插件扩展功能，在线安装卸载升级插件</p></li><li><p>通用的会员模块和API模块</p></li><li><p>共用同一账号体系的Web端会员中心权限验证和API接口会员权限验证</p></li><li><p>二级域名部署支持，同时域名支持绑定到插件</p></li><li><p>多语言支持，服务端及客户端支持</p></li><li><p>强大的第三方模块支持(<a href=\"https://www.fastadmin.net/store/cms.html\">CMS</a>、<a href=\"https://www.fastadmin.net/store/blog.html\">博客</a>、<a href=\"https://www.fastadmin.net/store/docs.html\">文档生成</a>)</p></li><li><p>整合第三方短信接口(阿里云、腾讯云短信)</p></li><li><p>无缝整合第三方云存储(七牛、阿里云OSS、又拍云)功能</p></li><li><p>第三方富文本编辑器支持(Summernote、Tinymce、百度编辑器)</p></li><li><p>第三方登录(QQ、微信、微博)整合</p></li><li><p>Ucenter整合第三方应用</p></li></ul><h2 style=\"font-family:&quot;PingFang SC&quot;;white-space:normal;\">安装使用</h2><p><a href=\"https://doc.fastadmin.net/\">https://doc.fastadmin.net</a></p><h2 style=\"font-family:&quot;PingFang SC&quot;;white-space:normal;\">在线演示</h2><p><a href=\"https://demo.fastadmin.net/\">https://demo.fastadmin.net</a></p><p>用户名：admin</p><p>密&emsp;码：123456</p><p>提&emsp;示：演示站数据无法进行修改，请下载源码安装体验全部功能</p><h2 style=\"font-family:&quot;PingFang SC&quot;;white-space:normal;\">界面截图</h2><p><img src=\"https://gitee.com/uploads/images/2017/0411/113717_e99ff3e7_10933.png\" alt=\"控制台\" referrerpolicy=\"no-referrer\" /></p><h2 style=\"font-family:&quot;PingFang SC&quot;;white-space:normal;\">问题反馈</h2><p>在使用中有任何问题，请使用以下联系方式联系我们</p><p>交流社区:&nbsp;<a href=\"https://forum.fastadmin.net/\">https://forum.fastadmin.net</a></p><p>QQ群:&nbsp;<a href=\"https://jq.qq.com/?_wv=1027&amp;k=487PNBb\">636393962</a>(满)&nbsp;<a href=\"https://jq.qq.com/?_wv=1027&amp;k=5ObjtwM\">708784003</a>(满)&nbsp;<a href=\"https://jq.qq.com/?_wv=1027&amp;k=59qjU2P\">964776039</a>(3群)</p><p>Email: (karsonzhang#163.com, 把#换成@)</p><p>Github:&nbsp;<a href=\"https://github.com/karsonzhang/fastadmin\" target=\"_blank\" class=\"url\">https://github.com/karsonzhang/fastadmin</a></p><p>Gitee:&nbsp;<a href=\"https://gitee.com/karson/fastadmin\" target=\"_blank\" class=\"url\">https://gitee.com/karson/fastadmin</a></p><h2 style=\"font-family:&quot;PingFang SC&quot;;white-space:normal;\">特别鸣谢</h2><p>感谢以下的项目,排名不分先后</p><p>ThinkPHP：<a href=\"http://www.thinkphp.cn/\">http://www.thinkphp.cn</a></p><p>AdminLTE：<a href=\"https://adminlte.io/\">https://adminlte.io</a></p><p>Bootstrap：<a href=\"http://getbootstrap.com/\">http://getbootstrap.com</a></p><p>jQuery：<a href=\"http://jquery.com/\">http://jquery.com</a></p><p>Bootstrap-table：<a href=\"https://github.com/wenzhixin/bootstrap-table\" target=\"_blank\" class=\"url\">https://github.com/wenzhixin/bootstrap-table</a></p><p>Nice-validator:&nbsp;<a href=\"https://validator.niceue.com/\">https://validator.niceue.com</a></p><p>SelectPage:&nbsp;<a href=\"https://github.com/TerryZ/SelectPage\" target=\"_blank\" class=\"url\">https://github.com/TerryZ/SelectPage</a></p><h2 style=\"font-family:&quot;PingFang SC&quot;;white-space:normal;\">版权信息</h2><p>FastAdmin遵循Apache2开源协议发布，并提供免费使用。</p><p>本项目包含的第三方源码和二进制文件之版权信息另行标注。</p><p>版权所有Copyright &copy; 2017-2018 by FastAdmin (<a href=\"https://www.fastadmin.net/\">https://www.fastadmin.net</a>)</p><p>All rights reserved。</p>','',547,225,0,0,'aboutus','page',1,1508933935,1553769449,NULL,1,'normal');
/*!40000 ALTER TABLE `sms_cms_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_cms_search_log`
--

DROP TABLE IF EXISTS `sms_cms_search_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_cms_search_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `keywords` varchar(100) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '关键字',
  `nums` int(10) unsigned DEFAULT '0' COMMENT '搜索次数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `keywords` (`keywords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='搜索记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_cms_search_log`
--

LOCK TABLES `sms_cms_search_log` WRITE;
/*!40000 ALTER TABLE `sms_cms_search_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_cms_search_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_cms_special`
--

DROP TABLE IF EXISTS `sms_cms_special`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_cms_special` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` int(10) unsigned DEFAULT '0' COMMENT '管理员ID',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `tag_ids` varchar(1500) DEFAULT '' COMMENT '标签ID集合',
  `andor` enum('and','or') DEFAULT 'or' COMMENT '索引与或',
  `flag` varchar(100) DEFAULT '' COMMENT '标志',
  `label` varchar(50) NOT NULL DEFAULT '' COMMENT '标签',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `banner` varchar(100) NOT NULL DEFAULT '' COMMENT 'Banner图片',
  `diyname` varchar(50) NOT NULL DEFAULT '' COMMENT '自定义名称',
  `seotitle` varchar(255) NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `keywords` varchar(100) DEFAULT NULL COMMENT '关键字',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `intro` varchar(255) DEFAULT NULL COMMENT '专题介绍',
  `views` int(10) unsigned DEFAULT '0' COMMENT '浏览次数',
  `comments` int(10) unsigned DEFAULT '0' COMMENT '评论次数',
  `iscomment` tinyint(1) unsigned DEFAULT '1' COMMENT '是否允许评论',
  `createtime` int(10) DEFAULT NULL COMMENT '添加时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `deletetime` int(10) DEFAULT NULL COMMENT '删除时间',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '专题模板',
  `status` enum('normal','hidden') NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='专题表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_cms_special`
--

LOCK TABLES `sms_cms_special` WRITE;
/*!40000 ALTER TABLE `sms_cms_special` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_cms_special` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_cms_tags`
--

DROP TABLE IF EXISTS `sms_cms_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_cms_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '标签名称',
  `archives` text COMMENT '文档ID集合',
  `nums` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档数量',
  `seotitle` varchar(100) DEFAULT '' COMMENT 'SEO标题',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `nums` (`nums`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='标签表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_cms_tags`
--

LOCK TABLES `sms_cms_tags` WRITE;
/*!40000 ALTER TABLE `sms_cms_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_cms_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_config`
--

DROP TABLE IF EXISTS `sms_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '变量名',
  `group` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '分组',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '变量标题',
  `tip` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '变量描述',
  `type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '类型:string,text,int,bool,array,datetime,date,file',
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '变量值',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '变量字典数据',
  `rule` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '验证规则',
  `extend` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '扩展属性',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='系统配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_config`
--

LOCK TABLES `sms_config` WRITE;
/*!40000 ALTER TABLE `sms_config` DISABLE KEYS */;
INSERT INTO `sms_config` VALUES (1,'name','basic','Site name','请填写站点名称','string','sms','','required',''),(2,'beian','basic','Beian','粤ICP备15000000号-1','string','','','',''),(3,'cdnurl','basic','Cdn url','如果静态资源使用第三方云储存请配置该值','string','','','',''),(4,'version','basic','Version','如果静态资源有变动请重新配置该值','string','1.0.1','','required',''),(5,'timezone','basic','Timezone','','string','Asia/Shanghai','','required',''),(6,'forbiddenip','basic','Forbidden ip','一行一条记录','text','','','',''),(7,'languages','basic','Languages','','array','{\"backend\":\"zh-cn\",\"frontend\":\"zh-cn\"}','','required',''),(8,'fixedpage','basic','Fixed page','请尽量输入左侧菜单栏存在的链接','string','dashboard','','required',''),(9,'categorytype','dictionary','Category type','','array','{\"default\":\"Default\",\"page\":\"Page\",\"article\":\"Article\",\"test\":\"Test\"}','','',''),(10,'configgroup','dictionary','Config group','','array','{\"basic\":\"Basic\",\"email\":\"Email\",\"dictionary\":\"Dictionary\",\"user\":\"User\",\"example\":\"Example\"}','','',''),(11,'mail_type','email','Mail type','选择邮件发送方式','select','1','[\"Please select\",\"SMTP\",\"Mail\"]','',''),(12,'mail_smtp_host','email','Mail smtp host','错误的配置发送邮件会导致服务器超时','string','smtp.qq.com','','',''),(13,'mail_smtp_port','email','Mail smtp port','(不加密默认25,SSL默认465,TLS默认587)','string','465','','',''),(14,'mail_smtp_user','email','Mail smtp user','（填写完整用户名）','string','10000','','',''),(15,'mail_smtp_pass','email','Mail smtp password','（填写您的密码）','string','password','','',''),(16,'mail_verify_type','email','Mail vertify type','（SMTP验证方式[推荐SSL]）','select','2','[\"None\",\"TLS\",\"SSL\"]','',''),(17,'mail_from','email','Mail from','','string','10000@qq.com','','','');
/*!40000 ALTER TABLE `sms_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_ems`
--

DROP TABLE IF EXISTS `sms_ems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_ems` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '事件',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  `code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '验证码',
  `times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证次数',
  `ip` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'IP',
  `createtime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='邮箱验证码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_ems`
--

LOCK TABLES `sms_ems` WRITE;
/*!40000 ALTER TABLE `sms_ems` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_ems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_sms`
--

DROP TABLE IF EXISTS `sms_sms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_sms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '事件',
  `mobile` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '验证码',
  `times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证次数',
  `ip` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'IP',
  `createtime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='短信验证码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_sms`
--

LOCK TABLES `sms_sms` WRITE;
/*!40000 ALTER TABLE `sms_sms` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_sms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_test`
--

DROP TABLE IF EXISTS `sms_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_test` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类ID(单选)',
  `category_ids` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分类ID(多选)',
  `week` enum('monday','tuesday','wednesday') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '星期(单选):monday=星期一,tuesday=星期二,wednesday=星期三',
  `flag` set('hot','index','recommend') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标志(多选):hot=热门,index=首页,recommend=推荐',
  `genderdata` enum('male','female') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'male' COMMENT '性别(单选):male=男,female=女',
  `hobbydata` set('music','reading','swimming') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '爱好(多选):music=音乐,reading=读书,swimming=游泳',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标题',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  `image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '图片',
  `images` varchar(1500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '图片组',
  `attachfile` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '附件',
  `keywords` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '描述',
  `city` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '省市',
  `json` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '配置:key=名称,value=值',
  `price` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '价格',
  `views` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击',
  `startdate` date DEFAULT NULL COMMENT '开始日期',
  `activitytime` datetime DEFAULT NULL COMMENT '活动时间(datetime)',
  `year` year(4) DEFAULT NULL COMMENT '年',
  `times` time DEFAULT NULL COMMENT '时间',
  `refreshtime` int(10) DEFAULT NULL COMMENT '刷新时间(int)',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `deletetime` int(10) DEFAULT NULL COMMENT '删除时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `switch` tinyint(1) NOT NULL DEFAULT '0' COMMENT '开关',
  `status` enum('normal','hidden') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'normal' COMMENT '状态',
  `state` enum('0','1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '状态值:0=禁用,1=正常,2=推荐',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='测试表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_test`
--

LOCK TABLES `sms_test` WRITE;
/*!40000 ALTER TABLE `sms_test` DISABLE KEYS */;
INSERT INTO `sms_test` VALUES (1,0,12,'12,13','monday','hot,index','male','music,reading','我是一篇测试文章','<p>我是测试内容</p>','/assets/img/avatar.png','/assets/img/avatar.png,/assets/img/qrcode.png','/assets/img/avatar.png','关键字','描述','广西壮族自治区/百色市/平果县','{\"a\":\"1\",\"b\":\"2\"}',0.00,0,'2017-07-10','2017-07-10 18:24:45',2017,'18:24:45',1499682285,1499682526,1499682526,NULL,0,1,'normal','1');
/*!40000 ALTER TABLE `sms_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_user`
--

DROP TABLE IF EXISTS `sms_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '组别ID',
  `username` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '密码盐',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `mobile` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '头像',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '等级',
  `gender` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `bio` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '格言',
  `money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '余额',
  `score` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '积分',
  `successions` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '连续登录天数',
  `maxsuccessions` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '最大连续登录天数',
  `prevtime` int(10) DEFAULT NULL COMMENT '上次登录时间',
  `logintime` int(10) DEFAULT NULL COMMENT '登录时间',
  `loginip` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '登录IP',
  `loginfailure` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '失败次数',
  `joinip` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '加入IP',
  `jointime` int(10) DEFAULT NULL COMMENT '加入时间',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `token` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Token',
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '状态',
  `verification` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '验证',
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `email` (`email`),
  KEY `mobile` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='会员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_user`
--

LOCK TABLES `sms_user` WRITE;
/*!40000 ALTER TABLE `sms_user` DISABLE KEYS */;
INSERT INTO `sms_user` VALUES (1,1,'admin','admin','c13f62012fd6a8fdf06b3452a94430e5','rpR6Bv','admin@163.com','13888888888','',0,0,'2017-04-15','',0.00,0,1,1,1516170492,1516171614,'127.0.0.1',0,'127.0.0.1',1491461418,0,1516171614,'','normal',''),(2,0,'111111','111111','0200a656a1d824d7ab6b1a60e71bb727','QES3Zk','tsettset@121212.com','13122222222','',1,0,NULL,'',0.00,0,1,1,1598224540,1598224540,'127.0.0.1',0,'127.0.0.1',1598224540,1598224540,1598224540,'','normal','');
/*!40000 ALTER TABLE `sms_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_user_group`
--

DROP TABLE IF EXISTS `sms_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_user_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '组名',
  `rules` text COLLATE utf8mb4_unicode_ci COMMENT '权限节点',
  `createtime` int(10) DEFAULT NULL COMMENT '添加时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `status` enum('normal','hidden') COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='会员组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_user_group`
--

LOCK TABLES `sms_user_group` WRITE;
/*!40000 ALTER TABLE `sms_user_group` DISABLE KEYS */;
INSERT INTO `sms_user_group` VALUES (1,'默认组','1,2,3,4,5,6,7,8,9,10,11,12',1515386468,1516168298,'normal');
/*!40000 ALTER TABLE `sms_user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_user_money_log`
--

DROP TABLE IF EXISTS `sms_user_money_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_user_money_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变更余额',
  `before` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变更前余额',
  `after` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变更后余额',
  `memo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='会员余额变动表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_user_money_log`
--

LOCK TABLES `sms_user_money_log` WRITE;
/*!40000 ALTER TABLE `sms_user_money_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_user_money_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_user_rule`
--

DROP TABLE IF EXISTS `sms_user_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_user_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) DEFAULT NULL COMMENT '父ID',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '标题',
  `remark` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `ismenu` tinyint(1) DEFAULT NULL COMMENT '是否菜单',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) DEFAULT '0' COMMENT '权重',
  `status` enum('normal','hidden') COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='会员规则表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_user_rule`
--

LOCK TABLES `sms_user_rule` WRITE;
/*!40000 ALTER TABLE `sms_user_rule` DISABLE KEYS */;
INSERT INTO `sms_user_rule` VALUES (1,0,'index','前台','',1,1516168079,1516168079,1,'normal'),(2,0,'api','API接口','',1,1516168062,1516168062,2,'normal'),(3,1,'user','会员模块','',1,1515386221,1516168103,12,'normal'),(4,2,'user','会员模块','',1,1515386221,1516168092,11,'normal'),(5,3,'index/user/login','登录','',0,1515386247,1515386247,5,'normal'),(6,3,'index/user/register','注册','',0,1515386262,1516015236,7,'normal'),(7,3,'index/user/index','会员中心','',0,1516015012,1516015012,9,'normal'),(8,3,'index/user/profile','个人资料','',0,1516015012,1516015012,4,'normal'),(9,4,'api/user/login','登录','',0,1515386247,1515386247,6,'normal'),(10,4,'api/user/register','注册','',0,1515386262,1516015236,8,'normal'),(11,4,'api/user/index','会员中心','',0,1516015012,1516015012,10,'normal'),(12,4,'api/user/profile','个人资料','',0,1516015012,1516015012,3,'normal');
/*!40000 ALTER TABLE `sms_user_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_user_score_log`
--

DROP TABLE IF EXISTS `sms_user_score_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_user_score_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '变更积分',
  `before` int(10) NOT NULL DEFAULT '0' COMMENT '变更前积分',
  `after` int(10) NOT NULL DEFAULT '0' COMMENT '变更后积分',
  `memo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='会员积分变动表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_user_score_log`
--

LOCK TABLES `sms_user_score_log` WRITE;
/*!40000 ALTER TABLE `sms_user_score_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_user_score_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_user_token`
--

DROP TABLE IF EXISTS `sms_user_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_user_token` (
  `token` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Token',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `expiretime` int(10) DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='会员Token表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_user_token`
--

LOCK TABLES `sms_user_token` WRITE;
/*!40000 ALTER TABLE `sms_user_token` DISABLE KEYS */;
INSERT INTO `sms_user_token` VALUES ('57fe398d6e861a517bfeb29d2c4b326d846127a1',2,1598224541,1600816541);
/*!40000 ALTER TABLE `sms_user_token` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-24 10:07:29
