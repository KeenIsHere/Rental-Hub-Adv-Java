-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 21, 2025 at 07:39 PM
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
-- Database: `coursework`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `preferred_date` date DEFAULT NULL,
  `preferred_time` varchar(20) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `property_id`, `name`, `email`, `phone`, `preferred_date`, `preferred_time`, `notes`, `created_at`) VALUES
(1, 16, 'dadasd', 'dasd@gmail.com', '837182712', '2025-05-10', '4:00 PM', 'I would like to schedule a viewing for Modern Family House.', '2025-05-21 16:14:03');

-- --------------------------------------------------------

--
-- Table structure for table `property`
--

CREATE TABLE `property` (
  `property_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `property_type` varchar(100) NOT NULL,
  `price` decimal(15,2) NOT NULL,
  `area` double NOT NULL,
  `bedrooms` int(11) NOT NULL,
  `bathrooms` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `zip_code` varchar(20) NOT NULL,
  `description` text DEFAULT NULL,
  `has_garage` tinyint(1) DEFAULT 0,
  `has_swimming_pool` tinyint(1) DEFAULT 0,
  `has_garden` tinyint(1) DEFAULT 0,
  `has_air_conditioning` tinyint(1) DEFAULT 0,
  `has_fireplace` tinyint(1) DEFAULT 0,
  `contact_name` varchar(100) NOT NULL,
  `contact_email` varchar(100) NOT NULL,
  `contact_phone` varchar(20) NOT NULL,
  `status` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `image_urls` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `property`
--

INSERT INTO `property` (`property_id`, `title`, `property_type`, `price`, `area`, `bedrooms`, `bathrooms`, `address`, `city`, `state`, `zip_code`, `description`, `has_garage`, `has_swimming_pool`, `has_garden`, `has_air_conditioning`, `has_fireplace`, `contact_name`, `contact_email`, `contact_phone`, `status`, `user_id`, `created_at`, `updated_at`, `image_urls`) VALUES
(16, 'Modern Family House', 'house', 450000.00, 2500, 4, 3, '123 Maple Street', 'Austin', 'TX', '73301', 'A beautiful modern family house with spacious rooms and a large backyard.', 1, 0, 1, 1, 1, 'Gaurav Bhujel', 'gaurav@gmail.com', '555-123-4567', 'active', 12, '2025-05-21 15:33:35', '2025-05-21 16:00:15', 'images/1747841615563_Home-exterior-94d8db.jpg'),
(19, 'Modern Family House', 'townhouse', 450000.00, 2500, 4, 3, '123 Maple Street', 'Austin', 'TX', '73301', 'sdfsdf', 1, 0, 0, 1, 0, 'Gaurav Bhujel', 'gaurav@gmail.com', '555-123-4567', 'inactive', 24, '2025-05-21 16:47:04', '2025-05-21 16:47:04', 'images/1747846024320_Home-exterior-94d8db.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `is_admin` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone_number`, `password`, `is_admin`) VALUES
(3, 'Shiridhar', 'Khatri', 'shiridharkhatri2@gmail.com', '9820610923', '$2a$12$I0PfjgAaLhdM8m7zJ0DmceU8deVrpW.22ovW750Prn5zr/OP04.U6', 1),
(21, 'Shiridhar', 'Gurung', 'shiridharkhatri5@gmail.com', '9820610923', '$2a$12$W1a1QKlT6AzCJ67nnuQRrelZJ9Bl/KbhNp5gl7rUDDcygK9seey1O', 0),
(23, 'John', 'Smith', 'testing62929@gmail.com', '5551234567', '$2a$12$4sjtiZtMo81hdJpZAYvgqehspUoAHI3GEhKJpRp5HbJtGJs3oVb/.', 0),
(24, 'Gaurav', 'Bhujel', 'gaurav@gmail.com', '5551234567', '$2a$12$77Ro4gQBwzrsJAjqQHQ16eWIyFoRm4KUtxj8tXOUt0cr4WCWebV/W', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property`
--
ALTER TABLE `property`
  ADD PRIMARY KEY (`property_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `property`
--
ALTER TABLE `property`
  MODIFY `property_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
