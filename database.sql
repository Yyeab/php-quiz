-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 22, 2025 at 03:57 PM
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
-- Database: `quizzes_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, '	Science'),
(2, '	Math'),
(3, '	History'),
(4, '	Computers');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `question` text NOT NULL,
  `option_a` varchar(255) DEFAULT NULL,
  `option_b` varchar(255) DEFAULT NULL,
  `option_c` varchar(255) DEFAULT NULL,
  `option_d` varchar(255) DEFAULT NULL,
  `correct_option` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `category_id`, `question`, `option_a`, `option_b`, `option_c`, `option_d`, `correct_option`) VALUES
(1, 1, 'What planet is known as the Red Planet?', 'Earth', 'Mars', 'Jupiter', 'Venus', 'B'),
(2, 1, 'What gas so plants absorb from the air?', 'Oxygen', 'Carbon Dioxide', 'Nitrogen', 'Hydrogen', 'B'),
(3, 1, 'What is the chemical symbol for water?', 'H2O', 'O2', 'CO2', 'HO', 'A'),
(4, 2, 'What is 5 + 7?', '10', '11', '12', '13', 'C'),
(5, 2, 'What is the square root of 81?', '7', '8', '9', '10', 'C'),
(6, 2, 'What is 15 divided by 3?', '5', '6', '4', '3', 'A'),
(7, 3, 'In which year did World War 2 end?', '1943', '1944', '1945', '1946', 'C'),
(8, NULL, 'Which ancient civilization build the pyramids?', 'Romans', 'Egyptians', 'Greeks', 'Aztecs', 'B'),
(9, 3, 'Hannibal was a general for which ancient civilization?', 'Rome', 'Greece', 'Carthage', 'Ethiopia', 'C'),
(10, 4, 'What does CPU stand for?', 'Central Processing Unit', 'Computer Personal Unit', 'Central Processor Utility', 'Computer Processing Unit', 'A'),
(11, NULL, 'What language is primarily used for web pages?', 'Python', 'JavaScript', 'C++', 'Rust', 'B'),
(12, 4, 'What company developed the Windows OS?', 'Apple', 'Google', 'IBM', 'Microsoft', 'D');

-- --------------------------------------------------------

--
-- Table structure for table `scores`
--

CREATE TABLE `scores` (
  `id` int(11) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `taken_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `scores`
--

INSERT INTO `scores` (`id`, `username`, `category_id`, `score`, `taken_at`) VALUES
(1, 'ABC', 1, 2, '2025-06-22 13:20:17'),
(2, 'cde', 1, 3, '2025-06-22 13:20:38'),
(3, 'adsa', 3, 0, '2025-06-22 13:22:24'),
(4, 'sads', 1, 2, '2025-06-22 13:22:37'),
(5, 'sads', 1, 2, '2025-06-22 13:23:00'),
(6, 'qwds', 1, 1, '2025-06-22 13:23:18'),
(7, 'qwds', 1, 1, '2025-06-22 13:24:40'),
(8, 'qwds', 1, 1, '2025-06-22 13:24:47'),
(9, 'xzc', 1, 1, '2025-06-22 13:27:39'),
(10, 'ABCxxa', 1, 3, '2025-06-22 13:46:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `scores`
--
ALTER TABLE `scores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `scores`
--
ALTER TABLE `scores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `scores`
--
ALTER TABLE `scores`
  ADD CONSTRAINT `scores_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
