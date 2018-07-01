-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 01, 2018 at 06:23 PM
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

--
-- Dumping data for table `fsn_characters`
--

INSERT INTO `fsn_characters` (`char_id`, `steamid`, `char_fname`, `char_lname`, `char_dob`, `char_desc`, `char_twituname`, `char_licenses`, `char_phone`, `char_contacts`, `char_jailtime`, `char_money`, `char_bank`, `char_model`, `mdl_extras`, `char_inventory`, `char_weapons`, `char_police`, `char_ems`) VALUES
(1, 'steam:11000010e0828a9', 'Logan', 'Whitehead', '06/14/1998', 'character creation is complete ass', 'TopShagger', '{\"driver\":{\"type\":\"driver\",\"date\":21119117,\"infractions\":0,\"status\":\"ACTIVE\"}}', 964338, '[]', 0, 0, 4157340, '1939545845', '[{\"index\":0,\"name\":\"head\",\"type\":\"drawable\",\"pallette\":0,\"texture\":0,\"drawable\":1},{\"index\":1,\"name\":\"beard\",\"type\":\"drawable\",\"pallette\":0,\"texture\":0,\"drawable\":0},{\"index\":2,\"name\":\"hair\",\"type\":\"drawable\",\"pallette\":0,\"texture\":0,\"drawable\":0},{\"index\":3,\"name\":\"torso\",\"type\":\"drawable\",\"pallette\":0,\"texture\":0,\"drawable\":1},{\"index\":4,\"name\":\"legs\",\"type\":\"drawable\",\"pallette\":0,\"texture\":0,\"drawable\":0},{\"index\":5,\"name\":\"hands\",\"type\":\"drawable\",\"pallette\":0,\"texture\":0,\"drawable\":0},{\"index\":6,\"name\":\"feet\",\"type\":\"drawable\",\"pallette\":0,\"texture\":0,\"drawable\":0},{\"index\":7,\"name\":\"necklace\",\"type\":\"drawable\",\"pallette\":0,\"texture\":0,\"drawable\":0},{\"index\":8,\"name\":\"accessories1\",\"type\":\"drawable\",\"pallette\":0,\"texture\":0,\"drawable\":0},{\"index\":9,\"name\":\"accessories2\",\"type\":\"drawable\",\"pallette\":0,\"texture\":0,\"drawable\":0},{\"index\":10,\"name\":\"decals/mask\",\"type\":\"drawable\",\"pallette\":0,\"texture\":0,\"drawable\":0},{\"index\":11,\"name\":\"torso2\",\"type\":\"drawable\",\"pallette\":0,\"texture\":0,\"drawable\":0},{\"index\":0,\"name\":\"helmet\",\"type\":\"prop\",\"texture\":0,\"prop\":0},{\"index\":1,\"name\":\"glasses\",\"type\":\"prop\",\"texture\":-1,\"prop\":-1},{\"index\":3,\"name\":\"ear accessories\",\"type\":\"prop\",\"texture\":-1,\"prop\":-1}]', '{\"phone\":{\"amount\":1,\"display_name\":\"Phone\"}}', '[{\"ammo\":0,\"weaponHash\":\"WEAPON_KNIFE\"},{\"ammo\":0,\"weaponHash\":\"WEAPON_NIGHTSTICK\"},{\"ammo\":244,\"weaponHash\":\"WEAPON_COMBATPISTOL\"},{\"ammo\":204,\"weaponHash\":\"WEAPON_ASSAULTRIFLE\"},{\"ammo\":246,\"weaponHash\":\"WEAPON_PUMPSHOTGUN\"},{\"ammo\":250,\"weaponHash\":\"WEAPON_STUNGUN\"},{\"ammo\":1001,\"weaponHash\":\"WEAPON_FIREEXTINGUISHER\"},{\"ammo\":25,\"weaponHash\":\"WEAPON_FLARE\"}]', 69, 0),
(3, 'steam:11000011098d978', 'Finn', 'Misteke', '01/04/1999', 'James is a sexy ass motherfucker and he is now my new religion', 'FinnMistake', '{\"driver\":{\"infractions\":200,\"type\":\"driver\",\"status\":\"SUSPENDED\",\"date\":408624609}}', -1, '', 0, -4539, 7900, '1885233650', '[{\"name\":\"head\",\"texture\":0,\"index\":0,\"pallette\":0,\"drawable\":0,\"type\":\"drawable\"},{\"name\":\"beard\",\"texture\":0,\"index\":1,\"pallette\":0,\"drawable\":0,\"type\":\"drawable\"},{\"name\":\"hair\",\"texture\":4,\"index\":2,\"pallette\":4,\"drawable\":11,\"type\":\"drawable\"},{\"name\":\"torso\",\"texture\":0,\"index\":3,\"pallette\":0,\"drawable\":17,\"type\":\"drawable\"},{\"name\":\"legs\",\"texture\":0,\"index\":4,\"pallette\":0,\"drawable\":24,\"type\":\"drawable\"},{\"name\":\"hands\",\"texture\":0,\"index\":5,\"pallette\":0,\"drawable\":0,\"type\":\"drawable\"},{\"name\":\"feet\",\"texture\":1,\"index\":6,\"pallette\":1,\"drawable\":22,\"type\":\"drawable\"},{\"name\":\"necklace\",\"texture\":0,\"index\":7,\"pallette\":0,\"drawable\":19,\"type\":\"drawable\"},{\"name\":\"accessories1\",\"texture\":0,\"index\":8,\"pallette\":0,\"drawable\":31,\"type\":\"drawable\"},{\"name\":\"accessories2\",\"texture\":0,\"index\":9,\"pallette\":0,\"drawable\":0,\"type\":\"drawable\"},{\"name\":\"decals/mask\",\"texture\":0,\"index\":10,\"pallette\":0,\"drawable\":32,\"type\":\"drawable\"},{\"name\":\"torso2\",\"texture\":0,\"index\":11,\"pallette\":0,\"drawable\":29,\"type\":\"drawable\"},{\"name\":\"helmet\",\"index\":0,\"prop\":-1,\"texture\":-1,\"type\":\"prop\"},{\"name\":\"glasses\",\"index\":1,\"prop\":-1,\"texture\":-1,\"type\":\"prop\"},{\"name\":\"ear accessories\",\"index\":3,\"prop\":-1,\"texture\":-1,\"type\":\"prop\"}]', '{\"lockpick\":{\"display_name\":\"Lockpick\",\"amount\":4}}', '[{\"ammo\":0,\"weaponHash\":\"WEAPON_KNIFE\"},{\"ammo\":0,\"weaponHash\":\"WEAPON_NIGHTSTICK\"},{\"ammo\":250,\"weaponHash\":\"WEAPON_COMBATPISTOL\"},{\"ammo\":250,\"weaponHash\":\"WEAPON_ASSAULTRIFLE\"},{\"ammo\":250,\"weaponHash\":\"WEAPON_PUMPSHOTGUN\"},{\"ammo\":250,\"weaponHash\":\"WEAPON_STUNGUN\"},{\"ammo\":2000,\"weaponHash\":\"WEAPON_FIREEXTINGUISHER\"},{\"ammo\":25,\"weaponHash\":\"WEAPON_FLARE\"}]', 69, 0),
(9, 'steam:11000010e0828a9', 'Pablo', 'Jaegar', '01/21/1994', '', 'notset', '', -1, '', 0, 500, 5000, '-1044093321', '[{\"index\":0,\"drawable\":0,\"type\":\"drawable\",\"texture\":0,\"pallette\":0,\"name\":\"head\"},{\"index\":1,\"drawable\":0,\"type\":\"drawable\",\"texture\":0,\"pallette\":0,\"name\":\"beard\"},{\"index\":2,\"drawable\":0,\"type\":\"drawable\",\"texture\":0,\"pallette\":0,\"name\":\"hair\"},{\"index\":3,\"drawable\":0,\"type\":\"drawable\",\"texture\":0,\"pallette\":0,\"name\":\"torso\"},{\"index\":4,\"drawable\":0,\"type\":\"drawable\",\"texture\":0,\"pallette\":0,\"name\":\"legs\"},{\"index\":5,\"drawable\":0,\"type\":\"drawable\",\"texture\":0,\"pallette\":0,\"name\":\"hands\"},{\"index\":6,\"drawable\":0,\"type\":\"drawable\",\"texture\":0,\"pallette\":0,\"name\":\"feet\"},{\"index\":7,\"drawable\":0,\"type\":\"drawable\",\"texture\":0,\"pallette\":0,\"name\":\"necklace\"},{\"index\":8,\"drawable\":0,\"type\":\"drawable\",\"texture\":0,\"pallette\":0,\"name\":\"accessories1\"},{\"index\":9,\"drawable\":0,\"type\":\"drawable\",\"texture\":0,\"pallette\":0,\"name\":\"accessories2\"},{\"index\":10,\"drawable\":0,\"type\":\"drawable\",\"texture\":0,\"pallette\":0,\"name\":\"decals/mask\"},{\"index\":11,\"drawable\":0,\"type\":\"drawable\",\"texture\":0,\"pallette\":0,\"name\":\"torso2\"},{\"prop\":-1,\"index\":0,\"texture\":-1,\"type\":\"prop\",\"name\":\"helmet\"},{\"prop\":-1,\"index\":1,\"texture\":-1,\"type\":\"prop\",\"name\":\"glasses\"},{\"prop\":-1,\"index\":3,\"texture\":-1,\"type\":\"prop\",\"name\":\"ear accessories\"}]', '[]', '[]', 0, 0),
(100000, 'steam:11000010e0828a9', 'ass', 'ass', 'ass', '', 'notset', '', -1, '', 0, 0, -5000, '1885233650', '[{\"name\":\"head\",\"type\":\"drawable\",\"index\":0,\"texture\":0,\"pallette\":0,\"drawable\":22},{\"name\":\"beard\",\"type\":\"drawable\",\"index\":1,\"texture\":1,\"pallette\":0,\"drawable\":14},{\"name\":\"hair\",\"type\":\"drawable\",\"index\":2,\"texture\":0,\"pallette\":0,\"drawable\":57},{\"name\":\"torso\",\"type\":\"drawable\",\"index\":3,\"texture\":1,\"pallette\":0,\"drawable\":55},{\"name\":\"legs\",\"type\":\"drawable\",\"index\":4,\"texture\":3,\"pallette\":0,\"drawable\":40},{\"name\":\"hands\",\"type\":\"drawable\",\"index\":5,\"texture\":9,\"pallette\":0,\"drawable\":55},{\"name\":\"feet\",\"type\":\"drawable\",\"index\":6,\"texture\":2,\"pallette\":0,\"drawable\":20},{\"name\":\"necklace\",\"type\":\"drawable\",\"index\":7,\"texture\":2,\"pallette\":0,\"drawable\":23},{\"name\":\"accessories1\",\"type\":\"drawable\",\"index\":8,\"texture\":14,\"pallette\":0,\"drawable\":86},{\"name\":\"accessories2\",\"type\":\"drawable\",\"index\":9,\"texture\":4,\"pallette\":0,\"drawable\":22},{\"name\":\"decals/mask\",\"type\":\"drawable\",\"index\":10,\"texture\":0,\"pallette\":0,\"drawable\":44},{\"name\":\"torso2\",\"type\":\"drawable\",\"index\":11,\"texture\":5,\"pallette\":0,\"drawable\":87},{\"name\":\"helmet\",\"type\":\"prop\",\"index\":0,\"texture\":-1,\"prop\":-1},{\"name\":\"glasses\",\"type\":\"prop\",\"index\":1,\"texture\":-1,\"prop\":-1},{\"name\":\"ear accessories\",\"type\":\"prop\",\"index\":3,\"texture\":-1,\"prop\":-1}]', '[]', '[]', 0, 0),
(100001, 'license:882f5e7834e430fb26f844aea7d091ccfdf75f54', 'Alex', 'Misteke', '10/18/1995', '', 'AlexWasAMistake', '', -1, '', 0, 500, 5000, '1885233650', '[{\"texture\":0,\"pallette\":0,\"index\":0,\"type\":\"drawable\",\"name\":\"head\",\"drawable\":2},{\"texture\":0,\"pallette\":2,\"index\":1,\"type\":\"drawable\",\"name\":\"beard\",\"drawable\":0},{\"texture\":4,\"pallette\":2,\"index\":2,\"type\":\"drawable\",\"name\":\"hair\",\"drawable\":4},{\"texture\":0,\"pallette\":0,\"index\":3,\"type\":\"drawable\",\"name\":\"torso\",\"drawable\":51},{\"texture\":13,\"pallette\":13,\"index\":4,\"type\":\"drawable\",\"name\":\"legs\",\"drawable\":3},{\"texture\":0,\"pallette\":2,\"index\":5,\"type\":\"drawable\",\"name\":\"hands\",\"drawable\":0},{\"texture\":0,\"pallette\":1,\"index\":6,\"type\":\"drawable\",\"name\":\"feet\",\"drawable\":0},{\"texture\":2,\"pallette\":2,\"index\":7,\"type\":\"drawable\",\"name\":\"necklace\",\"drawable\":37},{\"texture\":0,\"pallette\":1,\"index\":8,\"type\":\"drawable\",\"name\":\"accessories1\",\"drawable\":0},{\"texture\":3,\"pallette\":3,\"index\":9,\"type\":\"drawable\",\"name\":\"accessories2\",\"drawable\":9},{\"texture\":3,\"pallette\":3,\"index\":10,\"type\":\"drawable\",\"name\":\"decals/mask\",\"drawable\":45},{\"texture\":4,\"pallette\":4,\"index\":11,\"type\":\"drawable\",\"name\":\"torso2\",\"drawable\":8},{\"texture\":-1,\"index\":0,\"type\":\"prop\",\"name\":\"helmet\",\"prop\":-1},{\"texture\":-1,\"index\":1,\"type\":\"prop\",\"name\":\"glasses\",\"prop\":-1},{\"texture\":-1,\"index\":3,\"type\":\"prop\",\"name\":\"ear accessories\",\"prop\":-1}]', '[]', '[{\"weaponHash\":\"WEAPON_KNIFE\",\"ammo\":0},{\"weaponHash\":\"WEAPON_NIGHTSTICK\",\"ammo\":0},{\"weaponHash\":\"WEAPON_PISTOL\",\"ammo\":2},{\"weaponHash\":\"WEAPON_COMBATPISTOL\",\"ammo\":2},{\"weaponHash\":\"WEAPON_ASSAULTRIFLE\",\"ammo\":2},{\"weaponHash\":\"WEAPON_PUMPSHOTGUN\",\"ammo\":2},{\"weaponHash\":\"WEAPON_STUNGUN\",\"ammo\":2},{\"weaponHash\":\"WEAPON_FIREEXTINGUISHER\",\"ammo\":2},{\"weaponHash\":\"WEAPON_FLARE\",\"ammo\":2}]', 8008135, 0),
(100002, 'steam:110000106f35cce', 'Nick', 'Bloggs', '08/08/08', '', 'ShittyNicky', '', -1, '', 0, 500, 5000, '1885233650', '[]', '[]', '[]', 0, 0),
(100003, 'steam:110000109927e1f', 'Pablo', 'Louis', '07/15/2000', 'Criminal', 'notset', '', -1, '', 0, 500, 5000, '1885233650', '[{\"type\":\"drawable\",\"index\":0,\"texture\":0,\"drawable\":34,\"pallette\":0,\"name\":\"head\"},{\"type\":\"drawable\",\"index\":1,\"texture\":0,\"drawable\":60,\"pallette\":0,\"name\":\"beard\"},{\"type\":\"drawable\",\"index\":2,\"texture\":1,\"drawable\":21,\"pallette\":0,\"name\":\"hair\"},{\"type\":\"drawable\",\"index\":3,\"texture\":1,\"drawable\":89,\"pallette\":0,\"name\":\"torso\"},{\"type\":\"drawable\",\"index\":4,\"texture\":15,\"drawable\":3,\"pallette\":0,\"name\":\"legs\"},{\"type\":\"drawable\",\"index\":5,\"texture\":9,\"drawable\":67,\"pallette\":0,\"name\":\"hands\"},{\"type\":\"drawable\",\"index\":6,\"texture\":8,\"drawable\":40,\"pallette\":0,\"name\":\"feet\"},{\"type\":\"drawable\",\"index\":7,\"texture\":4,\"drawable\":4,\"pallette\":0,\"name\":\"necklace\"},{\"type\":\"drawable\",\"index\":8,\"texture\":12,\"drawable\":26,\"pallette\":0,\"name\":\"accessories1\"},{\"type\":\"drawable\",\"index\":9,\"texture\":0,\"drawable\":4,\"pallette\":0,\"name\":\"accessories2\"},{\"type\":\"drawable\",\"index\":10,\"texture\":8,\"drawable\":44,\"pallette\":0,\"name\":\"decals/mask\"},{\"type\":\"drawable\",\"index\":11,\"texture\":9,\"drawable\":6,\"pallette\":0,\"name\":\"torso2\"},{\"type\":\"prop\",\"index\":0,\"texture\":-1,\"prop\":-1,\"name\":\"helmet\"},{\"type\":\"prop\",\"index\":1,\"texture\":-1,\"prop\":-1,\"name\":\"glasses\"},{\"type\":\"prop\",\"index\":3,\"texture\":-1,\"prop\":-1,\"name\":\"ear accessories\"}]', '[]', '[]', 0, 0);

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
  `banned` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fsn_users`
--

INSERT INTO `fsn_users` (`user_id`, `name`, `steamid`, `admin_lvl`, `connections`, `banned`) VALUES
(1, 'jamessc0tt', 'steam:11000010e0828a9', 0, 708, 0),
(2, 'Liquid', 'steam:11000011098d978', 0, 26, 0),
(3, '?????', 'steam:11000011677bf16', 0, 1, 0),
(4, 'alexc', 'license:882f5e7834e430fb26f844aea7d091ccfdf75f54', 0, 2, 0),
(5, 'Swift', 'steam:110000106f35cce', 0, 1, 0),
(6, 'Lucas', 'steam:110000109927e1f', 0, 2, 0),
(7, 'tomci', 'license:8737906e8bc52047d03ef6a0ea85a1496df3686a', 0, 1, 0);

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

--
-- Dumping data for table `fsn_vehicles`
--

INSERT INTO `fsn_vehicles` (`veh_id`, `char_id`, `veh_name`, `veh_hash`, `veh_plate`, `veh_plate_style`, `veh_windows`, `veh_colours`, `veh_wheeltype`, `veh_mods`, `veh_extras`, `veh_inventory`, `veh_fuel`, `veh_health`, `veh_type`, `veh_status`) VALUES
(1, 1, 'SULTAN', '-1216765807', 'METHHEAD', 1, 1, '{\"secondary\":14,\"primary\":5,\"pearltwo\":0,\"pearlone\":0}', 0, '{\"1\":{\"mod\":1},\"2\":{\"mod\":0},\"3\":{\"mod\":-1},\"4\":{\"mod\":0},\"5\":{\"mod\":0},\"6\":{\"mod\":-1},\"7\":{\"mod\":0},\"8\":{\"mod\":-1},\"9\":{\"mod\":-1},\"10\":{\"mod\":0},\"11\":{\"mod\":2},\"12\":{\"mod\":2},\"13\":{\"mod\":2},\"14\":{\"mod\":-1},\"15\":{\"mod\":3},\"16\":{\"mod\":-1},\"18\":{\"mod\":1},\"22\":{\"mod\":1},\"23\":{\"mod\":6},\"24\":{\"mod\":-1},\"0\":{\"mod\":2},\"customtire\":{\"mod\":1}}', '[]', '', 100, 1000, 'c', 0),
(2, 1, 'ADDER', '-1216765807', '88XTU838', 1, 1, '{\"primary\":62,\"secondary\":13,\"pearltwo\":0,\"pearlone\":0}', 0, '{\"1\":{\"mod\":-1},\"2\":{\"mod\":-1},\"3\":{\"mod\":-1},\"4\":{\"mod\":-1},\"5\":{\"mod\":-1},\"6\":{\"mod\":-1},\"7\":{\"mod\":-1},\"8\":{\"mod\":-1},\"9\":{\"mod\":-1},\"10\":{\"mod\":-1},\"11\":{\"mod\":2},\"12\":{\"mod\":2},\"13\":{\"mod\":2},\"14\":{\"mod\":-1},\"15\":{\"mod\":-1},\"16\":{\"mod\":-1},\"18\":{\"mod\":1},\"22\":{\"mod\":1},\"23\":{\"mod\":-1},\"24\":{\"mod\":-1},\"0\":{\"mod\":-1},\"customtire\":{\"mod\":false}}', '[]', '', 100, 1000, 'c', 0),
(3, 1, 'BANSHEE', '-1041692462', '61JOP180', 0, 1, '{\"primary\":112,\"pearlone\":0,\"secondary\":0,\"pearltwo\":0}', 0, '{\"1\":{\"mod\":-1},\"2\":{\"mod\":-1},\"3\":{\"mod\":-1},\"4\":{\"mod\":-1},\"5\":{\"mod\":-1},\"6\":{\"mod\":-1},\"7\":{\"mod\":-1},\"8\":{\"mod\":-1},\"9\":{\"mod\":-1},\"10\":{\"mod\":-1},\"11\":{\"mod\":2},\"12\":{\"mod\":2},\"13\":{\"mod\":2},\"14\":{\"mod\":-1},\"15\":{\"mod\":3},\"16\":{\"mod\":-1},\"18\":{\"mod\":1},\"22\":{\"mod\":1},\"23\":{\"mod\":-1},\"24\":{\"mod\":-1},\"0\":{\"mod\":-1},\"customtire\":{\"mod\":false}}', '[]', '', 100, 1000, 'c', 0),
(4, 3, 'F620', '-591610296', '08QAU398', 0, 0, '[]', 0, '[]', '[]', '', 100, 1000, 'c', 0);

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
-- Dumping data for table `fsn_warrants`
--

INSERT INTO `fsn_warrants` (`war_id`, `suspect_name`, `officer_name`, `war_charges`, `war_times`, `war_fine`, `war_desc`, `war_status`, `war_date`) VALUES
(1, 'Logan Whitehead', '', '[1X] Failure to obey a traffic control device', '120', '', 'ran a redlight, put him away', 'active', '2018-06-13 16:26:55');

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
  MODIFY `char_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100004;

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
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `fsn_vehicles`
--
ALTER TABLE `fsn_vehicles`
  MODIFY `veh_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `fsn_warrants`
--
ALTER TABLE `fsn_warrants`
  MODIFY `war_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
