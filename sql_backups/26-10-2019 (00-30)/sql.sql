-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 05, 2020 at 11:58 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fsn`
--

-- --------------------------------------------------------

--
-- Table structure for table `fsn_apartments`
--

CREATE TABLE `fsn_apartments` (
  `apt_id` int(11) NOT NULL,
  `apt_owner` int(11) NOT NULL,
  `apt_inventory` text NOT NULL,
  `apt_cash` int(11) NOT NULL,
  `apt_outfits` text NOT NULL,
  `apt_utils` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fsn_bans`
--

CREATE TABLE `fsn_bans` (
  `ban_identifier` varchar(255) NOT NULL,
  `ban_reason` text NOT NULL,
  `ban_id` int(11) NOT NULL,
  `ban_expire` int(11) NOT NULL,
  `ban_date` int(11) NOT NULL,
  `ban_admin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `char_phone` text DEFAULT NULL,
  `char_contacts` text NOT NULL,
  `char_jailtime` int(11) NOT NULL DEFAULT 0,
  `char_money` int(11) NOT NULL,
  `char_bank` int(11) NOT NULL,
  `char_model` text NOT NULL,
  `mdl_extras` text NOT NULL,
  `char_details` varchar(65000) NOT NULL DEFAULT '[]',
  `char_inventory` text NOT NULL,
  `char_weapons` text NOT NULL,
  `char_police` int(11) NOT NULL DEFAULT 0,
  `char_ems` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fsn_properties`
--

CREATE TABLE `fsn_properties` (
  `property_id` int(11) NOT NULL,
  `property_name` text NOT NULL,
  `property_xyz` text NOT NULL,
  `property_owner` int(11) NOT NULL,
  `property_coowners` text NOT NULL,
  `property_inventory` text NOT NULL,
  `property_weapons` text NOT NULL,
  `property_money` int(11) NOT NULL,
  `property_expiry` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fsn_storageboxes`
--

CREATE TABLE `fsn_storageboxes` (
  `sbox_id` int(11) NOT NULL,
  `sbox_details` text NOT NULL,
  `sbox_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fsn_textmessages`
--

CREATE TABLE `fsn_textmessages` (
  `txt_id` int(11) NOT NULL,
  `txt_sender` int(11) NOT NULL,
  `txt_reciever` int(11) NOT NULL,
  `txt_message` text NOT NULL,
  `txt_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fsn_tickets`
--

CREATE TABLE `fsn_tickets` (
  `ticket_id` int(11) NOT NULL,
  `officer_id` int(11) NOT NULL,
  `officer_name` text NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `ticket_amount` int(11) NOT NULL,
  `ticket_jailtime` int(11) NOT NULL,
  `ticket_charges` text NOT NULL,
  `ticket_date` int(99) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fsn_users`
--

CREATE TABLE `fsn_users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `steamid` text NOT NULL,
  `identifiers` text DEFAULT NULL,
  `location` text DEFAULT NULL,
  `admin_lvl` int(11) NOT NULL DEFAULT 0,
  `priority` int(11) NOT NULL DEFAULT 0,
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
  `veh_spawnname` text DEFAULT NULL,
  `veh_plate` text NOT NULL,
  `veh_inventory` text NOT NULL,
  `veh_type` varchar(1) NOT NULL,
  `veh_status` int(11) NOT NULL DEFAULT 1,
  `veh_details` text DEFAULT NULL,
  `veh_displayname` text DEFAULT NULL,
  `veh_finance` text DEFAULT NULL,
  `veh_garage` varchar(50) DEFAULT '0'
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
  `war_date` int(99) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fsn_whitelists`
--

CREATE TABLE `fsn_whitelists` (
  `wl_id` int(11) NOT NULL,
  `wl_title` text NOT NULL,
  `wl_owner` int(11) NOT NULL,
  `wl_access` text NOT NULL,
  `wl_bank` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fsn_apartments`
--
ALTER TABLE `fsn_apartments`
  ADD PRIMARY KEY (`apt_id`);

--
-- Indexes for table `fsn_bans`
--
ALTER TABLE `fsn_bans`
  ADD PRIMARY KEY (`ban_identifier`);

--
-- Indexes for table `fsn_characters`
--
ALTER TABLE `fsn_characters`
  ADD PRIMARY KEY (`char_id`),
  ADD KEY `char_id` (`char_id`);

--
-- Indexes for table `fsn_properties`
--
ALTER TABLE `fsn_properties`
  ADD PRIMARY KEY (`property_id`);

--
-- Indexes for table `fsn_storageboxes`
--
ALTER TABLE `fsn_storageboxes`
  ADD PRIMARY KEY (`sbox_id`);

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
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `user_id_2` (`user_id`);

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
-- Indexes for table `fsn_whitelists`
--
ALTER TABLE `fsn_whitelists`
  ADD PRIMARY KEY (`wl_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `fsn_apartments`
--
ALTER TABLE `fsn_apartments`
  MODIFY `apt_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fsn_characters`
--
ALTER TABLE `fsn_characters`
  MODIFY `char_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fsn_properties`
--
ALTER TABLE `fsn_properties`
  MODIFY `property_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fsn_storageboxes`
--
ALTER TABLE `fsn_storageboxes`
  MODIFY `sbox_id` int(11) NOT NULL AUTO_INCREMENT;

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

--
-- AUTO_INCREMENT for table `fsn_whitelists`
--
ALTER TABLE `fsn_whitelists`
  MODIFY `wl_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
