-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 20, 2014 at 02:30 PM
-- Server version: 5.5.35
-- PHP Version: 5.4.4-14+deb7u7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cal`
--
CREATE DATABASE `cal` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `cal`;

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE IF NOT EXISTS `appointment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `starttime` datetime NOT NULL,
  `endtime` datetime NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  `responsible_username` varchar(15) NOT NULL,
  `roomnumber` varchar(45) DEFAULT NULL,
  `title` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reservation` (`roomnumber`),
  KEY `responsible` (`responsible_username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=227 ;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`id`, `starttime`, `endtime`, `description`, `location`, `responsible_username`, `roomnumber`, `title`) VALUES
(1, '2014-06-13 12:00:00', '2014-03-21 09:00:00', 'test', 'her', 'petterek', '1a', 'avtale'),
(2, '2014-04-13 12:00:00', '2014-04-13 12:20:00', 'ACCEPTED', 'ACCEPTED', 'sims', '3c', 'avtale'),
(3, '2014-04-13 12:00:00', '2014-04-13 12:20:00', 'ACCEPTED', 'ACCEPTED', 'sims', '1b', 'avtale'),
(9, '3914-07-12 13:14:00', '3914-07-12 14:05:00', 'Slottet', 'Ny ansatte er velkomne. Gratis lunsj', 'sims', '1b', 'avtale'),
(10, '3914-07-12 11:14:00', '3914-07-12 14:00:00', 'Slottet', 'Ny ansatte er velkomne. Gratis lunsj', 'sims', '1a', 'avtale'),
(14, '3914-07-12 14:00:00', '3914-07-12 17:00:00', 'Slottet', 'Ny ansatte er velkomne. Gratis lunsj', 'sims', '1c', 'Velkommen endret'),
(15, '3914-07-12 17:15:00', '3914-07-12 18:00:00', 'Slottet', 'Ny ansatte er velkomne. Gratis lunsj', 'sims', '1c', 'Velkommen endret'),
(16, '3914-07-12 17:25:00', '3914-07-12 18:00:00', 'Slottet', 'Ny ansatte er velkomne. Gratis lunsj', 'sims', '1c', 'Velkommen endret'),
(17, '3914-07-12 17:45:00', '3914-07-12 18:00:00', 'Slottet', 'Ny ansatte er velkomne. Gratis lunsj', 'sims', '1c', 'Velkommen alle sammen'),
(18, '3914-07-12 17:00:00', '3914-07-12 18:00:00', 'Slottet', 'Ny ansatte er velkomne. Gratis lunsj', 'sims', '1c', 'Velkommen no sammen'),
(20, '3914-07-12 16:45:00', '3914-07-12 18:00:00', 'R-bygget', 'Dette skal fungere', 'hacker', '1c', NULL),
(21, '3914-07-12 16:45:00', '3914-07-12 18:00:00', 'R-bygget', 'Dette skal fungere', 'hacker', '1c', NULL),
(22, '2014-03-20 12:00:00', '2014-03-20 13:00:00', 'asd', 'asd', 'oyvind', 'None', 'Tittel'),
(23, '2014-03-21 00:00:00', '2014-03-21 00:00:00', 'DISBETEZT', '1b', 'petterek', '1b', 'MEin'),
(24, '2014-03-20 01:00:00', '2014-03-20 02:00:00', '', '', 'oyvind', 'None', 'FUN'),
(25, '2014-03-15 12:00:00', '2014-03-15 14:00:00', 'MEMEMEME', '3c', '', '3c', 'MEMEME'),
(26, '2014-03-20 01:00:00', '2014-03-20 02:00:00', '', '', 'oyvind', 'None', 'YAW'),
(27, '2014-03-17 10:00:00', '2014-03-17 12:00:00', 'MØT', '1b', 'petterek', '1b', 'Testerrrr'),
(28, '2014-03-21 14:00:00', '2014-03-21 15:00:00', 'asdasdasd', 'asdasdasd', 'oyvind', 'None', 'Oppfinnsomt navn'),
(29, '2014-03-19 00:00:00', '2014-03-19 01:00:00', '', '', 'oyvind', 'None', 'ITS A PARTY IN THE USA!'),
(30, '2014-03-20 17:00:00', '2014-03-20 18:00:00', '', '', 'oyvind', 'None', 'OVERLAP'),
(31, '2014-03-22 12:00:00', '2014-03-22 13:00:00', 'asdasd', 'asdasd', 'oyvind', 'None', 'asdasd'),
(33, '2014-03-22 12:00:00', '2014-03-22 13:00:00', 'awrfawf', 'egegr', '', 'None', 'awrt'),
(34, '2014-03-08 12:00:00', '2014-03-08 13:00:00', 'WEF', 'sdfF', '', 'None', 'wf'),
(35, '2014-03-22 12:00:00', '2014-03-22 13:00:00', 'weqr', 'draerwef', '', 'None', 'hey'),
(36, '2014-03-08 12:00:00', '2014-03-08 13:00:00', 'ef', 'qer', '', 'None', 'j'),
(37, '2014-03-07 12:00:00', '2014-03-07 13:00:00', 'wer', 'wer', '', 'None', 'wrwew'),
(38, '2014-03-21 00:00:00', '2014-03-21 00:00:00', 'df', 'we', '', 'None', 'd'),
(39, '2014-03-13 00:00:00', '2014-03-13 00:00:00', 'fe', 'ef', '', 'None', 'werf'),
(40, '2014-03-13 00:00:00', '2014-03-13 00:00:00', 'werqwe', 'df', '', 'None', 'sdf'),
(41, '2014-03-13 00:00:00', '2014-03-13 00:00:00', 'werqwe', 'df', '', 'None', 'sdf'),
(42, '2014-03-14 00:00:00', '2014-03-14 00:00:00', '', '', '', 'None', 's'),
(43, '2014-03-14 00:00:00', '2014-03-14 00:00:00', '', '', '', 'None', 's'),
(44, '2014-03-15 00:00:00', '2014-03-15 00:00:00', '', '', '', 'None', '3'),
(47, '2014-03-19 17:00:00', '2014-03-19 18:00:00', '', '', 'oyvind', 'None', 'OVERLAP'),
(48, '2014-03-19 17:00:00', '2014-03-19 18:00:00', '', '', 'oyvind', 'None', 'OVERLAP'),
(49, '2014-03-21 00:00:00', '2014-03-21 00:00:00', '', '', '', 'None', 'd'),
(50, '2014-03-19 17:00:00', '2014-03-19 18:00:00', '', '', 'oyvind', 'None', 'OVERLAP'),
(51, '2014-03-19 17:00:00', '2014-03-19 18:00:00', '', '', 'oyvind', 'None', 'OVERLAP'),
(52, '2014-03-20 02:00:00', '2014-03-20 03:00:00', 'help', 'dfdf', 'iver', 'None', 'test1'),
(53, '2014-03-15 00:00:00', '2014-03-15 00:00:00', '', '', '', 'None', 'Datosjekk'),
(54, '2014-03-19 17:00:00', '2014-03-19 18:00:00', '', '', 'oyvind', 'None', 'OVERLAP'),
(55, '2014-03-20 02:00:00', '2014-03-20 03:00:00', 'help', 'dfdf', 'iver', 'None', 'test1'),
(58, '2014-03-14 00:00:00', '2014-03-14 00:00:00', '', '', '', 'None', 'sd'),
(59, '2014-03-14 00:00:00', '2014-03-14 00:00:00', '', '', '', 'None', 'sd'),
(60, '2014-03-14 00:00:00', '2014-03-14 00:00:00', '', '', '', 'None', 'sd'),
(61, '2014-03-14 00:00:00', '2014-03-14 00:00:00', '', '', '', 'None', 'sd'),
(65, '2014-03-20 00:00:00', '2014-03-20 00:00:00', '', '', '', 'None', 'wef'),
(66, '2014-03-20 00:00:00', '2014-03-20 00:00:00', '', '', '', 'None', 'wef'),
(67, '2014-03-20 00:00:00', '2014-03-20 00:00:00', '', '', '', 'None', 'wef'),
(68, '2014-03-20 00:00:00', '2014-03-20 00:00:00', '', '', '', 'None', 'wef'),
(69, '2014-03-20 00:00:00', '2014-03-20 00:00:00', '', '', '', 'None', 'wef'),
(70, '2014-03-20 00:00:00', '2014-03-20 00:00:00', '', '', '', 'None', 'wef'),
(71, '2014-03-20 00:00:00', '2014-03-20 00:00:00', '', '', '', 'None', 'wef'),
(72, '2014-03-20 00:00:00', '2014-03-20 00:00:00', '', '', '', 'None', 'wef'),
(73, '2014-03-20 00:00:00', '2014-03-20 00:00:00', '', '', '', 'None', 'wef'),
(74, '2014-03-20 00:00:00', '2014-03-20 00:00:00', '', '', '', 'None', 'wef'),
(75, '2014-03-20 00:00:00', '2014-03-20 00:00:00', '', '', '', 'None', 'wef'),
(76, '2014-03-20 00:00:00', '2014-03-20 00:00:00', '', '', '', 'None', 'wef'),
(79, '2014-03-14 00:00:00', '2014-03-14 00:00:00', '', '', '', 'None', 'test1'),
(80, '2014-03-14 00:00:00', '2014-03-14 00:00:00', '', '', '', 'None', 'test1'),
(82, '2014-03-14 00:00:00', '2014-03-14 00:00:00', '', '', '', 'None', 'test1'),
(84, '2014-03-31 12:00:00', '2014-03-31 01:40:00', 'Yo', 'Her hos meg', 'toresagen', 'None', 'Mote'),
(85, '2014-03-06 12:00:00', '2014-03-06 13:00:00', '', '3c', '', '3c', 'hei'),
(86, '2014-03-15 00:00:00', '2014-03-15 00:00:00', '', '', '', 'None', 'tesy'),
(88, '2014-03-14 00:00:00', '2014-03-14 00:00:00', '', '', '', 'None', 'er'),
(89, '2012-04-08 00:00:00', '2012-04-08 00:00:00', '', '', '', 'None', '2'),
(90, '2012-04-23 00:00:00', '2012-04-23 00:00:00', '', '', '', 'None', 'sdg'),
(92, '2014-03-21 00:00:00', '2014-03-21 00:00:00', 'Null null null', 'Er romm lik null?', '', 'None', 'Her er det ikke noe rom'),
(94, '2014-03-21 03:00:00', '2014-03-21 04:00:00', '', '1a', 'iver', '1a', 'det lange møtet'),
(97, '2014-03-21 00:00:00', '2014-03-21 00:00:00', '', '', '', 'None', 'hest'),
(99, '2014-03-22 00:00:00', '2014-03-22 12:00:00', '', 'Her', '', 'None', 'hest'),
(101, '2014-03-12 09:00:00', '2014-03-12 10:00:00', '', 'Her', '', 'None', 'hest'),
(102, '2014-03-12 09:00:00', '2014-03-12 10:00:00', 'Her', '', '', 'None', 'hest'),
(107, '2014-03-20 02:00:00', '2014-03-20 03:00:00', '', '', 'oyvind', 'None', 'testist'),
(108, '2014-03-20 02:00:00', '2014-03-20 03:00:00', '', '', 'oyvind', 'None', 'testist'),
(111, '2014-03-21 00:00:00', '2014-03-21 00:00:00', 'Null null null', '2a', '', 'None', 'Her er det '),
(112, '2014-03-17 00:00:00', '2014-03-17 00:00:00', 'Alle i HR er inviterte', '2a', '', '2a', 'Alle i HR'),
(113, '2014-03-17 00:00:00', '2014-03-17 00:00:00', '3c', 'Alle i hr er inviterte', '', 'None', 'Alle i HR'),
(114, '2014-03-25 03:00:00', '2014-03-25 04:00:00', 'testbesk', 'teststed', 'oyvind', 'None', 'test'),
(115, '2014-03-21 12:00:00', '2014-03-21 13:00:00', '', '', 'petterek', 'None', 'ikkememeg'),
(116, '2014-03-21 12:00:00', '2014-03-21 13:00:00', '', '', 'petterek', 'None', 'ikkemedmeg'),
(117, '2014-03-22 00:00:00', '2014-03-22 12:00:00', '', 'Her', '', 'None', 'hest'),
(118, '2014-03-21 00:00:00', '2014-03-21 00:00:00', '', '', '', 'None', 'hest'),
(120, '2014-03-21 00:00:00', '2014-03-21 00:00:00', '', '', '', 'None', 'hest'),
(121, '2014-03-17 00:00:00', '2014-03-17 02:00:00', 'Alle i HR ', '3c', '', '3c', 'Alle i HR 2'),
(122, '2014-03-21 00:00:00', '2014-03-21 00:00:00', '', '', '', 'None', 'hest'),
(123, '2014-03-19 00:00:00', '2014-03-19 00:00:00', '', '2a', '', 'None', 'Hallo?'),
(124, '2014-03-21 00:00:00', '2014-03-21 00:00:00', '', '', '', 'None', 'hest'),
(126, '2014-03-18 00:00:00', '2014-03-18 00:00:00', '', '', '', 'None', 'invitert Oppdatert'),
(127, '2014-03-18 00:00:00', '2014-03-18 00:00:00', '', '', '', 'None', 'invitert'),
(128, '2014-03-22 12:00:00', '2014-03-22 13:00:00', '', '', '', 'None', 'time'),
(129, '2014-03-22 12:00:00', '2014-03-22 13:00:00', '', '', '', 'None', 'time'),
(130, '2014-03-21 10:00:00', '2014-03-21 11:00:00', '', '', 'petterek', 'None', 'inviterte?'),
(131, '2014-03-21 10:00:00', '2014-03-21 11:00:00', '', '', 'petterek', 'None', 'inviterte?'),
(136, '2014-03-08 00:00:00', '2014-03-08 00:00:00', '', '', '', 'None', 'fdg'),
(137, '2014-03-12 00:00:00', '2014-03-12 00:00:00', '', '', '', 'None', 'sonofmybed'),
(138, '2014-03-21 00:00:00', '2014-03-21 00:00:00', '', '', '', 'None', 'invited'),
(139, '2014-03-22 00:00:00', '2014-03-22 00:00:00', '', '', 'petterek', 'None', 'test2'),
(140, '2014-03-19 00:00:00', '2014-03-19 00:00:00', '', '', '', 'None', 'invited'),
(141, '2014-03-19 00:00:00', '2014-03-19 00:00:00', '', '', '', 'None', 'invited'),
(142, '2014-03-22 00:00:00', '2014-03-22 12:00:00', '', 'Her', '', 'None', 'hest'),
(143, '2014-03-22 00:00:00', '2014-03-22 12:00:00', '', 'Her', '', 'None', 'hest'),
(144, '2014-03-20 00:00:00', '2014-03-20 00:00:00', '', '', '', 'None', 'sjekkdizshit'),
(145, '2014-03-20 00:00:00', '2014-03-20 00:00:00', '', '', '', 'None', 'sjekkdizshit'),
(146, '2014-03-18 00:00:00', '2014-03-18 00:00:00', '', '', '', 'None', 'invitert'),
(147, '2014-03-21 00:00:00', '2014-03-21 00:00:00', '', '', 'oyvind', 'None', 'asd'),
(148, '2014-03-21 00:00:00', '2014-03-21 00:00:00', '', '', 'oyvind', 'None', 'asd2'),
(149, '2014-03-24 00:00:00', '2014-03-24 00:00:00', '', '', '', 'None', 'miawf'),
(150, '2014-03-13 00:00:00', '2014-03-13 00:00:00', '', '', '', 'None', 'sadfasf'),
(151, '2014-03-21 08:00:00', '2014-03-21 09:00:00', '', '', '', 'None', 'yoyoyoyo'),
(152, '2014-03-18 00:00:00', '2014-03-18 00:00:00', '', '', 'petterek', 'None', 'HEYHEY'),
(153, '2014-03-21 08:00:00', '2014-03-21 09:00:00', '', '', '', 'None', 'STAHP'),
(155, '2014-03-19 00:00:00', '2014-03-19 00:00:00', '', '', '', 'None', 'mail mote'),
(156, '2014-03-20 02:00:00', '2014-03-20 03:00:00', '', '', 'petterek', 'None', 'test1'),
(157, '2014-03-20 02:00:00', '2014-03-20 03:00:00', '', '', 'petterek', 'None', 'test1'),
(159, '2014-03-21 02:00:00', '2014-03-21 03:00:00', '', '', 'petterek', 'None', 'Test'),
(161, '2014-03-01 00:00:00', '2014-03-01 00:00:00', '', '', 'petterek', 'None', 'test'),
(162, '2014-03-03 00:00:00', '2014-03-03 00:00:00', '', '', 'petterek', 'None', 'TEST1'),
(166, '2014-03-19 06:00:00', '2014-03-19 07:00:00', '', '', '', 'None', 'tiem'),
(167, '2014-03-19 00:00:00', '2014-03-19 00:00:00', 'heisann', 'hei', '', 'None', 'tiem'),
(168, '2014-03-27 00:00:00', '2014-03-27 03:00:00', 'Hei', '2a', '', '2a', 'Ukesmøte'),
(169, '2014-03-21 00:00:00', '2014-03-21 09:00:00', 'Heisann alle', '3c', '', '3c', 'HEST'),
(170, '2014-03-06 00:00:00', '2014-03-06 09:08:00', 'Møte nå', '3c', '', '3c', 'Møte med alle'),
(171, '2014-03-19 04:00:00', '2014-03-19 05:00:00', '', '', 'petterek', 'None', 'copynop'),
(172, '2014-03-17 05:00:00', '2014-03-17 06:00:00', '', '', 'petterek', 'None', 'nopypl0x?'),
(173, '2014-03-17 05:00:00', '2014-03-17 06:00:00', '', '', 'petterek', 'None', 'nopypl0x?'),
(174, '2014-03-31 00:00:00', '2014-03-31 09:06:00', 'Heisann', '2a', '', '2a', 'Møte med nye folk'),
(175, '2014-03-18 01:00:00', '2014-03-18 02:00:00', '', '', 'petterek', 'None', 'coplylox?'),
(176, '2014-03-18 01:00:00', '2014-03-18 02:00:00', '', '', 'petterek', 'None', 'coplylox?'),
(177, '2014-03-18 02:00:00', '2014-03-18 03:00:00', '', '', 'petterek', 'None', 'hawfjawf'),
(178, '2014-03-18 02:00:00', '2014-03-18 03:00:00', '', '', 'petterek', 'None', 'hawfjawf'),
(179, '2014-03-20 05:00:00', '2014-03-20 06:00:00', '', '', '', 'None', 'teaaam'),
(180, '2014-03-20 00:00:00', '2014-03-20 07:00:00', 'Partzy', 'The place', 'toresagen', 'None', 'Fest'),
(181, '2014-03-20 00:00:00', '2014-03-20 07:00:00', 'Partzy', 'The place', 'toresagen', 'None', 'Fest'),
(182, '2014-03-20 00:00:00', '2014-03-20 07:00:00', 'Partzy', 'The place', 'toresagen', 'None', 'Fest'),
(183, '2014-03-20 05:00:00', '2014-03-20 06:00:00', '', '', '', 'None', 'teaaam'),
(184, '2014-03-14 00:00:00', '2014-03-14 00:00:00', 'sdfgsadf', 'sdfgsa', 'toresagen', 'None', 'yo yo yo yo'),
(185, '2014-03-19 11:00:00', '2014-03-19 12:00:00', '', '', 'petterek', 'None', 'test1'),
(186, '2014-03-22 06:00:00', '2014-03-22 07:00:00', '', '', 'iver', 'None', 'YAYAYAYA'),
(187, '2014-03-19 00:00:00', '2014-03-19 23:00:00', 'Yo, ta med masse drikke', 'Slottet', 'toresagen', 'None', 'Fest'),
(188, '2014-03-20 00:00:00', '2014-03-20 00:00:00', '', '', 'petterek', 'None', 'test1'),
(189, '2014-03-20 00:00:00', '2014-03-20 00:00:00', '', '', 'petterek', 'None', 'test2'),
(190, '2014-03-22 06:00:00', '2014-03-22 07:00:00', '', 'None', '', 'None', 'ice-T'),
(191, '2014-03-30 00:00:00', '2014-03-30 00:00:00', 'GETOVERHIER', '', 'petterek', 'None', 'emails'),
(192, '2014-03-18 03:00:00', '2014-03-18 04:00:00', '', '1b', 'iver', '1b', 'MMI'),
(193, '2014-03-28 02:00:00', '2014-03-28 03:00:00', 'GETOVERHIER', '', 'petterek', 'None', 'aqrwf'),
(194, '2014-03-18 03:00:00', '2014-03-18 04:00:00', '', '1b', 'iver', '1b', 'MMI'),
(195, '2014-03-28 02:00:00', '2014-03-28 03:00:00', 'GETOVERHIER', '', 'petterek', 'None', 'emmmaiillss'),
(196, '2014-03-28 02:00:00', '2014-03-28 03:00:00', 'GETOVERHIER', '', 'petterek', 'None', 'emmmaiillss'),
(197, '2014-03-28 02:00:00', '2014-03-28 03:00:00', 'GETOVERHIER', '', 'petterek', 'None', 'emmmaiillss'),
(198, '2014-03-07 00:00:00', '2014-03-07 00:00:00', '', '', 'petterek', 'None', 'werwer'),
(199, '2014-03-18 00:00:00', '2014-03-18 02:00:00', 'komm komm', 'kom komm', 'toresagen', 'None', 'heisann sveisann'),
(200, '2014-03-21 00:00:00', '2014-03-21 00:00:00', '', '', 'petterek', 'None', 'selfie'),
(201, '2014-03-21 07:00:00', '2014-03-21 08:00:00', '', '', 'petterek', 'None', 'selfie'),
(202, '2014-03-21 02:00:00', '2014-03-21 03:00:00', '', '', 'petterek', 'None', 'emailsss'),
(203, '2014-03-27 00:00:00', '2014-03-27 00:00:00', '', '', 'petterek', 'None', 'emaaaaailssss'),
(204, '2014-03-20 08:00:00', '2014-03-20 09:00:00', '', '', 'oyvind', 'None', 'title'),
(205, '3914-07-12 16:45:00', '3914-07-12 18:00:00', 'R-bygget', 'Mail Testing', 'hacker', '1c', 'Mail testing'),
(206, '2014-03-23 05:00:00', '2014-03-23 06:00:00', '', '3c', 'oyvind', 'None', 'testing'),
(207, '2014-03-23 05:00:00', '2014-03-23 06:00:00', '', '3c', 'oyvind', '3c', 'romtest'),
(208, '2014-03-11 04:00:00', '2014-03-11 08:00:00', 'BOLLE', '2a', 'iver', '2a', 'bolle'),
(209, '2014-03-18 10:00:00', '2014-03-18 11:00:00', '', '', 'oyvind', 'None', 'testing'),
(210, '2014-03-22 18:00:00', '2014-03-22 23:59:00', 'Stakkars levra', 'Ivers hule', 'iver', '3c', 'Svin og øl'),
(211, '2014-03-17 04:00:00', '2014-03-17 05:00:00', '2a', 'Jalla balla', 'steinarsagen', 'None', 'Hei bror'),
(212, '2014-03-21 06:00:00', '2014-03-21 07:00:00', '', 'None', '', 'None', '2131'),
(213, '2014-03-19 02:00:00', '2014-03-19 03:00:00', 'eller der', 'her', 'oyvind', 'None', 'Invite test'),
(219, '2014-03-20 00:00:00', '2014-03-20 00:00:00', '', '', 'steinarsagen', 'None', 'MailFail2'),
(220, '2014-03-20 00:00:00', '2014-03-20 00:00:00', 'Heisann', '2a', '', '2a', 'heisann'),
(223, '2014-03-19 05:00:00', '2014-03-19 06:00:00', '', '', 'oyvind', 'None', 'invite 6'),
(224, '2014-03-17 00:00:00', '2014-03-17 00:00:00', '', '', 'steinarsagen', 'None', 'invitation'),
(225, '2014-03-21 12:00:00', '2014-03-21 13:00:00', '<3 MMI', '2a', 'oyvind', '2a', 'MMI'),
(226, '2014-03-21 07:00:00', '2014-03-21 08:00:00', '', '', 'oyvind', 'None', 'invite 7');

