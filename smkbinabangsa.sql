-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 11, 2023 at 02:48 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smkbinabangsa`
--

-- --------------------------------------------------------

--
-- Table structure for table `hubungan`
--

CREATE TABLE `hubungan` (
  `id_hub` int(10) NOT NULL,
  `id_siswa` int(10) DEFAULT NULL,
  `id_ortu` int(10) DEFAULT NULL,
  `status_hubungan` enum('Kandung','Tiri','Wali') DEFAULT NULL,
  `keterangan` enum('Ayah','Ibu','Paman','Tante','Wali') DEFAULT NULL,
  `status_ortu` enum('Hidup','Meninggal') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hubungan`
--

INSERT INTO `hubungan` (`id_hub`, `id_siswa`, `id_ortu`, `status_hubungan`, `keterangan`, `status_ortu`) VALUES
(2, 2, 2, 'Kandung', '', 'Hidup'),
(3, 3, 3, 'Kandung', '', 'Meninggal');

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id` int(10) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `jurusan` enum('Perkantoran','Multimedia','Akutansi') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id`, `nama`, `jurusan`) VALUES
(1, 'hilda', 'Multimedia'),
(2, 'milo', 'Perkantoran'),
(3, 'grey', 'Akutansi');

-- --------------------------------------------------------

--
-- Table structure for table `ortu`
--

