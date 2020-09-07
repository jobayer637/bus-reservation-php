-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 05, 2020 at 01:47 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bus`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(3) NOT NULL,
  `cat_title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(3, 'Daily Buses'),
(4, 'Weekly Buses'),
(5, 'Night Buses');

-- --------------------------------------------------------

--
-- Table structure for table `cost`
--

CREATE TABLE `cost` (
  `start` varchar(255) NOT NULL,
  `stopage` varchar(255) NOT NULL,
  `category` int(3) NOT NULL,
  `cost` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cost`
--

INSERT INTO `cost` (`start`, `stopage`, `category`, `cost`) VALUES
('Kanpur', 'Unnao', 5, 100),
('Unnao', 'Lucknow', 5, 152);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(3) NOT NULL,
  `bus_id` int(3) NOT NULL,
  `user_id` int(3) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_age` int(3) NOT NULL,
  `source` varchar(255) NOT NULL,
  `destination` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `cost` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `bus_id`, `user_id`, `user_name`, `user_age`, `source`, `destination`, `date`, `cost`) VALUES
(23, 2, 32, 'Sayka Rahman', 24, 'Dhaka', 'Jhenaidah', '2020-01-05', 0),
(24, 2, 32, 'Mishuk', 22, 'Dhaka', 'Jhenaidah', '2020-01-05', 0),
(25, 6, 32, 'jkj', 22, 'Dhaka', 'Noakhali', '2020-01-05', 0),
(26, 2, 33, 'Mishuk', 22, 'Dhaka', 'Jhenaidah', '2020-01-05', 0),
(27, 2, 36, 'Sayka Rahman', 23, 'Dhaka', 'Jhenaidah', '2020-01-05', 0);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` int(3) NOT NULL,
  `post_category_id` int(3) NOT NULL,
  `post_title` varchar(255) NOT NULL,
  `post_author` varchar(255) NOT NULL,
  `post_date` date NOT NULL,
  `post_image` text NOT NULL,
  `post_content` text NOT NULL,
  `post_source` varchar(255) NOT NULL,
  `post_destination` varchar(255) NOT NULL,
  `post_via` varchar(255) NOT NULL,
  `post_via_time` varchar(255) NOT NULL,
  `post_query_count` int(3) NOT NULL,
  `max_seats` int(3) NOT NULL,
  `available_seats` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `post_category_id`, `post_title`, `post_author`, `post_date`, `post_image`, `post_content`, `post_source`, `post_destination`, `post_via`, `post_via_time`, `post_query_count`, `max_seats`, `available_seats`) VALUES
(2, 3, 'Dhaka To Jhenaidah', 'Skyline Travels (Cost 550)', '2019-04-26', 'bus2.jpg', 'Runs daily except Tuesday\r\nA/C Bus', 'Dhaka', 'Jhenaidah', 'ArichaGhatt', '6:00', 2, 20, 15),
(3, 3, 'Dhaka To Chittagong', 'Desh Travels (Cost-1500)', '2019-04-26', 'bus3.jpg', 'Runs daily \r\nLowest fare among all', 'Dhaka', 'Chittagong', 'Chittagong', '7:00', 1, 30, 17),
(4, 5, 'Dhaka To Mymenshing', 'Ena Enterprise (Cost-1000)', '2019-05-18', 'bus4.jpg', 'Runs only on Tuesday', 'Dhaka', 'Mymenshing', 'Kanchipur Mymenshing', '12:00 2:00', 6, 20, 19),
(5, 3, 'Dhaka To Kustia', 'SB Travels (Cost-600)', '2019-06-03', 'bus5.jpg', 'Runs daily', 'Dhaka', 'Kustia', 'Dhaka Jamuna Jamalpur Kustia', '12:00 2:00 5:00 7:00 8:00', 0, 20, 19),
(6, 4, 'Dhaka To Noakhali', 'Shohag Travels (Cost-1200)', '2019-04-26', 'bus1.jpg', 'Weekly', 'Dhaka', 'Noakhali', '', '7:00', 0, 10, 10),
(7, 4, 'Dhaka To Rajshahi', 'Green Line (Cost-800)', '2019-04-26', 'bus2.jpg', 'Runs Weekly', 'Dhaka', 'Rajshahi', '', '2:00 11:00', 0, 10, 9),
(8, 3, 'Dhaka To khulna', 'Hanif Poribohon (Cost-1100)', '2019-04-30', 'bus2.jpg', 'Runs daily except Tuesday\r\nA/C Bus', 'Dhaka', 'Khulna', 'Dhaka Khulna', '6:00 11:00', 0, 20, 18);

-- --------------------------------------------------------

--
-- Table structure for table `query`
--

CREATE TABLE `query` (
  `query_id` int(3) NOT NULL,
  `query_bus_id` int(3) NOT NULL,
  `query_user` varchar(255) NOT NULL,
  `query_email` varchar(255) NOT NULL,
  `query_date` date NOT NULL,
  `query_content` text NOT NULL,
  `query_replied` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `seats`
--

CREATE TABLE `seats` (
  `bus_id` int(3) NOT NULL,
  `max_seats` int(3) NOT NULL,
  `available_seats` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(3) NOT NULL,
  `username` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_firstname` varchar(255) NOT NULL,
  `user_lastname` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_phoneno` varchar(255) NOT NULL,
  `user_image` text NOT NULL,
  `user_role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `user_password`, `user_firstname`, `user_lastname`, `user_email`, `user_phoneno`, `user_image`, `user_role`) VALUES
(35, 'admin', 'admin', 'K.A ', 'Mishuk', 'kmishuk373@gmail.com', '1798023738', '201-2019759_iron-man-black-and-white-wallpaper-tony-stark.png', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `query`
--
ALTER TABLE `query`
  ADD PRIMARY KEY (`query_id`);

--
-- Indexes for table `seats`
--
ALTER TABLE `seats`
  ADD PRIMARY KEY (`bus_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `query`
--
ALTER TABLE `query`
  MODIFY `query_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
