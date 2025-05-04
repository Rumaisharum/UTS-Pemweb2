-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 26, 2025 at 01:27 PM
-- Server version: 8.0.30
-- PHP Version: 8.2.28

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

MariaDB [dbpuskesmas]> CREATE TABLE `kelurahan` (
  `id` int NOT NULL,
  `nama` varchar(100) NOT NULL,
  `kec_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `kelurahan`
--

MariaDB [dbpuskesmas]> INSERT INTO `kelurahan` (`id`, `nama`, `kode_id`) VALUES
    (1, 'Kelurahan P', 235),
    (2, 'Kelurahan Q', 236),
    (3, 'Kelurahan R', 237),
    (4, 'Kelurahan S', 238),
    (5, 'Kelurahan T', 239);


-- --------------------------------------------------------

--
-- Table structure for table `paramedik`
--

MariaDB [dbpuskesmas]> CREATE TABLE `paramedik` (
  `id` int NOT NULL,
  `nama` varchar(100) NOT NULL,
  `gender` char(1) NOT NULL,
  `tmp_lahir` varchar(100) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `kategori` enum('dokter','perawat','apoteker','') NOT NULL,
  `telpon` varchar(20) NOT NULL,
  `alamat` text NOT NULL,
  `unit_kerja_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `paramedik`
--

MariaDB [dbpuskesmas]> INSERT INTO paramedik
    -> (nama, gender, tmp_lahir, tgl_lahir, kategori, telpon, alamat, unit_kerja_id) VALUES
    -> ('Harris', 'L', 'Jakarta', '2003-07-21', 'Dokter', '08987654321', 'Gg HKBP, no 29 Srengseng Sawah, Jakarta Selatan', 1),
    -> ('Nadia', 'P', 'Palembang', '1997-04-05', 'Perawat', '08234567891', 'Jl. Kalimulya No 73, Depok Jawa Barat', 2),
    -> ('Dyvi', 'P', 'Gorontalo', '1995-01-20', 'Dokter', '08876543219', 'Jl Jenderal Sudirmana No. 6 Dulalowo Tim, Kota Tengah Gorontalo', 3),
    -> ('Syaibani', 'L', 'Bekasi', '1993-08-16', 'Apoteker', '08657483921', 'Jl. Asia Afrika Apart Senayan City, Jakarta Pusat', 4),
    -> ('Rumay', 'P', 'Tangerang', '2004-10-15', 'Perawat', '08867561372', 'Jampang No.89, Wanaherang, Kecamatan Gunung Putri, Kabupaten Bogor, Jawa Barat', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

MariaDB [dbpuskesmas]> CREATE TABLE `pasien` (
  `id` int NOT NULL,
  `kode` varchar(10) NOT NULL,
  `nama` varchar(45) NOT NULL,
  `tmp_lahir` varchar(45) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `gender` char(1) NOT NULL,
  `email` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `kelurahan_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pasien`
--

MariaDB [dbpuskesmas]> INSERT INTO `pasien` 
  (`id`, `kode`, `nama`, `tmp_lahir`,  `tgl_lahir`,   `gender`, `email`,                 `alamat`,                        `kelurahan_id`) 
VALUES
  (1, 'P001', 'Eric Nam',        '', '1989-11-29', 'P', 'eric.nam@gmail.com',      'Jl. Thamrin No.119',           1),
  (2, 'P002', 'Reka Yahsya',     '', '1998-05-18', 'P', 'reka.yahsya@gmail.com',   'Jl. Gatot Subroto No.10',      2),
  (3, 'P003', 'Jakie Chan',      '', '1954-04-07', 'P', 'jaie.chan@gmail.com',     'Jl. Kecapi No.50',             3),
  (4, 'P004', 'Alika Sabrina',   '', '2000-10-15', 'P', 'alika.sabr@gmail.com',    'Jl. Raya Matoa No.08',         4),
  (5, 'P005', 'Sutoyo Wijaya',   '', '1970-03-22', 'P', 'sutoyo.wijaya@gmail.com', 'Jl. Raya Kalimatan No.91',     5);

-- --------------------------------------------------------

--
-- Table structure for table `periksa`
--

MariaDB [dbpuskesmas]> CREATE TABLE `periksa` (
  `id` int NOT NULL,
  `tanggal` date NOT NULL,
  `berat` double NOT NULL,
  `tinggi` double NOT NULL,
  `tensi` varchar(20) NOT NULL,
  `keterangan` text NOT NULL,
  `pasien_id` int NOT NULL,
  `paramedik_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `periksa`
--

MariaDB [dbpuskesmas]> ALTER TABLE periksa
    -> (tanggal, berat, tinggi, tensi, keterangan, paramedik_id, pasien_id) VALUES
    -> ('1998-03-21', 58, 165, '82', 'Sakit Meriang', 2, 1),
    -> ('2002-06-18', 45, 153, '43', 'Sakit Vertigo', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `unit_kerja`
--

MariaDB [dbpuskesmas]> CREATE TABLE `unit_kerja` (
  `id` int NOT NULL,
  `nama` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `unit_kerja`
--

MariaDB [dbpuskesmas]> INSERT INTO unit_kerja (nama) VALUES
    -> ('Rumah Sakit'),
    -> ('Puskesmas'),
    -> ('Klinik'),
    -> ('Apotek');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kelurahan`
--
MariaDB [dbpuskesmas]> ALTER TABLE `kelurahan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `paramedik`
--
MariaDB [dbpuskesmas]> ALTER TABLE `paramedik`
  ADD PRIMARY KEY (`id`),
  ADD KEY `unit_kerja_id` (`unit_kerja_id`);

--
-- Indexes for table `pasien`
--
MariaDB [dbpuskesmas]> ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kelurahan_id` (`kelurahan_id`);

--
-- Indexes for table `periksa`
--
MariaDB [dbpuskesmas]> ALTER TABLE `periksa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paramedik_id` (`paramedik_id`),
  ADD KEY `pasien_id` (`pasien_id`);

--
-- Indexes for table `unit_kerja`
--
MariaDB [dbpuskesmas]> ALTER TABLE `unit_kerja`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kelurahan`
--
AMariaDB [dbpuskesmas]> LTER TABLE `kelurahan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `paramedik`
--
MariaDB [dbpuskesmas]> ALTER TABLE `paramedik`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pasien`
--
MariaDB [dbpuskesmas]> ALTER TABLE `pasien`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `periksa`
--
MariaDB [dbpuskesmas]> ALTER TABLE `periksa`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `unit_kerja`
--
MariaDB [dbpuskesmas]> ALTER TABLE `unit_kerja`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `paramedik`
--
MariaDB [dbpuskesmas]> ALTER TABLE `paramedik`
  ADD CONSTRAINT `paramedik_ibfk_1` FOREIGN KEY (`unit_kerja_id`) REFERENCES `unit_kerja` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `pasien`
--
MariaDB [dbpuskesmas]> ALTER TABLE `pasien`
  ADD CONSTRAINT `pasien_ibfk_1` FOREIGN KEY (`kelurahan_id`) REFERENCES `kelurahan` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `periksa`
--
MariaDB [dbpuskesmas]> ALTER TABLE `periksa`
  ADD CONSTRAINT `periksa_ibfk_1` FOREIGN KEY (`paramedik_id`) REFERENCES `paramedik` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `periksa_ibfk_2` FOREIGN KEY (`pasien_id`) REFERENCES `pasien` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
