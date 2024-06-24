-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 24, 2024 at 04:41 AM
-- Server version: 8.3.0
-- PHP Version: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apotik_eduwork`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_detail_pasien`
--

DROP TABLE IF EXISTS `tb_detail_pasien`;
CREATE TABLE IF NOT EXISTS `tb_detail_pasien` (
  `id_detail_pasien` int NOT NULL AUTO_INCREMENT,
  `id_pasien` int NOT NULL,
  `alamat` text NOT NULL,
  `nomor_telepon` varchar(15) NOT NULL,
  `agama` varchar(20) NOT NULL,
  `pekerjaan` varchar(20) NOT NULL,
  PRIMARY KEY (`id_detail_pasien`),
  KEY `id_pasien` (`id_pasien`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_detail_pasien`
--

INSERT INTO `tb_detail_pasien` (`id_detail_pasien`, `id_pasien`, `alamat`, `nomor_telepon`, `agama`, `pekerjaan`) VALUES
(1, 1, 'Jl. Merdeka No. 45, Jakarta', '081234567890', 'Islam', 'Guru'),
(2, 2, 'Jl. Kebon Jeruk No. 12, Bandung', '081234567891', 'Islam', 'Perawat'),
(3, 3, 'Jl. Sudirman No. 98, Surabaya', '081234567892', 'Kristen', 'Pengusaha'),
(4, 4, 'Jl. Diponegoro No. 67, Yogyakarta', '081234567893', 'Hindu', 'Penulis'),
(5, 5, 'Jl. Malioboro No. 21, Solo', '081234567894', 'Islam', 'Presiden'),
(6, 6, 'Jl. Pahlawan No. 34, Medan', '081234567895', 'Kristen', 'Dokter'),
(7, 7, 'Jl. Dipati Ukur No. 89, Bandung', '081234567896', 'Buddha', 'Insinyur'),
(8, 8, 'Jl. Gajah Mada No. 76, Semarang', '081234567897', 'Islam', 'Arsitek'),
(9, 9, 'Jl. Pattimura No. 54, Makassar', '081234567898', 'Islam', 'Polisi'),
(10, 10, 'Jl. Hayam Wuruk No. 32, Denpasar', '081234567899', 'Hindu', 'Dosen');

-- --------------------------------------------------------

--
-- Table structure for table `tb_obat`
--

DROP TABLE IF EXISTS `tb_obat`;
CREATE TABLE IF NOT EXISTS `tb_obat` (
  `id_obat` int NOT NULL AUTO_INCREMENT,
  `nama_obat` varchar(32) NOT NULL,
  `pembuat_obat` varchar(32) NOT NULL,
  `stok_obat` int NOT NULL,
  `tanggal_kadaluwarsa` date NOT NULL,
  PRIMARY KEY (`id_obat`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_obat`
--

INSERT INTO `tb_obat` (`id_obat`, `nama_obat`, `pembuat_obat`, `stok_obat`, `tanggal_kadaluwarsa`) VALUES
(1, 'Paracetamol', 'PT Kimia Farma', 1000, '2026-06-30'),
(2, 'Amoxicillin', 'PT Kalbe Farma', 600, '2028-06-30'),
(3, 'Metformin', 'PT Dexa Medica', 350, '2027-06-30'),
(4, 'Captopril', 'PT Phapros', 399, '2028-10-07'),
(5, 'Ibuprofen', 'PT Tempo Scan Pacific', 555, '2027-06-01'),
(6, 'Amlodipine', 'PT Novell Pharmaceutical Laborat', 333, '2027-06-02'),
(7, 'Omeprazole', 'PT Sanbe Farma', 444, '2027-11-11'),
(8, 'Simvastatin', 'PT Meiji Indonesia', 567, '2028-10-31'),
(9, 'Loratadine', 'PT Soho Global Health', 900, '2028-03-15'),
(10, 'Cefadroxil', 'PT Bernofarm', 634, '2028-09-04');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pasien`
--

DROP TABLE IF EXISTS `tb_pasien`;
CREATE TABLE IF NOT EXISTS `tb_pasien` (
  `id_pasien` int NOT NULL AUTO_INCREMENT,
  `nama_pasien` varchar(32) NOT NULL,
  `tanggal_lahir_pasien` date NOT NULL,
  PRIMARY KEY (`id_pasien`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_pasien`
--

INSERT INTO `tb_pasien` (`id_pasien`, `nama_pasien`, `tanggal_lahir_pasien`) VALUES
(1, 'Ahmad Suryadi', '2000-06-01'),
(2, 'Siti Rahma', '2004-10-16'),
(3, 'Budi Santoso', '2000-02-21'),
(4, 'Dewi Lestari', '2001-09-10'),
(5, 'Joko Widodo', '2000-02-14'),
(6, 'Rina Melati', '2003-02-18'),
(7, 'Hendra Gunawan', '1999-10-04'),
(8, 'Wulan Puspita', '2000-09-27'),
(9, 'Andi Pratama', '1999-09-06'),
(10, 'Maya Sari', '2000-06-18');

-- --------------------------------------------------------

--
-- Table structure for table `tb_transaksi`
--

DROP TABLE IF EXISTS `tb_transaksi`;
CREATE TABLE IF NOT EXISTS `tb_transaksi` (
  `id_transaksi` int NOT NULL AUTO_INCREMENT,
  `id_pasien` int NOT NULL,
  `id_obat` int NOT NULL,
  `jumlah_transaksi` int NOT NULL,
  PRIMARY KEY (`id_transaksi`),
  KEY `id_pasien` (`id_pasien`,`id_obat`),
  KEY `id_obat` (`id_obat`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_transaksi`
--

INSERT INTO `tb_transaksi` (`id_transaksi`, `id_pasien`, `id_obat`, `jumlah_transaksi`) VALUES
(1, 1, 9, 2),
(2, 2, 7, 1),
(3, 3, 7, 2),
(4, 4, 8, 3),
(5, 5, 5, 5),
(6, 6, 4, 3),
(7, 7, 2, 4),
(8, 8, 1, 6),
(9, 9, 3, 7),
(10, 10, 7, 3);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_detail_pasien`
--
ALTER TABLE `tb_detail_pasien`
  ADD CONSTRAINT `tb_detail_pasien_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `tb_pasien` (`id_pasien`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  ADD CONSTRAINT `tb_transaksi_ibfk_1` FOREIGN KEY (`id_obat`) REFERENCES `tb_obat` (`id_obat`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `tb_transaksi_ibfk_2` FOREIGN KEY (`id_pasien`) REFERENCES `tb_pasien` (`id_pasien`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
