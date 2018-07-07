/*
Navicat MySQL Data Transfer

Source Server         : PROD SERVER FLAVIO DB
Source Server Version : 50541
Source Host           : 10.106.1.10:3306
Source Database       : AREG

Target Server Type    : MYSQL
Target Server Version : 50541
File Encoding         : 65001

Date: 2018-03-26 14:17:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for refSubjectOfferingHdr
-- ----------------------------
DROP TABLE IF EXISTS `refSubjectOfferingHdr`;
CREATE TABLE `refSubjectOfferingHdr` (
  `subject_offering_id` int(11) NOT NULL AUTO_INCREMENT,
  `term_id` int(5) NOT NULL,
  `subject_id` int(5) NOT NULL,
  `section` varchar(255) DEFAULT NULL,
  `subject_code` varchar(250) NOT NULL,
  PRIMARY KEY (`subject_offering_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21048 DEFAULT CHARSET=latin1 COMMENT='List of Subjects Offered per Term';
