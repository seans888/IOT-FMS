-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 17, 2018 at 07:20 AM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.3

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
-- Table structure for table `account_details`
--

CREATE TABLE `account_details` (
  `id` smallint(6) NOT NULL,
  `account_details_role` char(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `class_status`
--

CREATE TABLE `class_status` (
  `id` smallint(6) NOT NULL,
  `class_status_date` date NOT NULL,
  `class_status_time_start` time NOT NULL,
  `class_status_time_end` time NOT NULL,
  `class_status_description` text NOT NULL,
  `class_status_type_id` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `class_status`
--

INSERT INTO `class_status` (`id`, `class_status_date`, `class_status_time_start`, `class_status_time_end`, `class_status_description`, `class_status_type_id`) VALUES
(1, '2018-08-15', '09:29:33', '08:50:43', 'test', 1);

-- --------------------------------------------------------

--
-- Table structure for table `class_status_type`
--

CREATE TABLE `class_status_type` (
  `id` smallint(6) NOT NULL,
  `class_status_type_state` enum('Senior High School','College') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `class_status_type`
--

INSERT INTO `class_status_type` (`id`, `class_status_type_state`) VALUES
(1, 'Senior High School'),
(2, 'College');

-- --------------------------------------------------------

--
-- Table structure for table `facility_controller`
--

CREATE TABLE `facility_controller` (
  `room` char(5) NOT NULL,
  `class_status_id` smallint(6) NOT NULL,
  `subject_offering_id` int(5) NOT NULL,
  `refEmployeeDtr_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `facility_reports`
--

CREATE TABLE `facility_reports` (
  `id` smallint(6) NOT NULL,
  `description` text NOT NULL,
  `facility_reports_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Room_id` char(5) NOT NULL,
  `user_account_id` smallint(6) NOT NULL
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
  `day` char(3) DEFAULT NULL,
  `room` varchar(5) NOT NULL,
  `room_type` enum('Lec','Lab') NOT NULL,
  `emp_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `Room_id` char(5) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Floor` int(50) NOT NULL,
  `Room_Group_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `room_facility_count`
--

CREATE TABLE `room_facility_count` (
  `room_number` char(5) NOT NULL,
  `room_air_conditioner` char(2) NOT NULL,
  `room_lights` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `room_group`
--

CREATE TABLE `room_group` (
  `id` int(11) NOT NULL,
  `Room_Group_Name` varchar(50) NOT NULL,
  `Email_To` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `room_group`
--

INSERT INTO `room_group` (`id`, `Room_Group_Name`, `Email_To`) VALUES
(1, '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `room_reports`
--

CREATE TABLE `room_reports` (
  `id` smallint(6) NOT NULL,
  `reports_air_condition` time NOT NULL,
  `reports_lights` text NOT NULL,
  `reports_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `reports_updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `room` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_account`
--

CREATE TABLE `user_account` (
  `id` smallint(6) NOT NULL,
  `user_account_username` char(12) NOT NULL,
  `user_account_password` binary(16) NOT NULL,
  `user_account_role` smallint(6) NOT NULL,
  `user_account_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_details`
--
ALTER TABLE `account_details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_details_role` (`account_details_role`);

--
-- Indexes for table `class_status`
--
ALTER TABLE `class_status`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_status_type_id` (`class_status_type_id`) USING BTREE;

--
-- Indexes for table `class_status_type`
--
ALTER TABLE `class_status_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `facility_controller`
--
ALTER TABLE `facility_controller`
  ADD PRIMARY KEY (`room`),
  ADD KEY `class_status_id` (`class_status_id`),
  ADD KEY `subject_offering_id` (`subject_offering_id`),
  ADD KEY `refEmployeeDtr` (`refEmployeeDtr_id`);

--
-- Indexes for table `facility_reports`
--
ALTER TABLE `facility_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Room_id` (`Room_id`),
  ADD KEY `user_account_id` (`user_account_id`);

--
-- Indexes for table `refemployeedtr`
--
ALTER TABLE `refemployeedtr`
  ADD PRIMARY KEY (`id`),
  ADD KEY `emp_id` (`emp_id`);

--
-- Indexes for table `refsubjectofferingdtl`
--
ALTER TABLE `refsubjectofferingdtl`
  ADD PRIMARY KEY (`subject_offering_id`),
  ADD KEY `emp_id` (`emp_id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`Room_id`),
  ADD KEY `Room_Group_Id` (`Room_Group_Id`) USING BTREE;

--
-- Indexes for table `room_facility_count`
--
ALTER TABLE `room_facility_count`
  ADD PRIMARY KEY (`room_number`);

--
-- Indexes for table `room_group`
--
ALTER TABLE `room_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room_reports`
--
ALTER TABLE `room_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room` (`room`);

--
-- Indexes for table `user_account`
--
ALTER TABLE `user_account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_account_username` (`user_account_username`),
  ADD KEY `user_account_role` (`user_account_role`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `class_status`
--
ALTER TABLE `class_status`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `class_status_type`
--
ALTER TABLE `class_status_type`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `facility_reports`
--
ALTER TABLE `facility_reports`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refemployeedtr`
--
ALTER TABLE `refemployeedtr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refsubjectofferingdtl`
--
ALTER TABLE `refsubjectofferingdtl`
  MODIFY `subject_offering_id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `room_group`
--
ALTER TABLE `room_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `room_reports`
--
ALTER TABLE `room_reports`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_account`
--
ALTER TABLE `user_account`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `class_status`
--
ALTER TABLE `class_status`
  ADD CONSTRAINT `class_status_ibfk_1` FOREIGN KEY (`class_status_type_id`) REFERENCES `class_status_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `facility_controller`
--
ALTER TABLE `facility_controller`
  ADD CONSTRAINT `facility_controller_ibfk_2` FOREIGN KEY (`class_status_id`) REFERENCES `class_status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `facility_controller_ibfk_3` FOREIGN KEY (`refEmployeeDtr_id`) REFERENCES `refemployeedtr` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `facility_controller_ibfk_4` FOREIGN KEY (`subject_offering_id`) REFERENCES `refsubjectofferingdtl` (`subject_offering_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `facility_controller_ibfk_5` FOREIGN KEY (`room`) REFERENCES `room` (`Room_id`);

--
-- Constraints for table `facility_reports`
--
ALTER TABLE `facility_reports`
  ADD CONSTRAINT `facility_reports_ibfk_2` FOREIGN KEY (`user_account_id`) REFERENCES `user_account` (`user_account_role`),
  ADD CONSTRAINT `facility_reports_ibfk_3` FOREIGN KEY (`Room_id`) REFERENCES `room` (`Room_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `refsubjectofferingdtl`
--
ALTER TABLE `refsubjectofferingdtl`
  ADD CONSTRAINT `refsubjectofferingdtl_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `refemployeedtr` (`emp_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `room_ibfk_1` FOREIGN KEY (`Room_Group_Id`) REFERENCES `room_group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `room_facility_count`
--
ALTER TABLE `room_facility_count`
  ADD CONSTRAINT `room_facility_count_ibfk_1` FOREIGN KEY (`room_number`) REFERENCES `room` (`Room_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `room_reports`
--
ALTER TABLE `room_reports`
  ADD CONSTRAINT `room_reports_ibfk_1` FOREIGN KEY (`room`) REFERENCES `facility_controller` (`room`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_account`
--
ALTER TABLE `user_account`
  ADD CONSTRAINT `user_account_ibfk_1` FOREIGN KEY (`user_account_role`) REFERENCES `account_details` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
