/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50645
Source Host           : localhost:3306
Source Database       : bank

Target Server Type    : MYSQL
Target Server Version : 50645
File Encoding         : 65001

Date: 2020-07-25 18:44:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `account`
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `accountid` int(4) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `balance` decimal(18,2) DEFAULT NULL,
  `status` int(4) DEFAULT NULL,
  PRIMARY KEY (`accountid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('1', '1016041135', '12345', '11299.00', '1');
INSERT INTO `account` VALUES ('2', 'B12110931', '123456', '1200.00', '1');
INSERT INTO `account` VALUES ('3', 'B12110901', '123456', '1000.00', '1');
INSERT INTO `account` VALUES ('4', 'B12110902', '123456', '1000.00', '1');
INSERT INTO `account` VALUES ('5', 'B12110903', '123456', '1000.00', '1');
INSERT INTO `account` VALUES ('6', 'B12110904', '123456', '1000.00', '1');
INSERT INTO `account` VALUES ('7', 'B12110905', '123456', '1000.00', '2');
INSERT INTO `account` VALUES ('8', 'B12110906', '123456', '1000.00', '1');
INSERT INTO `account` VALUES ('9', 'B12110907', '123456', '1000.00', '1');
INSERT INTO `account` VALUES ('10', 'B12110908', '123456', '1000.00', '1');
INSERT INTO `account` VALUES ('11', 'B12110909', '123456', '1000.00', '1');
INSERT INTO `account` VALUES ('15', 'B12110913', '123456', '900.00', '1');
INSERT INTO `account` VALUES ('16', '1234567', '123456', '10000019894.00', '1');

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `money` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', '123456', '11111111512');
INSERT INTO `admin` VALUES ('2', 'dqx', '123', '666666666');

-- ----------------------------
-- Table structure for `loan_log`
-- ----------------------------
DROP TABLE IF EXISTS `loan_log`;
CREATE TABLE `loan_log` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `accountid` int(4) DEFAULT NULL,
  `loan_money` decimal(18,0) DEFAULT NULL,
  `datetime` varchar(50) DEFAULT NULL,
  `huan_money` decimal(18,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of loan_log
-- ----------------------------
INSERT INTO `loan_log` VALUES ('1', '1', '700', '2017-7-19 16:45:9', '0');
INSERT INTO `loan_log` VALUES ('2', '2', '900', '2017-7-19 16:45:9', '200');
INSERT INTO `loan_log` VALUES ('3', '1', '399', '2019-06-21 14:58:07', '399');
INSERT INTO `loan_log` VALUES ('4', '16', '10000', '2019-06-21 16:16:14', '10000');

-- ----------------------------
-- Table structure for `personinfo`
-- ----------------------------
DROP TABLE IF EXISTS `personinfo`;
CREATE TABLE `personinfo` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `accountid` int(4) DEFAULT NULL,
  `realname` varchar(50) DEFAULT NULL,
  `age` int(4) DEFAULT NULL,
  `sex` varchar(2) DEFAULT NULL,
  `cardid` decimal(18,0) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `telephone` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of personinfo
-- ----------------------------
INSERT INTO `personinfo` VALUES ('1', '1', '李四', '21', '男', '320542000000000001', '山财', '15810000001');
INSERT INTO `personinfo` VALUES ('2', '2', '赵强', '23', '男', '320542000000000002', '湖北武汉', '15810000002');
INSERT INTO `personinfo` VALUES ('3', '3', '程阳', '22', '男', '320542000000000001', '南邮', '15810000001');
INSERT INTO `personinfo` VALUES ('4', '4', '程阳', '22', '男', '320542000000000001', '南邮', '15810000001');
INSERT INTO `personinfo` VALUES ('5', '5', '程阳', '22', '男', '320542000000000001', '南邮', '15810000001');
INSERT INTO `personinfo` VALUES ('6', '6', '程阳', '22', '男', '320542000000000001', '南邮', '15810000001');
INSERT INTO `personinfo` VALUES ('7', '7', '程阳', '22', '男', '320542000000000001', '南邮', '15810000001');
INSERT INTO `personinfo` VALUES ('8', '8', '程阳', '22', '男', '320542000000000001', '南邮', '15810000001');
INSERT INTO `personinfo` VALUES ('9', '9', '程阳', '22', '男', '320542000000000001', '南邮', '15810000001');
INSERT INTO `personinfo` VALUES ('10', '10', '程阳', '22', '男', '320542000000000001', '南邮', '15810000001');
INSERT INTO `personinfo` VALUES ('15', '15', '张三', '23', '女', '320542000000000003', '江苏南京', '18362837211');


-- ----------------------------
-- Table structure for `status`
-- ----------------------------
DROP TABLE IF EXISTS `status`;
CREATE TABLE `status` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of status
-- ----------------------------
INSERT INTO `status` VALUES ('1', '启用');
INSERT INTO `status` VALUES ('2', '冻结');

-- ----------------------------
-- Table structure for `transaction_log`
-- ----------------------------
DROP TABLE IF EXISTS `transaction_log`;
CREATE TABLE `transaction_log` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `accountid` int(4) DEFAULT NULL,
  `otherid` int(4) DEFAULT NULL,
  `tr_money` decimal(18,0) DEFAULT NULL,
  `datetime` varchar(50) DEFAULT NULL,
  `ta_type` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of transaction_log
-- ----------------------------
INSERT INTO `transaction_log` VALUES ('1', '1', '1', '200', '2017-7-19 16:45:9', '1');
INSERT INTO `transaction_log` VALUES ('2', '1', '1', '100', '2019-6-20 11:19:53', '1');
INSERT INTO `transaction_log` VALUES ('3', '1', '1', '10000', '2019-6-21 13:13:22', '1');
INSERT INTO `transaction_log` VALUES ('4', '1', '2', '100', '2019-6-21 13:15:9', '3');
INSERT INTO `transaction_log` VALUES ('5', '16', '16', '10000', '2019-6-21 16:16:4', '1');
INSERT INTO `transaction_log` VALUES ('6', '16', '16', '1', '2020-6-9 22:59:36', '1');
INSERT INTO `transaction_log` VALUES ('7', '16', '16', '2', '2020-6-10 19:47:39', '1');
INSERT INTO `transaction_log` VALUES ('8', '16', '16', '100', '2020-6-12 12:30:22', '1');
INSERT INTO `transaction_log` VALUES ('9', '16', '16', '100', '2020-6-12 12:30:38', '2');
INSERT INTO `transaction_log` VALUES ('10', '16', '2', '100', '2020-6-12 12:32:23', '3');
INSERT INTO `transaction_log` VALUES ('11', '16', '16', '1', '2020-6-16 10:27:11', '1');
INSERT INTO `transaction_log` VALUES ('12', '16', '16', '10', '2020-6-16 10:28:11', '2');

-- ----------------------------
-- Table structure for `transaction_type`
-- ----------------------------
DROP TABLE IF EXISTS `transaction_type`;
CREATE TABLE `transaction_type` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of transaction_type
-- ----------------------------
INSERT INTO `transaction_type` VALUES ('1', '存款');
INSERT INTO `transaction_type` VALUES ('2', '取款');
INSERT INTO `transaction_type` VALUES ('3', '转账');
