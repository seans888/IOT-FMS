/*
Navicat MySQL Data Transfer

Source Server         : PROD SERVER FLAVIO DB
Source Server Version : 50541
Source Host           : 10.106.1.10:3306
Source Database       : AADM

Target Server Type    : MYSQL
Target Server Version : 50541
File Encoding         : 65001

Date: 2018-03-26 15:51:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for room_group
-- ----------------------------
DROP TABLE IF EXISTS `room_group`;
CREATE TABLE `room_group` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Room_Group_Name` varchar(50) NOT NULL,
  `Email_To` text,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
