-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 24, 2026 at 08:08 AM
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
(116, 1, 'alternative', NULL, NULL, NULL, NULL, NULL, 14, 2, 3, 0.142857, '2026-03-06 12:58:07', '2026-03-06 12:58:07'),
(2466, 9, 'criteria', 4, 5, NULL, NULL, NULL, NULL, NULL, NULL, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2467, 9, 'criteria', 4, 6, NULL, NULL, NULL, NULL, NULL, NULL, 0.25, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2468, 9, 'criteria', 5, 6, NULL, NULL, NULL, NULL, NULL, NULL, 0.166667, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2469, 9, 'sub_criteria', NULL, NULL, 4, 8, 9, NULL, NULL, NULL, 0.25, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2470, 9, 'sub_criteria', NULL, NULL, 4, 8, 10, NULL, NULL, NULL, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2471, 9, 'sub_criteria', NULL, NULL, 4, 9, 10, NULL, NULL, NULL, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2472, 9, 'sub_criteria', NULL, NULL, 5, 11, 12, NULL, NULL, NULL, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2473, 9, 'sub_criteria', NULL, NULL, 6, 13, 14, NULL, NULL, NULL, 6, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2474, 9, 'alternative', NULL, NULL, NULL, NULL, NULL, 8, 1, 2, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2475, 9, 'alternative', NULL, NULL, NULL, NULL, NULL, 8, 1, 3, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2476, 9, 'alternative', NULL, NULL, NULL, NULL, NULL, 8, 2, 3, 7, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2477, 9, 'alternative', NULL, NULL, NULL, NULL, NULL, 9, 1, 2, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2478, 9, 'alternative', NULL, NULL, NULL, NULL, NULL, 9, 1, 3, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2479, 9, 'alternative', NULL, NULL, NULL, NULL, NULL, 9, 2, 3, 5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2480, 9, 'alternative', NULL, NULL, NULL, NULL, NULL, 10, 1, 2, 0.25, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2481, 9, 'alternative', NULL, NULL, NULL, NULL, NULL, 10, 1, 3, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2482, 9, 'alternative', NULL, NULL, NULL, NULL, NULL, 10, 2, 3, 6, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2483, 9, 'alternative', NULL, NULL, NULL, NULL, NULL, 11, 1, 2, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2484, 9, 'alternative', NULL, NULL, NULL, NULL, NULL, 11, 1, 3, 5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2485, 9, 'alternative', NULL, NULL, NULL, NULL, NULL, 11, 2, 3, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2486, 9, 'alternative', NULL, NULL, NULL, NULL, NULL, 12, 1, 2, 0.25, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2487, 9, 'alternative', NULL, NULL, NULL, NULL, NULL, 12, 1, 3, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2488, 9, 'alternative', NULL, NULL, NULL, NULL, NULL, 12, 2, 3, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2489, 9, 'alternative', NULL, NULL, NULL, NULL, NULL, 13, 1, 2, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2490, 9, 'alternative', NULL, NULL, NULL, NULL, NULL, 13, 1, 3, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2491, 9, 'alternative', NULL, NULL, NULL, NULL, NULL, 13, 2, 3, 0.2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2492, 9, 'alternative', NULL, NULL, NULL, NULL, NULL, 14, 1, 2, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2493, 9, 'alternative', NULL, NULL, NULL, NULL, NULL, 14, 1, 3, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2494, 9, 'alternative', NULL, NULL, NULL, NULL, NULL, 14, 2, 3, 0.166667, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2495, 10, 'criteria', 4, 5, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2496, 10, 'criteria', 4, 6, NULL, NULL, NULL, NULL, NULL, NULL, 0.2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2497, 10, 'criteria', 5, 6, NULL, NULL, NULL, NULL, NULL, NULL, 0.166667, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2498, 10, 'sub_criteria', NULL, NULL, 4, 8, 9, NULL, NULL, NULL, 0.2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2499, 10, 'sub_criteria', NULL, NULL, 4, 8, 10, NULL, NULL, NULL, 0.25, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2500, 10, 'sub_criteria', NULL, NULL, 4, 9, 10, NULL, NULL, NULL, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2501, 10, 'sub_criteria', NULL, NULL, 5, 11, 12, NULL, NULL, NULL, 4, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2502, 10, 'sub_criteria', NULL, NULL, 6, 13, 14, NULL, NULL, NULL, 5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2503, 10, 'alternative', NULL, NULL, NULL, NULL, NULL, 8, 1, 2, 0.25, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2504, 10, 'alternative', NULL, NULL, NULL, NULL, NULL, 8, 1, 3, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2505, 10, 'alternative', NULL, NULL, NULL, NULL, NULL, 8, 2, 3, 6, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2506, 10, 'alternative', NULL, NULL, NULL, NULL, NULL, 9, 1, 2, 0.25, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2507, 10, 'alternative', NULL, NULL, NULL, NULL, NULL, 9, 1, 3, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2508, 10, 'alternative', NULL, NULL, NULL, NULL, NULL, 9, 2, 3, 7, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2509, 10, 'alternative', NULL, NULL, NULL, NULL, NULL, 10, 1, 2, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2510, 10, 'alternative', NULL, NULL, NULL, NULL, NULL, 10, 1, 3, 0.5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2511, 10, 'alternative', NULL, NULL, NULL, NULL, NULL, 10, 2, 3, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2512, 10, 'alternative', NULL, NULL, NULL, NULL, NULL, 11, 1, 2, 4, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2513, 10, 'alternative', NULL, NULL, NULL, NULL, NULL, 11, 1, 3, 6, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2514, 10, 'alternative', NULL, NULL, NULL, NULL, NULL, 11, 2, 3, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2515, 10, 'alternative', NULL, NULL, NULL, NULL, NULL, 12, 1, 2, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2516, 10, 'alternative', NULL, NULL, NULL, NULL, NULL, 12, 1, 3, 0.5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2517, 10, 'alternative', NULL, NULL, NULL, NULL, NULL, 12, 2, 3, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2518, 10, 'alternative', NULL, NULL, NULL, NULL, NULL, 13, 1, 2, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2519, 10, 'alternative', NULL, NULL, NULL, NULL, NULL, 13, 1, 3, 0.25, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2520, 10, 'alternative', NULL, NULL, NULL, NULL, NULL, 13, 2, 3, 0.2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2521, 10, 'alternative', NULL, NULL, NULL, NULL, NULL, 14, 1, 2, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2522, 10, 'alternative', NULL, NULL, NULL, NULL, NULL, 14, 1, 3, 0.25, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2523, 10, 'alternative', NULL, NULL, NULL, NULL, NULL, 14, 2, 3, 0.2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2524, 11, 'criteria', 4, 5, NULL, NULL, NULL, NULL, NULL, NULL, 4, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2525, 11, 'criteria', 4, 6, NULL, NULL, NULL, NULL, NULL, NULL, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2526, 11, 'criteria', 5, 6, NULL, NULL, NULL, NULL, NULL, NULL, 0.142857, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2527, 11, 'sub_criteria', NULL, NULL, 4, 8, 9, NULL, NULL, NULL, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2528, 11, 'sub_criteria', NULL, NULL, 4, 8, 10, NULL, NULL, NULL, 0.25, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2529, 11, 'sub_criteria', NULL, NULL, 4, 9, 10, NULL, NULL, NULL, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2530, 11, 'sub_criteria', NULL, NULL, 5, 11, 12, NULL, NULL, NULL, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2531, 11, 'sub_criteria', NULL, NULL, 6, 13, 14, NULL, NULL, NULL, 5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2532, 11, 'alternative', NULL, NULL, NULL, NULL, NULL, 8, 1, 2, 0.5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2533, 11, 'alternative', NULL, NULL, NULL, NULL, NULL, 8, 1, 3, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2534, 11, 'alternative', NULL, NULL, NULL, NULL, NULL, 8, 2, 3, 5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2535, 11, 'alternative', NULL, NULL, NULL, NULL, NULL, 9, 1, 2, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2536, 11, 'alternative', NULL, NULL, NULL, NULL, NULL, 9, 1, 3, 5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2537, 11, 'alternative', NULL, NULL, NULL, NULL, NULL, 9, 2, 3, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2538, 11, 'alternative', NULL, NULL, NULL, NULL, NULL, 10, 1, 2, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2539, 11, 'alternative', NULL, NULL, NULL, NULL, NULL, 10, 1, 3, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2540, 11, 'alternative', NULL, NULL, NULL, NULL, NULL, 10, 2, 3, 7, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2541, 11, 'alternative', NULL, NULL, NULL, NULL, NULL, 11, 1, 2, 5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2542, 11, 'alternative', NULL, NULL, NULL, NULL, NULL, 11, 1, 3, 7, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2543, 11, 'alternative', NULL, NULL, NULL, NULL, NULL, 11, 2, 3, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2544, 11, 'alternative', NULL, NULL, NULL, NULL, NULL, 12, 1, 2, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2545, 11, 'alternative', NULL, NULL, NULL, NULL, NULL, 12, 1, 3, 0.5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2546, 11, 'alternative', NULL, NULL, NULL, NULL, NULL, 12, 2, 3, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2547, 11, 'alternative', NULL, NULL, NULL, NULL, NULL, 13, 1, 2, 5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2548, 11, 'alternative', NULL, NULL, NULL, NULL, NULL, 13, 1, 3, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2549, 11, 'alternative', NULL, NULL, NULL, NULL, NULL, 13, 2, 3, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2550, 11, 'alternative', NULL, NULL, NULL, NULL, NULL, 14, 1, 2, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2551, 11, 'alternative', NULL, NULL, NULL, NULL, NULL, 14, 1, 3, 0.5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2552, 11, 'alternative', NULL, NULL, NULL, NULL, NULL, 14, 2, 3, 0.25, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2553, 12, 'criteria', 4, 5, NULL, NULL, NULL, NULL, NULL, NULL, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2554, 12, 'criteria', 4, 6, NULL, NULL, NULL, NULL, NULL, NULL, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2555, 12, 'criteria', 5, 6, NULL, NULL, NULL, NULL, NULL, NULL, 0.2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2556, 12, 'sub_criteria', NULL, NULL, 4, 8, 9, NULL, NULL, NULL, 0.2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2557, 12, 'sub_criteria', NULL, NULL, 4, 8, 10, NULL, NULL, NULL, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2558, 12, 'sub_criteria', NULL, NULL, 4, 9, 10, NULL, NULL, NULL, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2559, 12, 'sub_criteria', NULL, NULL, 5, 11, 12, NULL, NULL, NULL, 4, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2560, 12, 'sub_criteria', NULL, NULL, 6, 13, 14, NULL, NULL, NULL, 4, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2561, 12, 'alternative', NULL, NULL, NULL, NULL, NULL, 8, 1, 2, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2562, 12, 'alternative', NULL, NULL, NULL, NULL, NULL, 8, 1, 3, 0.5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2563, 12, 'alternative', NULL, NULL, NULL, NULL, NULL, 8, 2, 3, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2564, 12, 'alternative', NULL, NULL, NULL, NULL, NULL, 9, 1, 2, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2565, 12, 'alternative', NULL, NULL, NULL, NULL, NULL, 9, 1, 3, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2566, 12, 'alternative', NULL, NULL, NULL, NULL, NULL, 9, 2, 3, 5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2567, 12, 'alternative', NULL, NULL, NULL, NULL, NULL, 10, 1, 2, 0.25, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2568, 12, 'alternative', NULL, NULL, NULL, NULL, NULL, 10, 1, 3, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2569, 12, 'alternative', NULL, NULL, NULL, NULL, NULL, 10, 2, 3, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2570, 12, 'alternative', NULL, NULL, NULL, NULL, NULL, 11, 1, 2, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2571, 12, 'alternative', NULL, NULL, NULL, NULL, NULL, 11, 1, 3, 4, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2572, 12, 'alternative', NULL, NULL, NULL, NULL, NULL, 11, 2, 3, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2573, 12, 'alternative', NULL, NULL, NULL, NULL, NULL, 12, 1, 2, 0.25, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2574, 12, 'alternative', NULL, NULL, NULL, NULL, NULL, 12, 1, 3, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2575, 12, 'alternative', NULL, NULL, NULL, NULL, NULL, 12, 2, 3, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2576, 12, 'alternative', NULL, NULL, NULL, NULL, NULL, 13, 1, 2, 4, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2577, 12, 'alternative', NULL, NULL, NULL, NULL, NULL, 13, 1, 3, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2578, 12, 'alternative', NULL, NULL, NULL, NULL, NULL, 13, 2, 3, 0.142857, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2579, 12, 'alternative', NULL, NULL, NULL, NULL, NULL, 14, 1, 2, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2580, 12, 'alternative', NULL, NULL, NULL, NULL, NULL, 14, 1, 3, 0.25, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2581, 12, 'alternative', NULL, NULL, NULL, NULL, NULL, 14, 2, 3, 0.2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2582, 13, 'criteria', 4, 5, NULL, NULL, NULL, NULL, NULL, NULL, 4, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2583, 13, 'criteria', 4, 6, NULL, NULL, NULL, NULL, NULL, NULL, 0.2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2584, 13, 'criteria', 5, 6, NULL, NULL, NULL, NULL, NULL, NULL, 0.125, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2585, 13, 'sub_criteria', NULL, NULL, 4, 8, 9, NULL, NULL, NULL, 0.25, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2586, 13, 'sub_criteria', NULL, NULL, 4, 8, 10, NULL, NULL, NULL, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2587, 13, 'sub_criteria', NULL, NULL, 4, 9, 10, NULL, NULL, NULL, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2588, 13, 'sub_criteria', NULL, NULL, 5, 11, 12, NULL, NULL, NULL, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2589, 13, 'sub_criteria', NULL, NULL, 6, 13, 14, NULL, NULL, NULL, 6, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2590, 13, 'alternative', NULL, NULL, NULL, NULL, NULL, 8, 1, 2, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2591, 13, 'alternative', NULL, NULL, NULL, NULL, NULL, 8, 1, 3, 0.25, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2592, 13, 'alternative', NULL, NULL, NULL, NULL, NULL, 8, 2, 3, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2593, 13, 'alternative', NULL, NULL, NULL, NULL, NULL, 9, 1, 2, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2594, 13, 'alternative', NULL, NULL, NULL, NULL, NULL, 9, 1, 3, 0.5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2595, 13, 'alternative', NULL, NULL, NULL, NULL, NULL, 9, 2, 3, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2596, 13, 'alternative', NULL, NULL, NULL, NULL, NULL, 10, 1, 2, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2597, 13, 'alternative', NULL, NULL, NULL, NULL, NULL, 10, 1, 3, 0.25, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2598, 13, 'alternative', NULL, NULL, NULL, NULL, NULL, 10, 2, 3, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2599, 13, 'alternative', NULL, NULL, NULL, NULL, NULL, 11, 1, 2, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2600, 13, 'alternative', NULL, NULL, NULL, NULL, NULL, 11, 1, 3, 6, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2601, 13, 'alternative', NULL, NULL, NULL, NULL, NULL, 11, 2, 3, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2602, 13, 'alternative', NULL, NULL, NULL, NULL, NULL, 12, 1, 2, 0.2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2603, 13, 'alternative', NULL, NULL, NULL, NULL, NULL, 12, 1, 3, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2604, 13, 'alternative', NULL, NULL, NULL, NULL, NULL, 12, 2, 3, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2605, 13, 'alternative', NULL, NULL, NULL, NULL, NULL, 13, 1, 2, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2606, 13, 'alternative', NULL, NULL, NULL, NULL, NULL, 13, 1, 3, 0.2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2607, 13, 'alternative', NULL, NULL, NULL, NULL, NULL, 13, 2, 3, 0.142857, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2608, 13, 'alternative', NULL, NULL, NULL, NULL, NULL, 14, 1, 2, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2609, 13, 'alternative', NULL, NULL, NULL, NULL, NULL, 14, 1, 3, 0.2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2610, 13, 'alternative', NULL, NULL, NULL, NULL, NULL, 14, 2, 3, 0.166667, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2611, 14, 'criteria', 4, 5, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2612, 14, 'criteria', 4, 6, NULL, NULL, NULL, NULL, NULL, NULL, 0.166667, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2613, 14, 'criteria', 5, 6, NULL, NULL, NULL, NULL, NULL, NULL, 0.125, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2614, 14, 'sub_criteria', NULL, NULL, 4, 8, 9, NULL, NULL, NULL, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2615, 14, 'sub_criteria', NULL, NULL, 4, 8, 10, NULL, NULL, NULL, 0.5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2616, 14, 'sub_criteria', NULL, NULL, 4, 9, 10, NULL, NULL, NULL, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2617, 14, 'sub_criteria', NULL, NULL, 5, 11, 12, NULL, NULL, NULL, 4, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2618, 14, 'sub_criteria', NULL, NULL, 6, 13, 14, NULL, NULL, NULL, 7, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2619, 14, 'alternative', NULL, NULL, NULL, NULL, NULL, 8, 1, 2, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2620, 14, 'alternative', NULL, NULL, NULL, NULL, NULL, 8, 1, 3, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2621, 14, 'alternative', NULL, NULL, NULL, NULL, NULL, 8, 2, 3, 5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2622, 14, 'alternative', NULL, NULL, NULL, NULL, NULL, 9, 1, 2, 0.5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2623, 14, 'alternative', NULL, NULL, NULL, NULL, NULL, 9, 1, 3, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2624, 14, 'alternative', NULL, NULL, NULL, NULL, NULL, 9, 2, 3, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2625, 14, 'alternative', NULL, NULL, NULL, NULL, NULL, 10, 1, 2, 0.25, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2626, 14, 'alternative', NULL, NULL, NULL, NULL, NULL, 10, 1, 3, 0.5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2627, 14, 'alternative', NULL, NULL, NULL, NULL, NULL, 10, 2, 3, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2628, 14, 'alternative', NULL, NULL, NULL, NULL, NULL, 11, 1, 2, 4, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2629, 14, 'alternative', NULL, NULL, NULL, NULL, NULL, 11, 1, 3, 5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2630, 14, 'alternative', NULL, NULL, NULL, NULL, NULL, 11, 2, 3, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2631, 14, 'alternative', NULL, NULL, NULL, NULL, NULL, 12, 1, 2, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2632, 14, 'alternative', NULL, NULL, NULL, NULL, NULL, 12, 1, 3, 0.5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2633, 14, 'alternative', NULL, NULL, NULL, NULL, NULL, 12, 2, 3, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2634, 14, 'alternative', NULL, NULL, NULL, NULL, NULL, 13, 1, 2, 6, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2635, 14, 'alternative', NULL, NULL, NULL, NULL, NULL, 13, 1, 3, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2636, 14, 'alternative', NULL, NULL, NULL, NULL, NULL, 13, 2, 3, 0.125, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2637, 14, 'alternative', NULL, NULL, NULL, NULL, NULL, 14, 1, 2, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2638, 14, 'alternative', NULL, NULL, NULL, NULL, NULL, 14, 1, 3, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2639, 14, 'alternative', NULL, NULL, NULL, NULL, NULL, 14, 2, 3, 0.2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2640, 15, 'criteria', 4, 5, NULL, NULL, NULL, NULL, NULL, NULL, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2641, 15, 'criteria', 4, 6, NULL, NULL, NULL, NULL, NULL, NULL, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2642, 15, 'criteria', 5, 6, NULL, NULL, NULL, NULL, NULL, NULL, 0.2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2643, 15, 'sub_criteria', NULL, NULL, 4, 8, 9, NULL, NULL, NULL, 0.25, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2644, 15, 'sub_criteria', NULL, NULL, 4, 8, 10, NULL, NULL, NULL, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2645, 15, 'sub_criteria', NULL, NULL, 4, 9, 10, NULL, NULL, NULL, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2646, 15, 'sub_criteria', NULL, NULL, 5, 11, 12, NULL, NULL, NULL, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2647, 15, 'sub_criteria', NULL, NULL, 6, 13, 14, NULL, NULL, NULL, 5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2648, 15, 'alternative', NULL, NULL, NULL, NULL, NULL, 8, 1, 2, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2649, 15, 'alternative', NULL, NULL, NULL, NULL, NULL, 8, 1, 3, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2650, 15, 'alternative', NULL, NULL, NULL, NULL, NULL, 8, 2, 3, 5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2651, 15, 'alternative', NULL, NULL, NULL, NULL, NULL, 9, 1, 2, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2652, 15, 'alternative', NULL, NULL, NULL, NULL, NULL, 9, 1, 3, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2653, 15, 'alternative', NULL, NULL, NULL, NULL, NULL, 9, 2, 3, 6, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2654, 15, 'alternative', NULL, NULL, NULL, NULL, NULL, 10, 1, 2, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2655, 15, 'alternative', NULL, NULL, NULL, NULL, NULL, 10, 1, 3, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2656, 15, 'alternative', NULL, NULL, NULL, NULL, NULL, 10, 2, 3, 5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2657, 15, 'alternative', NULL, NULL, NULL, NULL, NULL, 11, 1, 2, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2658, 15, 'alternative', NULL, NULL, NULL, NULL, NULL, 11, 1, 3, 5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2659, 15, 'alternative', NULL, NULL, NULL, NULL, NULL, 11, 2, 3, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2660, 15, 'alternative', NULL, NULL, NULL, NULL, NULL, 12, 1, 2, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2661, 15, 'alternative', NULL, NULL, NULL, NULL, NULL, 12, 1, 3, 0.5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2662, 15, 'alternative', NULL, NULL, NULL, NULL, NULL, 12, 2, 3, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2663, 15, 'alternative', NULL, NULL, NULL, NULL, NULL, 13, 1, 2, 4, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2664, 15, 'alternative', NULL, NULL, NULL, NULL, NULL, 13, 1, 3, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2665, 15, 'alternative', NULL, NULL, NULL, NULL, NULL, 13, 2, 3, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2666, 15, 'alternative', NULL, NULL, NULL, NULL, NULL, 14, 1, 2, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2667, 15, 'alternative', NULL, NULL, NULL, NULL, NULL, 14, 1, 3, 0.5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2668, 15, 'alternative', NULL, NULL, NULL, NULL, NULL, 14, 2, 3, 0.25, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2669, 16, 'criteria', 4, 5, NULL, NULL, NULL, NULL, NULL, NULL, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2670, 16, 'criteria', 4, 6, NULL, NULL, NULL, NULL, NULL, NULL, 0.25, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2671, 16, 'criteria', 5, 6, NULL, NULL, NULL, NULL, NULL, NULL, 0.2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2672, 16, 'sub_criteria', NULL, NULL, 4, 8, 9, NULL, NULL, NULL, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2673, 16, 'sub_criteria', NULL, NULL, 4, 8, 10, NULL, NULL, NULL, 0.5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2674, 16, 'sub_criteria', NULL, NULL, 4, 9, 10, NULL, NULL, NULL, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2675, 16, 'sub_criteria', NULL, NULL, 5, 11, 12, NULL, NULL, NULL, 5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2676, 16, 'sub_criteria', NULL, NULL, 6, 13, 14, NULL, NULL, NULL, 6, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2677, 16, 'alternative', NULL, NULL, NULL, NULL, NULL, 8, 1, 2, 0.5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2678, 16, 'alternative', NULL, NULL, NULL, NULL, NULL, 8, 1, 3, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2679, 16, 'alternative', NULL, NULL, NULL, NULL, NULL, 8, 2, 3, 5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2680, 16, 'alternative', NULL, NULL, NULL, NULL, NULL, 9, 1, 2, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2681, 16, 'alternative', NULL, NULL, NULL, NULL, NULL, 9, 1, 3, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2682, 16, 'alternative', NULL, NULL, NULL, NULL, NULL, 9, 2, 3, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2683, 16, 'alternative', NULL, NULL, NULL, NULL, NULL, 10, 1, 2, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2684, 16, 'alternative', NULL, NULL, NULL, NULL, NULL, 10, 1, 3, 0.5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2685, 16, 'alternative', NULL, NULL, NULL, NULL, NULL, 10, 2, 3, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2686, 16, 'alternative', NULL, NULL, NULL, NULL, NULL, 11, 1, 2, 4, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2687, 16, 'alternative', NULL, NULL, NULL, NULL, NULL, 11, 1, 3, 6, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2688, 16, 'alternative', NULL, NULL, NULL, NULL, NULL, 11, 2, 3, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2689, 16, 'alternative', NULL, NULL, NULL, NULL, NULL, 12, 1, 2, 0.2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2690, 16, 'alternative', NULL, NULL, NULL, NULL, NULL, 12, 1, 3, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2691, 16, 'alternative', NULL, NULL, NULL, NULL, NULL, 12, 2, 3, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2692, 16, 'alternative', NULL, NULL, NULL, NULL, NULL, 13, 1, 2, 5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2693, 16, 'alternative', NULL, NULL, NULL, NULL, NULL, 13, 1, 3, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2694, 16, 'alternative', NULL, NULL, NULL, NULL, NULL, 13, 2, 3, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2695, 16, 'alternative', NULL, NULL, NULL, NULL, NULL, 14, 1, 2, 4, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2696, 16, 'alternative', NULL, NULL, NULL, NULL, NULL, 14, 1, 3, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2697, 16, 'alternative', NULL, NULL, NULL, NULL, NULL, 14, 2, 3, 0.166667, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2698, 17, 'criteria', 4, 5, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2699, 17, 'criteria', 4, 6, NULL, NULL, NULL, NULL, NULL, NULL, 0.166667, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2700, 17, 'criteria', 5, 6, NULL, NULL, NULL, NULL, NULL, NULL, 0.125, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2701, 17, 'sub_criteria', NULL, NULL, 4, 8, 9, NULL, NULL, NULL, 0.2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2702, 17, 'sub_criteria', NULL, NULL, 4, 8, 10, NULL, NULL, NULL, 0.25, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2703, 17, 'sub_criteria', NULL, NULL, 4, 9, 10, NULL, NULL, NULL, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2704, 17, 'sub_criteria', NULL, NULL, 5, 11, 12, NULL, NULL, NULL, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2705, 17, 'sub_criteria', NULL, NULL, 6, 13, 14, NULL, NULL, NULL, 7, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2706, 17, 'alternative', NULL, NULL, NULL, NULL, NULL, 8, 1, 2, 0.25, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2707, 17, 'alternative', NULL, NULL, NULL, NULL, NULL, 8, 1, 3, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2708, 17, 'alternative', NULL, NULL, NULL, NULL, NULL, 8, 2, 3, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2709, 17, 'alternative', NULL, NULL, NULL, NULL, NULL, 9, 1, 2, 0.25, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2710, 17, 'alternative', NULL, NULL, NULL, NULL, NULL, 9, 1, 3, 0.5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2711, 17, 'alternative', NULL, NULL, NULL, NULL, NULL, 9, 2, 3, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2712, 17, 'alternative', NULL, NULL, NULL, NULL, NULL, 10, 1, 2, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2713, 17, 'alternative', NULL, NULL, NULL, NULL, NULL, 10, 1, 3, 0.2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2714, 17, 'alternative', NULL, NULL, NULL, NULL, NULL, 10, 2, 3, 0.5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2715, 17, 'alternative', NULL, NULL, NULL, NULL, NULL, 11, 1, 2, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2716, 17, 'alternative', NULL, NULL, NULL, NULL, NULL, 11, 1, 3, 7, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2717, 17, 'alternative', NULL, NULL, NULL, NULL, NULL, 11, 2, 3, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2718, 17, 'alternative', NULL, NULL, NULL, NULL, NULL, 12, 1, 2, 0.25, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2719, 17, 'alternative', NULL, NULL, NULL, NULL, NULL, 12, 1, 3, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2720, 17, 'alternative', NULL, NULL, NULL, NULL, NULL, 12, 2, 3, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2721, 17, 'alternative', NULL, NULL, NULL, NULL, NULL, 13, 1, 2, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2722, 17, 'alternative', NULL, NULL, NULL, NULL, NULL, 13, 1, 3, 0.2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2723, 17, 'alternative', NULL, NULL, NULL, NULL, NULL, 13, 2, 3, 0.166667, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2724, 17, 'alternative', NULL, NULL, NULL, NULL, NULL, 14, 1, 2, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2725, 17, 'alternative', NULL, NULL, NULL, NULL, NULL, 14, 1, 3, 0.166667, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2726, 17, 'alternative', NULL, NULL, NULL, NULL, NULL, 14, 2, 3, 0.142857, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2727, 18, 'criteria', 4, 5, NULL, NULL, NULL, NULL, NULL, NULL, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2728, 18, 'criteria', 4, 6, NULL, NULL, NULL, NULL, NULL, NULL, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2729, 18, 'criteria', 5, 6, NULL, NULL, NULL, NULL, NULL, NULL, 0.2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2730, 18, 'sub_criteria', NULL, NULL, 4, 8, 9, NULL, NULL, NULL, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2731, 18, 'sub_criteria', NULL, NULL, 4, 8, 10, NULL, NULL, NULL, 0.5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2732, 18, 'sub_criteria', NULL, NULL, 4, 9, 10, NULL, NULL, NULL, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2733, 18, 'sub_criteria', NULL, NULL, 5, 11, 12, NULL, NULL, NULL, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2734, 18, 'sub_criteria', NULL, NULL, 6, 13, 14, NULL, NULL, NULL, 4, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2735, 18, 'alternative', NULL, NULL, NULL, NULL, NULL, 8, 1, 2, 0.5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2736, 18, 'alternative', NULL, NULL, NULL, NULL, NULL, 8, 1, 3, 4, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2737, 18, 'alternative', NULL, NULL, NULL, NULL, NULL, 8, 2, 3, 6, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2738, 18, 'alternative', NULL, NULL, NULL, NULL, NULL, 9, 1, 2, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2739, 18, 'alternative', NULL, NULL, NULL, NULL, NULL, 9, 1, 3, 5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2740, 18, 'alternative', NULL, NULL, NULL, NULL, NULL, 9, 2, 3, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2741, 18, 'alternative', NULL, NULL, NULL, NULL, NULL, 10, 1, 2, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2742, 18, 'alternative', NULL, NULL, NULL, NULL, NULL, 10, 1, 3, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2743, 18, 'alternative', NULL, NULL, NULL, NULL, NULL, 10, 2, 3, 5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2744, 18, 'alternative', NULL, NULL, NULL, NULL, NULL, 11, 1, 2, 4, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2745, 18, 'alternative', NULL, NULL, NULL, NULL, NULL, 11, 1, 3, 6, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2746, 18, 'alternative', NULL, NULL, NULL, NULL, NULL, 11, 2, 3, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2747, 18, 'alternative', NULL, NULL, NULL, NULL, NULL, 12, 1, 2, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2748, 18, 'alternative', NULL, NULL, NULL, NULL, NULL, 12, 1, 3, 0.5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2749, 18, 'alternative', NULL, NULL, NULL, NULL, NULL, 12, 2, 3, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2750, 18, 'alternative', NULL, NULL, NULL, NULL, NULL, 13, 1, 2, 4, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2751, 18, 'alternative', NULL, NULL, NULL, NULL, NULL, 13, 1, 3, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2752, 18, 'alternative', NULL, NULL, NULL, NULL, NULL, 13, 2, 3, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2753, 18, 'alternative', NULL, NULL, NULL, NULL, NULL, 14, 1, 2, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2754, 18, 'alternative', NULL, NULL, NULL, NULL, NULL, 14, 1, 3, 0.5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2755, 18, 'alternative', NULL, NULL, NULL, NULL, NULL, 14, 2, 3, 0.25, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2756, 19, 'criteria', 4, 5, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2757, 19, 'criteria', 4, 6, NULL, NULL, NULL, NULL, NULL, NULL, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2758, 19, 'criteria', 5, 6, NULL, NULL, NULL, NULL, NULL, NULL, 0.2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2759, 19, 'sub_criteria', NULL, NULL, 4, 8, 9, NULL, NULL, NULL, 0.2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2760, 19, 'sub_criteria', NULL, NULL, 4, 8, 10, NULL, NULL, NULL, 0.5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2761, 19, 'sub_criteria', NULL, NULL, 4, 9, 10, NULL, NULL, NULL, 4, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2762, 19, 'sub_criteria', NULL, NULL, 5, 11, 12, NULL, NULL, NULL, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2763, 19, 'sub_criteria', NULL, NULL, 6, 13, 14, NULL, NULL, NULL, 5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2764, 19, 'alternative', NULL, NULL, NULL, NULL, NULL, 8, 1, 2, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2765, 19, 'alternative', NULL, NULL, NULL, NULL, NULL, 8, 1, 3, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2766, 19, 'alternative', NULL, NULL, NULL, NULL, NULL, 8, 2, 3, 5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2767, 19, 'alternative', NULL, NULL, NULL, NULL, NULL, 9, 1, 2, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2768, 19, 'alternative', NULL, NULL, NULL, NULL, NULL, 9, 1, 3, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2769, 19, 'alternative', NULL, NULL, NULL, NULL, NULL, 9, 2, 3, 5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2770, 19, 'alternative', NULL, NULL, NULL, NULL, NULL, 10, 1, 2, 0.25, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2771, 19, 'alternative', NULL, NULL, NULL, NULL, NULL, 10, 1, 3, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2772, 19, 'alternative', NULL, NULL, NULL, NULL, NULL, 10, 2, 3, 6, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2773, 19, 'alternative', NULL, NULL, NULL, NULL, NULL, 11, 1, 2, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2774, 19, 'alternative', NULL, NULL, NULL, NULL, NULL, 11, 1, 3, 4, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2775, 19, 'alternative', NULL, NULL, NULL, NULL, NULL, 11, 2, 3, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2776, 19, 'alternative', NULL, NULL, NULL, NULL, NULL, 12, 1, 2, 0.25, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2777, 19, 'alternative', NULL, NULL, NULL, NULL, NULL, 12, 1, 3, 0.5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2778, 19, 'alternative', NULL, NULL, NULL, NULL, NULL, 12, 2, 3, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2779, 19, 'alternative', NULL, NULL, NULL, NULL, NULL, 13, 1, 2, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2780, 19, 'alternative', NULL, NULL, NULL, NULL, NULL, 13, 1, 3, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2781, 19, 'alternative', NULL, NULL, NULL, NULL, NULL, 13, 2, 3, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2782, 19, 'alternative', NULL, NULL, NULL, NULL, NULL, 14, 1, 2, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2783, 19, 'alternative', NULL, NULL, NULL, NULL, NULL, 14, 1, 3, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2784, 19, 'alternative', NULL, NULL, NULL, NULL, NULL, 14, 2, 3, 0.25, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2785, 20, 'criteria', 4, 5, NULL, NULL, NULL, NULL, NULL, NULL, 4, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2786, 20, 'criteria', 4, 6, NULL, NULL, NULL, NULL, NULL, NULL, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2787, 20, 'criteria', 5, 6, NULL, NULL, NULL, NULL, NULL, NULL, 0.166667, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2788, 20, 'sub_criteria', NULL, NULL, 4, 8, 9, NULL, NULL, NULL, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2789, 20, 'sub_criteria', NULL, NULL, 4, 8, 10, NULL, NULL, NULL, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2790, 20, 'sub_criteria', NULL, NULL, 4, 9, 10, NULL, NULL, NULL, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2791, 20, 'sub_criteria', NULL, NULL, 5, 11, 12, NULL, NULL, NULL, 4, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2792, 20, 'sub_criteria', NULL, NULL, 6, 13, 14, NULL, NULL, NULL, 4, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2793, 20, 'alternative', NULL, NULL, NULL, NULL, NULL, 8, 1, 2, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2794, 20, 'alternative', NULL, NULL, NULL, NULL, NULL, 8, 1, 3, 5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2795, 20, 'alternative', NULL, NULL, NULL, NULL, NULL, 8, 2, 3, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2796, 20, 'alternative', NULL, NULL, NULL, NULL, NULL, 9, 1, 2, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2797, 20, 'alternative', NULL, NULL, NULL, NULL, NULL, 9, 1, 3, 6, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2798, 20, 'alternative', NULL, NULL, NULL, NULL, NULL, 9, 2, 3, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2799, 20, 'alternative', NULL, NULL, NULL, NULL, NULL, 10, 1, 2, 0.5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2800, 20, 'alternative', NULL, NULL, NULL, NULL, NULL, 10, 1, 3, 4, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2801, 20, 'alternative', NULL, NULL, NULL, NULL, NULL, 10, 2, 3, 6, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2802, 20, 'alternative', NULL, NULL, NULL, NULL, NULL, 11, 1, 2, 5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2803, 20, 'alternative', NULL, NULL, NULL, NULL, NULL, 11, 1, 3, 8, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2804, 20, 'alternative', NULL, NULL, NULL, NULL, NULL, 11, 2, 3, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2805, 20, 'alternative', NULL, NULL, NULL, NULL, NULL, 12, 1, 2, 0.5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2806, 20, 'alternative', NULL, NULL, NULL, NULL, NULL, 12, 1, 3, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2807, 20, 'alternative', NULL, NULL, NULL, NULL, NULL, 12, 2, 3, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2808, 20, 'alternative', NULL, NULL, NULL, NULL, NULL, 13, 1, 2, 7, '2026-07-23 07:58:14', '2026-07-23 07:58:14');
INSERT INTO `comparisons` (`id_comparisons`, `id_users`, `category`, `criteria_id_1`, `criteria_id_2`, `parent_criteria_id`, `sub_criteria_id_1`, `sub_criteria_id_2`, `parent_sub_criteria_id`, `alternative_id_1`, `alternative_id_2`, `value`, `createdAt`, `updatedAt`) VALUES
(2809, 20, 'alternative', NULL, NULL, NULL, NULL, NULL, 13, 1, 3, 5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2810, 20, 'alternative', NULL, NULL, NULL, NULL, NULL, 13, 2, 3, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2811, 20, 'alternative', NULL, NULL, NULL, NULL, NULL, 14, 1, 2, 4, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2812, 20, 'alternative', NULL, NULL, NULL, NULL, NULL, 14, 1, 3, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2813, 20, 'alternative', NULL, NULL, NULL, NULL, NULL, 14, 2, 3, 0.5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2814, 21, 'criteria', 4, 5, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2815, 21, 'criteria', 4, 6, NULL, NULL, NULL, NULL, NULL, NULL, 0.25, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2816, 21, 'criteria', 5, 6, NULL, NULL, NULL, NULL, NULL, NULL, 0.2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2817, 21, 'sub_criteria', NULL, NULL, 4, 8, 9, NULL, NULL, NULL, 0.2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2818, 21, 'sub_criteria', NULL, NULL, 4, 8, 10, NULL, NULL, NULL, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2819, 21, 'sub_criteria', NULL, NULL, 4, 9, 10, NULL, NULL, NULL, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2820, 21, 'sub_criteria', NULL, NULL, 5, 11, 12, NULL, NULL, NULL, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2821, 21, 'sub_criteria', NULL, NULL, 6, 13, 14, NULL, NULL, NULL, 6, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2822, 21, 'alternative', NULL, NULL, NULL, NULL, NULL, 8, 1, 2, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2823, 21, 'alternative', NULL, NULL, NULL, NULL, NULL, 8, 1, 3, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2824, 21, 'alternative', NULL, NULL, NULL, NULL, NULL, 8, 2, 3, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2825, 21, 'alternative', NULL, NULL, NULL, NULL, NULL, 9, 1, 2, 0.5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2826, 21, 'alternative', NULL, NULL, NULL, NULL, NULL, 9, 1, 3, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2827, 21, 'alternative', NULL, NULL, NULL, NULL, NULL, 9, 2, 3, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2828, 21, 'alternative', NULL, NULL, NULL, NULL, NULL, 10, 1, 2, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2829, 21, 'alternative', NULL, NULL, NULL, NULL, NULL, 10, 1, 3, 0.5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2830, 21, 'alternative', NULL, NULL, NULL, NULL, NULL, 10, 2, 3, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2831, 21, 'alternative', NULL, NULL, NULL, NULL, NULL, 11, 1, 2, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2832, 21, 'alternative', NULL, NULL, NULL, NULL, NULL, 11, 1, 3, 5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2833, 21, 'alternative', NULL, NULL, NULL, NULL, NULL, 11, 2, 3, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2834, 21, 'alternative', NULL, NULL, NULL, NULL, NULL, 12, 1, 2, 0.25, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2835, 21, 'alternative', NULL, NULL, NULL, NULL, NULL, 12, 1, 3, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2836, 21, 'alternative', NULL, NULL, NULL, NULL, NULL, 12, 2, 3, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2837, 21, 'alternative', NULL, NULL, NULL, NULL, NULL, 13, 1, 2, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2838, 21, 'alternative', NULL, NULL, NULL, NULL, NULL, 13, 1, 3, 0.25, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2839, 21, 'alternative', NULL, NULL, NULL, NULL, NULL, 13, 2, 3, 0.2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2840, 21, 'alternative', NULL, NULL, NULL, NULL, NULL, 14, 1, 2, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2841, 21, 'alternative', NULL, NULL, NULL, NULL, NULL, 14, 1, 3, 0.2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2842, 21, 'alternative', NULL, NULL, NULL, NULL, NULL, 14, 2, 3, 0.166667, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2843, 22, 'criteria', 4, 5, NULL, NULL, NULL, NULL, NULL, NULL, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2844, 22, 'criteria', 4, 6, NULL, NULL, NULL, NULL, NULL, NULL, 0.25, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2845, 22, 'criteria', 5, 6, NULL, NULL, NULL, NULL, NULL, NULL, 0.2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2846, 22, 'sub_criteria', NULL, NULL, 4, 8, 9, NULL, NULL, NULL, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2847, 22, 'sub_criteria', NULL, NULL, 4, 8, 10, NULL, NULL, NULL, 0.5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2848, 22, 'sub_criteria', NULL, NULL, 4, 9, 10, NULL, NULL, NULL, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2849, 22, 'sub_criteria', NULL, NULL, 5, 11, 12, NULL, NULL, NULL, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2850, 22, 'sub_criteria', NULL, NULL, 6, 13, 14, NULL, NULL, NULL, 5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2851, 22, 'alternative', NULL, NULL, NULL, NULL, NULL, 8, 1, 2, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2852, 22, 'alternative', NULL, NULL, NULL, NULL, NULL, 8, 1, 3, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2853, 22, 'alternative', NULL, NULL, NULL, NULL, NULL, 8, 2, 3, 7, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2854, 22, 'alternative', NULL, NULL, NULL, NULL, NULL, 9, 1, 2, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2855, 22, 'alternative', NULL, NULL, NULL, NULL, NULL, 9, 1, 3, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2856, 22, 'alternative', NULL, NULL, NULL, NULL, NULL, 9, 2, 3, 5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2857, 22, 'alternative', NULL, NULL, NULL, NULL, NULL, 10, 1, 2, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2858, 22, 'alternative', NULL, NULL, NULL, NULL, NULL, 10, 1, 3, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2859, 22, 'alternative', NULL, NULL, NULL, NULL, NULL, 10, 2, 3, 5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2860, 22, 'alternative', NULL, NULL, NULL, NULL, NULL, 11, 1, 2, 4, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2861, 22, 'alternative', NULL, NULL, NULL, NULL, NULL, 11, 1, 3, 5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2862, 22, 'alternative', NULL, NULL, NULL, NULL, NULL, 11, 2, 3, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2863, 22, 'alternative', NULL, NULL, NULL, NULL, NULL, 12, 1, 2, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2864, 22, 'alternative', NULL, NULL, NULL, NULL, NULL, 12, 1, 3, 0.5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2865, 22, 'alternative', NULL, NULL, NULL, NULL, NULL, 12, 2, 3, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2866, 22, 'alternative', NULL, NULL, NULL, NULL, NULL, 13, 1, 2, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2867, 22, 'alternative', NULL, NULL, NULL, NULL, NULL, 13, 1, 3, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2868, 22, 'alternative', NULL, NULL, NULL, NULL, NULL, 13, 2, 3, 0.5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2869, 22, 'alternative', NULL, NULL, NULL, NULL, NULL, 14, 1, 2, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2870, 22, 'alternative', NULL, NULL, NULL, NULL, NULL, 14, 1, 3, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2871, 22, 'alternative', NULL, NULL, NULL, NULL, NULL, 14, 2, 3, 0.2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2872, 23, 'criteria', 4, 5, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2873, 23, 'criteria', 4, 6, NULL, NULL, NULL, NULL, NULL, NULL, 0.2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2874, 23, 'criteria', 5, 6, NULL, NULL, NULL, NULL, NULL, NULL, 0.142857, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2875, 23, 'sub_criteria', NULL, NULL, 4, 8, 9, NULL, NULL, NULL, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2876, 23, 'sub_criteria', NULL, NULL, 4, 8, 10, NULL, NULL, NULL, 0.5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2877, 23, 'sub_criteria', NULL, NULL, 4, 9, 10, NULL, NULL, NULL, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2878, 23, 'sub_criteria', NULL, NULL, 5, 11, 12, NULL, NULL, NULL, 4, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2879, 23, 'sub_criteria', NULL, NULL, 6, 13, 14, NULL, NULL, NULL, 7, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2880, 23, 'alternative', NULL, NULL, NULL, NULL, NULL, 8, 1, 2, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2881, 23, 'alternative', NULL, NULL, NULL, NULL, NULL, 8, 1, 3, 0.5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2882, 23, 'alternative', NULL, NULL, NULL, NULL, NULL, 8, 2, 3, 2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2883, 23, 'alternative', NULL, NULL, NULL, NULL, NULL, 9, 1, 2, 0.5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2884, 23, 'alternative', NULL, NULL, NULL, NULL, NULL, 9, 1, 3, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2885, 23, 'alternative', NULL, NULL, NULL, NULL, NULL, 9, 2, 3, 5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2886, 23, 'alternative', NULL, NULL, NULL, NULL, NULL, 10, 1, 2, 0.25, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2887, 23, 'alternative', NULL, NULL, NULL, NULL, NULL, 10, 1, 3, 0.5, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2888, 23, 'alternative', NULL, NULL, NULL, NULL, NULL, 10, 2, 3, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2889, 23, 'alternative', NULL, NULL, NULL, NULL, NULL, 11, 1, 2, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2890, 23, 'alternative', NULL, NULL, NULL, NULL, NULL, 11, 1, 3, 6, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2891, 23, 'alternative', NULL, NULL, NULL, NULL, NULL, 11, 2, 3, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2892, 23, 'alternative', NULL, NULL, NULL, NULL, NULL, 12, 1, 2, 0.2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2893, 23, 'alternative', NULL, NULL, NULL, NULL, NULL, 12, 1, 3, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2894, 23, 'alternative', NULL, NULL, NULL, NULL, NULL, 12, 2, 3, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2895, 23, 'alternative', NULL, NULL, NULL, NULL, NULL, 13, 1, 2, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2896, 23, 'alternative', NULL, NULL, NULL, NULL, NULL, 13, 1, 3, 0.333333, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2897, 23, 'alternative', NULL, NULL, NULL, NULL, NULL, 13, 2, 3, 0.2, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2898, 23, 'alternative', NULL, NULL, NULL, NULL, NULL, 14, 1, 2, 3, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2899, 23, 'alternative', NULL, NULL, NULL, NULL, NULL, 14, 1, 3, 0.25, '2026-07-23 07:58:14', '2026-07-23 07:58:14'),
(2900, 23, 'alternative', NULL, NULL, NULL, NULL, NULL, 14, 2, 3, 0.2, '2026-07-23 07:58:14', '2026-07-23 07:58:14');

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
(4, 'C1', 'Aspek Kesiapan', 0.218093, '2026-03-06 08:49:22', '2026-07-24 07:03:45'),
(5, 'C2', 'Sosial & Kemudahan', 0.096276, '2026-03-06 08:49:36', '2026-07-24 07:03:45'),
(6, 'C3', 'Potensi Manfaat', 0.685632, '2026-03-06 08:49:48', '2026-07-24 07:03:45');

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
(61, 3, 0.416284, 1, '2026-07-24 07:03:45', '2026-07-24 07:03:45'),
(62, 1, 0.34738, 2, '2026-07-24 07:03:45', '2026-07-24 07:03:45'),
(63, 2, 0.236336, 3, '2026-07-24 07:03:45', '2026-07-24 07:03:45');

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
(8, 4, 'SC1.1', 'Sumber Daya Manusia', 0.127209, 0.027743, '2026-03-06 08:50:18', '2026-07-24 07:03:45'),
(9, 4, 'SC1.2', 'Kebutuhan Lahan', 0.590365, 0.128754, '2026-03-06 08:50:28', '2026-07-24 07:03:45'),
(10, 4, 'SC1.3', 'Investasi Awal', 0.282426, 0.061595, '2026-03-06 08:50:38', '2026-07-24 07:03:45'),
(11, 5, 'SC2.1', 'Partisipasi Warga', 0.743132, 0.071546, '2026-03-06 08:50:55', '2026-07-24 07:03:45'),
(12, 5, 'SC2.2', 'Kemudahan Pemilahan', 0.256868, 0.02473, '2026-03-06 08:51:08', '2026-07-24 07:03:45'),
(13, 6, 'SC3.1', 'Nilai Ekonomi', 0.84226, 0.57748, '2026-03-06 08:51:18', '2026-07-24 07:03:45'),
(14, 6, 'SC3.2', 'Efektifitas Reduksi Sampah', 0.15774, 0.108152, '2026-03-06 08:51:34', '2026-07-24 07:03:45');

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
(3, 'bapakrt2', '$2b$10$WZ9Q53RE./Nsh78XtbkJ2upcRcdAcJgjKN64cMBz8LInzkhTFzgHK', 'responden', '2026-03-06 12:25:39', '2026-03-06 12:25:39'),
(9, 'budi_santoso', '$2b$10$bAB7BkuKUXwVJ1pjgyAoZucjiN2gT5hJdJ1g6mKite9bWDL/L7TPO', 'responden', '2026-07-21 10:12:16', '2026-07-21 10:12:16'),
(10, 'siti_rahma', '$2b$10$bAB7BkuKUXwVJ1pjgyAoZucjiN2gT5hJdJ1g6mKite9bWDL/L7TPO', 'responden', '2026-07-21 10:12:16', '2026-07-21 10:12:16'),
(11, 'ahmad_hidayat', '$2b$10$bAB7BkuKUXwVJ1pjgyAoZucjiN2gT5hJdJ1g6mKite9bWDL/L7TPO', 'responden', '2026-07-21 10:12:16', '2026-07-21 10:12:16'),
(12, 'dewi_lestari', '$2b$10$bAB7BkuKUXwVJ1pjgyAoZucjiN2gT5hJdJ1g6mKite9bWDL/L7TPO', 'responden', '2026-07-21 10:12:16', '2026-07-21 10:12:16'),
(13, 'andri_kurniawan', '$2b$10$bAB7BkuKUXwVJ1pjgyAoZucjiN2gT5hJdJ1g6mKite9bWDL/L7TPO', 'responden', '2026-07-21 10:12:16', '2026-07-21 10:12:16'),
(14, 'rina_wijaya', '$2b$10$bAB7BkuKUXwVJ1pjgyAoZucjiN2gT5hJdJ1g6mKite9bWDL/L7TPO', 'responden', '2026-07-21 10:12:16', '2026-07-21 10:12:16'),
(15, 'hendra_setiawan', '$2b$10$bAB7BkuKUXwVJ1pjgyAoZucjiN2gT5hJdJ1g6mKite9bWDL/L7TPO', 'responden', '2026-07-21 10:12:16', '2026-07-21 10:12:16'),
(16, 'fajar_nugroho', '$2b$10$bAB7BkuKUXwVJ1pjgyAoZucjiN2gT5hJdJ1g6mKite9bWDL/L7TPO', 'responden', '2026-07-21 10:12:16', '2026-07-21 10:12:16'),
(17, 'dian_pratiwi', '$2b$10$bAB7BkuKUXwVJ1pjgyAoZucjiN2gT5hJdJ1g6mKite9bWDL/L7TPO', 'responden', '2026-07-21 10:12:16', '2026-07-21 10:12:16'),
(18, 'eko_prasetyo', '$2b$10$bAB7BkuKUXwVJ1pjgyAoZucjiN2gT5hJdJ1g6mKite9bWDL/L7TPO', 'responden', '2026-07-21 10:12:16', '2026-07-21 10:12:16'),
(19, 'tri_astuti', '$2b$10$bAB7BkuKUXwVJ1pjgyAoZucjiN2gT5hJdJ1g6mKite9bWDL/L7TPO', 'responden', '2026-07-21 10:12:16', '2026-07-21 10:12:16'),
(20, 'bambang_sutrisno', '$2b$10$bAB7BkuKUXwVJ1pjgyAoZucjiN2gT5hJdJ1g6mKite9bWDL/L7TPO', 'responden', '2026-07-21 10:12:16', '2026-07-21 10:12:16'),
(21, 'nita_permata', '$2b$10$bAB7BkuKUXwVJ1pjgyAoZucjiN2gT5hJdJ1g6mKite9bWDL/L7TPO', 'responden', '2026-07-21 10:12:16', '2026-07-21 10:12:16'),
(22, 'agus_saputra', '$2b$10$bAB7BkuKUXwVJ1pjgyAoZucjiN2gT5hJdJ1g6mKite9bWDL/L7TPO', 'responden', '2026-07-21 10:12:16', '2026-07-21 10:12:16'),
(23, 'maya_indriani', '$2b$10$bAB7BkuKUXwVJ1pjgyAoZucjiN2gT5hJdJ1g6mKite9bWDL/L7TPO', 'responden', '2026-07-21 10:12:16', '2026-07-21 10:12:16'),
(24, 'bapakrw', '$2b$10$2FKkua7947Zbet6e3q7Q3OYMQ2FL8hia7cL6X3H/Hfjl0xCNh/9mS', 'responden', '2026-07-23 07:58:14', '2026-07-23 07:58:14');

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
  ADD UNIQUE KEY `kode_8` (`kode`),
  ADD UNIQUE KEY `kode_9` (`kode`),
  ADD UNIQUE KEY `kode_10` (`kode`),
  ADD UNIQUE KEY `kode_11` (`kode`),
  ADD UNIQUE KEY `kode_12` (`kode`),
  ADD UNIQUE KEY `kode_13` (`kode`),
  ADD UNIQUE KEY `kode_14` (`kode`),
  ADD UNIQUE KEY `kode_15` (`kode`),
  ADD UNIQUE KEY `kode_16` (`kode`),
  ADD UNIQUE KEY `kode_17` (`kode`),
  ADD UNIQUE KEY `kode_18` (`kode`),
  ADD UNIQUE KEY `kode_19` (`kode`),
  ADD UNIQUE KEY `kode_20` (`kode`),
  ADD UNIQUE KEY `kode_21` (`kode`),
  ADD UNIQUE KEY `kode_22` (`kode`),
  ADD UNIQUE KEY `kode_23` (`kode`),
  ADD UNIQUE KEY `kode_24` (`kode`),
  ADD UNIQUE KEY `kode_25` (`kode`),
  ADD UNIQUE KEY `kode_26` (`kode`),
  ADD UNIQUE KEY `kode_27` (`kode`),
  ADD UNIQUE KEY `kode_28` (`kode`);

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
  ADD UNIQUE KEY `kode_9` (`kode`),
  ADD UNIQUE KEY `kode_10` (`kode`),
  ADD UNIQUE KEY `kode_11` (`kode`),
  ADD UNIQUE KEY `kode_12` (`kode`),
  ADD UNIQUE KEY `kode_13` (`kode`),
  ADD UNIQUE KEY `kode_14` (`kode`),
  ADD UNIQUE KEY `kode_15` (`kode`),
  ADD UNIQUE KEY `kode_16` (`kode`),
  ADD UNIQUE KEY `kode_17` (`kode`),
  ADD UNIQUE KEY `kode_18` (`kode`),
  ADD UNIQUE KEY `kode_19` (`kode`),
  ADD UNIQUE KEY `kode_20` (`kode`),
  ADD UNIQUE KEY `kode_21` (`kode`),
  ADD UNIQUE KEY `kode_22` (`kode`),
  ADD UNIQUE KEY `kode_23` (`kode`),
  ADD UNIQUE KEY `kode_24` (`kode`),
  ADD UNIQUE KEY `kode_25` (`kode`),
  ADD UNIQUE KEY `kode_26` (`kode`),
  ADD UNIQUE KEY `kode_27` (`kode`),
  ADD UNIQUE KEY `kode_28` (`kode`),
  ADD UNIQUE KEY `kode_29` (`kode`);

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
  ADD UNIQUE KEY `kode_9` (`kode`),
  ADD UNIQUE KEY `kode_10` (`kode`),
  ADD UNIQUE KEY `kode_11` (`kode`),
  ADD UNIQUE KEY `kode_12` (`kode`),
  ADD UNIQUE KEY `kode_13` (`kode`),
  ADD UNIQUE KEY `kode_14` (`kode`),
  ADD UNIQUE KEY `kode_15` (`kode`),
  ADD UNIQUE KEY `kode_16` (`kode`),
  ADD UNIQUE KEY `kode_17` (`kode`),
  ADD UNIQUE KEY `kode_18` (`kode`),
  ADD UNIQUE KEY `kode_19` (`kode`),
  ADD UNIQUE KEY `kode_20` (`kode`),
  ADD UNIQUE KEY `kode_21` (`kode`),
  ADD UNIQUE KEY `kode_22` (`kode`),
  ADD UNIQUE KEY `kode_23` (`kode`),
  ADD UNIQUE KEY `kode_24` (`kode`),
  ADD UNIQUE KEY `kode_25` (`kode`),
  ADD UNIQUE KEY `kode_26` (`kode`),
  ADD UNIQUE KEY `kode_27` (`kode`),
  ADD UNIQUE KEY `kode_28` (`kode`),
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
  ADD UNIQUE KEY `username_12` (`username`),
  ADD UNIQUE KEY `username_13` (`username`),
  ADD UNIQUE KEY `username_14` (`username`),
  ADD UNIQUE KEY `username_15` (`username`),
  ADD UNIQUE KEY `username_16` (`username`),
  ADD UNIQUE KEY `username_17` (`username`),
  ADD UNIQUE KEY `username_18` (`username`),
  ADD UNIQUE KEY `username_19` (`username`),
  ADD UNIQUE KEY `username_20` (`username`),
  ADD UNIQUE KEY `username_21` (`username`),
  ADD UNIQUE KEY `username_22` (`username`),
  ADD UNIQUE KEY `username_23` (`username`),
  ADD UNIQUE KEY `username_24` (`username`),
  ADD UNIQUE KEY `username_25` (`username`),
  ADD UNIQUE KEY `username_26` (`username`),
  ADD UNIQUE KEY `username_27` (`username`),
  ADD UNIQUE KEY `username_28` (`username`),
  ADD UNIQUE KEY `username_29` (`username`),
  ADD UNIQUE KEY `username_30` (`username`),
  ADD UNIQUE KEY `username_31` (`username`),
  ADD UNIQUE KEY `username_32` (`username`);

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
  MODIFY `id_comparisons` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2901;