-- --------------------------------------------------------

--
-- Table structure for table `group_table`
--

CREATE TABLE IF NOT EXISTS `group_table` (
  `groupname` varchar(15) NOT NULL,
  `parent_groupname` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`groupname`),
  KEY `subgroup` (`parent_groupname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `group_table`
--

INSERT INTO `group_table` (`groupname`, `parent_groupname`) VALUES
('Alle', NULL),
('HR', NULL),
('Kommunikasjon', NULL),
('PR', NULL),
('Sjefer', NULL),
('Slaver', NULL),
('Sleipner', NULL),
('Troll', NULL),
('Vaktmestere', NULL),
('Senior ansatt', 'Faste ansatte'),
('Faste ansatte', 'Troll'),
('Vikarer', 'Troll');

-- --------------------------------------------------------

--
-- Table structure for table `meetingroom`
--

CREATE TABLE IF NOT EXISTS `meetingroom` (
  `roomnumber` varchar(45) NOT NULL,
  `capacity` int(11) NOT NULL,
  PRIMARY KEY (`roomnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `meetingroom`
--

INSERT INTO `meetingroom` (`roomnumber`, `capacity`) VALUES
('1a', 2),
('1b', 5),
('1c', 3),
('2a', 10),
('3c', 7),
('none', 0);

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE IF NOT EXISTS `member` (
  `groupname` varchar(15) NOT NULL,
  `username` varchar(15) NOT NULL,
  PRIMARY KEY (`groupname`,`username`),
  KEY `member_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`groupname`, `username`) VALUES
('HR', '123'),
('Troll', '123'),
('Alle', '1234'),
('HR', '1234'),
('Alle', '444434'),
('Alle', '44444'),
('Alle', 'Det lange navne'),
('HR', 'Det lange navne'),
('Troll', 'Det lange navne'),
('Vikarer', 'Det lange navne'),
('Alle', 'finnen'),
('HR', 'finnen'),
('Alle', 'hacker'),
('HR', 'hacker'),
('Alle', 'iver'),
('Troll', 'iver'),
('Vikarer', 'iver'),
('Alle', 'mongobollefjes'),
('HR', 'mongobollefjes'),
('Alle', 'oyvind'),
('HR', 'oyvind'),
('Alle', 'petterek'),
('Slaver', 'petterek'),
('Alle', 'sims'),
('Sleipner', 'sims'),
('Troll', 'sims'),
('Alle', 'steinarsagen'),
('HR', 'testern2'),
('Alle', 'testuer'),
('Alle', 'TheMainMan'),
('Slaver', 'TheMainMan'),
('Troll', 'TheMainMan'),
('Alle', 'toresagen'),
('Slaver', 'toresagen'),
('Troll', 'toresagen'),
('Alle', 'toretorell'),
('Troll', 'toretorell'),
('Alle', 'yokuhuma'),
('Troll', 'yokuhuma');

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE IF NOT EXISTS `notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(15) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `appointmentId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `belonging_to` (`appointmentId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=30 ;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`id`, `type`, `description`, `appointmentId`) VALUES
(19, 'REMINDER', 'Reminder for ''Velkommen endret'' at 17:15', 15),
(20, 'REMINDER', 'Meeting soon, bitch', 10),
(22, 'REMINDER', 'I hate meetings', 1),
(26, 'NORMAL', 'You have been invited to invite test 2', 1),
(27, 'NORMAL', 'You have been invited to invite4', 1),
(28, 'NORMAL', 'You have been invited to invite5', 1),
(29, 'NORMAL', 'You have been invited to invite 6', 1);

-- --------------------------------------------------------

--
-- Table structure for table `participant`
--

CREATE TABLE IF NOT EXISTS `participant` (
  `username` varchar(45) NOT NULL,
  `id` int(11) NOT NULL,
  `status` varchar(45) DEFAULT NULL,
  `hsidden` tinyint(1) DEFAULT NULL,
  `alarm` int(11) DEFAULT NULL,
  PRIMARY KEY (`username`,`id`),
  KEY `appointment_participant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `participant`
--

INSERT INTO `participant` (`username`, `id`, `status`, `hsidden`, `alarm`) VALUES
('', 85, 'ACCEPTED', 0, 0),
('', 92, 'ACCEPTED', 0, 0),
('', 97, 'ACCEPTED', 0, 0),
('', 99, 'ACCEPTED', 0, 0),
('', 101, 'ACCEPTED', 0, 0),
('', 102, 'INVITED', 0, 0),
('', 111, 'ACCEPTED', 0, 0),
('', 113, 'ACCEPTED', 0, 0),
('', 117, 'ACCEPTED', 0, 0),
('', 118, 'ACCEPTED', 0, 0),
('', 120, 'ACCEPTED', 0, 0),
('', 121, 'ACCEPTED', 0, 0),
('', 122, 'ACCEPTED', 0, 0),
('', 124, 'ACCEPTED', 0, 0),
('', 126, 'ACCEPTED', 0, 0),
('', 127, 'ACCEPTED', 0, 0),
('', 128, 'ACCEPTED', 0, 0),
('', 129, 'ACCEPTED', 0, 0),
('', 136, 'ACCEPTED', 0, 0),
('', 137, 'ACCEPTED', 0, 0),
('', 138, 'ACCEPTED', 0, 0),
('', 140, 'ACCEPTED', 0, 0),
('', 141, 'ACCEPTED', 0, 0),
('', 142, 'ACCEPTED', 0, 0),
('', 143, 'ACCEPTED', 0, 0),
('', 144, 'ACCEPTED', 0, 0),
('', 145, 'ACCEPTED', 0, 0),
('', 146, 'ACCEPTED', 0, 0),
('', 149, 'ACCEPTED', 0, 0),
('', 150, 'ACCEPTED', 0, 0),
('', 151, 'ACCEPTED', 0, 0),
('', 153, 'ACCEPTED', 0, 0),
('', 155, 'ACCEPTED', 0, 0),
('', 166, 'ACCEPTED', 0, 0),
('', 167, 'ACCEPTED', 0, 0),
('', 168, 'ACCEPTED', 0, 0),
('', 169, 'ACCEPTED', 0, 0),
('', 170, 'ACCEPTED', 0, 0),
('', 174, 'ACCEPTED', 0, 0),
('', 179, 'ACCEPTED', 0, 0),
('', 183, 'ACCEPTED', 0, 0),
('', 190, 'ACCEPTED', 0, 0),
('', 212, 'ACCEPTED', 0, 0),
('', 220, 'ACCEPTED', 0, 0),
('123', 15, 'ACCEPTED', 0, 30),
('123', 112, 'INVITED', 0, 0),
('123', 113, 'INVITED', 0, 0),
('123', 120, 'INVITED', 0, 0),
('123', 121, 'INVITED', 0, 0),
('123', 126, 'INVITED', 0, 0),
('123', 204, 'INVITED', 0, 0),
('1234', 112, 'INVITED', 0, 0),
('1234', 113, 'INVITED', 0, 0),
('1234', 121, 'INVITED', 0, 0),
('1234', 126, 'INVITED', 0, 0),
('1234', 208, 'INVITED', 0, 0),
('1234', 220, 'INVITED', 0, 0),
('444434', 208, 'INVITED', 0, 0),
('444434', 220, 'INVITED', 0, 0),
('44444', 208, 'INVITED', 0, 0),
('44444', 220, 'INVITED', 0, 0),
('Det lange navne', 28, 'INVITED', 0, 0),
('Det lange navne', 99, 'INVITED', 0, 0),
('Det lange navne', 112, 'INVITED', 0, 0),
('Det lange navne', 113, 'INVITED', 0, 0),
('Det lange navne', 114, 'INVITED', 0, 0),
('Det lange navne', 121, 'INVITED', 0, 0),
('Det lange navne', 126, 'INVITED', 0, 0),
('Det lange navne', 204, 'INVITED', 0, 0),
('Det lange navne', 208, 'INVITED', 0, 0),
('Det lange navne', 220, 'INVITED', 0, 0),
('finnen', 9, 'INVITED', 0, 0),
('finnen', 15, 'INVITED', 0, 0),
('finnen', 113, 'INVITED', 0, 0),
('finnen', 121, 'INVITED', 0, 0),
('finnen', 126, 'INVITED', 0, 0),
('finnen', 208, 'INVITED', 0, 0),
('finnen', 220, 'INVITED', 0, 0),
('hacker', 84, 'INVITED', 0, 0),
('hacker', 113, 'INVITED', 0, 0),
('hacker', 121, 'INVITED', 0, 0),
('hacker', 126, 'INVITED', 0, 0),
('hacker', 205, 'ACCEPTED', 0, 0),
('hacker', 208, 'INVITED', 0, 0),
('hacker', 220, 'INVITED', 0, 0),
('iver', 1, 'ACCEPTED', 0, 32),
('iver', 9, 'ACCEPTED', 0, 10),
('iver', 15, 'ACCEPTED', 0, 10),
('iver', 16, 'INVITED', 0, 39),
('iver', 52, 'INVITED', 0, 0),
('iver', 94, 'ACCEPTED', 0, 0),
('iver', 114, 'INVITED', 0, 0),
('iver', 169, 'DECLINED', 0, 0),
('iver', 186, 'ACCEPTED', 0, 0),
('iver', 192, 'ACCEPTED', 0, 0),
('iver', 194, 'ACCEPTED', 0, 0),
('iver', 208, 'ACCEPTED', 0, 0),
('iver', 210, 'ACCEPTED', 0, 0),
('iver', 220, 'INVITED', 0, 0),
('iver', 225, 'INVITED', 0, 0),
('mongobollefjes', 112, 'INVITED', 0, 0),
('mongobollefjes', 113, 'INVITED', 0, 0),
('mongobollefjes', 121, 'INVITED', 0, 0),
('mongobollefjes', 126, 'INVITED', 0, 0),
('mongobollefjes', 208, 'INVITED', 0, 0),
('mongobollefjes', 220, 'INVITED', 0, 0),
('oyvind', 25, 'INVITED', 0, 0),
('oyvind', 52, 'INVITED', 0, 0),
('oyvind', 84, 'INVITED', 0, 0),
('oyvind', 94, 'DECLINED', 0, 0),
('oyvind', 107, 'ACCEPTED', 0, 0),
('oyvind', 108, 'ACCEPTED', 0, 0),
('oyvind', 113, 'INVITED', 0, 0),
('oyvind', 114, 'ACCEPTED', 0, 0),
('oyvind', 121, 'INVITED', 0, 0),
('oyvind', 126, 'ACCEPTED', 0, 0),
('oyvind', 147, 'ACCEPTED', 0, 0),
('oyvind', 148, 'ACCEPTED', 0, 0),
('oyvind', 204, 'ACCEPTED', 0, 0),
('oyvind', 206, 'ACCEPTED', 0, 0),
('oyvind', 207, 'ACCEPTED', 0, 0),
('oyvind', 208, 'INVITED', 0, 0),
('oyvind', 209, 'ACCEPTED', 0, 0),
('oyvind', 213, 'ACCEPTED', 0, 0),
('oyvind', 220, 'INVITED', 0, 0),
('oyvind', 223, 'ACCEPTED', 0, 0),
('oyvind', 225, 'ACCEPTED', 0, 0),
('oyvind', 226, 'ACCEPTED', 0, 0),
('petterek', 115, 'ACCEPTED', 0, 0),
('petterek', 116, 'ACCEPTED', 0, 0),
('petterek', 130, 'ACCEPTED', 0, 0),
('petterek', 131, 'ACCEPTED', 0, 0),
('petterek', 139, 'ACCEPTED', 0, 0),
('petterek', 152, 'ACCEPTED', 0, 0),
('petterek', 156, 'ACCEPTED', 0, 0),
('petterek', 157, 'ACCEPTED', 0, 0),
('petterek', 159, 'ACCEPTED', 0, 0),
('petterek', 161, 'ACCEPTED', 0, 0),
('petterek', 162, 'ACCEPTED', 0, 0),
('petterek', 171, 'ACCEPTED', 0, 0),
('petterek', 172, 'ACCEPTED', 0, 0),
('petterek', 173, 'ACCEPTED', 0, 0),
('petterek', 175, 'ACCEPTED', 0, 0),
('petterek', 176, 'ACCEPTED', 0, 0),
('petterek', 177, 'ACCEPTED', 0, 0),
('petterek', 178, 'ACCEPTED', 0, 0),
('petterek', 185, 'ACCEPTED', 0, 0),
('petterek', 188, 'ACCEPTED', 0, 0),
('petterek', 189, 'ACCEPTED', 0, 0),
('petterek', 191, 'ACCEPTED', 0, 0),
('petterek', 193, 'ACCEPTED', 0, 0),
('petterek', 195, 'ACCEPTED', 0, 0),
('petterek', 196, 'ACCEPTED', 0, 0),
('petterek', 197, 'ACCEPTED', 0, 0),
('petterek', 198, 'ACCEPTED', 0, 0),
('petterek', 200, 'ACCEPTED', 0, 0),
('petterek', 201, 'ACCEPTED', 0, 0),
('petterek', 202, 'ACCEPTED', 0, 0),
('petterek', 203, 'ACCEPTED', 0, 0),
('petterek', 208, 'INVITED', 0, 0),
('petterek', 219, 'INVITED', 0, 0),
('petterek', 220, 'INVITED', 0, 0),
('petterek', 224, 'ACCEPTED', 0, 0),
('sims', 1, 'ACCEPTED', 0, 20),
('sims', 10, 'DECLINED', 0, 10),
('sims', 15, 'DECLINED', 0, 10),
('sims', 84, 'INVITED', 0, 0),
('sims', 101, 'INVITED', 0, 0),
('sims', 102, 'INVITED', 0, 0),
('sims', 208, 'INVITED', 0, 0),
('sims', 209, 'INVITED', 0, 0),
('sims', 220, 'INVITED', 0, 0),
('sims', 224, 'ACCEPTED', 0, 0),
('sims1', 15, 'ACCEPTED', 0, 45),
('steinarsagen', 208, 'ACCEPTED', 0, 0),
('steinarsagen', 211, 'ACCEPTED', 0, 0),
('steinarsagen', 219, 'ACCEPTED', 0, 0),
('steinarsagen', 220, 'INVITED', 0, 0),
('steinarsagen', 224, 'ACCEPTED', 0, 0),
('testern2', 28, 'INVITED', 0, 0),
('testern2', 113, 'INVITED', 0, 0),
('testern2', 121, 'INVITED', 0, 0),
('testern2', 126, 'INVITED', 0, 0),
('testuer', 84, 'INVITED', 0, 0),
('testuer', 97, 'INVITED', 0, 0),
('testuer', 126, 'INVITED', 0, 0),
('testuer', 127, 'INVITED', 0, 0),
('testuer', 130, 'INVITED', 0, 0),
('testuer', 140, 'INVITED', 0, 0),
('testuer', 149, 'INVITED', 0, 0),
('testuer', 150, 'INVITED', 0, 0),
('testuer', 208, 'INVITED', 0, 0),
('testuer', 220, 'INVITED', 0, 0),
('TheMainMan', 84, 'INVITED', 0, 0),
('TheMainMan', 99, 'INVITED', 0, 0),
('TheMainMan', 102, 'INVITED', 0, 0),
('TheMainMan', 122, 'INVITED', 0, 0),
('TheMainMan', 140, 'INVITED', 0, 0),
('TheMainMan', 144, 'INVITED', 0, 0),
('TheMainMan', 152, 'INVITED', 0, 0),
('TheMainMan', 204, 'INVITED', 0, 0),
('TheMainMan', 208, 'INVITED', 0, 0),
('TheMainMan', 220, 'INVITED', 0, 0),
('toresagen', 84, 'INVITED', 0, 0),
('toresagen', 102, 'INVITED', 0, 0),
('toresagen', 129, 'INVITED', 0, 0),
('toresagen', 150, 'ACCEPTED', 0, 0),
('toresagen', 180, 'ACCEPTED', 0, 0),
('toresagen', 181, 'ACCEPTED', 0, 0),
('toresagen', 182, 'ACCEPTED', 0, 0),
('toresagen', 184, 'ACCEPTED', 0, 0),
('toresagen', 187, 'ACCEPTED', 0, 0),
('toresagen', 199, 'ACCEPTED', 0, 0),
('toresagen', 200, 'INVITED', 0, 0),
('toresagen', 208, 'HIDDEN', 0, 0),
('toresagen', 209, 'ACCEPTED', 0, 0),
('toresagen', 211, 'ACCEPTED', 0, 0),
('toresagen', 213, 'INVITED', 0, 0),
('toresagen', 220, 'INVITED', 0, 0),
('toresagen', 223, 'INVITED', 0, 0),
('toresagen', 226, 'DECLINED', 0, 0),
('toretorell', 84, 'INVITED', 0, 0),
('toretorell', 97, 'INVITED', 0, 0),
('toretorell', 124, 'INVITED', 0, 0),
('toretorell', 130, 'INVITED', 0, 0),
('toretorell', 131, 'INVITED', 0, 0),
('toretorell', 140, 'INVITED', 0, 0),
('toretorell', 144, 'INVITED', 0, 0),
('toretorell', 208, 'INVITED', 0, 0),
('toretorell', 220, 'INVITED', 0, 0),
('yokuhuma', 200, 'INVITED', 0, 0),
('yokuhuma', 208, 'INVITED', 0, 0),
('yokuhuma', 220, 'INVITED', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `username` varchar(15) NOT NULL,
  `password` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `mail` varchar(45) NOT NULL,
  `phone` char(12) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `password`, `first_name`, `last_name`, `mail`, `phone`) VALUES
('', 'd41d8cd98f00b204e9800998ecf8427e', '', '', '', ''),
('123', '123', '123', '123', '123', '123'),
('1234', '81dc9bdb52d04dc20036dbd8313ed055', '1234', '1234', '1234', '1234'),
('444434', 'e10adc3949ba59abbe56e057f20f883e', 'ivar', 'aasen', 'ivar@aasen.swag', '87654321'),
('44444', 'e10adc3949ba59abbe56e057f20f883e', 'ivar', 'aasen', 'ivar@aasen.swag', '87654321'),
('abc', '900150983cd24fb0d6963f7d28e17f72', 'abc', 'abc', 'abc', '123'),
('Det lange navne', '', 'Lang', 'Navnet', 'Nei takk', '123345'),
('finnen', '6f8ad1ab4f8baa6ebdcbd5f0a1aab558', 'finn', 'kr', 'finn@finn.no', '12345678'),
('hacker', '202cb962ac59075b964b07152d234b70', 'Hack', 'Hackersen', '1337@leet.com', '13375658'),
('iver', '906d0b46c6953f905598aa15308694ad', 'iver', 'egge', 'iver@iegget.com', ''),
('mongobollefjes', '202cb962ac59075b964b07152d234b70', 'Mongo', 'Bollefjes', '1337@leet.com', '13375658'),
('oyvind', '81dc9bdb52d04dc20036dbd8313ed055', 'Øyvind', 'Kjerland', 'oyvind@mail.no', '12345678'),
('petteree', '333', 'Ekern', 'Petter', '123@3333', '345345'),
('petterek', '202cb962ac59075b964b07152d234b70', 'Petter', 'Ekern', '@@@', '23234235'),
('sims', '123', 'Simen', 'Selseng', '123@123.com', '123123123'),
('sims1', '465', '123', '123', '123@123.com', '123345'),
('steinarsagen', '202cb962ac59075b964b07152d234b70', 'Steinar', 'Sagen', 'steinarsagen@mail.com', '14365658'),
('testern', 'gullrot', 'Test', 'Testersen', 'test@test.test', '3333333'),
('testern2', 'gullrot', 'Test', 'Testersen', 'test@test.test', '43327928'),
('testuer', 'user', 'hei', 'sann', 'mail', '1234'),
('TheMainMan', 'e10adc3949ba59abbe56e057f20f883e', 'ivar', 'aasen', 'ivar@aasen.swag', '87654321'),
('toresagen', '202cb962ac59075b964b07152d234b70', 'Tore', 'Sagen', 'toresagen@mail.com', '123123123'),
('toretorell', '202cb962ac59075b964b07152d234b70', 'Tore', 'Torell', 'torell@mail.com', '14365658'),
('yokuhuma', '202cb962ac59075b964b07152d234b70', 'Poke', 'Mon', 'squirt@com.com', '13375658');

-- --------------------------------------------------------

--
-- Table structure for table `user_notification`
--

CREATE TABLE IF NOT EXISTS `user_notification` (
  `notificationId` int(11) NOT NULL,
  `username` varchar(15) NOT NULL,
  PRIMARY KEY (`notificationId`,`username`),
  KEY `user_notification_u` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_notification`
--

INSERT INTO `user_notification` (`notificationId`, `username`) VALUES
(19, '123'),
(20, '123'),
(22, '123'),
(19, 'sims1'),
(22, 'sims1'),
(29, 'toresagen');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `reservation` FOREIGN KEY (`roomnumber`) REFERENCES `meetingroom` (`roomnumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `responsible` FOREIGN KEY (`responsible_username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `group_table`
--
ALTER TABLE `group_table`
  ADD CONSTRAINT `subgroup` FOREIGN KEY (`parent_groupname`) REFERENCES `group_table` (`groupname`) ON UPDATE CASCADE;

--
-- Constraints for table `member`
--
ALTER TABLE `member`
  ADD CONSTRAINT `member_username` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `member_of_group` FOREIGN KEY (`groupname`) REFERENCES `group_table` (`groupname`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `belonging_to` FOREIGN KEY (`appointmentId`) REFERENCES `appointment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `participant`
--
ALTER TABLE `participant`
  ADD CONSTRAINT `user_participant` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appointment_participant` FOREIGN KEY (`id`) REFERENCES `appointment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_notification`
--
ALTER TABLE `user_notification`
  ADD CONSTRAINT `user_notification_n` FOREIGN KEY (`notificationId`) REFERENCES `notification` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_notification_u` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
