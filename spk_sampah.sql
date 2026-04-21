-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 21, 2026 at 03:14 PM
-- Server version: 8.4.3
-- PHP Version: 8.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spk_sampah`
--

-- --------------------------------------------------------

--
-- Table structure for table `alternatives`
--

CREATE TABLE `alternatives` (
  `id_alternatives` int NOT NULL,
  `kode` varchar(10) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `alternatives`
--

INSERT INTO `alternatives` (`id_alternatives`, `kode`, `nama`, `createdAt`, `updatedAt`) VALUES
(1, 'A1', 'Bank Sampah', '2026-03-06 08:51:54', '2026-03-06 08:51:54'),
(2, 'A2', 'Sedekah Sampah', '2026-03-06 08:52:06', '2026-03-06 08:52:06'),
(3, 'A3', 'Pengolahan Organik (Magot)', '2026-03-06 08:52:26', '2026-03-06 08:52:26');

-- --------------------------------------------------------

--
-- Table structure for table `comparisons`
--

CREATE TABLE `comparisons` (
  `id_comparisons` int NOT NULL,
  `id_users` int NOT NULL,
  `category` enum('criteria','sub_criteria','alternative') NOT NULL,
  `criteria_id_1` int DEFAULT NULL,
  `criteria_id_2` int DEFAULT NULL,
  `parent_criteria_id` int DEFAULT NULL,
  `sub_criteria_id_1` int DEFAULT NULL,
  `sub_criteria_id_2` int DEFAULT NULL,
  `parent_sub_criteria_id` int DEFAULT NULL,
  `alternative_id_1` int DEFAULT NULL,
  `alternative_id_2` int DEFAULT NULL,
  `value` float NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `comparisons`
--

INSERT INTO `comparisons` (`id_comparisons`, `id_users`, `category`, `criteria_id_1`, `criteria_id_2`, `parent_criteria_id`, `sub_criteria_id_1`, `sub_criteria_id_2`, `parent_sub_criteria_id`, `alternative_id_1`, `alternative_id_2`, `value`, `createdAt`, `updatedAt`) VALUES
(30, 2, 'criteria', 4, 5, NULL, NULL, NULL, NULL, NULL, NULL, 3, '2026-03-06 12:25:16', '2026-03-06 12:25:16'),
(31, 2, 'criteria', 4, 6, NULL, NULL, NULL, NULL, NULL, NULL, 0.333333, '2026-03-06 12:25:16', '2026-03-06 12:25:16'),
(32, 2, 'criteria', 5, 6, NULL, NULL, NULL, NULL, NULL, NULL, 0.142857, '2026-03-06 12:25:16', '2026-03-06 12:25:16'),
(33, 2, 'sub_criteria', NULL, NULL, 4, 8, 9, NULL, NULL, NULL, 0.333333, '2026-03-06 12:25:16', '2026-03-06 12:25:16'),
(34, 2, 'sub_criteria', NULL, NULL, 4, 8, 10, NULL, NULL, NULL, 0.333333, '2026-03-06 12:25:16', '2026-03-06 12:25:16'),
(35, 2, 'sub_criteria', NULL, NULL, 4, 9, 10, NULL, NULL, NULL, 3, '2026-03-06 12:25:16', '2026-03-06 12:25:16'),
(36, 2, 'sub_criteria', NULL, NULL, 5, 11, 12, NULL, NULL, NULL, 3, '2026-03-06 12:25:16', '2026-03-06 12:25:16'),
(37, 2, 'sub_criteria', NULL, NULL, 6, 13, 14, NULL, NULL, NULL, 5, '2026-03-06 12:25:16', '2026-03-06 12:25:16'),
(38, 2, 'alternative', NULL, NULL, NULL, NULL, NULL, 8, 1, 2, 0.333333, '2026-03-06 12:25:16', '2026-03-06 12:25:16'),
(39, 2, 'alternative', NULL, NULL, NULL, NULL, NULL, 8, 1, 3, 2, '2026-03-06 12:25:16', '2026-03-06 12:25:16'),
(40, 2, 'alternative', NULL, NULL, NULL, NULL, NULL, 8, 2, 3, 7, '2026-03-06 12:25:16', '2026-03-06 12:25:16'),
(41, 2, 'alternative', NULL, NULL, NULL, NULL, NULL, 9, 1, 2, 0.333333, '2026-03-06 12:25:16', '2026-03-06 12:25:16'),
(42, 2, 'alternative', NULL, NULL, NULL, NULL, NULL, 9, 1, 3, 2, '2026-03-06 12:25:16', '2026-03-06 12:25:16'),
(43, 2, 'alternative', NULL, NULL, NULL, NULL, NULL, 9, 2, 3, 7, '2026-03-06 12:25:16', '2026-03-06 12:25:16'),
(44, 2, 'alternative', NULL, NULL, NULL, NULL, NULL, 10, 1, 2, 0.142857, '2026-03-06 12:25:16', '2026-03-06 12:25:16'),
(45, 2, 'alternative', NULL, NULL, NULL, NULL, NULL, 10, 1, 3, 2, '2026-03-06 12:25:16', '2026-03-06 12:25:16'),
(46, 2, 'alternative', NULL, NULL, NULL, NULL, NULL, 10, 2, 3, 9, '2026-03-06 12:25:16', '2026-03-06 12:25:16'),
(47, 2, 'alternative', NULL, NULL, NULL, NULL, NULL, 11, 1, 2, 3, '2026-03-06 12:25:16', '2026-03-06 12:25:16'),
(48, 2, 'alternative', NULL, NULL, NULL, NULL, NULL, 11, 1, 3, 5, '2026-03-06 12:25:16', '2026-03-06 12:25:16'),
(49, 2, 'alternative', NULL, NULL, NULL, NULL, NULL, 11, 2, 3, 2, '2026-03-06 12:25:16', '2026-03-06 12:25:16'),
(50, 2, 'alternative', NULL, NULL, NULL, NULL, NULL, 12, 1, 2, 0.111111, '2026-03-06 12:25:16', '2026-03-06 12:25:16'),
(51, 2, 'alternative', NULL, NULL, NULL, NULL, NULL, 12, 1, 3, 0.5, '2026-03-06 12:25:16', '2026-03-06 12:25:16'),
(52, 2, 'alternative', NULL, NULL, NULL, NULL, NULL, 12, 2, 3, 3, '2026-03-06 12:25:16', '2026-03-06 12:25:16'),
(53, 2, 'alternative', NULL, NULL, NULL, NULL, NULL, 13, 1, 2, 3, '2026-03-06 12:25:16', '2026-03-06 12:25:16'),
(54, 2, 'alternative', NULL, NULL, NULL, NULL, NULL, 13, 1, 3, 0.25, '2026-03-06 12:25:16', '2026-03-06 12:25:16'),
(55, 2, 'alternative', NULL, NULL, NULL, NULL, NULL, 13, 2, 3, 0.166667, '2026-03-06 12:25:16', '2026-03-06 12:25:16'),
(56, 2, 'alternative', NULL, NULL, NULL, NULL, NULL, 14, 1, 2, 4, '2026-03-06 12:25:16', '2026-03-06 12:25:16'),
(57, 2, 'alternative', NULL, NULL, NULL, NULL, NULL, 14, 1, 3, 0.2, '2026-03-06 12:25:16', '2026-03-06 12:25:16'),
(58, 2, 'alternative', NULL, NULL, NULL, NULL, NULL, 14, 2, 3, 0.166667, '2026-03-06 12:25:16', '2026-03-06 12:25:16'),
(59, 3, 'criteria', 4, 5, NULL, NULL, NULL, NULL, NULL, NULL, 3, '2026-03-06 12:30:18', '2026-03-06 12:30:18'),
(60, 3, 'criteria', 4, 6, NULL, NULL, NULL, NULL, NULL, NULL, 0.333333, '2026-03-06 12:30:18', '2026-03-06 12:30:18'),
(61, 3, 'criteria', 5, 6, NULL, NULL, NULL, NULL, NULL, NULL, 0.2, '2026-03-06 12:30:18', '2026-03-06 12:30:18'),
(62, 3, 'sub_criteria', NULL, NULL, 4, 8, 9, NULL, NULL, NULL, 0.142857, '2026-03-06 12:30:18', '2026-03-06 12:30:18'),
(63, 3, 'sub_criteria', NULL, NULL, 4, 8, 10, NULL, NULL, NULL, 0.5, '2026-03-06 12:30:18', '2026-03-06 12:30:18'),
(64, 3, 'sub_criteria', NULL, NULL, 4, 9, 10, NULL, NULL, NULL, 3, '2026-03-06 12:30:18', '2026-03-06 12:30:18'),
(65, 3, 'sub_criteria', NULL, NULL, 5, 11, 12, NULL, NULL, NULL, 0.333333, '2026-03-06 12:30:18', '2026-03-06 12:30:18'),
(66, 3, 'sub_criteria', NULL, NULL, 6, 13, 14, NULL, NULL, NULL, 7, '2026-03-06 12:30:18', '2026-03-06 12:30:18'),
(67, 3, 'alternative', NULL, NULL, NULL, NULL, NULL, 8, 1, 2, 0.142857, '2026-03-06 12:30:18', '2026-03-06 12:30:18'),
(68, 3, 'alternative', NULL, NULL, NULL, NULL, NULL, 8, 1, 3, 3, '2026-03-06 12:30:18', '2026-03-06 12:30:18'),
(69, 3, 'alternative', NULL, NULL, NULL, NULL, NULL, 8, 2, 3, 9, '2026-03-06 12:30:18', '2026-03-06 12:30:18'),
(70, 3, 'alternative', NULL, NULL, NULL, NULL, NULL, 9, 1, 2, 0.333333, '2026-03-06 12:30:18', '2026-03-06 12:30:18'),
(71, 3, 'alternative', NULL, NULL, NULL, NULL, NULL, 9, 1, 3, 5, '2026-03-06 12:30:18', '2026-03-06 12:30:18'),
(72, 3, 'alternative', NULL, NULL, NULL, NULL, NULL, 9, 2, 3, 7, '2026-03-06 12:30:18', '2026-03-06 12:30:18'),
(73, 3, 'alternative', NULL, NULL, NULL, NULL, NULL, 10, 1, 2, 0.2, '2026-03-06 12:30:18', '2026-03-06 12:30:18'),
(74, 3, 'alternative', NULL, NULL, NULL, NULL, NULL, 10, 1, 3, 3, '2026-03-06 12:30:18', '2026-03-06 12:30:18'),
(75, 3, 'alternative', NULL, NULL, NULL, NULL, NULL, 10, 2, 3, 9, '2026-03-06 12:30:18', '2026-03-06 12:30:18'),
(76, 3, 'alternative', NULL, NULL, NULL, NULL, NULL, 11, 1, 2, 3, '2026-03-06 12:30:18', '2026-03-06 12:30:18'),
(77, 3, 'alternative', NULL, NULL, NULL, NULL, NULL, 11, 1, 3, 7, '2026-03-06 12:30:18', '2026-03-06 12:30:18'),
(78, 3, 'alternative', NULL, NULL, NULL, NULL, NULL, 11, 2, 3, 3, '2026-03-06 12:30:18', '2026-03-06 12:30:18'),
(79, 3, 'alternative', NULL, NULL, NULL, NULL, NULL, 12, 1, 2, 0.111111, '2026-03-06 12:30:18', '2026-03-06 12:30:18'),
(80, 3, 'alternative', NULL, NULL, NULL, NULL, NULL, 12, 1, 3, 0.333333, '2026-03-06 12:30:18', '2026-03-06 12:30:18'),
(81, 3, 'alternative', NULL, NULL, NULL, NULL, NULL, 12, 2, 3, 3, '2026-03-06 12:30:18', '2026-03-06 12:30:18'),
(82, 3, 'alternative', NULL, NULL, NULL, NULL, NULL, 13, 1, 2, 3, '2026-03-06 12:30:18', '2026-03-06 12:30:18'),
(83, 3, 'alternative', NULL, NULL, NULL, NULL, NULL, 13, 1, 3, 0.333333, '2026-03-06 12:30:18', '2026-03-06 12:30:18'),
(84, 3, 'alternative', NULL, NULL, NULL, NULL, NULL, 13, 2, 3, 0.2, '2026-03-06 12:30:18', '2026-03-06 12:30:18'),
(85, 3, 'alternative', NULL, NULL, NULL, NULL, NULL, 14, 1, 2, 3, '2026-03-06 12:30:18', '2026-03-06 12:30:18'),
(86, 3, 'alternative', NULL, NULL, NULL, NULL, NULL, 14, 1, 3, 0.333333, '2026-03-06 12:30:18', '2026-03-06 12:30:18'),
(87, 3, 'alternative', NULL, NULL, NULL, NULL, NULL, 14, 2, 3, 0.166667, '2026-03-06 12:30:18', '2026-03-06 12:30:18'),
(88, 1, 'criteria', 4, 5, NULL, NULL, NULL, NULL, NULL, NULL, 3, '2026-03-06 12:58:07', '2026-03-06 12:58:07'),
(89, 1, 'criteria', 4, 6, NULL, NULL, NULL, NULL, NULL, NULL, 0.2, '2026-03-06 12:58:07', '2026-03-06 12:58:07'),
(90, 1, 'criteria', 5, 6, NULL, NULL, NULL, NULL, NULL, NULL, 0.142857, '2026-03-06 12:58:07', '2026-03-06 12:58:07'),
(91, 1, 'sub_criteria', NULL, NULL, 4, 8, 9, NULL, NULL, NULL, 0.2, '2026-03-06 12:58:07', '2026-03-06 12:58:07'),
(92, 1, 'sub_criteria', NULL, NULL, 4, 8, 10, NULL, NULL, NULL, 0.333333, '2026-03-06 12:58:07', '2026-03-06 12:58:07'),
(93, 1, 'sub_criteria', NULL, NULL, 4, 9, 10, NULL, NULL, NULL, 3, '2026-03-06 12:58:07', '2026-03-06 12:58:07'),
(94, 1, 'sub_criteria', NULL, NULL, 5, 11, 12, NULL, NULL, NULL, 3, '2026-03-06 12:58:07', '2026-03-06 12:58:07'),
(95, 1, 'sub_criteria', NULL, NULL, 6, 13, 14, NULL, NULL, NULL, 4, '2026-03-06 12:58:07', '2026-03-06 12:58:07'),
(96, 1, 'alternative', NULL, NULL, NULL, NULL, NULL, 8, 1, 2, 0.2, '2026-03-06 12:58:07', '2026-03-06 12:58:07'),
(97, 1, 'alternative', NULL, NULL, NULL, NULL, NULL, 8, 1, 3, 3, '2026-03-06 12:58:07', '2026-03-06 12:58:07'),
(98, 1, 'alternative', NULL, NULL, NULL, NULL, NULL, 8, 2, 3, 7, '2026-03-06 12:58:07', '2026-03-06 12:58:07'),
(99, 1, 'alternative', NULL, NULL, NULL, NULL, NULL, 9, 1, 2, 0.333333, '2026-03-06 12:58:07', '2026-03-06 12:58:07'),
(100, 1, 'alternative', NULL, NULL, NULL, NULL, NULL, 9, 1, 3, 3, '2026-03-06 12:58:07', '2026-03-06 12:58:07'),
(101, 1, 'alternative', NULL, NULL, NULL, NULL, NULL, 9, 2, 3, 9, '2026-03-06 12:58:07', '2026-03-06 12:58:07'),
(102, 1, 'alternative', NULL, NULL, NULL, NULL, NULL, 10, 1, 2, 0.2, '2026-03-06 12:58:07', '2026-03-06 12:58:07'),
(103, 1, 'alternative', NULL, NULL, NULL, NULL, NULL, 10, 1, 3, 3, '2026-03-06 12:58:07', '2026-03-06 12:58:07'),
(104, 1, 'alternative', NULL, NULL, NULL, NULL, NULL, 10, 2, 3, 7, '2026-03-06 12:58:07', '2026-03-06 12:58:07'),
(105, 1, 'alternative', NULL, NULL, NULL, NULL, NULL, 11, 1, 2, 2, '2026-03-06 12:58:07', '2026-03-06 12:58:07'),
(106, 1, 'alternative', NULL, NULL, NULL, NULL, NULL, 11, 1, 3, 6, '2026-03-06 12:58:07', '2026-03-06 12:58:07'),
(107, 1, 'alternative', NULL, NULL, NULL, NULL, NULL, 11, 2, 3, 3, '2026-03-06 12:58:07', '2026-03-06 12:58:07'),
(108, 1, 'alternative', NULL, NULL, NULL, NULL, NULL, 12, 1, 2, 0.142857, '2026-03-06 12:58:07', '2026-03-06 12:58:07'),
(109, 1, 'alternative', NULL, NULL, NULL, NULL, NULL, 12, 1, 3, 0.333333, '2026-03-06 12:58:07', '2026-03-06 12:58:07'),
(110, 1, 'alternative', NULL, NULL, NULL, NULL, NULL, 12, 2, 3, 5, '2026-03-06 12:58:07', '2026-03-06 12:58:07'),
(111, 1, 'alternative', NULL, NULL, NULL, NULL, NULL, 13, 1, 2, 5, '2026-03-06 12:58:07', '2026-03-06 12:58:07'),
(112, 1, 'alternative', NULL, NULL, NULL, NULL, NULL, 13, 1, 3, 0.333333, '2026-03-06 12:58:07', '2026-03-06 12:58:07'),
(113, 1, 'alternative', NULL, NULL, NULL, NULL, NULL, 13, 2, 3, 0.142857, '2026-03-06 12:58:07', '2026-03-06 12:58:07'),
(114, 1, 'alternative', NULL, NULL, NULL, NULL, NULL, 14, 1, 2, 3, '2026-03-06 12:58:07', '2026-03-06 12:58:07'),
(115, 1, 'alternative', NULL, NULL, NULL, NULL, NULL, 14, 1, 3, 0.25, '2026-03-06 12:58:07', '2026-03-06 12:58:07'),
(116, 1, 'alternative', NULL, NULL, NULL, NULL, NULL, 14, 2, 3, 0.142857, '2026-03-06 12:58:07', '2026-03-06 12:58:07');

-- --------------------------------------------------------

--
-- Table structure for table `criteria`
--

CREATE TABLE `criteria` (
  `id_criteria` int NOT NULL,
  `kode` varchar(10) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `bobot` float DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `criteria`
--

INSERT INTO `criteria` (`id_criteria`, `kode`, `nama`, `bobot`, `createdAt`, `updatedAt`) VALUES
(4, 'C1', 'Aspek Kesiapan', 0.230691, '2026-03-06 08:49:22', '2026-03-06 12:30:32'),
(5, 'C2', 'Sosial & Kemudahan', 0.092187, '2026-03-06 08:49:36', '2026-03-06 12:30:32'),
(6, 'C3', 'Potensi Manfaat', 0.677122, '2026-03-06 08:49:48', '2026-03-06 12:30:32');

-- --------------------------------------------------------

--
-- Table structure for table `rankings`
--

CREATE TABLE `rankings` (
  `id_rankings` int NOT NULL,
  `id_alternatives` int NOT NULL,
  `score` float NOT NULL DEFAULT '0',
  `rank` int NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `rankings`
--

INSERT INTO `rankings` (`id_rankings`, `id_alternatives`, `score`, `rank`, `createdAt`, `updatedAt`) VALUES
(34, 3, 0.479224, 1, '2026-03-06 13:08:26', '2026-03-06 13:08:26'),
(35, 2, 0.263665, 2, '2026-03-06 13:08:26', '2026-03-06 13:08:26'),
(36, 1, 0.257111, 3, '2026-03-06 13:08:26', '2026-03-06 13:08:26');

-- --------------------------------------------------------

--
-- Table structure for table `sub_criteria`
--

CREATE TABLE `sub_criteria` (
  `id_sub_criteria` int NOT NULL,
  `id_criteria` int NOT NULL,
  `kode` varchar(10) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `bobot_lokal` float DEFAULT '0',
  `bobot_global` float DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sub_criteria`
