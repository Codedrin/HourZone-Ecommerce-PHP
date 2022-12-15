-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 23, 2019 at 07:53 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerece`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getcat` (IN `cid` INT)  SELECT * FROM categories WHERE cat_id=cid$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin_info`
--

CREATE TABLE `admin_info` (
  `admin_id` int(10) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_email` varchar(300) NOT NULL,
  `admin_password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_info`
--

INSERT INTO `admin_info` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 'admin', 'admin@gmail.com', '25f9e794323b453885f5181f1b624d0b');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'G-SHOCK'),
(2, 'ROLEX'),
(3, 'ACURIST'),
(4, 'ADIDAS'),
(5, 'ADRIATICA'),
(6, 'APLLE');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `p_id`, `ip_add`, `user_id`, `qty`) VALUES
(6, 26, '::1', 4, 1),
(9, 10, '::1', 7, 1),
(10, 11, '::1', 7, 1),
(11, 45, '::1', 7, 1),
(44, 5, '::1', 3, 0),
(46, 2, '::1', 3, 0),
(48, 72, '::1', 3, 0),
(49, 60, '::1', 8, 1),
(50, 61, '::1', 8, 1),
(51, 1, '::1', 8, 1),
(52, 5, '::1', 9, 1),
(53, 2, '::1', 14, 1),
(54, 3, '::1', 14, 1),
(55, 5, '::1', 14, 1),
(56, 1, '::1', 9, 1),
(57, 2, '::1', 9, 1),
(71, 61, '127.0.0.1', -1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'Men'),
(2, 'Womens'),
(3, 'Kids'),
(4, 'Casual'),
(5, 'Formal'),
(6, 'Party'),
(7, 'Apple');

-- --------------------------------------------------------

--
-- Table structure for table `email_info`
--

