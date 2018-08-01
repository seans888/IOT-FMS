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
-- Table structure for table `class_status`
--

CREATE TABLE `class_status` (
  `id` int(5) NOT NULL,
  `CLASS_STATUS_date` date NOT NULL,
  `CLASS_STATUS_time` time NOT NULL,
  `CLASS_STATUS_description` varchar(100) DEFAULT NULL,
  `CLASS_STATUS_TYPE_state` int(5) NOT NULL
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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `class_status`
--
ALTER TABLE `class_status`
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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
