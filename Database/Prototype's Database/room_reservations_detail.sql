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
-- Table structure for table `room_reservations_detail`
--

CREATE TABLE `room_reservations_detail` (
  `id` smallint(6) NOT NULL,
  `room_reservation_description` text NOT NULL,
  `user_account_id` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `room_reservations_detail`
--
ALTER TABLE `room_reservations_detail`
  ADD KEY `user_account_id` (`user_account_id`),
  ADD KEY `id` (`id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `room_reservations_detail`
--
ALTER TABLE `room_reservations_detail`
  ADD CONSTRAINT `room_reservations_detail_ibfk_1` FOREIGN KEY (`user_account_id`) REFERENCES `user_account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `room_reservations_detail_ibfk_2` FOREIGN KEY (`id`) REFERENCES `room_reservations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
