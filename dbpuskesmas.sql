-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 05, 2025 at 12:31 PM
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
-- Database: `dbpuskesmas`
--

-- --------------------------------------------------------

--
-- Table structure for table `kelurahan`
--

CREATE TABLE `kelurahan` (
  `id` int(11) NOT NULL,
  `nama` varchar(25) DEFAULT NULL,
  `kode_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kelurahan`
--

INSERT INTO `kelurahan` (`id`, `nama`, `kode_id`) VALUES
(1, 'Kelurahan P', 235),
(2, 'Kelurahan Q', 236),
(3, 'Kelurahan R', 237),
(4, 'Kelurahan S', 238),
(5, 'Kelurahan T', 239);

-- --------------------------------------------------------

--
-- Table structure for table `paramedik`
--

CREATE TABLE `paramedik` (
  `id` int(11) NOT NULL,
  `nama` varchar(45) NOT NULL,
  `gender` char(1) NOT NULL,
  `tmp_lahir` varchar(30) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `kategori` enum('Dokter','Perawat','Bidan','Lainnya') NOT NULL,
  `telpon` varchar(20) DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `unit_kerja_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `paramedik`
--

INSERT INTO `paramedik` (`id`, `nama`, `gender`, `tmp_lahir`, `tgl_lahir`, `kategori`, `telpon`, `alamat`, `unit_kerja_id`) VALUES
(6, 'Harris', 'L', 'Jakarta', '2003-07-21', 'Dokter', '08987654321', 'Gg HKBP, no 29 Srengseng Sawah, Jakarta Selatan', 1),
(7, 'Nadia', 'P', 'Palembang', '1997-04-05', 'Perawat', '08234567891', 'Jl. Kalimulya No 73, Depok Jawa Barat', 2),
(8, 'Dyvi', 'P', 'Gorontalo', '1995-01-20', 'Dokter', '08876543219', 'Jl Jenderal Sudirmana No. 6 Dulalowo Tim, Kota Tengah Gorontalo', 3),
(9, 'Syaibani', 'L', 'Bekasi', '1993-08-16', 'Perawat', '08657483921', 'Jl. Asia Afrika Apart Senayan City, Jakarta Pusat', 4),
(10, 'Rumay', 'P', 'Tangerang', '2004-10-15', 'Perawat', '08867561372', 'Jl. Jampang No.89, Wanaherang, Kecamatan Gunung Putri, Kabupaten Bogor, Jawa Barat', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `id` int(11) NOT NULL,
  `kode` varchar(10) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `tmp_lahir` varchar(50) DEFAULT NULL,
  `no_telp` varchar(20) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `gender` enum('L','P') DEFAULT NULL,
  `kelurahan_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`id`, `kode`, `nama`, `tmp_lahir`, `no_telp`, `alamat`, `email`, `tgl_lahir`, `gender`, `kelurahan_id`) VALUES
(1, 'P001', 'Eric Nam', 'Jakarta', '08123456789', 'Jl. Thamrin No.119', 'eric.nam@gmail.com', '1989-11-29', 'L', 3),
(2, 'P002', 'Reka Yahsya', 'Semarang', '08765432109', 'Jl. Gatot Subroto No.10', 'reka.yahsya@gmail.com', '1998-05-18', 'P', 2),
(3, 'P003', 'Jakie Chan', 'Surabaya', '081210000111', 'Jl. Kecapi No.50', 'jaie.chan@gmail.com', '1954-04-07', 'L', 4),
(4, 'P004', 'Alika Sabrina', 'Bandung', '081319557285', 'Jl. Raya Matoa No.08', 'alika.sabr@gmail.com', '2000-10-15', 'P', 1),
(5, 'P005', 'Sutoyo wijaya', 'Bekasi', '081577984031', 'Jl. Raya Kalimatan No.91', 'sutoyo.wijaya@gmail.com', '1970-03-22', 'L', 5);

-- --------------------------------------------------------

--
-- Table structure for table `periksa`
--

CREATE TABLE `periksa` (
  `id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `berat` double DEFAULT NULL,
  `tinggi` double DEFAULT NULL,
  `tensi` varchar(20) DEFAULT NULL,
  `keterangan` varchar(100) DEFAULT NULL,
  `pasien_id` int(11) NOT NULL,
  `paramedik_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `periksa`
--

INSERT INTO `periksa` (`id`, `tanggal`, `berat`, `tinggi`, `tensi`, `keterangan`, `pasien_id`, `paramedik_id`) VALUES
(7, '2025-05-04', 60, 173, '35', 'badan panas, dan muntah muntah sudah 4 hari', 1, 8),
(8, '2025-05-06', 50, 160, '18', 'merasa kedinginan, tapi seluruh badan nya panas', 2, 6),
(9, '2025-05-09', 64, 170, '29', 'batuk batuk', 3, 7),
(10, '2025-05-05', 47, 155, '62', 'seluruh tubuh kram', 4, 10);

-- --------------------------------------------------------

--
-- Table structure for table `unit_kerja`
--

CREATE TABLE `unit_kerja` (
  `id` int(11) NOT NULL,
  `nama` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `unit_kerja`
--

INSERT INTO `unit_kerja` (`id`, `nama`) VALUES
(1, 'Rumah Sakit'),
(2, 'Puskesmas'),
(3, 'Klinik'),
(4, 'Apotek');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kelurahan`
--
ALTER TABLE `kelurahan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `paramedik`
--
ALTER TABLE `paramedik`
  ADD PRIMARY KEY (`id`),
  ADD KEY `unit_kerja_id` (`unit_kerja_id`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kelurahan_id` (`kelurahan_id`);

--
-- Indexes for table `periksa`
--
ALTER TABLE `periksa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pasien_id` (`pasien_id`),
  ADD KEY `fk_periksa_paramedik` (`paramedik_id`);

--
-- Indexes for table `unit_kerja`
--
ALTER TABLE `unit_kerja`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kelurahan`
--
ALTER TABLE `kelurahan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `paramedik`
--
ALTER TABLE `paramedik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pasien`
--
ALTER TABLE `pasien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `periksa`
--
ALTER TABLE `periksa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `unit_kerja`
--
ALTER TABLE `unit_kerja`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `paramedik`
--
ALTER TABLE `paramedik`
  ADD CONSTRAINT `paramedik_ibfk_1` FOREIGN KEY (`unit_kerja_id`) REFERENCES `unit_kerja` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `pasien`
--
ALTER TABLE `pasien`
  ADD CONSTRAINT `pasien_ibfk_1` FOREIGN KEY (`kelurahan_id`) REFERENCES `kelurahan` (`id`);

--
-- Constraints for table `periksa`
--
ALTER TABLE `periksa`
  ADD CONSTRAINT `fk_periksa_paramedik` FOREIGN KEY (`paramedik_id`) REFERENCES `paramedik` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `periksa_ibfk_1` FOREIGN KEY (`pasien_id`) REFERENCES `pasien` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `periksa_ibfk_2` FOREIGN KEY (`paramedik_id`) REFERENCES `paramedik` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
