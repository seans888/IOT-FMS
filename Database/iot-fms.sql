-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 09, 2018 at 03:53 AM
-- Server version: 10.1.33-MariaDB
-- PHP Version: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `iot-fms`
--

-- --------------------------------------------------------

--
-- Table structure for table `class_status`
--

CREATE TABLE `class_status` (
  `id` int(5) NOT NULL,
  `CLASS_STATUS_date` date NOT NULL,
  `CLASS_STATUS_time` time NOT NULL,
  `CLASS_STATUS_description` varchar(100) DEFAULT NULL,
  `CLASS_STATUS_TYPE_state` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `class_status_type`
--

CREATE TABLE `class_status_type` (
  `id` int(5) NOT NULL,
  `CLASS_STATUS_TYPE_state` enum('Senior High School','College') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `class_status_type`
--

INSERT INTO `class_status_type` (`id`, `CLASS_STATUS_TYPE_state`) VALUES
(1, 'Senior High School'),
(2, 'College');

-- --------------------------------------------------------

--
-- Table structure for table `facility`
--

CREATE TABLE `facility` (
  `room` varchar(5) NOT NULL,
  `FACILITY_air_conditioner` enum('0','1') NOT NULL COMMENT '1st aircondtion',
  `FACILITY_airconditioner_2` enum('0','1') DEFAULT NULL COMMENT '2nd aircondition',
  `FACILITY_airconditioner_3` enum('0','1') DEFAULT NULL COMMENT '3rd aircondition',
  `FACILITY_lights` enum('0','1') NOT NULL COMMENT 'controlled through the central switch ',
  `CLASS_STATUS_id` int(5) DEFAULT NULL,
  `REPORTS_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `it_equipment`
--

CREATE TABLE `it_equipment` (
  `id` int(11) NOT NULL,
  `it_equipment` varchar(20) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `checkout_flag` smallint(6) NOT NULL,
  `status` smallint(6) NOT NULL,
  `equip_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `it_equipment_type`
--

CREATE TABLE `it_equipment_type` (
  `id` int(11) NOT NULL,
  `equip_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `refemployeedtr`
--

CREATE TABLE `refemployeedtr` (
  `id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `source` varchar(15) NOT NULL,
  `date` date NOT NULL,
  `log_in` time NOT NULL,
  `log_out` time NOT NULL,
  `dtr_id` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `refsubjectofferingdtl`
--

CREATE TABLE `refsubjectofferingdtl` (
  `subject_offering_id` int(5) NOT NULL,
  `time` char(17) DEFAULT NULL,
  `time_start` int(11) NOT NULL,
  `time_end` int(11) NOT NULL,
  `day` char(3) CHARACTER SET utf8 DEFAULT NULL,
  `room` varchar(5) NOT NULL,
  `room_type` enum('Lec','Lab') NOT NULL DEFAULT 'Lec'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Schedule Detail';

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int(5) NOT NULL,
  `REPORTS_date` date NOT NULL,
  `REPORTS_time` time NOT NULL,
  `REPORTS_description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `class_status`
--
ALTER TABLE `class_status`
  ADD PRIMARY KEY (`id`),
  ADD KEY `CLASS_STATUS_TYPE_state` (`CLASS_STATUS_TYPE_state`);

--
-- Indexes for table `class_status_type`
--
ALTER TABLE `class_status_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `facility`
--
ALTER TABLE `facility`
  ADD PRIMARY KEY (`room`),
  ADD KEY `CLASS_STATUS_id` (`CLASS_STATUS_id`),
  ADD KEY `REPORTS_id` (`REPORTS_id`);

--
-- Indexes for table `it_equipment`
--
ALTER TABLE `it_equipment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `equip_type` (`equip_type`);

--
-- Indexes for table `it_equipment_type`
--
ALTER TABLE `it_equipment_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refemployeedtr`
--
ALTER TABLE `refemployeedtr`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refsubjectofferingdtl`
--
ALTER TABLE `refsubjectofferingdtl`
  ADD UNIQUE KEY `subject_offering_id` (`subject_offering_id`,`time`,`day`,`room`),
  ADD KEY `room` (`room`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `class_status`
--
ALTER TABLE `class_status`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `class_status_type`
--
ALTER TABLE `class_status_type`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `it_equipment`
--
ALTER TABLE `it_equipment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `it_equipment_type`
--
ALTER TABLE `it_equipment_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refemployeedtr`
--
ALTER TABLE `refemployeedtr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `class_status`
--
ALTER TABLE `class_status`
  ADD CONSTRAINT `class_status_ibfk_1` FOREIGN KEY (`CLASS_STATUS_TYPE_state`) REFERENCES `class_status_type` (`id`),
  ADD CONSTRAINT `class_status_ibfk_2` FOREIGN KEY (`id`) REFERENCES `facility` (`CLASS_STATUS_id`);

--
-- Constraints for table `facility`
--
ALTER TABLE `facility`
  ADD CONSTRAINT `facility_ibfk_1` FOREIGN KEY (`room`) REFERENCES `refsubjectofferingdtl` (`room`),
  ADD CONSTRAINT `facility_ibfk_2` FOREIGN KEY (`REPORTS_id`) REFERENCES `reports` (`id`);

--
-- Constraints for table `it_equipment`
--
ALTER TABLE `it_equipment`
  ADD CONSTRAINT `it_equipment_ibfk_1` FOREIGN KEY (`equip_type`) REFERENCES `it_equipment_type` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