--

INSERT INTO `sub_criteria` (`id_sub_criteria`, `id_criteria`, `kode`, `nama`, `bobot_lokal`, `bobot_global`, `createdAt`, `updatedAt`) VALUES
(8, 4, 'SC1.1', 'Sumber Daya Manusia', 0.114727, 0.026466, '2026-03-06 08:50:18', '2026-03-06 12:30:32'),
(9, 4, 'SC1.2', 'Kebutuhan Lahan', 0.632529, 0.145919, '2026-03-06 08:50:28', '2026-03-06 12:30:32'),
(10, 4, 'SC1.3', 'Investasi Awal', 0.252744, 0.058306, '2026-03-06 08:50:38', '2026-03-06 12:30:32'),
(11, 5, 'SC2.1', 'Partisipasi Warga', 0.590541, 0.05444, '2026-03-06 08:50:55', '2026-03-06 12:58:10'),
(12, 5, 'SC2.2', 'Kemudahan Pemilahan', 0.409459, 0.037747, '2026-03-06 08:51:08', '2026-03-06 12:58:10'),
(13, 6, 'SC3.1', 'Nilai Ekonomi', 0.838514, 0.567776, '2026-03-06 08:51:18', '2026-03-06 12:30:32'),
(14, 6, 'SC3.2', 'Efektifitas Reduksi Sampah', 0.161486, 0.109346, '2026-03-06 08:51:34', '2026-03-06 12:30:32');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_users` int NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','responden') NOT NULL DEFAULT 'responden',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_users`, `username`, `password`, `role`, `createdAt`, `updatedAt`) VALUES
(1, 'admin', '$2b$10$uXarxd9zVGsKklAi.mgPC.NpV7dkh8/oP73UvJy068tBFtyaubjDW', 'admin', '2026-03-06 08:26:48', '2026-03-06 08:26:48'),
(2, 'bapakrt1', '$2b$10$5IxlCPCjHOgCuVBuDbWKbeNbe.c7FdSyWU/bxEm1THBw1TeVe.iMu', 'responden', '2026-03-06 09:13:14', '2026-03-06 09:13:14'),
(3, 'bapakrt2', '$2b$10$WZ9Q53RE./Nsh78XtbkJ2upcRcdAcJgjKN64cMBz8LInzkhTFzgHK', 'responden', '2026-03-06 12:25:39', '2026-03-06 12:25:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alternatives`
--
ALTER TABLE `alternatives`
  ADD PRIMARY KEY (`id_alternatives`),
  ADD UNIQUE KEY `kode` (`kode`),
  ADD UNIQUE KEY `kode_2` (`kode`),
  ADD UNIQUE KEY `kode_3` (`kode`),
  ADD UNIQUE KEY `kode_4` (`kode`),
  ADD UNIQUE KEY `kode_5` (`kode`),
  ADD UNIQUE KEY `kode_6` (`kode`),
  ADD UNIQUE KEY `kode_7` (`kode`),
  ADD UNIQUE KEY `kode_8` (`kode`);

--
-- Indexes for table `comparisons`
--
ALTER TABLE `comparisons`
  ADD PRIMARY KEY (`id_comparisons`),
  ADD KEY `id_users` (`id_users`),
  ADD KEY `criteria_id_1` (`criteria_id_1`),
  ADD KEY `criteria_id_2` (`criteria_id_2`),
  ADD KEY `parent_criteria_id` (`parent_criteria_id`),
  ADD KEY `sub_criteria_id_1` (`sub_criteria_id_1`),
  ADD KEY `sub_criteria_id_2` (`sub_criteria_id_2`),
  ADD KEY `parent_sub_criteria_id` (`parent_sub_criteria_id`),
  ADD KEY `alternative_id_1` (`alternative_id_1`),
  ADD KEY `alternative_id_2` (`alternative_id_2`);

--
-- Indexes for table `criteria`
--
ALTER TABLE `criteria`
  ADD PRIMARY KEY (`id_criteria`),
  ADD UNIQUE KEY `kode` (`kode`),
  ADD UNIQUE KEY `kode_2` (`kode`),
  ADD UNIQUE KEY `kode_3` (`kode`),
  ADD UNIQUE KEY `kode_4` (`kode`),
  ADD UNIQUE KEY `kode_5` (`kode`),
  ADD UNIQUE KEY `kode_6` (`kode`),
  ADD UNIQUE KEY `kode_7` (`kode`),
  ADD UNIQUE KEY `kode_8` (`kode`),
  ADD UNIQUE KEY `kode_9` (`kode`);

--
-- Indexes for table `rankings`
--
ALTER TABLE `rankings`
  ADD PRIMARY KEY (`id_rankings`),
  ADD KEY `id_alternatives` (`id_alternatives`);

--
-- Indexes for table `sub_criteria`
--
ALTER TABLE `sub_criteria`
  ADD PRIMARY KEY (`id_sub_criteria`),
  ADD UNIQUE KEY `kode` (`kode`),
  ADD UNIQUE KEY `kode_2` (`kode`),
  ADD UNIQUE KEY `kode_3` (`kode`),
  ADD UNIQUE KEY `kode_4` (`kode`),
  ADD UNIQUE KEY `kode_5` (`kode`),
  ADD UNIQUE KEY `kode_6` (`kode`),
  ADD UNIQUE KEY `kode_7` (`kode`),
  ADD UNIQUE KEY `kode_8` (`kode`),
  ADD KEY `id_criteria` (`id_criteria`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_users`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `username_2` (`username`),
  ADD UNIQUE KEY `username_3` (`username`),
  ADD UNIQUE KEY `username_4` (`username`),
  ADD UNIQUE KEY `username_5` (`username`),
  ADD UNIQUE KEY `username_6` (`username`),
  ADD UNIQUE KEY `username_7` (`username`),
  ADD UNIQUE KEY `username_8` (`username`),
  ADD UNIQUE KEY `username_9` (`username`),
  ADD UNIQUE KEY `username_10` (`username`),
  ADD UNIQUE KEY `username_11` (`username`),
  ADD UNIQUE KEY `username_12` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alternatives`
--
ALTER TABLE `alternatives`
  MODIFY `id_alternatives` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `comparisons`
--
ALTER TABLE `comparisons`
  MODIFY `id_comparisons` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT for table `criteria`
--
ALTER TABLE `criteria`
  MODIFY `id_criteria` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `rankings`
--
ALTER TABLE `rankings`
  MODIFY `id_rankings` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `sub_criteria`
--
ALTER TABLE `sub_criteria`
  MODIFY `id_sub_criteria` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_users` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comparisons`
--
ALTER TABLE `comparisons`
  ADD CONSTRAINT `comparisons_ibfk_64` FOREIGN KEY (`id_users`) REFERENCES `users` (`id_users`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comparisons_ibfk_65` FOREIGN KEY (`criteria_id_1`) REFERENCES `criteria` (`id_criteria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `comparisons_ibfk_66` FOREIGN KEY (`criteria_id_2`) REFERENCES `criteria` (`id_criteria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `comparisons_ibfk_67` FOREIGN KEY (`parent_criteria_id`) REFERENCES `criteria` (`id_criteria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `comparisons_ibfk_68` FOREIGN KEY (`sub_criteria_id_1`) REFERENCES `sub_criteria` (`id_sub_criteria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `comparisons_ibfk_69` FOREIGN KEY (`sub_criteria_id_2`) REFERENCES `sub_criteria` (`id_sub_criteria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `comparisons_ibfk_70` FOREIGN KEY (`parent_sub_criteria_id`) REFERENCES `sub_criteria` (`id_sub_criteria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `comparisons_ibfk_71` FOREIGN KEY (`alternative_id_1`) REFERENCES `alternatives` (`id_alternatives`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `comparisons_ibfk_72` FOREIGN KEY (`alternative_id_2`) REFERENCES `alternatives` (`id_alternatives`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `rankings`
--
ALTER TABLE `rankings`
  ADD CONSTRAINT `rankings_ibfk_1` FOREIGN KEY (`id_alternatives`) REFERENCES `alternatives` (`id_alternatives`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sub_criteria`
--
ALTER TABLE `sub_criteria`
  ADD CONSTRAINT `sub_criteria_ibfk_1` FOREIGN KEY (`id_criteria`) REFERENCES `criteria` (`id_criteria`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
