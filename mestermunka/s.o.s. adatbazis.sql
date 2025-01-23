-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 23, 2025 at 12:00 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `s.o.s. munka`
--

-- --------------------------------------------------------

--
-- Table structure for table `felhasznaloi_adatok`
--

CREATE TABLE `felhasznaloi_adatok` (
  `userID` int(11) NOT NULL,
  `vezeteknev` varchar(255) NOT NULL,
  `keresztnev` varchar(255) NOT NULL,
  `felhasznalonev` varchar(255) NOT NULL,
  `emailcim` varchar(255) NOT NULL,
  `telefonszam` int(11) NOT NULL,
  `telepules` varchar(255) NOT NULL,
  `posztok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kategoriak`
--

CREATE TABLE `kategoriak` (
  `festes` varchar(255) NOT NULL,
  `kerteszkedes` varchar(255) NOT NULL,
  `fozes` varchar(255) NOT NULL,
  `betonozas` varchar(255) NOT NULL,
  `falazas` varchar(255) NOT NULL,
  `vakolas` varchar(255) NOT NULL,
  `parkettazas` varchar(255) NOT NULL,
  `csempezes` varchar(255) NOT NULL,
  `vizvezetek_szereles` varchar(255) NOT NULL,
  `villanyszereles` varchar(255) NOT NULL,
  `kategoriaID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posztok`
--

CREATE TABLE `posztok` (
  `userID` int(11) NOT NULL,
  `posztID` int(11) NOT NULL,
  `cim` varchar(255) NOT NULL,
  `kategoria` int(11) NOT NULL,
  `leiras` varchar(255) NOT NULL,
  `munkasok_szama` varchar(255) NOT NULL,
  `telefonszam` int(11) NOT NULL,
  `telepules` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `felhasznaloi_adatok`
--
ALTER TABLE `felhasznaloi_adatok`
  ADD PRIMARY KEY (`userID`),
  ADD KEY `posztok` (`posztok`);

--
-- Indexes for table `kategoriak`
--
ALTER TABLE `kategoriak`
  ADD PRIMARY KEY (`kategoriaID`);

--
-- Indexes for table `posztok`
--
ALTER TABLE `posztok`
  ADD PRIMARY KEY (`posztID`),
  ADD KEY `userID` (`userID`),
  ADD KEY `kategoria` (`kategoria`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `felhasznaloi_adatok`
--
ALTER TABLE `felhasznaloi_adatok`
  ADD CONSTRAINT `felhasznaloi_adatok_ibfk_1` FOREIGN KEY (`posztok`) REFERENCES `posztok` (`posztID`);

--
-- Constraints for table `posztok`
--
ALTER TABLE `posztok`
  ADD CONSTRAINT `posztok_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `felhasznaloi_adatok` (`userID`),
  ADD CONSTRAINT `posztok_ibfk_2` FOREIGN KEY (`kategoria`) REFERENCES `kategoriak` (`kategoriaID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
