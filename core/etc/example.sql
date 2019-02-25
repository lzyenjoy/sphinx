/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : sphinx

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2019-02-25 22:22:21
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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of documents
-- ----------------------------
INSERT INTO `documents` VALUES ('1', '1', '5', '2019-02-25 21:22:28', 'sphinx one', '小楼昨夜又东风');
INSERT INTO `documents` VALUES ('2', '1', '6', '2019-02-25 21:22:28', 'sphinx two', '一曲东风破');
INSERT INTO `documents` VALUES ('3', '2', '7', '2019-02-25 21:22:28', 'another doc', '命数如织当为磐石');
INSERT INTO `documents` VALUES ('4', '2', '8', '2019-02-25 21:22:28', 'doc number four', '有是些时候，面子比命更需要勇气');
INSERT INTO `documents` VALUES ('5', '2', '9', '2019-02-25 21:53:33', '页面', '好看');
