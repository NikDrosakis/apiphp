-- phpMyAdmin SQL Dump
-- version 5.0.4deb2+deb11u1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 04, 2024 at 04:14 AM
-- Server version: 10.5.21-MariaDB-0+deb11u1
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ga_model2024`
--
CREATE DATABASE IF NOT EXISTS `ga_model2024A` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ga_model2024`;

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) UNSIGNED NOT NULL,
  `post` int(11) UNSIGNED NOT NULL,
  `uid` int(11) UNSIGNED NOT NULL,
  `content` text DEFAULT NULL,
  `created` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONSHIPS FOR TABLE `comment`:
--   `uid`
--       `user` -> `id`
--

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `post`, `uid`, `content`, `created`) VALUES
(1, 1, 1, 'This is the first comment!', 120930);

-- --------------------------------------------------------

--
-- Table structure for table `globs`
--

DROP TABLE IF EXISTS `globs`;
CREATE TABLE `globs` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(200) NOT NULL,
  `en` text DEFAULT NULL,
  `tag` varchar(20) DEFAULT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `type` varchar(50) DEFAULT NULL,
  `permit` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- RELATIONSHIPS FOR TABLE `globs`:
--

--
-- Dumping data for table `globs`
--

INSERT INTO `globs` (`id`, `name`, `en`, `tag`, `status`, `type`, `permit`) VALUES
(3, 'domain-version', '2', 'sys', 0, '', ''),
(4, 'google_tag_manager', 'this%20is%20the%20google', 'google', 0, '', ''),
(5, 'site_mail', 'info@drosakis.com', 'mail', 0, '', ''),
(34, 'copyright', 'KOsas', 'pvar', 0, 'html', ''),
(35, 'twitter', 'https://twitter.com/NikosDrosakis', 'link', 0, 'url', ''),
(36, 'facebook', 'https://www.facebook.com/ndrosakis', 'link', 0, 'url', ''),
(37, 'github', 'https://github.com/NikDrosakis', 'link', 0, 'url', ''),
(38, 'username', 'mail.drosakis.com', 'mail', 0, '', ''),
(39, 'password', 'Nikos.', 'mail', 0, '', ''),
(40, 'SMTPSecure', 'tls', 'mail', 0, '', ''),
(41, 'addAddress', 'drosakis@gaiasys.com', 'mail', 0, '', ''),
(42, 'addAddressName', 'Nikos Drosakis', 'mail', 0, '', ''),
(43, 'addCC', 'mail.gaiasys.com', 'mail', 0, '', ''),
(44, 'addBCC', 'mail.gaiasys.com', 'mail', 0, '', ''),
(45, 'analytics_id', 'UA-48757242-1', 'google', 0, '', ''),
(46, 'redisdb', '1', 'sys', 0, '', ''),
(50, 'dash_color_comb', '4', 'sys', 0, '', ''),
(51, 'title', 'Nikos%20Drosakis', 'pvar', 0, 'text', ''),
(52, 'pagin', '10', 'public', 0, '', ''),
(53, 'meta_title_en', 'Gaia%20System', 'meta', 0, '', ''),
(54, 'description', 'The%20audiobooks%20official%20website', 'pvar', 0, 'text', ''),
(55, 'system_level', '1', 'sys', 0, '', ''),
(56, 'active_modules', '%5B', 'sys', 0, '', ''),
(57, 'active_pages', '%5Bnull%2C', 'sys', 0, '', ''),
(66, 'active_langs', '%5B', 'sys', 0, '', ''),
(74, 'aaa-size', '1', 'template', 0, '', ''),
(75, 'aaa-bg', 'black', 'template', 0, '', ''),
(76, 'aaa', '1', 'ui', 0, '', ''),
(77, 'redis_status', '1', 'sys', 0, '', ''),
(78, 'seokeywords', 'Nikos%2C%20Drosakis%2C%20acting%2C%20directing%2C%20poetry%2C%20writing%2C%20programming%2C%20%CE%9D%CE%AF%CE%BA%CE%BF%CF%82%20%CE%94%CF%81%CE%BF%CF%83%CE%AC%CE%BA%CE%B7%CF%82%2C%20%CF%83%CE%BA%CE%B7%CE%BD%CE%BF%CE%B8%CE%B5%CF%83%CE%AF%CE%B1%2C%20%CE%B7%CE%B8%CE%BF%CF%80%CE%BF%CE%B9%CF%8C%CF%82%2C%20%CE%BA%CE%B9%CE%BD%CE%B7%CE%BC%CE%B1%CF%84%CE%BF%CE%B3%CF%81%CE%AC%CF%86%CE%BF%CF%82%2C%20%CE%B8%CE%AD%CE%B1%CF%84%CF%81%CE%BF%2C%20%CF%80%CE%BF%CE%AF%CE%B7%CF%83%CE%B7', 'seo', 0, 'text', ''),
(80, 'seodescription', '%CE%9D%CE%AF%CE%BA%CE%BF%CF%82%20%CE%94%CF%81%CE%BF%CF%83%CE%AC%CE%BA%CE%B7%CF%82%20%CE%B1%CF%83%CF%87%CE%BF%CE%BB%CE%B5%CE%AF%CF%84%CE%B1%CE%B9%20%CE%BC%CE%B5%20%CF%84%CE%B7%20%CF%83%CE%BA%CE%B7%CE%BD%CE%BF%CE%B8%CE%B5%CF%83%CE%AF%CE%B1%2C%20%CF%80%CE%BF%CE%AF%CE%B7%CF%83%CE%B7%2C%20%CF%85%CF%80%CE%BF%CE%BA%CF%81%CE%B9%CF%84%CE%B9%CE%BA%CE%AE%20%CF%83%CF%84%CE%BF%20%CE%B8%CE%AD%CE%B1%CF%84%CF%81%CE%BF%20%CE%BA%CE%B1%CE%B9%20%CF%83%CF%84%CE%BF%CE%BD%20%CE%BA%CE%B9%CE%BD%CE%B7%CE%BC%CE%B1%CF%84%CE%BF%CE%B3%CF%81%CE%AC%CF%86%CE%BF', 'seo', 0, 'text', ''),
(81, 'system-version', '0155', 'sys', 0, '', ''),
(82, 'lang_primary', 'en', 'local', 0, '', ''),
(83, 'bgimg', 'https%3A%2F%2Fscontent.fath6-1.fna.fbcdn.net%2Fv%2Ft1.0-9%2F61155773_10218553843812959_7617648790408790016_n.jpg%3F_nc_cat%3D108%26_nc_ohc%3DIlFiqZRgEWYAQnrNnBzz2BxWFip3QDF-PZW_3orc_bX9CvrvyRWWPBMgA%26_nc_ht%3Dscontent.fath6-1.fna%26oh%3D9c085c6c81b211b9cebc7ae61df92b44%26oe%3D5EA6D034', 'pvar', 0, 'img', ''),
(84, 'subtitle', 'book%2Cradio%2Caudiobooks', 'pvar', 0, 'text', ''),
(234, 'template-version', '0.8', 'version', 0, 'read', ''),
(235, 'system_version', '0.73', 'version', 0, 'read', ''),
(236, 'template_active', 'nikos', 'version', 0, 'read', ''),
(238, 'logo', 'https://gaiacms.nikosdrosakis.gr/media/nikos.jpg', 'pvar', 0, 'img', NULL),
(239, 'topimg', 'https%3A%2F%2Fscontent.fath7-1.fna.fbcdn.net%2Fv%2Ft31.0-8%2Fp960x960%2F23926338_10214216454580939_4001944428661364103_o.jpg%3F_nc_cat%3D111%26_nc_ohc%3DKodF8F04w-cAX9u_2MX%26_nc_ht%3Dscontent.fath7-1.fna%26_nc_tp%3D1002%26oh%3D83baeb398140d8c4946c865450128c9d%26oe%3D5E906649', 'pvar', 0, 'img', NULL),
(240, 'google_site_verification', '+nxGUDJ4QpAZ5l9Bsjdi102tLVC21AIh5d1Nl23908vVuFHs34=', 'google', 0, 'text', NULL),
(241, 'bio', 'Acting%20%26%20Drama%20graduate%20at%202003%20%26%20Camera%2FLights%20at%202008.%20Directed%20two%20short%20films%20(Timor%20Mortis%2C%202008%20%26%20The%20garbage%20saints%2C%202020)%2C%20one%20feature%20documentary%20(The%20little%20others%2C%202011)%20with%20Official%20Selections%20at%3A%20the%20Drama%20Festival%20(2009)%2C%20Thessaloniki%20Documentary%20(2011)%20and%20Docfest%20Chalkida%20(2011).%20Also%20directed%20the%20documentary%20%22The%20art%20of%20uniqueness%22%20for%20ERT2%20(Greek%20television).%20%0A%3Cbr%20%2F%3ETen%20years%20as%20a%20stage%20actor%2C%20director%20and%20playwright%2C%20he%20has%20recently%20published%20the%20poetry%20collection%20%22Inclusion%20of%20Dream%22.', 'local', 0, 'textarea', NULL),
(242, 'fb_app_id', '872746866595086', 'meta', 0, 'text', NULL),
(243, 'biogr', '%CE%9F%20%CE%9D%CE%AF%CE%BA%CE%BF%CF%82%20%CE%94%CF%81%CE%BF%CF%83%CE%AC%CE%BA%CE%B7%CF%82%20%CE%B3%CE%B5%CE%BD%CE%BD%CE%AE%CE%B8%CE%B7%CE%BA%CE%B5%20%CF%83%CF%84%CE%B7%CE%BD%20%CE%91%CE%B8%CE%AE%CE%BD%CE%B1.%20%CE%91%CF%80%CF%8C%CF%86%CE%BF%CE%B9%CF%84%CE%BF%CF%82%20%CE%94%CF%81%CE%B1%CE%BC%CE%B1%CF%84%CE%B9%CE%BA%CE%AE%CF%82%20%CE%A3%CF%87%CE%BF%CE%BB%CE%AE%CF%82%20%CF%84%CE%BF%202003%20%CE%BA%CE%B1%CE%B9%20%CE%95%CE%B9%CE%BA%CE%BF%CE%BD%CE%BF%CE%BB%CE%B7%CF%88%CE%AF%CE%B1%CF%82%20%CF%84%CE%BF%202008.%20%CE%95%CF%81%CE%B3%CE%AC%CE%B6%CE%B5%CF%84%CE%B1%CE%B9%20%CF%83%CF%84%CE%BF%20%CE%B8%CE%AD%CE%B1%CF%84%CF%81%CE%BF%20%CF%89%CF%82%20%CE%B7%CE%B8%CE%BF%CF%80%CE%BF%CE%B9%CF%8C%CF%82%2C%20%CF%83%CF%85%CE%B3%CE%B3%CF%81%CE%B1%CF%86%CE%AD%CE%B1%CF%82%20%CE%BA%CE%B1%CE%B9%20%CF%83%CE%BA%CE%B7%CE%BD%CE%BF%CE%B8%CE%AD%CF%84%CE%B7%CF%82.%20%CE%9F%CE%B9%20%CE%B8%CE%B5%CE%AC%CF%84%CF%81%CE%B9%CE%BA%CE%AD%CF%82%20%CE%B4%CE%B9%CE%B1%CF%83%CE%BA%CE%B5%CF%85%CE%AD%CF%82%20%CF%84%CE%BF%CF%85%3A%20%CE%A4%CE%BF%CE%BC%20%CE%A3%CF%8E%CE%B3%CE%B5%CF%81%2C%20%CE%A3%CE%BA%CF%81%CE%BF%CF%85%CF%84%CE%B6%2C%20%CE%A0%CE%B1%CF%81%CE%B1%CE%BC%CF%8D%CE%B8%CE%B9%20%CF%87%CF%89%CF%81%CE%AF%CF%82%20%CE%8C%CE%BD%CE%BF%CE%BC%CE%B1%20%CE%BA%CE%B1%CE%B9%20%CE%92%CE%B1%CF%83%CE%AF%CE%BB%CE%B9%CF%83%CF%83%CE%B1%20%CF%84%CE%BF%CF%85%20%CE%A7%CE%B9%CE%BF%CE%BD%CE%B9%CE%BF%CF%8D%20%CE%AD%CF%87%CE%BF%CF%85%CE%BD%20%CF%80%CE%B1%CF%81%CE%B1%CF%83%CF%84%CE%B1%CE%B8%CE%B5%CE%AF%20%CF%83%CF%84%CE%BF%20%CE%9D%CE%AD%CE%BF%20%CE%98%CE%AD%CE%B1%CF%84%CF%81%CE%BF%20%CE%98%CE%B5%CF%83%2F%CE%BD%CE%AF%CE%BA%CE%B7%CF%82%2C%20%CF%84%CE%BF%20%CE%94%CE%97%CE%A0%CE%95%CE%98%CE%95%20%CE%92%CF%8C%CE%BB%CE%BF%CF%85%2C%20%CF%84%CE%B7%CE%BD%20%CE%A0%CE%B5%CE%B9%CF%81%CE%B1%CE%BC%CE%B1%CF%84%CE%B9%CE%BA%CE%AE%20%CE%A3%CE%BA%CE%B7%CE%BD%CE%AE%20%CE%9A%CE%B1%CE%BC%CE%B1%CE%BB%CE%AC%CF%84%CE%B1%CF%82%20%CE%BA%CE%B1%CE%B9%20%CE%B1%CF%80%CF%8C%20%CF%84%CE%B7%CE%BD%20%20Artes%20Mundi.%20%CE%88%CF%87%CE%B5%CE%B9%20%CF%83%CE%BA%CE%B7%CE%BD%CE%BF%CE%B8%CE%B5%CF%84%CE%AE%CF%83%CE%B5%CE%B9%20%CE%BC%CE%AF%CE%B1%20%CF%84%CE%B1%CE%B9%CE%BD%CE%AF%CE%B1%20%CE%BC%CF%85%CE%B8%CE%BF%CF%80%CE%BB%CE%B1%CF%83%CE%AF%CE%B1%CF%82%20%CE%BC%CE%B9%CE%BA%CF%81%CE%BF%CF%8D%20%CE%BC%CE%AE%CE%BA%CE%BF%CF%85%CF%82%20%CE%BA%CE%B1%CE%B9%20%CF%84%CF%81%CE%AF%CE%B1%20%CE%BD%CF%84%CE%BF%CE%BA%CE%B9%CE%BC%CE%B1%CE%BD%CF%84%CE%AD%CF%81%2C%20%CE%BC%CE%B5%20%CF%83%CF%85%CE%BC%CE%BC%CE%B5%CF%84%CE%BF%CF%87%CE%AD%CF%82%20%CF%83%CF%84%CE%B1%20%CE%A6%CE%B5%CF%83%CF%84%CE%B9%CE%B2%CE%AC%CE%BB%20%CE%94%CF%81%CE%AC%CE%BC%CE%B1%CF%82%2C%20%CE%A7%CE%B1%CE%BB%CE%BA%CE%AF%CE%B4%CE%B1%CF%82%20%CE%BA%CE%B1%CE%B9%20%CE%98%CE%B5%CF%83%CF%83%CE%B1%CE%BB%CE%BF%CE%BD%CE%AF%CE%BA%CE%B7%CF%82.%20%CE%91%CF%85%CF%84%CE%BF%CE%B4%CE%AF%CE%B4%CE%B1%CE%BA%CF%84%CE%BF%CF%82%20%CE%B3%CE%BD%CF%8E%CF%83%CF%84%CE%B7%CF%82%20%CE%B3%CE%BB%CF%89%CF%83%CF%83%CF%8E%CE%BD%20%CF%80%CF%81%CE%BF%CE%B3%CF%81%CE%B1%CE%BC%CE%BC%CE%B1%CF%84%CE%B9%CF%83%CE%BC%CE%BF%CF%8D%20%CE%B4%CF%81%CE%B1%CF%83%CF%84%CE%B7%CF%81%CE%B9%CE%BF%CF%80%CE%BF%CE%B9%CE%B5%CE%AF%CF%84%CE%B1%CE%B9%20%CE%BA%CE%B1%CE%B9%20%CF%89%CF%82%20%CF%80%CF%81%CE%BF%CE%B3%CF%81%CE%B1%CE%BC%CE%BC%CE%B1%CF%84%CE%B9%CF%83%CF%84%CE%AE%CF%82.%20H%20%CF%80%CF%81%CF%8E%CF%84%CE%B7%20%CF%80%CE%BF%CE%B9%CE%B7%CF%84%CE%B9%CE%BA%CE%AE%20%CF%83%CF%85%CE%BB%CE%BB%CE%BF%CE%B3%CE%AE%20%CF%84%CE%BF%CF%85%2C%20%22%CE%B5%CE%B3%CE%BA%CE%BB%CE%B5%CE%B9%CF%83%CE%BC%CF%8C%CF%82%20%CE%BF%CE%BD%CE%B5%CE%AF%CF%81%CE%BF%CF%85%22%20%CE%B5%CE%BA%CE%B4%CF%8C%CE%B8%CE%B7%CE%BA%CE%B5%20%CF%84%CE%BF%CE%BD%20%CE%99%CE%BF%CF%8D%CE%BB%CE%B9%CE%BF%202020%20%CE%B1%CF%80%CF%8C%20%CF%84%CE%B9%CF%82%20%CE%B5%CE%BA%CE%B4%CF%8C%CF%83%CE%B5%CE%B9%CF%82%20%CE%95%CF%8D%CE%BC%CE%B1%CF%81%CE%BF%CF%82.', 'local', 0, 'textarea', NULL),
(244, 'web_authorgr', '%CE%9D%CE%AF%CE%BA%CE%BF%CF%82%20%CE%94%CF%81%CE%BF%CF%83%CE%AC%CE%BA%CE%B7%CF%82', 'local', 0, 'text', NULL),
(245, 'web_author', 'Nikos Drosakis', 'local', 0, 'text', NULL),
(246, 'this_version', '1', 'version', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `links`
--

DROP TABLE IF EXISTS `links`;
CREATE TABLE `links` (
  `id` int(10) UNSIGNED NOT NULL,
  `linksgrpid` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `parentid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(300) DEFAULT NULL,
  `titlegr` varchar(300) DEFAULT NULL,
  `uri` varchar(200) DEFAULT NULL,
  `icon` varchar(200) DEFAULT NULL,
  `page` varchar(100) DEFAULT NULL,
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `sort` tinyint(3) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- RELATIONSHIPS FOR TABLE `links`:
--

--
-- Dumping data for table `links`
--

INSERT INTO `links` (`id`, `linksgrpid`, `parentid`, `title`, `titlegr`, `uri`, `icon`, `page`, `type`, `sort`) VALUES
(2, 2, 0, 'Home', 'Αρχική', '', 'icon  fas fa-home', NULL, 1, 0),
(3, 2, 0, 'The garbage saints', 'Οι άγιοι των σκουπιδιών', 'the-garbage-saints', 'icon  fa-film', 'film.png', 1, 3),
(5, 2, 0, 'Inclusion of dream', 'Εγκλεισμός ονείρου', 'inclusion-of-dream', 'icon fa-book', 'poetry.png', 1, 1),
(10, 2, 0, 'poetry', 'ποίηση', 'poetry', 'icon fa-book', 'poetry.png', 1, 4),
(11, 2, 0, 'Curriculum', 'βιογραφικό', 'cv', 'fas fa-chalkboard', NULL, 1, 7),
(12, 2, 0, 'stage direction', 'θέατρο (σκηνοθεσία)', 'theatre', 'fas fa-theater-masks', 'theatre.png', 1, 5),
(13, 2, 0, 'film direction', 'ταινίες (σκηνοθεσία)', 'film', 'icon fa-film', 'film.png', 1, 6),
(14, 2, 0, 'Parapera', NULL, 'parapera', NULL, NULL, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `linksgrp`
--

DROP TABLE IF EXISTS `linksgrp`;
CREATE TABLE `linksgrp` (
  `id` int(10) UNSIGNED NOT NULL,
  `orient` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `title` varchar(30) DEFAULT NULL,
  `img` varchar(200) DEFAULT NULL,
  `style` varchar(20) DEFAULT NULL,
  `children` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- RELATIONSHIPS FOR TABLE `linksgrp`:
--

--
-- Dumping data for table `linksgrp`
--

INSERT INTO `linksgrp` (`id`, `orient`, `title`, `img`, `style`, `children`) VALUES
(1, 1, 'top', NULL, 's01', 0);

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
CREATE TABLE `media` (
  `id` int(10) UNSIGNED NOT NULL,
  `mediagrpid` int(11) NOT NULL DEFAULT 1,
  `filename` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `location` text NOT NULL,
  `category` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(300) DEFAULT NULL,
  `summary` text DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `privacy` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `created` int(10) UNSIGNED NOT NULL,
  `modified` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- RELATIONSHIPS FOR TABLE `media`:
--   `mediagrpid`
--       `mediagrp` -> `id`
--

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `mediagrpid`, `filename`, `description`, `location`, `category`, `title`, `summary`, `status`, `privacy`, `created`, `modified`) VALUES
(2, 1, '1465754415534.jpg', '', '', 0, NULL, NULL, 0, 0, 1465754399, 0),
(3, 1, '1465754671332.jpg', '', '', 0, NULL, NULL, 0, 0, 1465754655, 0),
(4, 1, '1465754730586.jpg', '', '', 0, NULL, NULL, 0, 0, 1465754726, 0),
(5, 1, '1465758015800.jpg', '', '', 0, NULL, NULL, 0, 0, 1465758001, 0),
(6, 1, '1465758292849.jpg', '', '', 0, NULL, NULL, 0, 0, 1465758277, 0),
(7, 1, '1465760932952.jpg', '', '', 0, NULL, NULL, 0, 0, 1465760917, 0),
(8, 1, '1465761793473.jpg', '', '', 0, NULL, NULL, 0, 0, 1465761778, 0),
(9, 1, '1465767453161.jpg', '', '37.9231302,23.7055283', 3, NULL, NULL, 0, 0, 1465767488, 0),
(10, 1, '1465768715581.jpg', 'my first android app.όμάδάρά', '37.923119,23.7053457', 3, NULL, NULL, 0, 0, 1465768736, 0),
(11, 1, '1465771614443.jpg', 'πρόχώράέί', '37.923119,23.7053457', 3, NULL, NULL, 0, 0, 1465771625, 0),
(12, 1, '1465772994206.jpg', 'Κώστας', '37.9231795,23.7053863', 3, NULL, NULL, 0, 0, 1465772985, 0),
(13, 1, '1465774064050.jpg', 'ή λέμόνίά άνάπόδά', '37.9324885,23.7058838', 1, NULL, NULL, 0, 0, 1465774081, 0),
(14, 1, '1465803859338.jpg', 'νίκόσ', '37.922955,23.7055268', 2, NULL, NULL, 0, 0, 1465803863, 0),
(15, 1, '1465817136731.jpg', 'τέστ', '37.9231776,23.7053137', 2, NULL, NULL, 0, 0, 1465817133, 0),
(16, 1, '1465817136731.jpg', 'τέστ', '37.9231776,23.7053137', 2, NULL, NULL, 0, 0, 1465817147, 0),
(17, 1, '1465926071386.jpg', 'Καλλιόπη στο κέντρο του Ανδρέα', '37.9378014,23.7103744', 1, NULL, NULL, 0, 0, 1465926101, 0),
(18, 1, '1465938238357.jpg', 'Ό γάτος επαυτοφωρω', '37.9324912,23.70577', 2, NULL, NULL, 0, 0, 1465938245, 0),
(19, 1, '1466007908811.jpg', 'coding view', '37.9233564,23.7053989', 3, NULL, NULL, 0, 0, 1466007910, 0),
(20, 1, '1466008123336.jpg', 'plans', '37.9231498,23.7054503', 3, NULL, NULL, 0, 0, 1466008125, 0),
(21, 1, '1466008353963.jpg', 'cool coding', '37.9232354,23.7054075', 3, NULL, NULL, 0, 0, 1466008354, 0),
(22, 1, '1466008412299.jpg', 'cool coding 2', '37.9232354,23.7054075', 3, NULL, NULL, 0, 0, 1466008420, 0),
(23, 1, '1466288966767.jpg', 'με τον νικολα μπυρα', '', 2, NULL, NULL, 0, 0, 1466288981, 0),
(24, 1, '1466344071651.jpg', 'hot weather', '37.9232567,23.7053588', 2, NULL, NULL, 0, 0, 1466344084, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mediagrp`
--

DROP TABLE IF EXISTS `mediagrp`;
CREATE TABLE `mediagrp` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `img` varchar(200) DEFAULT NULL,
  `format` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `multiple` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONSHIPS FOR TABLE `mediagrp`:
--

--
-- Dumping data for table `mediagrp`
--

INSERT INTO `mediagrp` (`id`, `name`, `img`, `format`, `multiple`) VALUES
(1, 'feature', NULL, 0, 0),
(2, 'actor', NULL, 1, 0),
(3, 'director', NULL, 1, 0),
(4, 'profile', NULL, 1, 0),
(5, 'poet', NULL, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'auto',
  `uid` int(10) UNSIGNED NOT NULL COMMENT 'auto-user.name',
  `taxid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '\'[]\'',
  `uri` varchar(100) DEFAULT NULL COMMENT 'text',
  `img` varchar(200) DEFAULT NULL COMMENT 'img-upload',
  `title` varchar(200) DEFAULT NULL COMMENT 'text',
  `subtitle` varchar(200) DEFAULT NULL COMMENT 'text',
  `excerpt` text DEFAULT NULL COMMENT 'textarea-editor',
  `content` text DEFAULT NULL COMMENT 'textarea-editor',
  `titlegr` varchar(300) DEFAULT NULL,
  `subtitlegr` varchar(300) DEFAULT NULL,
  `excerptgr` text DEFAULT NULL,
  `contentgr` text DEFAULT NULL,
  `html1` text DEFAULT NULL COMMENT 'textarea-editor',
  `html2` text DEFAULT NULL COMMENT 'textarea-editor',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'number',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'select-status',
  `postgrpid` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'select-postgrps',
  `seodescription` text DEFAULT NULL COMMENT 'textarea',
  `seokeywords` text DEFAULT NULL COMMENT 'textarea',
  `seopriority` text DEFAULT NULL COMMENT 'decimal',
  `created` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'date-read',
  `modified` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'date-read',
  `published` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'date-read'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- RELATIONSHIPS FOR TABLE `post`:
--   `uid`
--       `user` -> `id`
--

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `uid`, `taxid`, `tags`, `uri`, `img`, `title`, `subtitle`, `excerpt`, `content`, `titlegr`, `subtitlegr`, `excerptgr`, `contentgr`, `html1`, `html2`, `sort`, `status`, `postgrpid`, `seodescription`, `seokeywords`, `seopriority`, `created`, `modified`, `published`) VALUES
(18, 1, 39, '\'[]\'', 'the-little-others', 'The little others afiseta2014.jpg', 'The little others', 'Documentary feature', '<p>adsfadsf</p>', '<div>Trailer</div><iframe title=\"vimeo-player\" src=\"https://player.vimeo.com/video/39093091\" width=\"640\" height=\"350\" frameborder=\"0\" allowfullscreen></iframe>', 'Οι μικροί άλλοι', 'Ντοκιμαντέρ μεγάλου μήκους', '<p>Προβολές: Φεστιβάλ Θεσσαλονίκης 2011 - Φεστιβάλ Χαλκίδας 2011 - Αντιρατσιστικό Φεστιβάλ Αθήνας 2012 - Δευτεροβάθμια Εκπαίδευση Ηρακλείου Πρωτοβάθμια Εκπαίδευση Ρεθύμνου, Προβολές σε ημερίδες &amp; συλλόγους εκπαιδευτικών<br></p>', '<div>Trailer</div><iframe title=\"vimeo-player\" src=\"https://player.vimeo.com/video/39093091\" width=\"640\" height=\"350\" frameborder=\"0\" allowfullscreen></iframe>', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/0tlETPdNvcs\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>\n<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/36by9nLznaQ\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>\n\n<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/Su6xM3A94w0\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', NULL, 2, 2, 1, NULL, NULL, NULL, 1605776245, 1606159723, 0),
(19, 1, 39, '\'[]\'', 'texni-tis-monadikotitas', 'still_small (1).png', 'The art of uniqueness', 'tv documentary', '<p>adfadsfasf</p>', '<p><a href=\"https://www.ertflix.gr/en/vod/vod.127602-es-ayrion-ta-spoydaia-i-techni-tis-monadikotitas\" target=\"_blank\">The Great Tommorow - ERTFLIX</a><br></p>', 'Η τέχνη της μοναδικότητας', 'τηλεοπτικό ντοκιμαντέρ σειρά ΕΣ ΑΥΡΙΟΝ ΤΑ ΣΠΟΥΔΑΙΑ', NULL, '<p><a href=\"https://www.ertflix.gr/en/vod/vod.127602-es-ayrion-ta-spoydaia-i-techni-tis-monadikotitas\" target=\"_blank\">The Great Tommorow - ERTFLIX</a><br></p>', '<p><a href=\"https://www.ertflix.gr/en/vod/vod.127602-es-ayrion-ta-spoydaia-i-techni-tis-monadikotitas\" target=\"_blank\">The Great Tommorow - ERTFLIX</a><br></p>', NULL, 4, 2, 1, NULL, NULL, NULL, 1605776395, 1606159768, 0),
(20, 1, 38, '\'[]\'', 'snowqueen', 'afisa-agistri.jpg', 'The snowqueen', 'theatre for children', '<p>ασδφδασφ</p>', '<p>αδσφαδσφφαδ</p>', 'Η βασίλισσα του χιονιού', 'θέατρο για παιδιά', NULL, NULL, NULL, NULL, 5, 2, 1, NULL, NULL, NULL, 1605776436, 1606159813, 0),
(21, 1, 39, '\'[]\'', 'timor-mortis', '5.jpg', 'Timor Mortis', 'narrative short film', '<p><br></p>', '<p><span style=\"color: rgb(26, 46, 59); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; letter-spacing: 0.16px;\">Μικρού Μήκους Είδος: Μυθοπλασία, fomat: 35 mm Διάρκεια: 6 λεπτά Έτος παραγωγής: 2008 Σύνοψη Απ’ τα σπήλαια, αναδύεται το πανάρχαιο συναίσθημα της αυτοσυντήρησης, η πάλη του ανθρώπου με το φόβο. Σε τέσσερις εικόνες ένας διαχρονικός ήρωας βιώνει το φόβο: Σαν υπάλληλος, σαν παιδί, σαν έφηβος, σαν ξιφομάχος. Όταν νικήσει, είναι έτοιμος να βαδίσει στο θάνατο. Ο θάνατος είναι ένας σταθμός, ένα δάσος καμένο που θα περάσει, πιο σοφός τώρα, σαν παιδί πάλι, τον ατέρμονα δρόμο του.</span><br></p>', 'Φόβος θανάτου', 'μυθοπλασία μικρού μήκους', NULL, NULL, '<iframe id=\"myVideo\" src=\"https://player.vimeo.com/video/38101452\" frameborder=\"0\" allow=\"autoplay; fullscreen\" allowfullscreen></iframe>', NULL, 8, 0, 1, NULL, NULL, NULL, 1605776605, 1606159636, 0),
(22, 1, 38, '\'[]\'', 'mirror', 'kathreptis.jpg', 'Mirror', 'stage play', '<p>ασδφσδφ</p>', '<p>αδσφαδσφαδ</p>', 'Καθρέπτης', 'θεατρικό έργο', NULL, NULL, '<iframe src=\"https://player.vimeo.com/video/39037926\" width=\"640\" height=\"350\" frameborder=\"0\" allow=\"autoplay; fullscreen\" allowfullscreen></iframe>\n<p><a href=\"https://vimeo.com/39037926\">&Kappa;&alpha;&theta;&rho;έ&pi;&tau;&eta;&sigmaf; (&quot;Mirror&quot;) Trailer</a> from <a href=\"https://vimeo.com/tramartesmundi\">TRAM Artes Mundi</a> on <a href=\"https://vimeo.com\">Vimeo</a>.</p>', NULL, 8, 2, 1, NULL, NULL, NULL, 1605776632, 1606159675, 0),
(23, 1, 37, '\'[]\'', 'inclusion-of-dream', 'Drosakis - Egleismos Oneirou - cover.jpg', 'εγκλεισμός ονείρου', 'ποιητική συλλογή εκδ Εύμαρος 2020', 'Προσωπικά βιώματα αγκαλιάζουν το συλλογικό, με αυτοκριτική και ειλικρίνεια, η συλλογή στοχεύει στην αγωνιστική αισιοδοξία. Με αντανακλάσεις παιδικές, λογικές, συναισθηματικές, υπερβατικές, απ’ το φόβο θανάτου ξεκινά τον απεγκλεισμό, το ταξίδι απ’ το ψεύδος και την εφημερότητα του φεγγαριού στον ήλιο.', '<a class=\"viewImage\" href=\"/media/Capture.png\" data-gallery=\"poster\">\n<img style=\"float: right; border: 1px solid rgb(199, 199, 199); width: 60%;\" alt=\"5302492090 poster\" src=\"/media/Capture.png\"></a>\n<div style=\"float:left\">\n<b>Περιεχόμενα</b>\n<ol>\n<li>φόβος θανάτου</li>\n<li>μικροί άλλοι</li>\n<li>ρήξη</li>\n<li>ταξίδια/έρωτες</li>\n<li>άγιοι των σκουπιδιών</li>\n<li>πιστεύω</li>\n<li>μεταφυσική του έρωτα - τα δύο θ</li>\n<li>μεταμορφώσεις ψευδόμενων</li>\n<li>οιωνοί οίκαδε</li>\n<li>ιούδας</li>\n<li>γιαγιά</li>\n<li>ηθοποιών έργα και ημέρες</li>\n<li>νομοτέλεια των γενόμενων</li>\n<li>φωνούλα</li>\n<li>αθώοι</li>\n<li>ανατολή</li>\n<li>τυχαία παρεμβολή</li>\n<li>νούφαρο</li>\n<li>σε πρώτο πρόσωπο</li>\n<li>αμυγδαλιές</li>\n<li>στο όνομα των στιγμών</li>\n<li>εικόνες</li>\n<li>τώρα που φεύγεις</li>\n<li>πέπλο</li>\n<li>μπέκετ</li>\n<li>ώρα δώδεκα παρά</li>\n<li>μαντόνα</li>\n<li>έβρος ποταμός</li>\n<li>φαέθων</li>\n<li>εγκλεισμός ονείρου</li>\n<li>τίμια ξύλα</li>\n<li>τεχνητή λησμοσύνη</li>\n<li>συμπληγάδες</li>\n</ol>\n</div>', 'εγκλεισμός ονείρου', 'ποιητική συλλογή εκδ.Εύμαρος 2020', 'Προσωπικά βιώματα αγκαλιάζουν το συλλογικό, με αυτοκριτική και ειλικρίνεια, η συλλογή στοχεύει στην αγωνιστική αισιοδοξία. Με αντανακλάσεις παιδικές, λογικές, συναισθηματικές, υπερβατικές, απ’ το φόβο θανάτου ξεκινά τον απεγκλεισμό, το ταξίδι απ’ το ψεύδος και την εφημερότητα του φεγγαριού στον ήλιο.', '<a class=\"viewImage\" href=\"/media/Capture.png\" data-gallery=\"poster\">\n<img style=\"float: right; border: 1px solid rgb(199, 199, 199); width: 60%;\" alt=\"5302492090 poster\" src=\"/media/Capture.png\"></a>\n<div style=\"float:left\">\n<b>Περιεχόμενα</b>\n<ol>\n<li>φόβος θανάτου</li>\n<li>μικροί άλλοι</li>\n<li>ρήξη</li>\n<li>ταξίδια/έρωτες</li>\n<li>άγιοι των σκουπιδιών</li>\n<li>πιστεύω</li>\n<li>μεταφυσική του έρωτα - τα δύο θ</li>\n<li>μεταμορφώσεις ψευδόμενων</li>\n<li>οιωνοί οίκαδε</li>\n<li>ιούδας</li>\n<li>γιαγιά</li>\n<li>ηθοποιών έργα και ημέρες</li>\n<li>νομοτέλεια των γενόμενων</li>\n<li>φωνούλα</li>\n<li>αθώοι</li>\n<li>ανατολή</li>\n<li>τυχαία παρεμβολή</li>\n<li>νούφαρο</li>\n<li>σε πρώτο πρόσωπο</li>\n<li>αμυγδαλιές</li>\n<li>στο όνομα των στιγμών</li>\n<li>εικόνες</li>\n<li>τώρα που φεύγεις</li>\n<li>πέπλο</li>\n<li>μπέκετ</li>\n<li>ώρα δώδεκα παρά</li>\n<li>μαντόνα</li>\n<li>έβρος ποταμός</li>\n<li>φαέθων</li>\n<li>εγκλεισμός ονείρου</li>\n<li>τίμια ξύλα</li>\n<li>τεχνητή λησμοσύνη</li>\n<li>συμπληγάδες</li>\n</ol>\n</div>', '<p style=\"margin: 0cm 0cm 0.0001pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><strong><span lang=\"EL\" style=\"font-family:\" calibri\",sans-serif;mso-ascii-theme-font:minor-latin;=\"\" mso-hansi-theme-font:minor-latin;mso-bidi-theme-font:minor-latin;mso-ansi-language:=\"\" el\"=\"\">Συγγραφέας: Νίκος Δροσάκης</span></strong><span lang=\"EL\" style=\"font-family:\n\" calibri\",sans-serif;mso-ascii-theme-font:minor-latin;mso-hansi-theme-font:=\"\" minor-latin;mso-bidi-theme-font:minor-latin;mso-ansi-language:el\"=\"\"><br>\n<strong>Τίτλος:\nεγκλεισμός ονείρου</strong><br>\nISBN &nbsp;&nbsp;&nbsp; 9786185162719<o:p></o:p></span></p><p style=\"margin: 0cm 0cm 0.0001pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span lang=\"EL\" style=\"font-family:\" calibri\",sans-serif;mso-ascii-theme-font:minor-latin;=\"\" mso-hansi-theme-font:minor-latin;mso-bidi-theme-font:minor-latin;mso-ansi-language:=\"\" el\"=\"\">Εκδότης&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ΕΥΜΑΡΟΣ<o:p></o:p></span></p><p style=\"margin: 0cm 0cm 0.0001pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span lang=\"EL\" style=\"font-family:\" calibri\",sans-serif;mso-ascii-theme-font:minor-latin;=\"\" mso-hansi-theme-font:minor-latin;mso-bidi-theme-font:minor-latin;mso-ansi-language:=\"\" el\"=\"\">Χρονολογία Έκδοσης&nbsp;&nbsp; Ιούλιος 2020<o:p></o:p></span></p><p style=\"margin: 0cm 0cm 0.0001pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span lang=\"EL\" style=\"font-family:\" calibri\",sans-serif;mso-ascii-theme-font:minor-latin;=\"\" mso-hansi-theme-font:minor-latin;mso-bidi-theme-font:minor-latin;mso-ansi-language:=\"\" el\"=\"\">Αριθμός σελίδων&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 64<o:p></o:p></span></p><p style=\"margin: 0cm 0cm 0.0001pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span lang=\"EL\" style=\"font-family:\" calibri\",sans-serif;mso-ascii-theme-font:minor-latin;=\"\" mso-hansi-theme-font:minor-latin;mso-bidi-theme-font:minor-latin;mso-ansi-language:=\"\" el\"=\"\">Διαστάσεις&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 21x14<o:p></o:p></span></p><p style=\"margin: 0cm 0cm 0.0001pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span lang=\"EL\" style=\"font-family:\" calibri\",sans-serif;mso-ascii-theme-font:minor-latin;=\"\" mso-hansi-theme-font:minor-latin;mso-bidi-theme-font:minor-latin;mso-ansi-language:=\"\" el\"=\"\">Επιμέλεια&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ΤΡΙΑΝΤΑΦΥΛΛΟΥ ΜΑΡΩ<o:p></o:p></span></p><p style=\"margin: 0cm 0cm 0.0001pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span lang=\"EL\" style=\"font-family:\" calibri\",sans-serif;mso-ascii-theme-font:minor-latin;=\"\" mso-hansi-theme-font:minor-latin;mso-bidi-theme-font:minor-latin;mso-ansi-language:=\"\" el\"=\"\">Κωδικός Πολιτείας&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6014-0080<o:p></o:p></span></p><p style=\"margin: 0cm 0cm 0.0001pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><strong><span style=\"font-size: 10pt; font-family: Calibri, sans-serif; color: rgb(24, 24, 24); background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; font-weight: normal;\">Γλώσσα\nΓραφής:</span></strong><span style=\"font-size: 10pt; font-family: Calibri, sans-serif; color: rgb(24, 24, 24); background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">&nbsp;ελληνικά</span><span lang=\"EL\" style=\"font-family:\" calibri\",sans-serif;mso-ascii-theme-font:minor-latin;=\"\" mso-hansi-theme-font:minor-latin;mso-bidi-theme-font:minor-latin;mso-ansi-language:=\"\" el\"=\"\"><o:p></o:p></span></p><p style=\"margin: 0cm 0cm 0.0001pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span lang=\"EL\" style=\"font-family:\" calibri\",sans-serif;mso-ascii-theme-font:minor-latin;=\"\" mso-hansi-theme-font:minor-latin;mso-bidi-theme-font:minor-latin;mso-ansi-language:=\"\" el\"=\"\">Θέμα&nbsp;&nbsp; ΛΟΓΟΤΕΧΝΙΑ/ ΕΛΛΗΝΙΚΗ ΠΟΙΗΣΗ<o:p></o:p></span></p><p style=\"margin: 0cm 0cm 0.0001pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span lang=\"EL\" style=\"font-family:\" calibri\",sans-serif;mso-ascii-theme-font:minor-latin;=\"\" mso-hansi-theme-font:minor-latin;mso-bidi-theme-font:minor-latin;mso-ansi-language:=\"\" el\"=\"\">τιμή: € 7,00<br>\n<!--[if !supportLineBreakNewLine]--><br>\n<!--[endif]--><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"text-align: justify; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span lang=\"EL\" style=\"font-size:12.0pt;mso-fareast-font-family:\n\" times=\"\" new=\"\" roman\";mso-bidi-font-family:calibri;mso-bidi-theme-font:minor-latin;=\"\" color:#1c1e21;mso-ansi-language:el\"=\"\">Μέσα καλοκαιριού κυκλοφόρησε η πρώτη ποιητική\nσυλλογή του Νίκου Δροσάκη: <b>«εγκλεισμός ονείρου»</b> από τις εκδόσεις\nΕύμαρος. Η συλλογή περιλαμβάνει συμβολικά 33 ποιήματα.&nbsp;</span><span lang=\"EL\" times=\"\" new=\"\" roman\";mso-bidi-font-family:calibri;mso-bidi-theme-font:minor-latin;=\"\" color:#1d2129;mso-ansi-language:el\"=\"\" style=\"font-size: 12pt;\">Η παιδική αθωότητα χάνεται<b>,</b> καθώς<b>\n</b>τα όνειρα αιμορραγούν κάτω απ’ τη σκιά του φόβου της επιδημίας και η φυσική\nανάγκη της προσωπικής και κοινωνικής επαφής προσκρούει στα διαγγέλματα ατομικής\nευθύνης<b>. </b>Και η συλλογή αρχίζει με την</span><b><i><span lang=\"EL\" style=\"font-size:12.0pt;mso-fareast-font-family:\" times=\"\" new=\"\" roman\";mso-bidi-font-family:=\"\" calibri;mso-bidi-theme-font:minor-latin;color:#1c1e21;mso-ansi-language:el\"=\"\"> «</span></i></b><i><span lang=\"EL\" style=\"font-size:12.0pt;mso-fareast-font-family:\" times=\"\" new=\"\" roman\";=\"\" mso-bidi-font-family:calibri;mso-bidi-theme-font:minor-latin;color:#1c1e21;=\"\" mso-ansi-language:el\"=\"\">επιβίωσης ανάγκη, πάλη αρχέγονη»</span></i><span lang=\"EL\" times=\"\" new=\"\" roman\";mso-bidi-font-family:=\"\" calibri;mso-bidi-theme-font:minor-latin;color:#222222;mso-ansi-language:el\"=\"\" style=\"font-size: 12pt;\">.&nbsp;Παράλληλα,\nυπάρχουν τα φλέγονται θέματα των άλλων τοπίων εγκλεισμού, όπου<b> </b>η θεσμική\nανευθυνότητα φλερτάρει με<b> </b>το\nκατακερματισμένο κοινωνικό τοπίο σε μια χωματερή συνειδήσεων, όπου <i>«η\nανθρώπινη αξιοπρέπεια απέλπιδα χαμοπαλεύει».</i><b> </b>Μέσα από τις <i>συμπληγάδες</i> ξεκινά το ταξίδι της\nματωμένης αποκόλλησης από τον κόσμο του φεγγαριού και της μεθοδικής μετάβασης\nστον ήλιο. Αυτό απεικονίζει και το εξώφυλλο του βιβλίου.</span><span times=\"\" new=\"\" roman\";mso-bidi-font-family:=\"\" calibri;mso-bidi-theme-font:minor-latin;color:#222222\"=\"\" style=\"font-size: 12pt;\">&nbsp;</span><span times=\"\" new=\"\" roman\";mso-bidi-font-family:=\"\" calibri;mso-bidi-theme-font:minor-latin;color:#222222;mso-ansi-language:el\"=\"\" style=\"font-size: 12pt;\"> </span><span lang=\"EL\" times=\"\" new=\"\" roman\";=\"\" mso-bidi-font-family:calibri;mso-bidi-theme-font:minor-latin;color:#1c1e21;=\"\" mso-ansi-language:el\"=\"\" style=\"font-size: 12pt;\">Οι ανθρώπινες σχέσεις απαξιώνονται <i>«μέσα σε ένα αέναο\nκρυφτό με καθρέφτες παντού, να πολλαπλασιάσουμε το σώμα να κρυφτεί η ψυχή»</i>,\nμάταια επιζητώντας το αέναο φλόγισμα και αγωνίζεται να ορθωθεί μέσα από\nπαιδικές αντανακλάσεις ματαίωσης και λατρείας,<b> </b>οι οποίες αγγίζουν και τη σφαίρα της μεταφυσικής<b><i>,</i>\n</b>κρατώντας όμως στέρεα τα γκέμια της λογικής και την πίστη στη νομοτελειακή\nσχέση όσων συμβαίνουν<b> </b>και σε όσων δε θα συμβούν<b><i>.</i></b></span></p><p class=\"MsoNormal\" style=\"text-align:justify;mso-line-height-alt:10.45pt\"><span lang=\"EL\" style=\"font-size: 12pt; color: rgb(28, 30, 33); background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">Η&nbsp;παρουσίαση του βιβλίου&nbsp;έγινε\nστο Φουάρ μπαρ–γκαλερί στις 8 Οκτωβρίου. Για το βιβλίο μίλησε η συγγραφέας Μαρώ\nΤριανταφύλλου και ο Γιάννης Κυπαρίσσης. Ποιήματα διάβασαν οι ηθοποιοί: Ηλεάνα\nΜπάλλα και Δημήτρης Όντος, ενώ συντόνισε η συγγραφέας Ειρήνη\nΔερμιτζάκη.&nbsp;Προβλήθηκαν αποσπάσματα απ’ τις ταινίες που έχει σκηνοθετήσει\nο Νίκος: Φόβος θανάτου (2008), Οι μικροί Άλλοι (2011), Οι άγιοι των σκουπιδιών\n(2020) που αποτελούν και ποιήματα της συλλογής.</span><span style=\"font-size: 12pt; color: rgb(28, 30, 33); background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">&nbsp;</span><span style=\"font-size: 12pt;\">Ο Πέτρος Κακολύρης ανέλαβε την επιμέλεια\nτης έκδοσης, η&nbsp;Μαρώ Τριανταφύλλου τη φιλολογική επιμέλεια, η Κατερίνα\nΧαραλαμπίδου την εικαστική επιμέλεια/σελιδοποίηση, ο Γιώργος Κολιός το\nεικαστικό στο εξώφυλλο.</span></p>', '<h2>Αγορά</h2>\n<div style=\"display:block;float: left;position: relative;height: 17%;margin: 0 1% 10px 0px;border: 1px solid #c7c7c7;padding: 1%;height: auto;-moz-box-shadow: 4px -1px 17px -5px rgba(0,0,0,0.2);box-shadow: 4px -1px 17px -5px rgba(0,0,0,0.2);\"><a target=\"_blank\" href=\"https://www.politeianet.gr/books/9786185162719-drosakis-nikos-eumaros-egkleismos-oneirou-313507\">\n<img style=\"height: 150px;max-width: 100%;padding: 5px;width: auto;\" src=\"/media/politeia.jpg\">\n</a></div>\n\n<div style=\"display:block;float: left;position: relative;width: auto;margin: 0 1% 10px 0px;border: 1px solid #c7c7c7;padding: 1%;-webkit-box-shadow: 4px -1px 17px -5px rgba(0,0,0,0.2);-moz-box-shadow: 4px -1px 17px -5px rgba(0,0,0,0.2);box-shadow: 4px -1px 17px -5px rgba(0,0,0,0.2);\">\n<a target=\"_blank\" href=\"https://www.ianos.gr/egklismos-onirou-0499513\">\n<img style=\"height:150px;max-width: 100%;padding: 5px;\" src=\"/media/ianos.jpg\" alt=\"Ianos\">\n</a>\n</div>\n\n<div style=\"display:block;float: left;position: relative;width: 17%;margin: 0 1% 10px 0px;border: 1px solid #c7c7c7;padding: 1%;width: auto;/* border-radius: 0 23px 0 0; */-webkit-box-shadow: 4px -1px 17px -5px rgba(0,0,0,0.2);-moz-box-shadow: 4px -1px 17px -5px rgba(0,0,0,0.2);box-shadow: 4px -1px 17px -5px rgba(0,0,0,0.2);\">\n<a target=\"_blank\" href=\"https://www.greekbooks.gr/egkleismos-oneiroy.html\">\n<img style=\"height:150px;max-width: 100%;padding: 5px;\" src=\"/media/greekbooks.jpg\" alt=\"greekbooks\">\n</a>\n</div>\n\n<div style=\"display:block;float: left;position: relative;width: auto;margin: 0 1% 10px 0px;border: 1px solid #c7c7c7;padding: 1%;-webkit-box-shadow: 4px -1px 17px -5px rgba(0,0,0,0.2);-moz-box-shadow: 4px -1px 17px -5px rgba(0,0,0,0.2);box-shadow: 4px -1px 17px -5px rgba(0,0,0,0.2);\">\n<a target=\"_blank\" href=\"https://akybernitespoliteies.org/book/%CE%B5%CE%B3%CE%BA%CE%BB%CE%B5%CE%B9%CF%83%CE%BC%CE%BF%CF%83-%CE%BF%CE%BD%CE%B5%CE%B9%CF%81%CE%BF%CF%85\">\n<img style=\"height:150px;max-width: 100%;padding: 5px;\" src=\"/media/akivernites.jpg\" alt=\"Ακυβέρνητες Πολιτείες\">\n</a>\n</div>\n\n<div style=\"display:block;float: left;position: relative;width: auto;margin: 0 1% 10px 0px;border: 1px solid #c7c7c7;padding: 1%;-webkit-box-shadow: 4px -1px 17px -5px rgba(0,0,0,0.2);-moz-box-shadow: 4px -1px 17px -5px rgba(0,0,0,0.2);box-shadow: 4px -1px 17px -5px rgba(0,0,0,0.2);\">\n<a target=\"_blank\" href=\"https://www.protoporia.gr/drosakhs-nikos-egkleismos-oneiroy-9786185162719.html\">\n<img style=\"height:150px;max-width: 100%;padding: 5px;\" src=\"/media/protoporia.png\" alt=\"Πρωτοπορία\">\n</a>\n</div>\n\n<div style=\"display:block;float: left;position: relative;width: auto;margin: 0 1% 10px 0px;border: 1px solid #c7c7c7;padding: 1%;-webkit-box-shadow: 4px -1px 17px -5px rgba(0,0,0,0.2);-moz-box-shadow: 4px -1px 17px -5px rgba(0,0,0,0.2);box-shadow: 4px -1px 17px -5px rgba(0,0,0,0.2);\">\n<a target=\"_blank\" href=\"https://www.e-shop.gr/egkleismos-oneiroy-p-BKS.1036074\">\n<img style=\"height:150px;max-width: 100%;padding: 5px;\" src=\"/media/eshopgr.jpg\" alt=\"Eshop.gr\">\n</a>\n</div>\n<br>\n<hr>\n<h2 style=\"clear:both\">Δημοσιεύματα</h2>\n<div style=\"display:block;float: left;position: relative;height: 17%;margin: 0 1% 10px 0px;border: 1px solid #c7c7c7;padding: 1%;height: auto;-moz-box-shadow: 4px -1px 17px -5px rgba(0,0,0,0.2);box-shadow: 4px -1px 17px -5px rgba(0,0,0,0.2);\"><a target=\"_blank\" href=\"https://thebook.gr/nikos-drosakis-egkleismos-oneirou-apo-tis-ekdoseis-evmaros/\">\n<img style=\"height: 150px;max-width: 100%;padding: 5px;width: auto;\" src=\"/media/thebookgr.gif\" alt=\"thebookgr\">\n</a></div>\n\n<div style=\"display:block;float: left;position: relative;width: auto;margin: 0 1% 10px 0px;border: 1px solid #c7c7c7;padding: 1%;-webkit-box-shadow: 4px -1px 17px -5px rgba(0,0,0,0.2);-moz-box-shadow: 4px -1px 17px -5px rgba(0,0,0,0.2);box-shadow: 4px -1px 17px -5px rgba(0,0,0,0.2);\">\n<a target=\"_blank\" href=\"http://www.periou.gr/%CE%BD%CE%AF%CE%BA%CE%BF%CF%82-%CE%B4%CF%81%CE%BF%CF%83%CE%AC%CE%BA%CE%B7%CF%82-%CE%B5%CE%B3%CE%BA%CE%BB%CE%B5%CE%B9%CF%83%CE%BC%CF%8C%CF%82-%CE%BF%CE%BD%CE%B5%CE%AF%CF%81%CE%BF%CF%85-%CE%B5%CE%BA/\">\n<img style=\"height:150px;max-width: 100%;padding: 5px;\" src=\"/media/periou.jpg\" alt=\"Περι ου\">\n</a>\n</div>\n\n<div style=\"display:block;float: left;position: relative;width: 17%;margin: 0 1% 10px 0px;border: 1px solid #c7c7c7;padding: 1%;width: auto;/* border-radius: 0 23px 0 0; */-webkit-box-shadow: 4px -1px 17px -5px rgba(0,0,0,0.2);-moz-box-shadow: 4px -1px 17px -5px rgba(0,0,0,0.2);box-shadow: 4px -1px 17px -5px rgba(0,0,0,0.2);\">\n<a target=\"_blank\" href=\"https://www.fractalart.gr/egkleismos-oneiroy/\">\n<img style=\"height:150px;max-width: 100%;padding: 5px;\" src=\"/media/fractal.jpg\" alt=\"fractal\">\n</a>\n</div>\n\n<div style=\"display:block;float: left;position: relative;width: auto;margin: 0 1% 10px 0px;border: 1px solid #c7c7c7;padding: 1%;-webkit-box-shadow: 4px -1px 17px -5px rgba(0,0,0,0.2);-moz-box-shadow: 4px -1px 17px -5px rgba(0,0,0,0.2);box-shadow: 4px -1px 17px -5px rgba(0,0,0,0.2);\">\n<a target=\"_blank\" href=\"https://www.polismagazino.gr/%CE%B5%CE%B3%CE%BA%CE%BB%CE%B5%CE%B9%CF%83%CE%BC%CF%8C%CF%82-%CE%BF%CE%BD%CE%B5%CE%AF%CF%81%CE%BF%CF%85-%CE%BD%CE%AD%CE%B1-%CF%80%CE%BF%CE%B9%CE%B7%CF%84%CE%B9%CE%BA%CE%AE-%CF%83%CF%85%CE%BB%CE%BB/\">\n<img style=\"height:150px;max-width: 100%;padding: 5px;\" src=\"/media/polismagazino.png\" alt=\"Polis magazino\">\n</a>\n</div>', 7, 2, 1, NULL, NULL, NULL, 1605776693, 1606299759, 0),
(24, 1, 37, '\'[]\'', 'enipnia-zoni', '20.jpg', 'στην ενύπνια ζώνη', '', '<p>όνειρο μου τον πόθο βεβαίωσε | καθώς τα βλέφαρα με αγωνία σφαλίζεις | καλειδοσκόπιο αισθήσεων από άγνωρα σημεία προβάλλει | κύματα πελώρια στα νώτα σου ορθώνονται, πέφτεις | σ’ άδεια πόλη ή στο πλήθος απεγνωσμένα αποζητάς | να με βρεις | στην ενύπνια ζώνη που κυκλοφορείς ακόμα ελεύθερη<br></p>', '<img src=\"https://nikosdrosakis.gr/media/20.jpg\" style=\"width: 100%;\">', 'στην ενύπνια ζώνη', '', 'όνειρο μου τον πόθο βεβαίωσε | καθώς τα βλέφαρα με αγωνία σφαλίζεις | καλειδοσκόπιο αισθήσεων από άγνωρα σημεία προβάλλει | κύματα πελώρια στα νώτα σου ορθώνονται, πέφτεις | σ’ άδεια πόλη ή στο πλήθος απεγνωσμένα αποζητάς | να με βρεις | στην ενύπνια ζώνη που κυκλοφορείς ακόμα ελεύθερη', '<img src=\"https://nikosdrosakis.gr/media/20.jpg\" style=\"width: 100%;\">', '', '', 20, 1, 1, NULL, NULL, NULL, 1606211935, 1606295520, 0),
(25, 1, 37, '\'[]\'', 'parapera', '21.jpg', 'παραπέρα', 'Νίκος Δροσάκης, Π.Φάληρο 22 Νοεμβρίου 2020 (21)', '<p>έλα να πάμε τη ζωή μας παραπέρα| την κάμαρα να φτιάξουμε το σήμερα να ευδοκιμεί | τώρα είναι η στιγμή | κι αλίμονο να ρθει η στγμή και σε βρει να κοιμάσαι | στους καναπέδες να χαϊδεύεσαι σα γάτα περσική | Άφησε τα ναρκωτικά, τις κουδουνίστρες και τις κούκλες | και στα κοινωνικά δίχτυα μην τελματώνεις τον ψευδή εαυτό | - οι ταριχεύσεις για τις μούμιες, τα μνημόσυνα για τους νεκρούς | το πλήθος το πλήθος θ’ άγουν οι πολιτικοί, οι στρατιώτες θα υπακούν | οι αυλοκόλακες θα υποκλίνονται, οι συβαρίτες θα μεθοκοπούν | κι εμείς έχουμε τη δική μας τέχνη, κυρίως τη δική μας κεφαλή<br></p>', '', 'παραπέρα', 'Νίκος Δροσάκης, Π.Φάληρο 22 Νοεμβρίου 2020 (21)', '<p>έλα να πάμε τη ζωή μας παραπέρα| την κάμαρα να φτιάξουμε το σήμερα να ευδοκιμεί | τώρα είναι η στιγμή | κι αλίμονο να ρθει η στγμή και σε βρει να κοιμάσαι | στους καναπέδες να χαϊδεύεσαι σα γάτα περσική | Άφησε τα ναρκωτικά, τις κουδουνίστρες και τις κούκλες | και στα κοινωνικά δίχτυα μην τελματώνεις τον ψευδή εαυτό | - οι ταριχεύσεις για τις μούμιες, τα μνημόσυνα για τους νεκρούς | το πλήθος το πλήθος θ’ άγουν οι πολιτικοί, οι στρατιώτες θα υπακούν | οι αυλοκόλακες θα υποκλίνονται, οι συβαρίτες θα μεθοκοπούν | κι εμείς έχουμε τη δική μας τέχνη, κυρίως τη δική μας κεφαλή</p>', '<img src=\"https://nikosdrosakis.gr/media/21.jpg\" style=\"width: 100%;\">', '<img src=\"https://nikosdrosakis.gr/media/21.jpg\" style=\"width: 100%;\">', '', 21, 1, 1, NULL, NULL, NULL, 1606216081, 1606299769, 0),
(27, 1, 1, '\'[]\'', 'anipomoni', '15.jpg', 'αν-υπο-μονη', 'Π.Φάληρο 17 Σεπτεμβρίου 2020 (15)', '%3Cp%3E%CE%91%CF%80%CF%8C%20%CF%84%CE%B7%20%CF%83%CF%85%CE%BB%CE%BB%CE%BF%CE%B3%CE%AE%20%22%CE%A0%CE%B1%CF%81%CE%B1%CF%80%CE%AD%CF%81%CE%B1%22%3C%2Fp%3E', '<img src=\"https://nikosdrosakis.gr/media/15.jpg\" style=\"width: 100%;\">', 'αν-υπο-μονη', 'Π.Φάληρο 17 Σεπτεμβρίου 2020 (15)', '', '<img src=\"https://nikosdrosakis.gr/media/15.jpg\" style=\"width: 100%;\">', '', '', 2, 0, 1, NULL, NULL, NULL, 1606431200, 1606431224, 0);

-- --------------------------------------------------------

--
-- Table structure for table `postgrp`
--

DROP TABLE IF EXISTS `postgrp`;
CREATE TABLE `postgrp` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(300) NOT NULL,
  `img` varchar(200) DEFAULT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- RELATIONSHIPS FOR TABLE `postgrp`:
--

--
-- Dumping data for table `postgrp`
--

INSERT INTO `postgrp` (`id`, `name`, `img`, `status`) VALUES
(1, 'article', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tax`
--

DROP TABLE IF EXISTS `tax`;
CREATE TABLE `tax` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `img` varchar(300) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `taxgrpid` tinyint(3) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- RELATIONSHIPS FOR TABLE `tax`:
--   `taxgrpid`
--       `taxgrp` -> `id`
--

--
-- Dumping data for table `tax`
--

INSERT INTO `tax` (`id`, `parent`, `img`, `name`, `taxgrpid`) VALUES
(1, 0, NULL, 'artistic', 1),
(34, 0, NULL, 'programming', 1),
(35, 0, NULL, 'tag1', 2),
(36, 0, NULL, 'tag2', 2),
(37, 1, NULL, 'poetry', 1),
(38, 1, NULL, 'theatre', 1),
(39, 1, NULL, 'film', 1),
(40, 0, NULL, 'parapera', 2);

-- --------------------------------------------------------

--
-- Table structure for table `taxgrp`
--

DROP TABLE IF EXISTS `taxgrp`;
CREATE TABLE `taxgrp` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(40) NOT NULL,
  `img` varchar(200) DEFAULT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `parenting` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `multiple` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- RELATIONSHIPS FOR TABLE `taxgrp`:
--

--
-- Dumping data for table `taxgrp`
--

INSERT INTO `taxgrp` (`id`, `name`, `img`, `status`, `parenting`, `multiple`) VALUES
(1, 'artistic', NULL, 1, 1, 0),
(2, 'tags', NULL, 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'auto',
  `grp` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'select-usergrps',
  `img` varchar(100) DEFAULT NULL COMMENT 'img-upload',
  `name` varchar(100) DEFAULT NULL COMMENT 'text',
  `pass` varchar(100) DEFAULT NULL COMMENT 'hidden-password',
  `firstname` varchar(100) DEFAULT NULL COMMENT 'text',
  `lastname` varchar(100) DEFAULT NULL COMMENT 'text',
  `title` varchar(300) DEFAULT NULL COMMENT 'text',
  `content` text DEFAULT NULL COMMENT 'textarea-editor',
  `url` varchar(100) DEFAULT NULL COMMENT 'text',
  `mail` varchar(100) DEFAULT NULL COMMENT 'text',
  `city` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'text',
  `tel` text DEFAULT NULL COMMENT 'text',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'select-status',
  `phase` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'select-phase',
  `lang` char(2) NOT NULL DEFAULT 'en' COMMENT 'select-global',
  `auth` varchar(50) DEFAULT NULL COMMENT 'text',
  `sp` varchar(100) DEFAULT NULL COMMENT 'hidden',
  `privacy` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'select-privacy',
  `seodescription` text DEFAULT NULL COMMENT 'textarea',
  `seopriority` text DEFAULT NULL COMMENT 'decimal',
  `last_login` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'hidden',
  `registered` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'hidden',
  `modified` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'hidden'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- RELATIONSHIPS FOR TABLE `user`:
--   `grp`
--       `usergrp` -> `id`
--

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `grp`, `img`, `name`, `pass`, `firstname`, `lastname`, `title`, `content`, `url`, `mail`, `city`, `tel`, `status`, `phase`, `lang`, `auth`, `sp`, `privacy`, `seodescription`, `seopriority`, `last_login`, `registered`, `modified`) VALUES
(1, 7, 'nikos (1).jpg', 'nikos', '130177', 'nikos', 'drosakis2', 'artist', '<p>My life in art</p>', 'nikosdrosakis.com', 'nikosdrosakis@gmail.com111', 0, '1116945031693', 2, 2, 'el', '1', '0', 1, '', '1', 1702721246, 1462778828, 1579273898),
(3, 2, NULL, 'newuser1', 'newuser1', 'newuser1', 'newuser1', '', '', '', 'newuser1@gmail.com', 0, 'newuser1', 2, 0, 'en', '1', '0', 1, '', '1.0', 0, 1462778828, 1462778828),
(4, 1, NULL, 'newuser3', 'newuser3', 'newuser3', 'undefined', '', '', '', 'newuser3@gmail.com', 0, 'newuser3', 0, 0, 'en', '1', '0', 1, '', '1.0', 0, 1462779013, 1462779013),
(14, 1, NULL, 'n3', 'n3', 'n3', 'n3', '', '', NULL, 'n3', 0, NULL, 0, 0, 'en', NULL, '0', 1, '', '1.0', 0, 0, 0),
(15, 1, NULL, 'FDSG', 'AFDS', 'ADFS', 'ASDF', '', '', NULL, 'SADF', 0, NULL, 0, 0, 'en', NULL, '0', 1, '', '1.0', 0, 0, 0),
(16, 4, NULL, 'FDSG1', 'AFDS1', 'ADFS1', 'ASDF1', '', '', NULL, 'SADF1', 0, NULL, 0, 0, 'en', NULL, '0', 1, '', '1.0', 0, 0, 0),
(17, 1, NULL, 'user13', 'user13', 'user13', 'user13', '', '', NULL, 'user13', 0, 'user13', 0, 0, 'en', NULL, '0', 1, '', '1.0', 0, 0, 1531422163);

-- --------------------------------------------------------

--
-- Table structure for table `usergrp`
--

DROP TABLE IF EXISTS `usergrp`;
CREATE TABLE `usergrp` (
  `id` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `name` varchar(30) NOT NULL,
  `img` varchar(200) DEFAULT NULL,
  `permissions` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- RELATIONSHIPS FOR TABLE `usergrp`:
--

--
-- Dumping data for table `usergrp`
--

INSERT INTO `usergrp` (`id`, `name`, `img`, `permissions`) VALUES
(1, 'user', NULL, ''),
(2, 'subscriber', NULL, NULL),
(3, 'writer', NULL, '[\"post\", \"media\", \"user\", \"seo\"]'),
(4, 'editor', NULL, '[\"page\",\"post\",\"taxonomy\",\"media\"]'),
(5, 'admin', NULL, '[\"admin\", \"templates\", \"page\", \"post\", \"taxonomy\", \"user\", \"seo\", \"media\", \"local\", \"global\", \"widget\", \"menu\"]'),
(6, 'manager', NULL, '[\"setup\", \"templates\", \"page\", \"widget\", \"menu\", \"post\", \"taxonomy\", \"media\", \"user\", \"seo\", \"global\"]'),
(7, 'developer', NULL, '[\"page\", \"menu\", \"setup\", \"media\", \"user\", \"post\", \"taxonomy\", \"templates\", \"widget\", \"seo\", \"global\"]'),
(8, 'CEO', NULL, '[\"admin\", \"local\", \"media\", \"user\", \"apps\", \"templates\", \"page\", \"post\", \"taxonomy\", \"seo\", \"widget\", \"setup\", \"menu\", \"global\"]');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `globs`
--
ALTER TABLE `globs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_id` (`linksgrpid`);

--
-- Indexes for table `linksgrp`
--
ALTER TABLE `linksgrp`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`),
  ADD UNIQUE KEY `title_2` (`title`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mediagrpid` (`mediagrpid`);

--
-- Indexes for table `mediagrp`
--
ALTER TABLE `mediagrp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `postgrpid` (`postgrpid`);

--
-- Indexes for table `postgrp`
--
ALTER TABLE `postgrp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tax`
--
ALTER TABLE `tax`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`taxgrpid`),
  ADD KEY `group` (`taxgrpid`);

--
-- Indexes for table `taxgrp`
--
ALTER TABLE `taxgrp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `usergroup` (`grp`);

--
-- Indexes for table `usergrp`
--
ALTER TABLE `usergrp`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `globs`
--
ALTER TABLE `globs`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT for table `links`
--
ALTER TABLE `links`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `linksgrp`
--
ALTER TABLE `linksgrp`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `mediagrp`
--
ALTER TABLE `mediagrp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'auto', AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `postgrp`
--
ALTER TABLE `postgrp`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tax`
--
ALTER TABLE `tax`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `taxgrp`
--
ALTER TABLE `taxgrp`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'auto', AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `media_ibfk_1` FOREIGN KEY (`mediagrpid`) REFERENCES `mediagrp` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `post_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tax`
--
ALTER TABLE `tax`
  ADD CONSTRAINT `tax_ibfk_1` FOREIGN KEY (`taxgrpid`) REFERENCES `taxgrp` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`grp`) REFERENCES `usergrp` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;


--
-- Metadata
--
USE `phpmyadmin`;

--
-- Metadata for table comment
--

--
-- Metadata for table globs
--

--
-- Metadata for table links
--

--
-- Metadata for table linksgrp
--

--
-- Metadata for table media
--

--
-- Metadata for table mediagrp
--

--
-- Metadata for table post
--

--
-- Metadata for table postgrp
--

--
-- Metadata for table tax
--

--
-- Metadata for table taxgrp
--

--
-- Metadata for table user
--

--
-- Metadata for table usergrp
--

--
-- Metadata for database ga_model2024
--
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
