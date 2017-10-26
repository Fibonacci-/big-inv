-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 26, 2017 at 10:04 PM
-- Server version: 5.7.20-0ubuntu0.16.04.1
-- PHP Version: 7.0.22-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `big_inv`
--
CREATE DATABASE IF NOT EXISTS `big_inv` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `big_inv`;

-- --------------------------------------------------------

--
-- Table structure for table `Categories`
--

DROP TABLE IF EXISTS `Categories`;
CREATE TABLE IF NOT EXISTS `Categories` (
  `categoryId` int(11) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(255) NOT NULL,
  PRIMARY KEY (`categoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Items`
--

DROP TABLE IF EXISTS `Items`;
CREATE TABLE IF NOT EXISTS `Items` (
  `itemId` int(11) NOT NULL AUTO_INCREMENT,
  `locationId` int(11) NOT NULL,
  `categoryId` int(11) NOT NULL,
  `itemName` varchar(1000) NOT NULL,
  `itemManufacturer` varchar(1000) NOT NULL,
  `itemPrimaryColor` varchar(1000) NOT NULL,
  `itemSecondaryColor` varchar(1000) DEFAULT NULL,
  `itemManufacturerSKU` varchar(1000) DEFAULT NULL,
  `itemPlacePurchased` varchar(1000) NOT NULL,
  `itemDatePurchased` date NOT NULL,
  `itemCost` decimal(10,2) NOT NULL,
  `itemPrice` decimal(10,2) NOT NULL,
  `itemPhoto` longblob,
  PRIMARY KEY (`itemId`),
  KEY `categoryId` (`categoryId`),
  KEY `locationId` (`locationId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Locations`
--

DROP TABLE IF EXISTS `Locations`;
CREATE TABLE IF NOT EXISTS `Locations` (
  `locationId` int(11) NOT NULL AUTO_INCREMENT,
  `locationName` varchar(1000) NOT NULL,
  `locationDescription` text NOT NULL,
  `locationAddress` text NOT NULL,
  PRIMARY KEY (`locationId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Items`
--
ALTER TABLE `Items`
  ADD CONSTRAINT `CategoryId` FOREIGN KEY (`categoryId`) REFERENCES `Categories` (`categoryId`) ON UPDATE CASCADE,
  ADD CONSTRAINT `LocationId` FOREIGN KEY (`locationId`) REFERENCES `Locations` (`locationId`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