CREATE TABLE `email_info` (
  `email_id` int(100) NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `email_info`
--

INSERT INTO `email_info` (`email_id`, `email`) VALUES
(3, 'admin@gmail.com'),
(4, 'puneethreddy951@gmail.com'),
(5, 'puneethreddy@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `p_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `product_id`, `qty`, `trx_id`, `p_status`) VALUES
(1, 12, 7, 1, '07M47684BS5725041', 'Completed'),
(2, 14, 2, 1, '07M47684BS5725041', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `orders_info`
--

CREATE TABLE `orders_info` (
  `order_id` int(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `f_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` int(10) NOT NULL,
  `cardname` varchar(255) NOT NULL,
  `cardnumber` varchar(20) NOT NULL,
  `expdate` varchar(255) NOT NULL,
  `prod_count` int(15) DEFAULT NULL,
  `total_amt` int(15) DEFAULT NULL,
  `cvv` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders_info`
--

INSERT INTO `orders_info` (`order_id`, `user_id`, `f_name`, `email`, `address`, `city`, `state`, `zip`, `cardname`, `cardnumber`, `expdate`, `prod_count`, `total_amt`, `cvv`) VALUES
(1, 12, 'Puneeth', 'puneethreddy951@gmail.com', 'Bangalore, Kumbalagodu, Karnataka', 'Bangalore', 'Karnataka', 560074, 'pokjhgfcxc', '4321 2345 6788 7654', '12/90', 3, 77000, 1234);

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `order_pro_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(15) DEFAULT NULL,
  `amt` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_products`
--

INSERT INTO `order_products` (`order_pro_id`, `order_id`, `product_id`, `qty`, `amt`) VALUES
(73, 1, 1, 1, 5000),
(74, 1, 4, 2, 64000),
(75, 1, 8, 1, 40000);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_cat` int(100) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_desc`, `product_image`, `product_keywords`) VALUES
(1, 1, 2, 'Rolex Submariner', 600, 'Rolex Submariner', 'product07.png.jpg', 'Rolex Submariner'),
(2, 1, 3, 'Rolex Explorer', 650, 'Rolex Explorer', 'http___pluspng.com_img-png_iphone-hd-png-iphone-apple-png-file-550.jpg', 'Rolex Explorer'),
(3, 1, 3, 'Rolex Datejust', 700, 'Rolex Datejust', 'da4371ffa192a115f922b1c0dff88193.jpg', 'Rolex Datejust'),
(4, 1, 3, 'Rolex Yacht-Master', 500, 'Rolex Yacht-Master ', 'http___pluspng.com_img-png_iphone-6s-png-iphone-6s-gold-64gb-1000.jpg', 'Rolex Yacht-Master'),
(5, 1, 2, 'G-Shock GM-150Earth', 550, 'G-Shock GM-150Earth', 'iPad-air.jpg', 'G-Shock GM-150Earth'),
(6, 1, 1, 'G-SHock QA-110Y', 850, 'G-SHock QA-110Y', 'laptop_PNG5939.jpg', 'G-SHock QA-110Y '),
(7, 1, 1, 'M1-C Metal Twisted G-Shock', 900, 'M1-C Metal Twisted G-Shock', 'laptop_PNG5930.jpg', 'M1-C Metal Twisted G-Shock'),
(8, 1, 4, 'Project 2-R-watch Adidas', 400, 'Project 2-R-watch Adidas', '530201353846AM_635_sony_xperia_z.jpg', 'Project 2-R-watch Adidas'),
(9, 1, 3, 'Retro-Pop One Watch', 900, 'Retro-Pop One Watch', 'iphone-hd-png-iphone-apple-png-file-550.jpg', 'Retro-Pop One Watch'),
(10, 2, 6, 'Limited Edition Two-Chrono Icon Watch', 800, 'Limited Edition Two-Chrono Icon Watch', 'ad1.jpg', 'Limited Edition Two-Chrono Icon Watch '),
(11, 2, 6, 'Edition Three Small Watch', 900, 'Edition Three Small Watch', 'image 2.jpg', 'Edition Three Small Watch'),
(12, 2, 6, 'Laydies Project Limited Edition Adidas', 500, 'Laydies Project Limited Edition Adidas', 'cs2.jpg', 'Laydies Project Limited Edition Adidas'),
(13, 2, 6, 'G-SHock GMA-S2200-4A', 680, 'G-SHock GMA-S2200-4A', 'cs3.jpg', 'G-SHock GMA-S2200-4A'),
(14, 2, 6, 'G-Shock GM-5600PG-1', 400, 'G-SHock GMA-S2200-4A', 'cs4.jpg', 'G-SHock GMA-S2200-4A'),
(15, 2, 6, 'G-Shock DW-55600C-4', 500, 'G-Shock DW-55600C-4', 'cs5.jpg', 'G-Shock DW-55600C-4'),
(16, 3, 6, 'Acurist Watch Women Limeted Edition A-Series', 600, 'Acurist Watch Women Limeted Edition A-Series', 'img6.jpg', 'Acurist Watch Women Limeted Edition A-Series'),
(17, 3, 6, 'G-Shock Kiddy', 700, 'G-Shock Kiddy', 'gs1.jpg', 'G-Shock Kiddy'),
(19, 3, 6, 'G-Shock Project 3', 300, 'G-Shock Project 3', 'image 4.jpg', 'G-Shock Project 3'),
(20, 3, 6, 'GA-11DY-BA G-Shock', 600, 'GA-11DY-BA G-Shock', 'ad5.jpg', 'GA-11DY-BA G-Shock '),
(21, 3, 6, 'Baby-GW G-Shock', 800, 'Baby-GW G-Shock', 'image 6.jpg', 'Baby-GW G-Shock'),
(22, 4, 6, 'Adriatica Series1 ', 300, 'Adriatica Series1', 'cas1.jpg', 'Adriatica Series1'),
(23, 4, 6, 'Adriatica Series2', 900, 'Adriatica Series2', 'cas2.jpg', 'Adriatica Series2'),
(24, 4, 6, 'Adriatica Series3', 700, 'Adriatica Series3', 'cas3.jpg', 'Adriatica Series3'),
(25, 4, 6, 'Adriatica Series4', 750, 'Adriatica Series4', 'cas4.jpg', 'Adriatica Series4'),
(27, 4, 6, 'Adriatica Series5', 690, 'Adriatica Series5', 'cas5.jpg', 'Adriatica Series5'),
(32, 5, 0, 'Rolex White Series', 500, 'Rolex White Series', 'rol1.jpg', 'Rolex White Series'),
(33, 6, 2, 'Casio G-Shock Series1', 300, 'Casio G-Shock Series1', 'par1.jpg', 'Casio G-Shock Series1'),
(34, 6, 4, 'Casio G-Shock Series2', 100, 'Casio G-Shock Series2', 'par2.JPG', 'Casio G-Shock Series2'),
(35, 6, 0, 'Casio G-Shock Series3', 600, 'Casio G-Shock Series3', 'par3.jpg', 'Casio G-Shock Series3'),
(36, 6, 5, 'Casio G-Shock Series4', 100, 'Casio G-Shock Series4', 'par4.jpg', 'Casio G-Shock Series4'),
(37, 6, 5, 'Casio G-Shock Series5', 200, 'Casio G-Shock Series5', 'par5.jpg', 'Casio G-Shock Series5'),
(38, 6, 4, 'Casio G-Shock Series6', 500, 'Casio G-Shock Series6', 'par6.jpg', 'Casio G-Shock Series6'),
(39, 6, 5, 'Casio G-Shock Series7', 500, 'Casio G-Shock Series7', 'par7.jpg', 'Casio G-Shock Series7'),
(40, 2, 6, 'G-Shock GM-S5600MF-6', 300, 'G-Shock GM-S5600MF-6', 'img 2.jpg', 'G-Shock GM-S5600MF-6'),
(45, 1, 2, 'Limited Edition Acurist Wrist Watch A5002KI', 100, 'Limited Edition Acurist Wrist Watch A5002KI', 'i1.JPG', 'Limited Edition Acurist Wrist Watch A5002KI'),
(46, 1, 2, 'Acurist Ac-5FGGF4100', 700, 'Acurist Ac-5FGGF4100', 'image 5.JPG', 'Acurist Ac-5FGGF4100'),
(47, 4, 6, 'Adriatica Series6', 650, 'Adriatica Series6', 'cas6.jpg', 'Adriatica Series6'),
(48, 1, 7, 'Acurist Aviation M-HR56099', 250, 'Acurist Aviation M-HR56099', 'i2.jpg', 'Acurist Aviation M-HR56099'),
(49, 1, 7, 'Acurist R-H80000JI', 250, 'Acurist R-H80000JI', 'i3.jpg', 'Acurist R-H80000JI'),
(50, 3, 6, 'Adidas Project-2-RS', 350, 'Adidas Project-2-RS', 'im4.jpg', 'Adidas Project-2-RS'),
(51, 3, 6, 'PRSDTY-HGF-Y45 Adidas-JKI', 270, 'PRSDTY-HGF-Y45 Adidas-JKI', 'ad1.jpg', 'PRSDTY-HGF-Y45 Adidas-JKI'),
(52, 3, 6, 'Black Adidas Wrist-Watch', 453, 'Black Adidas Wrist-Watch', 'ad2.jpg', 'Black Adidas Wrist-Watch'),
(53, 3, 6, 'Neon Green Adidas Edition PK98-CXD', 220, 'Neon Green Adidas Edition PK98-CXD', 'ad3.jpg', 'Neon Green Adidas Edition PK98-CXD'),
(54, 3, 6, 'Ocean Dep Blue Adidas MOFL-RN6Y', 290, 'Ocean Dep Blue Adidas MOFL-RN6Y', 'ad4.jpg', 'Ocean Dep Blue Adidas MOFL-RN6Y'),
(55, 3, 6, 'Adidas Shark Blue WYT-4JTL-A125', 259, 'Adidas Shark Blue WYT-4JTL-A125', 'ad5.jpg', 'Adidas Shark Blue WYT-4JTL-A125'),
(56, 3, 6, 'Yellow G-Shock R21 Series', 299, 'Yellow G-Shock R21 Series', 'gs1.jpg', 'Yellow G-Shock R21 Series'),
(57, 3, 6, 'Black Shark GS-32', 260, 'Black Shark GS-32', 'gs2.jpg', 'Black Shark GS-32'),
(58, 3, 6, 'Earth Blue Shock 43Smodel', 350, 'Earth Blue Shock 43Smodel', 'gs3.jpg', 'Earth Blue Shock 43Smodel'),
(59, 3, 6, 'Black Aqua Cashio', 855, 'Black Aqua Cashio', 'gs4.jpg', 'Black Aqua Cashio'),
(60, 3, 6, 'G-Shock Metal Twisted', 150, 'G-Shock Metal Twisted', 'gs5.jpg', 'G-Shock Metal Twisted'),
(61, 3, 6, 'G-Steel Cashio Silver Black', 215, 'G-Steel Cashio Silver Black', 'gs6.jpg', 'G-Steel Cashio Silver Black'),
(62, 3, 6, 'Green G-Shock Edition', 299, 'Green G-Shock Edition', 'cs1.jpg', 'Green G-Shock Edition'),
(63, 3, 6, 'Adidas White series', 550, 'Adidas White series', 'cs2.jpg', 'Adidas White series'),
(64, 3, 6, 'Adidas Black Rubber Wrist-Watch', 460, 'Adidas Black Rubber Wrist-Watch', 'cs3.jpg', 'Adidas Black Rubber Wrist-Watch'),
(65, 3, 6, 'Circle Blue Adidas A24 Series', 470, 'Circle Blue Adidas A24 Series', 'cs4.jpg', 'Circle Blue Adidas A24 Series'),
(66, 3, 6, 'White NewYork Adidas ADNYW-2Series', 480, 'White NewYork Adidas ADNYW-2Series', 'cs5.jpg', 'White NewYork Adidas ADNYW-2Series'),
(67, 3, 6, 'Black Mamba Adidas Wr-45S', 360, 'Black Mamba Adidas Wr-45S', 'ads1.jpg', 'Black Mamba Adidas Wr-45S'),
(68, 3, 6, 'Green Adidas Watch 345 DGRT', 550, 'Green Adidas Watch 345 DGRT', 'ads2.jpg', 'Green Adidas Watch 345 DGRT'),
(69, 3, 6, 'Pink Adidas Limited Edition', 390, 'Pink Adidas Limited Edition', 'ads3.jpg', 'Pink Adidas Limited Edition'),
(70, 3, 6, 'Mocha Green Adidas', 399, 'Mocha Green Adidas', 'ads4.jpg', 'Mocha Green Adidas'),
(71, 1, 2, 'ANO.11.RAlly Adriatica Limited Edition', 500, 'ANO.11.RAlly Adriatica Limited Edition', 'i5.jpg', 'ANO.11.RAlly Adriatica Limited Edition'),
(72, 7, 2, 'Apple Blue Series6', 350, 'Apple Blue Series6', 'abl1.jpg', 'Apple Blue Series6'),
(73, 7, 2, 'Apple Swiss White', 350, 'Apple Swiss White', 'aw1.jpg', 'Apple Swiss White'),
(74, 1, 1, 'Adriatica Saphire Glass For Men', 500, 'Adriatica Saphire Glass For Men', 'i4.jpg', 'Adriatica Saphire Glass For Men'),
(75, 1, 1, 'Swiss Made Ariatica Series', 550, 'Swiss Made Ariatica Series', 'i6.jpg', 'Swiss Made Ariatica Series'),
(76, 1, 5, 'MLE Adriatica Series', 450, 'MLE Adriatica Series', 'image 6.jpg', 'MLE Adriatica Series'),
(77, 1, 4, 'CH Adriatica', 549, 'CH Adriatica', 'image 5.jpg', 'CH Adriatica'),
(78, 1, 5, 'Adriatica S-21', 479, 'Adriatica S-21', 'image 6.jpg', 'Adriatica S-21'),
(79, 7, 2, 'Apple Bluetooth Watch', 569, 'Apple Bluetooth Watch', 'blut3.jpg', 'Apple Bluetooth Watch'),
(80, 1, 1, 'Adriatica Men Watch AK Series', 143, 'Adriatica Men Watch AK Series', 'image 4.jpg', 'Adriatica Men Watch AK Series'),
(81, 4, 6, 'Adriatica Series7', 300, 'Adriatica Series7', 'cas7.jpg', 'Adriatica Series7');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'puneeth', 'Reddy', 'puneethreddy951@gmail.com', 'puneeth', '9448121558', '123456789', 'sdcjns,djc'),
(15, 'hemu', 'ajhgdg', 'puneethreddy951@gmail.com', '346778', '536487276', ',mdnbca', 'asdmhmhvbv'),
(16, 'venky', 'vs', 'venkey@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(19, 'abhishek', 'bs', 'abhishekbs@gmail.com', 'asdcsdcc', '9871236534', 'bangalore', 'hassan'),
(21, 'prajval', 'mcta', 'prajvalmcta@gmail.com', '1234545662', '202-555-01', 'bangalore', 'kumbalagodu'),
(22, 'puneeth', 'v', 'hemu@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(23, 'hemanth', 'reddy', 'hemanth@gmail.com', 'Puneeth@123', '9876543234', 'Bangalore', 'Kumbalagodu'),
(24, 'newuser', 'user', 'newuser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu'),
(25, 'otheruser', 'user', 'otheruser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu');

--
-- Triggers `user_info`
--
DELIMITER $$
CREATE TRIGGER `after_user_info_insert` AFTER INSERT ON `user_info` FOR EACH ROW BEGIN
INSERT INTO user_info_backup VALUES(new.user_id,new.first_name,new.last_name,new.email,new.password,new.mobile,new.address1,new.address2);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_info_backup`
--

CREATE TABLE `user_info_backup` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_info_backup`
--

INSERT INTO `user_info_backup` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'puneeth', 'Reddy', 'puneethreddy951@gmail.com', '123456789', '9448121558', '123456789', 'sdcjns,djc'),
(14, 'hemanthu', 'reddy', 'hemanthreddy951@gmail.com', '123456788', '6526436723', 's,dc wfjvnvn', 'b efhfhvvbr'),
(15, 'hemu', 'ajhgdg', 'keeru@gmail.com', '346778', '536487276', ',mdnbca', 'asdmhmhvbv'),
(16, 'venky', 'vs', 'venkey@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(19, 'abhishek', 'bs', 'abhishekbs@gmail.com', 'asdcsdcc', '9871236534', 'bangalore', 'hassan'),
(20, 'pramod', 'vh', 'pramod@gmail.com', '124335353', '9767645653', 'ksbdfcdf', 'sjrgrevgsib'),
(21, 'prajval', 'mcta', 'prajvalmcta@gmail.com', '1234545662', '202-555-01', 'bangalore', 'kumbalagodu'),
(22, 'puneeth', 'v', 'hemu@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(23, 'hemanth', 'reddy', 'hemanth@gmail.com', 'Puneeth@123', '9876543234', 'Bangalore', 'Kumbalagodu'),
(24, 'newuser', 'user', 'newuser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu'),
(25, 'otheruser', 'user', 'otheruser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_info`
--
ALTER TABLE `admin_info`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `email_info`
--
ALTER TABLE `email_info`
  ADD PRIMARY KEY (`email_id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `orders_info`
--
ALTER TABLE `orders_info`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`order_pro_id`),
  ADD KEY `order_products` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_info_backup`
--
ALTER TABLE `user_info_backup`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_info`
--
ALTER TABLE `admin_info`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `email_info`
--
ALTER TABLE `email_info`
  MODIFY `email_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders_info`
--
ALTER TABLE `orders_info`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `order_pro_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `user_info_backup`
--
ALTER TABLE `user_info_backup`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders_info`
--
ALTER TABLE `orders_info`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`);

--
-- Constraints for table `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `order_products` FOREIGN KEY (`order_id`) REFERENCES `orders_info` (`order_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
