-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 06, 2018 at 12:07 AM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gta_server`
--

-- --------------------------------------------------------

--
-- Table structure for table `fsn_characters`
--

CREATE TABLE `fsn_characters` (
  `char_id` int(11) NOT NULL,
  `steamid` text NOT NULL,
  `char_fname` text NOT NULL,
  `char_lname` text NOT NULL,
  `char_dob` varchar(10) NOT NULL,
  `char_desc` text NOT NULL,
  `char_twituname` varchar(20) NOT NULL DEFAULT 'notset',
  `char_licenses` text NOT NULL,
  `char_phone` int(11) NOT NULL DEFAULT '-1',
  `char_contacts` text NOT NULL,
  `char_jailtime` int(11) NOT NULL DEFAULT '0',
  `char_money` int(11) NOT NULL,
  `char_bank` int(11) NOT NULL,
  `char_model` text NOT NULL,
  `mdl_extras` text NOT NULL,
  `char_inventory` text NOT NULL,
  `char_weapons` text NOT NULL,
  `char_police` int(11) NOT NULL DEFAULT '0',
  `char_ems` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fsn_properties`
--

CREATE TABLE `fsn_properties` (
  `property_id` int(11) NOT NULL,
  `property_name` text NOT NULL,
  `property_owner` int(11) NOT NULL,
  `property_coowners` text NOT NULL,
  `property_inventory` text NOT NULL,
  `property_weapons` text NOT NULL,
  `property_money` int(11) NOT NULL,
  `property_expiry` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fsn_properties`
--

INSERT INTO `fsn_properties` (`property_id`, `property_name`, `property_owner`, `property_coowners`, `property_inventory`, `property_weapons`, `property_money`, `property_expiry`) VALUES
(1, 'Darnell Bros Factory', -1, '[]', '{}', '{}', 0, 0),
(2, 'Micheals Mansion', -1, '[]', '{}', '{}', 0, 0),
(3, 'Trevors Trailer', -1, '[]', '{}', '{}', 0, 0),
(4, 'Yellowjack', -1, '[]', '{}', '{}', 0, 0),
(5, 'Shitbag\'s Flat', -1, '[]', '{}', '{}', 0, 0),
(6, 'Franklin\'s aunt house', -1, '[]', '{}', '{}', 0, 0),
(7, 'Stripclub', -1, '[]', '{}', '{}', 0, 0),
(8, 'Devins Garage', 1, '[]', '{}', '{}', 0, 1530970255);

-- --------------------------------------------------------

--
-- Table structure for table `fsn_textmessages`
--

CREATE TABLE `fsn_textmessages` (
  `txt_id` int(11) NOT NULL,
  `txt_sender` int(11) NOT NULL,
  `txt_reciever` int(11) NOT NULL,
  `txt_message` text NOT NULL,
  `txt_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fsn_tickets`
--

CREATE TABLE `fsn_tickets` (
  `ticket_id` int(11) NOT NULL,
  `officer_name` text NOT NULL,
  `receiver_name` text NOT NULL,
  `ticket_amount` int(11) NOT NULL,
  `ticket_jailtime` int(11) NOT NULL,
  `ticket_charges` text NOT NULL,
  `ticket_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fsn_users`
--

CREATE TABLE `fsn_users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `steamid` text NOT NULL,
  `admin_lvl` int(11) NOT NULL DEFAULT '0',
  `connections` int(11) NOT NULL,
  `banned` int(99) NOT NULL,
  `banned_r` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fsn_vehicles`
--

CREATE TABLE `fsn_vehicles` (
  `veh_id` int(11) NOT NULL,
  `char_id` int(11) NOT NULL,
  `veh_name` text NOT NULL,
  `veh_hash` text NOT NULL,
  `veh_plate` text NOT NULL,
  `veh_plate_style` int(11) NOT NULL,
  `veh_windows` int(11) NOT NULL,
  `veh_colours` text NOT NULL,
  `veh_wheeltype` int(11) NOT NULL,
  `veh_mods` text NOT NULL,
  `veh_extras` text NOT NULL,
  `veh_inventory` text NOT NULL,
  `veh_fuel` int(11) NOT NULL,
  `veh_health` int(11) NOT NULL,
  `veh_type` varchar(1) NOT NULL,
  `veh_status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fsn_warrants`
--

CREATE TABLE `fsn_warrants` (
  `war_id` int(11) NOT NULL,
  `suspect_name` text NOT NULL,
  `officer_name` text NOT NULL,
  `war_charges` text NOT NULL,
  `war_times` text NOT NULL,
  `war_fine` text NOT NULL,
  `war_desc` text NOT NULL,
  `war_status` text NOT NULL,
  `war_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fsn_characters`
--
ALTER TABLE `fsn_characters`
  ADD PRIMARY KEY (`char_id`);

--
-- Indexes for table `fsn_properties`
--
ALTER TABLE `fsn_properties`
  ADD PRIMARY KEY (`property_id`);

--
-- Indexes for table `fsn_textmessages`
--
ALTER TABLE `fsn_textmessages`
  ADD PRIMARY KEY (`txt_id`);

--
-- Indexes for table `fsn_tickets`
--
ALTER TABLE `fsn_tickets`
  ADD PRIMARY KEY (`ticket_id`);

--
-- Indexes for table `fsn_users`
--
ALTER TABLE `fsn_users`
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `fsn_vehicles`
--
ALTER TABLE `fsn_vehicles`
  ADD PRIMARY KEY (`veh_id`);

--
-- Indexes for table `fsn_warrants`
--
ALTER TABLE `fsn_warrants`
  ADD PRIMARY KEY (`war_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `fsn_characters`
--
ALTER TABLE `fsn_characters`
  MODIFY `char_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fsn_properties`
--
ALTER TABLE `fsn_properties`
  MODIFY `property_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `fsn_textmessages`
--
ALTER TABLE `fsn_textmessages`
  MODIFY `txt_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fsn_tickets`
--
ALTER TABLE `fsn_tickets`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fsn_users`
--
ALTER TABLE `fsn_users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fsn_vehicles`
--
ALTER TABLE `fsn_vehicles`
  MODIFY `veh_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fsn_warrants`
--
ALTER TABLE `fsn_warrants`
  MODIFY `war_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
