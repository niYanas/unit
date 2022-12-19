-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 19, 2022 at 04:29 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mydb`
--

-- --------------------------------------------------------

--
-- Table structure for table `data`
--

CREATE TABLE `data` (
  `data_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `indikator_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `data_jumlah`
--

CREATE TABLE `data_jumlah` (
  `data_id` int(11) NOT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `tanggal` datetime DEFAULT NULL,
  `indikator_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `indikator`
--

CREATE TABLE `indikator` (
  `id` int(11) NOT NULL,
  `standar` int(11) DEFAULT NULL,
  `pencapaian` int(11) DEFAULT NULL,
  `ket` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `indikator_child`
--

CREATE TABLE `indikator_child` (
  `ind_data_id` int(11) NOT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `numerator` varchar(255) DEFAULT NULL,
  `denumerator` varchar(255) DEFAULT NULL,
  `indikator_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE `unit` (
  `unit_id` int(11) NOT NULL,
  `nama_unit` varchar(255) DEFAULT NULL,
  `indikator_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`unit_id`, `nama_unit`, `indikator_id`) VALUES
(1, 'IKB', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data`
--
ALTER TABLE `data`
  ADD PRIMARY KEY (`data_id`,`indikator_id`),
  ADD UNIQUE KEY `parent_id_UNIQUE` (`parent_id`),
  ADD KEY `fk_data_indikator1_idx` (`indikator_id`);

--
-- Indexes for table `data_jumlah`
--
ALTER TABLE `data_jumlah`
  ADD PRIMARY KEY (`data_id`,`indikator_id`),
  ADD KEY `fk_data_jumlah_indikator1_idx` (`indikator_id`);

--
-- Indexes for table `indikator`
--
ALTER TABLE `indikator`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `indikator_child`
--
ALTER TABLE `indikator_child`
  ADD PRIMARY KEY (`ind_data_id`,`indikator_id`),
  ADD UNIQUE KEY `ind_data_id` (`ind_data_id`),
  ADD KEY `fk_indikator_data_indikator1_idx` (`indikator_id`);

--
-- Indexes for table `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`unit_id`,`indikator_id`),
  ADD KEY `fk_unit_indikator` (`indikator_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `data`
--
ALTER TABLE `data`
  MODIFY `data_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `data_jumlah`
--
ALTER TABLE `data_jumlah`
  MODIFY `data_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `indikator`
--
ALTER TABLE `indikator`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `indikator_child`
--
ALTER TABLE `indikator_child`
  MODIFY `ind_data_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `unit`
--
ALTER TABLE `unit`
  MODIFY `unit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `data`
--
ALTER TABLE `data`
  ADD CONSTRAINT `fk_data_indikator1` FOREIGN KEY (`indikator_id`) REFERENCES `indikator` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `data_jumlah`
--
ALTER TABLE `data_jumlah`
  ADD CONSTRAINT `fk_data_jumlah_indikator1` FOREIGN KEY (`indikator_id`) REFERENCES `indikator` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `indikator_child`
--
ALTER TABLE `indikator_child`
  ADD CONSTRAINT `fk_indikator_data_indikator1` FOREIGN KEY (`indikator_id`) REFERENCES `indikator` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `unit`
--
ALTER TABLE `unit`
  ADD CONSTRAINT `fk_unit_indikator` FOREIGN KEY (`indikator_id`) REFERENCES `indikator` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
