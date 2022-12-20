-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 20, 2022 at 05:48 AM
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
-- Database: `unit`
--

-- --------------------------------------------------------

--
-- Table structure for table `data`
--

CREATE TABLE `data` (
  `id` int(11) NOT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `indikator_id` int(11) DEFAULT NULL,
  `n_judul` int(11) DEFAULT NULL,
  `n_num` int(11) DEFAULT NULL,
  `n_denum` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `data`
--

INSERT INTO `data` (`id`, `unit_id`, `indikator_id`, `n_judul`, `n_num`, `n_denum`, `tanggal`) VALUES
(1, 1, 1, 5, 5, 5, '2022-12-20');

-- --------------------------------------------------------

--
-- Table structure for table `indikator`
--

CREATE TABLE `indikator` (
  `id` int(11) NOT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `standar` varchar(45) DEFAULT NULL,
  `pencapaian` int(11) DEFAULT NULL,
  `ket` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `indikator`
--

INSERT INTO `indikator` (`id`, `unit_id`, `standar`, `pencapaian`, `ket`) VALUES
(1, 1, '<1% <30% <0,3%', 100, 'Oke'),
(2, 1, '<1% <30% <0,3%', 100, 'Oke'),
(4, 1, '<1% <30% <0,3%', 100, 'Oke'),
(5, 1, '200', 0, ''),
(6, 1, '100', 0, ''),
(7, 1, '100', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `indikator_unit`
--

CREATE TABLE `indikator_unit` (
  `id` int(11) NOT NULL,
  `indikator_id` int(11) DEFAULT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `numerator` varchar(255) DEFAULT NULL,
  `denumerator` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `indikator_unit`
--

INSERT INTO `indikator_unit` (`id`, `indikator_id`, `judul`, `numerator`, `denumerator`) VALUES
(1, 1, 'Kejadian kematian ibu karena persalinan : Perdarahan', 'Jumlah kematian pasien persalinan karena : Perdarahan', 'Jumlah pasien-pasien persalinan dengan : Perdarahan'),
(2, 2, 'Kejadian kematian ibu karena persalinan : Pre eklampsia', 'Jumlah kematian pasien persalinan karena :Pre eklampsia', 'Jumlah pasien-pasien persalinan dengan : Pre eklampsia'),
(3, 4, 'Kejadian kematian ibu karena persalinan : Sepsis', 'Jumlah kematian pasien persalinan karena : Sepsis', 'Jumlah pasien-pasien persalinan dengan : Sepsis'),
(4, 5, 'Pemberi pelayanan dengan persalinan normal dokter SpOG dan bidan sudah terlatih APN', 'Jumlah pasien kamar bersalin dengan persalinan normal yang di tangani tenaga dokter SpOG,dan bidan terlatih     ( Asuhan Persalinan Normal ) yang di survei', 'Jumlah pasien persalinan normal dikamar bersalin yang disurvei'),
(5, 6, '\"Pemberi pelayanan persalinan dengan penyulit dr. Sp.OG,  dr Sp.A dan bidan terlatih\"', 'Jumlah pasien persalinan dengan penyulit dikamar bersalin yang ditangani tenaga dokter Sp.OG,bidan yang terlatih', 'Jumlah pasien persalinan dengan penyulit dikamar bersalin yang disurvei'),
(6, 7, '\"Pemberi pelayanan persalinan dengan penyulit dr. Sp.OG,  dr Sp.A dan bidan terlatih\"', 'Jumlah pasien persalinan dengan penyulit dikamar bersalin yang ditangani tenaga dokter Sp.OG,bidan yang terlatih', 'Jumlah pasien persalinan dengan penyulit dikamar bersalin yang disurvei');

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE `unit` (
  `id` int(11) NOT NULL,
  `nama_unit` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`id`, `nama_unit`) VALUES
(1, 'IKB');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data`
--
ALTER TABLE `data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unit_id_UNIQUE` (`unit_id`),
  ADD UNIQUE KEY `indikator_id_UNIQUE` (`indikator_id`);

--
-- Indexes for table `indikator`
--
ALTER TABLE `indikator`
  ADD PRIMARY KEY (`id`),
  ADD KEY `unit_id_UNIQUE` (`unit_id`) USING BTREE;

--
-- Indexes for table `indikator_unit`
--
ALTER TABLE `indikator_unit`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `indikator_id_UNIQUE` (`indikator_id`);

--
-- Indexes for table `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `data`
--
ALTER TABLE `data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `indikator`
--
ALTER TABLE `indikator`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `indikator_unit`
--
ALTER TABLE `indikator_unit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
