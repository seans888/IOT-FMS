-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 01, 2018 at 07:01 AM
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
-- Table structure for table `facility`
--

CREATE TABLE `facility` (
  `room` varchar(5) NOT NULL,
  `FACILITY_air_conditioner` enum('0','1') NOT NULL COMMENT '1st aircondtion',
  `FACILITY_airconditioner_2` enum('0','1') DEFAULT NULL COMMENT '2nd aircondition',
  `FACILITY_lights` enum('0','1') NOT NULL COMMENT 'controlled through the central switch ',
  `FACILITY_computers` enum('0','1') DEFAULT NULL COMMENT 'controlled through the central switch',
  `FACILITY_projectors` enum('0','1') DEFAULT NULL COMMENT 'not controlled but monitored',
  `CLASS_STATUS_id` int(5) DEFAULT NULL,
  `REPORTS_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `facility`
--
ALTER TABLE `facility`
  ADD PRIMARY KEY (`room`),
  ADD KEY `CLASS_STATUS_id` (`CLASS_STATUS_id`),
  ADD KEY `REPORTS_id` (`REPORTS_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `facility`
--
ALTER TABLE `facility`
  ADD CONSTRAINT `facility_ibfk_1` FOREIGN KEY (`room`) REFERENCES `refsubjectofferingdtl` (`room`),
  ADD CONSTRAINT `facility_ibfk_2` FOREIGN KEY (`REPORTS_id`) REFERENCES `reports` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