CREATE TABLE `ortu` (
  `id_ortu` int(10) NOT NULL,
  `nik` int(20) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `pendidikan` varchar(20) DEFAULT NULL,
  `pekerjaan` varchar(50) DEFAULT NULL,
  `telp` int(20) DEFAULT NULL,
  `alamat` varchar(20) DEFAULT NULL,
  `jenis_kelamin` enum('laki-laki','perempuan') DEFAULT NULL,
  `agama` varchar(20) DEFAULT NULL,
  `status` enum('Hidup','Meninggal') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ortu`
--

INSERT INTO `ortu` (`id_ortu`, `nik`, `nama`, `pendidikan`, `pekerjaan`, `telp`, `alamat`, `jenis_kelamin`, `agama`, `status`) VALUES
(2, 2147483647, 'Udin', 'S1 Teknik sipil', 'Guru', 1254, 'aisyah indah', 'laki-laki', 'Islam', 'Hidup'),
(3, 34588, 'norma', 'S1 Pendidikan', 'PNS', 73219, 'Jl indah', 'perempuan', 'Islam', 'Hidup'),
(4, 43829, 'santi', 'SLTA/Sederajat', 'Wiraswasta', 48198, 'Jl.tentram', 'perempuan', 'Islam', 'Hidup');

-- --------------------------------------------------------

--
-- Table structure for table `poin`
--

CREATE TABLE `poin` (
  `id_poin` int(10) NOT NULL,
  `nama_poin` varchar(20) DEFAULT NULL,
  `bobot` int(20) DEFAULT NULL,
  `jenis` varchar(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `poin`
--

INSERT INTO `poin` (`id_poin`, `nama_poin`, `bobot`, `jenis`, `status`) VALUES
(1, 'Terlambat', 20, 'pelanggaran', ''),
(2, 'tidak rapi', 6, 'pelanggaran', ''),
(3, 'Menikah', 100, 'Pelanggaran', ''),
(4, 'Merokok dilingkungan', 100, 'Pelanggaran', 'aktif');

-- --------------------------------------------------------

--
-- Table structure for table `semester`
--

CREATE TABLE `semester` (
  `id_semester` int(11) NOT NULL,
  `id_siswa` int(20) DEFAULT NULL,
  `id_poin` int(10) DEFAULT NULL,
  `id_wali` int(10) DEFAULT NULL,
  `id_ortu` int(10) DEFAULT NULL,
  `id_kelas` int(10) DEFAULT NULL,
  `tanggal` varchar(20) DEFAULT NULL,
  `semester` enum('Ganjil','Genap') DEFAULT NULL,
  `status` enum('Lulus','Tidak Lulus') DEFAULT NULL,
  `tingkat_kelas` enum('10','11','12') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `semester`
--

INSERT INTO `semester` (`id_semester`, `id_siswa`, `id_poin`, `id_wali`, `id_ortu`, `id_kelas`, `tanggal`, `semester`, `status`, `tingkat_kelas`) VALUES
(6, 2, 2, 1, 4, 2, '2023-02-01', 'Genap', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `id_siswa` int(10) NOT NULL,
  `nis` int(22) DEFAULT NULL,
  `nisn` int(70) DEFAULT NULL,
  `nama` varchar(70) DEFAULT NULL,
  `nik` int(15) DEFAULT NULL,
  `tempat_lahir` varchar(20) DEFAULT NULL,
  `tgl_lahir` varchar(50) DEFAULT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') DEFAULT NULL,
  `alamat` varchar(20) DEFAULT NULL,
  `telpon` int(12) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`id_siswa`, `nis`, `nisn`, `nama`, `nik`, `tempat_lahir`, `tgl_lahir`, `jenis_kelamin`, `alamat`, `telpon`, `status`) VALUES
(1, 211, 123, 'Hilda', 2110010167, 'Muara Teweh', '06 Oktober 2003', 'Perempuan', 'Jl.Aisyah Indah', 212394569, 'Aktif'),
(2, 124, 231, 'Tompel', 2110010232, 'Banjarmasin', '10 july 2001', 'Laki-laki', 'Jl dermaga ujung', 85439, 'Aktif'),
(3, 412, 4321, 'Chiro', 54392, 'Benangin', '18 Agustus 2002', 'Perempuan', 'Jl Sedih', 83450, 'Aktif');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(10) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `level` int(10) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `level`, `status`) VALUES
(2, 'hilda', '12345678', 1, 'Aktif'),
(3, 'Admin', 'Admin', 1, 'Aktif');

-- --------------------------------------------------------

--
-- Table structure for table `wali_kelas`
--

CREATE TABLE `wali_kelas` (
  `id_wali` int(10) NOT NULL,
  `nik` int(22) DEFAULT NULL,
  `nama` varchar(70) DEFAULT NULL,
  `jenis_kelamin` varchar(20) DEFAULT NULL,
  `pendidikan` varchar(20) DEFAULT NULL,
  `telp` int(12) DEFAULT NULL,
  `matpel` varchar(20) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `status` enum('aktif','tidak aktif') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wali_kelas`
--

INSERT INTO `wali_kelas` (`id_wali`, `nik`, `nama`, `jenis_kelamin`, `pendidikan`, `telp`, `matpel`, `alamat`, `status`) VALUES
(1, 234, 'Tono', 'Laki-laki', 'S1 Pendidikan', 8912, 'Perkantoran', 'jl muntung', 'aktif'),
(2, 238, 'Ibrahim', 'laki-laki', 'S1 Pendidikan', 12985, 'Akutansi', 'Jl Sudirman', 'aktif'),
(3, 267, 'Siti', 'Perempuan', 'S1 Pendidikan', 27589, 'Multimedia', 'Jl Sudimampir', 'aktif');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hubungan`
--
ALTER TABLE `hubungan`
  ADD PRIMARY KEY (`id_hub`),
  ADD UNIQUE KEY `siswa_id` (`id_siswa`),
  ADD UNIQUE KEY `ortu_id` (`id_ortu`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ortu`
--
ALTER TABLE `ortu`
  ADD PRIMARY KEY (`id_ortu`);

--
-- Indexes for table `poin`
--
ALTER TABLE `poin`
  ADD PRIMARY KEY (`id_poin`);

--
-- Indexes for table `semester`
--
ALTER TABLE `semester`
  ADD PRIMARY KEY (`id_semester`),
  ADD UNIQUE KEY `siswa_id` (`id_siswa`),
  ADD UNIQUE KEY `point_id` (`id_poin`),
  ADD UNIQUE KEY `wali_id` (`id_wali`),
  ADD UNIQUE KEY `ortu_id` (`id_ortu`),
  ADD UNIQUE KEY `kelas_id` (`id_kelas`),
  ADD UNIQUE KEY `id_poin` (`id_poin`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id_siswa`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD UNIQUE KEY `id` (`id_user`),
  ADD UNIQUE KEY `id_user` (`id_user`);

--
-- Indexes for table `wali_kelas`
--
ALTER TABLE `wali_kelas`
  ADD PRIMARY KEY (`id_wali`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hubungan`
--
ALTER TABLE `hubungan`
  MODIFY `id_hub` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `ortu`
--
ALTER TABLE `ortu`
  MODIFY `id_ortu` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `poin`
--
ALTER TABLE `poin`
  MODIFY `id_poin` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `semester`
--
ALTER TABLE `semester`
  MODIFY `id_semester` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id_siswa` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wali_kelas`
--
ALTER TABLE `wali_kelas`
  MODIFY `id_wali` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `hubungan`
--
ALTER TABLE `hubungan`
  ADD CONSTRAINT `hubungan_ibfk_1` FOREIGN KEY (`id_siswa`) REFERENCES `siswa` (`id_siswa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hubungan_ibfk_2` FOREIGN KEY (`id_ortu`) REFERENCES `ortu` (`id_ortu`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `semester`
--
ALTER TABLE `semester`
  ADD CONSTRAINT `semester_ibfk_1` FOREIGN KEY (`id_siswa`) REFERENCES `siswa` (`id_siswa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `semester_ibfk_3` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `semester_ibfk_4` FOREIGN KEY (`id_wali`) REFERENCES `wali_kelas` (`id_wali`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `semester_ibfk_5` FOREIGN KEY (`id_ortu`) REFERENCES `ortu` (`id_ortu`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `semester_ibfk_6` FOREIGN KEY (`id_poin`) REFERENCES `poin` (`id_poin`) ON DELETE SET NULL ON UPDATE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
