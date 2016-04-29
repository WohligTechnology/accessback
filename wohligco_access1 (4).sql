-- phpMyAdmin SQL Dump
-- version 4.0.10.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 30, 2015 at 09:35 AM
-- Server version: 5.6.21
-- PHP Version: 5.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `wohligco_access1`
--

-- --------------------------------------------------------

--
-- Table structure for table `about`
--

CREATE TABLE IF NOT EXISTS `about` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `order` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `about`
--

INSERT INTO `about` (`id`, `image`, `title`, `order`, `status`) VALUES
(1, 'Abhishek_Bachan.jpeg', 'Mr. Abhishek Bachan', 1, 1),
(2, 'Adesh_Srivastava.jpeg', 'Mr. Adesh Srivastava', 2, 1),
(3, 'Aftab_Shivdasani.jpeg', 'Mr. Aftab Shivdasani', 3, 1),
(4, 'Asha_Bosle.jpeg', 'Ms. Asha Bosle', 4, 1),
(5, 'Bipasha_Basu.JPG', 'Ms. Bipasha Basu', 5, 1),
(6, 'Jay_Bhanushali.JPG', 'Mr. Jay Bhanushali', 6, 1),
(7, 'Karishma_Kapoor.jpg', 'Ms. Karishma Kapoor', 7, 1),
(8, 'MSG1.JPG', 'Mr. Gurmeet Ram Rahim Singh Ji', 8, 1),
(9, 'Murali_Kartik.JPG', 'Mr. Murali Kartik', 9, 1),
(10, 'Neil_Nitin_Mukesh.jpeg', 'Mr. Neil Nitin Mukesh', 10, 1),
(11, 'Nicolas_Anelka.JPG', 'Mr. Nicolas Anelka', 11, 1),
(12, 'Pooja_Bhatt.jpeg', 'Ms. Pooja Bhatt', 12, 1),
(13, 'Priya_Dutt.jpeg', 'Ms. Priya Dutt', 13, 1),
(14, 'Ranvir_Shoorey.jpeg', 'Mr. Ranvir Shoorey', 14, 1),
(15, 'Remo_Dsouza.jpeg', 'Mr. Remo D''souza', 15, 1),
(16, 'Ritesh_Genelia_Deshmukh.jpg', 'Mr. & Mrs. Deshmukh', 16, 1),
(17, 'Rohit_Sharma.jpeg', 'Mr. Rohit Sharma', 17, 1),
(18, 'Sharukh_Khan.JPG', 'Mr. Sharukh Khan', 18, 1),
(19, 'Siddhart_Mallya.JPG', 'Mr. Siddhart Mallya', 19, 1),
(20, 'Yusuf_Pathan.JPG', 'Mr. Yusuf Pathan', 20, 1),
(21, 'Amit_Thackeray.JPG', 'Mr. Amit Thackeray', 21, 1),
(22, 'Andy_Bichel.jpeg', 'Mr. Andy Bichel', 22, 1),
(23, 'Purab_Kohli.JPG', 'Mr. Purab Kohli', 23, 1),
(24, 'Ram_Kapoor.JPG', 'Mr. Ram Kapoor', 24, 1),
(25, 'VJ_Andy.JPG', 'VJ Andy', 25, 1);

-- --------------------------------------------------------

--
-- Table structure for table `accesslevel`
--

CREATE TABLE IF NOT EXISTS `accesslevel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `accesslevel`
--

INSERT INTO `accesslevel` (`id`, `name`) VALUES
(1, 'Admin'),
(2, 'Customer'),
(3, 'Wholesaler'),
(4, 'Press');

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE IF NOT EXISTS `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `banner1`
--

CREATE TABLE IF NOT EXISTS `banner1` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `target` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `fromdate` date NOT NULL,
  `todate` date NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `banner2`
--

CREATE TABLE IF NOT EXISTS `banner2` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `target` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `fromdate` date NOT NULL,
  `todate` date NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `banner3`
--

CREATE TABLE IF NOT EXISTS `banner3` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `target` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `fromdate` date NOT NULL,
  `todate` date NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bloggerscorner`
--

CREATE TABLE IF NOT EXISTS `bloggerscorner` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `target` varchar(255) NOT NULL,
  `order` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE IF NOT EXISTS `brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `order` int(11) NOT NULL,
  `logo` varchar(255) CHARACTER SET utf8 NOT NULL,
  `isdistributer` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=87 ;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`id`, `name`, `order`, `logo`, `isdistributer`) VALUES
(2, 'Acmemade', 1, 'acmemade2.jpeg', '0'),
(3, 'Adonit', 2, 'adonit2.png', '0'),
(4, 'Apple', 3, 'apple1.png', '0'),
(5, 'Autodrive', 4, 'autodrive1.png', '1'),
(6, 'B&O', 5, 'bo_play.png', '0'),
(7, 'Beats By Dre', 6, 'Beats-By-Dre.png', '0'),
(8, 'Bee-wi', 7, 'bee-wi.jpg', '0'),
(9, 'Beez', 8, 'beez.jpg', '1'),
(10, 'Belkin', 9, 'belkin.png', '0'),
(11, 'Bling My Thing', 10, 'bling-my-thing1.jpg', '1'),
(12, 'Blueair', 11, 'blueair.png', '1'),
(13, 'BMW', 12, 'BMW.png', '1'),
(14, 'Bose', 13, 'bose.png', '0'),
(15, 'Bowers&Wilkins', 14, 'BowersWilkins.png', '0'),
(16, 'Cadyce', 15, 'cadyce.png', '0'),
(17, 'Crumpler', 16, 'crumpler.png', '1'),
(18, 'Draco Design', 17, 'draco_design.png', '0'),
(19, 'Ed Hardy', 18, 'Ed_hardy_logo.jpg', '1'),
(20, 'Energizer', 19, 'Energizer.jpg', '1'),
(21, 'Essentials', 20, 'essentials.png', '1'),
(23, 'Fiat', 22, 'fiat.jpg', '1'),
(24, 'Go Pro', 23, 'go_pro.png', '0'),
(25, 'GoPole', 24, 'GoPole.png', '0'),
(26, 'Griffin', 25, 'griffin.png', '0'),
(28, 'Hurom', 27, 'hurom.png', '1'),
(29, 'iHealth', 28, 'iHealth.png', '0'),
(30, 'iLuv', 29, 'iluv.png', '1'),
(31, 'Incipio', 30, 'incipio.png', '1'),
(32, 'iris', 31, 'iris.jpg', '0'),
(33, 'iSkin', 32, 'iskin.png', '1'),
(34, 'iWalk', 33, 'iwalk.png', '0'),
(35, 'Jawbone', 34, 'jawbone.png', '0'),
(36, 'Jbl', 35, 'jbl.jpg', '0'),
(37, 'Joby', 36, 'joby.png', '0'),
(38, 'Just Mobile', 37, 'just_mobile.png', '0'),
(39, 'Knog', 38, 'knog.png', '0'),
(40, 'Lamborghini', 39, 'lamborghini.png', '1'),
(41, 'Leatherman', 40, 'leatherman.png', '1'),
(42, 'Ledlenser', 41, 'ledlenser.png', '0'),
(43, 'Lifeproof', 42, 'lifeproof.png', '1'),
(44, 'Logitech', 43, 'logitech.png', '0'),
(45, 'Macmerise', 44, 'macmerise.png', '0'),
(46, 'Marshall', 45, 'marshallheadphones.png', '0'),
(47, 'Mini Cooper', 46, 'mini_cooper.jpg', '1'),
(48, 'Minix', 47, 'minix.png', '0'),
(49, 'Mipow', 48, 'MIPOW.png', '1'),
(50, 'Monster', 49, 'monster_headphones.png', '0'),
(51, 'Mophie', 50, 'mophie.png', '0'),
(52, 'Native Union', 51, 'native_union.png', '1'),
(53, 'Olloclip', 52, 'olloclip.png', '0'),
(54, 'Otterbox', 53, 'otterbox.png', '1'),
(55, 'Parrot', 54, 'parrot.png', '0'),
(56, 'Penpower', 55, 'penpower.jpg', '0'),
(57, 'Plantronics', 56, 'Plantronics(1).jpg', '0'),
(58, 'Portronics', 57, 'portronics.jpg', '0'),
(59, 'Power Traveller', 58, 'power_traveller.jpg', '1'),
(60, 'Psb speakers', 59, 'psb_speakers.png', '0'),
(61, 'Remax', 60, 'remax.png', '0'),
(62, 'Sandisk', 61, 'sandisk.png', '0'),
(63, 'scosche', 62, 'scosche.png', '0'),
(64, 'Shure', 63, 'Shure.png', '0'),
(66, 'Sol Republic', 65, 'sol_republic.png', '0'),
(67, 'Speck', 66, 'speck.png', '0'),
(68, 'Strontium', 67, 'strontium.png', '0'),
(69, 'Switcheasy', 68, 'switcheasy.jpg', '1'),
(70, 'Thule', 69, 'thule.png', '0'),
(71, 'Tucano', 70, 'tucano.png', '1'),
(72, 'UE', 71, 'UE-LOGO.png', '0'),
(73, 'Urbanears', 72, 'urbanears.PNG', '0'),
(74, 'Vorson', 73, 'vorson.png', '1'),
(75, 'Wicked Audio', 74, 'wicked_audio.png', '1'),
(76, 'X-mini', 75, 'x-mini.png', '1'),
(77, 'Xtrememac', 76, 'xtrememac.png', '1'),
(78, 'Zoom', 77, 'zoom.jpg', '0'),
(79, 'Skullcandy', 64, 'skull_candy1.png', '0'),
(81, 'IO Walk', 79, 'io_walk.jpg', '0'),
(82, 'Fitbit', 80, 'fitbit.jpg', '0'),
(84, 'Ferrari', 0, '', ''),
(85, 'Guess', 0, '', ''),
(86, 'Mini', 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `parent` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  `image1` varchar(255) CHARACTER SET utf8 NOT NULL,
  `image2` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=38 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `parent`, `status`, `order`, `image1`, `image2`) VALUES
(3, 'Earphones & Headphones', 0, 0, 0, '3.png', ''),
(4, 'Wireless Headphones', 3, 0, 0, '', ''),
(5, 'Speakers & Docks', 0, 0, 0, '5.png', ''),
(6, 'Bluetooth', 5, 0, 0, '', ''),
(7, 'Headphones', 3, 0, 0, '', ''),
(8, 'Earphones', 3, 0, 0, '', ''),
(9, 'Toys & Games', 10, 1, 0, '', ''),
(10, 'Gadgets', 0, 1, 0, '', ''),
(11, 'Health & Fitness', 10, 1, 0, '', ''),
(12, 'Samsung', 36, 1, 2, '', ''),
(13, 'Others', 1, 1, 3, '', ''),
(14, 'Bags & Sleeves', 0, 1, 0, '', ''),
(15, 'Bags', 14, 1, 1, '', ''),
(16, 'Sleeves', 14, 1, 2, '', ''),
(17, 'Accessories', 0, 1, 0, '', ''),
(18, 'Apple Accessories', 17, 1, 1, '', ''),
(19, 'Go Pro Accessories', 17, 1, 2, '', ''),
(20, 'Power & Cables', 17, 1, 3, '', ''),
(21, 'Adapters', 17, 1, 4, '', ''),
(22, 'Storage Devices', 17, 1, 5, '', ''),
(23, 'Others', 17, 1, 6, '', ''),
(24, 'Portable', 5, 1, 1, '', ''),
(25, 'Airplay', 5, 1, 3, '', ''),
(26, 'Docks', 5, 1, 4, '', ''),
(27, 'Others', 5, 1, 5, '', ''),
(28, 'Recorders', 10, 1, 2, '', ''),
(29, 'Photogrpahy & Creativity', 10, 1, 3, '', ''),
(30, 'Cordless/Landline Phones', 10, 1, 0, '', ''),
(31, 'Printers & Scanners', 10, 1, 0, '', ''),
(36, 'Cases & Protection', 0, 0, 0, '', ''),
(37, 'Apple', 36, 0, 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `categorylog`
--

CREATE TABLE IF NOT EXISTS `categorylog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `action` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=156 ;

--
-- Dumping data for table `categorylog`
--

INSERT INTO `categorylog` (`id`, `user`, `category`, `action`, `timestamp`) VALUES
(1, 1, 18, 'Category Created', '2015-04-17 12:25:47'),
(2, 1, 18, 'Category Edited', '2015-04-17 12:26:12'),
(3, 1, 19, 'Category Created', '2015-04-17 12:40:23'),
(4, 1, 20, 'Category Created', '2015-04-17 13:02:39'),
(5, 1, 21, 'Category Created', '2015-04-17 13:10:33'),
(6, 1, 22, 'Category Created', '2015-04-17 14:03:49'),
(7, 1, 23, 'Category Created', '2015-04-17 14:10:32'),
(8, 1, 17, 'Category Edited', '2015-04-20 09:53:54'),
(9, 1, 17, 'Category Edited', '2015-04-20 09:56:15'),
(10, 1, 24, 'Category Created', '2015-04-27 11:42:25'),
(11, 1, 1, 'Category Edited', '2015-04-27 11:42:45'),
(12, 1, 3, 'Category Edited', '2015-04-27 11:42:58'),
(13, 1, 4, 'Category Edited', '2015-04-27 11:43:13'),
(14, 1, 5, 'Category Edited', '2015-04-27 11:43:24'),
(15, 1, 6, 'Category Edited', '2015-04-27 11:43:34'),
(16, 1, 7, 'Category Edited', '2015-04-27 11:43:48'),
(17, 1, 8, 'Category Edited', '2015-04-27 11:44:00'),
(18, 1, 25, 'Category Created', '2015-04-27 11:45:32'),
(19, 1, 26, 'Category Created', '2015-04-27 11:45:56'),
(20, 1, 27, 'Category Created', '2015-04-27 11:46:10'),
(21, 1, 28, 'Category Created', '2015-04-27 11:46:25'),
(22, 1, 29, 'Category Created', '2015-04-27 11:46:39'),
(23, 1, 7, 'Category Edited', '2015-04-27 11:50:16'),
(24, 1, 8, 'Category Edited', '2015-04-27 11:50:50'),
(25, 1, 17, 'Category Edited', '2015-04-27 11:51:57'),
(26, 1, 9, 'Category Edited', '2015-04-27 11:52:26'),
(27, 1, 10, 'Category Edited', '2015-04-27 11:53:21'),
(28, 1, 11, 'Category Edited', '2015-04-27 11:53:33'),
(29, 1, 24, 'Category Edited', '2015-04-27 11:55:44'),
(30, 1, 15, 'Category Edited', '2015-04-27 11:56:19'),
(31, 1, 16, 'Category Edited', '2015-04-27 11:56:33'),
(32, 1, 30, 'Category Created', '2015-04-27 11:57:49'),
(33, 1, 13, 'Category Edited', '2015-04-27 11:58:55'),
(34, 1, 14, 'Category Edited', '2015-04-27 11:59:11'),
(35, 1, 12, 'Category Edited', '2015-04-27 11:59:57'),
(36, 1, 6, 'Category Edited', '2015-04-27 12:11:30'),
(37, 1, 6, 'Category Edited', '2015-04-27 12:12:26'),
(38, 1, 31, 'Category Created', '2015-05-12 10:33:01'),
(39, 1, 32, 'Category Created', '2015-05-12 10:34:10'),
(40, 1, 10, 'Category Edited', '2015-05-20 13:16:06'),
(41, 1, 28, 'Category Edited', '2015-05-20 13:36:02'),
(42, 1, 10, 'Category Deleted', '2015-05-20 13:36:53'),
(43, 1, 11, 'Category Deleted', '2015-05-20 13:37:51'),
(44, 1, 28, 'Category Deleted', '2015-05-20 13:37:57'),
(45, 1, 28, 'Category Deleted', '2015-05-20 13:38:00'),
(46, 1, 56, 'Category Created', '2015-06-15 06:56:20'),
(47, 1, 57, 'Category Created', '2015-06-16 06:15:25'),
(48, 1, 58, 'Category Created', '2015-06-16 06:15:41'),
(49, 1, 59, 'Category Created', '2015-06-16 06:15:56'),
(50, 1, 60, 'Category Created', '2015-06-16 06:16:13'),
(51, 1, 61, 'Category Created', '2015-06-16 06:16:53'),
(52, 1, 62, 'Category Created', '2015-06-16 06:17:11'),
(53, 1, 61, 'Category Edited', '2015-07-02 11:15:33'),
(54, 1, 43, 'Category Deleted', '2015-07-03 07:11:44'),
(55, 1, 66, 'Category Edited', '2015-07-04 10:27:25'),
(56, 1, 76, 'Category Edited', '2015-07-04 10:28:46'),
(57, 1, 66, 'Category Edited', '2015-07-04 10:30:13'),
(58, 1, 66, 'Category Edited', '2015-07-04 10:30:44'),
(59, 1, 78, 'Category Created', '2015-07-08 09:39:32'),
(60, 1, 79, 'Category Created', '2015-07-08 10:54:20'),
(61, 1, 80, 'Category Created', '2015-07-08 10:54:43'),
(62, 1, 81, 'Category Created', '2015-07-08 10:55:04'),
(63, 1, 82, 'Category Created', '2015-07-08 10:55:26'),
(64, 1, 80, 'Category Edited', '2015-07-09 06:10:07'),
(65, 1, 69, 'Category Edited', '2015-07-09 06:11:14'),
(66, 1, 68, 'Category Edited', '2015-07-09 06:11:17'),
(67, 1, 80, 'Category Edited', '2015-07-09 06:11:20'),
(68, 1, 69, 'Category Edited', '2015-07-09 06:11:42'),
(69, 1, 68, 'Category Edited', '2015-07-09 06:11:45'),
(70, 1, 83, 'Category Created', '2015-08-06 11:25:24'),
(71, 1, 70, 'Category Edited', '2015-08-21 11:22:42'),
(72, 1, 70, 'Category Edited', '2015-08-21 11:23:01'),
(73, 1, 1, 'Category Created', '2015-09-11 12:55:42'),
(74, 1, 2, 'Category Created', '2015-09-11 12:56:21'),
(75, 1, 3, 'Category Created', '2015-09-11 12:56:44'),
(76, 1, 4, 'Category Created', '2015-09-11 12:57:18'),
(77, 1, 5, 'Category Created', '2015-09-11 12:57:37'),
(78, 1, 6, 'Category Created', '2015-09-11 12:58:20'),
(79, 1, 7, 'Category Created', '2015-09-11 12:58:48'),
(80, 1, 8, 'Category Created', '2015-09-11 13:00:30'),
(81, 1, 9, 'Category Created', '2015-09-11 13:00:57'),
(82, 1, 10, 'Category Created', '2015-09-11 13:01:19'),
(83, 1, 11, 'Category Created', '2015-09-11 13:01:53'),
(84, 1, 12, 'Category Created', '2015-09-11 13:02:18'),
(85, 1, 13, 'Category Created', '2015-09-11 13:02:36'),
(86, 1, 14, 'Category Created', '2015-09-11 13:03:06'),
(87, 1, 17, 'Category Created', '2015-09-11 13:05:33'),
(88, 1, 18, 'Category Created', '2015-09-11 13:06:00'),
(89, 1, 21, 'Category Created', '2015-09-11 13:07:02'),
(90, 1, 22, 'Category Created', '2015-09-11 13:07:31'),
(91, 1, 26, 'Category Created', '2015-09-11 13:09:34'),
(92, 1, 27, 'Category Created', '2015-09-11 13:09:59'),
(93, 1, 1, 'Category Edited', '2015-10-06 07:21:02'),
(94, 1, 1, 'Category Created', '2015-10-14 07:33:37'),
(95, 1, 2, 'Category Created', '2015-10-14 07:34:04'),
(96, 1, 3, 'Category Created', '2015-10-14 07:34:27'),
(97, 1, 3, 'Category Edited', '2015-10-14 07:34:45'),
(98, 1, 4, 'Category Created', '2015-10-14 07:35:07'),
(99, 1, 5, 'Category Created', '2015-10-14 07:35:53'),
(100, 1, 6, 'Category Created', '2015-10-14 07:36:21'),
(101, 1, 7, 'Category Created', '2015-10-14 07:37:50'),
(102, 1, 8, 'Category Created', '2015-10-14 07:38:21'),
(103, 1, 9, 'Category Created', '2015-10-14 07:38:46'),
(104, 1, 10, 'Category Created', '2015-10-14 07:39:09'),
(105, 1, 10, 'Category Edited', '2015-10-14 07:39:23'),
(106, 1, 11, 'Category Created', '2015-10-14 07:40:10'),
(107, 1, 12, 'Category Created', '2015-10-14 07:43:28'),
(108, 1, 13, 'Category Created', '2015-10-14 07:44:45'),
(109, 1, 14, 'Category Created', '2015-10-14 07:46:03'),
(110, 1, 15, 'Category Created', '2015-10-14 07:46:50'),
(111, 1, 1, 'Category Deleted', '2015-10-26 10:35:47'),
(112, 1, 1, 'Category Deleted', '2015-10-26 10:35:48'),
(113, 1, 2, 'Category Created', '2015-10-26 10:36:54'),
(114, 1, 2, 'Category Edited', '2015-10-26 10:41:43'),
(115, 1, 3, 'Category Edited', '2015-11-03 09:49:06'),
(116, 1, 3, 'Category Edited', '2015-11-03 09:49:15'),
(117, 1, 9, 'Category Created', '2015-11-25 14:47:31'),
(118, 1, 9, 'Category Edited', '2015-11-26 08:18:27'),
(119, 1, 9, 'Category Edited', '2015-11-26 12:01:57'),
(120, 1, 9, 'Category Edited', '2015-11-26 12:02:07'),
(121, 1, 9, 'Category Edited', '2015-11-26 12:03:01'),
(122, 1, 8, 'Category Edited', '2015-11-26 12:03:21'),
(123, 1, 9, 'Category Edited', '2015-11-26 12:03:31'),
(124, 1, 10, 'Category Created', '2015-11-26 12:03:47'),
(125, 1, 9, 'Category Edited', '2015-11-26 12:03:58'),
(126, 1, 10, 'Category Edited', '2015-11-26 12:04:18'),
(127, 1, 10, 'Category Edited', '2015-11-26 12:04:33'),
(128, 1, 9, 'Category Edited', '2015-11-26 12:04:51'),
(129, 1, 10, 'Category Edited', '2015-11-26 12:05:02'),
(130, 1, 11, 'Category Created', '2015-11-26 12:09:22'),
(131, 1, 10, 'Category Edited', '2015-11-26 12:09:59'),
(132, 1, 10, 'Category Edited', '2015-11-26 12:10:34'),
(133, 1, 10, 'Category Edited', '2015-11-26 12:11:17'),
(134, 1, 12, 'Category Created', '2015-11-26 12:22:49'),
(135, 1, 13, 'Category Created', '2015-11-26 12:23:03'),
(136, 1, 14, 'Category Created', '2015-11-26 12:23:57'),
(137, 1, 15, 'Category Created', '2015-11-26 12:24:18'),
(138, 1, 16, 'Category Created', '2015-11-26 12:24:36'),
(139, 1, 17, 'Category Created', '2015-11-26 12:25:10'),
(140, 1, 18, 'Category Created', '2015-11-26 12:25:37'),
(141, 1, 19, 'Category Created', '2015-11-26 12:25:55'),
(142, 1, 20, 'Category Created', '2015-11-26 12:26:13'),
(143, 1, 21, 'Category Created', '2015-11-26 12:26:27'),
(144, 1, 22, 'Category Created', '2015-11-26 12:26:44'),
(145, 1, 23, 'Category Created', '2015-11-26 12:26:59'),
(146, 1, 24, 'Category Created', '2015-11-26 12:27:38'),
(147, 1, 25, 'Category Created', '2015-11-26 12:28:08'),
(148, 1, 26, 'Category Created', '2015-11-26 12:28:24'),
(149, 1, 27, 'Category Created', '2015-11-26 12:28:40'),
(150, 1, 28, 'Category Created', '2015-11-26 12:29:17'),
(151, 1, 29, 'Category Created', '2015-11-26 12:29:34'),
(152, 1, 30, 'Category Created', '2015-11-26 12:30:03'),
(153, 1, 31, 'Category Created', '2015-11-26 12:30:15'),
(154, 1, 25, 'Category Edited', '2015-11-26 15:47:15'),
(155, 1, 12, 'Category Edited', '2015-11-26 15:48:08');

-- --------------------------------------------------------

--
-- Table structure for table `celebcorner`
--

CREATE TABLE IF NOT EXISTS `celebcorner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `target` varchar(255) NOT NULL,
  `order` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ci_sessions`
--

INSERT INTO `ci_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('be30d5e380abb7d9252a4538ae852405', '183.87.173.183', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448510439, ''),
('ddb88037ea816dba72020bc64bbd640a', '183.87.173.183', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448510439, ''),
('a469ddc543eaf3885bf551d9b27a859a', '183.87.173.183', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448510439, ''),
('59828ffaafe83c33c08cd7e868cce909', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448512764, 'a:8:{s:9:"user_data";s:0:"";s:2:"id";s:1:"1";s:5:"email";s:17:"wohlig@wohlig.com";s:4:"name";s:5:"Aditi";s:9:"firstname";s:5:"Aditi";s:8:"lastname";s:5:"Patil";s:11:"accesslevel";s:1:"1";s:9:"logged_in";s:4:"true";}'),
('d2127d587b54b77e957dc4500c7d7840', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448512537, ''),
('f2e19cbbb9826d4c295263144b039333', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448512537, ''),
('d7215425e8c44be781dc4107c63c8774', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448512886, ''),
('1a1c640e32529599a1951de301bc5612', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448525691, 'a:8:{s:9:"user_data";s:0:"";s:2:"id";s:1:"1";s:5:"email";s:17:"wohlig@wohlig.com";s:4:"name";s:5:"Aditi";s:9:"firstname";s:5:"Aditi";s:8:"lastname";s:5:"Patil";s:11:"accesslevel";s:1:"1";s:9:"logged_in";s:4:"true";}'),
('bc81532edb0e820602ebef68975ff0dc', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448514072, ''),
('1f95478d0334e510ebdbc8862f26607e', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448514072, ''),
('1769309486d7db24e59f3995333ea535', '183.87.173.183', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448514827, ''),
('bf9c4b58c3b82b61fcd5d2e0e974821a', '183.87.173.183', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448541673, 'a:8:{s:9:"user_data";s:0:"";s:2:"id";s:1:"1";s:5:"email";s:17:"wohlig@wohlig.com";s:4:"name";s:5:"Aditi";s:9:"firstname";s:5:"Aditi";s:8:"lastname";s:5:"Patil";s:11:"accesslevel";s:1:"1";s:9:"logged_in";s:4:"true";}'),
('3a3ed903c6793d88991a7886ef7c1846', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448515121, ''),
('7c48b44a39a682e56c2b84662d8e0b7a', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448515121, ''),
('496a4366559cc4d72ec848b37fb88988', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448515932, ''),
('0fcdea61665deb0627451d2aaedfdfb5', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448515932, ''),
('a3716d59b425996ffe89b8ac953d84e8', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448516078, ''),
('ea383c46eec938df6984cb9794ac4a72', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448516086, ''),
('efb32902cd0813da030654c271d7ae95', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448516089, ''),
('61727f119be02f400d08002ced527f6a', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448516091, ''),
('fe30ea24424be8ad6f16429f860d9aae', '49.248.89.204', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448522053, 'a:8:{s:9:"user_data";s:0:"";s:2:"id";s:1:"1";s:5:"email";s:17:"wohlig@wohlig.com";s:4:"name";s:5:"Aditi";s:9:"firstname";s:5:"Aditi";s:8:"lastname";s:5:"Patil";s:11:"accesslevel";s:1:"1";s:9:"logged_in";s:4:"true";}'),
('cbed416216f1305876910384862f88c4', '49.248.89.204', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448522069, ''),
('e9385a4d2fab5a312b2cc31cfa9715ee', '49.248.89.204', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448522069, ''),
('c4a72c1d2612f6caf2b5400492a8dead', '49.248.89.204', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448522069, ''),
('6f5981186c735d05dbede32ea74715aa', '49.248.89.204', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448522070, ''),
('645ed43efcc389a96ce21c66b6b34652', '49.248.89.204', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448522070, ''),
('d27cd3c5a474462aa222af2b870ec16d', '49.248.89.204', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448522072, ''),
('b906de2862dedbda262125e6d77f28a1', '49.248.89.204', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448522072, 'a:2:{s:9:"user_data";s:0:"";s:13:"cart_contents";a:3:{s:32:"8b9a93f935dd35335be21bc5027be6e8";a:8:{s:5:"rowid";s:32:"8b9a93f935dd35335be21bc5027be6e8";s:2:"id";s:2:"27";s:4:"name";s:1:"1";s:3:"qty";s:1:"1";s:5:"price";s:4:"1650";s:5:"image";s:50:"Switcheasy_Aero_Apple_iphone_6S_Methyl_Blue_1.jpeg";s:7:"options";a:1:{s:8:"realname";s:64:"Switcheasy Aero Back Case For Apple iphone 6S Plus - Methyl Blue";}s:8:"subtotal";i:1650;}s:11:"total_items";i:1;s:10:"cart_total";i:1650;}}'),
('591f579700ea2e1879da274fead5ce80', '103.16.58.220', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448522342, ''),
('204baebebee6a77b2e2f54f54d9aeaf7', '103.16.58.220', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448522342, ''),
('0b012906e32f1cee068218ea99a4785f', '103.16.58.220', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448522343, ''),
('b1d6dfc870b55b09255d7464ff853bd7', '103.16.58.220', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448522344, ''),
('9cb68fc5f3e20ea03e88de3721d36909', '49.248.89.204', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448524665, ''),
('0e76c16284508ac13f3bbfa41bbd5bd2', '49.248.89.204', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448524665, ''),
('ef02f29bb4d128d702211cc101e76894', '103.16.58.220', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448524679, ''),
('f384f7f64ea44dd8e6b21425aa5d1dee', '103.16.58.220', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448524679, ''),
('225dd920cef8fab9044c4f48aae1fbb2', '103.16.58.220', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448524680, ''),
('9cea789b945ba7c0cf61782ad7170177', '103.16.58.220', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448524680, ''),
('84795ac971732d2dfe175ac7e9b558cc', '103.16.58.220', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448526872, 'a:9:{s:9:"user_data";s:0:"";s:2:"id";s:1:"1";s:5:"email";s:17:"wohlig@wohlig.com";s:4:"name";s:5:"Aditi";s:9:"firstname";s:5:"Aditi";s:8:"lastname";s:5:"Patil";s:11:"accesslevel";s:1:"1";s:9:"logged_in";s:4:"true";s:13:"cart_contents";a:3:{s:32:"53b2206922bebfd367d36513c7f12fa5";a:8:{s:5:"rowid";s:32:"53b2206922bebfd367d36513c7f12fa5";s:2:"id";s:2:"88";s:4:"name";s:1:"1";s:3:"qty";s:1:"1";s:5:"price";s:4:"3000";s:5:"image";s:45:"Guess_GUFLBKP6SAB_Apple_iPhone_6_Black_1.jpeg";s:7:"options";a:1:{s:8:"realname";s:50:"Guess Studded Flip Case For Apple iPhone 6 - Black";}s:8:"subtotal";i:3000;}s:11:"total_items";i:1;s:10:"cart_total";i:3000;}}'),
('06f3edb2d2727887a7066085033530ef', '49.248.89.204', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448525593, ''),
('96f493175b8aea7c1072efff2323fa12', '49.248.89.204', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448525593, ''),
('7663351f6ef3eed5c97d08c055b3bcc8', '49.248.89.204', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448526205, ''),
('b10431a1387d0ee93f8277c66c613460', '49.248.89.204', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448526205, ''),
('4b1f07fc91d1e3cd599465840a552752', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448526379, ''),
('435acfe61fba62caa32f6a52c2cd325a', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448526379, ''),
('30646d8d07b8258f2258aba1927b13d5', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448526379, ''),
('e30b32a44c3771db937b57d523ba803f', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', 1448526410, ''),
('a2da0cb28c5d3902583d07eff14faca8', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', 1448526410, ''),
('e65ec22c6dba1f960b2e27293178d260', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', 1448526410, ''),
('88c4ae38c703d85a025a7b0eef08dca5', '49.248.89.204', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448534578, ''),
('079e3184492ce50a1df09b48e895da46', '49.248.89.204', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448534578, ''),
('a8e625904e4d95ca7dde3fb767874a9b', '49.248.89.204', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448535236, ''),
('de435c866553d9e63036f954ca313d57', '49.248.89.204', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448535236, ''),
('3b33fa6b9ac8f7c8e3e31fc9d8aeb641', '49.248.89.204', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448536067, ''),
('e2244efdc922084258a94d3912e92fbb', '49.248.89.204', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448536067, ''),
('5c466779463d36860c0e90514aaa7d84', '49.248.89.204', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448538603, ''),
('e4d3153831927d9b296c7947cf16cd80', '49.248.89.204', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448538603, ''),
('d1e3bd5924f80c0e08c394e28ea279e1', '49.248.89.204', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448539609, ''),
('8e3830f45cc75e52190c88546eee8470', '49.248.89.204', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448539609, ''),
('3612aa3ce2d974b6bda64dbdf20fffff', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448540009, 'a:8:{s:9:"user_data";s:0:"";s:2:"id";s:1:"1";s:5:"email";s:17:"wohlig@wohlig.com";s:4:"name";s:5:"Aditi";s:9:"firstname";s:5:"Aditi";s:8:"lastname";s:5:"Patil";s:11:"accesslevel";s:1:"1";s:9:"logged_in";s:4:"true";}'),
('76c2247c1ce874044a4c36076d865a96', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448541296, ''),
('d424018f8468b81a29d88af83c870ed6', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448541296, ''),
('8a806ec6b9351ed67e86172e80dc2c8f', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448541297, ''),
('379a3a7b5bb14c2202c9d2b1a2b0aea6', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448541297, ''),
('55beb0b89dbd1b9ab961037c6727de07', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448546731, ''),
('828dc102ce981564a021e7f68a29350a', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448546731, ''),
('350c7f857b58c35bcdf3bd432f953393', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448547142, 'a:9:{s:9:"user_data";s:0:"";s:2:"id";s:1:"1";s:5:"email";s:17:"wohlig@wohlig.com";s:4:"name";s:5:"Aditi";s:9:"firstname";s:5:"Aditi";s:8:"lastname";s:5:"Patil";s:11:"accesslevel";s:1:"1";s:9:"logged_in";s:4:"true";s:13:"cart_contents";a:3:{s:32:"433b548ab657e596f21370a7437fb34a";a:8:{s:5:"rowid";s:32:"433b548ab657e596f21370a7437fb34a";s:2:"id";s:1:"2";s:4:"name";s:1:"1";s:3:"qty";s:1:"1";s:5:"price";s:3:"850";s:5:"image";s:50:"Switcheasy_0.35_Apple_iphone_6S_Frost_White_1.jpeg";s:7:"options";a:1:{s:8:"realname";s:59:"Switcheasy 0.35 Back Case For Apple iphone 6S - Frost White";}s:8:"subtotal";i:850;}s:11:"total_items";i:1;s:10:"cart_total";i:850;}}'),
('858850712383437f186e538c900df12d', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448548446, ''),
('93fce19f855eee44d148d864bc8cf094', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448548446, ''),
('312ebe67128a41ede1d66d9ee2f7062a', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448548482, ''),
('5ff057ad778e6a5421d44580301a33b7', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448549110, ''),
('6b3329c7dadaba7f2fec55a5dd3aa97c', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448549110, ''),
('67b8205b319b685196b0c4d3c02d3c77', '183.87.173.183', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448549763, ''),
('142486cd8ef4d2e937d054ff680ee74f', '183.87.173.183', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448549763, ''),
('d77c6fdbada02b02aaa18750e74d6c18', '183.87.173.183', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448549763, ''),
('d6ee8986bcd14f2eed8da1a856b9a1ab', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448549801, ''),
('763cd2917cec1bf407f8ae6223914d98', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448549801, ''),
('50b3f7e1cb0f55f63ba84282def298f8', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448550403, ''),
('fd9ba65d01c0b2f0e243194edf0f39cf', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448550403, ''),
('8100c0c37dc76296a3688db1932c4953', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448550419, ''),
('c3e82127e349c97a632019aae8927635', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448550427, ''),
('ae2c2203c3be75269e03df41b7c8046d', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448551182, ''),
('cd0afff0bee1c35d0426133398ea700b', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448551182, ''),
('85116cc7e75a10f462b0898928819aac', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448551188, ''),
('976f348b2d8370031186e60ca49a1da1', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448551190, ''),
('ef305cc87af8481a92b78a4295aa9955', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448551312, ''),
('6ed6c077ae0216c1f297328f3ae10e30', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448551312, ''),
('372e064b2b776e2d94d7de61bb9b89db', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448551312, ''),
('bbc1511553aa9499fa2e1395cee54f88', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448551650, ''),
('ee062eebbbeae128c3a6d17c44749779', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448552135, ''),
('a7d3de54200bceb0cbd456ab77406dff', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448552135, ''),
('891eb62033136909ab29ca733f033f73', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448552497, ''),
('e025c964e5bf38726aa1d569a6ecf51d', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448552838, ''),
('4c3af935afa20c0a2e93c236f2a512a2', '1.39.9.119', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) CriOS/46.0.2490.85 Mobile/', 1448552676, ''),
('9eb534428e48b8268dc31396441b1377', '1.39.9.119', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) CriOS/46.0.2490.85 Mobile/', 1448552676, ''),
('f08db25c584aba943da0ef9a9882c5af', '1.39.9.119', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) CriOS/46.0.2490.85 Mobile/', 1448552812, 'a:1:{s:9:"user_data";s:0:"";}'),
('8ba711e2dd92ea94d2f7c982e557f2cc', '1.39.9.119', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) CriOS/46.0.2490.85 Mobile/', 1448552813, ''),
('e996979de5270ae407b9823e625048d7', '1.39.9.119', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) CriOS/46.0.2490.85 Mobile/', 1448552813, ''),
('2077aebca3ef73f779b50d78bbe92561', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448552838, ''),
('d14e62044fcddebdb8a9fb9d43d6baf3', '49.248.94.68', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) CriOS/46.0.2490.85 Mobile/', 1448803444, ''),
('0cf6fec3edb8ea2db11f8d761c8de5eb', '49.248.94.68', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) CriOS/46.0.2490.85 Mobile/', 1448803444, ''),
('5258fb83e90e75b1b12022e4241ecff9', '183.87.172.145', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448858383, ''),
('7033566e725b0878c5c2a240613f3709', '1.39.9.119', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) CriOS/46.0.2490.85 Mobile/', 1448552896, ''),
('17af1351ca9d51e832b852d479976938', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448553014, ''),
('664670620f9890b37201626a06db055c', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448553014, ''),
('c99252b4fa45aa9bed8f30645b199628', '1.39.8.245', 'Mozilla/5.0 (Linux; Android 5.1.1; A0001 Build/LMY48B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.76 Mobile', 1448556743, ''),
('cd6fad12836930b6af06fa46fc75888e', '1.39.8.245', 'Mozilla/5.0 (Linux; Android 5.1.1; A0001 Build/LMY48B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.76 Mobile', 1448556743, ''),
('d09711be35d56d1609db2835de936441', '1.39.8.245', 'Mozilla/5.0 (Linux; Android 5.1.1; A0001 Build/LMY48B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.76 Mobile', 1448556743, ''),
('a29a988cbbaf2b8c328a8fad39665fe5', '1.39.8.245', 'Mozilla/5.0 (Linux; Android 5.1.1; A0001 Build/LMY48B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.76 Mobile', 1448556773, ''),
('b837fddf5d4b13ab2f08f320851f772d', '1.39.8.245', 'Mozilla/5.0 (Linux; Android 5.1.1; A0001 Build/LMY48B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.76 Mobile', 1448556792, ''),
('1ad1ad9b8fb0302335d5d7d9f33cf287', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448557081, ''),
('8e9e678b44398eddda4198726f1df2e0', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448557081, ''),
('7d1fe2a807bdce4a21fb5cdda111748f', '27.106.115.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143', 1448557407, ''),
('579e8db955a2881d9de021db39799bad', '27.106.115.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143', 1448557407, ''),
('c1d56c8d8c56956a9260d50e83ec2f5d', '27.106.115.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143', 1448557407, ''),
('473bfb56f8b1a4cad8605c987b177bf4', '27.106.115.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143', 1448557409, ''),
('1d37414a0281d08b439f6b69cc863eac', '27.106.115.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143', 1448557410, ''),
('05387b16e08f1ad09241eddce107cda8', '27.106.115.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143', 1448557411, ''),
('7970ab9b163a3bb5701de56674fa4761', '27.106.115.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143', 1448557415, ''),
('88a17c430a279853fd5c60df9dca502f', '27.106.115.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143', 1448557456, ''),
('b6aeb79b8d81b6a2742dd78085a89938', '27.106.115.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143', 1448557457, ''),
('0f5ffdd311525f4b6da20191d5e61803', '27.106.115.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143', 1448557457, ''),
('de88ae977a484f86d35529e193d60e87', '27.106.115.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143', 1448557457, ''),
('7cd6d5bc3e2f6e40a740094f109dc67c', '27.106.115.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143', 1448557467, ''),
('6f223a87611606ea5afb32d425d5909f', '27.106.115.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143', 1448557467, ''),
('c781d5cfbbdecda63982b92a700095c0', '27.106.115.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143', 1448557467, ''),
('778e6344e460cbb8992dadeb808e9005', '27.106.115.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143', 1448557467, ''),
('c6ed232b5cb043a6c3560d84e3ffda7e', '27.106.115.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143', 1448557468, ''),
('22f39cc8e0638b26c8c9fe2da57d165f', '27.106.115.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143', 1448557468, ''),
('fdda5bd59b90b0850d5050e3fd9612d3', '27.106.115.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143', 1448557479, ''),
('92fd74f775add9c900a44f3d22abe522', '45.125.152.148', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143', 1448562722, ''),
('ea39d40ecea74531a669c4c0903280df', '45.125.152.148', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143', 1448562722, ''),
('e04f726a453ec4f466936d2fd0dc5997', '45.125.152.148', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143', 1448562722, ''),
('cf264e2b5672f543f8969360eff121d5', '45.125.152.148', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143', 1448562722, 'a:2:{s:9:"user_data";s:0:"";s:13:"cart_contents";a:3:{s:32:"d43a8e755a4465b2668656e7cf36bafb";a:8:{s:5:"rowid";s:32:"d43a8e755a4465b2668656e7cf36bafb";s:2:"id";s:1:"6";s:4:"name";s:1:"1";s:3:"qty";s:1:"1";s:5:"price";s:4:"1000";s:5:"image";s:43:"Switcheasy_0.35_Apple_iphone_6S_Pink_1.jpeg";s:7:"options";a:1:{s:8:"realname";s:57:"Switcheasy 0.35 Back Case For Apple iphone 6S Plus - Pink";}s:8:"subtotal";i:1000;}s:11:"total_items";i:1;s:10:"cart_total";i:1000;}}'),
('5f52af3edb2cdd43653cce79341804fe', '45.125.152.148', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143', 1448562723, ''),
('5f12077837422031e8bc6431c3535b8c', '45.125.152.148', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143', 1448562734, ''),
('9af77bc2eaca7572a85e0e3fede1c3e1', '45.125.152.148', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143', 1448562757, ''),
('f770cced27a0ca5fa6a0c13656d0281e', '66.249.85.133', 'Google favicon', 1448598409, ''),
('e9eb534cbf81396c68e3f3048cb1235d', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448599425, ''),
('f2df1f72362a5f1d47e60ee9d539a6d1', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448599425, ''),
('1045e5bce3ae715ec85320ceabf80614', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448599720, ''),
('fac0ac3b1d41c37ea6dd028ce161dc28', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448599725, ''),
('11ce33b53f7940266cae4c5b8f8589dd', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448600035, ''),
('a58e346007507d00b190afcb1e8b8504', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448600035, ''),
('ce1463b0f42e049e352367d4b470ae4f', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448600207, ''),
('0bedf8e011b2425b65e9dc4817c34fdb', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448600207, ''),
('13b5b99cde387297d6e66d2f0e26837a', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448602530, ''),
('0be9260eaed196437e50d00d946f8fed', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448602530, ''),
('db341eaf7c428ab90e297253398da805', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448602691, ''),
('db07c536b34255b1bf3aff22240bb8cf', '183.87.173.183', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448603953, ''),
('2032187de089194e473c7259b9643245', '183.87.173.183', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448603953, ''),
('94f2cccc463942726c0f2cfa5eba5563', '183.87.173.183', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448603953, ''),
('96eeed6f96d2547b4022224150fef76e', '49.248.94.51', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448605312, ''),
('d92971ab52ebac7f6df9700db8f954b7', '49.248.94.51', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448605312, ''),
('828885e817689aed97c34dc5896d919c', '49.248.94.51', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448605343, ''),
('1231024ad19574eb4961e4770ce1327b', '49.248.94.51', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448605351, ''),
('d52e79871587f302828a83168b6b161d', '49.248.94.51', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448605795, ''),
('732ed006409d95b57e5d5880dbbde6a4', '49.248.94.51', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448605935, ''),
('3eaa353f313460c50aa805c13d2df5b4', '49.248.94.51', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448605935, ''),
('4d23f7cff5fd35524511869c8bc0ddf2', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448605939, ''),
('b64ff22ecd087733b2f3119870aace13', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448605940, ''),
('88e99d82df31148ea77e6c70a7ff7434', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448605940, ''),
('5c338f4b66d1a8f4b6209ca86183d2a3', '49.248.94.51', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448606057, ''),
('a1af19635439b1fea112f2f079d847bf', '49.248.94.51', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448606064, ''),
('1648f6c5517898188505e017ea9cfc23', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448606096, ''),
('e29c5e8b9682bffc39369a0752bdecb0', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448606106, ''),
('86744cfb430f624accaba819eed4d5a1', '49.248.94.51', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448610509, ''),
('4947cc43831c5cb36d2d64564591fad7', '49.248.94.51', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448610509, ''),
('e46f8ea3d295483ab90bf77f4546b865', '49.248.94.51', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448611038, ''),
('b65864027ec1cc764cbfc20fecfdce9a', '49.248.94.51', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448611038, ''),
('5298830c1d5dcabff517427f473bf4a8', '183.87.173.183', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Cross', 1448611876, ''),
('2d03e1e6d02e732a20e540610eea0eae', '183.87.173.183', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Cross', 1448611876, ''),
('a656f120595608bd0ec8d562d51b598a', '183.87.173.183', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Cross', 1448611876, 'a:2:{s:9:"user_data";s:0:"";s:13:"cart_contents";a:3:{s:32:"8baff451d12ace043a09190cf97ad515";a:8:{s:5:"rowid";s:32:"8baff451d12ace043a09190cf97ad515";s:2:"id";s:2:"64";s:4:"name";s:1:"1";s:3:"qty";s:1:"1";s:5:"price";s:4:"4000";s:5:"image";s:52:"Otterbox_Symmetry_Apple_iPhone_6S_FLORAL_POND_1.jpeg";s:7:"options";a:1:{s:8:"realname";s:61:"Otterbox Symmetry Back Case For Apple iPhone 6S - FLORAL POND";}s:8:"subtotal";i:4000;}s:11:"total_items";i:1;s:10:"cart_total";i:4000;}}'),
('26936470e260af9800ca5883de6c932d', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448615806, ''),
('7fff9d12b30f2c90aa3ee19cc4ef0957', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448615806, ''),
('5fe66ace7ad367f111133f255a899557', '49.248.94.51', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448616602, ''),
('fea706f008302b17aa42c952740f0ca5', '49.248.94.51', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448616603, ''),
('1ea1a0f2ca215c71ed26354246e93c9e', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448617391, ''),
('02a2a3b5ae73be9c27a76fda1a7c0a95', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448617391, ''),
('9bd96089e381bb7e65a4a926829cd2f2', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448619228, ''),
('bf7e1b41e972203788cff93dc0954386', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448619228, ''),
('7a2ac3c04975191308b4df1f45bdb70b', '49.248.94.51', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448623167, ''),
('7abc1ccf6c884ca3865ab39843bd939c', '49.248.94.51', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448623167, ''),
('d24e79819273bfe23f406370c382ffd2', '183.87.173.183', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448625105, ''),
('7f82f24343f7a0187f8c6d1b9506f478', '183.87.173.183', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448625105, ''),
('f44a392819d66eb549c0b9b64130476b', '183.87.173.183', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448625105, ''),
('a5ce76786d7dcccf6b9cf94ce1e9b30d', '183.87.173.183', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448625105, ''),
('74dbbe08bc9cfbe92dc6762d9676428b', '183.87.173.183', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448625105, ''),
('1f7573eb740c83897227404cbb59f995', '49.248.94.51', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448628558, ''),
('e3b93b39463dea6009d54a3bf7e393e6', '49.248.94.51', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448628558, ''),
('2b8704c506e3ea51922e17efb0899c26', '49.248.94.51', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448628564, ''),
('67641f2b78d77884a3a7976cf4d26d33', '49.248.94.51', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448628577, ''),
('10ec38c2b655cdf5bc853ae996bee883', '49.248.94.51', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448628581, ''),
('d7bc17dea9c55dbc18dd56e9b8b4dedc', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448631599, ''),
('75b934fb4dd25cef5506f2c91613f6b6', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448685700, ''),
('9645f82e2ea85353c3672140c5975df8', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448632159, ''),
('3f4a20f473d5d0f9a06f972c797d38ce', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448632159, ''),
('8861f269faae8631142a967bfc00494d', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448632163, ''),
('da8aa4615eead5f0644b4b6f632d9f39', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448632398, ''),
('31dbbf747900800a5a8cbae96b7179be', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448632623, ''),
('f5f1f9deeaecb4477db8926a1c4c528f', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448632623, ''),
('5b5057d01530db5dab63664218d38d9c', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448632634, ''),
('e62456e1350d031aad968e8daf473522', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448633358, ''),
('0a0a5fa270d38de8f753d2fb4ecd426b', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448633358, ''),
('dc3d8ef136ef76d99512febed1bc733e', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448633369, ''),
('7b07601ddd0c267807d4cb20c96c372b', '202.189.232.17', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448634139, ''),
('72e9102f6e87c2a25afebb8065ddd21e', '202.189.232.17', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448634139, ''),
('ee205b717d3e98d50f1ea6e8a77ce226', '202.189.232.17', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448634139, ''),
('0500777b71195b1e68c1c7cc527b8cdc', '202.189.232.17', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448634139, ''),
('02b3b13886c5e6f73dddff4ea422b750', '202.189.232.17', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448634139, ''),
('399c427cec7d33d02d2d7eb55c120aa6', '202.189.232.17', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448634139, 'a:2:{s:9:"user_data";s:0:"";s:13:"cart_contents";a:3:{s:32:"c51d041745adc7dac07bf3d970c2d7c7";a:8:{s:5:"rowid";s:32:"c51d041745adc7dac07bf3d970c2d7c7";s:2:"id";s:1:"1";s:4:"name";s:1:"1";s:3:"qty";s:1:"1";s:5:"price";s:3:"850";s:5:"image";s:43:"Switcheasy_0.35_Apple_iphone_6S_Pink_1.jpeg";s:7:"options";a:1:{s:8:"realname";s:52:"Switcheasy 0.35 Back Case For Apple iphone 6S - Pink";}s:8:"subtotal";i:850;}s:11:"total_items";i:1;s:10:"cart_total";i:850;}}'),
('ae244612cfe553f235056f6ad881b268', '202.189.232.17', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448634167, ''),
('6f911ac30d83d3e51c1b6896f0c3aace', '66.249.84.172', 'Google favicon', 1448634894, ''),
('bf8fc92eccc6f82b13f82a6f4a5e58c5', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448636478, ''),
('6c691e12f1d90e2cf654379102302091', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448636479, ''),
('335ec48a81893510f3f74706c2394623', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448636479, ''),
('7c369f4228b689f058866d2e510bd32d', '1.39.8.172', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143', 1448637954, ''),
('2982f661509a8e1aedb4e4ef315063c5', '1.39.8.172', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143', 1448637954, ''),
('cb1edb0c73d94774a9194dd95e2a605a', '49.248.94.51', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448639052, ''),
('1abde235cc0b16fc93f516b830fae5a3', '49.248.94.51', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448639052, ''),
('b0678af1db24357089d0487ad757db44', '49.248.94.51', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448639557, ''),
('5d89e55582586a2453a26615b63d95e7', '49.248.94.51', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448639570, ''),
('6a4478585523ab3bd49b8bcf8f113315', '49.248.94.51', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448639583, ''),
('6009f2f63564bd41785dfaed7b3dfb9a', '66.249.85.128', 'Google favicon', 1448685136, ''),
('4b0ba5477ec03d559e3b68344e99ef03', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448685537, ''),
('a62597929fcecbb121d0a6d56e26fadd', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448685537, ''),
('929167c46c71934ffadacbb7ff2cc394', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448685586, ''),
('3ca834638fb0a6739e3f7ad2579d3549', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448685700, ''),
('e8302db0b8fac171ea98caab5c6e0301', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448685700, ''),
('840db7ac6f7d353a24bbe5322fcedea6', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448685700, ''),
('ed17f4b108be4f750cf3a44319018e6f', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448685700, ''),
('e6f675bb7b8d72eb0d17057170060eb8', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448685747, ''),
('e0bd1cd18620b2d10e12212205cbcd04', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448685747, ''),
('ded67b80d9fc646105267f3ce913ba2a', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448686419, ''),
('afc35e5275fbc54389dbd20fe9a3f699', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448685748, ''),
('af6022e12b2623387260f7bd09167609', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448686419, ''),
('28f143eebd65bb2667f7bda45216b0bc', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448687020, ''),
('434330ae871056b5a83f3d9d429b61b5', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448687020, ''),
('2c4bfc77ad8d7af09e80e8191adb6282', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448687489, ''),
('8b3bf17b3d81bf459c74853d89ac1b23', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448687489, ''),
('72a6f291100c13d56c22d9a9d528304d', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448687497, ''),
('080ce8748919f9d130f9a5a299e9dba2', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448688118, ''),
('c9299e6a4e4bb20fd064452c98fb3575', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448688118, ''),
('0b01b68bb1be53ada6d53cda11892077', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448688845, ''),
('f243f264acaa9885a4ae4bd9fe6478fa', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448688845, ''),
('cbecdeab1e5cea51917bf2581062d209', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448689330, ''),
('0079ea5c8226def0c40200bba605711c', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448689521, ''),
('44d92cdac3d17058acec2b6f5e1d89fb', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448689521, ''),
('c9f39e92e4a1b35999fe0f3decd2a15a', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448689564, '');
INSERT INTO `ci_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('1a2c6977cfedc32502af8837ba78d84c', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448690180, ''),
('5345ee1b2d7a0f48cf6cc186eab16a8b', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448690180, ''),
('4966ef14aa98a36dd2ec7a96aede4050', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448690180, ''),
('8350818d50187cd0dd7c8f627dd833b3', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448690816, ''),
('3ee67462657ed2d4b34e29868f387c6c', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448690816, ''),
('db83377d52612689173a46b92b0273e8', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448690816, ''),
('d0a4ad57ac2f250016af0290464a8b46', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448691495, ''),
('ef7e48f2c0659cd504c02dec6bb86fcc', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448691495, ''),
('cfa8767aa65e04e4c68d6a690c0d5b82', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448691495, ''),
('5778adcabc07d8b16258bd6f250f6d09', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448692105, ''),
('0a62b75635b0215587dc4db9b9305931', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448692105, ''),
('40c5fd45f4cc4c07afe8131c566ceb0c', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448692105, ''),
('d58e168d29d75b5b21608b70ec1425f9', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448692710, ''),
('04e998e6cb86015d6a75596e63eed50c', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448692710, ''),
('92ede2d6541845dffa037cbdfa439d32', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448692710, ''),
('3d50977cdea0d15ea6ab2915e169e160', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448693526, ''),
('00fa7aa86462ac94b408644aad111d00', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448693526, ''),
('3cfba2438712db6c5bf8a402ac52e5f6', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448693526, ''),
('951828177aa9b90ef7f41d9938f276a0', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448693716, ''),
('9507afa650e9227a3354643c793055d0', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448693716, ''),
('e5e4684fd0f9b48de109b10a089c992e', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448693717, ''),
('9fa87a08776209f6c5aae9c1ff8fa50b', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448693717, ''),
('0cfebb04d82e444e20191491cd58e388', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448693717, ''),
('f7ec5b11f82ec19eafb13c586c49404b', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448693718, ''),
('5ad5e11d47c29118b8900ea69496cff8', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448693718, ''),
('c07067aa1d6d262a8d1c7bb349d69fb5', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448697731, 'a:8:{s:9:"user_data";s:0:"";s:2:"id";s:1:"1";s:5:"email";s:17:"wohlig@wohlig.com";s:4:"name";s:5:"Aditi";s:9:"firstname";s:5:"Aditi";s:8:"lastname";s:5:"Patil";s:11:"accesslevel";s:1:"1";s:9:"logged_in";s:4:"true";}'),
('fba8d4b67f97a3cc61f9367e972c46f2', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448693720, ''),
('ab1069add5da90bd163f9baed62eebb6', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448693721, ''),
('8bda777afdedbab536c2ed30b5fb17db', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448693742, ''),
('7e62a8316f1a824a9ae7b261aa9a2d8f', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448693745, ''),
('2b279ddbe21a571c19f7baa8de2796d8', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448695157, ''),
('6f7eb74e75845e9e1096b463c3ee50fb', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448695157, ''),
('73272ea76cf567e1940a5b753bcd0d87', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448697364, ''),
('53de90a17d670652c0892e023c4e128f', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448697364, ''),
('1bdf0c363b4dbaa8217e1b1de1bab909', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448697389, ''),
('7b7c74335ff63097cb2021bdac21fc74', '49.248.95.11', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448697687, ''),
('f7c9046be7847413b2005537f8224e25', '49.248.95.11', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448697687, ''),
('d91d2a071e2c9ea07d840e41c1dfbf8b', '49.248.95.11', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448697737, ''),
('74705bf8e4e9733a16ef7839a31f227e', '49.248.95.11', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448697737, ''),
('2c854cc7244772d965dd0e000c89936b', '49.248.95.11', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448697780, ''),
('1f8539dbac1433c55eccde059487379f', '49.248.95.11', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448697785, ''),
('f4f7d424347de40c26647a6e615d5d02', '49.248.95.11', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448697797, ''),
('a478562468459d4f824406b38b4239eb', '202.189.232.17', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448698040, ''),
('b58cce3c35eb8e4a3f47a29fac0dc9bb', '202.189.232.17', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448698040, ''),
('68f7e70184153f89a230b553630226d6', '202.189.232.17', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448698058, ''),
('40dec23ae71049227e9bed168c56d0bb', '202.189.232.17', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448698085, ''),
('d0db5a21cc2adbcd5b333956778324f4', '202.189.232.17', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448698138, ''),
('88118a726c347e40376f63b021f5f294', '103.16.58.220', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448698321, ''),
('2e07f05c04ac6d5637c9f922fef81666', '103.16.58.220', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448698322, ''),
('fb814ce5d1ef1553ee48372a2fc52bbc', '103.16.58.220', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448698374, ''),
('d61f8a137356ba2318dc04fb38cb0ee6', '103.16.58.220', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448698637, ''),
('e0b4d8527b26f16222354b2a7fba14e2', '202.189.232.17', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448698690, ''),
('e01f1c11779165b075ba1a0f9c5a5a69', '202.189.232.17', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448698690, ''),
('e097e40d1dd6f0ad2aaabc145943cf5f', '202.189.232.17', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448698694, ''),
('d202acd77a48e6837af9d8ad37959701', '202.189.232.17', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448698694, ''),
('ebc9f5f7fcb990bf14bf0e553957bbe8', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448699920, ''),
('825f478f1430410c770ac2b1935aaf78', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448699920, ''),
('a3650b5c60fd1a2ad49242c5ee9034c4', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448699926, ''),
('30538b322c96aae8136d015ea14e5606', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448699940, ''),
('e58ae5880e9b70e9613d5d0fb04fa462', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448699943, ''),
('0f9c043d59a5bb74e1b532b6c2ab4602', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448699943, ''),
('a5fdcc9599bc7805c6d1dad3eb317fc8', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448699947, ''),
('bbbcfb8b046c45522a0158fa717c55e4', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448700108, ''),
('f27dd40a4dc96eba038d9c0c19df28d4', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448700188, ''),
('8936b605a0c47a938e12985545094294', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448700760, ''),
('943b6ba7c8e2925504bc6392be11e52e', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448700760, ''),
('a979d73326ee79fe7e2c999105617c83', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448700768, ''),
('ad1991334bd2fde38723c3b1369810e5', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448701405, ''),
('c18203743f365a4c61bfb9cae271de13', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448701405, ''),
('a39fa18a3c013513bce03d32abf37fbf', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448701405, ''),
('6256627e4f3847b4207664e176fa534b', '49.248.95.11', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448701889, ''),
('7bbd023f43aac27986f30a2c81cf92d3', '49.248.95.11', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448701889, ''),
('43823e43e62461f5c1287596069fbba3', '49.248.95.11', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448702004, ''),
('f3145ece508cf47100e945c0b83efaaa', '103.16.58.220', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448702006, ''),
('44042ba4e5a89ed42ebacb563da3802e', '103.16.58.220', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448702006, ''),
('ef8d3dc3906a840e21c3555f234c1fbd', '49.248.95.11', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448702013, ''),
('51e1546259aa5f727f81eb980d013a10', '49.248.95.11', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448702039, ''),
('06b05b176a08a6978a9d03afcee3c4aa', '103.16.58.220', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448702122, ''),
('9fe120e49a1ed9bf51864e783a2d922b', '49.248.95.11', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448702862, ''),
('6973965d201e577f3f51082d2785947b', '49.248.95.11', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448702862, ''),
('67a0b22858d216f1776b49d63af5055f', '183.87.173.183', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448703800, ''),
('b95d7e2e6cc1a680255950b346f7c13d', '183.87.172.145', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448704077, ''),
('68ee45f0c3e4c2b55b59bff10a20b012', '183.87.172.145', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448704077, ''),
('2138762a24c8b6048a7d38d3a5868dfb', '183.87.172.145', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448704500, ''),
('29657809dd5bb45e2a8f31795bc17e7c', '66.102.6.215', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Web Preview) Chrome/27.0.1453 Safari/537.3', 1448704937, ''),
('901ed0516440b04501e691d4c4c5d197', '66.102.6.215', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Web Preview) Chrome/27.0.1453 Safari/537.3', 1448704937, ''),
('b1a9ddad272922efeb0085a96e7570d9', '183.87.172.145', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448704973, ''),
('a815c4646932746272a56c21161150f6', '183.87.172.145', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448704973, ''),
('e77634a8abdf283688bd305683a5be20', '183.87.172.145', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448705625, ''),
('f5c4122672d356356a0d944207090ce8', '183.87.172.145', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448705625, ''),
('e08d95662a5f6158720f5ce51e99d84e', '183.87.172.145', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448705849, ''),
('8cc7c8497faae0863df04af69fbe81de', '183.87.172.145', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448707810, ''),
('a29868a4b50ca0fd665beaed1d83b242', '183.87.172.145', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448707810, ''),
('4cea05bb1379dc02b4828306355e1c43', '183.87.172.145', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448709066, ''),
('fad7ba3e7e67e1d4746464f179b9f411', '183.87.172.145', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448709066, ''),
('bbe1e85b2ac65ad38646fa3e1cb62526', '183.87.172.145', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448709270, ''),
('9bf5086a3319e6949ace336a21435552', '183.87.172.145', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448709296, ''),
('601cc30881af06165a60dde8dc8b0e5f', '183.87.172.145', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448709296, ''),
('46b16b0f829829aabb471f786ca3f1cb', '183.87.172.145', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448709327, ''),
('517b7474e1bab11e6f41b30ec734d533', '183.87.172.145', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448709330, ''),
('8c7d1f964d3d6000c7c89a2970e28656', '183.87.172.145', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448709333, ''),
('b04f76407459152ff9816cfe2b83f77c', '183.87.172.145', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448709350, ''),
('c13499f66afbcf648341b63ac4d5d68e', '183.87.172.145', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448709668, ''),
('5d8e02716062abe5c4b13363c339d0bf', '183.87.172.145', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448709668, ''),
('a4ca857b517a39a949a6542ce2d6ddd9', '183.87.172.145', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448709760, ''),
('2a937f04994ddee83741e8a1b80cea69', '183.87.172.145', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448709760, 'a:2:{s:9:"user_data";s:0:"";s:13:"cart_contents";a:3:{s:32:"e15454ef6bb4073e3df57d7c4748b7ac";a:8:{s:5:"rowid";s:32:"e15454ef6bb4073e3df57d7c4748b7ac";s:2:"id";s:2:"36";s:4:"name";s:1:"1";s:3:"qty";s:1:"1";s:5:"price";s:4:"1300";s:5:"image";s:50:"Switcheasy_Nude_Apple_iphone_6S_Transparent_1.jpeg";s:7:"options";a:1:{s:8:"realname";s:59:"Switcheasy Nude Back Case For Apple iphone 6S - Transparent";}s:8:"subtotal";i:1300;}s:11:"total_items";i:1;s:10:"cart_total";i:1300;}}'),
('3ad7932bc5cd387a362fe7130459aec6', '183.87.172.145', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448709760, ''),
('e9fc337ca81a6aa436fa11f37d5b94a5', '183.87.172.145', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448709760, ''),
('fca991d5eab5ba16c03c3a36cf8e7ac5', '183.87.172.145', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448709909, ''),
('5288a2072c3e3b8e572c347a1152a247', '183.87.172.145', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448709958, ''),
('993f32995e96336d4fe33fbeb3702f16', '183.87.172.145', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448709983, ''),
('3b507f616cbfe11351748cad806cd93a', '183.87.172.145', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448709987, ''),
('38736ba148bb55dee2827ff47626eff1', '183.87.172.145', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448710114, ''),
('d069cc2e32dafecb8635a6d3f3b900bd', '183.87.172.145', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448710114, ''),
('1bbe482e306e41aad26d94bab112ae8c', '49.248.95.11', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448716825, ''),
('561d3024bb664084d012149770af671f', '49.248.95.11', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448716825, ''),
('70967c06e5cbc68402ac77b5b79b025c', '49.248.95.11', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448716829, ''),
('700d6a01bd6c8b375b7862433f7ec250', '49.248.95.11', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448716829, ''),
('6450745d326070362faa72f75b28b369', '49.248.95.11', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448720499, ''),
('4986bb24b518545f98e1773448e3c24e', '49.248.95.11', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448720499, ''),
('d978368a4fb710e93adc9d52b7597f5a', '1.39.46.18', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) CriOS/46.0.2490.85 Mobile/', 1448774865, ''),
('915d27a0d499260aff6d5170d7f4112c', '1.39.46.18', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) CriOS/46.0.2490.85 Mobile/', 1448774865, ''),
('21fb657ec6b3b26a1ac54c3ea3057851', '1.39.46.18', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) CriOS/46.0.2490.85 Mobile/', 1448774916, ''),
('a021dbf3077c786f0f1fdc85b283d349', '1.39.46.18', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) CriOS/46.0.2490.85 Mobile/', 1448774950, ''),
('457bcf56eadc9d2e28194630488b2a1d', '183.87.172.145', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448858383, ''),
('53208e1b242c85e989cf00e9b69bc207', '183.87.172.145', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448858383, ''),
('0e8476ce10accf495281b18a53d1b71c', '183.87.172.145', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448858383, ''),
('4956ca5b9144af5ce918ea25b0b90fb1', '66.249.85.128', 'Google favicon', 1448858532, ''),
('d8ceb02b14671d723c8a0753924c5985', '183.87.172.145', 'Mozilla/5.0 (Linux; Android 5.1.1; Nexus 4 Build/LMY48Y) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Cro', 1448864856, ''),
('97336b149eefde60e6a3de9c43364b7c', '183.87.172.145', 'Mozilla/5.0 (Linux; Android 5.1.1; Nexus 4 Build/LMY48Y) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Cro', 1448864856, ''),
('bf9a47c7738f763aa8440d4af1253ad5', '183.87.172.145', 'Mozilla/5.0 (Linux; Android 5.1.1; Nexus 4 Build/LMY48Y) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Cro', 1448864856, ''),
('e184a97e0abf1f71ccf750cb88124378', '183.87.172.145', 'Mozilla/5.0 (Linux; Android 5.1.1; Nexus 4 Build/LMY48Y) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Cro', 1448864856, ''),
('fbb9b8147fd59dce00e867c3375dd8c4', '183.87.172.145', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448865060, ''),
('4f9fc9c2564e89ecd25c34343f848ea8', '183.87.172.145', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448865060, ''),
('4720a62491f8b7a12920637dce0f8176', '183.87.172.145', 'Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_2_1 like Mac OS X; en-us) AppleWebKit/533.17.9 (KHTML, like Gecko) Version/5.0.2', 1448865076, ''),
('79ec1543b11bdf551454b72b942d2c12', '183.87.172.145', 'Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_2_1 like Mac OS X; en-us) AppleWebKit/533.17.9 (KHTML, like Gecko) Version/5.0.2', 1448865076, ''),
('aec1b6172102e1f8cf0a169d2d88be91', '183.87.172.145', 'Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_2_1 like Mac OS X; en-us) AppleWebKit/533.17.9 (KHTML, like Gecko) Version/5.0.2', 1448865076, ''),
('8b8ff1469a268d35a1340d3e89d2861d', '183.87.172.145', 'Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_2_1 like Mac OS X; en-us) AppleWebKit/533.17.9 (KHTML, like Gecko) Version/5.0.2', 1448865076, ''),
('eb0b81173b56b0c9d9c928a44449ebd0', '183.87.172.145', 'Mozilla/5.0 (Linux; Android 5.1.1; Nexus 4 Build/LMY48Y) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Cro', 1448865785, ''),
('9e6d3e6470e3df713bc16a65e9e7b425', '183.87.172.145', 'Mozilla/5.0 (Linux; Android 5.1.1; Nexus 4 Build/LMY48Y) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Cro', 1448865785, ''),
('49c316ce82169ea89ed76e043d7d9de7', '183.87.172.145', 'Mozilla/5.0 (Linux; Android 5.1.1; Nexus 4 Build/LMY48Y) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Cro', 1448865785, ''),
('da444b5b60e072582d7ee14b71e4f423', '183.87.172.145', 'Mozilla/5.0 (Linux; Android 5.1.1; Nexus 4 Build/LMY48Y) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Cro', 1448865785, ''),
('8bf5083dd55aa1cca8fbd81f02db0d66', '183.87.172.145', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448867803, ''),
('3ffef454ed6fd7f4dbd250066c017d44', '183.87.172.145', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448867803, ''),
('5491860de66f65a771131bf009dffeab', '183.87.172.145', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448867803, ''),
('8b5d35e40be9c5e47b90b924d014dfa8', '183.87.172.145', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448867803, ''),
('5b7f1a3d8770bdbdb0674c2f2d96ffab', '183.87.172.145', 'Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_2_1 like Mac OS X; en-us) AppleWebKit/533.17.9 (KHTML, like Gecko) Version/5.0.2', 1448867900, ''),
('d6fc52559bcae7230fe7ff5a1e88fc7e', '103.16.58.220', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448870820, ''),
('5baac5109da0b246d49b2ed65a2f6e43', '103.16.58.220', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448870820, ''),
('73ef7b3d67d87f4947db6594afc295a9', '103.16.58.220', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448870827, ''),
('cd862a93ca530f7749658a1469a10bf8', '183.87.172.145', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448872509, ''),
('049eb8cbcf5d50bba4eecb160a4e6e25', '183.87.172.145', 'Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_2_1 like Mac OS X; en-us) AppleWebKit/533.17.9 (KHTML, like Gecko) Version/5.0.2', 1448872512, ''),
('cd4dadb918f37c314a2b1f24ff142c99', '183.87.172.145', 'Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_2_1 like Mac OS X; en-us) AppleWebKit/533.17.9 (KHTML, like Gecko) Version/5.0.2', 1448872512, ''),
('cf25a2d17bcee0d35068fa0b25724ac7', '183.87.172.145', 'Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_2_1 like Mac OS X; en-us) AppleWebKit/533.17.9 (KHTML, like Gecko) Version/5.0.2', 1448872512, ''),
('90a86f14469e388f1bfa9a68cce0987c', '183.87.172.145', 'Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_2_1 like Mac OS X; en-us) AppleWebKit/533.17.9 (KHTML, like Gecko) Version/5.0.2', 1448872522, ''),
('2dde3e110f219c5798075b92ac0d07f8', '183.87.172.145', 'Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_2_1 like Mac OS X; en-us) AppleWebKit/533.17.9 (KHTML, like Gecko) Version/5.0.2', 1448872531, ''),
('03d421915f95ff367cabadbf7d14009a', '183.87.172.145', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448874532, ''),
('8fe5848395311ff32fa650c837b3fbbd', '183.87.172.145', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448874532, ''),
('c4dddbbdb1f4d0aa89c96eff71bc3942', '183.87.172.145', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448874532, ''),
('2c744df4f89a128281934a073715e175', '183.87.172.145', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448874532, ''),
('7db05c57196d391738dd341d1051ed4e', '183.87.172.145', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448874578, ''),
('4499791046ef082e8f422e62ea20983a', '183.87.172.145', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448874585, ''),
('fce6dc15994ee71e60bd1a3a14a3d9a7', '183.87.172.145', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448874589, ''),
('a0056e0e1ef1fcf72073bdd1e859e153', '183.87.172.145', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448874594, '');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE IF NOT EXISTS `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telephone` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=58 ;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `name`, `email`, `telephone`, `comment`, `timestamp`) VALUES
(55, 'edrtfgyhuj', 'jfhkj@jbdcxh.dgvs', '8545478', 'dghj', '2015-09-09 10:33:21'),
(56, 'cvghbjn', 'gvb@dg.hgh', '365699', 'sredrtg', '2015-09-10 04:54:17'),
(54, 'kuah', 'hsk@krss.lkw', '915151515', 'd,mdnb m', '2015-09-09 10:32:07'),
(53, 'ghj', 'jehf@dbj.ddh', '8558', 'vbnm', '2015-09-09 10:27:52'),
(57, 'fghj', 'jwhekwj@ejjh.fdf', '67898', 'gerkgwyea', '2015-11-17 12:07:04');

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE IF NOT EXISTS `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iso` char(2) NOT NULL,
  `name` varchar(80) NOT NULL,
  `nicename` varchar(80) NOT NULL,
  `iso3` char(3) DEFAULT NULL,
  `numcode` smallint(6) DEFAULT NULL,
  `phonecode` int(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=240 ;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES
(1, 'AF', 'AFGHANISTAN', 'Afghanistan', 'AFG', 4, 93),
(2, 'AL', 'ALBANIA', 'Albania', 'ALB', 8, 355),
(3, 'DZ', 'ALGERIA', 'Algeria', 'DZA', 12, 213),
(4, 'AS', 'AMERICAN SAMOA', 'American Samoa', 'ASM', 16, 1684),
(5, 'AD', 'ANDORRA', 'Andorra', 'AND', 20, 376),
(6, 'AO', 'ANGOLA', 'Angola', 'AGO', 24, 244),
(7, 'AI', 'ANGUILLA', 'Anguilla', 'AIA', 660, 1264),
(8, 'AQ', 'ANTARCTICA', 'Antarctica', NULL, NULL, 0),
(9, 'AG', 'ANTIGUA AND BARBUDA', 'Antigua and Barbuda', 'ATG', 28, 1268),
(10, 'AR', 'ARGENTINA', 'Argentina', 'ARG', 32, 54),
(11, 'AM', 'ARMENIA', 'Armenia', 'ARM', 51, 374),
(12, 'AW', 'ARUBA', 'Aruba', 'ABW', 533, 297),
(13, 'AU', 'AUSTRALIA', 'Australia', 'AUS', 36, 61),
(14, 'AT', 'AUSTRIA', 'Austria', 'AUT', 40, 43),
(15, 'AZ', 'AZERBAIJAN', 'Azerbaijan', 'AZE', 31, 994),
(16, 'BS', 'BAHAMAS', 'Bahamas', 'BHS', 44, 1242),
(17, 'BH', 'BAHRAIN', 'Bahrain', 'BHR', 48, 973),
(18, 'BD', 'BANGLADESH', 'Bangladesh', 'BGD', 50, 880),
(19, 'BB', 'BARBADOS', 'Barbados', 'BRB', 52, 1246),
(20, 'BY', 'BELARUS', 'Belarus', 'BLR', 112, 375),
(21, 'BE', 'BELGIUM', 'Belgium', 'BEL', 56, 32),
(22, 'BZ', 'BELIZE', 'Belize', 'BLZ', 84, 501),
(23, 'BJ', 'BENIN', 'Benin', 'BEN', 204, 229),
(24, 'BM', 'BERMUDA', 'Bermuda', 'BMU', 60, 1441),
(25, 'BT', 'BHUTAN', 'Bhutan', 'BTN', 64, 975),
(26, 'BO', 'BOLIVIA', 'Bolivia', 'BOL', 68, 591),
(27, 'BA', 'BOSNIA AND HERZEGOVINA', 'Bosnia and Herzegovina', 'BIH', 70, 387),
(28, 'BW', 'BOTSWANA', 'Botswana', 'BWA', 72, 267),
(29, 'BV', 'BOUVET ISLAND', 'Bouvet Island', NULL, NULL, 0),
(30, 'BR', 'BRAZIL', 'Brazil', 'BRA', 76, 55),
(31, 'IO', 'BRITISH INDIAN OCEAN TERRITORY', 'British Indian Ocean Territory', NULL, NULL, 246),
(32, 'BN', 'BRUNEI DARUSSALAM', 'Brunei Darussalam', 'BRN', 96, 673),
(33, 'BG', 'BULGARIA', 'Bulgaria', 'BGR', 100, 359),
(34, 'BF', 'BURKINA FASO', 'Burkina Faso', 'BFA', 854, 226),
(35, 'BI', 'BURUNDI', 'Burundi', 'BDI', 108, 257),
(36, 'KH', 'CAMBODIA', 'Cambodia', 'KHM', 116, 855),
(37, 'CM', 'CAMEROON', 'Cameroon', 'CMR', 120, 237),
(38, 'CA', 'CANADA', 'Canada', 'CAN', 124, 1),
(39, 'CV', 'CAPE VERDE', 'Cape Verde', 'CPV', 132, 238),
(40, 'KY', 'CAYMAN ISLANDS', 'Cayman Islands', 'CYM', 136, 1345),
(41, 'CF', 'CENTRAL AFRICAN REPUBLIC', 'Central African Republic', 'CAF', 140, 236),
(42, 'TD', 'CHAD', 'Chad', 'TCD', 148, 235),
(43, 'CL', 'CHILE', 'Chile', 'CHL', 152, 56),
(44, 'CN', 'CHINA', 'China', 'CHN', 156, 86),
(45, 'CX', 'CHRISTMAS ISLAND', 'Christmas Island', NULL, NULL, 61),
(46, 'CC', 'COCOS (KEELING) ISLANDS', 'Cocos (Keeling) Islands', NULL, NULL, 672),
(47, 'CO', 'COLOMBIA', 'Colombia', 'COL', 170, 57),
(48, 'KM', 'COMOROS', 'Comoros', 'COM', 174, 269),
(49, 'CG', 'CONGO', 'Congo', 'COG', 178, 242),
(50, 'CD', 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', 'Congo, the Democratic Republic of the', 'COD', 180, 242),
(51, 'CK', 'COOK ISLANDS', 'Cook Islands', 'COK', 184, 682),
(52, 'CR', 'COSTA RICA', 'Costa Rica', 'CRI', 188, 506),
(53, 'CI', 'COTE D''IVOIRE', 'Cote D''Ivoire', 'CIV', 384, 225),
(54, 'HR', 'CROATIA', 'Croatia', 'HRV', 191, 385),
(55, 'CU', 'CUBA', 'Cuba', 'CUB', 192, 53),
(56, 'CY', 'CYPRUS', 'Cyprus', 'CYP', 196, 357),
(57, 'CZ', 'CZECH REPUBLIC', 'Czech Republic', 'CZE', 203, 420),
(58, 'DK', 'DENMARK', 'Denmark', 'DNK', 208, 45),
(59, 'DJ', 'DJIBOUTI', 'Djibouti', 'DJI', 262, 253),
(60, 'DM', 'DOMINICA', 'Dominica', 'DMA', 212, 1767),
(61, 'DO', 'DOMINICAN REPUBLIC', 'Dominican Republic', 'DOM', 214, 1809),
(62, 'EC', 'ECUADOR', 'Ecuador', 'ECU', 218, 593),
(63, 'EG', 'EGYPT', 'Egypt', 'EGY', 818, 20),
(64, 'SV', 'EL SALVADOR', 'El Salvador', 'SLV', 222, 503),
(65, 'GQ', 'EQUATORIAL GUINEA', 'Equatorial Guinea', 'GNQ', 226, 240),
(66, 'ER', 'ERITREA', 'Eritrea', 'ERI', 232, 291),
(67, 'EE', 'ESTONIA', 'Estonia', 'EST', 233, 372),
(68, 'ET', 'ETHIOPIA', 'Ethiopia', 'ETH', 231, 251),
(69, 'FK', 'FALKLAND ISLANDS (MALVINAS)', 'Falkland Islands (Malvinas)', 'FLK', 238, 500),
(70, 'FO', 'FAROE ISLANDS', 'Faroe Islands', 'FRO', 234, 298),
(71, 'FJ', 'FIJI', 'Fiji', 'FJI', 242, 679),
(72, 'FI', 'FINLAND', 'Finland', 'FIN', 246, 358),
(73, 'FR', 'FRANCE', 'France', 'FRA', 250, 33),
(74, 'GF', 'FRENCH GUIANA', 'French Guiana', 'GUF', 254, 594),
(75, 'PF', 'FRENCH POLYNESIA', 'French Polynesia', 'PYF', 258, 689),
(76, 'TF', 'FRENCH SOUTHERN TERRITORIES', 'French Southern Territories', NULL, NULL, 0),
(77, 'GA', 'GABON', 'Gabon', 'GAB', 266, 241),
(78, 'GM', 'GAMBIA', 'Gambia', 'GMB', 270, 220),
(79, 'GE', 'GEORGIA', 'Georgia', 'GEO', 268, 995),
(80, 'DE', 'GERMANY', 'Germany', 'DEU', 276, 49),
(81, 'GH', 'GHANA', 'Ghana', 'GHA', 288, 233),
(82, 'GI', 'GIBRALTAR', 'Gibraltar', 'GIB', 292, 350),
(83, 'GR', 'GREECE', 'Greece', 'GRC', 300, 30),
(84, 'GL', 'GREENLAND', 'Greenland', 'GRL', 304, 299),
(85, 'GD', 'GRENADA', 'Grenada', 'GRD', 308, 1473),
(86, 'GP', 'GUADELOUPE', 'Guadeloupe', 'GLP', 312, 590),
(87, 'GU', 'GUAM', 'Guam', 'GUM', 316, 1671),
(88, 'GT', 'GUATEMALA', 'Guatemala', 'GTM', 320, 502),
(89, 'GN', 'GUINEA', 'Guinea', 'GIN', 324, 224),
(90, 'GW', 'GUINEA-BISSAU', 'Guinea-Bissau', 'GNB', 624, 245),
(91, 'GY', 'GUYANA', 'Guyana', 'GUY', 328, 592),
(92, 'HT', 'HAITI', 'Haiti', 'HTI', 332, 509),
(93, 'HM', 'HEARD ISLAND AND MCDONALD ISLANDS', 'Heard Island and Mcdonald Islands', NULL, NULL, 0),
(94, 'VA', 'HOLY SEE (VATICAN CITY STATE)', 'Holy See (Vatican City State)', 'VAT', 336, 39),
(95, 'HN', 'HONDURAS', 'Honduras', 'HND', 340, 504),
(96, 'HK', 'HONG KONG', 'Hong Kong', 'HKG', 344, 852),
(97, 'HU', 'HUNGARY', 'Hungary', 'HUN', 348, 36),
(98, 'IS', 'ICELAND', 'Iceland', 'ISL', 352, 354),
(99, 'IN', 'INDIA', 'India', 'IND', 356, 91),
(100, 'ID', 'INDONESIA', 'Indonesia', 'IDN', 360, 62),
(101, 'IR', 'IRAN, ISLAMIC REPUBLIC OF', 'Iran, Islamic Republic of', 'IRN', 364, 98),
(102, 'IQ', 'IRAQ', 'Iraq', 'IRQ', 368, 964),
(103, 'IE', 'IRELAND', 'Ireland', 'IRL', 372, 353),
(104, 'IL', 'ISRAEL', 'Israel', 'ISR', 376, 972),
(105, 'IT', 'ITALY', 'Italy', 'ITA', 380, 39),
(106, 'JM', 'JAMAICA', 'Jamaica', 'JAM', 388, 1876),
(107, 'JP', 'JAPAN', 'Japan', 'JPN', 392, 81),
(108, 'JO', 'JORDAN', 'Jordan', 'JOR', 400, 962),
(109, 'KZ', 'KAZAKHSTAN', 'Kazakhstan', 'KAZ', 398, 7),
(110, 'KE', 'KENYA', 'Kenya', 'KEN', 404, 254),
(111, 'KI', 'KIRIBATI', 'Kiribati', 'KIR', 296, 686),
(112, 'KP', 'KOREA, DEMOCRATIC PEOPLE''S REPUBLIC OF', 'Korea, Democratic People''s Republic of', 'PRK', 408, 850),
(113, 'KR', 'KOREA, REPUBLIC OF', 'Korea, Republic of', 'KOR', 410, 82),
(114, 'KW', 'KUWAIT', 'Kuwait', 'KWT', 414, 965),
(115, 'KG', 'KYRGYZSTAN', 'Kyrgyzstan', 'KGZ', 417, 996),
(116, 'LA', 'LAO PEOPLE''S DEMOCRATIC REPUBLIC', 'Lao People''s Democratic Republic', 'LAO', 418, 856),
(117, 'LV', 'LATVIA', 'Latvia', 'LVA', 428, 371),
(118, 'LB', 'LEBANON', 'Lebanon', 'LBN', 422, 961),
(119, 'LS', 'LESOTHO', 'Lesotho', 'LSO', 426, 266),
(120, 'LR', 'LIBERIA', 'Liberia', 'LBR', 430, 231),
(121, 'LY', 'LIBYAN ARAB JAMAHIRIYA', 'Libyan Arab Jamahiriya', 'LBY', 434, 218),
(122, 'LI', 'LIECHTENSTEIN', 'Liechtenstein', 'LIE', 438, 423),
(123, 'LT', 'LITHUANIA', 'Lithuania', 'LTU', 440, 370),
(124, 'LU', 'LUXEMBOURG', 'Luxembourg', 'LUX', 442, 352),
(125, 'MO', 'MACAO', 'Macao', 'MAC', 446, 853),
(126, 'MK', 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', 'Macedonia, the Former Yugoslav Republic of', 'MKD', 807, 389),
(127, 'MG', 'MADAGASCAR', 'Madagascar', 'MDG', 450, 261),
(128, 'MW', 'MALAWI', 'Malawi', 'MWI', 454, 265),
(129, 'MY', 'MALAYSIA', 'Malaysia', 'MYS', 458, 60),
(130, 'MV', 'MALDIVES', 'Maldives', 'MDV', 462, 960),
(131, 'ML', 'MALI', 'Mali', 'MLI', 466, 223),
(132, 'MT', 'MALTA', 'Malta', 'MLT', 470, 356),
(133, 'MH', 'MARSHALL ISLANDS', 'Marshall Islands', 'MHL', 584, 692),
(134, 'MQ', 'MARTINIQUE', 'Martinique', 'MTQ', 474, 596),
(135, 'MR', 'MAURITANIA', 'Mauritania', 'MRT', 478, 222),
(136, 'MU', 'MAURITIUS', 'Mauritius', 'MUS', 480, 230),
(137, 'YT', 'MAYOTTE', 'Mayotte', NULL, NULL, 269),
(138, 'MX', 'MEXICO', 'Mexico', 'MEX', 484, 52),
(139, 'FM', 'MICRONESIA, FEDERATED STATES OF', 'Micronesia, Federated States of', 'FSM', 583, 691),
(140, 'MD', 'MOLDOVA, REPUBLIC OF', 'Moldova, Republic of', 'MDA', 498, 373),
(141, 'MC', 'MONACO', 'Monaco', 'MCO', 492, 377),
(142, 'MN', 'MONGOLIA', 'Mongolia', 'MNG', 496, 976),
(143, 'MS', 'MONTSERRAT', 'Montserrat', 'MSR', 500, 1664),
(144, 'MA', 'MOROCCO', 'Morocco', 'MAR', 504, 212),
(145, 'MZ', 'MOZAMBIQUE', 'Mozambique', 'MOZ', 508, 258),
(146, 'MM', 'MYANMAR', 'Myanmar', 'MMR', 104, 95),
(147, 'NA', 'NAMIBIA', 'Namibia', 'NAM', 516, 264),
(148, 'NR', 'NAURU', 'Nauru', 'NRU', 520, 674),
(149, 'NP', 'NEPAL', 'Nepal', 'NPL', 524, 977),
(150, 'NL', 'NETHERLANDS', 'Netherlands', 'NLD', 528, 31),
(151, 'AN', 'NETHERLANDS ANTILLES', 'Netherlands Antilles', 'ANT', 530, 599),
(152, 'NC', 'NEW CALEDONIA', 'New Caledonia', 'NCL', 540, 687),
(153, 'NZ', 'NEW ZEALAND', 'New Zealand', 'NZL', 554, 64),
(154, 'NI', 'NICARAGUA', 'Nicaragua', 'NIC', 558, 505),
(155, 'NE', 'NIGER', 'Niger', 'NER', 562, 227),
(156, 'NG', 'NIGERIA', 'Nigeria', 'NGA', 566, 234),
(157, 'NU', 'NIUE', 'Niue', 'NIU', 570, 683),
(158, 'NF', 'NORFOLK ISLAND', 'Norfolk Island', 'NFK', 574, 672),
(159, 'MP', 'NORTHERN MARIANA ISLANDS', 'Northern Mariana Islands', 'MNP', 580, 1670),
(160, 'NO', 'NORWAY', 'Norway', 'NOR', 578, 47),
(161, 'OM', 'OMAN', 'Oman', 'OMN', 512, 968),
(162, 'PK', 'PAKISTAN', 'Pakistan', 'PAK', 586, 92),
(163, 'PW', 'PALAU', 'Palau', 'PLW', 585, 680),
(164, 'PS', 'PALESTINIAN TERRITORY, OCCUPIED', 'Palestinian Territory, Occupied', NULL, NULL, 970),
(165, 'PA', 'PANAMA', 'Panama', 'PAN', 591, 507),
(166, 'PG', 'PAPUA NEW GUINEA', 'Papua New Guinea', 'PNG', 598, 675),
(167, 'PY', 'PARAGUAY', 'Paraguay', 'PRY', 600, 595),
(168, 'PE', 'PERU', 'Peru', 'PER', 604, 51),
(169, 'PH', 'PHILIPPINES', 'Philippines', 'PHL', 608, 63),
(170, 'PN', 'PITCAIRN', 'Pitcairn', 'PCN', 612, 0),
(171, 'PL', 'POLAND', 'Poland', 'POL', 616, 48),
(172, 'PT', 'PORTUGAL', 'Portugal', 'PRT', 620, 351),
(173, 'PR', 'PUERTO RICO', 'Puerto Rico', 'PRI', 630, 1787),
(174, 'QA', 'QATAR', 'Qatar', 'QAT', 634, 974),
(175, 'RE', 'REUNION', 'Reunion', 'REU', 638, 262),
(176, 'RO', 'ROMANIA', 'Romania', 'ROM', 642, 40),
(177, 'RU', 'RUSSIAN FEDERATION', 'Russian Federation', 'RUS', 643, 70),
(178, 'RW', 'RWANDA', 'Rwanda', 'RWA', 646, 250),
(179, 'SH', 'SAINT HELENA', 'Saint Helena', 'SHN', 654, 290),
(180, 'KN', 'SAINT KITTS AND NEVIS', 'Saint Kitts and Nevis', 'KNA', 659, 1869),
(181, 'LC', 'SAINT LUCIA', 'Saint Lucia', 'LCA', 662, 1758),
(182, 'PM', 'SAINT PIERRE AND MIQUELON', 'Saint Pierre and Miquelon', 'SPM', 666, 508),
(183, 'VC', 'SAINT VINCENT AND THE GRENADINES', 'Saint Vincent and the Grenadines', 'VCT', 670, 1784),
(184, 'WS', 'SAMOA', 'Samoa', 'WSM', 882, 684),
(185, 'SM', 'SAN MARINO', 'San Marino', 'SMR', 674, 378),
(186, 'ST', 'SAO TOME AND PRINCIPE', 'Sao Tome and Principe', 'STP', 678, 239),
(187, 'SA', 'SAUDI ARABIA', 'Saudi Arabia', 'SAU', 682, 966),
(188, 'SN', 'SENEGAL', 'Senegal', 'SEN', 686, 221),
(189, 'CS', 'SERBIA AND MONTENEGRO', 'Serbia and Montenegro', NULL, NULL, 381),
(190, 'SC', 'SEYCHELLES', 'Seychelles', 'SYC', 690, 248),
(191, 'SL', 'SIERRA LEONE', 'Sierra Leone', 'SLE', 694, 232),
(192, 'SG', 'SINGAPORE', 'Singapore', 'SGP', 702, 65),
(193, 'SK', 'SLOVAKIA', 'Slovakia', 'SVK', 703, 421),
(194, 'SI', 'SLOVENIA', 'Slovenia', 'SVN', 705, 386),
(195, 'SB', 'SOLOMON ISLANDS', 'Solomon Islands', 'SLB', 90, 677),
(196, 'SO', 'SOMALIA', 'Somalia', 'SOM', 706, 252),
(197, 'ZA', 'SOUTH AFRICA', 'South Africa', 'ZAF', 710, 27),
(198, 'GS', 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', 'South Georgia and the South Sandwich Islands', NULL, NULL, 0),
(199, 'ES', 'SPAIN', 'Spain', 'ESP', 724, 34),
(200, 'LK', 'SRI LANKA', 'Sri Lanka', 'LKA', 144, 94),
(201, 'SD', 'SUDAN', 'Sudan', 'SDN', 736, 249),
(202, 'SR', 'SURINAME', 'Suriname', 'SUR', 740, 597),
(203, 'SJ', 'SVALBARD AND JAN MAYEN', 'Svalbard and Jan Mayen', 'SJM', 744, 47),
(204, 'SZ', 'SWAZILAND', 'Swaziland', 'SWZ', 748, 268),
(205, 'SE', 'SWEDEN', 'Sweden', 'SWE', 752, 46),
(206, 'CH', 'SWITZERLAND', 'Switzerland', 'CHE', 756, 41),
(207, 'SY', 'SYRIAN ARAB REPUBLIC', 'Syrian Arab Republic', 'SYR', 760, 963),
(208, 'TW', 'TAIWAN, PROVINCE OF CHINA', 'Taiwan, Province of China', 'TWN', 158, 886),
(209, 'TJ', 'TAJIKISTAN', 'Tajikistan', 'TJK', 762, 992),
(210, 'TZ', 'TANZANIA, UNITED REPUBLIC OF', 'Tanzania, United Republic of', 'TZA', 834, 255),
(211, 'TH', 'THAILAND', 'Thailand', 'THA', 764, 66),
(212, 'TL', 'TIMOR-LESTE', 'Timor-Leste', NULL, NULL, 670),
(213, 'TG', 'TOGO', 'Togo', 'TGO', 768, 228),
(214, 'TK', 'TOKELAU', 'Tokelau', 'TKL', 772, 690),
(215, 'TO', 'TONGA', 'Tonga', 'TON', 776, 676),
(216, 'TT', 'TRINIDAD AND TOBAGO', 'Trinidad and Tobago', 'TTO', 780, 1868),
(217, 'TN', 'TUNISIA', 'Tunisia', 'TUN', 788, 216),
(218, 'TR', 'TURKEY', 'Turkey', 'TUR', 792, 90),
(219, 'TM', 'TURKMENISTAN', 'Turkmenistan', 'TKM', 795, 7370),
(220, 'TC', 'TURKS AND CAICOS ISLANDS', 'Turks and Caicos Islands', 'TCA', 796, 1649),
(221, 'TV', 'TUVALU', 'Tuvalu', 'TUV', 798, 688),
(222, 'UG', 'UGANDA', 'Uganda', 'UGA', 800, 256),
(223, 'UA', 'UKRAINE', 'Ukraine', 'UKR', 804, 380),
(224, 'AE', 'UNITED ARAB EMIRATES', 'United Arab Emirates', 'ARE', 784, 971),
(225, 'GB', 'UNITED KINGDOM', 'United Kingdom', 'GBR', 826, 44),
(226, 'US', 'UNITED STATES', 'United States', 'USA', 840, 1),
(227, 'UM', 'UNITED STATES MINOR OUTLYING ISLANDS', 'United States Minor Outlying Islands', NULL, NULL, 1),
(228, 'UY', 'URUGUAY', 'Uruguay', 'URY', 858, 598),
(229, 'UZ', 'UZBEKISTAN', 'Uzbekistan', 'UZB', 860, 998),
(230, 'VU', 'VANUATU', 'Vanuatu', 'VUT', 548, 678),
(231, 'VE', 'VENEZUELA', 'Venezuela', 'VEN', 862, 58),
(232, 'VN', 'VIET NAM', 'Viet Nam', 'VNM', 704, 84),
(233, 'VG', 'VIRGIN ISLANDS, BRITISH', 'Virgin Islands, British', 'VGB', 92, 1284),
(234, 'VI', 'VIRGIN ISLANDS, U.S.', 'Virgin Islands, U.s.', 'VIR', 850, 1340),
(235, 'WF', 'WALLIS AND FUTUNA', 'Wallis and Futuna', 'WLF', 876, 681),
(236, 'EH', 'WESTERN SAHARA', 'Western Sahara', 'ESH', 732, 212),
(237, 'YE', 'YEMEN', 'Yemen', 'YEM', 887, 967),
(238, 'ZM', 'ZAMBIA', 'Zambia', 'ZMB', 894, 260),
(239, 'ZW', 'ZIMBABWE', 'Zimbabwe', 'ZWE', 716, 263);

-- --------------------------------------------------------

--
-- Table structure for table `coupontype`
--

CREATE TABLE IF NOT EXISTS `coupontype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `coupontype`
--

INSERT INTO `coupontype` (`id`, `name`) VALUES
(1, 'Discount on cart'),
(2, 'Y products free on x products'),
(3, 'Discount on particular products'),
(4, 'Free Delivery');

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE IF NOT EXISTS `currency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `isdefault` int(11) NOT NULL,
  `conversionrate` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`id`, `name`, `isdefault`, `conversionrate`) VALUES
(1, 'INR', 1, 1),
(3, 'USD', 0, 0.025);

-- --------------------------------------------------------

--
-- Table structure for table `currency_country`
--

CREATE TABLE IF NOT EXISTS `currency_country` (
  `currency` int(11) NOT NULL,
  `country` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `discountcoupon`
--

CREATE TABLE IF NOT EXISTS `discountcoupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coupontype` int(11) NOT NULL,
  `discountpercent` double NOT NULL,
  `discountamount` double NOT NULL,
  `couponcode` varchar(255) NOT NULL,
  `minamount` double NOT NULL,
  `xproducts` int(11) NOT NULL,
  `yproducts` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `discountcoupon`
--

INSERT INTO `discountcoupon` (`id`, `coupontype`, `discountpercent`, `discountamount`, `couponcode`, `minamount`, `xproducts`, `yproducts`) VALUES
(1, 3, 10, 5000, 'MM123', 10000, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `discountproducts`
--

CREATE TABLE IF NOT EXISTS `discountproducts` (
  `discountcoupon` int(11) NOT NULL,
  `product` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `homeslider`
--

CREATE TABLE IF NOT EXISTS `homeslider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order` int(11) NOT NULL,
  `image` varchar(255) CHARACTER SET utf8 NOT NULL,
  `product` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `homeslider`
--

INSERT INTO `homeslider` (`id`, `order`, `image`, `product`) VALUES
(3, 0, 'Nude-banners2.jpg', 36),
(4, 0, 'AERO_1920x8401.jpg', 22),
(5, 0, 'PLAY_1920x8401.jpg', 31);

-- --------------------------------------------------------

--
-- Table structure for table `limitedstock`
--

CREATE TABLE IF NOT EXISTS `limitedstock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `url` text NOT NULL,
  `linktype` int(11) NOT NULL,
  `parent` int(11) NOT NULL,
  `isactive` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  `icon` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `name`, `description`, `keyword`, `url`, `linktype`, `parent`, `isactive`, `order`, `icon`) VALUES
(1, 'Users', '', '', 'site/viewusers', 1, 0, 1, 1, 'icon-user'),
(2, 'Subscribe', '', '', 'site/viewsubscribe', 1, 0, 1, 8, 'icon-user'),
(3, 'Payment Gateway', '', '', 'site/viewpaymentgateway', 1, 0, 1, 9, 'icon-user'),
(4, 'Dashboard', '', '', 'site/index', 1, 0, 1, 0, 'icon-dashboard'),
(5, 'Orders', '', '', 'site/vieworder', 1, 0, 1, 10, 'icon-user'),
(6, 'Products', '', '', 'site/viewproduct', 1, 0, 1, 2, 'icon-user'),
(7, 'Brand', '', '', 'site/viewbrand', 1, 0, 1, 3, 'icon-user'),
(8, 'Category', '', '', 'site/viewcategory', 1, 0, 1, 4, 'icon-user'),
(9, 'Offer', '', '', 'site/viewoffer', 1, 0, 1, 5, 'icon-user'),
(10, 'Promotions', '', '', 'site/viewdiscountcoupon', 1, 0, 1, 6, 'icon-user'),
(11, 'Home Slider', '', '', 'site/viewhomeslider', 1, 0, 1, 10, 'icon-user'),
(12, 'Home Products', '', '', 'site/viewproductwaiting', 1, 0, 1, 11, 'icon-user'),
(13, 'Contact Us', '', '', 'site/viewcontact', 1, 0, 1, 13, 'icon-user'),
(14, 'Types', '', '', 'site/viewtype', 1, 0, 1, 3, 'icon-user'),
(15, 'New Arrivals', '', '', 'site/viewnewarrivals', 1, 0, 1, 3, 'icon-user'),
(17, 'About us', '', '', 'site/viewaboutus', 1, 0, 1, 3, 'icon-user');

-- --------------------------------------------------------

--
-- Table structure for table `menuaccess`
--

CREATE TABLE IF NOT EXISTS `menuaccess` (
  `menu` int(11) NOT NULL,
  `access` int(11) NOT NULL,
  UNIQUE KEY `menu` (`menu`,`access`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menuaccess`
--

INSERT INTO `menuaccess` (`menu`, `access`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(7, 3),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1);

-- --------------------------------------------------------

--
-- Table structure for table `navigation`
--

CREATE TABLE IF NOT EXISTS `navigation` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent` int(11) NOT NULL,
  `link` varchar(255) NOT NULL,
  `target` varchar(255) NOT NULL,
  `order` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `icon` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `newarrival`
--

CREATE TABLE IF NOT EXISTS `newarrival` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `newarrival`
--

INSERT INTO `newarrival` (`id`, `product`, `type`) VALUES
(1, 3, 1),
(3, 4, 2),
(4, 5, 3),
(5, 6, 1),
(6, 6, 2);

-- --------------------------------------------------------

--
-- Table structure for table `newslettermail`
--

CREATE TABLE IF NOT EXISTS `newslettermail` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `scheduletime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `newslettermailuser`
--

CREATE TABLE IF NOT EXISTS `newslettermailuser` (
  `newslettermail` int(11) NOT NULL,
  `newsletteremail` varchar(255) NOT NULL,
  `user` int(11) NOT NULL,
  PRIMARY KEY (`newslettermail`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `newsletterusers`
--

CREATE TABLE IF NOT EXISTS `newsletterusers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=109 ;

--
-- Dumping data for table `newsletterusers`
--

INSERT INTO `newsletterusers` (`id`, `user`, `email`, `status`) VALUES
(25, 44, 'undefined', 0),
(26, 45, 'jagruti@wohli.com', 0),
(27, 47, 'patiljagruti181@gmail.com', 0),
(28, 48, 'saini@gmail.com', 0),
(29, 50, 'blueclusters@gmail.com', 0),
(30, 51, 'avinash@wohlig.com', 0),
(31, 52, 'chintan@wohlig.com', 0),
(32, 53, 'chintan@wohlig.com', 0),
(33, 55, 'chintan@wohlig.com', 0),
(34, 57, 'priyapeer@yahoo.com', 0),
(35, 60, 'pulkitno2@gmail.com', 0),
(36, 61, 'sohan1@gmail.com', 0),
(37, 62, 'sohan2@gmail.com', 0),
(38, 63, 'mahesh@gmail.com', 0),
(39, 64, 'sohn@gmail.com', 0),
(40, 65, 'sn@gmail.com', 0),
(41, 66, 'ffffff@gmail.com', 0),
(42, 67, 'fffffkkkf@gmail.com', 0),
(43, 68, 'fffffkppkkf@gmail.com', 0),
(44, 69, 'avvv@gmail.com', 0),
(45, 70, 'demo@dmeo.com', 0),
(46, 71, 'haha@gmail.com', 0),
(47, 72, 'jaja@gmail.com', 0),
(48, 73, 'ho@gmail.com', 0),
(49, 74, 'shn3@gmail.com', 0),
(50, 75, 'fffffffff@gmail.com', 0),
(51, 76, 'shhhh@gmail.com', 0),
(52, 77, 'shn123@gmail.com', 0),
(53, 78, 'do@gmail.com', 0),
(54, 79, 'ganeshshetty233@yahoo.in', 0),
(55, 80, 'shn1@gmail.com', 0),
(56, 81, 'sgn@gmail.com', 0),
(57, 82, 'avinashsohan@gmail.com', 0),
(58, 83, 'shn12@gmail.com', 0),
(59, 85, 'jagruti@yahoo.com', 0),
(60, 86, 'debbysmum@yahoo.ca', 0),
(61, 87, 'gogo@gmail.com', 0),
(62, 88, 'nikhilbansode572@yahoo.in', 0),
(63, 89, 'ambestmedia@gmail.com', 0),
(64, 90, 'voraavniv@gmail.com', 0),
(65, 92, 'sachin@ambestmedia.com', 0),
(66, 93, 'reddyajay28@yahoo.in', 0),
(67, 94, 'negimeera2@gmail.com', 0),
(68, 95, 'nadarmilton@yahoo.in', 0),
(69, 96, '5242@gmail.com', 0),
(70, 97, 'dhavalwohlig@gmail.com', 0),
(71, 98, 'dhaval.gala2014@gmail.com', 0),
(72, 99, 'vigneshkasthuri2009@gmail.com', 0),
(73, 100, 'dhaval@wohlig.com', 0),
(74, 101, 'sohan@gmail.com', 0),
(75, 102, 'shn@gmail.com', 0),
(76, 103, 'jagruti@wohligco.com', 0),
(77, 104, 'jagrutii@wohlig.com', 0),
(78, 105, 'jagrutiy@wohlig.com', 0),
(79, 106, 'jagruti181@wohlig.com', 0),
(80, 107, 'demo@demo.com', 0),
(81, 108, 'kajolahuja654@yahoo.in', 0),
(82, 109, 'avanitushar@rediffmail.com', 0),
(83, 110, 'AVNI7772@YAHOO.COM', 0),
(84, 111, 'jagruti@gmail.com', 0),
(85, 10, 'shdj@ysgdh.sdgs', 0),
(86, 11, 'ghd@sdyh.sd', 0),
(87, 12, 'abc@email.com', 0),
(88, 13, 'hii@sdyh.csdc', 0),
(89, 18, 'demo@demo.com', 0),
(90, 19, 'jagruti@wohlig.com', 0),
(91, 20, 'jagruti@wohlig.com', 0),
(92, 21, 'priya@gmail.com', 0),
(93, 22, 'cgvhb@cvb.bdhe', 0),
(94, 19, 'bobthebuilder@pogo.com', 0),
(95, 21, 'dsa@jdfha.djf', 0),
(96, 22, 'amitwohig@gmail.com', 0),
(97, 25, 'jay@email.com', 0),
(98, 27, '', 0),
(99, 28, 'vigwohlig@gmail.com', 0),
(100, 29, 'viggwohlig@gmail.com', 0),
(101, 30, '', 0),
(102, 31, 'vigwohlig@gmail.com', 0),
(103, 32, 'vigwohlig@gmail.com', 0),
(104, 33, 'dhaval@gmail.com', 0),
(105, 34, 'abcd@gmail.com', 0),
(106, 35, 'abcd@yahoo.com', 0),
(107, 36, 'darshil_210@yahoo.com', 0),
(108, 37, 'vigwohlig@gmail.com', 0);

-- --------------------------------------------------------

--
-- Table structure for table `offer`
--

CREATE TABLE IF NOT EXISTS `offer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` double NOT NULL,
  `startdate` date NOT NULL,
  `enddate` date NOT NULL,
  `status` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `offer`
--

INSERT INTO `offer` (`id`, `title`, `description`, `price`, `startdate`, `enddate`, `status`, `timestamp`, `image`) VALUES
(2, 'retx', 'strdt', 545, '2015-11-01', '2015-12-31', 1, '2015-11-25 08:16:56', 'Professional_JSON.png'),
(3, 'retx', 'strdt', 545, '2015-11-01', '2015-12-30', 1, '2015-11-25 08:22:36', 'iphone6ho.jpg'),
(5, 'retx', 'strdt', 545, '2015-09-10', '2015-09-30', 0, '2015-09-22 07:52:41', 'glass2.jpg'),
(6, 'retx', 'strdt', 545, '2015-09-25', '2015-09-30', 0, '2015-09-22 07:52:56', '5.png'),
(7, 'retx', 'strdt', 545, '2015-10-01', '2015-10-10', 0, '2015-09-22 07:53:15', '5.jpg'),
(8, 'retx', 'strdt', 545, '2015-09-20', '2015-09-30', 0, '2015-09-14 09:46:51', '8.jpg'),
(9, 'retx', 'strdt', 545, '2015-09-30', '2015-10-05', 0, '2015-09-22 07:53:35', '5.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `offerproduct`
--

CREATE TABLE IF NOT EXISTS `offerproduct` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `offer` int(11) NOT NULL,
  `product` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `offerproduct`
--

INSERT INTO `offerproduct` (`id`, `offer`, `product`, `quantity`, `order`) VALUES
(1, 8, 4, 1, 1),
(2, 8, 1, 1, 2),
(6, 3, 6, 1, 1),
(7, 4, 3, 1, 2),
(8, 5, 5, 1, 2),
(9, 5, 7, 1, 1),
(10, 4, 5, 1, 1),
(11, 9, 5, 1, 1),
(12, 9, 4, 1, 1),
(13, 7, 1, 1, 1),
(14, 7, 2, 1, 1),
(15, 6, 3, 1, 1),
(16, 6, 4, 1, 1),
(17, 2, 85, 100, 0),
(18, 2, 15, 50, 0),
(20, 3, 24, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE IF NOT EXISTS `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `billingaddress` varchar(255) NOT NULL,
  `billingcity` varchar(255) NOT NULL,
  `billingstate` varchar(255) NOT NULL,
  `billingcountry` varchar(255) NOT NULL,
  `shippingaddress` varchar(255) NOT NULL,
  `shippingcity` varchar(255) NOT NULL,
  `shippingcountry` varchar(255) NOT NULL,
  `shippingstate` varchar(255) NOT NULL,
  `shippingpincode` varchar(255) NOT NULL,
  `defaultcurrency` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `totalamount` double NOT NULL,
  `discountamount` double NOT NULL,
  `finalamount` double NOT NULL,
  `discountcoupon` int(11) NOT NULL,
  `paymentmethod` int(11) NOT NULL,
  `orderstatus` int(11) NOT NULL,
  `currency` int(11) NOT NULL,
  `trackingcode` varchar(255) NOT NULL,
  `billingpincode` varchar(255) NOT NULL,
  `shippingmethod` int(11) DEFAULT NULL,
  `shippingname` varchar(255) NOT NULL,
  `shippingtel` varchar(255) NOT NULL,
  `customernote` varchar(255) NOT NULL,
  `billingcontact` varchar(255) NOT NULL,
  `shippingcontact` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `user`, `firstname`, `lastname`, `email`, `billingaddress`, `billingcity`, `billingstate`, `billingcountry`, `shippingaddress`, `shippingcity`, `shippingcountry`, `shippingstate`, `shippingpincode`, `defaultcurrency`, `timestamp`, `totalamount`, `discountamount`, `finalamount`, `discountcoupon`, `paymentmethod`, `orderstatus`, `currency`, `trackingcode`, `billingpincode`, `shippingmethod`, `shippingname`, `shippingtel`, `customernote`, `billingcontact`, `shippingcontact`) VALUES
(1, 1, 'pooja', 'thakare', 'pooja.wohlig@gmail.com', 'sec-4 airoli', 'airoli', 'eyrrz', 'rata', 'gtrsgsr', 'gt', 'tgxt', 'gtr', 'tsrgrr', '', '2015-09-16 09:31:13', 0, 0, 7886, 0, 0, 1, 0, '', '5686', 0, 'xt', '', 'ytry', '5465', 'tytr');

-- --------------------------------------------------------

--
-- Table structure for table `orderitems`
--

CREATE TABLE IF NOT EXISTS `orderitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order` int(11) NOT NULL,
  `product` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL,
  `discount` double NOT NULL,
  `finalprice` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `orderitems`
--

INSERT INTO `orderitems` (`id`, `order`, `product`, `quantity`, `price`, `discount`, `finalprice`) VALUES
(1, 1, 1, 1, 500, 200, 300);

-- --------------------------------------------------------

--
-- Table structure for table `orderlog`
--

CREATE TABLE IF NOT EXISTS `orderlog` (
  `id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  `action` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orderlog`
--

INSERT INTO `orderlog` (`id`, `user`, `order`, `action`, `timestamp`) VALUES
(1, 1, 154, 'Order Address Updated', '2015-06-06 06:27:44'),
(2, 1, 154, 'Order Address Updated', '2015-07-10 07:58:08'),
(3, 1, 728, 'Order Address Updated', '2015-08-17 10:34:16'),
(4, 1, 728, 'Order Address Updated', '2015-08-17 10:34:48');

-- --------------------------------------------------------

--
-- Table structure for table `orderstatus`
--

CREATE TABLE IF NOT EXISTS `orderstatus` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orderstatus`
--

INSERT INTO `orderstatus` (`id`, `name`) VALUES
(1, 'Pending'),
(2, 'Processing'),
(3, 'Shipping'),
(4, 'Delivered'),
(5, 'Cancel');

-- --------------------------------------------------------

--
-- Table structure for table `page`
--

CREATE TABLE IF NOT EXISTS `page` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `page`
--

INSERT INTO `page` (`id`, `name`, `content`) VALUES
(1, 'About Us', '<p><strong>About Us</strong></p>\r\n<p>This is best website.</p>'),
(2, 'Contact Us', '<p><strong>Call Us On</strong></p>\r\n<p>09999988888</p>');

-- --------------------------------------------------------

--
-- Table structure for table `paymentgateway`
--

CREATE TABLE IF NOT EXISTS `paymentgateway` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `isdefault` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pickofweak`
--

CREATE TABLE IF NOT EXISTS `pickofweak` (
  `id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `order` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `sku` varchar(255) CHARACTER SET utf8 NOT NULL,
  `description` text CHARACTER SET utf8 NOT NULL,
  `url` varchar(255) CHARACTER SET utf8 NOT NULL,
  `visibility` int(11) NOT NULL DEFAULT '0',
  `price` double DEFAULT NULL,
  `wholesaleprice` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `firstsaleprice` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `secondsaleprice` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `specialpriceto` date DEFAULT NULL,
  `specialpricefrom` date DEFAULT NULL,
  `metatitle` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `metadesc` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `metakeyword` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `modelnumber` varchar(255) CHARACTER SET utf8 NOT NULL,
  `brandcolor` varchar(255) CHARACTER SET utf8 NOT NULL,
  `eanorupc` varchar(255) CHARACTER SET utf8 NOT NULL,
  `eanorupcmeasuringunits` varchar(255) CHARACTER SET utf8 NOT NULL,
  `type` varchar(255) CHARACTER SET utf8 NOT NULL,
  `compatibledevice` varchar(255) CHARACTER SET utf8 NOT NULL,
  `compatiblewith` varchar(255) CHARACTER SET utf8 NOT NULL,
  `material` varchar(255) CHARACTER SET utf8 NOT NULL,
  `color` varchar(255) CHARACTER SET utf8 NOT NULL,
  `design` varchar(255) CHARACTER SET utf8 NOT NULL,
  `width` varchar(255) CHARACTER SET utf8 NOT NULL,
  `height` varchar(255) CHARACTER SET utf8 NOT NULL,
  `depth` varchar(255) CHARACTER SET utf8 NOT NULL,
  `portsize` varchar(255) CHARACTER SET utf8 NOT NULL,
  `packof` varchar(255) CHARACTER SET utf8 NOT NULL,
  `salespackage` varchar(255) CHARACTER SET utf8 NOT NULL,
  `keyfeatures` text CHARACTER SET utf8 NOT NULL,
  `videourl` varchar(255) CHARACTER SET utf8 NOT NULL,
  `modelname` varchar(255) CHARACTER SET utf8 NOT NULL,
  `finish` varchar(255) CHARACTER SET utf8 NOT NULL,
  `weight` varchar(255) CHARACTER SET utf8 NOT NULL,
  `domesticwarranty` varchar(255) CHARACTER SET utf8 NOT NULL,
  `domesticwarrantymeasuringunits` varchar(255) CHARACTER SET utf8 NOT NULL,
  `internationalwarranty` varchar(255) CHARACTER SET utf8 NOT NULL,
  `internationalwarrantymeasuringunits` varchar(255) CHARACTER SET utf8 NOT NULL,
  `warrantysummary` varchar(255) CHARACTER SET utf8 NOT NULL,
  `warrantyservicetype` varchar(255) CHARACTER SET utf8 NOT NULL,
  `coveredinwarranty` varchar(255) CHARACTER SET utf8 NOT NULL,
  `notcoveredinwarranty` varchar(255) CHARACTER SET utf8 NOT NULL,
  `size` varchar(255) CHARACTER SET utf8 NOT NULL,
  `typename` varchar(255) CHARACTER SET utf8 NOT NULL,
  `colormatch` varchar(255) CHARACTER SET utf8 NOT NULL,
  `dimension` varchar(255) CHARACTER SET utf8 NOT NULL,
  `capacity` varchar(255) CHARACTER SET utf8 NOT NULL,
  `microphone` varchar(255) CHARACTER SET utf8 NOT NULL,
  `length` varchar(255) CHARACTER SET utf8 NOT NULL,
  `voltage` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=158 ;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `sku`, `description`, `url`, `visibility`, `price`, `wholesaleprice`, `firstsaleprice`, `secondsaleprice`, `specialpriceto`, `specialpricefrom`, `metatitle`, `metadesc`, `metakeyword`, `quantity`, `status`, `modelnumber`, `brandcolor`, `eanorupc`, `eanorupcmeasuringunits`, `type`, `compatibledevice`, `compatiblewith`, `material`, `color`, `design`, `width`, `height`, `depth`, `portsize`, `packof`, `salespackage`, `keyfeatures`, `videourl`, `modelname`, `finish`, `weight`, `domesticwarranty`, `domesticwarrantymeasuringunits`, `internationalwarranty`, `internationalwarrantymeasuringunits`, `warrantysummary`, `warrantyservicetype`, `coveredinwarranty`, `notcoveredinwarranty`, `size`, `typename`, `colormatch`, `dimension`, `capacity`, `microphone`, `length`, `voltage`) VALUES
(1, 'Switcheasy 0.35 Back Case For Apple iphone 6S - Pink', '', 'Made from PP, an extremely flexible and scratch resistant thermoplastic polymer\n\nLives up to its name: just 0.35mm thick!\n\nWeighs just 4g!\n\nAvailable in 5 vibrant colors', '', 1, 850, '680', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AP-21-126-18', 'Pink', '4897017141743', '', 'Back Case, Hard Case', 'Phone', 'Apple iphone 6S', 'Thermoplastic Polymer', 'Pink', '', '', '', '', '', '', '1', '', '', '0.35', 'Matte', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(2, 'Switcheasy 0.35 Back Case For Apple iphone 6S - Frost White', '', 'Made from PP, an extremely flexible and scratch resistant thermoplastic polymer\n\nLives up to its name: just 0.35mm thick!\n\nWeighs just 4g!\n\nAvailable in 5 vibrant colors', '', 1, 850, '680', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AP-21-126-12', 'Frost White', '4897017141736', '', 'Back Case, Hard Case', 'Phone', 'Apple iphone 6S', 'Thermoplastic Polymer', 'White', '', '', '', '', '', '', '1', '', '', '0.35', 'Matte', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(3, 'Switcheasy 0.35 Back Case For Apple iphone 6S - Blue', '', 'Made from PP, an extremely flexible and scratch resistant thermoplastic polymer\n\nLives up to its name: just 0.35mm thick!\n\nWeighs just 4g!\n\nAvailable in 5 vibrant colors', '', 1, 850, '680', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AP-21-126-13', 'Blue', '4897017141767', '', 'Back Case, Hard Case', 'Phone', 'Apple iphone 6S', 'Thermoplastic Polymer', 'Blue', '', '', '', '', '', '', '1', '', '', '0.35', 'Matte', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(4, 'Switcheasy 0.35 Back Case For Apple iphone 6S - Yellow', '', 'Made from PP, an extremely flexible and scratch resistant thermoplastic polymer\n\nLives up to its name: just 0.35mm thick!\n\nWeighs just 4g!\n\nAvailable in 5 vibrant colors', '', 1, 850, '680', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AP-21-126-22', 'Yellow', '4897017141750', '', 'Back Case, Hard Case', 'Phone', 'Apple iphone 6S', 'Thermoplastic Polymer', 'Yellow', '', '', '', '', '', '', '1', '', '', '0.35', 'Matte', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(5, 'Switcheasy 0.35 Back Case For Apple iphone 6S - Stealth Black', '', 'Made from PP, an extremely flexible and scratch resistant thermoplastic polymer\n\nLives up to its name: just 0.35mm thick!\n\nWeighs just 4g!\n\nAvailable in 5 vibrant colors', '', 1, 850, '680', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AP-21-126-11', 'Stealth Black', '4897017141729', '', 'Back Case, Hard Case', 'Phone', 'Apple iphone 6S', 'Thermoplastic Polymer', 'Black', '', '', '', '', '', '', '1', '', '', '0.35', 'Matte', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(6, 'Switcheasy 0.35 Back Case For Apple iphone 6S Plus - Pink', '', 'Made from PP, an extremely flexible and scratch resistant thermoplastic polymer\n\nLives up to its name: just 0.35mm thick!\n\nWeighs just 4g!\n\nAvailable in 5 vibrant colors', '', 1, 1000, '800', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AP-22-126-18', 'Pink', '4897017141798', '', 'Back Case, Hard Case', 'Phone', 'Apple iphone 6S Plus', 'Thermoplastic Polymer', 'Pink', '', '', '', '', '', '', '1', '', '', '0.35 plus', 'Matte', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(7, 'Switcheasy 0.35 Back Case For Apple iphone 6S Plus - Frost White', '', 'Made from PP, an extremely flexible and scratch resistant thermoplastic polymer\n\nLives up to its name: just 0.35mm thick!\n\nWeighs just 4g!\n\nAvailable in 5 vibrant colors', '', 1, 1000, '800', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AP-22-126-12', 'Frost White', '4897017141781', '', 'Back Case, Hard Case', 'Phone', 'Apple iphone 6S Plus', 'Thermoplastic Polymer', 'White', '', '', '', '', '', '', '1', '', '', '0.35 plus', 'Matte', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(8, 'Switcheasy 0.35 Back Case For Apple iphone 6S Plus - Blue', '', 'Made from PP, an extremely flexible and scratch resistant thermoplastic polymer\n\nLives up to its name: just 0.35mm thick!\n\nWeighs just 4g!\n\nAvailable in 5 vibrant colors', '', 1, 1000, '800', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AP-22-126-13', 'Blue', '4897017141811', '', 'Back Case, Hard Case', 'Phone', 'Apple iphone 6S Plus', 'Thermoplastic Polymer', 'Blue', '', '', '', '', '', '', '1', '', '', '0.35 plus', 'Matte', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(9, 'Switcheasy 0.35 Back Case For Apple iphone 6S Plus - Yellow', '', 'Made from PP, an extremely flexible and scratch resistant thermoplastic polymer\n\nLives up to its name: just 0.35mm thick!\n\nWeighs just 4g!\n\nAvailable in 5 vibrant colors', '', 1, 1000, '800', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AP-22-126-22', 'Yellow', '4897017141804', '', 'Back Case, Hard Case', 'Phone', 'Apple iphone 6S Plus', 'Thermoplastic Polymer', 'Yellow', '', '', '', '', '', '', '1', '', '', '0.35 plus', 'Matte', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(10, 'Switcheasy 0.35 Back Case For Apple iphone 6S Plus - Stealth Black', '', 'Made from PP, an extremely flexible and scratch resistant thermoplastic polymer\n\nLives up to its name: just 0.35mm thick!\n\nWeighs just 4g!\n\nAvailable in 5 vibrant colors', '', 1, 1000, '800', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AP-22-126-11', 'Stealth Black', '4897017141774', '', 'Back Case, Hard Case', 'Phone', 'Apple iphone 6S Plus', 'Thermoplastic Polymer', 'Black', '', '', '', '', '', '', '1', '', '', '0.35 plus', 'Matte', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(11, 'Switcheasy Numbers Back Case For Apple iphone 6S - Frost White', '', 'Designed with clean lines and features bumps on the edges. Defending your iPhone from drops up to 1.5m. ', '', 1, 1200, '960', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AP-21-112-12', 'Frost White', '4897017141323', '', 'Back Case, Soft Case', 'Phone', 'Apple iphone 6S', 'Hydro polymer', 'White', '', '', '', '', '', '', '1', '', '', 'Numbers', 'Matte', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(12, 'Switcheasy Numbers Back Case For Apple iphone 6S - Stealth Black', '', 'Designed with clean lines and features bumps on the edges. Defending your iPhone from drops up to 1.5m. ', '', 1, 1200, '960', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AP-21-112-11', 'Stealth Black', '4897017141330', '', 'Back Case, Soft Case', 'Phone', 'Apple iphone 6S', 'Hydro polymer', 'Black', '', '', '', '', '', '', '1', '', '', 'Numbers', 'Matte', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(13, 'Switcheasy Numbers Back Case For Apple iphone 6S - Methyl Blue', '', 'Designed with clean lines and features bumps on the edges. Defending your iPhone from drops up to 1.5m. ', '', 1, 1200, '960', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AP-21-112-41', 'Rose Bouquet', '4897017141316', '', 'Back Case, Soft Case', 'Phone', 'Apple iphone 6S', 'Hydro polymer', 'Pink', '', '', '', '', '', '', '1', '', '', 'Numbers', 'Matte', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(14, 'Switcheasy Numbers Back Case For Apple iphone 6S - Rose Bouquet', '', 'Designed with clean lines and features bumps on the edges. Defending your iPhone from drops up to 1.5m. ', '', 1, 1200, '960', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AP-21-112-13', 'Methyl Blue', '4897017141309', '', 'Back Case, Soft Case', 'Phone', 'Apple iphone 6S', 'Hydro polymer', 'Blue', '', '', '', '', '', '', '1', '', '', 'Numbers', 'Matte', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(15, 'Switcheasy Numbers Back Case For Apple iphone 6S - Sunlit Tangerine', '', 'Designed with clean lines and features bumps on the edges. Defending your iPhone from drops up to 1.5m. ', '', 1, 1200, '960', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AP-21-112-16', 'Sunlit Tangerine', '4897017141347', '', 'Back Case, Soft Case', 'Phone', 'Apple iphone 6S', 'Hydro polymer', 'Orange', '', '', '', '', '', '', '1', '', '', 'Numbers', 'Matte', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(16, 'Switcheasy Numbers Back Case For Apple iphone 6S Plus - Frost White', '', 'Designed with clean lines and features bumps on the edges. Defending your iPhone from drops up to 1.5m. ', '', 1, 1300, '1040', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AP-22-112-12', 'Frost White', '4897017141378', '', 'Back Case, Soft Case', 'Phone', 'Apple iphone 6S Plus', 'Hydro polymer', 'White', '', '', '', '', '', '', '1', '', '', 'Numbers plus', 'Matte', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(17, 'Switcheasy Numbers Back Case For Apple iphone 6S Plus - Stealth Black', '', 'Designed with clean lines and features bumps on the edges. Defending your iPhone from drops up to 1.5m. ', '', 1, 1300, '1040', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AP-22-112-11', 'Stealth Black', '4897017141385', '', 'Back Case, Soft Case', 'Phone', 'Apple iphone 6S Plus', 'Hydro polymer', 'Black', '', '', '', '', '', '', '1', '', '', 'Numbers plus', 'Matte', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(18, 'Switcheasy Numbers Back Case For Apple iphone 6S Plus - Methyl Blue', '', 'Designed with clean lines and features bumps on the edges. Defending your iPhone from drops up to 1.5m. ', '', 1, 1300, '1040', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AP-22-112-41', 'Rose Bouquet', '4897017141361', '', 'Back Case, Soft Case', 'Phone', 'Apple iphone 6S Plus', 'Hydro polymer', 'Pink', '', '', '', '', '', '', '1', '', '', 'Numbers plus', 'Matte', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(19, 'Switcheasy Numbers Back Case For Apple iphone 6S Plus - Rose Bouquet', '', 'Designed with clean lines and features bumps on the edges. Defending your iPhone from drops up to 1.5m. ', '', 1, 1300, '1040', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AP-22-112-13', 'Methyl Blue', '4897017141354', '', 'Back Case, Soft Case', 'Phone', 'Apple iphone 6S Plus', 'Hydro polymer', 'Blue', '', '', '', '', '', '', '1', '', '', 'Numbers plus', 'Matte', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(20, 'Switcheasy Numbers Back Case For Apple iphone 6S Plus - Sunlit Tangerine', '', 'Designed with clean lines and features bumps on the edges. Defending your iPhone from drops up to 1.5m. ', '', 1, 1300, '1040', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AP-22-112-16', 'Sunlit Tangerine', '4897017141392', '', 'Back Case, Soft Case', 'Phone', 'Apple iphone 6S Plus', 'Hydro polymer', 'Orange', '', '', '', '', '', '', '1', '', '', 'Numbers plus', 'Matte', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(21, 'Switcheasy Aero Back Case For Apple iphone 6S - Ultra Black', '', 'Designed with Aero-tech which only weights 12g.\nTPU-treated ultra thick edges for extra protection.\nDrop proof up to 1.5m.\n', '', 1, 1500, '1200', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AP-21-143-19', 'Ultra Black', '4897017141408', '', 'Back Case, Tough Case', 'Phone', 'Apple iphone 6S', 'Aero-Tech', 'Black', '', '', '', '', '', '', '1', '', '', 'Aero', 'Matte', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(22, 'Switcheasy Aero Back Case For Apple iphone 6S - Methyl Blue', '', 'Designed with Aero-tech which only weights 12g.\nTPU-treated ultra thick edges for extra protection.\nDrop proof up to 1.5m.\n', '', 1, 1500, '1200', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AP-21-143-13', 'Methyl Blue', '4897017141415', '', 'Back Case, Tough Case', 'Phone', 'Apple iphone 6S', 'Aero-Tech', 'Blue', '', '', '', '', '', '', '1', '', '', 'Aero', 'Matte', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(23, 'Switcheasy Aero Back Case For Apple iphone 6S - Baby Pink', '', 'Designed with Aero-tech which only weights 12g.\nTPU-treated ultra thick edges for extra protection.\nDrop proof up to 1.5m.\n', '', 1, 1500, '1200', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AP-21-143-41', 'Baby Pink', '', '', 'Back Case, Tough Case', 'Phone', 'Apple iphone 6S', 'Aero-Tech', 'Pink', '', '', '', '', '', '', '1', '', '', 'Aero', 'Matte', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(24, 'Switcheasy Aero Back Case For Apple iphone 6S - Ultra Clear', '', 'Designed with Aero-tech which only weights 12g.\nTPU-treated ultra thick edges for extra protection.\nDrop proof up to 1.5m.\n', '', 1, 1500, '1200', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AP-21-143-20', 'Ultra Clear', '4897017141989', '', 'Back Case, Tough Case', 'Phone', 'Apple iphone 6S', 'Aero-Tech', 'Transparent', '', '', '', '', '', '', '1', '', '', 'Aero', 'Matte', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(25, 'Switcheasy Aero Back Case For Apple iphone 6S - Sesame', '', 'Designed with Aero-tech which only weights 12g.\nTPU-treated ultra thick edges for extra protection.\nDrop proof up to 1.5m.\n', '', 1, 1500, '1200', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AP-21-143-58', 'Sesame', '4897017141446', '', 'Back Case, Tough Case', 'Phone', 'Apple iphone 6S', 'Aero-Tech', 'Black/White', '', '', '', '', '', '', '1', '', '', 'Aero', 'Matte', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(26, 'Switcheasy Aero Back Case For Apple iphone 6S Plus - Ultra Black', '', 'Designed with Aero-tech which only weights 17g.\nTPU-treated ultra thick edges for extra protection.\nDrop proof up to 1.5m.\n', '', 1, 1650, '1320', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AP-22-143-19', 'Ultra Black', '4897017141453', '', 'Back Case, Tough Case', 'Phone', 'Apple iphone 6S Plus', 'Aero-Tech', 'Black', '', '', '', '', '', '', '1', '', '', 'Aero plus', 'Matte', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(27, 'Switcheasy Aero Back Case For Apple iphone 6S Plus - Methyl Blue', '', 'Designed with Aero-tech which only weights 17g.\nTPU-treated ultra thick edges for extra protection.\nDrop proof up to 1.5m.\n', '', 1, 1650, '1320', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AP-22-143-13', 'Methyl Blue', '4897017141460', '', 'Back Case, Tough Case', 'Phone', 'Apple iphone 6S Plus', 'Aero-Tech', 'Blue', '', '', '', '', '', '', '1', '', '', 'Aero plus', 'Matte', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(28, 'Switcheasy Aero Back Case For Apple iphone 6S Plus - Baby Pink', '', 'Designed with Aero-tech which only weights 17g.\nTPU-treated ultra thick edges for extra protection.\nDrop proof up to 1.5m.\n', '', 1, 1650, '1320', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AP-22-143-41', 'Baby Pink', '4897017141484', '', 'Back Case, Tough Case', 'Phone', 'Apple iphone 6S Plus', 'Aero-Tech', 'Pink', '', '', '', '', '', '', '1', '', '', 'Aero plus', 'Matte', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(29, 'Switcheasy Aero Back Case For Apple iphone 6S Plus - Ultra Clear', '', 'Designed with Aero-tech which only weights 17g.\nTPU-treated ultra thick edges for extra protection.\nDrop proof up to 1.5m.\n', '', 1, 1650, '1320', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AP-22-143-20', 'Ultra Clear', '4897017142009', '', 'Back Case, Tough Case', 'Phone', 'Apple iphone 6S Plus', 'Aero-Tech', 'Transparent', '', '', '', '', '', '', '1', '', '', 'Aero plus', 'Matte', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(30, 'Switcheasy Aero Back Case For Apple iphone 6S Plus - Sesame', '', 'Designed with Aero-tech which only weights 17g.\nTPU-treated ultra thick edges for extra protection.\nDrop proof up to 1.5m.\n', '', 1, 1650, '1320', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AP-22-143-58', 'Sesame', '4897017141491', '', 'Back Case, Tough Case', 'Phone', 'Apple iphone 6S Plus', 'Aero-Tech', 'Black/White', '', '', '', '', '', '', '1', '', '', 'Aero plus', 'Matte', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(31, 'Switcheasy Play Back Case For Apple iphone 6S - Ultra Black', '', 'Designed with Aero-tech which only weights 17g.\nMeasures only 0.4mm with 3H anti-scratch PET back shell.\nTPU-treated ultra thick edges for extra protection.\nDrop proof up to 1.5m.\n', '', 1, 1650, '1320', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AP-21-115-19', 'Ultra Black', '4897017141507', '', 'Back Case, Tough Case', 'Phone', 'Apple iphone 6S', 'Aero-Tech', 'Black', '', '', '', '', '', '', '1', '', '', 'Play', 'Matte', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(32, 'Switcheasy Play Back Case For Apple iphone 6S - Ultra Clear', '', 'Designed with Aero-tech which only weights 17g.\nMeasures only 0.4mm with 3H anti-scratch PET back shell.\nTPU-treated ultra thick edges for extra protection.\nDrop proof up to 1.5m.\n', '', 1, 1650, '1320', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AP-21-115-20', 'Ultra Clear', '4897017141514', '', 'Back Case, Tough Case', 'Phone', 'Apple iphone 6S', 'Aero-Tech', 'Transparent', '', '', '', '', '', '', '1', '', '', 'Play', 'Matte', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(33, 'Switcheasy Play Back Case For Apple iphone 6S Plus - Ultra Black', '', 'Designed with Aero-tech which only weights 22g.\nMeasures only 0.4mm with 3H anti-scratch PET back shell.\nTPU-treated ultra thick edges for extra protection.\nDrop proof up to 1.5m.\n', '', 1, 1850, '1480', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AP-22-115-19', 'Ultra Black', '4897017141521', '', 'Back Case, Tough Case', 'Phone', 'Apple iphone 6S Plus', 'Aero-Tech', 'Black', '', '', '', '', '', '', '1', '', '', 'Play plus', 'Matte', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(34, 'Switcheasy Play Back Case For Apple iphone 6S Plus - Ultra Clear', '', 'Designed with Aero-tech which only weights 22g.\nMeasures only 0.4mm with 3H anti-scratch PET back shell.\nTPU-treated ultra thick edges for extra protection.\nDrop proof up to 1.5m.\n', '', 1, 1850, '1480', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AP-22-115-20', 'Ultra Clear', '4897017141538', '', 'Back Case, Tough Case', 'Phone', 'Apple iphone 6S Plus', 'Aero-Tech', 'Transparent', '', '', '', '', '', '', '1', '', '', 'Play plus', 'Matte', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(35, 'Switcheasy Nude Back Case For Apple iphone 6S - Ultra Black', '', 'Crystal clear and transparent.\nAnti-scratch UV gloss coating and durable soft-touch rubber coating.\nLightweight and ultra slim 0.8mm.\nBrand new 360', '', 1, 1300, '1040', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AP-21-111-19', 'Ultra Black', '4897017141200', '', 'Back Case, Hard Case', 'Phone', 'Apple iphone 6S', 'Formulated Polycarbonate', 'Black', '', '', '', '', '', '', '1', '', '', 'Nude', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(36, 'Switcheasy Nude Back Case For Apple iphone 6S - Transparent', '', 'Crystal clear and transparent.\nAnti-scratch UV gloss coating and durable soft-touch rubber coating.\nLightweight and ultra slim 0.8mm.\nBrand new 360', '', 1, 1300, '1040', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AP-21-111-20', 'Transparent', '4897017141217', '', 'Back Case, Hard Case', 'Phone', 'Apple iphone 6S', 'Formulated Polycarbonate', 'Transparent', '', '', '', '', '', '', '1', '', '', 'Nude', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(37, 'Switcheasy Nude Back Case For Apple iphone 6S - Mint', '', 'Crystal clear and transparent.\nAnti-scratch UV gloss coating and durable soft-touch rubber coating.\nLightweight and ultra slim 0.8mm.\nBrand new 360', '', 1, 1300, '1040', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AP-21-111-57', 'Mint', '4897017141224', '', 'Back Case, Hard Case', 'Phone', 'Apple iphone 6S', 'Formulated Polycarbonate', 'Green', '', '', '', '', '', '', '1', '', '', 'Nude', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(38, 'Switcheasy Nude Back Case For Apple iphone 6S - Red', '', 'Crystal clear and transparent.\nAnti-scratch UV gloss coating and durable soft-touch rubber coating.\nLightweight and ultra slim 0.8mm.\nBrand new 360', '', 1, 1300, '1040', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AP-21-111-15', 'Red', '4897017141248', '', 'Back Case, Hard Case', 'Phone', 'Apple iphone 6S', 'Formulated Polycarbonate', 'Red', '', '', '', '', '', '', '1', '', '', 'Nude', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(39, 'Switcheasy Nude Back Case For Apple iphone 6S - Baby Pink', '', 'Crystal clear and transparent.\nAnti-scratch UV gloss coating and durable soft-touch rubber coating.\nLightweight and ultra slim 0.8mm.\nBrand new 360', '', 1, 1300, '1040', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AP-21-111-41', 'Baby Pink', '4897017141231', '', 'Back Case, Hard Case', 'Phone', 'Apple iphone 6S', 'Formulated Polycarbonate', 'Pink', '', '', '', '', '', '', '1', '', '', 'Nude', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(40, 'Switcheasy Nude Back Case For Apple iphone 6S Plus - Ultra Black', '', 'Crystal clear and transparent.\nAnti-scratch UV gloss coating and durable soft-touch rubber coating.\nLightweight and ultra slim 0.8mm.\nBrand new 360', '', 1, 1400, '1120', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AP-22-111-19', 'Ultra Black', '4897017141255', '', 'Back Case, Hard Case', 'Phone', 'Apple iphone 6S Plus', 'Formulated Polycarbonate', 'Black', '', '', '', '', '', '', '1', '', '', 'Nude plus', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(41, 'Switcheasy Nude Back Case For Apple iphone 6S Plus - Transparent', '', 'Crystal clear and transparent.\nAnti-scratch UV gloss coating and durable soft-touch rubber coating.\nLightweight and ultra slim 0.8mm.\nBrand new 360', '', 1, 1400, '1120', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AP-22-111-20', 'Transparent', '4897017141262', '', 'Back Case, Hard Case', 'Phone', 'Apple iphone 6S Plus', 'Formulated Polycarbonate', 'Transparent', '', '', '', '', '', '', '1', '', '', 'Nude plus', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(42, 'Switcheasy Nude Back Case For Apple iphone 6S Plus - Mint', '', 'Crystal clear and transparent.\nAnti-scratch UV gloss coating and durable soft-touch rubber coating.\nLightweight and ultra slim 0.8mm.\nBrand new 360', '', 1, 1400, '1120', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AP-22-111-57', 'Mint', '', '', 'Back Case, Hard Case', 'Phone', 'Apple iphone 6S Plus', 'Formulated Polycarbonate', 'Green', '', '', '', '', '', '', '1', '', '', 'Nude plus', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(43, 'Switcheasy Nude Back Case For Apple iphone 6S Plus - Red', '', 'Crystal clear and transparent.\nAnti-scratch UV gloss coating and durable soft-touch rubber coating.\nLightweight and ultra slim 0.8mm.\nBrand new 360', '', 1, 1400, '1120', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AP-22-111-15', 'Red', '', '', 'Back Case, Hard Case', 'Phone', 'Apple iphone 6S Plus', 'Formulated Polycarbonate', 'Red', '', '', '', '', '', '', '1', '', '', 'Nude plus', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(44, 'Switcheasy Nude Back Case For Apple iphone 6S Plus - Baby Pink', '', 'Crystal clear and transparent.\nAnti-scratch UV gloss coating and durable soft-touch rubber coating.\nLightweight and ultra slim 0.8mm.\nBrand new 360', '', 1, 1400, '1120', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AP-22-111-41', 'Baby Pink', '', '', 'Back Case, Hard Case', 'Phone', 'Apple iphone 6S Plus', 'Formulated Polycarbonate', 'Pink', '', '', '', '', '', '', '1', '', '', 'Nude plus', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(45, 'Switcheasy N+ Back Case For Apple iphone 6S - Methyl Blue', '', 'TPU-treated ultra thick edges for extra shock absorption.\nPET anti-scratch back shell.\nLaser cut and IMD (In-Mould Decoration) precise cut.\n', '', 1, 1300, '1040', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AP-21-145-13', 'Methyl Blue', '4897017141569', '', 'Back Case, Tough Case', 'Phone', 'Apple iphone 6S', 'TPU/PTE ', 'Blue', '', '', '', '', '', '', '1', '', '', 'N+', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(46, 'Switcheasy N+ Back Case For Apple iphone 6S - Baby Pink', '', 'TPU-treated ultra thick edges for extra shock absorption.\nPET anti-scratch back shell.\nLaser cut and IMD (In-Mould Decoration) precise cut.\n', '', 1, 1300, '1040', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AP-21-145-41', 'Baby Pink', '4897017141576', '', 'Back Case, Tough Case', 'Phone', 'Apple iphone 6S', 'TPU/PTE ', 'Pink', '', '', '', '', '', '', '1', '', '', 'N+', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(47, 'Switcheasy N+ Back Case For Apple iphone 6S - Obsidian', '', 'TPU-treated ultra thick edges for extra shock absorption.\nPET anti-scratch back shell.\nLaser cut and IMD (In-Mould Decoration) precise cut.\n', '', 1, 1300, '1040', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AP-21-145-11', 'Obsidian', '4897017141545', '', 'Back Case, Tough Case', 'Phone', 'Apple iphone 6S', 'TPU/PTE ', 'Black', '', '', '', '', '', '', '1', '', '', 'N+', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(48, 'Switcheasy N+ Back Case For Apple iphone 6S - Ceramic White', '', 'TPU-treated ultra thick edges for extra shock absorption.\nPET anti-scratch back shell.\nLaser cut and IMD (In-Mould Decoration) precise cut.\n', '', 1, 1300, '1040', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AP-21-145-12', 'Ceramic White', '4897017141552', '', 'Back Case, Tough Case', 'Phone', 'Apple iphone 6S', 'TPU/PTE ', 'White', '', '', '', '', '', '', '1', '', '', 'N+', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(49, 'Switcheasy N+ Back Case For Apple iphone 6S Plus - Methyl Blue', '', 'TPU-treated ultra thick edges for extra shock absorption.\nPET anti-scratch back shell.\nLaser cut and IMD (In-Mould Decoration) precise cut.\n', '', 1, 1650, '1320', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AP-22-145-13', 'Methyl Blue', '4897017141620', '', 'Back Case, Tough Case', 'Phone', 'Apple iphone 6S Plus', 'TPU/PTE ', 'Blue', '', '', '', '', '', '', '1', '', '', 'N+ plus', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(50, 'Switcheasy N+ Back Case For Apple iphone 6S Plus - Baby Pink', '', 'TPU-treated ultra thick edges for extra shock absorption.\nPET anti-scratch back shell.\nLaser cut and IMD (In-Mould Decoration) precise cut.\n', '', 1, 1650, '1320', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AP-22-145-41', 'Baby Pink', '4897017141637', '', 'Back Case, Tough Case', 'Phone', 'Apple iphone 6S Plus', 'TPU/PTE ', 'Pink', '', '', '', '', '', '', '1', '', '', 'N+ plus', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(51, 'Switcheasy N+ Back Case For Apple iphone 6S Plus - Obsidian', '', 'TPU-treated ultra thick edges for extra shock absorption.\nPET anti-scratch back shell.\nLaser cut and IMD (In-Mould Decoration) precise cut.\n', '', 1, 1650, '1320', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AP-22-145-11', 'Obsidian', '4897017141606', '', 'Back Case, Tough Case', 'Phone', 'Apple iphone 6S Plus', 'TPU/PTE ', 'Black', '', '', '', '', '', '', '1', '', '', 'N+ plus', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(52, 'Switcheasy N+ Back Case For Apple iphone 6S Plus - Ceramic White', '', 'TPU-treated ultra thick edges for extra shock absorption.\nPET anti-scratch back shell.\nLaser cut and IMD (In-Mould Decoration) precise cut.\n', '', 1, 1650, '1320', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AP-22-145-12', 'Ceramic White', '4897017141613', '', 'Back Case, Tough Case', 'Phone', 'Apple iphone 6S Plus', 'TPU/PTE ', 'White', '', '', '', '', '', '', '1', '', '', 'N+ plus', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(53, 'Otterbox Defender Back Case For Apple iPhone 6S - Black', '', 'Features:\nMulti-layer case protects your investment from potential damage\nBuilt-in touchscreen protector defends against scratches and scrapes\nPort plugs allow for easy access while keeping out dust and debris\nProtective membrane cradles Touch ID, allowing for full functionality\nSnap-click plastic shell ensures hassle-free on-off installation\nHolster clips onto straps and belts, plus it locks in place for hands-free viewing\n\n\nMaterial:\nTwo-piece internal polycarbonate shell snaps around the iPhone 6 while internal foam padding provides cushioning\nIntegrated screen protector guards against scratches and smudges without affecting touchscreen sensitivity\nOuter synthetic rubber slip cover wraps around the inner shell and absorbs impact from drops and bumps\nIncluded holster swivels in any direction, clips easily to belts and bags ', '', 1, 4500, '3600', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, '50206', 'Black', '660543352679', '', 'Back Case, Tough Case', 'Phone', 'Apple iPhone 6S', '', 'Black', '', '', '', '', '', '', '1', '', 'http://www.youtube.com/watch?v=pj_zzwRIEQw&rel=0&hd=1&autoplay=1', 'Defender', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(54, 'Otterbox Defender Back Case For Apple iPhone 6S - GLACIER', '', 'Features:\nMulti-layer case protects your investment from potential damage\nBuilt-in touchscreen protector defends against scratches and scrapes\nPort plugs allow for easy access while keeping out dust and debris\nProtective membrane cradles Touch ID, allowing for full functionality\nSnap-click plastic shell ensures hassle-free on-off installation\nHolster clips onto straps and belts, plus it locks in place for hands-free viewing\n\n\nMaterial:\nTwo-piece internal polycarbonate shell snaps around the iPhone 6 while internal foam padding provides cushioning\nIntegrated screen protector guards against scratches and smudges without affecting touchscreen sensitivity\nOuter synthetic rubber slip cover wraps around the inner shell and absorbs impact from drops and bumps\nIncluded holster swivels in any direction, clips easily to belts and bags ', '', 1, 4500, '3600', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, '50207', 'GLACIER', '660543352686', '', 'Back Case, Tough Case', 'Phone', 'Apple iPhone 6S', '', 'Grey', '', '', '', '', '', '', '1', '', '', 'Defender', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(55, 'Otterbox Commuter Back Case For Apple iPhone 6S - Black', '', 'Features:\nBuilt tough with an inner cushion and a hard outer shell to withstand drops, bumps and shock\nFull access to home button and Touch ID\nUnique styling and textures complement the device for an elegant and refined finish\nUpdated design replicates and preserves every curve of iPhone 6\nAdvanced materials enhance fit and increase durability\n\n\nMaterial:\nDurable internal slipcover cushions iPhone 6 from impacts\nSleek polycarbonate shell provides impact resistance\nSelf-adhesive screen protector guards against smudges and scrapes\n\n\nEnvironmental Protection:\nThe Commuter Series and Commuter Series Wallet case for iPhone 6 provide added protection against drops, bumps and shock but are NOT protective against water.', '', 1, 3000, '2400', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, '50217', 'Black', '660543352785', '', 'Back Case, Tough Case', 'Phone', 'Apple iPhone 6S', '', 'Black', '', '', '', '', '', '', '1', '', '', 'Commuter', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(56, 'Otterbox Commuter Back Case For Apple iPhone 6S - GLACIER', '', 'Features:\nBuilt tough with an inner cushion and a hard outer shell to withstand drops, bumps and shock\nFull access to home button and Touch ID\nUnique styling and textures complement the device for an elegant and refined finish\nUpdated design replicates and preserves every curve of iPhone 6\nAdvanced materials enhance fit and increase durability\n\n\nMaterial:\nDurable internal slipcover cushions iPhone 6 from impacts\nSleek polycarbonate shell provides impact resistance\nSelf-adhesive screen protector guards against smudges and scrapes\n\n\nEnvironmental Protection:\nThe Commuter Series and Commuter Series Wallet case for iPhone 6 provide added protection against drops, bumps and shock but are NOT protective against water.', '', 1, 3000, '2400', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, '50218', 'GLACIER', '660543352792', '', 'Back Case, Tough Case', 'Phone', 'Apple iPhone 6S', '', 'Grey', '', '', '', '', '', '', '1', '', '', 'Commuter', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(57, 'Otterbox Commuter Back Case For Apple iPhone 6S - NEON ROSE', '', 'Features:\nBuilt tough with an inner cushion and a hard outer shell to withstand drops, bumps and shock\nFull access to home button and Touch ID\nUnique styling and textures complement the device for an elegant and refined finish\nUpdated design replicates and preserves every curve of iPhone 6\nAdvanced materials enhance fit and increase durability\n\n\nMaterial:\nDurable internal slipcover cushions iPhone 6 from impacts\nSleek polycarbonate shell provides impact resistance\nSelf-adhesive screen protector guards against smudges and scrapes\n\n\nEnvironmental Protection:\nThe Commuter Series and Commuter Series Wallet case for iPhone 6 provide added protection against drops, bumps and shock but are NOT protective against water.', '', 1, 3000, '2400', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, '50219', 'NEON ROSE', '660543352808', '', 'Back Case, Tough Case', 'Phone', 'Apple iPhone 6S', '', 'Pink', '', '', '', '', '', '', '1', '', '', 'Commuter', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(58, 'Otterbox Commuter Back Case For Apple iPhone 6S - INK BLUE', '', 'Features:\nBuilt tough with an inner cushion and a hard outer shell to withstand drops, bumps and shock\nFull access to home button and Touch ID\nUnique styling and textures complement the device for an elegant and refined finish\nUpdated design replicates and preserves every curve of iPhone 6\nAdvanced materials enhance fit and increase durability\n\n\nMaterial:\nDurable internal slipcover cushions iPhone 6 from impacts\nSleek polycarbonate shell provides impact resistance\nSelf-adhesive screen protector guards against smudges and scrapes\n\n\nEnvironmental Protection:\nThe Commuter Series and Commuter Series Wallet case for iPhone 6 provide added protection against drops, bumps and shock but are NOT protective against water.', '', 1, 3000, '2400', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, '50220', 'INK BLUE', '660543352815', '', 'Back Case, Tough Case', 'Phone', 'Apple iPhone 6S', '', 'Blue', '', '', '', '', '', '', '1', '', '', 'Commuter', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(59, 'Otterbox Commuter Wallet Back Case For Apple iPhone 6S - BLACK', '', 'Features:\nBuilt tough with an inner cushion and a hard outer shell to withstand drops, bumps and shock\nFull access to home button and Touch ID\nUnique styling and textures complement the device for an elegant and refined finish\nUpdated design replicates and preserves every curve of iPhone 6\nAdvanced materials enhance fit and increase durability\n\n\nMaterial:\nDurable internal slipcover cushions iPhone 6 from impacts\nSleek polycarbonate shell provides impact resistance\nSelf-adhesive screen protector guards against smudges and scrapes\nDurable polycarbonate wallet shell wraps around the iPhone 6 to provide added protection and stores your cash and cards\n\n\nEnvironmental Protection:\nThe Commuter Series and Commuter Series Wallet case for iPhone 6 provide added protection against drops, bumps and shock but are NOT protective against water.', '', 1, 3000, '2400', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, '50222', 'BLACK', '660543352839', '', 'Back Case, Tough Case', 'Phone', 'Apple iPhone 6S', '', 'Black', '', '', '', '', '', '', '1', '', '', 'Commuter Wallet', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(60, 'Otterbox Commuter Wallet Back Case For Apple iPhone 6S - GLACIER', '', 'Features:\nBuilt tough with an inner cushion and a hard outer shell to withstand drops, bumps and shock\nFull access to home button and Touch ID\nUnique styling and textures complement the device for an elegant and refined finish\nUpdated design replicates and preserves every curve of iPhone 6\nAdvanced materials enhance fit and increase durability\n\n\nMaterial:\nDurable internal slipcover cushions iPhone 6 from impacts\nSleek polycarbonate shell provides impact resistance\nSelf-adhesive screen protector guards against smudges and scrapes\nDurable polycarbonate wallet shell wraps around the iPhone 6 to provide added protection and stores your cash and cards\n\n\nEnvironmental Protection:\nThe Commuter Series and Commuter Series Wallet case for iPhone 6 provide added protection against drops, bumps and shock but are NOT protective against water.', '', 1, 3000, '2400', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, '50223', 'GLACIER', '660543352846', '', 'Back Case, Tough Case', 'Phone', 'Apple iPhone 6S', '', 'Grey', '', '', '', '', '', '', '1', '', '', 'Commuter Wallet', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(61, 'Otterbox Symmetry Back Case For Apple iPhone 6S - Black', '', 'Features:\nSleek, stylish, pocket-friendly case\nDual-material design absorbs shock and withstands drops\nOne-piece construction for simple, one-step installation\nRaised beveled edge helps protect the screen\nWraparound graphics add seamless style\nAdvanced materials for enhanced fit and increased durability\n\n\nMaterial:\nDual-material, one-piece design composed of a synthetic rubber interior and external polycarbonate shell\nSynthetic rubber interior with honeycomb coring helps absorb shock\nHard polycarbonate exterior helps prevent scratches\nSynthetic rubber raised beveled edge helps keep your touchscreen safe\n\n\nEnvironmental Protection:\nThe Symmetry Series case for iPhone 6 provides added protection against drops, bumps and shock but is NOT protective against water.', '', 1, 4000, '3200', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, '50225', 'Black', '660543352860', '', 'Back Case, Tough Case', 'Phone', 'Apple iPhone 6S', '', 'Black', '', '', '', '', '', '', '1', '', '', 'Symmetry', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(62, 'Otterbox Symmetry Back Case For Apple iPhone 6S - GLACIER', '', 'Features:\nSleek, stylish, pocket-friendly case\nDual-material design absorbs shock and withstands drops\nOne-piece construction for simple, one-step installation\nRaised beveled edge helps protect the screen\nWraparound graphics add seamless style\nAdvanced materials for enhanced fit and increased durability\n\n\nMaterial:\nDual-material, one-piece design composed of a synthetic rubber interior and external polycarbonate shell\nSynthetic rubber interior with honeycomb coring helps absorb shock\nHard polycarbonate exterior helps prevent scratches\nSynthetic rubber raised beveled edge helps keep your touchscreen safe\n\n\nEnvironmental Protection:\nThe Symmetry Series case for iPhone 6 provides added protection against drops, bumps and shock but is NOT protective against water.', '', 1, 4000, '3200', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, '50226', 'GLACIER', '660543352877', '', 'Back Case, Tough Case', 'Phone', 'Apple iPhone 6S', '', 'Grey', '', '', '', '', '', '', '1', '', '', 'Symmetry', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(63, 'Otterbox Symmetry Back Case For Apple iPhone 6S - AQUA DOT', '', 'Features:\nSleek, stylish, pocket-friendly case\nDual-material design absorbs shock and withstands drops\nOne-piece construction for simple, one-step installation\nRaised beveled edge helps protect the screen\nWraparound graphics add seamless style\nAdvanced materials for enhanced fit and increased durability\n\n\nMaterial:\nDual-material, one-piece design composed of a synthetic rubber interior and external polycarbonate shell\nSynthetic rubber interior with honeycomb coring helps absorb shock\nHard polycarbonate exterior helps prevent scratches\nSynthetic rubber raised beveled edge helps keep your touchscreen safe\n\n\nEnvironmental Protection:\nThe Symmetry Series case for iPhone 6 provides added protection against drops, bumps and shock but is NOT protective against water.', '', 1, 4000, '3200', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, '50232', 'AQUA DOT', '660543353836', '', 'Back Case, Tough Case', 'Phone', 'Apple iPhone 6S', '', 'Green', '', '', '', '', '', '', '1', '', '', 'Symmetry', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(64, 'Otterbox Symmetry Back Case For Apple iPhone 6S - FLORAL POND', '', 'Features:\nSleek, stylish, pocket-friendly case\nDual-material design absorbs shock and withstands drops\nOne-piece construction for simple, one-step installation\nRaised beveled edge helps protect the screen\nWraparound graphics add seamless style\nAdvanced materials for enhanced fit and increased durability\n\n\nMaterial:\nDual-material, one-piece design composed of a synthetic rubber interior and external polycarbonate shell\nSynthetic rubber interior with honeycomb coring helps absorb shock\nHard polycarbonate exterior helps prevent scratches\nSynthetic rubber raised beveled edge helps keep your touchscreen safe\n\n\nEnvironmental Protection:\nThe Symmetry Series case for iPhone 6 provides added protection against drops, bumps and shock but is NOT protective against water.', '', 1, 4000, '3200', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, '50233', 'FLORAL POND', '660543353843', '', 'Back Case, Tough Case', 'Phone', 'Apple iPhone 6S', '', 'Blue', '', '', '', '', '', '', '1', '', '', 'Symmetry', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(65, 'Otterbox Symmetry Back Case For Apple iPhone 6S - POPPY PETAL', '', 'Features:\nSleek, stylish, pocket-friendly case\nDual-material design absorbs shock and withstands drops\nOne-piece construction for simple, one-step installation\nRaised beveled edge helps protect the screen\nWraparound graphics add seamless style\nAdvanced materials for enhanced fit and increased durability\n\n\nMaterial:\nDual-material, one-piece design composed of a synthetic rubber interior and external polycarbonate shell\nSynthetic rubber interior with honeycomb coring helps absorb shock\nHard polycarbonate exterior helps prevent scratches\nSynthetic rubber raised beveled edge helps keep your touchscreen safe\n\n\nEnvironmental Protection:\nThe Symmetry Series case for iPhone 6 provides added protection against drops, bumps and shock but is NOT protective against water.', '', 1, 4000, '3200', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, '50234', 'POPPY PETAL', '660543353850', '', 'Back Case, Tough Case', 'Phone', 'Apple iPhone 6S', '', 'Pink', '', '', '', '', '', '', '1', '', '', 'Symmetry', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(66, 'Otterbox Symmetry Back Case For Apple iPhone 6S - EDEN TEAL', '', 'Features:\nSleek, stylish, pocket-friendly case\nDual-material design absorbs shock and withstands drops\nOne-piece construction for simple, one-step installation\nRaised beveled edge helps protect the screen\nWraparound graphics add seamless style\nAdvanced materials for enhanced fit and increased durability\n\n\nMaterial:\nDual-material, one-piece design composed of a synthetic rubber interior and external polycarbonate shell\nSynthetic rubber interior with honeycomb coring helps absorb shock\nHard polycarbonate exterior helps prevent scratches\nSynthetic rubber raised beveled edge helps keep your touchscreen safe\n\n\nEnvironmental Protection:\nThe Symmetry Series case for iPhone 6 provides added protection against drops, bumps and shock but is NOT protective against water.', '', 1, 4000, '3200', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, '50235', 'EDEN TEAL', '660543353867', '', 'Back Case, Tough Case', 'Phone', 'Apple iPhone 6S', '', 'Green', '', '', '', '', '', '', '1', '', '', 'Symmetry', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(67, 'Otterbox Defender Back Case For Apple iphone 6S Plus - Black', '', 'Features:\nMulti-layer case protects your investment from potential damage\nBuilt-in touchscreen protector defends against scratches and scrapes\nPort plugs allow for easy access while keeping out dust and debris\nProtective membrane cradles Touch ID, allowing for full functionality\nSnap-click plastic shell ensures hassle-free on-off installation\nHolster clips onto straps and belts, plus it locks in place for hands-free viewing\n\n\nMaterial:\nTwo-piece internal polycarbonate shell snaps around the iPhone 6 while internal foam padding provides cushioning\nIntegrated screen protector guards against scratches and smudges without affecting touchscreen sensitivity\nOuter synthetic rubber slip cover wraps around the inner shell and absorbs impact from drops and bumps\nIncluded holster swivels in any direction, clips easily to belts and bags ', '', 1, 6000, '4800', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, '50310', 'Black', '660543353614', '', 'Back Case, Tough Case', 'Phone', 'Apple iphone 6S Plus', '', 'Black', '', '', '', '', '', '', '1', '', '', 'Defender', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(68, 'Otterbox Defender Back Case For Apple iphone 6S Plus - GLACIER', '', 'Features:\nMulti-layer case protects your investment from potential damage\nBuilt-in touchscreen protector defends against scratches and scrapes\nPort plugs allow for easy access while keeping out dust and debris\nProtective membrane cradles Touch ID, allowing for full functionality\nSnap-click plastic shell ensures hassle-free on-off installation\nHolster clips onto straps and belts, plus it locks in place for hands-free viewing\n\n\nMaterial:\nTwo-piece internal polycarbonate shell snaps around the iPhone 6 while internal foam padding provides cushioning\nIntegrated screen protector guards against scratches and smudges without affecting touchscreen sensitivity\nOuter synthetic rubber slip cover wraps around the inner shell and absorbs impact from drops and bumps\nIncluded holster swivels in any direction, clips easily to belts and bags ', '', 1, 6000, '4800', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, '50311', 'GLACIER', '660543353621', '', 'Back Case, Tough Case', 'Phone', 'Apple iphone 6S Plus', '', 'Grey', '', '', '', '', '', '', '1', '', '', 'Defender', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0);
INSERT INTO `product` (`id`, `name`, `sku`, `description`, `url`, `visibility`, `price`, `wholesaleprice`, `firstsaleprice`, `secondsaleprice`, `specialpriceto`, `specialpricefrom`, `metatitle`, `metadesc`, `metakeyword`, `quantity`, `status`, `modelnumber`, `brandcolor`, `eanorupc`, `eanorupcmeasuringunits`, `type`, `compatibledevice`, `compatiblewith`, `material`, `color`, `design`, `width`, `height`, `depth`, `portsize`, `packof`, `salespackage`, `keyfeatures`, `videourl`, `modelname`, `finish`, `weight`, `domesticwarranty`, `domesticwarrantymeasuringunits`, `internationalwarranty`, `internationalwarrantymeasuringunits`, `warrantysummary`, `warrantyservicetype`, `coveredinwarranty`, `notcoveredinwarranty`, `size`, `typename`, `colormatch`, `dimension`, `capacity`, `microphone`, `length`, `voltage`) VALUES
(69, 'Otterbox Defender Back Case For Apple iphone 6S Plus - INK BLUE', '', 'Features:\nMulti-layer case protects your investment from potential damage\nBuilt-in touchscreen protector defends against scratches and scrapes\nPort plugs allow for easy access while keeping out dust and debris\nProtective membrane cradles Touch ID, allowing for full functionality\nSnap-click plastic shell ensures hassle-free on-off installation\nHolster clips onto straps and belts, plus it locks in place for hands-free viewing\n\n\nMaterial:\nTwo-piece internal polycarbonate shell snaps around the iPhone 6 while internal foam padding provides cushioning\nIntegrated screen protector guards against scratches and smudges without affecting touchscreen sensitivity\nOuter synthetic rubber slip cover wraps around the inner shell and absorbs impact from drops and bumps\nIncluded holster swivels in any direction, clips easily to belts and bags ', '', 1, 6000, '4800', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, '50314', 'INK BLUE', '660543353652', '', 'Back Case, Tough Case', 'Phone', 'Apple iphone 6S Plus', '', 'Blue', '', '', '', '', '', '', '1', '', '', 'Defender', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(70, 'Otterbox Commuter Back Case For Apple iphone 6S Plus - Black', '', 'Features:\nBuilt tough with an inner cushion and a hard outer shell to withstand drops, bumps and shock\nFull access to home button and Touch ID\nUnique styling and textures complement the device for an elegant and refined finish\nUpdated design replicates and preserves every curve of iPhone 6\nAdvanced materials enhance fit and increase durability\n\n\nMaterial:\nDurable internal slipcover cushions iPhone 6 from impacts\nSleek polycarbonate shell provides impact resistance\nSelf-adhesive screen protector guards against smudges and scrapes\n\n\nEnvironmental Protection:\nThe Commuter Series and Commuter Series Wallet case for iPhone 6 Plus provide added protection against drops, bumps and shock but are NOT protective against water.', '', 1, 3500, '2800', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, '50317', 'Black', '660543353683', '', 'Back Case, Tough Case', 'Phone', 'Apple iphone 6S Plus', '', 'Black', '', '', '', '', '', '', '1', '', '', 'Commuter', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(71, 'Otterbox Commuter Back Case For Apple iphone 6S Plus - GLACIER', '', 'Features:\nBuilt tough with an inner cushion and a hard outer shell to withstand drops, bumps and shock\nFull access to home button and Touch ID\nUnique styling and textures complement the device for an elegant and refined finish\nUpdated design replicates and preserves every curve of iPhone 6\nAdvanced materials enhance fit and increase durability\n\n\nMaterial:\nDurable internal slipcover cushions iPhone 6 from impacts\nSleek polycarbonate shell provides impact resistance\nSelf-adhesive screen protector guards against smudges and scrapes\n\n\nEnvironmental Protection:\nThe Commuter Series and Commuter Series Wallet case for iPhone 6 Plus provide added protection against drops, bumps and shock but are NOT protective against water.', '', 1, 3500, '2800', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, '50318', 'GLACIER', '660543353690', '', 'Back Case, Tough Case', 'Phone', 'Apple iphone 6S Plus', '', 'Grey', '', '', '', '', '', '', '1', '', '', 'Commuter', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(72, 'Otterbox Commuter Back Case For Apple iphone 6S Plus - NEON ROSE', '', 'Features:\nBuilt tough with an inner cushion and a hard outer shell to withstand drops, bumps and shock\nFull access to home button and Touch ID\nUnique styling and textures complement the device for an elegant and refined finish\nUpdated design replicates and preserves every curve of iPhone 6\nAdvanced materials enhance fit and increase durability\n\n\nMaterial:\nDurable internal slipcover cushions iPhone 6 from impacts\nSleek polycarbonate shell provides impact resistance\nSelf-adhesive screen protector guards against smudges and scrapes\n\n\nEnvironmental Protection:\nThe Commuter Series and Commuter Series Wallet case for iPhone 6 Plus provide added protection against drops, bumps and shock but are NOT protective against water.', '', 1, 3500, '2800', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, '50319', 'NEON ROSE', '660543353706', '', 'Back Case, Tough Case', 'Phone', 'Apple iphone 6S Plus', '', 'Pink', '', '', '', '', '', '', '1', '', '', 'Commuter', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(73, 'Otterbox Commuter Back Case For Apple iphone 6S Plus - INK BLUE', '', 'Features:\nBuilt tough with an inner cushion and a hard outer shell to withstand drops, bumps and shock\nFull access to home button and Touch ID\nUnique styling and textures complement the device for an elegant and refined finish\nUpdated design replicates and preserves every curve of iPhone 6\nAdvanced materials enhance fit and increase durability\n\n\nMaterial:\nDurable internal slipcover cushions iPhone 6 from impacts\nSleek polycarbonate shell provides impact resistance\nSelf-adhesive screen protector guards against smudges and scrapes\n\n\nEnvironmental Protection:\nThe Commuter Series and Commuter Series Wallet case for iPhone 6 Plus provide added protection against drops, bumps and shock but are NOT protective against water.', '', 1, 3500, '2800', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, '50320', 'INK BLUE', '660543353713', '', 'Back Case, Tough Case', 'Phone', 'Apple iphone 6S Plus', '', 'Blue', '', '', '', '', '', '', '1', '', '', 'Commuter', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(74, 'Otterbox Commuter Back Case For Apple iphone 6S Plus - AQUA SKY', '', 'Features:\nBuilt tough with an inner cushion and a hard outer shell to withstand drops, bumps and shock\nFull access to home button and Touch ID\nUnique styling and textures complement the device for an elegant and refined finish\nUpdated design replicates and preserves every curve of iPhone 6\nAdvanced materials enhance fit and increase durability\n\n\nMaterial:\nDurable internal slipcover cushions iPhone 6 from impacts\nSleek polycarbonate shell provides impact resistance\nSelf-adhesive screen protector guards against smudges and scrapes\n\n\nEnvironmental Protection:\nThe Commuter Series and Commuter Series Wallet case for iPhone 6 Plus provide added protection against drops, bumps and shock but are NOT protective against water.', '', 1, 3500, '2800', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, '50321', 'AQUA SKY', '660543353720', '', 'Back Case, Tough Case', 'Phone', 'Apple iphone 6S Plus', '', 'Green', '', '', '', '', '', '', '1', '', '', 'Commuter', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(75, 'Otterbox Symmetry Back Case For Apple iphone 6S Plus - Black', '', 'Features:\nSleek, stylish, pocket-friendly case\nDual-material design absorbs shock and withstands drops\nOne-piece construction for simple, one-step installation\nRaised beveled edge helps protect the screen\nWraparound graphics add seamless style\nAdvanced materials for enhanced fit and increased durability\n\n\nMaterial:\nDual-material, one-piece design composed of a synthetic rubber interior and external polycarbonate shell\nSynthetic rubber interior with honeycomb coring helps absorb shock\nHard polycarbonate exterior helps prevent scratches\nSynthetic rubber raised beveled edge helps keep your touchscreen safe\n\n\nEnvironmental Protection:\nThe Symmetry Series case for iPhone 6 Plus provides added protection against drops, bumps and shock but is NOT protective against water.', '', 1, 4500, '3600', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, '50322', 'Black', '660543353737', '', 'Back Case, Tough Case', 'Phone', 'Apple iphone 6S Plus', '', 'Black', '', '', '', '', '', '', '1', '', '', 'Symmetry', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(76, 'Otterbox Symmetry Back Case For Apple iphone 6S Plus - GLACIER', '', 'Features:\nSleek, stylish, pocket-friendly case\nDual-material design absorbs shock and withstands drops\nOne-piece construction for simple, one-step installation\nRaised beveled edge helps protect the screen\nWraparound graphics add seamless style\nAdvanced materials for enhanced fit and increased durability\n\n\nMaterial:\nDual-material, one-piece design composed of a synthetic rubber interior and external polycarbonate shell\nSynthetic rubber interior with honeycomb coring helps absorb shock\nHard polycarbonate exterior helps prevent scratches\nSynthetic rubber raised beveled edge helps keep your touchscreen safe\n\n\nEnvironmental Protection:\nThe Symmetry Series case for iPhone 6 Plus provides added protection against drops, bumps and shock but is NOT protective against water.', '', 1, 4500, '3600', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, '50323', 'GLACIER', '660543353744', '', 'Back Case, Tough Case', 'Phone', 'Apple iphone 6S Plus', '', 'Grey', '', '', '', '', '', '', '1', '', '', 'Symmetry', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(77, 'Otterbox Symmetry Back Case For Apple iphone 6S Plus - BLUE PRINT', '', 'Features:\nSleek, stylish, pocket-friendly case\nDual-material design absorbs shock and withstands drops\nOne-piece construction for simple, one-step installation\nRaised beveled edge helps protect the screen\nWraparound graphics add seamless style\nAdvanced materials for enhanced fit and increased durability\n\n\nMaterial:\nDual-material, one-piece design composed of a synthetic rubber interior and external polycarbonate shell\nSynthetic rubber interior with honeycomb coring helps absorb shock\nHard polycarbonate exterior helps prevent scratches\nSynthetic rubber raised beveled edge helps keep your touchscreen safe\n\n\nEnvironmental Protection:\nThe Symmetry Series case for iPhone 6 Plus provides added protection against drops, bumps and shock but is NOT protective against water.', '', 1, 4500, '3600', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, '50325', 'BLUE PRINT', '660543353768', '', 'Back Case, Tough Case', 'Phone', 'Apple iphone 6S Plus', '', 'Blue', '', '', '', '', '', '', '1', '', '', 'Symmetry', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(78, 'Otterbox Symmetry Back Case For Apple iphone 6S Plus - AQUA DOT', '', 'Features:\nSleek, stylish, pocket-friendly case\nDual-material design absorbs shock and withstands drops\nOne-piece construction for simple, one-step installation\nRaised beveled edge helps protect the screen\nWraparound graphics add seamless style\nAdvanced materials for enhanced fit and increased durability\n\n\nMaterial:\nDual-material, one-piece design composed of a synthetic rubber interior and external polycarbonate shell\nSynthetic rubber interior with honeycomb coring helps absorb shock\nHard polycarbonate exterior helps prevent scratches\nSynthetic rubber raised beveled edge helps keep your touchscreen safe\n\n\nEnvironmental Protection:\nThe Symmetry Series case for iPhone 6 Plus provides added protection against drops, bumps and shock but is NOT protective against water.', '', 1, 4500, '3600', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, '50326', 'AQUA DOT', '660543353775', '', 'Back Case, Tough Case', 'Phone', 'Apple iphone 6S Plus', '', 'Green', '', '', '', '', '', '', '1', '', '', 'Symmetry', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(79, 'Otterbox Symmetry Back Case For Apple iphone 6S Plus - FLORAL POND', '', 'Features:\nSleek, stylish, pocket-friendly case\nDual-material design absorbs shock and withstands drops\nOne-piece construction for simple, one-step installation\nRaised beveled edge helps protect the screen\nWraparound graphics add seamless style\nAdvanced materials for enhanced fit and increased durability\n\n\nMaterial:\nDual-material, one-piece design composed of a synthetic rubber interior and external polycarbonate shell\nSynthetic rubber interior with honeycomb coring helps absorb shock\nHard polycarbonate exterior helps prevent scratches\nSynthetic rubber raised beveled edge helps keep your touchscreen safe\n\n\nEnvironmental Protection:\nThe Symmetry Series case for iPhone 6 Plus provides added protection against drops, bumps and shock but is NOT protective against water.', '', 1, 4500, '3600', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, '50327', 'FLORAL POND', '660543353782', '', 'Back Case, Tough Case', 'Phone', 'Apple iphone 6S Plus', '', 'Blue', '', '', '', '', '', '', '1', '', '', 'Symmetry', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(80, 'Guess Studded Flip Case For Apple iPhone 6 Plus - Black', '', 'Guess Studded iphone 6 Plus Book-type Leather case', '', 1, 3500, '2800', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'GUFLBKP6LSAB', 'Black', '3700740342244', '', 'Flip Case', 'Phone', 'Apple iPhone 6 Plus', 'PU Leather', 'Black', '', '', '', '', '', '', '1', '', '', 'Studded', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'GUFLBKP6LSA', '', '', '', '', 0),
(81, 'Guess Studded Flip Case For Apple iPhone 6 Plus - Beige', '', 'Guess Studded iphone 6 Plus Book-type Leather case', '', 1, 3500, '2800', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'GUFLBKP6LSAC', 'Beige', '3700740342251', '', 'Flip Case', 'Phone', 'Apple iPhone 6 Plus', 'PU Leather', 'Beige', '', '', '', '', '', '', '1', '', '', 'Studded', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'GUFLBKP6LSA', '', '', '', '', 0),
(82, 'Guess Studded Back Case For Apple iPhone 6 - Black', '', '', '', 1, 2500, '2000', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'GUHCP6SAB', 'Black', '3700740342619', '', 'Back Case, Hard Case', 'Phone', 'Apple iPhone 6', 'Polycarbonate', 'Black', '', '', '', '', '', '', '1', '', '', 'Studded', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'GUHCP6SA', '', '', '', '', 0),
(83, 'Guess Studded Back Case For Apple iPhone 6 - Beige', '', '', '', 1, 2500, '2000', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'GUHCP6SAC', 'Beige', '3700740342626', '', 'Back Case, Hard Case', 'Phone', 'Apple iPhone 6', 'Polycarbonate', 'Beige', '', '', '', '', '', '', '1', '', '', 'Studded', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'GUHCP6SA', '', '', '', '', 0),
(84, 'Guess Studded Back Case For Apple iPhone 6 - Grey', '', '', '', 1, 2500, '2000', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'GUHCP6SAS', 'Grey', '3700740342633', '', 'Back Case, Hard Case', 'Phone', 'Apple iPhone 6', 'Polycarbonate', 'Grey', '', '', '', '', '', '', '1', '', '', 'Studded', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'GUHCP6SA', '', '', '', '', 0),
(85, 'Guess Studded Back Case For Apple iPhone 6 Plus - Black', '', '', '', 1, 3000, '2400', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'GUHCP6LSAB', 'Black', '3700740342589', '', 'Back Case, Hard Case', 'Phone', 'Apple iPhone 6 Plus', 'Polycarbonate', 'Black', '', '', '', '', '', '', '1', '', '', 'Studded', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'GUHCP6LSA', '', '', '', '', 0),
(86, 'Guess Studded Back Case For Apple iPhone 6 Plus - Beige', '', '', '', 1, 3000, '2400', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'GUHCP6LSAC', 'Beige', '3700740342596', '', 'Back Case, Hard Case', 'Phone', 'Apple iPhone 6 Plus', 'Polycarbonate', 'Beige', '', '', '', '', '', '', '1', '', '', 'Studded', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'GUHCP6LSA', '', '', '', '', 0),
(87, 'Guess Studded Back Case For Apple iPhone 6 Plus - Grey', '', '', '', 1, 3000, '2400', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'GUHCP6LSAS', 'Grey', '3700740342602', '', 'Back Case, Hard Case', 'Phone', 'Apple iPhone 6 Plus', 'Polycarbonate', 'Grey', '', '', '', '', '', '', '1', '', '', 'Studded', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'GUHCP6LSA', '', '', '', '', 0),
(88, 'Guess Studded Flip Case For Apple iPhone 6 - Black', '', '', '', 1, 3000, '2400', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'GUFLBKP6SAB', 'Black', '3700740341797', '', 'Flip Cover', 'Phone', 'Apple iPhone 6', 'PU Leather', 'Black', '', '', '', '', '', '', '1', '', '', 'Studded', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'GUFLBKP6SA', '', '', '', '', 0),
(89, 'Guess Studded Flip Case For Apple iPhone 6 - Beige', '', '', '', 1, 3000, '2400', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'GUFLBKP6SAC', 'Beige', '3700740341810', '', 'Flip Cover', 'Phone', 'Apple iPhone 6', 'PU Leather', 'Beige', '', '', '', '', '', '', '1', '', '', 'Studded', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'GUFLBKP6SA', '', '', '', '', 0),
(90, 'Guess Studded Flip Case For Apple iPhone 6 - White', '', '', '', 1, 3000, '2400', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'GUFLBKP6STW', 'White', '3700740341889', '', 'Flip Cover', 'Phone', 'Apple iPhone 6', 'PU Leather', 'White', '', '', '', '', '', '', '1', '', '', 'Studded', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'GUFLBKP6ST', '', '', '', '', 0),
(91, 'Bling My Thing Vogue Back Case For Apple iPhone 6 Plus - Gold', '', 'The Cascade Collection takes Bling My Thing back to its root: pure luxury BLING! The Brilliant series offers beautiful gradation designs brought by our Chief Designer, Ayano Kimura. The way she mixes 3 crystal colors is truly magical. 567 pieces of SS9 Xilion Rose crystals (2.6mm) are embedded individually to create the maximum light refraction while allowing colors to change subtly from top to bottom. Ayano chose various combinations of colors for the Brillian series but this Brillian Gold design takes the the concept of gold to the next level by incorporating two of the special coated crystals,  Crystal Golden Shadow and Crystal Moonlight, she managed to create subtle, mysterious shimmering effect on the crystal surface. The result is pure elegance. The background case color also changes in color from top to bottom, matching the crystal colors.\n', '', 1, 14900, '11920', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'IP6-I-VG-GIG-IGM', 'Gold', '', '', 'Back Case, Hard Case', 'Phone', 'Apple iPhone 6 Plus', '', 'Gold', '', '', '', '', '', '', '1', '', '', 'Vogue', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'Vogue 6 Plus', '', '', '', '', 0),
(92, 'Bling My Thing Vogue Back Case For Apple iPhone 6 Plus - Black', '', 'The Cascade Collection takes Bling My Thing back to its root: pure luxury BLING! The Brilliant series offers beautiful gradation designs brought by our Chief Designer, Ayano Kimura. The way she mixes 3 crystal colors is truly magical. 567 pieces of SS9 Xilion Rose crystals (2.6mm) are embedded individually to create the maximum light refraction while allowing colors to change subtly from top to bottom. Ayano chose various combinations of colors for the Brillian series but this Brillian Onyx case is the classic example of elegance. The background case color also changes in color from top to bottom, matching the crystal colors.\n', '', 1, 14900, '11920', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'IP6-I-VG-BKG-JCC', 'Black', '', '', 'Back Case, Hard Case', 'Phone', 'Apple iPhone 6 Plus', '', 'Black', '', '', '', '', '', '', '1', '', '', 'Vogue', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'Vogue 6 Plus', '', '', '', '', 0),
(93, 'Bling My Thing Milkyway Back Case For Apple iPhone 6 Plus - Cotton Candy', '', 'Milky Way designs have been Bling My Thing', '', 1, 4000, '3200', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'IP6-I-MW-CL-CCD', 'Cotton Candy', '', '', 'Back Case, Hard Case', 'Phone', 'Apple iPhone 6 Plus', '', 'Transparent', '', '', '', '', '', '', '1', '', '', 'Milkyway', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'Milkyway 6 Plus', '', '', '', '', 0),
(94, 'Bling My Thing Motoki Back Case For Apple iPhone 6 - Transparent', '', 'Full description\nFor those who want a clear, hard case for iPhone 6, you should look for the following characteristics:\n- does it have a sufficient thickness to protect your phone?\n- Is is ultra-clear?\n- is it with anti-scratch coating?\n- can you access all ports easily?\n- is it made of high-grade polycarbonate which makes the case extra durable?\nMOTOKI Clear case has it all!', '', 1, 2000, '1600', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'ip6-mtk-cl-non', 'Transparent', '', '', 'Back Case, Hard Case', 'Phone', 'Apple iPhone 6', '', 'Transparent', '', '', '', '', '', '', '1', '', '', 'Motoki', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'Motoki 6', '', '', '', '', 0),
(95, 'Bling My Thing Motoki Back Case For Apple iPhone 6 - Tinted Grey', '', 'For those who want a clear, hard case for iPhone 6, you should look for the following characteristics:\n- does it have a sufficient thickness to protect your phone?\n- Is is ultra-clear?\n- is it with anti-scratch coating?\n- can you access all ports easily?\n- is it made of high-grade polycarbonate which makes the case extra durable?\nMOTOKI Black Tinted case has it all! Put in on Space Grey iPhone, it will make it look much darker.', '', 1, 2000, '1600', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'ip6-mtk-gy-non', 'Tinted Grey', '', '', 'Back Case, Hard Case', 'Phone', 'Apple iPhone 6', '', 'Grey', '', '', '', '', '', '', '1', '', '', 'Motoki', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'Motoki 6', '', '', '', '', 0),
(96, 'Bling My Thing Motoki Back Case For Apple iPhone 6 - Tinted Pink', '', 'For those who want a clear, hard case for iPhone 6, you should look for the following characteristics:\n- does it have a sufficient thickness to protect your phone?\n- Is is ultra-clear?\n- is it with anti-scratch coating?\n- can you access all ports easily?\n- is it made of high-grade polycarbonate which makes the case extra durable?\nMOTOKI Pink case has it all! Be the first one to carry a pink iPhone 6!', '', 1, 2000, '1600', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'ip6-mtk-pk-non', 'Tinted Pink', '', '', 'Back Case, Hard Case', 'Phone', 'Apple iPhone 6', '', 'Pink', '', '', '', '', '', '', '1', '', '', 'Motoki', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'Motoki 6', '', '', '', '', 0),
(97, 'Bling My Thing Mosaic Back Case For Apple iPhone 6 - Transparent', '', 'Full description\nMosaic has a unique translucent finish with tiny cubic patterns etched across the surface, which creates stunning shimmering effect.  You can still see the color of the iPhone and more importantly, the Apple logo remains visible.\nUnlike the standard clear hard case, the case will always remain scratch and smudge free. It has a super sleek appearance but it has the most optimal thickness to protect your device. Made of high grade polycarbonate, the case is very durable and protects the phone well.', '', 1, 2000, '1600', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'ip6-ms-cl-non', 'Transparent', '', '', 'Back Case, Hard Case', 'Phone', 'Apple iPhone 6', '', 'Transparent', '', '', '', '', '', '', '1', '', '', 'Mosaic', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'Mosaic 6', '', '', '', '', 0),
(98, 'Bling My Thing Mosaic Back Case For Apple iPhone 6 - Cappuccino', '', 'Full description\nMosaic has a unique translucent finish with tiny cubic patterns etched across the surface, which creates stunning shimmering effect.  You can still see the color of the iPhone and more importantly, the Apple logo remains visible.\nUnlike the standard clear hard case, the case will always remain scratch and smudge free. It has a super sleek appearance but it has the most optimal thickness to protect your device. Made of high grade polycarbonate, the case is very durable and protects the phone well.', '', 1, 2000, '1600', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'ip6-ms-gy-non', 'Cappuccino', '', '', 'Back Case, Hard Case', 'Phone', 'Apple iPhone 6', '', 'Grey', '', '', '', '', '', '', '1', '', '', 'Mosaic', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'Mosaic 6', '', '', '', '', 0),
(99, 'Bling My Thing Mosaic Back Case For Apple iPhone 6 - Pink', '', 'Full description\nMosaic has a unique translucent finish with tiny cubic patterns etched across the surface, which creates stunning shimmering effect.  You can still see the color of the iPhone and more importantly, the Apple logo remains visible.\nUnlike the standard clear hard case, the case will always remain scratch and smudge free. It has a super sleek appearance but it has the most optimal thickness to protect your device. Made of high grade polycarbonate, the case is very durable and protects the phone well.', '', 1, 2000, '1600', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'ip6-ms-pk-non', 'Pink', '', '', 'Back Case, Hard Case', 'Phone', 'Apple iPhone 6', '', 'Pink', '', '', '', '', '', '', '1', '', '', 'Mosaic', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'Mosaic 6', '', '', '', '', 0),
(100, 'Bling My Thing Expression Back Case For Apple iPhone 6 - Transparent', '', 'The newest injection technology allows a fusion of soft TUP bumper (shock-absorption) and a sheet of ultra-clear polycarbonate with anti-scratch property.  The bumper thickness is perfectly optimised to make it the sleekest case with soft bumper in the market.                                \n', '', 1, 2000, '1600', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'ip6-ex-cl-ice', 'Transparent', '', '', 'Back Case, Soft Case', 'Phone', 'Apple iPhone 6', '', 'Transparent', '', '', '', '', '', '', '1', '', '', 'Expression', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'Expression 6', '', '', '', '', 0),
(101, 'Bling My Thing Glam Back Case For Apple iPhone 6 - Gold/Black', '', 'Full description\nDazzle series uses 1,496 tiny diamond-like pointback chaton crystals to create ultimate sparkly effects for your iPhone 6 case. Each crystal is cut to optimize the way light reflects onto it: imagine how your case would look if it has almost 1,500 pieces of bling crystals on it! A perfect case for a glamorous night out!\n', '', 1, 3500, '2800', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'ip6-gm-bk-gld', 'Gold/Black', '', '', 'Back Case, Hard Case', 'Phone', 'Apple iPhone 6', '', 'Gold', '', '', '', '', '', '', '1', '', '', 'Glam', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'Glam 6', '', '', '', '', 0),
(102, 'Bling My Thing Glam Back Case For Apple iPhone 6 - Crystal/Black', '', 'Full description\nDazzle series uses 1,496 tiny diamond-like pointback chaton crystals to create ultimate sparkly effects for your iPhone 6 case. Each crystal is cut to optimize the way light reflects onto it: imagine how your case would look if it has almost 1,500 pieces of bling crystals on it! A perfect case for a glamorous night out!\n', '', 1, 3500, '2800', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'ip6-gm-bk-cry', 'Crystal/Black', '', '', 'Back Case, Hard Case', 'Phone', 'Apple iPhone 6', '', 'Silver', '', '', '', '', '', '', '1', '', '', 'Glam', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'Glam 6', '', '', '', '', 0),
(103, 'Bling My Thing Wish Back Case For Apple iPhone 6 - Crystal', '', 'Despite its plain appearance, Wish Crystal case for iPhone 6 is encrusted with tiniest crystals from Swarovski to form a waterfall-like pattern - as if they are falling from the sky. Tiny twinkling stars at the edge of each string of crystals add a playful accent. Ultra-clear, durable polycarbonate casing protects your iPhone while adding glamour. Fits any iPhone body colors.                \n', '', 1, 3500, '2800', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'ip6-ws-cl-cry', 'Crystal', '', '', 'Back Case, Hard Case', 'Phone', 'Apple iPhone 6', '', 'Transparent', '', '', '', '', '', '', '1', '', '', 'Wish', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'Wish 6', '', '', '', '', 0),
(104, 'Bling My Thing Wish Back Case For Apple iPhone 6 - Cotton Candy', '', 'Despite its plain appearance, Wish (Cotton Candy) case for iPhone 6 is encrusted with tiniest, pastel-colored crystals from Swarovski to form a waterfall-like pattern - as if they are falling from the sky. Tiny twinkling stars at the edge of each string of crystals add a playful accent. Ultra-clear, durable polycarbonate casing protects your iPhone while adding glamour. Fits any iPhone body colors.                \n', '', 1, 3500, '2800', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'ip6-ws-cl-ccd', 'Cotton Candy', '', '', 'Back Case, Hard Case', 'Phone', 'Apple iPhone 6', '', 'Transparent', '', '', '', '', '', '', '1', '', '', 'Wish', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'Wish 6', '', '', '', '', 0),
(105, 'Bling My Thing Papillon Back Case For Apple iPhone 6 - Crystal', '', 'Papillon Butterfly series is new to the Simple Is Beautiful Collection of Bling My Thing. A small butterfly crystal accentuates the playfulness of the design, where a beautiful crystal swirl subtly extends across the whole surface. With ', '', 1, 3500, '2800', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'ip6-pp-cl-cry', 'Crystal', '', '', 'Back Case, Hard Case', 'Phone', 'Apple iPhone 6', '', 'Transparent', '', '', '', '', '', '', '1', '', '', 'Papillon', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'Papillon 6', '', '', '', '', 0),
(106, 'Bling My Thing Papillon Back Case For Apple iPhone 6 - Cotton Candy', '', 'Papillon Butterfly series is new to the Simple Is Beautiful Collection of Bling My Thing. A small butterfly crystal accentuates the playfulness of the design, whilst a beautiful pastel-colored crystal swirl extends across the whole surface. The combination of 7 different colors of crystals is certainly eye-catching, and guaranteed to add extra H-A-P-P-I-N-E-S-S to your iPhone 6! Ultra-clear, durable polycarbonate casing protects your iPhone while adding glamour. Fits any iPhone body colors.                \n', '', 1, 3500, '2800', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'ip6-pp-cl-ccd', 'Cotton Candy', '', '', 'Back Case, Hard Case', 'Phone', 'Apple iPhone 6', '', 'Transparent', '', '', '', '', '', '', '1', '', '', 'Papillon', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'Papillon 6', '', '', '', '', 0),
(107, 'Bling My Thing Papillon Back Case For Apple iPhone 6 - Pink Mix', '', 'Papillon Butterfly series is new to the Simple Is Beautiful Collection of Bling My Thing. A small butterfly crystal accentuates the playfulness of the design, where a beautiful crystal swirl subtly extends across the whole surface. Pink Mixes uses Rose and Light Rose in the crystal swirl, and it makes it look more three dimensional. It is really cute! Ultra-clear, durable polycarbonate casing protects your iPhone while adding glamour. Fits any iPhone body colors.                \n', '', 1, 3500, '2800', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'ip6-pp-cl-pkm', 'Pink Mix', '', '', 'Back Case, Hard Case', 'Phone', 'Apple iPhone 6', '', 'Transparent', '', '', '', '', '', '', '1', '', '', 'Papillon', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'Papillon 6', '', '', '', '', 0),
(108, 'Bling My Thing Milkyway Back Case For Apple iPhone 6 - Crystal', '', 'Milky Way designs have been Bling My Thing', '', 1, 3500, '2800', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'ip6-mw-cl-cry', 'Crystal', '', '', 'Back Case, Hard Case', 'Phone', 'Apple iPhone 6', '', 'Transparent', '', '', '', '', '', '', '1', '', '', 'Milkyway', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'Milkyway 6', '', '', '', '', 0),
(109, 'Bling My Thing Milkyway Back Case For Apple iPhone 6 - Cotton Candy', '', 'Milky Way designs have been Bling My Thing', '', 1, 3500, '2800', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'ip6-mw-cl-ccd', 'Cotton Candy', '', '', 'Back Case, Hard Case', 'Phone', 'Apple iPhone 6', '', 'Transparent', '', '', '', '', '', '', '1', '', '', 'Milkyway', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'Milkyway 6', '', '', '', '', 0),
(110, 'Bling My Thing Milkyway Back Case For Apple iPhone 6 - Pink Mix', '', 'Milky Way designs have been Bling My Thing', '', 1, 3500, '2800', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'ip6-mw-cl-pkm', 'Pink Mix', '', '', 'Back Case, Hard Case', 'Phone', 'Apple iPhone 6', '', 'Transparent', '', '', '', '', '', '', '1', '', '', 'Milkyway', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'Milkyway 6', '', '', '', '', 0),
(111, 'Bling My Thing Milkyway Back Case For Apple iPhone 6 - Angel Mix', '', 'Milky Way designs have been Bling My Thing', '', 1, 3500, '2800', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'ip6-mw-cl-agm', 'Angel Mix', '', '', 'Back Case, Hard Case', 'Phone', 'Apple iPhone 6', '', 'Transparent', '', '', '', '', '', '', '1', '', '', 'Milkyway', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'Milkyway 6', '', '', '', '', 0),
(112, 'Bling My Thing Ayano Primo Flip Case For Apple iPhone 6 - Black', '', 'Primo Nero for iPhone 6 is a unique, functional case with amazing features. You cannot get a better deal than this product!\n', '', 1, 3500, '2800', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'ip6-pri-bk-non', 'Black', '', '', 'Flip Case', 'Phone', 'Apple iPhone 6', 'PU Leather', 'Black', '', '', '', '', '', '', '1', '', '', 'Ayano Primo', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'Ayano Primo 6', '', '', '', '', 0),
(113, 'Bling My Thing Ayano Primo Flip Case For Apple iPhone 6 - White', '', 'Primo Blanco for iPhone 6  is a unique, functional case with amazing features. You cannot get a better deal than this product!\n', '', 1, 3500, '2800', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'ip6-pri-wt-non', 'White', '', '', 'Flip Case', 'Phone', 'Apple iPhone 6', 'PU Leather', 'White', '', '', '', '', '', '', '1', '', '', 'Ayano Primo', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'Ayano Primo 6', '', '', '', '', 0),
(114, 'Bling My Thing Ayano Primo Flip Case For Apple iPhone 6 Plus - Black', '', 'Primo Nero for iPhone 6 Plus is a unique, functional case with amazing features. You cannot get a better deal than this product!\n', '', 1, 4000, '3200', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'ip6-l-pri-bk-non', 'Black', '', '', 'Flip Case', 'Phone', 'Apple iPhone 6 Plus', 'PU Leather', 'Black', '', '', '', '', '', '', '1', '', '', 'Ayano Primo', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'Ayano Primo 6 Plus', '', '', '', '', 0),
(115, 'Bling My Thing Ayano Primo Flip Case For Apple iPhone 6 Plus - White', '', 'Primo Blanco for iPhone 6 Plus is a unique, functional case with amazing features. You cannot get a better deal than this product!\n', '', 1, 4000, '3200', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'ip6-l-pri-wt-non', 'White', '', '', 'Flip Case', 'Phone', 'Apple iPhone 6 Plus', 'PU Leather', 'White', '', '', '', '', '', '', '1', '', '', 'Ayano Primo', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'Ayano Primo 6 Plus', '', '', '', '', 0),
(116, 'Bling My Thing Expression Back Case For Apple iPhone 6 Plus - Transparent', '', 'The newest injection technology allows a fusion of soft TUP bumper (shock-absorption) and a sheet of ultra-clear polycarbonate with anti-scratch property.  The bumper thickness is perfectly optimised to make it the sleekest case with soft bumper in the market.                                   \n', '', 1, 2250, '1800', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'ip6-l-ex-cl-ice', 'Transparent', '', '', 'Back Case, Soft Case', 'Phone', 'Apple iPhone 6 Plus', '', 'Transparent', '', '', '', '', '', '', '1', '', '', 'Expression', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'Expression 6 Plus', '', '', '', '', 0),
(117, 'Bling My Thing Mosaic Back Case For Apple iPhone 6 Plus - Transparent', '', 'Full description\nMosaic has a unique translucent finish with tiny cubic patterns etched across the surface, which creates stunning shimmering effect.  You can still see the color of the iPhone and more importantly, the Apple logo remains visible.\nUnlike the standard clear hard case, the case will always remain scratch and smudge free. It has a super sleek appearance but it has the most optimal thickness to protect your device. Made of high grade polycarbonate, the case is very durable and protects the phone well.', '', 1, 2250, '1800', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'ip6-l-ms-cl-non', 'Transparent', '', '', 'Back Case, Hard Case', 'Phone', 'Apple iPhone 6 Plus', '', 'Transparent', '', '', '', '', '', '', '1', '', '', 'Mosaic', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'Mosaic 6 Plus', '', '', '', '', 0),
(118, 'Bling My Thing Motoki Back Case For Apple iPhone 6 Plus - Transparent', '', 'For those who want a clear, hard case for iPhone 6 Plus, you should look for the following characteristics:\n- does it have a sufficient thickness to protect your phone?\n- Is is ultra-clear?\n- is it with anti-scratch coating?\n- can you access all ports easily?\n- is it made of high-grade polycarbonate which makes the case extra durable?\nMOTOKI Clear case has it all!', '', 1, 2250, '1800', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'ip6-l-mtk-cl-non', 'Transparent', '', '', 'Back Case, Hard Case', 'Phone', 'Apple iPhone 6 Plus', '', 'Transparent', '', '', '', '', '', '', '1', '', '', 'Motoki', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'Motoki 6 Plus', '', '', '', '', 0),
(119, 'Bling My Thing Motoki Back Case For Apple iPhone 6 Plus - Tinted Grey', '', 'For those who want a clear, hard case for iPhone 6 Plus, you should look for the following characteristics:\n- does it have a sufficient thickness to protect your phone?\n- Is is ultra-clear?\n- is it with anti-scratch coating?\n- can you access all ports easily?\n- is it made of high-grade polycarbonate which makes the case extra durable?\nMOTOKI Black Tinted case has it all! Put in on Space Grey iPhone, it will make it look much darker.', '', 1, 2250, '1800', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'ip6-l-mtk-gy-non', 'Tinted Grey', '', '', 'Back Case, Hard Case', 'Phone', 'Apple iPhone 6 Plus', '', 'Grey', '', '', '', '', '', '', '1', '', '', 'Motoki', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'Motoki 6 Plus', '', '', '', '', 0),
(120, 'Bling My Thing Motoki Back Case For Apple iPhone 6 Plus - Tinted Pink', '', 'For those who want a clear, hard case for iPhone 6 Plus, you should look for the following characteristics:\n- does it have a sufficient thickness to protect your phone?\n- Is is ultra-clear?\n- is it with anti-scratch coating?\n- can you access all ports easily?\n- is it made of high-grade polycarbonate which makes the case extra durable?\nMOTOKI Pink case has it all! Be the first one to carry a pink iPhone 6!', '', 1, 2250, '1800', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'ip6-l-mtk-pk-non', 'Tinted Pink', '', '', 'Back Case, Hard Case', 'Phone', 'Apple iPhone 6 Plus', '', 'Pink', '', '', '', '', '', '', '1', '', '', 'Motoki', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'Motoki 6 Plus', '', '', '', '', 0),
(121, 'BMW  Flip Case For Apple iPhone 6S - Black', '', '', '', 1, 3000, '2400', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'BMFLBKP6LMCC', 'Black', '', '', 'Flip Case', 'Phone', 'Apple iPhone 6S', 'PU Leather', 'Black', '', '', '', '', '', '', '1', '', '', '', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', ' Bmw 6S', '', '', '', '', 0),
(122, 'BMW  Back Case For Apple iPhone 6S - Black', '', '', '', 1, 0, '0', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'BMHCP6MBC', 'Black', '', '', 'Back Case', 'Phone', 'Apple iPhone 6S', '', 'Black', '', '', '', '', '', '', '1', '', '', '', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', ' Bmw 6S', '', '', '', '', 0),
(123, 'BMW  Back Case For Apple iPhone 6S - Silver', '', '', '', 1, 0, '0', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'BMHCP6MBS', 'Silver', '', '', 'Back Case', 'Phone', 'Apple iPhone 6S', '', 'Silver', '', '', '', '', '', '', '1', '', '', '', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', ' Bmw 6S', '', '', '', '', 0),
(124, 'Mini  Flip Case For Apple iPhone 6S - Black', '', '', '', 1, 0, '0', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'MNFLBKP6YMMBK', 'Black', '', '', 'Flip Case', 'Phone', 'Apple iPhone 6S', 'PU Leather', 'Black', '', '', '', '', '', '', '1', '', '', '', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', ' Bmw 6S', '', '', '', '', 0),
(125, 'Mini  Flip Case For Apple iPhone 6S - Blue', '', '', '', 1, 0, '0', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'MNFLBKP6YMMEB', 'Blue', '', '', 'Flip Case', 'Phone', 'Apple iPhone 6S', 'PU Leather', 'Blue', '', '', '', '', '', '', '1', '', '', '', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', ' Bmw 6S', '', '', '', '', 0),
(126, 'iLuv Regatta Back Case For Apple iPhone 6 - Black', '', 'Give your iPhone the style and protection it deserves with Regatta. This dual-layer case is made from a combination of shock-absorbing TPU on the inside and impact-resistant polycarbonate on the outside to safeguard your phone from damage. Regatta', '', 1, 0, '', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AI6REGABK', 'Black', '', '', 'Back Case, Tough Case', 'Phone', 'Apple iPhone 6', '', 'Black', '', '', '', '', '', '', '1', '', 'https://youtu.be/adHwfhoxmq8', 'Regatta', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'Regatta 6', '2.83in(W) x 0.43in(H) x 5.55in(D)', '', '', '', 0),
(127, 'iLuv Regatta Back Case For Apple iPhone 6 - Blue', '', 'Give your iPhone the style and protection it deserves with Regatta. This dual-layer case is made from a combination of shock-absorbing TPU on the inside and impact-resistant polycarbonate on the outside to safeguard your phone from damage. Regatta', '', 1, 0, '', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AI6REGABL', 'Blue', '', '', 'Back Case, Tough Case', 'Phone', 'Apple iPhone 6', '', 'Blue', '', '', '', '', '', '', '1', '', 'https://youtu.be/adHwfhoxmq9', 'Regatta', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'Regatta 6', '2.83in(W) x 0.43in(H) x 5.55in(D)', '', '', '', 0),
(128, 'iLuv Regatta Back Case For Apple iPhone 6 - Pink', '', 'Give your iPhone the style and protection it deserves with Regatta. This dual-layer case is made from a combination of shock-absorbing TPU on the inside and impact-resistant polycarbonate on the outside to safeguard your phone from damage. Regatta', '', 1, 0, '', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AI6REGAPN', 'Pink', '', '', 'Back Case, Tough Case', 'Phone', 'Apple iPhone 6', '', 'Pink', '', '', '', '', '', '', '1', '', 'adHwfhoxmq8', 'Regatta', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'Regatta 6', '2.83in(W) x 0.43in(H) x 5.55in(D)', '', '', '', 0),
(129, 'iLuv Regatta Back Case For Apple iPhone 6 - Teal', '', 'Give your iPhone the style and protection it deserves with Regatta. This dual-layer case is made from a combination of shock-absorbing TPU on the inside and impact-resistant polycarbonate on the outside to safeguard your phone from damage. Regatta', '', 1, 0, '', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AI6REGATE', 'Teal', '', '', 'Back Case, Tough Case', 'Phone', 'Apple iPhone 6', '', 'Blue', '', '', '', '', '', '', '1', '', 'https://youtu.be/adHwfhoxmq11', 'Regatta', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'Regatta 6', '2.83in(W) x 0.43in(H) x 5.55in(D)', '', '', '', 0),
(130, 'iLuv Regatta Back Case For Apple iPhone 6 - White', '', 'Give your iPhone the style and protection it deserves with Regatta. This dual-layer case is made from a combination of shock-absorbing TPU on the inside and impact-resistant polycarbonate on the outside to safeguard your phone from damage. Regatta', '', 1, 0, '', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AI6REGAWH', 'White', '', '', 'Back Case, Tough Case', 'Phone', 'Apple iPhone 6', '', 'White', '', '', '', '', '', '', '1', '', 'https://youtu.be/adHwfhoxmq12', 'Regatta', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'Regatta 6', '2.83in(W) x 0.43in(H) x 5.55in(D)', '', '', '', 0),
(131, 'iLuv Regatta Back Case For Apple iPhone 6 - Yellow', '', 'Give your iPhone the style and protection it deserves with Regatta. This dual-layer case is made from a combination of shock-absorbing TPU on the inside and impact-resistant polycarbonate on the outside to safeguard your phone from damage. Regatta', '', 1, 0, '', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AI6REGAYE', 'Yellow', '', '', 'Back Case, Tough Case', 'Phone', 'Apple iPhone 6', '', 'Yellow', '', '', '', '', '', '', '1', '', 'https://youtu.be/adHwfhoxmq13', 'Regatta', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'Regatta 6', '2.83in(W) x 0.43in(H) x 5.55in(D)', '', '', '', 0),
(132, 'iLuv Vyneer Back Case For Apple iPhone 6 - Black', '', 'Simple and streamlined, Vyneer gives your iPhone a clean, understated look without skimping on protection.  Featuring a polycarbonate base and a soft TPU frame around the edges, Vyneer keeps your phone safe from dings, scratches and dents.\n \nDual Material Protection\n \nVyneer offers a simple but effective combination of hard polycarbonate shell and soft TPU (thermoplastic polyurethane) frame to protect your iPhone. The polycarbonate shell protects the bulk of your phone from drops and falls, while the TPU frame shields the corners and edges from dings, scratches and dents.\n \nShow Off Your Phone', '', 1, 0, '', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AI6VYNEBK', 'Black', '', '', 'Back Case, Hard Case', 'Phone', 'Apple iPhone 6', '', 'Black', '', '', '', '', '', '', '1', '', 'https://youtu.be/adHwfhoxmq14', 'Vyneer', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'Vyneer 6', '', '', '', '', 0),
(133, 'iLuv Vyneer Back Case For Apple iPhone 6 - Blue', '', 'Simple and streamlined, Vyneer gives your iPhone a clean, understated look without skimping on protection.  Featuring a polycarbonate base and a soft TPU frame around the edges, Vyneer keeps your phone safe from dings, scratches and dents.\n \nDual Material Protection\n \nVyneer offers a simple but effective combination of hard polycarbonate shell and soft TPU (thermoplastic polyurethane) frame to protect your iPhone. The polycarbonate shell protects the bulk of your phone from drops and falls, while the TPU frame shields the corners and edges from dings, scratches and dents.\n \nShow Off Your Phone', '', 1, 0, '', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AI6VYNEBL', 'Blue', '', '', 'Back Case, Hard Case', 'Phone', 'Apple iPhone 6', '', 'Blue', '', '', '', '', '', '', '1', '', 'https://youtu.be/adHwfhoxmq15', 'Vyneer', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'Vyneer 6', '', '', '', '', 0),
(134, 'iLuv Vyneer Back Case For Apple iPhone 6 - Pink', '', 'Simple and streamlined, Vyneer gives your iPhone a clean, understated look without skimping on protection.  Featuring a polycarbonate base and a soft TPU frame around the edges, Vyneer keeps your phone safe from dings, scratches and dents.\n \nDual Material Protection\n \nVyneer offers a simple but effective combination of hard polycarbonate shell and soft TPU (thermoplastic polyurethane) frame to protect your iPhone. The polycarbonate shell protects the bulk of your phone from drops and falls, while the TPU frame shields the corners and edges from dings, scratches and dents.\n \nShow Off Your Phone', '', 1, 0, '', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AI6VYNEPN', 'Pink', '', '', 'Back Case, Hard Case', 'Phone', 'Apple iPhone 6', '', 'Pink', '', '', '', '', '', '', '1', '', 'https://youtu.be/adHwfhoxmq16', 'Vyneer', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'Vyneer 6', '', '', '', '', 0);
INSERT INTO `product` (`id`, `name`, `sku`, `description`, `url`, `visibility`, `price`, `wholesaleprice`, `firstsaleprice`, `secondsaleprice`, `specialpriceto`, `specialpricefrom`, `metatitle`, `metadesc`, `metakeyword`, `quantity`, `status`, `modelnumber`, `brandcolor`, `eanorupc`, `eanorupcmeasuringunits`, `type`, `compatibledevice`, `compatiblewith`, `material`, `color`, `design`, `width`, `height`, `depth`, `portsize`, `packof`, `salespackage`, `keyfeatures`, `videourl`, `modelname`, `finish`, `weight`, `domesticwarranty`, `domesticwarrantymeasuringunits`, `internationalwarranty`, `internationalwarrantymeasuringunits`, `warrantysummary`, `warrantyservicetype`, `coveredinwarranty`, `notcoveredinwarranty`, `size`, `typename`, `colormatch`, `dimension`, `capacity`, `microphone`, `length`, `voltage`) VALUES
(135, 'iLuv Vyneer Back Case For Apple iPhone 6 - White', '', 'Simple and streamlined, Vyneer gives your iPhone a clean, understated look without skimping on protection.  Featuring a polycarbonate base and a soft TPU frame around the edges, Vyneer keeps your phone safe from dings, scratches and dents.\n \nDual Material Protection\n \nVyneer offers a simple but effective combination of hard polycarbonate shell and soft TPU (thermoplastic polyurethane) frame to protect your iPhone. The polycarbonate shell protects the bulk of your phone from drops and falls, while the TPU frame shields the corners and edges from dings, scratches and dents.\n \nShow Off Your Phone', '', 1, 0, '', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AI6VYNEWH', 'White', '', '', 'Back Case, Hard Case', 'Phone', 'Apple iPhone 6', '', 'White', '', '', '', '', '', '', '1', '', 'https://youtu.be/adHwfhoxmq17', 'Vyneer', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'Vyneer 6', '', '', '', '', 0),
(136, 'iLuv Gossamer Back Case For Apple iPhone 6 - Transparent', '', 'Protect your iPhone while preserving its stylish look. Gossamer', '', 1, 0, '', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AI6GOSS', 'Transparent', '', '', 'Back Case, Hard Case', 'Phone', 'Apple iPhone 6', '', 'Transparent', '', '', '', '', '', '', '1', '', 'https://youtu.be/adHwfhoxmq18', 'Gossamer', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'Gossamer 6', '', '', '', '', 0),
(137, 'iLuv Regatta Back Case For Apple iPhone 6 Plus - Black', '', 'Give your iPhone the style and protection it deserves with Regatta. This dual-layer case is made from a combination of shock-absorbing TPU on the inside and impact-resistant polycarbonate on the outside to safeguard your phone from damage. Regatta', '', 1, 0, '', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AI6PREGABK', 'Black', '', '', 'Back Case, Tough Case', 'Phone', 'Apple iPhone 6 Plus', '', 'Black', '', '', '', '', '', '', '1', '', 'https://youtu.be/adHwfhoxmq19', 'Regatta', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'Regatta 6 Plus', '', '', '', '', 0),
(138, 'iLuv Lay Up Back Case For Apple iPhone 6 Plus - Black', '', 'Keep your iPhone 6 Plus in its beautiful and pristine condition with Layup. This dual-layer case is made from a combination of shock-absorbing silicone and impact-resistant polycarbonate for maximum durability. Head out with your iPhone 6 Plus without worrying about damaging it from scratches, bumps and drops. Layup also has a built-in stand that can be pulled out and used to prop up your phone for comfortable landscape viewing.\n \nRugged Dual-Layer Protection\n \nBuilt with a dual-layer combination of polycarbonate and silicone, Layup is especially rugged. The outer layer is made from soft, shock-absorbing silicone while the inner layer is constructed from hard, impact-resistant polycarbonate. The front of the case is designed with a raised edge that keeps your phone', '', 1, 0, '', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AI6PLAYU', 'Black', '', '', 'Back Case, Tough Case', 'Phone', 'Apple iPhone 6 Plus', '', 'Black', '', '', '', '', '', '', '1', '', 'https://youtu.be/adHwfhoxmq20', 'Lay Up', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'Lay Up 6 Plus', '', '', '', '', 0),
(139, 'iLuv Vyneer Back Case For Apple iPhone 6 Plus - Black', '', 'Simple and streamlined, Vyneer gives your iPhone a clean, understated look without skimping on protection.  Featuring a polycarbonate base and a soft TPU frame around the edges, Vyneer keeps your phone safe from dings, scratches and dents.\n \nDual Material Protection\n \nVyneer offers a simple but effective combination of hard polycarbonate shell and soft TPU (thermoplastic polyurethane) frame to protect your iPhone. The polycarbonate shell protects the bulk of your phone from drops and falls, while the TPU frame shields the corners and edges from dings, scratches and dents.\n \nShow Off Your Phone', '', 1, 0, '', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AI6PVYNEBK', 'Black', '', '', 'Back Case, Hard Case', 'Phone', 'Apple iPhone 6 Plus', '', 'Black', '', '', '', '', '', '', '1', '', 'https://youtu.be/adHwfhoxmq21', 'Vyneer', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'Vyneer 6 Plus', '', '', '', '', 0),
(140, 'iLuv Vyneer Back Case For Apple iPhone 6 Plus - White', '', 'Simple and streamlined, Vyneer gives your iPhone a clean, understated look without skimping on protection.  Featuring a polycarbonate base and a soft TPU frame around the edges, Vyneer keeps your phone safe from dings, scratches and dents.\n \nDual Material Protection\n \nVyneer offers a simple but effective combination of hard polycarbonate shell and soft TPU (thermoplastic polyurethane) frame to protect your iPhone. The polycarbonate shell protects the bulk of your phone from drops and falls, while the TPU frame shields the corners and edges from dings, scratches and dents.\n \nShow Off Your Phone', '', 1, 0, '', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AI6PVYNEWH', 'White', '', '', 'Back Case, Hard Case', 'Phone', 'Apple iPhone 6 Plus', '', 'White', '', '', '', '', '', '', '1', '', 'https://youtu.be/adHwfhoxmq22', 'Vyneer', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'Vyneer 6 Plus', '', '', '', '', 0),
(141, 'iLuv Gelato Back Case For Apple iPhone 6 Plus - Black', '', 'Decorate your iPhone in a soft, flexible case that', '', 1, 0, '', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AI6PGELABK', 'Black', '', '', 'Back Case, Soft Case', 'Phone', 'Apple iPhone 6 Plus', '', 'Black', '', '', '', '', '', '', '1', '', 'https://youtu.be/adHwfhoxmq23', 'Gelato', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'Gelato 6 Plus', '', '', '', '', 0),
(142, 'iLuv Gelato Back Case For Apple iPhone 6 Plus - White', '', 'Decorate your iPhone in a soft, flexible case that', '', 1, 0, '', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AI6PGELAWH', 'White', '', '', 'Back Case, Soft Case', 'Phone', 'Apple iPhone 6 Plus', '', 'White', '', '', '', '', '', '', '1', '', 'https://youtu.be/adHwfhoxmq24', 'Gelato', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'Gelato 6 Plus', '', '', '', '', 0),
(143, 'iLuv Gossamer Back Case For Apple iPhone 6 Plus - Transparent', '', 'Protect your iPhone while preserving its stylish look. Gossamer', '', 1, 0, '', '', '', '0000-00-00', '0000-00-00', '', '', '', 1, 1, 'AI6PGOSS', 'Transparent', '', '', 'Back Case, Hard Case', 'Phone', 'Apple iPhone 6 Plus', '', 'Transparent', '', '', '', '', '', '', '1', '', 'https://youtu.be/adHwfhoxmq25', 'Gossamer', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'Gossamer 6 Plus', '', '', '', '', 0),
(144, 'Incipio Feather Back Case For Apple iPhone 6 - Light Blue', '', 'An Incipio classic, the lightweight feather Case features a high density Plextonium polycarbonate construction and shock absorbing EVA interior liner for added device protection. The sleek, ultra thin case snaps on to the rear of your device for quick installation and adds discreet protection to maintain the slim shape of your device. Express your style in a wide variety of stylish colors! Lightweight and thin design for low-profile protection against bumps and scratches while retaining the slim shape of your new smartphone\nSnap-on application for a quick and user-friendly installation\nFlash-diffusing coated camera ring\nPremium EVA foam inner liner absorbs shock. Measurements:\nLength: 5.54 in (140.716 mm)\nThickness: 0.06 in (1.524 mm)\nWidth: 2.78 in (70.612 mm)\nDepth: 0.38 in (9.652 mm)', '', 1, 0, '', '', '', '0000-00-00', '0000-00-00', '', '', '', 0, 1, 'Iph-1177-Blu', 'Light Blue', '', '', 'Back Case, Hard Case', 'Phone', 'Apple iPhone 6', '', 'Blue', '', '', '', '', '', '', '', '', '', 'Feather', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'Feather 6', '', '', '', '', 0),
(145, 'Incipio Feather Shine Back Case For Apple iPhone 6 - Black', '', 'The sophisticated feather SHINE Case is constructed of a rigid ABS polymer frame with a premium brushed aluminum style finish. The lightweight snap-on case provides device protection against dents and scratches, with a sleek and ultra-thin design. High density rigid hard shell protects device from scratches and dents while the EVA pad interior gently cushions the device\nSleek, premium brushed aluminum style finish for a sophisticated look and feel\nLow-profile, lightweight structure\nSnap-on design for quick and user-friendly installation. Measurements:\nLength: 5.54 in (140.716 mm)\nThickness: 0.08 in (2.032 mm)\nWidth: 2.78 in (70.612 mm)\nDepth: 0.38 in (9.652 mm)', '', 1, 0, '', '', '', '0000-00-00', '0000-00-00', '', '', '', 0, 1, 'Iph-1178-Gld', 'Black', '', '', 'Back Case, Hard Case', 'Phone', 'Apple iPhone 6', '', 'Black', '', '', '', '', '', '', '', '', '', 'Feather Shine', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'Feather Shine 6', '', '', '', '', 0),
(146, 'Incipio Feather Shine Back Case For Apple iPhone 6 - Gold', '', 'The sophisticated feather SHINE Case is constructed of a rigid ABS polymer frame with a premium brushed aluminum style finish. The lightweight snap-on case provides device protection against dents and scratches, with a sleek and ultra-thin design. High density rigid hard shell protects device from scratches and dents while the EVA pad interior gently cushions the device\nSleek, premium brushed aluminum style finish for a sophisticated look and feel\nLow-profile, lightweight structure\nSnap-on design for quick and user-friendly installation. Measurements:\nLength: 5.54 in (140.716 mm)\nThickness: 0.08 in (2.032 mm)\nWidth: 2.78 in (70.612 mm)\nDepth: 0.38 in (9.652 mm)', '', 1, 0, '', '', '', '0000-00-00', '0000-00-00', '', '', '', 0, 1, 'Iph-1178-Blk', 'Gold', '', '', 'Back Case, Hard Case', 'Phone', 'Apple iPhone 6', '', 'Gold', '', '', '', '', '', '', '', '', '', 'Feather Shine', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'Feather Shine 6', '', '', '', '', 0),
(147, 'Incipio Feather Shine Back Case For Apple iPhone 6 - Silver', '', 'The sophisticated feather SHINE Case is constructed of a rigid ABS polymer frame with a premium brushed aluminum style finish. The lightweight snap-on case provides device protection against dents and scratches, with a sleek and ultra-thin design. High density rigid hard shell protects device from scratches and dents while the EVA pad interior gently cushions the device\nSleek, premium brushed aluminum style finish for a sophisticated look and feel\nLow-profile, lightweight structure\nSnap-on design for quick and user-friendly installation. Measurements:\nLength: 5.54 in (140.716 mm)\nThickness: 0.08 in (2.032 mm)\nWidth: 2.78 in (70.612 mm)\nDepth: 0.38 in (9.652 mm)', '', 1, 0, '', '', '', '0000-00-00', '0000-00-00', '', '', '', 0, 1, 'Iph-1178-Slvr', 'Silver', '', '', 'Back Case, Hard Case', 'Phone', 'Apple iPhone 6', '', 'Silver', '', '', '', '', '', '', '', '', '', 'Feather Shine', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'Feather Shine 6', '', '', '', '', 0),
(148, 'Incipio Highland Flip Case For Apple iPhone 6 - White/Grey', '', 'Incipio', '', 1, 0, '', '', '', '0000-00-00', '0000-00-00', '', '', '', 0, 1, 'Iph-1183-Whtgry', 'White/Grey', '', '', 'Flip Case', 'Phone', 'Apple iPhone 6', '', 'White', '', '', '', '', '', '', '', '', '', 'Highland', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'Highland 6', '', '', '', '', 0),
(149, 'Incipio Octane Back Case For Apple iPhone 6 - Neon Green', '', 'Incipio', '', 1, 0, '', '', '', '0000-00-00', '0000-00-00', '', '', '', 0, 1, 'Iph-1190-Frstgrn', 'Neon Green', '', '', 'Back Case, Tough Case', 'Phone', 'Apple iPhone 6', '', 'Green', '', '', '', '', '', '', '', '', '', 'Octane', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'Octane 6', '', '', '', '', 0),
(150, 'Incipio Octane Back Case For Apple iPhone 6 - Neon Orange', '', 'Incipio', '', 1, 0, '', '', '', '0000-00-00', '0000-00-00', '', '', '', 0, 1, 'Iph-1190-Frstoj', 'Neon Orange', '', '', 'Back Case, Tough Case', 'Phone', 'Apple iPhone 6', '', 'Orange', '', '', '', '', '', '', '', '', '', 'Octane', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'Octane 6', '', '', '', '', 0),
(151, 'Incipio Feather Back Case For Apple iPhone 6 Plus - Black', '', 'An Incipio classic, the lightweight feather Case features a high density Plextonium polycarbonate construction and shock absorbing EVA interior liner for added device protection. The sleek, ultra thin case snaps on to the rear of your device for quick installation and adds discreet protection to maintain the slim shape of your device. Express your style in a wide variety of stylish colors! Lightweight and thin design for low-profile protection against bumps and scratches while retaining the slim shape of your new smartphone\nSnap-on application for a quick and user-friendly installation\nFlash-diffusing coated camera ring\nPremium EVA foam inner liner absorbs shock from everyday bumps. Measurements:\nLength: 6.38 in (162.052 mm)\nWidth: 3.24 in (82.296 mm)\nDepth: 0.39 in (9.906 mm)', '', 1, 0, '', '', '', '0000-00-00', '0000-00-00', '', '', '', 0, 1, 'Iph-1193-Blk', 'Black', '', '', 'Back Case, Hard Case', 'Phone', 'Apple iPhone 6 Plus', '', 'Black', '', '', '', '', '', '', '', '', '', 'Feather', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'Feather 6 Plus', '', '', '', '', 0),
(152, 'Incipio Feather Back Case For Apple iPhone 6 Plus - Light Blue', '', 'An Incipio classic, the lightweight feather Case features a high density Plextonium polycarbonate construction and shock absorbing EVA interior liner for added device protection. The sleek, ultra thin case snaps on to the rear of your device for quick installation and adds discreet protection to maintain the slim shape of your device. Express your style in a wide variety of stylish colors! Lightweight and thin design for low-profile protection against bumps and scratches while retaining the slim shape of your new smartphone\nSnap-on application for a quick and user-friendly installation\nFlash-diffusing coated camera ring\nPremium EVA foam inner liner absorbs shock from everyday bumps. Measurements:\nLength: 6.38 in (162.052 mm)\nWidth: 3.24 in (82.296 mm)\nDepth: 0.39 in (9.906 mm)', '', 1, 0, '', '', '', '0000-00-00', '0000-00-00', '', '', '', 0, 1, 'Iph-1193-Ltblu', 'Light Blue', '', '', 'Back Case, Hard Case', 'Phone', 'Apple iPhone 6 Plus', '', 'Blue', '', '', '', '', '', '', '', '', '', 'Feather', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'Feather 6 Plus', '', '', '', '', 0),
(153, 'Incipio Feather Back Case For Apple iPhone 6 Plus - Transparent', '', 'An Incipio classic, the lightweight feather Case features a high density Plextonium polycarbonate construction and shock absorbing EVA interior liner for added device protection. The sleek, ultra thin case snaps on to the rear of your device for quick installation and adds discreet protection to maintain the slim shape of your device. Express your style in a wide variety of stylish colors! Lightweight and thin design for low-profile protection against bumps and scratches while retaining the slim shape of your new smartphone\nSnap-on application for a quick and user-friendly installation\nFlash-diffusing coated camera ring\nPremium EVA foam inner liner absorbs shock from everyday bumps. Measurements:\nLength: 6.38 in (162.052 mm)\nWidth: 3.24 in (82.296 mm)\nDepth: 0.39 in (9.906 mm)', '', 1, 0, '', '', '', '0000-00-00', '0000-00-00', '', '', '', 0, 1, 'Iph-1193-Clr', 'Transparent', '', '', 'Back Case, Hard Case', 'Phone', 'Apple iPhone 6 Plus', '', 'Transparent', '', '', '', '', '', '', '', '', '', 'Feather', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'Feather 6 Plus', '', '', '', '', 0),
(154, 'Incipio Feather Back Case For Apple iPhone 6 Plus - Pink', '', 'An Incipio classic, the lightweight feather Case features a high density Plextonium polycarbonate construction and shock absorbing EVA interior liner for added device protection. The sleek, ultra thin case snaps on to the rear of your device for quick installation and adds discreet protection to maintain the slim shape of your device. Express your style in a wide variety of stylish colors! Lightweight and thin design for low-profile protection against bumps and scratches while retaining the slim shape of your new smartphone\nSnap-on application for a quick and user-friendly installation\nFlash-diffusing coated camera ring\nPremium EVA foam inner liner absorbs shock from everyday bumps. Measurements:\nLength: 6.38 in (162.052 mm)\nWidth: 3.24 in (82.296 mm)\nDepth: 0.39 in (9.906 mm)', '', 1, 0, '', '', '', '0000-00-00', '0000-00-00', '', '', '', 0, 1, 'Iph-1193-Pnk', 'Pink', '', '', 'Back Case, Hard Case', 'Phone', 'Apple iPhone 6 Plus', '', 'Pink', '', '', '', '', '', '', '', '', '', 'Feather', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'Feather 6 Plus', '', '', '', '', 0),
(155, 'Incipio Feather Shine Back Case For Apple iPhone 6 Plus - Black', '', 'The sophisticated feather SHINE Case is constructed of a rigid ABS polycarbonate frame with a premium brushed aluminum style finish. The lightweight snap-on case provides device protection against dents and scratches, with a sleek and ultra-thin design. High density rigid hard shell protects device from scratches and dents while the EVA pad interior gently cushions the device\nSleek, premium brushed aluminum style finish for a sophisticated look and feel\nLow-profile, lightweight structure\nSnap-on design for quick and user-friendly installation. Measurements:\nLength: 6.38 in (162.052 mm)\nWidth: 3.24 in (82.296 mm)\nDepth: 0.39 in (9.906 mm)', '', 1, 0, '', '', '', '0000-00-00', '0000-00-00', '', '', '', 0, 1, 'Iph-1194-Blk', 'Black', '', '', 'Back Case, Hard Case', 'Phone', 'Apple iPhone 6 Plus', '', 'Black', '', '', '', '', '', '', '', '', '', 'Feather Shine', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'Feather Shine 6 Plus', '', '', '', '', 0),
(156, 'Incipio Feather Shine Back Case For Apple iPhone 6 Plus - Silver', '', 'The sophisticated feather SHINE Case is constructed of a rigid ABS polycarbonate frame with a premium brushed aluminum style finish. The lightweight snap-on case provides device protection against dents and scratches, with a sleek and ultra-thin design. High density rigid hard shell protects device from scratches and dents while the EVA pad interior gently cushions the device\nSleek, premium brushed aluminum style finish for a sophisticated look and feel\nLow-profile, lightweight structure\nSnap-on design for quick and user-friendly installation. Measurements:\nLength: 6.38 in (162.052 mm)\nWidth: 3.24 in (82.296 mm)\nDepth: 0.39 in (9.906 mm)', '', 1, 0, '', '', '', '0000-00-00', '0000-00-00', '', '', '', 0, 1, 'Iph-1194-Slvr', 'Silver', '', '', 'Back Case, Hard Case', 'Phone', 'Apple iPhone 6 Plus', '', 'Silver', '', '', '', '', '', '', '', '', '', 'Feather Shine', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'Feather Shine 6 Plus', '', '', '', '', 0),
(157, 'Incipio Feather Shine Back Case For Apple iPhone 6 Plus - Gold', '', 'The sophisticated feather SHINE Case is constructed of a rigid ABS polycarbonate frame with a premium brushed aluminum style finish. The lightweight snap-on case provides device protection against dents and scratches, with a sleek and ultra-thin design. High density rigid hard shell protects device from scratches and dents while the EVA pad interior gently cushions the device\nSleek, premium brushed aluminum style finish for a sophisticated look and feel\nLow-profile, lightweight structure\nSnap-on design for quick and user-friendly installation. Measurements:\nLength: 6.38 in (162.052 mm)\nWidth: 3.24 in (82.296 mm)\nDepth: 0.39 in (9.906 mm)', '', 1, 0, '', '', '', '0000-00-00', '0000-00-00', '', '', '', 0, 1, 'Iph-1194-Gld', 'Gold', '', '', 'Back Case, Hard Case', 'Phone', 'Apple iPhone 6 Plus', '', 'Gold', '', '', '', '', '', '', '', '', '', 'Feather Shine', '', '', 'No Warranty', '', '', '', '', '', '', '', '', '', 'Feather Shine 6 Plus', '', '', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `productbrand`
--

CREATE TABLE IF NOT EXISTS `productbrand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product` int(11) NOT NULL,
  `brand` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=160 ;

--
-- Dumping data for table `productbrand`
--

INSERT INTO `productbrand` (`id`, `product`, `brand`) VALUES
(1, 1, 69),
(2, 2, 69),
(3, 3, 69),
(4, 4, 69),
(5, 5, 69),
(6, 6, 69),
(7, 7, 69),
(8, 8, 69),
(9, 9, 69),
(10, 10, 69),
(11, 11, 69),
(12, 12, 69),
(13, 13, 69),
(14, 14, 69),
(15, 15, 69),
(16, 16, 69),
(17, 17, 69),
(18, 18, 69),
(19, 19, 69),
(20, 20, 69),
(21, 21, 69),
(22, 22, 69),
(23, 23, 69),
(24, 24, 69),
(25, 25, 69),
(26, 26, 69),
(27, 27, 69),
(28, 28, 69),
(29, 29, 69),
(30, 30, 69),
(31, 31, 69),
(32, 32, 69),
(33, 33, 69),
(34, 34, 69),
(35, 35, 69),
(36, 36, 69),
(37, 37, 69),
(38, 38, 69),
(39, 39, 69),
(40, 40, 69),
(41, 41, 69),
(42, 42, 69),
(43, 43, 69),
(44, 44, 69),
(45, 45, 69),
(46, 46, 69),
(47, 47, 69),
(48, 48, 69),
(49, 49, 69),
(50, 50, 69),
(51, 51, 69),
(52, 52, 69),
(53, 53, 54),
(54, 54, 54),
(55, 55, 54),
(56, 56, 54),
(57, 57, 54),
(58, 58, 54),
(59, 59, 54),
(60, 60, 54),
(61, 61, 54),
(62, 62, 54),
(63, 63, 54),
(64, 64, 54),
(65, 65, 54),
(66, 66, 54),
(67, 67, 54),
(68, 68, 54),
(69, 69, 54),
(70, 70, 54),
(71, 71, 54),
(72, 72, 54),
(73, 73, 54),
(74, 74, 54),
(75, 75, 54),
(76, 76, 54),
(77, 77, 54),
(78, 78, 54),
(79, 79, 54),
(80, 80, 85),
(81, 81, 85),
(82, 82, 85),
(83, 83, 85),
(84, 84, 85),
(85, 85, 85),
(86, 86, 85),
(87, 87, 85),
(88, 88, 85),
(89, 89, 85),
(90, 90, 85),
(91, 91, 11),
(92, 92, 11),
(93, 93, 11),
(94, 94, 11),
(95, 95, 11),
(96, 96, 11),
(97, 97, 11),
(98, 98, 11),
(99, 99, 11),
(100, 100, 11),
(101, 101, 11),
(102, 102, 11),
(103, 103, 11),
(104, 104, 11),
(105, 105, 11),
(106, 106, 11),
(107, 107, 11),
(108, 108, 11),
(109, 109, 11),
(110, 110, 11),
(111, 111, 11),
(112, 112, 11),
(113, 113, 11),
(114, 114, 11),
(115, 115, 11),
(116, 116, 11),
(117, 117, 11),
(118, 118, 11),
(119, 119, 11),
(120, 120, 11),
(121, 121, 13),
(122, 122, 13),
(123, 123, 13),
(124, 124, 86),
(125, 125, 86),
(126, 126, 30),
(127, 127, 30),
(129, 129, 30),
(130, 130, 30),
(131, 131, 30),
(132, 132, 30),
(133, 133, 30),
(134, 134, 30),
(135, 135, 30),
(136, 136, 30),
(137, 137, 30),
(138, 138, 30),
(139, 139, 30),
(140, 140, 30),
(141, 141, 30),
(142, 142, 30),
(143, 143, 30),
(144, 144, 31),
(145, 145, 31),
(146, 146, 31),
(147, 147, 31),
(148, 148, 31),
(149, 149, 31),
(150, 150, 31),
(151, 151, 31),
(152, 152, 31),
(153, 153, 31),
(154, 154, 31),
(155, 155, 31),
(156, 156, 31),
(157, 157, 31),
(159, 128, 30);

-- --------------------------------------------------------

--
-- Table structure for table `productcategory`
--

CREATE TABLE IF NOT EXISTS `productcategory` (
  `product` int(11) NOT NULL,
  `category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `productcategory`
--

INSERT INTO `productcategory` (`product`, `category`) VALUES
(1, 37),
(1, 36),
(2, 37),
(2, 36),
(3, 37),
(3, 36),
(4, 37),
(4, 36),
(5, 37),
(5, 36),
(6, 37),
(6, 36),
(7, 37),
(7, 36),
(8, 37),
(8, 36),
(9, 37),
(9, 36),
(10, 37),
(10, 36),
(11, 37),
(11, 36),
(12, 37),
(12, 36),
(13, 37),
(13, 36),
(14, 37),
(14, 36),
(15, 37),
(15, 36),
(16, 37),
(16, 36),
(17, 37),
(17, 36),
(18, 37),
(18, 36),
(19, 37),
(19, 36),
(20, 37),
(20, 36),
(21, 37),
(21, 36),
(22, 37),
(22, 36),
(23, 37),
(23, 36),
(24, 37),
(24, 36),
(25, 37),
(25, 36),
(26, 37),
(26, 36),
(27, 37),
(27, 36),
(28, 37),
(28, 36),
(29, 37),
(29, 36),
(30, 37),
(30, 36),
(31, 37),
(31, 36),
(32, 37),
(32, 36),
(33, 37),
(33, 36),
(34, 37),
(34, 36),
(35, 37),
(35, 36),
(36, 37),
(36, 36),
(37, 37),
(37, 36),
(38, 37),
(38, 36),
(39, 37),
(39, 36),
(40, 37),
(40, 36),
(41, 37),
(41, 36),
(42, 37),
(42, 36),
(43, 37),
(43, 36),
(44, 37),
(44, 36),
(45, 37),
(45, 36),
(46, 37),
(46, 36),
(47, 37),
(47, 36),
(48, 37),
(48, 36),
(49, 37),
(49, 36),
(50, 37),
(50, 36),
(51, 37),
(51, 36),
(52, 37),
(52, 36),
(53, 37),
(53, 36),
(54, 37),
(54, 36),
(55, 37),
(55, 36),
(56, 37),
(56, 36),
(57, 37),
(57, 36),
(58, 37),
(58, 36),
(59, 37),
(59, 36),
(60, 37),
(60, 36),
(61, 37),
(61, 36),
(62, 37),
(62, 36),
(63, 37),
(63, 36),
(64, 37),
(64, 36),
(65, 37),
(65, 36),
(66, 37),
(66, 36),
(67, 37),
(67, 36),
(68, 37),
(68, 36),
(69, 37),
(69, 36),
(70, 37),
(70, 36),
(71, 37),
(71, 36),
(72, 37),
(72, 36),
(73, 37),
(73, 36),
(74, 37),
(74, 36),
(75, 37),
(75, 36),
(76, 37),
(76, 36),
(77, 37),
(77, 36),
(78, 37),
(78, 36),
(79, 37),
(79, 36),
(80, 37),
(80, 36),
(81, 37),
(81, 36),
(82, 37),
(82, 36),
(83, 37),
(83, 36),
(84, 37),
(84, 36),
(85, 37),
(85, 36),
(86, 37),
(86, 36),
(87, 37),
(87, 36),
(88, 37),
(88, 36),
(89, 37),
(89, 36),
(90, 37),
(90, 36),
(91, 37),
(91, 36),
(92, 37),
(92, 36),
(93, 37),
(93, 36),
(94, 37),
(94, 36),
(95, 37),
(95, 36),
(96, 37),
(96, 36),
(97, 37),
(97, 36),
(98, 37),
(98, 36),
(99, 37),
(99, 36),
(100, 37),
(100, 36),
(101, 37),
(101, 36),
(102, 37),
(102, 36),
(103, 37),
(103, 36),
(104, 37),
(104, 36),
(105, 37),
(105, 36),
(106, 37),
(106, 36),
(107, 37),
(107, 36),
(108, 37),
(108, 36),
(109, 37),
(109, 36),
(110, 37),
(110, 36),
(111, 37),
(111, 36),
(112, 37),
(112, 36),
(113, 37),
(113, 36),
(114, 37),
(114, 36),
(115, 37),
(115, 36),
(116, 37),
(116, 36),
(117, 37),
(117, 36),
(118, 37),
(118, 36),
(119, 37),
(119, 36),
(120, 37),
(120, 36),
(121, 37),
(121, 36),
(122, 37),
(122, 36),
(123, 37),
(123, 36),
(124, 37),
(124, 36),
(125, 37),
(125, 36),
(126, 37),
(126, 36),
(127, 37),
(127, 36),
(129, 37),
(129, 36),
(130, 37),
(130, 36),
(131, 37),
(131, 36),
(132, 37),
(132, 36),
(133, 37),
(133, 36),
(134, 37),
(134, 36),
(135, 37),
(135, 36),
(136, 37),
(136, 36),
(137, 37),
(137, 36),
(138, 37),
(138, 36),
(139, 37),
(139, 36),
(140, 37),
(140, 36),
(141, 37),
(141, 36),
(142, 37),
(142, 36),
(143, 37),
(143, 36),
(144, 37),
(144, 36),
(145, 37),
(145, 36),
(146, 37),
(146, 36),
(147, 37),
(147, 36),
(148, 37),
(148, 36),
(149, 37),
(149, 36),
(150, 37),
(150, 36),
(151, 37),
(151, 36),
(152, 37),
(152, 36),
(153, 37),
(153, 36),
(154, 37),
(154, 36),
(155, 37),
(155, 36),
(156, 37),
(156, 36),
(157, 37),
(157, 36),
(128, 36),
(128, 37);

-- --------------------------------------------------------

--
-- Table structure for table `productimage`
--

CREATE TABLE IF NOT EXISTS `productimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product` int(11) NOT NULL,
  `image` varchar(255) CHARACTER SET utf8 NOT NULL,
  `is_default` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=555 ;

--
-- Dumping data for table `productimage`
--

INSERT INTO `productimage` (`id`, `product`, `image`, `is_default`, `order`, `status`) VALUES
(1, 1, 'Switcheasy_0.35_Apple_iphone_6S_Pink_1.jpeg', 0, 0, 0),
(2, 1, 'Switcheasy_0.35_Apple_iphone_6S_Pink_2.jpeg', 0, 1, 0),
(3, 1, 'Switcheasy_0.35_Apple_iphone_6S_Pink_3.jpeg', 0, 0, 0),
(4, 1, 'Switcheasy_0.35_Apple_iphone_6S_Pink_4.jpeg', 0, 0, 0),
(5, 2, 'Switcheasy_0.35_Apple_iphone_6S_Frost_White_1.jpeg', 0, 0, 0),
(6, 2, 'Switcheasy_0.35_Apple_iphone_6S_Frost_White_2.jpeg', 0, 1, 0),
(7, 2, 'Switcheasy_0.35_Apple_iphone_6S_Frost_White_3.jpeg', 0, 0, 0),
(8, 2, 'Switcheasy_0.35_Apple_iphone_6S_Frost_White_4.jpeg', 0, 0, 0),
(9, 3, 'Switcheasy_0.35_Apple_iphone_6S_Blue_1.jpeg', 0, 0, 0),
(10, 3, 'Switcheasy_0.35_Apple_iphone_6S_Blue_2.jpeg', 0, 1, 0),
(11, 3, 'Switcheasy_0.35_Apple_iphone_6S_Blue_3.jpeg', 0, 0, 0),
(12, 3, 'Switcheasy_0.35_Apple_iphone_6S_Blue_4.jpeg', 0, 0, 0),
(13, 4, 'Switcheasy_0.35_Apple_iphone_6S_Yellow_1.jpeg', 0, 0, 0),
(14, 4, 'Switcheasy_0.35_Apple_iphone_6S_Yellow_2.jpeg', 0, 1, 0),
(15, 4, 'Switcheasy_0.35_Apple_iphone_6S_Yellow_3.jpeg', 0, 0, 0),
(16, 4, 'Switcheasy_0.35_Apple_iphone_6S_Yellow_4.jpeg', 0, 0, 0),
(17, 5, 'Switcheasy_0.35_Apple_iphone_6S_Stealth_Black_1.jpeg', 0, 0, 0),
(18, 5, 'Switcheasy_0.35_Apple_iphone_6S_Stealth_Black_2.jpeg', 0, 1, 0),
(19, 5, 'Switcheasy_0.35_Apple_iphone_6S_Stealth_Black_3.jpeg', 0, 0, 0),
(20, 5, 'Switcheasy_0.35_Apple_iphone_6S_Stealth_Black_4.jpeg', 0, 0, 0),
(21, 6, 'Switcheasy_0.35_Apple_iphone_6S_Pink_1.jpeg', 0, 0, 0),
(22, 6, 'Switcheasy_0.35_Apple_iphone_6S_Pink_2.jpeg', 0, 1, 0),
(23, 6, 'Switcheasy_0.35_Apple_iphone_6S_Pink_3.jpeg', 0, 0, 0),
(24, 6, 'Switcheasy_0.35_Apple_iphone_6S_Pink_4.jpeg', 0, 0, 0),
(25, 7, 'Switcheasy_0.35_Apple_iphone_6S_Frost_White_1.jpeg', 0, 0, 0),
(26, 7, 'Switcheasy_0.35_Apple_iphone_6S_Frost_White_2.jpeg', 0, 1, 0),
(27, 7, 'Switcheasy_0.35_Apple_iphone_6S_Frost_White_3.jpeg', 0, 0, 0),
(28, 7, 'Switcheasy_0.35_Apple_iphone_6S_Frost_White_4.jpeg', 0, 0, 0),
(29, 8, 'Switcheasy_0.35_Apple_iphone_6S_Blue_1.jpeg', 0, 0, 0),
(30, 8, 'Switcheasy_0.35_Apple_iphone_6S_Blue_2.jpeg', 0, 1, 0),
(31, 8, 'Switcheasy_0.35_Apple_iphone_6S_Blue_3.jpeg', 0, 0, 0),
(32, 8, 'Switcheasy_0.35_Apple_iphone_6S_Blue_4.jpeg', 0, 0, 0),
(33, 9, 'Switcheasy_0.35_Apple_iphone_6S_Yellow_1.jpeg', 0, 0, 0),
(34, 9, 'Switcheasy_0.35_Apple_iphone_6S_Yellow_2.jpeg', 0, 1, 0),
(35, 9, 'Switcheasy_0.35_Apple_iphone_6S_Yellow_3.jpeg', 0, 0, 0),
(36, 9, 'Switcheasy_0.35_Apple_iphone_6S_Yellow_4.jpeg', 0, 0, 0),
(37, 10, 'Switcheasy_0.35_Apple_iphone_6S_Stealth_Black_1.jpeg', 0, 0, 0),
(38, 10, 'Switcheasy_0.35_Apple_iphone_6S_Stealth_Black_2.jpeg', 0, 1, 0),
(39, 10, 'Switcheasy_0.35_Apple_iphone_6S_Stealth_Black_3.jpeg', 0, 0, 0),
(40, 10, 'Switcheasy_0.35_Apple_iphone_6S_Stealth_Black_4.jpeg', 0, 0, 0),
(41, 11, 'Switcheasy_Numbers_Apple_iphone_6S_Frost_White_1.jpeg', 0, 0, 0),
(42, 11, 'Switcheasy_Numbers_Apple_iphone_6S_Frost_White_2.jpeg', 0, 1, 0),
(43, 11, 'Switcheasy_Numbers_Apple_iphone_6S_Frost_White_3.jpeg', 0, 0, 0),
(44, 11, 'Switcheasy_Numbers_Apple_iphone_6S_Frost_White_4.jpeg', 0, 0, 0),
(45, 12, 'Switcheasy_Numbers_Apple_iphone_6S_Stealth_Black_1.jpeg', 0, 0, 0),
(46, 12, 'Switcheasy_Numbers_Apple_iphone_6S_Stealth_Black_2.jpeg', 0, 1, 0),
(47, 12, 'Switcheasy_Numbers_Apple_iphone_6S_Stealth_Black_3.jpeg', 0, 0, 0),
(48, 12, 'Switcheasy_Numbers_Apple_iphone_6S_Stealth_Black_4.jpeg', 0, 0, 0),
(49, 13, 'Switcheasy_Numbers_Apple_iphone_6S_Methyl_Blue_1.jpeg', 0, 0, 0),
(50, 13, 'Switcheasy_Numbers_Apple_iphone_6S_Methyl_Blue_2.jpeg', 0, 1, 0),
(51, 13, 'Switcheasy_Numbers_Apple_iphone_6S_Methyl_Blue_3.jpeg', 0, 0, 0),
(52, 13, 'Switcheasy_Numbers_Apple_iphone_6S_Methyl_Blue_4.jpeg', 0, 0, 0),
(53, 14, 'Switcheasy_Numbers_Apple_iphone_6S_Rose_Bouquet_1.jpeg', 0, 0, 0),
(54, 14, 'Switcheasy_Numbers_Apple_iphone_6S_Rose_Bouquet_2.jpeg', 0, 1, 0),
(55, 14, 'Switcheasy_Numbers_Apple_iphone_6S_Rose_Bouquet_3.jpeg', 0, 0, 0),
(56, 14, 'Switcheasy_Numbers_Apple_iphone_6S_Rose_Bouquet_4.jpeg', 0, 0, 0),
(57, 15, 'Switcheasy_Numbers_Apple_iphone_6S_Sunlit_Tangerine_1.jpeg', 0, 0, 0),
(58, 15, 'Switcheasy_Numbers_Apple_iphone_6S_Sunlit_Tangerine_2.jpeg', 0, 1, 0),
(59, 15, 'Switcheasy_Numbers_Apple_iphone_6S_Sunlit_Tangerine_3.jpeg', 0, 0, 0),
(60, 15, 'Switcheasy_Numbers_Apple_iphone_6S_Sunlit_Tangerine_4.jpeg', 0, 0, 0),
(61, 16, 'Switcheasy_Numbers_Apple_iphone_6S_Frost_White_1.jpeg', 0, 0, 0),
(62, 16, 'Switcheasy_Numbers_Apple_iphone_6S_Frost_White_2.jpeg', 0, 1, 0),
(63, 16, 'Switcheasy_Numbers_Apple_iphone_6S_Frost_White_3.jpeg', 0, 0, 0),
(64, 16, 'Switcheasy_Numbers_Apple_iphone_6S_Frost_White_4.jpeg', 0, 0, 0),
(65, 17, 'Switcheasy_Numbers_Apple_iphone_6S_Stealth_Black_1.jpeg', 0, 0, 0),
(66, 17, 'Switcheasy_Numbers_Apple_iphone_6S_Stealth_Black_2.jpeg', 0, 1, 0),
(67, 17, 'Switcheasy_Numbers_Apple_iphone_6S_Stealth_Black_3.jpeg', 0, 0, 0),
(68, 17, 'Switcheasy_Numbers_Apple_iphone_6S_Stealth_Black_4.jpeg', 0, 0, 0),
(69, 18, 'Switcheasy_Numbers_Apple_iphone_6S_Methyl_Blue_1.jpeg', 0, 0, 0),
(70, 18, 'Switcheasy_Numbers_Apple_iphone_6S_Methyl_Blue_2.jpeg', 0, 1, 0),
(71, 18, 'Switcheasy_Numbers_Apple_iphone_6S_Methyl_Blue_3.jpeg', 0, 0, 0),
(72, 18, 'Switcheasy_Numbers_Apple_iphone_6S_Methyl_Blue_4.jpeg', 0, 0, 0),
(73, 19, 'Switcheasy_Numbers_Apple_iphone_6S_Rose_Bouquet_1.jpeg', 0, 0, 0),
(74, 19, 'Switcheasy_Numbers_Apple_iphone_6S_Rose_Bouquet_2.jpeg', 0, 1, 0),
(75, 19, 'Switcheasy_Numbers_Apple_iphone_6S_Rose_Bouquet_3.jpeg', 0, 0, 0),
(76, 19, 'Switcheasy_Numbers_Apple_iphone_6S_Rose_Bouquet_4.jpeg', 0, 0, 0),
(77, 20, 'Switcheasy_Numbers_Apple_iphone_6S_Sunlit_Tangerine_1.jpeg', 0, 0, 0),
(78, 20, 'Switcheasy_Numbers_Apple_iphone_6S_Sunlit_Tangerine_2.jpeg', 0, 1, 0),
(79, 20, 'Switcheasy_Numbers_Apple_iphone_6S_Sunlit_Tangerine_3.jpeg', 0, 0, 0),
(80, 20, 'Switcheasy_Numbers_Apple_iphone_6S_Sunlit_Tangerine_4.jpeg', 0, 0, 0),
(81, 21, 'Switcheasy_Aero_Apple_iphone_6S_Ultra_Black_1.jpeg', 0, 0, 0),
(82, 21, 'Switcheasy_Aero_Apple_iphone_6S_Ultra_Black_2.jpeg', 0, 1, 0),
(83, 21, 'Switcheasy_Aero_Apple_iphone_6S_Ultra_Black_3.jpeg', 0, 0, 0),
(84, 21, 'Switcheasy_Aero_Apple_iphone_6S_Ultra_Black_4.jpeg', 0, 0, 0),
(85, 22, 'Switcheasy_Aero_Apple_iphone_6S_Methyl_Blue_1.jpeg', 0, 0, 0),
(86, 22, 'Switcheasy_Aero_Apple_iphone_6S_Methyl_Blue_2.jpeg', 0, 1, 0),
(87, 22, 'Switcheasy_Aero_Apple_iphone_6S_Methyl_Blue_3.jpeg', 0, 0, 0),
(88, 22, 'Switcheasy_Aero_Apple_iphone_6S_Methyl_Blue_4.jpeg', 0, 0, 0),
(89, 23, 'Switcheasy_Aero_Apple_iphone_6S_Baby_Pink_1.jpeg', 0, 0, 0),
(90, 23, 'Switcheasy_Aero_Apple_iphone_6S_Baby_Pink_2.jpeg', 0, 1, 0),
(91, 23, 'Switcheasy_Aero_Apple_iphone_6S_Baby_Pink_3.jpeg', 0, 0, 0),
(92, 23, 'Switcheasy_Aero_Apple_iphone_6S_Baby_Pink_4.jpeg', 0, 0, 0),
(93, 24, 'Switcheasy_Aero_Apple_iphone_6S_Ultra_Clear_1.jpeg', 0, 0, 0),
(94, 24, 'Switcheasy_Aero_Apple_iphone_6S_Ultra_Clear_2.jpeg', 0, 1, 0),
(95, 24, 'Switcheasy_Aero_Apple_iphone_6S_Ultra_Clear_3.jpeg', 0, 0, 0),
(96, 24, 'Switcheasy_Aero_Apple_iphone_6S_Ultra_Clear_4.jpeg', 0, 0, 0),
(97, 25, 'Switcheasy_Aero_Apple_iphone_6S_Sesame_1.jpeg', 0, 0, 0),
(98, 25, 'Switcheasy_Aero_Apple_iphone_6S_Sesame_2.jpeg', 0, 1, 0),
(99, 25, 'Switcheasy_Aero_Apple_iphone_6S_Sesame_3.jpeg', 0, 0, 0),
(100, 25, 'Switcheasy_Aero_Apple_iphone_6S_Sesame_4.jpeg', 0, 0, 0),
(101, 26, 'Switcheasy_Aero_Apple_iphone_6S_Ultra_Black_1.jpeg', 0, 0, 0),
(102, 26, 'Switcheasy_Aero_Apple_iphone_6S_Ultra_Black_2.jpeg', 0, 1, 0),
(103, 26, 'Switcheasy_Aero_Apple_iphone_6S_Ultra_Black_3.jpeg', 0, 0, 0),
(104, 26, 'Switcheasy_Aero_Apple_iphone_6S_Ultra_Black_4.jpeg', 0, 0, 0),
(105, 27, 'Switcheasy_Aero_Apple_iphone_6S_Methyl_Blue_1.jpeg', 0, 0, 0),
(106, 27, 'Switcheasy_Aero_Apple_iphone_6S_Methyl_Blue_2.jpeg', 0, 1, 0),
(107, 27, 'Switcheasy_Aero_Apple_iphone_6S_Methyl_Blue_3.jpeg', 0, 0, 0),
(108, 27, 'Switcheasy_Aero_Apple_iphone_6S_Methyl_Blue_4.jpeg', 0, 0, 0),
(109, 28, 'Switcheasy_Aero_Apple_iphone_6S_Baby_Pink_1.jpeg', 0, 0, 0),
(110, 28, 'Switcheasy_Aero_Apple_iphone_6S_Baby_Pink_2.jpeg', 0, 1, 0),
(111, 28, 'Switcheasy_Aero_Apple_iphone_6S_Baby_Pink_3.jpeg', 0, 0, 0),
(112, 28, 'Switcheasy_Aero_Apple_iphone_6S_Baby_Pink_4.jpeg', 0, 0, 0),
(113, 29, 'Switcheasy_Aero_Apple_iphone_6S_Ultra_Clear_1.jpeg', 0, 0, 0),
(114, 29, 'Switcheasy_Aero_Apple_iphone_6S_Ultra_Clear_2.jpeg', 0, 1, 0),
(115, 29, 'Switcheasy_Aero_Apple_iphone_6S_Ultra_Clear_3.jpeg', 0, 0, 0),
(116, 29, 'Switcheasy_Aero_Apple_iphone_6S_Ultra_Clear_4.jpeg', 0, 0, 0),
(117, 30, 'Switcheasy_Aero_Apple_iphone_6S_Sesame_1.jpeg', 0, 0, 0),
(118, 30, 'Switcheasy_Aero_Apple_iphone_6S_Sesame_2.jpeg', 0, 1, 0),
(119, 30, 'Switcheasy_Aero_Apple_iphone_6S_Sesame_3.jpeg', 0, 0, 0),
(120, 30, 'Switcheasy_Aero_Apple_iphone_6S_Sesame_4.jpeg', 0, 0, 0),
(121, 31, 'Switcheasy_Play_Apple_iphone_6S_Ultra_Black_1.jpeg', 0, 0, 0),
(122, 31, 'Switcheasy_Play_Apple_iphone_6S_Ultra_Black_2.jpeg', 0, 1, 0),
(123, 31, 'Switcheasy_Play_Apple_iphone_6S_Ultra_Black_3.jpeg', 0, 0, 0),
(124, 31, 'Switcheasy_Play_Apple_iphone_6S_Ultra_Black_4.jpeg', 0, 0, 0),
(125, 32, 'Switcheasy_Play_Apple_iphone_6S_Ultra_Clear_1.jpeg', 0, 0, 0),
(126, 32, 'Switcheasy_Play_Apple_iphone_6S_Ultra_Clear_2.jpeg', 0, 1, 0),
(127, 32, 'Switcheasy_Play_Apple_iphone_6S_Ultra_Clear_3.jpeg', 0, 0, 0),
(128, 32, 'Switcheasy_Play_Apple_iphone_6S_Ultra_Clear_4.jpeg', 0, 0, 0),
(129, 33, 'Switcheasy_Play_Apple_iphone_6S_Ultra_Black_1.jpeg', 0, 0, 0),
(130, 33, 'Switcheasy_Play_Apple_iphone_6S_Ultra_Black_2.jpeg', 0, 1, 0),
(131, 33, 'Switcheasy_Play_Apple_iphone_6S_Ultra_Black_3.jpeg', 0, 0, 0),
(132, 33, 'Switcheasy_Play_Apple_iphone_6S_Ultra_Black_4.jpeg', 0, 0, 0),
(133, 34, 'Switcheasy_Play_Apple_iphone_6S_Ultra_Clear_1.jpeg', 0, 0, 0),
(134, 34, 'Switcheasy_Play_Apple_iphone_6S_Ultra_Clear_2.jpeg', 0, 1, 0),
(135, 34, 'Switcheasy_Play_Apple_iphone_6S_Ultra_Clear_3.jpeg', 0, 0, 0),
(136, 34, 'Switcheasy_Play_Apple_iphone_6S_Ultra_Clear_4.jpeg', 0, 0, 0),
(137, 35, 'Switcheasy_Nude_Apple_iphone_6S_Ultra_Black_1.jpeg', 0, 0, 0),
(138, 35, 'Switcheasy_Nude_Apple_iphone_6S_Ultra_Black_2.jpeg', 0, 1, 0),
(139, 35, 'Switcheasy_Nude_Apple_iphone_6S_Ultra_Black_3.jpeg', 0, 0, 0),
(140, 35, 'Switcheasy_Nude_Apple_iphone_6S_Ultra_Black_4.jpeg', 0, 0, 0),
(141, 36, 'Switcheasy_Nude_Apple_iphone_6S_Transparent_1.jpeg', 0, 0, 0),
(142, 36, 'Switcheasy_Nude_Apple_iphone_6S_Transparent_2.jpeg', 0, 1, 0),
(143, 36, 'Switcheasy_Nude_Apple_iphone_6S_Transparent_3.jpeg', 0, 0, 0),
(144, 36, 'Switcheasy_Nude_Apple_iphone_6S_Transparent_4.jpeg', 0, 0, 0),
(145, 37, 'Switcheasy_Nude_Apple_iphone_6S_Mint_1.jpeg', 0, 0, 0),
(146, 37, 'Switcheasy_Nude_Apple_iphone_6S_Mint_2.jpeg', 0, 1, 0),
(147, 37, 'Switcheasy_Nude_Apple_iphone_6S_Mint_3.jpeg', 0, 0, 0),
(148, 37, 'Switcheasy_Nude_Apple_iphone_6S_Mint_4.jpeg', 0, 0, 0),
(149, 38, 'Switcheasy_Nude_Apple_iphone_6S_Red_1.jpeg', 0, 0, 0),
(150, 38, 'Switcheasy_Nude_Apple_iphone_6S_Red_2.jpeg', 0, 1, 0),
(151, 38, 'Switcheasy_Nude_Apple_iphone_6S_Red_3.jpeg', 0, 0, 0),
(152, 38, 'Switcheasy_Nude_Apple_iphone_6S_Red_4.jpeg', 0, 0, 0),
(153, 39, 'Switcheasy_Nude_Apple_iphone_6S_Baby_Pink_1.jpeg', 0, 0, 0),
(154, 39, 'Switcheasy_Nude_Apple_iphone_6S_Baby_Pink_2.jpeg', 0, 1, 0),
(155, 39, 'Switcheasy_Nude_Apple_iphone_6S_Baby_Pink_3.jpeg', 0, 0, 0),
(156, 39, 'Switcheasy_Nude_Apple_iphone_6S_Baby_Pink_4.jpeg', 0, 0, 0),
(157, 40, 'Switcheasy_Nude_Apple_iphone_6S_Ultra_Black_1.jpeg', 0, 0, 0),
(158, 40, 'Switcheasy_Nude_Apple_iphone_6S_Ultra_Black_2.jpeg', 0, 1, 0),
(159, 40, 'Switcheasy_Nude_Apple_iphone_6S_Ultra_Black_3.jpeg', 0, 0, 0),
(160, 40, 'Switcheasy_Nude_Apple_iphone_6S_Ultra_Black_4.jpeg', 0, 0, 0),
(161, 41, 'Switcheasy_Nude_Apple_iphone_6S_Transparent_1.jpeg', 0, 0, 0),
(162, 41, 'Switcheasy_Nude_Apple_iphone_6S_Transparent_2.jpeg', 0, 1, 0),
(163, 41, 'Switcheasy_Nude_Apple_iphone_6S_Transparent_3.jpeg', 0, 0, 0),
(164, 41, 'Switcheasy_Nude_Apple_iphone_6S_Transparent_4.jpeg', 0, 0, 0),
(165, 42, 'Switcheasy_Nude_Apple_iphone_6S_Mint_1.jpeg', 0, 0, 0),
(166, 42, 'Switcheasy_Nude_Apple_iphone_6S_Mint_2.jpeg', 0, 1, 0),
(167, 42, 'Switcheasy_Nude_Apple_iphone_6S_Mint_3.jpeg', 0, 0, 0),
(168, 42, 'Switcheasy_Nude_Apple_iphone_6S_Mint_4.jpeg', 0, 0, 0),
(169, 43, 'Switcheasy_Nude_Apple_iphone_6S_Red_1.jpeg', 0, 0, 0),
(170, 43, 'Switcheasy_Nude_Apple_iphone_6S_Red_2.jpeg', 0, 1, 0),
(171, 43, 'Switcheasy_Nude_Apple_iphone_6S_Red_3.jpeg', 0, 0, 0),
(172, 43, 'Switcheasy_Nude_Apple_iphone_6S_Red_4.jpeg', 0, 0, 0),
(173, 44, 'Switcheasy_Nude_Apple_iphone_6S_Baby_Pink_1.jpeg', 0, 0, 0),
(174, 44, 'Switcheasy_Nude_Apple_iphone_6S_Baby_Pink_2.jpeg', 0, 1, 0),
(175, 44, 'Switcheasy_Nude_Apple_iphone_6S_Baby_Pink_3.jpeg', 0, 0, 0),
(176, 44, 'Switcheasy_Nude_Apple_iphone_6S_Baby_Pink_4.jpeg', 0, 0, 0),
(177, 45, 'Switcheasy_N+_Apple_iphone_6S_Methyl_Blue_1.jpeg', 0, 0, 0),
(178, 45, 'Switcheasy_N+_Apple_iphone_6S_Methyl_Blue_2.jpeg', 0, 1, 0),
(179, 45, 'Switcheasy_N+_Apple_iphone_6S_Methyl_Blue_3.jpeg', 0, 0, 0),
(180, 45, 'Switcheasy_N+_Apple_iphone_6S_Methyl_Blue_4.jpeg', 0, 0, 0),
(181, 46, 'Switcheasy_N+_Apple_iphone_6S_Baby_Pink_1.jpeg', 0, 0, 0),
(182, 46, 'Switcheasy_N+_Apple_iphone_6S_Baby_Pink_2.jpeg', 0, 1, 0),
(183, 46, 'Switcheasy_N+_Apple_iphone_6S_Baby_Pink_3.jpeg', 0, 0, 0),
(184, 46, 'Switcheasy_N+_Apple_iphone_6S_Baby_Pink_4.jpeg', 0, 0, 0),
(185, 47, 'Switcheasy_N+_Apple_iphone_6S_Obsidian_1.jpeg', 0, 0, 0),
(186, 47, 'Switcheasy_N+_Apple_iphone_6S_Obsidian_2.jpeg', 0, 1, 0),
(187, 47, 'Switcheasy_N+_Apple_iphone_6S_Obsidian_3.jpeg', 0, 0, 0),
(188, 47, 'Switcheasy_N+_Apple_iphone_6S_Obsidian_4.jpeg', 0, 0, 0),
(189, 48, 'Switcheasy_N+_Apple_iphone_6S_Ceramic_White_1.jpeg', 0, 0, 0),
(190, 48, 'Switcheasy_N+_Apple_iphone_6S_Ceramic_White_2.jpeg', 0, 1, 0),
(191, 48, 'Switcheasy_N+_Apple_iphone_6S_Ceramic_White_3.jpeg', 0, 0, 0),
(192, 48, 'Switcheasy_N+_Apple_iphone_6S_Ceramic_White_4.jpeg', 0, 0, 0),
(193, 49, 'Switcheasy_N+_Apple_iphone_6S_Methyl_Blue_1.jpeg', 0, 0, 0),
(194, 49, 'Switcheasy_N+_Apple_iphone_6S_Methyl_Blue_2.jpeg', 0, 1, 0),
(195, 49, 'Switcheasy_N+_Apple_iphone_6S_Methyl_Blue_3.jpeg', 0, 0, 0),
(196, 49, 'Switcheasy_N+_Apple_iphone_6S_Methyl_Blue_4.jpeg', 0, 0, 0),
(197, 50, 'Switcheasy_N+_Apple_iphone_6S_Baby_Pink_1.jpeg', 0, 0, 0),
(198, 50, 'Switcheasy_N+_Apple_iphone_6S_Baby_Pink_2.jpeg', 0, 1, 0),
(199, 50, 'Switcheasy_N+_Apple_iphone_6S_Baby_Pink_3.jpeg', 0, 0, 0),
(200, 50, 'Switcheasy_N+_Apple_iphone_6S_Baby_Pink_4.jpeg', 0, 0, 0),
(201, 51, 'Switcheasy_N+_Apple_iphone_6S_Obsidian_1.jpeg', 0, 0, 0),
(202, 51, 'Switcheasy_N+_Apple_iphone_6S_Obsidian_2.jpeg', 0, 1, 0),
(203, 51, 'Switcheasy_N+_Apple_iphone_6S_Obsidian_3.jpeg', 0, 0, 0),
(204, 51, 'Switcheasy_N+_Apple_iphone_6S_Obsidian_4.jpeg', 0, 0, 0),
(205, 52, 'Switcheasy_N+_Apple_iphone_6S_Ceramic_White_1.jpeg', 0, 0, 0),
(206, 52, 'Switcheasy_N+_Apple_iphone_6S_Ceramic_White_2.jpeg', 0, 1, 0),
(207, 52, 'Switcheasy_N+_Apple_iphone_6S_Ceramic_White_3.jpeg', 0, 0, 0),
(208, 52, 'Switcheasy_N+_Apple_iphone_6S_Ceramic_White_4.jpeg', 0, 0, 0),
(209, 53, 'Otterbox_Defender_Apple_iPhone_6S_Black_1.jpeg', 0, 0, 0),
(210, 53, 'Otterbox_Defender_Apple_iPhone_6S_Black_2.jpeg', 0, 1, 0),
(211, 53, 'Otterbox_Defender_Apple_iPhone_6S_Black_3.jpeg', 0, 0, 0),
(212, 53, 'Otterbox_Defender_Apple_iPhone_6S_Black_4.jpeg', 0, 0, 0),
(213, 54, 'Otterbox_Defender_Apple_iPhone_6S_GLACIER_1.jpeg', 0, 0, 0),
(214, 54, 'Otterbox_Defender_Apple_iPhone_6S_GLACIER_2.jpeg', 0, 1, 0),
(215, 54, 'Otterbox_Defender_Apple_iPhone_6S_GLACIER_3.jpeg', 0, 0, 0),
(216, 54, 'Otterbox_Defender_Apple_iPhone_6S_GLACIER_4.jpeg', 0, 0, 0),
(217, 55, 'Otterbox_Commuter_Apple_iPhone_6S_Black_1.jpeg', 0, 0, 0),
(218, 55, 'Otterbox_Commuter_Apple_iPhone_6S_Black_2.jpeg', 0, 1, 0),
(219, 55, 'Otterbox_Commuter_Apple_iPhone_6S_Black_3.jpeg', 0, 0, 0),
(220, 56, 'Otterbox_Commuter_Apple_iPhone_6S_GLACIER_1.jpeg', 0, 0, 0),
(221, 56, 'Otterbox_Commuter_Apple_iPhone_6S_GLACIER_2.jpeg', 0, 1, 0),
(222, 56, 'Otterbox_Commuter_Apple_iPhone_6S_GLACIER_3.jpeg', 0, 0, 0),
(223, 57, 'Otterbox_Commuter_Apple_iPhone_6S_NEON_ROSE_1.jpeg', 0, 0, 0),
(224, 57, 'Otterbox_Commuter_Apple_iPhone_6S_NEON_ROSE_2.jpeg', 0, 1, 0),
(225, 57, 'Otterbox_Commuter_Apple_iPhone_6S_NEON_ROSE_3.jpeg', 0, 0, 0),
(226, 58, 'Otterbox_Commuter_Apple_iPhone_6S_INK_BLUE_1.jpeg', 0, 0, 0),
(227, 58, 'Otterbox_Commuter_Apple_iPhone_6S_INK_BLUE_2.jpeg', 0, 1, 0),
(228, 58, 'Otterbox_Commuter_Apple_iPhone_6S_INK_BLUE_3.jpeg', 0, 0, 0),
(229, 59, 'Otterbox_Commuter_Wallet_Apple_iPhone_6S_BLACK_1.jpeg', 0, 0, 0),
(230, 59, 'Otterbox_Commuter_Wallet_Apple_iPhone_6S_BLACK_2.jpeg', 0, 1, 0),
(231, 59, 'Otterbox_Commuter_Wallet_Apple_iPhone_6S_BLACK_3.jpeg', 0, 0, 0),
(232, 59, 'Otterbox_Commuter_Wallet_Apple_iPhone_6S_BLACK_4.jpeg', 0, 0, 0),
(233, 60, 'Otterbox_Commuter_Wallet_Apple_iPhone_6S_GLACIER_1.jpeg', 0, 0, 0),
(234, 60, 'Otterbox_Commuter_Wallet_Apple_iPhone_6S_GLACIER_2.jpeg', 0, 1, 0),
(235, 60, 'Otterbox_Commuter_Wallet_Apple_iPhone_6S_GLACIER_3.jpeg', 0, 0, 0),
(236, 60, 'Otterbox_Commuter_Wallet_Apple_iPhone_6S_GLACIER_4.jpeg', 0, 0, 0),
(237, 61, 'Otterbox_Symmetry_Apple_iPhone_6S_Black_1.jpeg', 0, 0, 0),
(238, 61, 'Otterbox_Symmetry_Apple_iPhone_6S_Black_2.jpeg', 0, 1, 0),
(239, 61, 'Otterbox_Symmetry_Apple_iPhone_6S_Black_3.jpeg', 0, 0, 0),
(240, 61, 'Otterbox_Symmetry_Apple_iPhone_6S_Black_4.jpeg', 0, 0, 0),
(241, 62, 'Otterbox_Symmetry_Apple_iPhone_6S_GLACIER_1.jpeg', 0, 0, 0),
(242, 62, 'Otterbox_Symmetry_Apple_iPhone_6S_GLACIER_2.jpeg', 0, 1, 0),
(243, 62, 'Otterbox_Symmetry_Apple_iPhone_6S_GLACIER_3.jpeg', 0, 0, 0),
(244, 62, 'Otterbox_Symmetry_Apple_iPhone_6S_GLACIER_4.jpeg', 0, 0, 0),
(245, 63, 'Otterbox_Symmetry_Apple_iPhone_6S_AQUA_DOT_1.jpeg', 0, 0, 0),
(246, 63, 'Otterbox_Symmetry_Apple_iPhone_6S_AQUA_DOT_2.jpeg', 0, 1, 0),
(247, 63, 'Otterbox_Symmetry_Apple_iPhone_6S_AQUA_DOT_3.jpeg', 0, 0, 0),
(248, 63, 'Otterbox_Symmetry_Apple_iPhone_6S_AQUA_DOT_4.jpeg', 0, 0, 0),
(249, 64, 'Otterbox_Symmetry_Apple_iPhone_6S_FLORAL_POND_1.jpeg', 0, 0, 0),
(250, 64, 'Otterbox_Symmetry_Apple_iPhone_6S_FLORAL_POND_2.jpeg', 0, 1, 0),
(251, 64, 'Otterbox_Symmetry_Apple_iPhone_6S_FLORAL_POND_3.jpeg', 0, 0, 0),
(252, 64, 'Otterbox_Symmetry_Apple_iPhone_6S_FLORAL_POND_4.jpeg', 0, 0, 0),
(253, 65, 'Otterbox_Symmetry_Apple_iPhone_6S_POPPY_PETAL_1.jpeg', 0, 0, 0),
(254, 65, 'Otterbox_Symmetry_Apple_iPhone_6S_POPPY_PETAL_2.jpeg', 0, 1, 0),
(255, 65, 'Otterbox_Symmetry_Apple_iPhone_6S_POPPY_PETAL_3.jpeg', 0, 0, 0),
(256, 65, 'Otterbox_Symmetry_Apple_iPhone_6S_POPPY_PETAL_4.jpeg', 0, 0, 0),
(257, 66, 'Otterbox_Symmetry_Apple_iPhone_6S_EDEN_TEAL_1.jpeg', 0, 0, 0),
(258, 66, 'Otterbox_Symmetry_Apple_iPhone_6S_EDEN_TEAL_2.jpeg', 0, 1, 0),
(259, 66, 'Otterbox_Symmetry_Apple_iPhone_6S_EDEN_TEAL_3.jpeg', 0, 0, 0),
(260, 66, 'Otterbox_Symmetry_Apple_iPhone_6S_EDEN_TEAL_4.jpeg', 0, 0, 0),
(261, 67, 'Otterbox_Defender_Apple_iPhone_6S_Black_1.jpeg', 0, 0, 0),
(262, 67, 'Otterbox_Defender_Apple_iPhone_6S_Black_2.jpeg', 0, 1, 0),
(263, 67, 'Otterbox_Defender_Apple_iPhone_6S_Black_3.jpeg', 0, 0, 0),
(264, 67, 'Otterbox_Defender_Apple_iPhone_6S_Black_4.jpeg', 0, 0, 0),
(265, 68, 'Otterbox_Defender_Apple_iPhone_6S_GLACIER_1.jpeg', 0, 0, 0),
(266, 68, 'Otterbox_Defender_Apple_iPhone_6S_GLACIER_2.jpeg', 0, 1, 0),
(267, 68, 'Otterbox_Defender_Apple_iPhone_6S_GLACIER_3.jpeg', 0, 0, 0),
(268, 68, 'Otterbox_Defender_Apple_iPhone_6S_GLACIER_4.jpeg', 0, 0, 0),
(269, 69, 'Otterbox_Defender_Apple_iphone_6S_Plus_INK_BLUE_1.jpeg', 0, 0, 0),
(270, 69, 'Otterbox_Defender_Apple_iphone_6S_Plus_INK_BLUE_2.jpeg', 0, 1, 0),
(271, 69, 'Otterbox_Defender_Apple_iphone_6S_Plus_INK_BLUE_3.jpeg', 0, 0, 0),
(272, 69, 'Otterbox_Defender_Apple_iphone_6S_Plus_INK_BLUE_4.jpeg', 0, 0, 0),
(273, 69, 'Otterbox_Defender_Apple_iphone_6S_Plus_INK_BLUE_5.jpeg', 0, 0, 0),
(274, 70, 'Otterbox_Commuter_Apple_iPhone_6S_Black_1.jpeg', 0, 0, 0),
(275, 70, 'Otterbox_Commuter_Apple_iPhone_6S_Black_2.jpeg', 0, 1, 0),
(276, 70, 'Otterbox_Commuter_Apple_iPhone_6S_Black_3.jpeg', 0, 0, 0),
(277, 71, 'Otterbox_Commuter_Apple_iPhone_6S_GLACIER_1.jpeg', 0, 0, 0),
(278, 71, 'Otterbox_Commuter_Apple_iPhone_6S_GLACIER_2.jpeg', 0, 1, 0),
(279, 71, 'Otterbox_Commuter_Apple_iPhone_6S_GLACIER_3.jpeg', 0, 0, 0),
(280, 72, 'Otterbox_Commuter_Apple_iPhone_6S_NEON_ROSE_1.jpeg', 0, 0, 0),
(281, 72, 'Otterbox_Commuter_Apple_iPhone_6S_NEON_ROSE_2.jpeg', 0, 1, 0),
(282, 72, 'Otterbox_Commuter_Apple_iPhone_6S_NEON_ROSE_3.jpeg', 0, 0, 0),
(283, 73, 'Otterbox_Commuter_Apple_iPhone_6S_INK_BLUE_1.jpeg', 0, 0, 0),
(284, 73, 'Otterbox_Commuter_Apple_iPhone_6S_INK_BLUE_2.jpeg', 0, 1, 0),
(285, 73, 'Otterbox_Commuter_Apple_iPhone_6S_INK_BLUE_3.jpeg', 0, 0, 0),
(286, 74, 'Otterbox_Commuter_Apple_iphone_6S_Plus_AQUA_SKY_1.jpeg', 0, 0, 0),
(287, 74, 'Otterbox_Commuter_Apple_iphone_6S_Plus_AQUA_SKY_2.jpeg', 0, 1, 0),
(288, 75, 'Otterbox_Symmetry_Apple_iPhone_6S_Black_1.jpeg', 0, 0, 0),
(289, 75, 'Otterbox_Symmetry_Apple_iPhone_6S_Black_2.jpeg', 0, 1, 0),
(290, 75, 'Otterbox_Symmetry_Apple_iPhone_6S_Black_3.jpeg', 0, 0, 0),
(291, 75, 'Otterbox_Symmetry_Apple_iPhone_6S_Black_4.jpeg', 0, 0, 0),
(292, 76, 'Otterbox_Symmetry_Apple_iPhone_6S_GLACIER_1.jpeg', 0, 0, 0),
(293, 76, 'Otterbox_Symmetry_Apple_iPhone_6S_GLACIER_2.jpeg', 0, 1, 0),
(294, 76, 'Otterbox_Symmetry_Apple_iPhone_6S_GLACIER_3.jpeg', 0, 0, 0),
(295, 76, 'Otterbox_Symmetry_Apple_iPhone_6S_GLACIER_4.jpeg', 0, 0, 0),
(296, 77, 'Otterbox_Symmetry_Apple_iphone_6S_Plus_BLUE_PRINT_1.jpeg', 0, 0, 0),
(297, 77, 'Otterbox_Symmetry_Apple_iphone_6S_Plus_BLUE_PRINT_2.jpeg', 0, 1, 0),
(298, 78, 'Otterbox_Symmetry_Apple_iPhone_6S_AQUA_DOT_1.jpeg', 0, 0, 0),
(299, 78, 'Otterbox_Symmetry_Apple_iPhone_6S_AQUA_DOT_2.jpeg', 0, 1, 0),
(300, 78, 'Otterbox_Symmetry_Apple_iPhone_6S_AQUA_DOT_3.jpeg', 0, 0, 0),
(301, 78, 'Otterbox_Symmetry_Apple_iPhone_6S_AQUA_DOT_4.jpeg', 0, 0, 0),
(302, 79, 'Otterbox_Symmetry_Apple_iPhone_6S_FLORAL_POND_1.jpeg', 0, 0, 0),
(303, 79, 'Otterbox_Symmetry_Apple_iPhone_6S_FLORAL_POND_2.jpeg', 0, 1, 0),
(304, 79, 'Otterbox_Symmetry_Apple_iPhone_6S_FLORAL_POND_3.jpeg', 0, 0, 0),
(305, 79, 'Otterbox_Symmetry_Apple_iPhone_6S_FLORAL_POND_4.jpeg', 0, 0, 0),
(306, 80, 'Guess_GUFLBKP6LSAB_Apple_iPhone_6_Plus_Black_1.jpeg', 0, 0, 0),
(307, 80, 'Guess_GUFLBKP6LSAB_Apple_iPhone_6_Plus_Black_2.jpeg', 0, 1, 0),
(308, 81, 'Guess_GUFLBKP6LSAC_Apple_iPhone_6_Plus_Beige_1.jpeg', 0, 0, 0),
(309, 81, 'Guess_GUFLBKP6LSAC_Apple_iPhone_6_Plus_Beige_2.jpeg', 0, 1, 0),
(310, 81, 'Guess_GUFLBKP6LSAC_Apple_iPhone_6_Plus_Beige_3.jpeg', 0, 0, 0),
(311, 81, 'Guess_GUFLBKP6LSAC_Apple_iPhone_6_Plus_Beige_4.jpeg', 0, 0, 0),
(312, 82, 'Guess_GUHCP6SAB_Apple_iPhone_6_Black_1.jpeg', 0, 0, 0),
(313, 83, 'Guess_GUHCP6SAC_Apple_iPhone_6_Beige_1.jpeg', 0, 0, 0),
(314, 83, 'Guess_GUHCP6SAC_Apple_iPhone_6_Beige_2.jpeg', 0, 1, 0),
(315, 83, 'Guess_GUHCP6SAC_Apple_iPhone_6_Beige_3.jpeg', 0, 0, 0),
(316, 84, 'Guess_GUHCP6SAS_Apple_iPhone_6_Grey_1.jpeg', 0, 0, 0),
(317, 84, 'Guess_GUHCP6SAS_Apple_iPhone_6_Grey_2.jpeg', 0, 1, 0),
(318, 84, 'Guess_GUHCP6SAS_Apple_iPhone_6_Grey_3.jpeg', 0, 0, 0),
(319, 85, 'Guess_GUHCP6LSAB_Apple_iPhone_6_Plus_Black_1.jpeg', 0, 0, 0),
(320, 86, 'Guess_GUHCP6LSAC_Apple_iPhone_6_Plus_Beige_1.jpeg', 0, 0, 0),
(321, 86, 'Guess_GUHCP6LSAC_Apple_iPhone_6_Plus_Beige_2.jpeg', 0, 1, 0),
(322, 86, 'Guess_GUHCP6LSAC_Apple_iPhone_6_Plus_Beige_3.jpeg', 0, 0, 0),
(323, 87, 'Guess_GUHCP6LSAS_Apple_iPhone_6_Plus_Grey_1.jpeg', 0, 0, 0),
(324, 87, 'Guess_GUHCP6LSAS_Apple_iPhone_6_Plus_Grey_2.jpeg', 0, 1, 0),
(325, 87, 'Guess_GUHCP6LSAS_Apple_iPhone_6_Plus_Grey_3.jpeg', 0, 0, 0),
(326, 88, 'Guess_GUFLBKP6SAB_Apple_iPhone_6_Black_1.jpeg', 0, 0, 0),
(327, 89, 'Guess_GUFLBKP6SAC_Apple_iPhone_6_Beige_1.jpeg', 0, 0, 0),
(328, 90, 'Guess_GUFLBKP6STW_Apple_iPhone_6_White_1.jpeg', 0, 0, 0),
(329, 91, 'Bling_My_Thing_IP6-I-VG-GIG-IGM_Apple_iPhone_6_Plus_Gold_1.jpeg', 0, 0, 0),
(330, 91, 'Bling_My_Thing_IP6-I-VG-GIG-IGM_Apple_iPhone_6_Plus_Gold_2.jpeg', 0, 1, 0),
(331, 91, 'Bling_My_Thing_IP6-I-VG-GIG-IGM_Apple_iPhone_6_Plus_Gold_3.jpeg', 0, 0, 0),
(332, 92, 'Bling_My_Thing_IP6-I-VG-BKG-JCC_Apple_iPhone_6_Plus_Black_1.jpeg', 0, 0, 0),
(333, 92, 'Bling_My_Thing_IP6-I-VG-BKG-JCC_Apple_iPhone_6_Plus_Black_2.jpeg', 0, 1, 0),
(334, 92, 'Bling_My_Thing_IP6-I-VG-BKG-JCC_Apple_iPhone_6_Plus_Black_3.jpeg', 0, 0, 0),
(335, 93, 'Bling_My_Thing_IP6-I-MW-CL-CCD_Apple_iPhone_6_Plus_Cotton_Candy_1.jpeg', 0, 0, 0),
(336, 93, 'Bling_My_Thing_IP6-I-MW-CL-CCD_Apple_iPhone_6_Plus_Cotton_Candy_2.jpeg', 0, 1, 0),
(337, 93, 'Bling_My_Thing_IP6-I-MW-CL-CCD_Apple_iPhone_6_Plus_Cotton_Candy_3.jpeg', 0, 0, 0),
(338, 94, 'Bling_My_Thing_ip6-mtk-cl-non_Apple_iPhone_6_Transparent_1.jpeg', 0, 0, 0),
(339, 94, 'Bling_My_Thing_ip6-mtk-cl-non_Apple_iPhone_6_Transparent_2.jpeg', 0, 1, 0),
(340, 94, 'Bling_My_Thing_ip6-mtk-cl-non_Apple_iPhone_6_Transparent_3.jpeg', 0, 0, 0),
(341, 95, 'Bling_My_Thing_ip6-mtk-gy-non_Apple_iPhone_6_Tinted_Grey_1.jpeg', 0, 0, 0),
(342, 95, 'Bling_My_Thing_ip6-mtk-gy-non_Apple_iPhone_6_Tinted_Grey_2.jpeg', 0, 1, 0),
(343, 95, 'Bling_My_Thing_ip6-mtk-gy-non_Apple_iPhone_6_Tinted_Grey_3.jpeg', 0, 0, 0),
(344, 96, 'Bling_My_Thing_ip6-mtk-pk-non_Apple_iPhone_6_Tinted_Pink_1.jpeg', 0, 0, 0),
(345, 96, 'Bling_My_Thing_ip6-mtk-pk-non_Apple_iPhone_6_Tinted_Pink_2.jpeg', 0, 1, 0),
(346, 96, 'Bling_My_Thing_ip6-mtk-pk-non_Apple_iPhone_6_Tinted_Pink_3.jpeg', 0, 0, 0),
(347, 97, 'Bling_My_Thing_ip6-ms-cl-non_Apple_iPhone_6_Transparent_1.jpeg', 0, 0, 0),
(348, 97, 'Bling_My_Thing_ip6-ms-cl-non_Apple_iPhone_6_Transparent_2.jpeg', 0, 1, 0),
(349, 97, 'Bling_My_Thing_ip6-ms-cl-non_Apple_iPhone_6_Transparent_3.jpeg', 0, 0, 0),
(350, 97, 'Bling_My_Thing_ip6-ms-cl-non_Apple_iPhone_6_Transparent_4.jpeg', 0, 0, 0),
(351, 98, 'Bling_My_Thing_ip6-ms-gy-non_Apple_iPhone_6_Cappuccino_1.jpeg', 0, 0, 0),
(352, 98, 'Bling_My_Thing_ip6-ms-gy-non_Apple_iPhone_6_Cappuccino_2.jpeg', 0, 1, 0),
(353, 98, 'Bling_My_Thing_ip6-ms-gy-non_Apple_iPhone_6_Cappuccino_3.jpeg', 0, 0, 0),
(354, 98, 'Bling_My_Thing_ip6-ms-gy-non_Apple_iPhone_6_Cappuccino_4.jpeg', 0, 0, 0),
(355, 99, 'Bling_My_Thing_ip6-ms-pk-non_Apple_iPhone_6_Pink_1.jpeg', 0, 0, 0),
(356, 99, 'Bling_My_Thing_ip6-ms-pk-non_Apple_iPhone_6_Pink_2.jpeg', 0, 1, 0),
(357, 99, 'Bling_My_Thing_ip6-ms-pk-non_Apple_iPhone_6_Pink_3.jpeg', 0, 0, 0),
(358, 99, 'Bling_My_Thing_ip6-ms-pk-non_Apple_iPhone_6_Pink_4.jpeg', 0, 0, 0),
(359, 100, 'Bling_My_Thing_ip6-ex-cl-ice_Apple_iPhone_6_Transparent_1.jpeg', 0, 0, 0),
(360, 100, 'Bling_My_Thing_ip6-ex-cl-ice_Apple_iPhone_6_Transparent_2.jpeg', 0, 1, 0),
(361, 100, 'Bling_My_Thing_ip6-ex-cl-ice_Apple_iPhone_6_Transparent_3.jpeg', 0, 0, 0),
(362, 100, 'Bling_My_Thing_ip6-ex-cl-ice_Apple_iPhone_6_Transparent_4.jpeg', 0, 0, 0),
(363, 100, 'Bling_My_Thing_ip6-ex-cl-ice_Apple_iPhone_6_Transparent_5.jpeg', 0, 0, 0),
(364, 101, 'Bling_My_Thing_ip6-gm-bk-gld_Apple_iPhone_6_Gold/Black_1.jpeg', 0, 0, 0),
(365, 101, 'Bling_My_Thing_ip6-gm-bk-gld_Apple_iPhone_6_Gold/Black_2.jpeg', 0, 1, 0),
(366, 101, 'Bling_My_Thing_ip6-gm-bk-gld_Apple_iPhone_6_Gold/Black_3.jpeg', 0, 0, 0),
(367, 101, 'Bling_My_Thing_ip6-gm-bk-gld_Apple_iPhone_6_Gold/Black_4.jpeg', 0, 0, 0),
(368, 102, 'Bling_My_Thing_ip6-gm-bk-cry_Apple_iPhone_6_Crystal/Black_1.jpeg', 0, 0, 0),
(369, 102, 'Bling_My_Thing_ip6-gm-bk-cry_Apple_iPhone_6_Crystal/Black_2.jpeg', 0, 1, 0),
(370, 102, 'Bling_My_Thing_ip6-gm-bk-cry_Apple_iPhone_6_Crystal/Black_3.jpeg', 0, 0, 0),
(371, 102, 'Bling_My_Thing_ip6-gm-bk-cry_Apple_iPhone_6_Crystal/Black_4.jpeg', 0, 0, 0),
(372, 103, 'Bling_My_Thing_ip6-ws-cl-cry_Apple_iPhone_6_Crystal_1.jpeg', 0, 0, 0),
(373, 103, 'Bling_My_Thing_ip6-ws-cl-cry_Apple_iPhone_6_Crystal_2.jpeg', 0, 1, 0),
(374, 103, 'Bling_My_Thing_ip6-ws-cl-cry_Apple_iPhone_6_Crystal_3.jpeg', 0, 0, 0),
(375, 103, 'Bling_My_Thing_ip6-ws-cl-cry_Apple_iPhone_6_Crystal_4.jpeg', 0, 0, 0),
(376, 104, 'Bling_My_Thing_ip6-ws-cl-ccd_Apple_iPhone_6_Cotton_Candy_1.jpeg', 0, 0, 0),
(377, 104, 'Bling_My_Thing_ip6-ws-cl-ccd_Apple_iPhone_6_Cotton_Candy_2.jpeg', 0, 1, 0),
(378, 104, 'Bling_My_Thing_ip6-ws-cl-ccd_Apple_iPhone_6_Cotton_Candy_3.jpeg', 0, 0, 0),
(379, 104, 'Bling_My_Thing_ip6-ws-cl-ccd_Apple_iPhone_6_Cotton_Candy_4.jpeg', 0, 0, 0),
(380, 105, 'Bling_My_Thing_ip6-pp-cl-cry_Apple_iPhone_6_Crystal_1.jpeg', 0, 0, 0),
(381, 105, 'Bling_My_Thing_ip6-pp-cl-cry_Apple_iPhone_6_Crystal_2.jpeg', 0, 1, 0),
(382, 105, 'Bling_My_Thing_ip6-pp-cl-cry_Apple_iPhone_6_Crystal_3.jpeg', 0, 0, 0),
(383, 105, 'Bling_My_Thing_ip6-pp-cl-cry_Apple_iPhone_6_Crystal_4.jpeg', 0, 0, 0),
(384, 106, 'Bling_My_Thing_ip6-pp-cl-ccd_Apple_iPhone_6_Cotton_Candy_1.jpeg', 0, 0, 0),
(385, 106, 'Bling_My_Thing_ip6-pp-cl-ccd_Apple_iPhone_6_Cotton_Candy_2.jpeg', 0, 1, 0),
(386, 106, 'Bling_My_Thing_ip6-pp-cl-ccd_Apple_iPhone_6_Cotton_Candy_3.jpeg', 0, 0, 0),
(387, 106, 'Bling_My_Thing_ip6-pp-cl-ccd_Apple_iPhone_6_Cotton_Candy_4.jpeg', 0, 0, 0),
(388, 107, 'Bling_My_Thing_ip6-pp-cl-pkm_Apple_iPhone_6_Pink_Mix_1.jpeg', 0, 0, 0),
(389, 107, 'Bling_My_Thing_ip6-pp-cl-pkm_Apple_iPhone_6_Pink_Mix_2.jpeg', 0, 1, 0),
(390, 107, 'Bling_My_Thing_ip6-pp-cl-pkm_Apple_iPhone_6_Pink_Mix_3.jpeg', 0, 0, 0),
(391, 107, 'Bling_My_Thing_ip6-pp-cl-pkm_Apple_iPhone_6_Pink_Mix_4.jpeg', 0, 0, 0),
(392, 108, 'Bling_My_Thing_ip6-mw-cl-cry_Apple_iPhone_6_Crystal_1.jpeg', 0, 0, 0),
(393, 108, 'Bling_My_Thing_ip6-mw-cl-cry_Apple_iPhone_6_Crystal_2.jpeg', 0, 1, 0),
(394, 108, 'Bling_My_Thing_ip6-mw-cl-cry_Apple_iPhone_6_Crystal_3.jpeg', 0, 0, 0),
(395, 108, 'Bling_My_Thing_ip6-mw-cl-cry_Apple_iPhone_6_Crystal_4.jpeg', 0, 0, 0),
(396, 109, 'Bling_My_Thing_ip6-mw-cl-ccd_Apple_iPhone_6_Cotton_Candy_1.jpeg', 0, 0, 0),
(397, 109, 'Bling_My_Thing_ip6-mw-cl-ccd_Apple_iPhone_6_Cotton_Candy_2.jpeg', 0, 1, 0),
(398, 109, 'Bling_My_Thing_ip6-mw-cl-ccd_Apple_iPhone_6_Cotton_Candy_3.jpeg', 0, 0, 0),
(399, 109, 'Bling_My_Thing_ip6-mw-cl-ccd_Apple_iPhone_6_Cotton_Candy_4.jpeg', 0, 0, 0),
(400, 110, 'Bling_My_Thing_ip6-mw-cl-pkm_Apple_iPhone_6_Pink_Mix_1.jpeg', 0, 0, 0),
(401, 110, 'Bling_My_Thing_ip6-mw-cl-pkm_Apple_iPhone_6_Pink_Mix_2.jpeg', 0, 1, 0),
(402, 110, 'Bling_My_Thing_ip6-mw-cl-pkm_Apple_iPhone_6_Pink_Mix_3.jpeg', 0, 0, 0),
(403, 110, 'Bling_My_Thing_ip6-mw-cl-pkm_Apple_iPhone_6_Pink_Mix_4.jpeg', 0, 0, 0),
(404, 111, 'Bling_My_Thing_ip6-mw-cl-agm_Apple_iPhone_6_Angel_Mix_1.jpeg', 0, 0, 0),
(405, 111, 'Bling_My_Thing_ip6-mw-cl-agm_Apple_iPhone_6_Angel_Mix_2.jpeg', 0, 1, 0),
(406, 111, 'Bling_My_Thing_ip6-mw-cl-agm_Apple_iPhone_6_Angel_Mix_3.jpeg', 0, 0, 0),
(407, 111, 'Bling_My_Thing_ip6-mw-cl-agm_Apple_iPhone_6_Angel_Mix_4.jpeg', 0, 0, 0),
(408, 112, 'Bling_My_Thing_ip6-pri-bk-non_Apple_iPhone_6_Black_1.jpeg', 0, 0, 0),
(409, 112, 'Bling_My_Thing_ip6-pri-bk-non_Apple_iPhone_6_Black_2.jpeg', 0, 1, 0),
(410, 112, 'Bling_My_Thing_ip6-pri-bk-non_Apple_iPhone_6_Black_3.jpeg', 0, 0, 0),
(411, 112, 'Bling_My_Thing_ip6-pri-bk-non_Apple_iPhone_6_Black_4.jpeg', 0, 0, 0),
(412, 112, 'Bling_My_Thing_Ayano_Primo_Apple_iPhone_6_Black_5.jpeg', 0, 0, 0),
(413, 113, 'Bling_My_Thing_ip6-pri-wt-non_Apple_iPhone_6_White_1.jpeg', 0, 0, 0),
(414, 113, 'Bling_My_Thing_ip6-pri-wt-non_Apple_iPhone_6_White_2.jpeg', 0, 1, 0),
(415, 113, 'Bling_My_Thing_ip6-pri-wt-non_Apple_iPhone_6_White_3.jpeg', 0, 0, 0),
(416, 113, 'Bling_My_Thing_ip6-pri-wt-non_Apple_iPhone_6_White_4.jpeg', 0, 0, 0),
(417, 113, 'Bling_My_Thing_Ayano_Primo_Apple_iPhone_6_White_5.jpeg', 0, 0, 0),
(418, 114, 'Bling_My_Thing_ip6-l-pri-bk-non_Apple_iPhone_6_Plus_Black_1.jpeg', 0, 0, 0),
(419, 114, 'Bling_My_Thing_ip6-l-pri-bk-non_Apple_iPhone_6_Plus_Black_2.jpeg', 0, 1, 0),
(420, 114, 'Bling_My_Thing_ip6-l-pri-bk-non_Apple_iPhone_6_Plus_Black_3.jpeg', 0, 0, 0),
(421, 114, 'Bling_My_Thing_ip6-l-pri-bk-non_Apple_iPhone_6_Plus_Black_4.jpeg', 0, 0, 0),
(422, 114, 'Bling_My_Thing_Ayano_Primo_Apple_iPhone_6_Plus_Black_5.jpeg', 0, 0, 0),
(423, 115, 'Bling_My_Thing_ip6-l-pri-wt-non_Apple_iPhone_6_Plus_White_1.jpeg', 0, 0, 0),
(424, 115, 'Bling_My_Thing_ip6-l-pri-wt-non_Apple_iPhone_6_Plus_White_2.jpeg', 0, 1, 0),
(425, 115, 'Bling_My_Thing_ip6-l-pri-wt-non_Apple_iPhone_6_Plus_White_3.jpeg', 0, 0, 0),
(426, 115, 'Bling_My_Thing_ip6-l-pri-wt-non_Apple_iPhone_6_Plus_White_4.jpeg', 0, 0, 0),
(427, 115, 'Bling_My_Thing_Ayano_Primo_Apple_iPhone_6_Plus_White_5.jpeg', 0, 0, 0),
(428, 116, 'Bling_My_Thing_ip6-l-ex-cl-ice_Apple_iPhone_6_Plus_Transparent_1.jpeg', 0, 0, 0),
(429, 116, 'Bling_My_Thing_ip6-l-ex-cl-ice_Apple_iPhone_6_Plus_Transparent_2.jpeg', 0, 1, 0),
(430, 116, 'Bling_My_Thing_ip6-l-ex-cl-ice_Apple_iPhone_6_Plus_Transparent_3.jpeg', 0, 0, 0),
(431, 116, 'Bling_My_Thing_ip6-l-ex-cl-ice_Apple_iPhone_6_Plus_Transparent_4.jpeg', 0, 0, 0),
(432, 116, 'Bling_My_Thing_Expression_Apple_iPhone_6_Plus_Transparent_5.jpeg', 0, 0, 0),
(433, 117, 'Bling_My_Thing_ip6-l-ms-cl-non_Apple_iPhone_6_Plus_Transparent_1.jpeg', 0, 0, 0),
(434, 117, 'Bling_My_Thing_ip6-l-ms-cl-non_Apple_iPhone_6_Plus_Transparent_2.jpeg', 0, 1, 0),
(435, 117, 'Bling_My_Thing_ip6-l-ms-cl-non_Apple_iPhone_6_Plus_Transparent_3.jpeg', 0, 0, 0),
(436, 117, 'Bling_My_Thing_ip6-l-ms-cl-non_Apple_iPhone_6_Plus_Transparent_4.jpeg', 0, 0, 0),
(437, 118, 'Bling_My_Thing_ip6-l-mtk-cl-non_Apple_iPhone_6_Plus_Transparent_1.jpeg', 0, 0, 0),
(438, 118, 'Bling_My_Thing_ip6-l-mtk-cl-non_Apple_iPhone_6_Plus_Transparent_2.jpeg', 0, 1, 0),
(439, 118, 'Bling_My_Thing_ip6-l-mtk-cl-non_Apple_iPhone_6_Plus_Transparent_3.jpeg', 0, 0, 0),
(440, 119, 'Bling_My_Thing_ip6-l-mtk-gy-non_Apple_iPhone_6_Plus_Tinted_Grey_1.jpeg', 0, 0, 0),
(441, 119, 'Bling_My_Thing_ip6-l-mtk-gy-non_Apple_iPhone_6_Plus_Tinted_Grey_2.jpeg', 0, 1, 0),
(442, 119, 'Bling_My_Thing_ip6-l-mtk-gy-non_Apple_iPhone_6_Plus_Tinted_Grey_3.jpeg', 0, 0, 0),
(443, 120, 'Bling_My_Thing_ip6-l-mtk-pk-non_Apple_iPhone_6_Plus_Tinted_Pink_1.jpeg', 0, 0, 0),
(444, 120, 'Bling_My_Thing_ip6-l-mtk-pk-non_Apple_iPhone_6_Plus_Tinted_Pink_2.jpeg', 0, 1, 0),
(445, 120, 'Bling_My_Thing_ip6-l-mtk-pk-non_Apple_iPhone_6_Plus_Tinted_Pink_3.jpeg', 0, 0, 0),
(446, 121, 'BMW_BMFLBKP6LMCC_Apple_iPhone_6S_Black_1.jpeg', 0, 0, 0),
(447, 121, 'BMW_BMFLBKP6LMCC_Apple_iPhone_6S_Black_2.jpeg', 0, 1, 0),
(448, 121, 'BMW_BMFLBKP6LMCC_Apple_iPhone_6S_Black_3.jpeg', 0, 0, 0),
(449, 121, 'BMW_BMFLBKP6LMCC_Apple_iPhone_6S_Black_4.jpeg', 0, 0, 0),
(450, 122, 'BMW_BMHCP6MBC_Apple_iPhone_6S_Black_1.jpeg', 0, 0, 0),
(451, 122, 'BMW_BMHCP6MBC_Apple_iPhone_6S_Black_2.jpeg', 0, 1, 0),
(452, 122, 'BMW_BMHCP6MBC_Apple_iPhone_6S_Black_3.jpeg', 0, 0, 0),
(453, 122, 'BMW_BMHCP6MBC_Apple_iPhone_6S_Black_4.jpeg', 0, 0, 0),
(454, 123, 'BMW_BMHCP6MBS_Apple_iPhone_6S_Silver_1.jpeg', 0, 0, 0),
(455, 123, 'BMW_BMHCP6MBS_Apple_iPhone_6S_Silver_2.jpeg', 0, 1, 0),
(456, 123, 'BMW_BMHCP6MBS_Apple_iPhone_6S_Silver_3.jpeg', 0, 0, 0),
(457, 123, 'BMW_BMHCP6MBS_Apple_iPhone_6S_Silver_4.jpeg', 0, 0, 0),
(458, 124, 'Mini_MNFLBKP6YMMBK_Apple_iPhone_6S_Black_1.jpeg', 0, 0, 0),
(459, 124, 'Mini_MNFLBKP6YMMBK_Apple_iPhone_6S_Black_2.jpeg', 0, 1, 0),
(460, 124, 'Mini_MNFLBKP6YMMBK_Apple_iPhone_6S_Black_3.jpeg', 0, 0, 0),
(461, 124, 'Mini_MNFLBKP6YMMBK_Apple_iPhone_6S_Black_4.jpeg', 0, 0, 0),
(462, 125, 'Mini_MNFLBKP6YMMEB_Apple_iPhone_6S_Blue_1.jpeg', 0, 0, 0),
(463, 125, 'Mini_MNFLBKP6YMMEB_Apple_iPhone_6S_Blue_2.jpeg', 0, 1, 0),
(464, 125, 'Mini_MNFLBKP6YMMEB_Apple_iPhone_6S_Blue_3.jpeg', 0, 0, 0),
(465, 125, 'Mini_MNFLBKP6YMMEB_Apple_iPhone_6S_Blue_4.jpeg', 0, 0, 0),
(466, 126, 'iLuv_Regatta_Apple_iPhone_6_Black_1.jpeg', 0, 0, 0),
(467, 126, 'iLuv_Regatta_Apple_iPhone_6_Black_2.jpeg', 0, 1, 0),
(468, 126, 'iLuv_Regatta_Apple_iPhone_6_Black_3.jpeg', 0, 0, 0),
(469, 127, 'iLuv_Regatta_Apple_iPhone_6_Blue_1.jpeg', 0, 0, 0),
(470, 127, 'iLuv_Regatta_Apple_iPhone_6_Blue_2.jpeg', 0, 1, 0),
(471, 127, 'iLuv_Regatta_Apple_iPhone_6_Blue_3.jpeg', 0, 0, 0),
(472, 128, 'iLuv_Regatta_Apple_iPhone_6_Pink_1.jpeg', 0, 0, 0),
(473, 128, 'iLuv_Regatta_Apple_iPhone_6_Pink_2.jpeg', 0, 1, 0),
(474, 128, 'iLuv_Regatta_Apple_iPhone_6_Pink_3.jpeg', 0, 0, 0),
(475, 129, 'iLuv_Regatta_Apple_iPhone_6_Teal_1.jpeg', 0, 0, 0),
(476, 129, 'iLuv_Regatta_Apple_iPhone_6_Teal_2.jpeg', 0, 1, 0),
(477, 129, 'iLuv_Regatta_Apple_iPhone_6_Teal_3.jpeg', 0, 0, 0),
(478, 130, 'iLuv_Regatta_Apple_iPhone_6_White_1.jpeg', 0, 0, 0),
(479, 130, 'iLuv_Regatta_Apple_iPhone_6_White_2.jpeg', 0, 1, 0),
(480, 130, 'iLuv_Regatta_Apple_iPhone_6_White_3.jpeg', 0, 0, 0),
(481, 131, 'iLuv_Regatta_Apple_iPhone_6_Yellow_1.jpeg', 0, 0, 0),
(482, 131, 'iLuv_Regatta_Apple_iPhone_6_Yellow_2.jpeg', 0, 1, 0),
(483, 131, 'iLuv_Regatta_Apple_iPhone_6_Yellow_3.jpeg', 0, 0, 0),
(484, 132, 'iLuv_Vyneer_Apple_iPhone_6_Black_1.jpeg', 0, 0, 0),
(485, 132, 'iLuv_Vyneer_Apple_iPhone_6_Black_2.jpeg', 0, 1, 0),
(486, 132, 'iLuv_Vyneer_Apple_iPhone_6_Black_3.jpeg', 0, 0, 0),
(487, 133, 'iLuv_Vyneer_Apple_iPhone_6_Blue_1.jpeg', 0, 0, 0),
(488, 133, 'iLuv_Vyneer_Apple_iPhone_6_Blue_2.jpeg', 0, 1, 0),
(489, 133, 'iLuv_Vyneer_Apple_iPhone_6_Blue_3.jpeg', 0, 0, 0),
(490, 134, 'iLuv_Vyneer_Apple_iPhone_6_Pink_1.jpeg', 0, 0, 0),
(491, 134, 'iLuv_Vyneer_Apple_iPhone_6_Pink_2.jpeg', 0, 1, 0),
(492, 134, 'iLuv_Vyneer_Apple_iPhone_6_Pink_3.jpeg', 0, 0, 0),
(493, 135, 'iLuv_Vyneer_Apple_iPhone_6_White_1.jpeg', 0, 0, 0),
(494, 135, 'iLuv_Vyneer_Apple_iPhone_6_White_2.jpeg', 0, 1, 0),
(495, 135, 'iLuv_Vyneer_Apple_iPhone_6_White_3.jpeg', 0, 0, 0),
(496, 136, 'iLuv_Gossamer_Apple_iPhone_6_Transparent_1.jpeg', 0, 0, 0),
(497, 136, 'iLuv_Gossamer_Apple_iPhone_6_Transparent_2.jpeg', 0, 1, 0),
(498, 136, 'iLuv_Gossamer_Apple_iPhone_6_Transparent_3.jpeg', 0, 0, 0),
(499, 137, 'iLuv_Regatta_Apple_iPhone_6_Plus_Black_1.jpeg', 0, 0, 0),
(500, 137, 'iLuv_Regatta_Apple_iPhone_6_Plus_Black_2.jpeg', 0, 1, 0),
(501, 137, 'iLuv_Regatta_Apple_iPhone_6_Plus_Black_3.jpeg', 0, 0, 0),
(502, 138, 'iLuv_Lay_Up_Apple_iPhone_6_Plus_Black_1.jpeg', 0, 0, 0),
(503, 138, 'iLuv_Lay_Up_Apple_iPhone_6_Plus_Black_2.jpeg', 0, 1, 0),
(504, 138, 'iLuv_Lay_Up_Apple_iPhone_6_Plus_Black_3.jpeg', 0, 0, 0),
(505, 138, 'iLuv_Lay_Up_Apple_iPhone_6_Plus_Black_4.jpeg', 0, 0, 0),
(506, 139, 'iLuv_Vyneer_Apple_iPhone_6_Plus_Black_1.jpeg', 0, 0, 0),
(507, 139, 'iLuv_Vyneer_Apple_iPhone_6_Plus_Black_2.jpeg', 0, 1, 0),
(508, 139, 'iLuv_Vyneer_Apple_iPhone_6_Plus_Black_3.jpeg', 0, 0, 0),
(509, 139, 'iLuv_Vyneer_Apple_iPhone_6_Plus_Black_4.jpeg', 0, 0, 0),
(510, 140, 'iLuv_Vyneer_Apple_iPhone_6_Plus_White_1.jpeg', 0, 0, 0),
(511, 140, 'iLuv_Vyneer_Apple_iPhone_6_Plus_White_2.jpeg', 0, 1, 0),
(512, 140, 'iLuv_Vyneer_Apple_iPhone_6_Plus_White_3.jpeg', 0, 0, 0),
(513, 140, 'iLuv_Vyneer_Apple_iPhone_6_Plus_White_4.jpeg', 0, 0, 0),
(514, 141, 'iLuv_Gelato_Apple_iPhone_6_Plus_Black_1.jpeg', 0, 0, 0),
(515, 141, 'iLuv_Gelato_Apple_iPhone_6_Plus_Black_2.jpeg', 0, 1, 0),
(516, 141, 'iLuv_Gelato_Apple_iPhone_6_Plus_Black_3.jpeg', 0, 0, 0),
(517, 142, 'iLuv_Gelato_Apple_iPhone_6_Plus_White_1.jpeg', 0, 0, 0),
(518, 142, 'iLuv_Gelato_Apple_iPhone_6_Plus_White_2.jpeg', 0, 1, 0),
(519, 142, 'iLuv_Gelato_Apple_iPhone_6_Plus_White_3.jpeg', 0, 0, 0),
(520, 143, 'iLuv_Gossamer_Apple_iPhone_6_Plus_Transparent_1.jpeg', 0, 0, 0),
(521, 143, 'iLuv_Gossamer_Apple_iPhone_6_Plus_Transparent_2.jpeg', 0, 1, 0),
(522, 143, 'iLuv_Gossamer_Apple_iPhone_6_Plus_Transparent_3.jpeg', 0, 0, 0),
(523, 144, 'Incipio_Feather_Apple_iPhone_6_Light_Blue_1.jpeg', 0, 0, 0),
(524, 145, 'Incipio_Feather_Shine_Apple_iPhone_6_Black_1.jpeg', 0, 0, 0),
(525, 145, 'Incipio_Feather_Shine_Apple_iPhone_6_Black_2.jpeg', 0, 1, 0),
(526, 145, 'Incipio_Feather_Shine_Apple_iPhone_6_Black_3.jpeg', 0, 0, 0),
(527, 145, 'Incipio_Feather_Shine_Apple_iPhone_6_Black_4.jpeg', 0, 0, 0),
(528, 146, 'Incipio_Feather_Shine_Apple_iPhone_6_Gold_1.jpeg', 0, 0, 0),
(529, 146, 'Incipio_Feather_Shine_Apple_iPhone_6_Gold_2.jpeg', 0, 1, 0),
(530, 146, 'Incipio_Feather_Shine_Apple_iPhone_6_Gold_3.jpeg', 0, 0, 0),
(531, 146, 'Incipio_Feather_Shine_Apple_iPhone_6_Gold_4.jpeg', 0, 0, 0),
(532, 147, 'Incipio_Feather_Shine_Apple_iPhone_6_Silver_1.jpeg', 0, 0, 0),
(533, 147, 'Incipio_Feather_Shine_Apple_iPhone_6_Silver_2.jpeg', 0, 1, 0),
(534, 147, 'Incipio_Feather_Shine_Apple_iPhone_6_Silver_3.jpeg', 0, 0, 0),
(535, 147, 'Incipio_Feather_Shine_Apple_iPhone_6_Silver_4.jpeg', 0, 0, 0),
(536, 148, 'Incipio_Highland_Apple_iPhone_6_White/Grey_1.jpeg', 0, 0, 0),
(537, 148, 'Incipio_Highland_Apple_iPhone_6_White/Grey_2.jpeg', 0, 1, 0),
(538, 148, 'Incipio_Highland_Apple_iPhone_6_White/Grey_3.jpeg', 0, 0, 0),
(539, 148, 'Incipio_Highland_Apple_iPhone_6_White/Grey_4.jpeg', 0, 0, 0),
(540, 149, 'Incipio_Octane_Apple_iPhone_6_Neon_Green_1.jpeg', 0, 0, 0),
(541, 150, 'Incipio_Octane_Apple_iPhone_6_Neon_Orange_1.jpeg', 0, 0, 0),
(542, 151, 'Incipio_Feather_Apple_iPhone_6_Plus_Black_1.jpeg', 0, 0, 0),
(543, 151, 'Incipio_Feather_Apple_iPhone_6_Plus_Black_2.jpeg', 0, 1, 0),
(544, 151, 'Incipio_Feather_Apple_iPhone_6_Plus_Black_3.jpeg', 0, 0, 0),
(545, 151, 'Incipio_Feather_Apple_iPhone_6_Plus_Black_4.jpeg', 0, 0, 0),
(546, 152, 'Incipio_Feather_Apple_iPhone_6_Plus_Light_Blue_1.jpeg', 0, 0, 0),
(547, 153, 'Incipio_Feather_Apple_iPhone_6_Plus_Transparent_1.jpeg', 0, 0, 0),
(548, 154, 'Incipio_Feather_Apple_iPhone_6_Plus_Pink_1.jpeg', 0, 0, 0),
(549, 154, 'Incipio_Feather_Apple_iPhone_6_Plus_Pink_2.jpeg', 0, 1, 0),
(550, 154, 'Incipio_Feather_Apple_iPhone_6_Plus_Pink_3.jpeg', 0, 0, 0),
(551, 154, 'Incipio_Feather_Apple_iPhone_6_Plus_Pink_4.jpeg', 0, 0, 0),
(552, 155, 'Incipio_Feather_Shine_Apple_iPhone_6_Plus_Black_1.jpeg', 0, 0, 0),
(553, 156, 'Incipio_Feather_Shine_Apple_iPhone_6_Plus_Silver_1.jpeg', 0, 0, 0),
(554, 157, 'Incipio_Feather_Shine_Apple_iPhone_6_Plus_Gold_1.jpeg', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `productimagecroncheck`
--

CREATE TABLE IF NOT EXISTS `productimagecroncheck` (
  `id` int(11) NOT NULL,
  `product` int(11) NOT NULL,
  `message` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `productlog`
--

CREATE TABLE IF NOT EXISTS `productlog` (
  `id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `product` int(11) NOT NULL,
  `action` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `productlog`
--

INSERT INTO `productlog` (`id`, `user`, `product`, `action`, `timestamp`) VALUES
(0, 1, 128, 'Product Details Edited', '2015-11-27 14:32:32'),
(0, 1, 128, 'Product Details Edited', '2015-11-27 14:36:54');

-- --------------------------------------------------------

--
-- Table structure for table `productrating`
--

CREATE TABLE IF NOT EXISTS `productrating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `productreturn`
--

CREATE TABLE IF NOT EXISTS `productreturn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order` int(11) NOT NULL,
  `orderitem` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `comment` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `producttype`
--

CREATE TABLE IF NOT EXISTS `producttype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=304 ;

--
-- Dumping data for table `producttype`
--

INSERT INTO `producttype` (`id`, `product`, `type`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 1),
(4, 2, 2),
(5, 3, 1),
(6, 3, 2),
(7, 4, 1),
(8, 4, 2),
(9, 5, 1),
(10, 5, 2),
(11, 6, 1),
(12, 6, 2),
(13, 7, 1),
(14, 7, 2),
(15, 8, 1),
(16, 8, 2),
(17, 9, 1),
(18, 9, 2),
(19, 10, 1),
(20, 10, 2),
(21, 11, 1),
(22, 11, 3),
(23, 12, 1),
(24, 12, 3),
(25, 13, 1),
(26, 13, 3),
(27, 14, 1),
(28, 14, 3),
(29, 15, 1),
(30, 15, 3),
(31, 16, 1),
(32, 16, 3),
(33, 17, 1),
(34, 17, 3),
(35, 18, 1),
(36, 18, 3),
(37, 19, 1),
(38, 19, 3),
(39, 20, 1),
(40, 20, 3),
(41, 21, 1),
(42, 21, 4),
(43, 22, 1),
(44, 22, 4),
(45, 23, 1),
(46, 23, 4),
(47, 24, 1),
(48, 24, 4),
(49, 25, 1),
(50, 25, 4),
(51, 26, 1),
(52, 26, 4),
(53, 27, 1),
(54, 27, 4),
(55, 28, 1),
(56, 28, 4),
(57, 29, 1),
(58, 29, 4),
(59, 30, 1),
(60, 30, 4),
(61, 31, 1),
(62, 31, 4),
(63, 32, 1),
(64, 32, 4),
(65, 33, 1),
(66, 33, 4),
(67, 34, 1),
(68, 34, 4),
(69, 35, 1),
(70, 35, 2),
(71, 36, 1),
(72, 36, 2),
(73, 37, 1),
(74, 37, 2),
(75, 38, 1),
(76, 38, 2),
(77, 39, 1),
(78, 39, 2),
(79, 40, 1),
(80, 40, 2),
(81, 41, 1),
(82, 41, 2),
(83, 42, 1),
(84, 42, 2),
(85, 43, 1),
(86, 43, 2),
(87, 44, 1),
(88, 44, 2),
(89, 45, 1),
(90, 45, 4),
(91, 46, 1),
(92, 46, 4),
(93, 47, 1),
(94, 47, 4),
(95, 48, 1),
(96, 48, 4),
(97, 49, 1),
(98, 49, 4),
(99, 50, 1),
(100, 50, 4),
(101, 51, 1),
(102, 51, 4),
(103, 52, 1),
(104, 52, 4),
(105, 53, 1),
(106, 53, 4),
(107, 54, 1),
(108, 54, 4),
(109, 55, 1),
(110, 55, 4),
(111, 56, 1),
(112, 56, 4),
(113, 57, 1),
(114, 57, 4),
(115, 58, 1),
(116, 58, 4),
(117, 59, 1),
(118, 59, 4),
(119, 60, 1),
(120, 60, 4),
(121, 61, 1),
(122, 61, 4),
(123, 62, 1),
(124, 62, 4),
(125, 63, 1),
(126, 63, 4),
(127, 64, 1),
(128, 64, 4),
(129, 65, 1),
(130, 65, 4),
(131, 66, 1),
(132, 66, 4),
(133, 67, 1),
(134, 67, 4),
(135, 68, 1),
(136, 68, 4),
(137, 69, 1),
(138, 69, 4),
(139, 70, 1),
(140, 70, 4),
(141, 71, 1),
(142, 71, 4),
(143, 72, 1),
(144, 72, 4),
(145, 73, 1),
(146, 73, 4),
(147, 74, 1),
(148, 74, 4),
(149, 75, 1),
(150, 75, 4),
(151, 76, 1),
(152, 76, 4),
(153, 77, 1),
(154, 77, 4),
(155, 78, 1),
(156, 78, 4),
(157, 79, 1),
(158, 79, 4),
(159, 80, 5),
(160, 81, 5),
(161, 82, 1),
(162, 82, 2),
(163, 83, 1),
(164, 83, 2),
(165, 84, 1),
(166, 84, 2),
(167, 85, 1),
(168, 85, 2),
(169, 86, 1),
(170, 86, 2),
(171, 87, 1),
(172, 87, 2),
(173, 88, 6),
(174, 89, 6),
(175, 90, 6),
(176, 91, 1),
(177, 91, 2),
(178, 92, 1),
(179, 92, 2),
(180, 93, 1),
(181, 93, 2),
(182, 94, 1),
(183, 94, 2),
(184, 95, 1),
(185, 95, 2),
(186, 96, 1),
(187, 96, 2),
(188, 97, 1),
(189, 97, 2),
(190, 98, 1),
(191, 98, 2),
(192, 99, 1),
(193, 99, 2),
(194, 100, 1),
(195, 100, 3),
(196, 101, 1),
(197, 101, 2),
(198, 102, 1),
(199, 102, 2),
(200, 103, 1),
(201, 103, 2),
(202, 104, 1),
(203, 104, 2),
(204, 105, 1),
(205, 105, 2),
(206, 106, 1),
(207, 106, 2),
(208, 107, 1),
(209, 107, 2),
(210, 108, 1),
(211, 108, 2),
(212, 109, 1),
(213, 109, 2),
(214, 110, 1),
(215, 110, 2),
(216, 111, 1),
(217, 111, 2),
(218, 112, 5),
(219, 113, 5),
(220, 114, 5),
(221, 115, 5),
(222, 116, 1),
(223, 116, 3),
(224, 117, 1),
(225, 117, 2),
(226, 118, 1),
(227, 118, 2),
(228, 119, 1),
(229, 119, 2),
(230, 120, 1),
(231, 120, 2),
(232, 121, 5),
(233, 122, 1),
(234, 123, 1),
(235, 124, 5),
(236, 125, 5),
(237, 126, 1),
(238, 126, 4),
(239, 127, 1),
(240, 127, 4),
(243, 129, 1),
(244, 129, 4),
(245, 130, 1),
(246, 130, 4),
(247, 131, 1),
(248, 131, 4),
(249, 132, 1),
(250, 132, 2),
(251, 133, 1),
(252, 133, 2),
(253, 134, 1),
(254, 134, 2),
(255, 135, 1),
(256, 135, 2),
(257, 136, 1),
(258, 136, 2),
(259, 137, 1),
(260, 137, 4),
(261, 138, 1),
(262, 138, 4),
(263, 139, 1),
(264, 139, 2),
(265, 140, 1),
(266, 140, 2),
(267, 141, 1),
(268, 141, 3),
(269, 142, 1),
(270, 142, 3),
(271, 143, 1),
(272, 143, 2),
(273, 144, 1),
(274, 144, 2),
(275, 145, 1),
(276, 145, 2),
(277, 146, 1),
(278, 146, 2),
(279, 147, 1),
(280, 147, 2),
(281, 148, 5),
(282, 149, 1),
(283, 149, 4),
(284, 150, 1),
(285, 150, 4),
(286, 151, 1),
(287, 151, 2),
(288, 152, 1),
(289, 152, 2),
(290, 153, 1),
(291, 153, 2),
(292, 154, 1),
(293, 154, 2),
(294, 155, 1),
(295, 155, 2),
(296, 156, 1),
(297, 156, 2),
(298, 157, 1),
(299, 157, 2),
(302, 128, 1),
(303, 128, 4);

-- --------------------------------------------------------

--
-- Table structure for table `productwaiting`
--

CREATE TABLE IF NOT EXISTS `productwaiting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `productwaiting`
--

INSERT INTO `productwaiting` (`id`, `product`, `user`, `email`, `timestamp`) VALUES
(1, 5, 10, '', '2015-11-28 13:18:45'),
(2, 29, 10, '', '2015-11-28 13:19:13'),
(3, 91, 10, '', '2015-11-28 13:19:43'),
(4, 110, 10, '', '2015-11-28 13:20:18');

-- --------------------------------------------------------

--
-- Table structure for table `relatedproduct`
--

CREATE TABLE IF NOT EXISTS `relatedproduct` (
  `product` int(11) NOT NULL,
  `relatedproduct` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

CREATE TABLE IF NOT EXISTS `slider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `product` varchar(255) NOT NULL,
  `target` varchar(255) NOT NULL,
  `order` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `fromdate` date NOT NULL,
  `todate` date NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `subscribe`
--

CREATE TABLE IF NOT EXISTS `subscribe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `subscribe`
--

INSERT INTO `subscribe` (`id`, `email`, `timestamp`) VALUES
(11, 'poojathakare55@gmail.com', '2015-09-18 10:48:15'),
(20, 'jaghxrgrjr@fj.dff', '2015-09-22 05:57:10'),
(21, 'pooja.wohlig@gmail.com', '2015-09-23 06:37:34'),
(22, 'jagruti@wohlig.com', '2015-09-23 06:38:30'),
(23, 'dfasdfasd@sdfasdf', '2015-09-23 06:38:46'),
(24, 'chirag@wohlig.com', '2015-11-28 11:24:06');

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE IF NOT EXISTS `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`id`, `name`, `timestamp`) VALUES
(1, 'Back Case', '2015-11-26 15:25:49'),
(2, 'Hard Case', '2015-11-26 15:25:49'),
(3, 'Soft Case', '2015-11-26 15:25:49'),
(4, 'Tough Case', '2015-11-26 15:25:49'),
(5, 'Flip Case', '2015-11-27 14:23:30'),
(6, 'Flip Cover', '2015-11-27 14:23:30');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `accesslevel` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `billingaddress` varchar(255) DEFAULT NULL,
  `billingcity` varchar(255) DEFAULT NULL,
  `billingstate` varchar(255) DEFAULT NULL,
  `billingcountry` varchar(255) DEFAULT NULL,
  `shippingaddress` varchar(255) DEFAULT NULL,
  `shippingcity` varchar(255) DEFAULT NULL,
  `shippingcountry` varchar(255) DEFAULT NULL,
  `shippingstate` varchar(255) DEFAULT NULL,
  `shippingpincode` varchar(255) DEFAULT NULL,
  `currency` int(11) DEFAULT NULL,
  `credits` double DEFAULT NULL,
  `companyname` varchar(255) DEFAULT NULL,
  `companyregistrationno` varchar(255) DEFAULT NULL,
  `vatnumber` bigint(20) DEFAULT NULL,
  `country` int(11) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `socialid` varchar(255) NOT NULL,
  `logintype` varchar(255) NOT NULL,
  `json` text NOT NULL,
  `dob` date NOT NULL,
  `street` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `pincode` varchar(255) NOT NULL,
  `facebook` varchar(255) NOT NULL,
  `google` varchar(255) NOT NULL,
  `twitter` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `username` varchar(255) NOT NULL,
  `gender` int(11) NOT NULL,
  `billingpincode` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=43 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `firstname`, `lastname`, `email`, `phone`, `password`, `accesslevel`, `status`, `billingaddress`, `billingcity`, `billingstate`, `billingcountry`, `shippingaddress`, `shippingcity`, `shippingcountry`, `shippingstate`, `shippingpincode`, `currency`, `credits`, `companyname`, `companyregistrationno`, `vatnumber`, `country`, `fax`, `image`, `socialid`, `logintype`, `json`, `dob`, `street`, `address`, `city`, `state`, `pincode`, `facebook`, `google`, `twitter`, `timestamp`, `username`, `gender`, `billingpincode`) VALUES
(1, 'Aditi', 'Aditi', 'Patil', 'wohlig@wohlig.com', '9898989', 'a63526467438df9566c508027d9cb06b', 1, 1, 'sec-4 airoli', 'NaviMumbai', 'MAharashtra', 'India', 'dombivili', 'kalyan', 'Australia', 'maharashtra', '400125', 1, 0, 'waW', '123', 0, 0, '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '2015-09-23 12:51:48', '', 0, '400708'),
(10, NULL, 'dfghjk', 'rtgyhujk', 'shdj@ysgdh.sdgs', NULL, 'a63526467438df9566c508027d9cb06b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '2015-09-09 07:14:04', '', 0, ''),
(11, NULL, 'dfgh', 'jdfghj', 'ghd@sdyh.sd', NULL, 'a63526467438df9566c508027d9cb06b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '2015-09-09 07:15:06', '', 0, ''),
(12, NULL, 'try', 'trail', 'abc@email.com', NULL, '440ac85892ca43ad26d44c7ad9d47d3e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '2015-09-09 07:22:55', '', 0, ''),
(13, NULL, 'hii', 'hii', 'hii@sdyh.csdc', NULL, 'a63526467438df9566c508027d9cb06b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '2015-09-09 07:23:55', '', 0, ''),
(19, NULL, 'tom', 'jerry', 'bobthebuilder@pogo.com', NULL, '30d901e9aea791e635c984a6291b70d5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '2015-09-11 07:12:39', '', 0, ''),
(20, 'Avinash Ghare', '', '', 'avinash@wohlig.com', NULL, '', 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 'https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/photo.jpg', '118313183524893739637', 'Google', '', '0000-00-00', '', ',', '', '', '', '', '118313183524893739637', '', '2015-09-11 07:14:12', '', 0, ''),
(21, NULL, 'wesrt', 'qwretrt', 'dsa@jdfha.djf', NULL, '440ac85892ca43ad26d44c7ad9d47d3e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '2015-09-11 07:17:02', '', 0, ''),
(22, NULL, 'amit', 'verma', 'amitwohig@gmail.com', NULL, 'a63526467438df9566c508027d9cb06b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '2015-09-15 05:33:33', '', 0, ''),
(26, 'Pooja Thakare', '', '', 'pooja.wohlig@gmail.com', NULL, '', 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 'https://lh5.googleusercontent.com/-5B1PwZZrwdI/AAAAAAAAAAI/AAAAAAAAABw/J3Hf871N8IE/photo.jpg', '103402210128529539675', 'Google', '', '0000-00-00', '', ',', '', '', '', '', '103402210128529539675', '', '2015-09-15 10:34:44', '', 0, ''),
(30, NULL, '', '', '', NULL, 'd41d8cd98f00b204e9800998ecf8427e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '2015-11-02 07:17:42', '', 0, ''),
(33, NULL, 'vignesh', 'kasturi', 'dhaval@gmail.com', NULL, '49b01b584d0ee82813b940ddad08d231', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '2015-11-02 07:35:05', '', 0, ''),
(34, NULL, 'abcd', 'abcd', 'abcd@gmail.com', NULL, 'e2fc714c4727ee9395f324cd2e7f331f', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '2015-11-02 07:39:38', '', 0, ''),
(36, NULL, 'Darshil', 'Shah', 'darshil_210@yahoo.com', NULL, 'a69e9e5409614d0056e41f541cf2b348', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '2015-11-02 07:41:56', '', 0, ''),
(37, NULL, 'Vignesh', 'Kasturi', 'vigwohlig@gmail.com', NULL, '49b01b584d0ee82813b940ddad08d231', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '2015-11-03 06:48:22', '', 0, ''),
(38, 'Pooja Thakare', '', '', '', NULL, '', 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 'https://graph.facebook.com/451648931673334/picture?width=150&height=150', '451648931673334', 'Facebook', '', '0000-00-00', '', ',', '', '', '', '451648931673334', '', '', '2015-11-07 06:46:22', '', 0, ''),
(39, 'Sohan H', '', '', 'sohanh90@gmail.com', NULL, '', 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 'https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/photo.jpg', '103430988312500367101', 'Google', '', '0000-00-00', '', ',', '', '', '', '', '103430988312500367101', '', '2015-11-17 12:26:38', '', 0, ''),
(40, 'Sohan Honakeri', '', '', '', NULL, '', 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 'https://graph.facebook.com/983552028367560/picture?width=150&height=150', '983552028367560', 'Facebook', '', '0000-00-00', '', ',', '', '', '', '983552028367560', '', '', '2015-11-17 12:31:26', '', 0, ''),
(41, 'Dhaval Gala', 'pooja', 'thakare', 'pooja@wohlig.com', '88979887998', '', 3, 1, 'airoli', 'navimumbai', 'maharashtra', 'India', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 'https://lh6.googleusercontent.com/-XeGx92qk6q4/AAAAAAAAAAI/AAAAAAAAAAw/XhrdRsAwdlA/photo.jpg', '109691319281292568606', 'Google', '', '0000-00-00', '', ',', '', '', '', '', '109691319281292568606', '', '2015-11-25 09:02:17', '', 0, '400708'),
(42, 'Darshil Shah', '', '', '', NULL, '', 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 'https://graph.facebook.com/10205547092222259/picture?width=150&height=150', '10205547092222259', 'Facebook', '', '0000-00-00', '', ',', '', '', '', '10205547092222259', '', '', '2015-11-26 15:46:14', '', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `usercart`
--

CREATE TABLE IF NOT EXISTS `usercart` (
  `user` int(11) NOT NULL,
  `product` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usercart`
--

INSERT INTO `usercart` (`user`, `product`, `quantity`, `status`, `timestamp`) VALUES
(1, 27, 1, 1, '2015-11-16 14:59:01'),
(1, 6, 1, 1, '2015-11-17 13:23:18'),
(1, 122, 1, 1, '2015-11-17 13:31:06'),
(41, 130, 1, 1, '2015-11-25 10:22:58'),
(1, 2, 1, 1, '2015-11-26 15:41:34'),
(1, 128, 1, 1, '2015-11-28 08:16:36'),
(1, 88, 1, 1, '2015-11-28 08:19:38');

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE IF NOT EXISTS `userlog` (
  `id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `action` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fromuser` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `user`, `action`, `timestamp`, `fromuser`) VALUES
(0, 27, 'User Created', '2015-09-23 11:29:37', 1),
(1, 49, 'User Details Edited', '2015-05-06 07:39:13', 1),
(2, 36, 'User Details Edited', '2015-06-01 12:38:10', 1),
(3, 1, 'User Details Edited', '2015-08-18 07:56:24', 1);

-- --------------------------------------------------------

--
-- Table structure for table `userwishlist`
--

CREATE TABLE IF NOT EXISTS `userwishlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `product` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `userwishlist`
--

INSERT INTO `userwishlist` (`id`, `user`, `timestamp`, `product`) VALUES
(1, 1, '2015-09-15 07:06:00', 3),
(2, 2, '2015-09-15 08:03:02', 4),
(3, 3, '2015-09-23 08:53:39', 4),
(4, 1, '2015-11-06 12:36:42', 2),
(5, 43, '2015-11-27 14:52:39', 121);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
