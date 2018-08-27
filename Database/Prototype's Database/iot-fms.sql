-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 27, 2018 at 04:24 AM
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
  `account_details_role` enum('Student','Professor','Admin','Super Admin') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `class_status`
--

CREATE TABLE `class_status` (
  `id` smallint(6) NOT NULL,
  `class_status_date` date NOT NULL,
  `class_status_time_start` int(11) NOT NULL,
  `class_status_time_end` int(11) NOT NULL,
  `class_status_description` text NOT NULL,
  `class_status_type_id` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Table structure for table `facilities`
--

CREATE TABLE `facilities` (
  `room` char(5) NOT NULL,
  `facilities_air_conditioner_1` enum('0','1') DEFAULT NULL,
  `facilities_air_conditioner_2` enum('0','1') NOT NULL,
  `facilities_air_conditioner_3` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `facility_controller`
--

CREATE TABLE `facility_controller` (
  `room` char(5) NOT NULL,
  `class_status_id` smallint(6) NOT NULL,
  `subject_offering_id` int(5) NOT NULL,
  `refEmployeeDtr_id` int(11) NOT NULL,
  `room_reservations_id` smallint(6) NOT NULL
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
  `log_in` int(11) NOT NULL,
  `log_out` int(11) NOT NULL,
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
  `emp_id` int(11) NOT NULL,
  `refSubjectOfferingDtl_class_type` enum('Senior High School','College') NOT NULL
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
-- Table structure for table `room_reservations`
--

CREATE TABLE `room_reservations` (
  `id` smallint(6) NOT NULL,
  `room_reservations_room` char(5) NOT NULL,
  `room_reservations_date` date NOT NULL,
  `room_reservations_day` char(3) NOT NULL,
  `room_reservations_time_start` int(11) NOT NULL,
  `room_reservations_time_end` int(11) NOT NULL,
  `room_reservations_class_type` enum('Senior High School','College') NOT NULL,
  `room_reservations_details_id` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `room_reservations_detail`
--

CREATE TABLE `room_reservations_detail` (
  `id` smallint(6) NOT NULL,
  `room_reservation_description` text NOT NULL,
  `user_account_id` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_account`
--

CREATE TABLE `user_account` (
  `id` smallint(6) NOT NULL,
  `user_account_username` char(12) NOT NULL,
  `user_account_password` binary(16) NOT NULL,
  `account_details_id` smallint(6) NOT NULL,
  `user_account_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_details_id` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `id` smallint(6) NOT NULL,
  `user_details_first_name` varchar(50) DEFAULT NULL,
  `user_details_middle_initial` varchar(1) NOT NULL,
  `user_details_last_name` varchar(35) DEFAULT NULL,
  `user_details_age` tinyint(2) DEFAULT NULL,
  `user_details_school` enum('SOCIT','SOE','SOM','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_details_email`
--

CREATE TABLE `user_details_email` (
  `id` smallint(6) NOT NULL,
  `user_details_email` varchar(100) NOT NULL,
  `user_details` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_details_phone`
--

CREATE TABLE `user_details_phone` (
  `id` smallint(6) NOT NULL,
  `user_details_phone` char(15) NOT NULL,
  `user_details` smallint(6) NOT NULL
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
-- Indexes for table `facilities`
--
ALTER TABLE `facilities`
  ADD PRIMARY KEY (`room`);

--
-- Indexes for table `facility_controller`
--
ALTER TABLE `facility_controller`
  ADD PRIMARY KEY (`room`),
  ADD KEY `class_status_id` (`class_status_id`),
  ADD KEY `subject_offering_id` (`subject_offering_id`),
  ADD KEY `refEmployeeDtr` (`refEmployeeDtr_id`),
  ADD KEY `room_reservations_id` (`room_reservations_id`);

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
-- Indexes for table `room_reservations`
--
ALTER TABLE `room_reservations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room_reservations_detail`
--
ALTER TABLE `room_reservations_detail`
  ADD KEY `user_account_id` (`user_account_id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `user_account`
--
ALTER TABLE `user_account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_account_username` (`user_account_username`),
  ADD KEY `user_account_role` (`account_details_id`),
  ADD KEY `user_details_id` (`user_details_id`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_details_email`
--
ALTER TABLE `user_details_email`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_details` (`user_details`);

--
-- Indexes for table `user_details_phone`
--
ALTER TABLE `user_details_phone`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_details` (`user_details`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `class_status`
--
ALTER TABLE `class_status`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `class_status_type`
--
ALTER TABLE `class_status_type`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
-- AUTO_INCREMENT for table `room_reservations`
--
ALTER TABLE `room_reservations`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_account`
--
ALTER TABLE `user_account`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_details`
--
ALTER TABLE `user_details`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_details_email`
--
ALTER TABLE `user_details_email`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_details_phone`
--
ALTER TABLE `user_details_phone`
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
-- Constraints for table `facilities`
--
ALTER TABLE `facilities`
  ADD CONSTRAINT `facilities_ibfk_1` FOREIGN KEY (`room`) REFERENCES `facility_controller` (`room`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `facility_controller`
--
ALTER TABLE `facility_controller`
  ADD CONSTRAINT `facility_controller_ibfk_2` FOREIGN KEY (`class_status_id`) REFERENCES `class_status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `facility_controller_ibfk_3` FOREIGN KEY (`refEmployeeDtr_id`) REFERENCES `refemployeedtr` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `facility_controller_ibfk_4` FOREIGN KEY (`subject_offering_id`) REFERENCES `refsubjectofferingdtl` (`subject_offering_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `facility_controller_ibfk_5` FOREIGN KEY (`room`) REFERENCES `room` (`Room_id`),
  ADD CONSTRAINT `facility_controller_ibfk_6` FOREIGN KEY (`room_reservations_id`) REFERENCES `room_reservations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
-- Constraints for table `room_reservations_detail`
--
ALTER TABLE `room_reservations_detail`
  ADD CONSTRAINT `room_reservations_detail_ibfk_1` FOREIGN KEY (`user_account_id`) REFERENCES `user_account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `room_reservations_detail_ibfk_2` FOREIGN KEY (`id`) REFERENCES `room_reservations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_account`
--
ALTER TABLE `user_account`
  ADD CONSTRAINT `user_account_ibfk_1` FOREIGN KEY (`account_details_id`) REFERENCES `account_details` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_account_ibfk_2` FOREIGN KEY (`user_details_id`) REFERENCES `user_details` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_details_email`
--
ALTER TABLE `user_details_email`
  ADD CONSTRAINT `user_details_email_ibfk_1` FOREIGN KEY (`user_details`) REFERENCES `user_details` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_details_phone`
--
ALTER TABLE `user_details_phone`
  ADD CONSTRAINT `user_details_phone_ibfk_1` FOREIGN KEY (`user_details`) REFERENCES `user_details` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
