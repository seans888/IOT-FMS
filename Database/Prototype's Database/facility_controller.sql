-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 27, 2018 at 04:26 AM
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
-- Table structure for table `facility_controller`
--

CREATE TABLE `facility_controller` (
  `room` char(5) NOT NULL,
  `class_status_id` smallint(6) NOT NULL,
  `subject_offering_id` int(5) NOT NULL,
  `refEmployeeDtr_id` int(11) NOT NULL,
  `room_reservations_id` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

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
-- Constraints for dumped tables
--

--
-- Constraints for table `facility_controller`
--
ALTER TABLE `facility_controller`
  ADD CONSTRAINT `facility_controller_ibfk_2` FOREIGN KEY (`class_status_id`) REFERENCES `class_status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `facility_controller_ibfk_3` FOREIGN KEY (`refEmployeeDtr_id`) REFERENCES `refemployeedtr` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `facility_controller_ibfk_4` FOREIGN KEY (`subject_offering_id`) REFERENCES `refsubjectofferingdtl` (`subject_offering_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `facility_controller_ibfk_5` FOREIGN KEY (`room`) REFERENCES `room` (`Room_id`),
  ADD CONSTRAINT `facility_controller_ibfk_6` FOREIGN KEY (`room_reservations_id`) REFERENCES `room_reservations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
