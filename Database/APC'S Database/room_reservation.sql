/*
Navicat MySQL Data Transfer

Source Server         : PROD SERVER FLAVIO DB
Source Server Version : 50541
Source Host           : 10.106.1.10:3306
Source Database       : AADM

Target Server Type    : MYSQL
Target Server Version : 50541
File Encoding         : 65001

Date: 2018-03-26 15:51:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for room_reservation
-- ----------------------------
DROP TABLE IF EXISTS `room_reservation`;
CREATE TABLE `room_reservation` (
  `Form_No` int(3) NOT NULL AUTO_INCREMENT,
  `Application_Date` date NOT NULL DEFAULT '0000-00-00',
  `Room_id` varchar(20) COLLATE latin1_general_ci NOT NULL DEFAULT '000',
  `id` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `name` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `person_type` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `Activity_Date` date NOT NULL DEFAULT '0000-00-00',
  `Purpose` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `Start_Time` int(11) NOT NULL,
  `End_Time` int(11) NOT NULL,
  `Endorsed` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `Verify` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `Approved` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `Remarks` text COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`Form_No`)
) ENGINE=MyISAM AUTO_INCREMENT=24357 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
