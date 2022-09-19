-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 19, 2022 at 07:55 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `med_store`
--
CREATE DATABASE IF NOT EXISTS `med_store` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `med_store`;

-- --------------------------------------------------------

--
-- Table structure for table `all_person`
--

CREATE TABLE `all_person` (
  `id` int(11) NOT NULL,
  `role` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `all_person`
--

INSERT INTO `all_person` (`id`, `role`, `username`, `password`) VALUES
(1, 'admin', 'Shruti', '123456'),
(2, 'receptionist', 'Shazrin', '12345'),
(3, 'doctor', 'Rashmi', '12345');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `salary` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`pid`, `name`, `email`, `address`, `phone`, `salary`) VALUES
(1, 'Tanya', 'tanya@gmail.com', 'Jamalkhan', '01234567891', 60000),
(2, 'Mustafiz', 'mustafiz@gmail.com', 'khulna', '01472583691', 50000),
(3, 'Shakib', 'shakib@gmail.com', 'khulna', '01472583691', 50000);

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

CREATE TABLE `medicine` (
  `name` varchar(60) NOT NULL,
  `buy_timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `expiry_date` date NOT NULL,
  `chem_amount` varchar(10) NOT NULL,
  `qty` int(11) NOT NULL,
  `cp` int(11) NOT NULL,
  `sp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `medicine`
--

INSERT INTO `medicine` (`name`, `buy_timestamp`, `expiry_date`, `chem_amount`, `qty`, `cp`, `sp`) VALUES
('Tenoren', '2022-09-17 09:17:41', '2022-09-18', '10mg', 5, 69, 96);

-- --------------------------------------------------------

--
-- Table structure for table `name_compound`
--

CREATE TABLE `name_compound` (
  `name` varchar(60) NOT NULL,
  `compound` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `name_pharma`
--

CREATE TABLE `name_pharma` (
  `name` varchar(60) NOT NULL,
  `pharmaco` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `name_pharma`
--

INSERT INTO `name_pharma` (`name`, `pharmaco`) VALUES
('Tenoren', 'Shailly Pharma company');

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `pid` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`pid`, `name`, `address`) VALUES
(1, 'Sarbojit', 'Jamalkhan');

-- --------------------------------------------------------

--
-- Table structure for table `person_email`
--

CREATE TABLE `person_email` (
  `pid` int(11) DEFAULT NULL,
  `email` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `person_email`
--

INSERT INTO `person_email` (`pid`, `email`) VALUES
(1, 'sarbojitsen@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `person_tel_no`
--

CREATE TABLE `person_tel_no` (
  `pid` int(11) DEFAULT NULL,
  `tel_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `person_tel_no`
--

INSERT INTO `person_tel_no` (`pid`, `tel_no`) VALUES
(1, 1747123456);

-- --------------------------------------------------------

--
-- Table structure for table `supplier_pharmaco`
--

CREATE TABLE `supplier_pharmaco` (
  `pid` int(11) NOT NULL,
  `pharmaco` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `supplier_pharmaco`
--

INSERT INTO `supplier_pharmaco` (`pid`, `pharmaco`) VALUES
(1, 'Shailly Pharma company');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `id` int(11) NOT NULL,
  `txn_timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `buy_sell` char(1) NOT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`id`, `txn_timestamp`, `buy_sell`, `notes`) VALUES
(1, '2022-09-17 09:17:41', 'B', '');

-- --------------------------------------------------------

--
-- Table structure for table `txn_on`
--

CREATE TABLE `txn_on` (
  `name` varchar(60) NOT NULL,
  `buy_timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `chem_amount` varchar(10) NOT NULL,
  `expiry_date` date NOT NULL,
  `cp` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `qty_buy_sell` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `txn_on`
--

INSERT INTO `txn_on` (`name`, `buy_timestamp`, `chem_amount`, `expiry_date`, `cp`, `id`, `qty_buy_sell`) VALUES
('Tenoren', '2022-09-17 09:17:41', '10mg', '2022-09-18', 69, 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `txn_person`
--

CREATE TABLE `txn_person` (
  `id` int(11) NOT NULL,
  `pid_person` int(11) NOT NULL,
  `pid_employee` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `txn_person`
--

INSERT INTO `txn_person` (`id`, `pid_person`, `pid_employee`) VALUES
(1, 1, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `all_person`
--
ALTER TABLE `all_person`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `medicine`
--
ALTER TABLE `medicine`
  ADD PRIMARY KEY (`name`,`buy_timestamp`,`expiry_date`,`chem_amount`,`cp`);

--
-- Indexes for table `name_compound`
--
ALTER TABLE `name_compound`
  ADD PRIMARY KEY (`name`,`compound`);

--
-- Indexes for table `name_pharma`
--
ALTER TABLE `name_pharma`
  ADD PRIMARY KEY (`name`,`pharmaco`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `person_email`
--
ALTER TABLE `person_email`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `person_tel_no`
--
ALTER TABLE `person_tel_no`
  ADD PRIMARY KEY (`tel_no`);

--
-- Indexes for table `supplier_pharmaco`
--
ALTER TABLE `supplier_pharmaco`
  ADD PRIMARY KEY (`pid`,`pharmaco`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `txn_on`
--
ALTER TABLE `txn_on`
  ADD PRIMARY KEY (`name`,`buy_timestamp`,`chem_amount`,`expiry_date`,`cp`,`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `txn_person`
--
ALTER TABLE `txn_person`
  ADD PRIMARY KEY (`id`,`pid_person`,`pid_employee`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `all_person`
--
ALTER TABLE `all_person`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `pid` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `txn_on`
--
ALTER TABLE `txn_on`
  ADD CONSTRAINT `txn_on_ibfk_1` FOREIGN KEY (`id`) REFERENCES `transaction` (`id`);

--
-- Constraints for table `txn_person`
--
ALTER TABLE `txn_person`
  ADD CONSTRAINT `txn_person_ibfk_1` FOREIGN KEY (`id`) REFERENCES `transaction` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
