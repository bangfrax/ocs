-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 23, 2020 at 12:53 PM
-- Server version: 5.7.32-cll-lve
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `panelResellerFNS`
--

-- --------------------------------------------------------

--
-- Table structure for table `akun`
--

CREATE TABLE `akun` (
  `id` int(11) NOT NULL,
  `idserver` int(11) NOT NULL,
  `namaserver` varchar(30) NOT NULL,
  `host` varchar(20) NOT NULL,
  `uservpn` varchar(20) NOT NULL,
  `passvpn` varchar(20) NOT NULL,
  `lokasi` varchar(50) NOT NULL,
  `isp` varchar(50) NOT NULL,
  `openssh` varchar(50) NOT NULL,
  `dropbear` varchar(50) NOT NULL,
  `squid` varchar(50) NOT NULL,
  `ovpn` varchar(50) NOT NULL,
  `link_config` varchar(50) NOT NULL,
  `catatan` varchar(300) NOT NULL,
  `expiredate` date NOT NULL,
  `dari` varchar(30) NOT NULL,
  `kode` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `waktu` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `akunlog`
--

CREATE TABLE `akunlog` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `namaserver` varchar(30) NOT NULL,
  `uservpn` varchar(20) NOT NULL,
  `expiredate` date NOT NULL,
  `dari` varchar(30) NOT NULL,
  `kode` varchar(30) NOT NULL,
  `waktu` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

CREATE TABLE `config` (
  `id` int(11) NOT NULL,
  `nama_config` varchar(50) NOT NULL,
  `tgl` date NOT NULL,
  `config` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `informasi`
--

CREATE TABLE `informasi` (
  `id` int(20) NOT NULL,
  `pengumuman` varchar(500) NOT NULL,
  `peraturan` varchar(500) NOT NULL,
  `deposit` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `informasi`
--

INSERT INTO `informasi` (`id`, `pengumuman`, `peraturan`, `deposit`) VALUES
(1, 'Selamat Malam,\r\nUntuk menghindari kolaps, Kami admin memberikan keputusan bahwa Server yang disediakan untuk sementara  hanya SGDO.\r\nKenapa?\r\n1. Masih belum stabilnya bug2 provider.\r\n2. Sudah banyaknya trik internet gratis tanpa menggunakan SSH.\r\n3. Musibah yang dialami Owner saat ini menghambat komunikasi.\r\n=========================\r\nSemua User/Akun pembelian Member akan dialihkan ke server SGDO sesuai dengan Masa Aktif.\r\n=========================', '1. Dilarang Login Lebih Dari 2 Bitvise.\r\n2. Dilarang Melakukan DDOS Server\r\n3. Dilarang SPAM\r\n4. Dilarang Hacking/Carding\r\n5. Dilarang Download Torrent File\r\n6. Dilarang Melakukan Tindakan Ilegal Lainnya\r\n\r\nJika Anda melanggar ketentuan di atas Akun SSH/VPN dihapus secara permanen tanpa pemberitahuan dan refund.\r\n\r\nBy : Admin', '#Member :\r\nMinimal Deposit adalah sesuai Harga Pembelian.\r\n\r\n#Reseller :\r\n1. Deposit 30.000 (40.000 Saldo)\r\n2. Deposit 50.000 (70.000 Saldo)\r\n3. Deposit 100.000 (145.000 Saldo)\r\n\r\nPembayaran Via :\r\n1. Pulsa XL : 6285XXX\r\n2. Pulsa TSEL : 6285XXX\r\n3. Bank BCA : xxxxxx (ForNesia)');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `iduser` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `jk` varchar(10) NOT NULL,
  `kota` varchar(30) NOT NULL,
  `prov` varchar(30) NOT NULL,
  `nohp` varchar(14) NOT NULL,
  `pesan` varchar(500) DEFAULT NULL,
  `balance1` int(11) DEFAULT NULL,
  `balance2` int(11) DEFAULT NULL,
  `balance3` int(11) DEFAULT NULL,
  `status` enum('Pending','Aktif','Kunci') NOT NULL DEFAULT 'Pending',
  `validasi` varchar(100) NOT NULL DEFAULT '0',
  `waktu` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`iduser`, `nama`, `username`, `password`, `email`, `jk`, `kota`, `prov`, `nohp`, `pesan`, `balance1`, `balance2`, `balance3`, `status`, `validasi`, `waktu`) VALUES
(1, 'fornesiafreak', 'fornesiafreak', '$2y$12$Fe.En3Kq1UGIr6hbBzxXPOSDn9kMQ04KgmzdAqYZX0TBxqgvIoqMu', 'fornesiafreak@gmail.com', 'Laki-Laki', 'Bali', 'Bali', '08563776008', '', 0, 0, 0, 'Aktif', '0', '2020-12-23 06:24:45');

-- --------------------------------------------------------

--
-- Table structure for table `memberlog`
--

CREATE TABLE `memberlog` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `waktulogin` datetime NOT NULL,
  `valid` varchar(20) NOT NULL DEFAULT '',
  `ip` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `memberlog`
--

INSERT INTO `memberlog` (`id`, `email`, `waktulogin`, `valid`, `ip`) VALUES
(1, 'fornesiafreak@gmail.com', '2020-12-23 18:25:22', 'Sukses', '110.139.197.254');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `nama_pengirim` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `saldo` enum('Member','Reseller') NOT NULL DEFAULT 'Member',
  `total` int(11) NOT NULL,
  `via` varchar(50) NOT NULL,
  `lunas` enum('Tidak','Ya') NOT NULL DEFAULT 'Tidak',
  `buktitransfer` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `saran`
--

CREATE TABLE `saran` (
  `id` int(11) NOT NULL,
  `nama_pengirim` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `pesan` text NOT NULL,
  `lampiran` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `server`
--

CREATE TABLE `server` (
  `idserver` int(11) NOT NULL,
  `namaserver` varchar(30) NOT NULL,
  `host` varchar(20) NOT NULL,
  `password` text NOT NULL,
  `lokasi` varchar(50) NOT NULL,
  `isp` varchar(50) NOT NULL,
  `trial` varchar(50) NOT NULL,
  `harga1` int(11) NOT NULL,
  `harga2` int(11) NOT NULL,
  `harga3` int(11) NOT NULL,
  `openssh` varchar(50) NOT NULL,
  `dropbear` varchar(50) NOT NULL,
  `squid` varchar(50) NOT NULL,
  `ovpn` varchar(50) NOT NULL,
  `link_config` varchar(50) NOT NULL,
  `status1` enum('Tersedia','Tidak') NOT NULL DEFAULT 'Tidak',
  `status2` enum('Tersedia','Tidak') NOT NULL DEFAULT 'Tidak',
  `status3` enum('Tersedia','Tidak') NOT NULL DEFAULT 'Tidak',
  `catatan` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `site`
--

CREATE TABLE `site` (
  `id` int(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `url` varchar(50) NOT NULL,
  `fb` varchar(50) NOT NULL,
  `telegram` varchar(50) NOT NULL,
  `twitter` varchar(50) NOT NULL,
  `bbm` varchar(50) NOT NULL,
  `wa` varchar(50) NOT NULL,
  `line` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `site`
--

INSERT INTO `site` (`id`, `name`, `email`, `url`, `fb`, `telegram`, `twitter`, `bbm`, `wa`, `line`) VALUES
(1, 'FNS SSH', 'fornesiafreak@gmail.com', 'https://www.fornesia.com', 'https://facebook.com/fornesiacom/', 'https://t.me/', 'https://twitter.com/fornesia', '123xx', '123xx', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `expiredate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nama`, `username`, `password`, `expiredate`) VALUES
(1, 'Admin', 'admin', '$2y$12$J0eQCS1zU38L8VTF2vXDR.RvZ220XFxTA/yvqwp22uICi9NJO2.QO', '2021-07-27');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `akun`
--
ALTER TABLE `akun`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `akunlog`
--
ALTER TABLE `akunlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `informasi`
--
ALTER TABLE `informasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`iduser`);

--
-- Indexes for table `memberlog`
--
ALTER TABLE `memberlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `saran`
--
ALTER TABLE `saran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `server`
--
ALTER TABLE `server`
  ADD PRIMARY KEY (`idserver`);

--
-- Indexes for table `site`
--
ALTER TABLE `site`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `akun`
--
ALTER TABLE `akun`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `akunlog`
--
ALTER TABLE `akunlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `config`
--
ALTER TABLE `config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `informasi`
--
ALTER TABLE `informasi`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `memberlog`
--
ALTER TABLE `memberlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `saran`
--
ALTER TABLE `saran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `server`
--
ALTER TABLE `server`
  MODIFY `idserver` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `site`
--
ALTER TABLE `site`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