--
-- AUTO_INCREMENT for table `criteria`
--
ALTER TABLE `criteria`
  MODIFY `id_criteria` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `rankings`
--
ALTER TABLE `rankings`
  MODIFY `id_rankings` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `sub_criteria`
--
ALTER TABLE `sub_criteria`
  MODIFY `id_sub_criteria` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_users` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comparisons`
--
ALTER TABLE `comparisons`
  ADD CONSTRAINT `comparisons_ibfk_244` FOREIGN KEY (`id_users`) REFERENCES `users` (`id_users`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comparisons_ibfk_245` FOREIGN KEY (`criteria_id_1`) REFERENCES `criteria` (`id_criteria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `comparisons_ibfk_246` FOREIGN KEY (`criteria_id_2`) REFERENCES `criteria` (`id_criteria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `comparisons_ibfk_247` FOREIGN KEY (`parent_criteria_id`) REFERENCES `criteria` (`id_criteria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `comparisons_ibfk_248` FOREIGN KEY (`sub_criteria_id_1`) REFERENCES `sub_criteria` (`id_sub_criteria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `comparisons_ibfk_249` FOREIGN KEY (`sub_criteria_id_2`) REFERENCES `sub_criteria` (`id_sub_criteria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `comparisons_ibfk_250` FOREIGN KEY (`parent_sub_criteria_id`) REFERENCES `sub_criteria` (`id_sub_criteria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `comparisons_ibfk_251` FOREIGN KEY (`alternative_id_1`) REFERENCES `alternatives` (`id_alternatives`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `comparisons_ibfk_252` FOREIGN KEY (`alternative_id_2`) REFERENCES `alternatives` (`id_alternatives`) ON DELETE SET NULL ON UPDATE CASCADE;

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
