-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 07, 2022 at 03:36 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `whbs_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking_list`
--

CREATE TABLE `booking_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `client_id` int(30) NOT NULL,
  `hall_id` int(30) NOT NULL,
  `services_ids` text DEFAULT NULL,
  `wedding_schedule` date NOT NULL,
  `total_guests` float NOT NULL DEFAULT 0,
  `remarks` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booking_list`
--

INSERT INTO `booking_list` (`id`, `code`, `client_id`, `hall_id`, `services_ids`, `wedding_schedule`, `total_guests`, `remarks`, `status`, `date_created`, `date_updated`) VALUES
(3, '202202-00001', 4, 1, '|3|', '2022-02-06', 12, 'liga perdana', 0, '2022-02-03 06:14:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `client_list`
--

CREATE TABLE `client_list` (
  `id` int(30) NOT NULL,
  `firstname` text NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` text NOT NULL,
  `gender` varchar(100) NOT NULL,
  `contact` text NOT NULL,
  `address` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `avatar` text NOT NULL,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `client_list`
--

INSERT INTO `client_list` (`id`, `firstname`, `middlename`, `lastname`, `gender`, `contact`, `address`, `email`, `password`, `status`, `avatar`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 'Cristiano', 'C', 'Ronaldo', 'Male', '09123456789', 'Kampung Batu Belah, Tapah, Perak', 'cr7@yahoo.com', '4744ddea876b11dcb1d169fadf494418', 1, 'uploads/clients/1.png', 0, '2022-01-31 13:33:27', '2022-02-03 06:22:53'),
(2, 'Melisa', 'D', 'Sakura', 'Female', '09123456987', 'Taiwan, Japan', 'SakuraKonoha@simple.com', '1254737c076cf867dc53d60a0364f38e', 1, 'uploads/clients/2.png', 0, '2022-01-31 13:34:44', '2022-02-03 06:25:44'),
(3, 'Ammar', 'Syuk', 'Syuka', 'Male', '212313', 'aaww322', 'shakeramber@gmail.com', 'c0a8ce9d3994d1dfe091ace6206e9e90', 1, '', 0, '2022-02-03 02:46:31', NULL),
(4, 'Nik', 'Muhammad ', 'Hafizuddin', 'Male', '0199212133', 'Baka baka, 010000 Tempoyak, Durian', 'nikz@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', 1, 'uploads/nikz.jpg', 0, '2022-02-03 06:10:43', '2022-02-03 06:13:51');

-- --------------------------------------------------------

--
-- Table structure for table `hall_list`
--

CREATE TABLE `hall_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `name` text NOT NULL,
  `price` float NOT NULL DEFAULT 0,
  `description` text NOT NULL,
  `image_path` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hall_list`
--

INSERT INTO `hall_list` (`id`, `code`, `name`, `price`, `description`, `image_path`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 'Hub-01', 'Outdoor Hub', 100, 'The outdoor hub provide open space environment. There are three type of the court. Outdoor hub comes with one small court and two quarter FIFA court and two FIFA standard measurement court. ', 'uploads/halls/outdoor.jpg', 1, 0, '2022-01-31 09:59:18', '2022-02-03 04:35:31'),
(3, 'Hub-02', 'Indoor Hub', 150, 'Indoor hub provide many facilities such as three restrooms for both gender and shop. There are three type of the court. Indoor hub provide three small court and one quarter FIFA court. ', 'uploads/halls/indoor.jpeg', 1, 0, '2022-01-31 10:10:16', '2022-02-03 04:35:05');

-- --------------------------------------------------------

--
-- Table structure for table `message_list`
--

CREATE TABLE `message_list` (
  `id` int(30) NOT NULL,
  `fullname` text NOT NULL,
  `contact` text NOT NULL,
  `email` text NOT NULL,
  `message` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `message_list`
--

INSERT INTO `message_list` (`id`, `fullname`, `contact`, `email`, `message`, `status`, `date_created`) VALUES
(1, 'John Smith', '09123456789', 'jsmith@sample.com', 'This is a sample inquiry only.', 1, '2022-01-31 15:27:35'),
(2, 'ariffin', '01923423123', 'jackie@yahoo.com', 'The ball cant be used anymore at the outdoor court', 0, '2022-02-03 06:44:53');

-- --------------------------------------------------------

--
-- Table structure for table `service_list`
--

CREATE TABLE `service_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `service_list`
--

INSERT INTO `service_list` (`id`, `name`, `description`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 'Small Court', '', 1, 0, '2022-01-31 10:22:31', '2022-02-03 06:00:06'),
(2, 'Quarter FIFA Court', '', 1, 0, '2022-01-31 10:23:22', '2022-02-03 06:32:00'),
(3, 'FIFA Standard Measurement Court', '', 1, 0, '2022-01-31 10:24:28', '2022-02-03 06:34:12');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Futsal Court Booking System'),
(6, 'short_name', 'FUTSAL LEGEND'),
(11, 'logo', 'uploads/logo.jpg'),
(13, 'user_avatar', 'uploads/avatar-4.jpg'),
(14, 'cover', 'uploads/ball.png'),
(15, 'content', 'Array'),
(16, 'email', 'futsalegend@gmail.com'),
(17, 'contact', '+60-149356364'),
(18, 'from_time', '18:00'),
(19, 'to_time', '5:30'),
(20, 'address', 'Futsal Legend , 30 Jalan Bunga Tanjung 9 Taman Muda Cheras, Kuala Lumpur');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `status` int(1) NOT NULL DEFAULT 1 COMMENT '0=not verified, 1 = verified',
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `middlename`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `status`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', NULL, 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/admin.png', NULL, 1, 1, '2021-01-20 14:02:37', '2022-02-03 05:35:08'),
(5, 'Nik ', NULL, 'Hafizuddin ', 'nikz', '5f4dcc3b5aa765d61d8327deb882cf99', 'uploads/nikz.jpg', NULL, 1, 1, '2022-02-03 06:05:07', '2022-02-03 06:08:52');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking_list`
--
ALTER TABLE `booking_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hall_id` (`hall_id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `client_list`
--
ALTER TABLE `client_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hall_list`
--
ALTER TABLE `hall_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message_list`
--
ALTER TABLE `message_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_list`
--
ALTER TABLE `service_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
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
-- AUTO_INCREMENT for table `booking_list`
--
ALTER TABLE `booking_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `client_list`
--
ALTER TABLE `client_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `hall_list`
--
ALTER TABLE `hall_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `message_list`
--
ALTER TABLE `message_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `service_list`
--
ALTER TABLE `service_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking_list`
--
ALTER TABLE `booking_list`
  ADD CONSTRAINT `booking_list_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `booking_list_ibfk_2` FOREIGN KEY (`hall_id`) REFERENCES `hall_list` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
