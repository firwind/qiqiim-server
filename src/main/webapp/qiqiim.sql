/*
SQLyog Enterprise - MySQL GUI v8.1 
MySQL - 5.5.36 : Database - qiqiim
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`qiqiim` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `qiqiim`;

/*Table structure for table `qiqi_im_agentservice` */

DROP TABLE IF EXISTS `qiqi_im_agentservice`;

CREATE TABLE `qiqi_im_agentservice` (
  `agentserviceid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenantid` varchar(50) DEFAULT NULL COMMENT '租户id',
  `agentid` varchar(50) DEFAULT NULL COMMENT '座席id',
  `agentname` varchar(50) DEFAULT NULL COMMENT '座席姓名',
  `userid` varchar(50) DEFAULT NULL COMMENT '用户id',
  `username` varchar(50) DEFAULT NULL COMMENT '用户姓名',
  `channel` varchar(50) DEFAULT NULL COMMENT '渠道',
  `starttime` datetime DEFAULT NULL COMMENT '开始时间',
  `responsetime` datetime DEFAULT NULL COMMENT '应答时间',
  `endtime` datetime DEFAULT NULL COMMENT '结束时间',
  `chatstatus` varchar(50) DEFAULT NULL COMMENT '聊天状态',
  `chatcause` varchar(50) DEFAULT NULL COMMENT '聊天建立缘由',
  `sessionid` varchar(50) DEFAULT NULL COMMENT '会话id',
  PRIMARY KEY (`agentserviceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='坐席服务表';

/*Data for the table `qiqi_im_agentservice` */

/*Table structure for table `qiqi_im_agentstatus` */

DROP TABLE IF EXISTS `qiqi_im_agentstatus`;

CREATE TABLE `qiqi_im_agentstatus` (
  `agentstatusid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenantid` varchar(50) DEFAULT NULL COMMENT '租户id',
  `agentid` varchar(50) DEFAULT NULL COMMENT '坐席id',
  `agentname` varchar(50) DEFAULT NULL COMMENT '坐席name',
  `logintime` datetime DEFAULT NULL COMMENT '登录时间',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `agentstatus` varchar(50) DEFAULT NULL COMMENT '坐席状态',
  `users` int(10) unsigned DEFAULT NULL COMMENT '用户数',
  `maxusers` int(10) unsigned DEFAULT NULL COMMENT '最大用户数',
  `skill` varchar(50) DEFAULT NULL COMMENT '技能组',
  PRIMARY KEY (`agentstatusid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='坐席状态表';

/*Data for the table `qiqi_im_agentstatus` */

/*Table structure for table `qiqi_im_agentuser` */

DROP TABLE IF EXISTS `qiqi_im_agentuser`;

CREATE TABLE `qiqi_im_agentuser` (
  `agentuserid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '在线访客id',
  `tenantid` varchar(50) DEFAULT NULL COMMENT '租户id',
  `agentserviceid` int(10) unsigned DEFAULT NULL COMMENT '坐席服务id',
  `sessionid` varchar(50) DEFAULT NULL COMMENT '会话id',
  `agentid` varchar(50) DEFAULT NULL COMMENT '坐席id',
  `agentname` varchar(50) DEFAULT NULL COMMENT '坐席姓名',
  `userid` varchar(50) DEFAULT NULL COMMENT '用户id',
  `username` varchar(50) DEFAULT NULL COMMENT '用户姓名',
  `channel` varchar(50) DEFAULT NULL COMMENT '渠道',
  `skill` varchar(50) DEFAULT NULL COMMENT '技能组',
  `waitingtimme` int(10) unsigned DEFAULT NULL COMMENT '等待时长',
  `agentuserstatus` varchar(50) DEFAULT NULL COMMENT '在线访客状态',
  `logintime` datetime DEFAULT NULL COMMENT '访客登陆时间',
  PRIMARY KEY (`agentuserid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='在线访客表';

/*Data for the table `qiqi_im_agentuser` */

/*Table structure for table `qiqi_im_message` */

DROP TABLE IF EXISTS `qiqi_im_message`;

CREATE TABLE `qiqi_im_message` (
  `messageid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenantid` varchar(50) DEFAULT NULL COMMENT '租户id',
  `agentserviceid` int(10) unsigned DEFAULT NULL COMMENT '坐席服务id',
  `channel` varchar(50) DEFAULT NULL COMMENT '渠道',
  `fromid` varchar(50) DEFAULT NULL COMMENT '发送消息id',
  `fromname` varchar(50) DEFAULT NULL COMMENT '发送消息name',
  `messagefrom` varchar(50) DEFAULT NULL COMMENT '消息来源',
  `messagetype` varchar(50) DEFAULT NULL COMMENT '消息类型',
  `messagetime` datetime DEFAULT NULL COMMENT '消息时间',
  `messagestatus` varchar(50) DEFAULT NULL COMMENT '消息状态',
  `message` varchar(3000) DEFAULT NULL COMMENT '消息内容',
  `chattype` varchar(50) DEFAULT NULL COMMENT '聊天类型',
  `sessionid` varchar(50) DEFAULT NULL COMMENT '会话id',
  `display` varchar(50) DEFAULT NULL COMMENT '显示名称',
  PRIMARY KEY (`messageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='聊天消息表';

/*Data for the table `qiqi_im_message` */

/*Table structure for table `qiqi_user_message` */

DROP TABLE IF EXISTS `qiqi_user_message`;

CREATE TABLE `qiqi_user_message` (
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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

/*Data for the table `qiqi_user_message` */

insert  into `qiqi_user_message`(id,senduser,receiveuser,groupid,isread,type,content,createuser,createdate,updatedate) values (29,'DA0875E968961ED8E516B9209AEF424C',NULL,'0',0,1,'测试',NULL,'2017-11-24 10:58:33','2017-11-24 10:58:33'),(30,'DA0875E968961ED8E516B9209AEF424C',NULL,'0',0,1,'测试',NULL,'2017-11-24 10:58:56','2017-11-24 10:58:56'),(31,'269A734E0AC76F7BE6262124BE104BCC',NULL,'0',0,1,'测试什么？\n',NULL,'2017-11-24 10:59:06','2017-11-24 10:59:06'),(32,'056452510B3525D23D3912ACF358A64D','494B4266F9CE1B2E96FE4F83C14C8EEC','',0,0,'阿萨斯',NULL,'2017-11-25 17:26:25','2017-11-25 17:26:26'),(33,'056452510B3525D23D3912ACF358A64D','494B4266F9CE1B2E96FE4F83C14C8EEC','',0,0,'啊飒飒',NULL,'2017-11-25 17:27:19','2017-11-25 17:27:19'),(34,'056452510B3525D23D3912ACF358A64D','494B4266F9CE1B2E96FE4F83C14C8EEC','',0,0,'阿萨飒飒',NULL,'2017-11-25 17:27:22','2017-11-25 17:27:22'),(35,'056452510B3525D23D3912ACF358A64D','494B4266F9CE1B2E96FE4F83C14C8EEC','',0,0,'阿萨斯',NULL,'2017-11-25 17:30:50','2017-11-25 17:30:50'),(36,'056452510B3525D23D3912ACF358A64D','494B4266F9CE1B2E96FE4F83C14C8EEC','',0,0,'阿萨',NULL,'2017-11-25 17:31:19','2017-11-25 17:31:19'),(37,'494B4266F9CE1B2E96FE4F83C14C8EEC','056452510B3525D23D3912ACF358A64D','',0,0,'阿萨斯',NULL,'2017-11-25 17:31:24','2017-11-25 17:31:24'),(38,'056452510B3525D23D3912ACF358A64D','494B4266F9CE1B2E96FE4F83C14C8EEC','',0,0,'阿萨斯',NULL,'2017-11-25 17:31:28','2017-11-25 17:31:28'),(39,'056452510B3525D23D3912ACF358A64D','494B4266F9CE1B2E96FE4F83C14C8EEC','',0,0,'阿萨斯',NULL,'2017-11-25 17:31:30','2017-11-25 17:31:30'),(40,'494B4266F9CE1B2E96FE4F83C14C8EEC','056452510B3525D23D3912ACF358A64D','',0,0,'阿萨飒飒',NULL,'2017-11-25 17:31:40','2017-11-25 17:31:40'),(41,'056452510B3525D23D3912ACF358A64D','494B4266F9CE1B2E96FE4F83C14C8EEC','',0,0,'阿萨斯',NULL,'2017-11-25 17:34:53','2017-11-25 17:34:53');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
