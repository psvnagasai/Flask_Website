-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 18, 2020 at 03:58 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `huecomundo`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(11) NOT NULL,
  `name` text NOT NULL,
  `phone_no` varchar(50) NOT NULL,
  `msg` text NOT NULL,
  `date` datetime DEFAULT current_timestamp(),
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `name`, `phone_no`, `msg`, `date`, `email`) VALUES
(1, 'naga sai', '123', 'abc', '2020-06-15 12:04:55', 'a@gmail.com'),
(2, 'Tiegan', '9292929292', 'i hope it works now.', '2020-06-15 12:38:52', 'teiganpona@gmail.com'),
(3, 'Meandre Wellesly', '1298347655', 'I am a rat', '2020-06-15 13:29:18', 'chickenlittle@gmail.com'),
(6, 'a', 'c', 'd', '2020-06-15 15:28:23', 'b'),
(7, 'a', 'c', 'd', '2020-06-15 15:28:53', 'b'),
(8, 'a', 'a', 'a', '2020-06-15 15:29:52', 'a'),
(9, 'q', 'q', 'q', '2020-06-15 15:37:55', 'q'),
(10, 'uma', '9948274948', 'hi hello hskhskdksdsd', '2020-06-16 11:08:03', 'tieganpona@gmail.com'),
(11, '', '', '', '2020-06-16 19:55:04', ''),
(12, 'pein', 'pein', 'pein', '2020-06-17 21:06:05', 'pein'),
(13, 'a', 'a', 'a', '2020-06-18 17:11:18', 'a'),
(14, 'a', 'a', 'a', '2020-06-18 17:13:22', 'a'),
(15, 'w', 'w', 'w', '2020-06-18 17:13:27', 'w'),
(16, 'w', 'w', 'w', '2020-06-18 17:13:35', 'w'),
(17, 'w', 'w', 'w', '2020-06-18 17:14:53', 'w'),
(18, 'aA', 'AA', 'A', '2020-06-18 17:14:59', 'A'),
(19, 'qq', 'q', 'q', '2020-06-18 17:17:45', 'q'),
(20, 'qq', 'q', 'q', '2020-06-18 17:18:57', 'q');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `serial_number` int(11) NOT NULL,
  `title` text NOT NULL,
  `slug` varchar(25) NOT NULL,
  `project_name` text NOT NULL,
  `content` text NOT NULL,
  `site` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`serial_number`, `title`, `slug`, `project_name`, `content`, `site`) VALUES
(1, 'My First Project', 'first-project', 'PDF Report Generrator', 'This is a Project which gave the output of report cards in .Pdf format, taking input from a csv file.', 'https://github.com/psvnagasai/Generating-pdf-report-cards-using-csv-file-'),
(2, 'Project 2', 'second-post', 'Colourgame_project', 'Its a game in which you have to select the given rgb colour among the 6 options.', 'https://github.com/psvnagasai/ColourGame-project'),
(3, 'project 3', 'third-project', 'Cow_vs_fish_game', 'This is a game made using pygame just for fun', 'https://github.com/psvnagasai/Cow_vs_Fish_game'),
(4, 'project 4', 'fourth-project', 'Hazard_communication', 'This is my final year project on hazard communication of roof falls in ug mines', 'https://github.com/psvnagasai/hazcom'),
(5, 'Mirai_Nikki', 'future-diary', 'Future_diary', 'This is a diary in which you write in the morning what you wanna do the whole day.', 'a');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`serial_number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `serial_number` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
