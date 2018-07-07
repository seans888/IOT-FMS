/*
Navicat MySQL Data Transfer

Source Server         : PROD SERVER FLAVIO DB
Source Server Version : 50541
Source Host           : 10.106.1.10:3306
Source Database       : AADM

Target Server Type    : MYSQL
Target Server Version : 50541
File Encoding         : 65001

Date: 2018-03-26 15:51:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room` (
  `Room_id` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `Name` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `Floor` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `Room_Group_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Room_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
