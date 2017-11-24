/*
SQLyog Ultimate v11.13 (64 bit)
MySQL - 5.7.10-log : Database - qiqiim
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`qiqiim` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `qiqiim`;

/*Table structure for table `user_message` */

DROP TABLE IF EXISTS `user_message`;

CREATE TABLE `user_message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `senduser` varchar(100) DEFAULT NULL COMMENT '发送人',
  `receiveuser` varchar(100) DEFAULT NULL COMMENT '接收人',
  `groupid` varchar(100) DEFAULT NULL COMMENT '群ID',
  `isread` int(11) DEFAULT NULL COMMENT '是否已读 0 未读  1 已读',
  `type` int(11) DEFAULT NULL COMMENT '类型 0 单聊消息  1 群消息',
  `content` text COMMENT '消息内容',
  `createuser` bigint(20) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `updatedate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

/*Data for the table `user_message` */

insert  into `user_message`(`id`,`senduser`,`receiveuser`,`groupid`,`isread`,`type`,`content`,`createuser`,`createdate`,`updatedate`) values (29,'DA0875E968961ED8E516B9209AEF424C',NULL,'0',0,1,'测试',NULL,'2017-11-24 10:58:33','2017-11-24 10:58:33'),(30,'DA0875E968961ED8E516B9209AEF424C',NULL,'0',0,1,'测试',NULL,'2017-11-24 10:58:56','2017-11-24 10:58:56'),(31,'269A734E0AC76F7BE6262124BE104BCC',NULL,'0',0,1,'测试什么？\n',NULL,'2017-11-24 10:59:06','2017-11-24 10:59:06');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
