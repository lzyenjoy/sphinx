/*
Navicat MySQL Data Transfer

Source Server         : 本地数据库
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : sphinx

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2019-05-31 14:52:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for documents
-- ----------------------------
DROP TABLE IF EXISTS `documents`;
CREATE TABLE `documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `group_id2` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of documents
-- ----------------------------
INSERT INTO `documents` VALUES ('1', '1', '5', '2019-02-25 21:22:28', 'sphinx one', '小楼昨夜又东风');
INSERT INTO `documents` VALUES ('2', '1', '6', '2019-02-25 21:22:28', 'sphinx two', '一曲东风破');
INSERT INTO `documents` VALUES ('3', '2', '7', '2019-02-25 21:22:28', 'another doc', '命数如织当为磐石');
INSERT INTO `documents` VALUES ('4', '2', '8', '2019-02-25 21:22:28', 'doc number four', '有是些时候，面子比命更需要勇气');
INSERT INTO `documents` VALUES ('5', '2', '9', '2019-02-25 21:53:33', '页面', '好看');
INSERT INTO `documents` VALUES ('6', '2', '10', '2019-05-24 16:25:27', '小米', '小米');
INSERT INTO `documents` VALUES ('7', '2', '4', '2019-05-27 16:01:27', '魅族', '魅族');
INSERT INTO `documents` VALUES ('8', '2', '7', '2019-05-27 17:08:34', '三星', '三星');
INSERT INTO `documents` VALUES ('9', '2', '8', '2019-05-27 17:22:07', '苹果', '苹果');
INSERT INTO `documents` VALUES ('10', '3', '7', '2019-05-27 17:26:40', '锤子', '锤子');
INSERT INTO `documents` VALUES ('11', '4', '7', '2019-05-27 17:28:24', '金立', '金立');
INSERT INTO `documents` VALUES ('12', '8', '7', '2019-05-27 17:30:32', '步步高', '步步高');
INSERT INTO `documents` VALUES ('13', '8', '9', '2019-05-27 17:33:12', '诺基亚', '诺基亚');
INSERT INTO `documents` VALUES ('14', '8', '9', '2019-05-27 17:38:04', '摩托罗拉', '摩托罗拉');
INSERT INTO `documents` VALUES ('15', '9', '4', '2019-05-27 17:41:24', '键盘', '键盘');
INSERT INTO `documents` VALUES ('16', '87', '7', '2019-05-27 17:55:03', '鼠标', '鼠标');
INSERT INTO `documents` VALUES ('17', '8', '9', '2019-05-27 17:56:06', '显示器', '显示器');
INSERT INTO `documents` VALUES ('18', '9', '50', '2019-05-29 15:41:51', '电源线', '电源线');
INSERT INTO `documents` VALUES ('19', '10', '2', '2019-05-29 15:50:40', '杯子', '杯子');
INSERT INTO `documents` VALUES ('20', '15', '9', '2019-05-29 16:13:26', '头像', '头像');
INSERT INTO `documents` VALUES ('21', '8', '7', '2019-05-29 16:18:56', '肩膀', '肩膀');
INSERT INTO `documents` VALUES ('22', '9', '7', '2019-05-29 16:26:39', '裤子', '裤子');
INSERT INTO `documents` VALUES ('23', '8', '7', '2019-05-29 16:29:31', '点灯', '点灯');
INSERT INTO `documents` VALUES ('24', '6', '6', '2019-05-29 16:32:00', '手机', '手机');
INSERT INTO `documents` VALUES ('25', '8', '9', '2019-05-29 16:32:53', '黑色', '黑色');
INSERT INTO `documents` VALUES ('26', '3', '4', '2019-05-30 09:38:25', '耳机', '耳机');
INSERT INTO `documents` VALUES ('27', '7', '8', '2019-05-30 09:55:09', '光标', '光标');
INSERT INTO `documents` VALUES ('28', '7', '8', '2019-05-30 10:01:18', '风扇', '风扇');
INSERT INTO `documents` VALUES ('29', '2', '1', '2019-05-30 10:02:58', '水枪', '水枪');
INSERT INTO `documents` VALUES ('30', '78', '78', '2019-05-30 10:08:08', '打架', '打架');
INSERT INTO `documents` VALUES ('31', '12', '42', '2019-05-30 10:09:56', '书包', '书包');
INSERT INTO `documents` VALUES ('32', '8', '7', '2019-05-30 10:43:40', '黑屏', '黑屏');
INSERT INTO `documents` VALUES ('33', '8', '7', '2019-05-30 10:46:07', '月亮', '月亮');
INSERT INTO `documents` VALUES ('34', '7', '5', '2019-05-31 14:48:03', '喇叭', '喇叭');

-- ----------------------------
-- Table structure for sphinx_id
-- ----------------------------
DROP TABLE IF EXISTS `sphinx_id`;
CREATE TABLE `sphinx_id` (
  `max_id` int(10) unsigned NOT NULL COMMENT '已经创建好索引的最后一条记录'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sphinx_id
-- ----------------------------
INSERT INTO `sphinx_id` VALUES ('0');

-- ----------------------------
-- Table structure for sph_counter
-- ----------------------------
DROP TABLE IF EXISTS `sph_counter`;
CREATE TABLE `sph_counter` (
  `counter_id` int(11) NOT NULL COMMENT '标识不同的数据表',
  `max_doc_id` int(11) NOT NULL COMMENT '每个索引表的最大ID,会实时更新',
  PRIMARY KEY (`counter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sph_counter
-- ----------------------------
INSERT INTO `sph_counter` VALUES ('1', '34');
