-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 04, 2023 at 02:38 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `website_airline`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddFlight` (IN `FLIGHT_ID` INT, IN `GATE` INT, IN `DEPARTURE_TIME` TIME, IN `ARRIVAL_TIME` TIME, IN `AIRCRAFT_SN` INT, IN `DEPARTURE_AIRPORT_CODE` VARCHAR(10), IN `ARRIVAL_AIRPORT_CODE` VARCHAR(10))   BEGIN
    INSERT INTO flight (FLIGHT_ID, GATE, DEPARTURE_TIME, ARRIVAL_TIME, AIRCRAFT_SN,DEPARTURE_AIRPORT_CODE, ARRIVAL_AIRPORT_CODE)
    VALUES (FLIGHT_ID, GATE, DEPARTURE_TIME, ARRIVAL_TIME, AIRCRAFT_SN,DEPARTURE_AIRPORT_CODE, ARRIVAL_AIRPORT_CODE);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CancelReservation` (IN `RESERVATION_ID` INT)   BEGIN
    DELETE FROM reservation WHERE RESERVATION_ID = RESERVATION_ID;
    DELETE FROM ticket WHERE RESERVATION_ID = RESERVATION_ID;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateReservation` (IN `RESERVATION_ID` INT, IN `RESERVATION_DATE` DATE, IN `FLIGHT_ID` INT, IN `PASSPORT_NUMBER` INT)   BEGIN
    INSERT INTO reservation (RESERVATION_ID, RESERVATION_DATE, FLIGHT_ID, PASSPORT_NUMBER)
    VALUES (RESERVATION_ID, RESERVATION_DATE, FLIGHT_ID, PASSPORT_NUMBER);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdatePassengerPhone` (IN `passport_number` INT, IN `NEW_PHONE_NUMBER` VARCHAR(15))   BEGIN
    UPDATE passenger_phone
    SET PHONE_NUMBER = NEW_PHONE_NUMBER
    WHERE passenger_id = passenger_id;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `abdallah_reservation`
-- (See below for the actual view)
--
CREATE TABLE `abdallah_reservation` (
`RESERVATION_ID` int(11)
,`RESERVATION_DATE` date
,`FLIGHT_ID` int(11)
,`PASSPORT_NUMBER` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `aircraft`
--

CREATE TABLE `aircraft` (
  `AIRCRAFT_SN` int(11) NOT NULL,
  `AIRCRAFT_NAME` varchar(15) NOT NULL,
  `CAPACITY` int(11) DEFAULT NULL,
  `MANUFACTURING_COMPANY` varchar(30) DEFAULT NULL,
  `TYPE` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `aircraft`
--

INSERT INTO `aircraft` (`AIRCRAFT_SN`, `AIRCRAFT_NAME`, `CAPACITY`, `MANUFACTURING_COMPANY`, `TYPE`) VALUES
(100170, 'E-JET E170', 70, 'EMBRAER', 'SHORT-TO-MEDIUM'),
(100171, 'E-JET E170', 80, 'EMBRAER', 'SHORT-TO-MEDIUM'),
(100175, 'E-JET E175', 90, 'EMBRAER', 'MEDIUM RANGE CO'),
(100190, 'E-JET E190', 110, 'EMBRAER', 'MEDIUM RANGE CO'),
(300130, 'AIRBUS A330', 440, 'AIRBUS', 'MEDIUM RANGE CO'),
(300180, 'AIRBUS A380', 555, 'AIRBUS', 'LONG RANGE COMM'),
(700137, 'BOEING737', 230, 'THE BOEING COMP', 'SHORT-TO-MEDIUM'),
(700187, 'BOEING787 DREAM', 335, 'THE BOEING COMP', 'LONG RANGE COMM');

-- --------------------------------------------------------

--
-- Table structure for table `airport`
--

CREATE TABLE `airport` (
  `AIRPORT_CODE` varchar(10) NOT NULL,
  `AIRPORT_NAME` varchar(50) NOT NULL,
  `CITY` varchar(15) DEFAULT NULL,
  `COUNTRY` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `airport`
--

INSERT INTO `airport` (`AIRPORT_CODE`, `AIRPORT_NAME`, `CITY`, `COUNTRY`) VALUES
('AMM', 'QUEEN ALIA INTERNATIONAL AIRPORT', 'AMMAN', 'JORDAN'),
('ATH', 'ELEFTHERIOS VENIZELOS AIRPORT', 'ATHENS', 'GREECE'),
('BOS', 'LOGAN INTERNATIONAL AIRPORT', 'BOSTON', 'UNITED STATES'),
('BRU', 'BRUSSELS AIRPORT', 'BRUSSELS', 'BELGIUM'),
('CAI', 'CAIRO INTERNATIONAL AIRPORT', 'CAIRO', 'EGYPT'),
('CDG', 'CHARLES DE GAULLE AIRPORT', 'PARIS', 'FRANCE'),
('CMN', 'MOHAMMED V INTERNATIONAL AIRPORT', 'CASABLANCA', 'MOROCCO'),
('DOH', 'HAMAD INTERNATIONAL AIRPORT', 'DOHA', 'QATAR'),
('DXB', 'DUBAI INTERNATIONAL AIRPORT', 'DUBAI', 'UAE'),
('FCO', 'LEONARDO DA VINCI-FIUMICINO AIRPORT', 'ROME', 'ITALY'),
('IAH', 'GEORGE BUSH INTERCONTINENTAL AIRPORT', 'HOUSTON', 'UNITED STATES'),
('JED', 'KING ABDULAZIZ INTERNATIONAL AIRPORT', 'JEDDAH', 'SAUDI ARABIA'),
('JFK', 'JOHN F. KENNEDY AIRPORT', 'NEW YORK CITY', 'UNITED STATES'),
('LAX', 'LOS ANGELES INTERNATIONAL AIRPORT', 'LOS ANGELES', 'UNITED STATES'),
('LHR', 'LONDON HEATHROW AIRPORT', 'LONDON', 'UNITED KINGDOM'),
('MAD', 'MADRID BARAJAS AIRPORT', 'MADRID', 'SPAIN'),
('RUH', 'KING KHALID INTERNATIONAL AIRPORT', 'RIYADH', 'SAUDI ARABIA'),
('VIE', 'VIENNA INTERNATIONAL AIRPORT', 'VIENNA', 'AUSTRIA'),
('YVR', 'VANCOUVER INTERNATIONAL AIRPORT', 'VANCOUVER', 'CANADA'),
('YYZ', 'TORONTO PEARSON INTERNATIONAL AIRPORT', 'TORONTO', 'CANADA');

-- --------------------------------------------------------

--
-- Table structure for table `flight`
--

CREATE TABLE `flight` (
  `FLIGHT_ID` int(11) NOT NULL,
  `FARE` int(11) DEFAULT NULL,
  `DEPARTURE_TIME` time DEFAULT NULL,
  `ARRIVAL_TIME` time DEFAULT NULL,
  `AIRCRAFT_SN` int(11) NOT NULL,
  `DEPARTURE_AIRPORT_CODE` varchar(10) DEFAULT NULL,
  `ARRIVAL_AIRPORT_CODE` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `flight`
--

INSERT INTO `flight` (`FLIGHT_ID`, `FARE`, `DEPARTURE_TIME`, `ARRIVAL_TIME`, `AIRCRAFT_SN`, `DEPARTURE_AIRPORT_CODE`, `ARRIVAL_AIRPORT_CODE`) VALUES
(1, 800, '18:15:00', '01:50:00', 700187, 'AMM', 'CMN'),
(2, 350, '11:00:00', '13:40:00', 700137, 'AMM', 'RUH'),
(3, 320, '19:00:00', '21:20:00', 700137, 'AMM', 'JED'),
(4, 200, '19:00:00', '21:00:00', 300130, 'AMM', 'CAI'),
(5, 200, '18:00:00', '20:00:00', 300130, 'AMM', 'CAI'),
(6, 470, '18:00:00', '20:50:00', 300130, 'AMM', 'DXB'),
(7, 470, '06:00:00', '08:50:00', 700137, 'AMM', 'DXB'),
(8, 450, '10:00:00', '13:25:00', 700137, 'AMM', 'DOH'),
(9, 450, '22:00:00', '01:25:00', 300180, 'AMM', 'DOH'),
(10, 800, '10:00:00', '07:15:00', 300180, 'AMM', 'CMN'),
(11, 530, '11:15:00', '14:00:00', 700137, 'AMM', 'ATH'),
(12, 530, '21:40:00', '23:25:00', 700137, 'AMM', 'ATH'),
(13, 440, '11:30:00', '15:00:00', 700137, 'AMM', 'FCO'),
(14, 440, '04:00:00', '07:30:00', 700137, 'AMM', 'FCO'),
(15, 680, '03:00:00', '09:30:00', 700187, 'AMM', 'CDG'),
(16, 680, '13:00:00', '20:30:00', 700187, 'AMM', 'CDG'),
(17, 665, '12:00:00', '19:45:00', 300180, 'AMM', 'MAD'),
(18, 665, '00:20:00', '07:25:00', 300180, 'AMM', 'MAD'),
(19, 410, '17:00:00', '23:05:00', 300180, 'AMM', 'LHR'),
(20, 410, '22:30:00', '04:35:00', 300180, 'AMM', 'LHR'),
(21, 390, '02:30:00', '09:30:00', 300180, 'AMM', 'BRU'),
(22, 390, '20:20:00', '03:20:00', 300180, 'AMM', 'BRU'),
(23, 500, '21:10:00', '01:10:00', 300130, 'AMM', 'VIE'),
(24, 500, '06:40:00', '10:40:00', 300130, 'AMM', 'VIE'),
(25, 1120, '01:20:00', '17:00:00', 700187, 'AMM', 'LAX'),
(26, 1270, '07:20:00', '00:00:00', 700187, 'AMM', 'LAX'),
(27, 970, '10:40:00', '22:30:00', 700187, 'AMM', 'JFK'),
(28, 1060, '19:10:00', '11:00:00', 700187, 'AMM', 'JFK'),
(29, 1350, '02:15:00', '22:00:00', 700187, 'AMM', 'IAH'),
(30, 1320, '16:00:00', '10:10:00', 700187, 'AMM', 'IAH'),
(31, 875, '09:20:00', '22:30:00', 700187, 'AMM', 'BOS'),
(32, 1100, '20:00:00', '07:20:00', 700187, 'AMM', 'BOS'),
(33, 1600, '12:00:00', '02:00:00', 700187, 'AMM', 'YVR'),
(34, 2400, '03:00:00', '17:00:00', 700187, 'AMM', 'YVR'),
(35, 1345, '14:15:00', '02:35:00', 700187, 'AMM', 'YYZ'),
(36, 1345, '21:30:00', '09:40:00', 700187, 'AMM', 'YYZ'),
(37, 210, '10:30:00', '12:30:00', 100190, 'FCO', 'ATH'),
(38, 720, '18:15:00', '01:30:00', 700187, 'CMN', 'AMM'),
(39, 345, '11:00:00', '13:40:00', 700137, 'RUH', 'AMM'),
(40, 300, '19:00:00', '21:20:00', 700137, 'JED', 'AMM'),
(41, 300, '07:00:00', '09:20:00', 700137, 'JED', 'AMM'),
(42, 345, '23:00:00', '01:40:00', 700137, 'RUH', 'AMM'),
(43, 150, '19:00:00', '21:00:00', 300130, 'CAI', 'AMM'),
(44, 190, '18:00:00', '20:00:00', 300130, 'CAI', 'AMM'),
(45, 290, '18:00:00', '20:50:00', 300130, 'DXB', 'AMM'),
(46, 370, '06:00:00', '08:50:00', 700137, 'DXB', 'AMM'),
(47, 320, '10:00:00', '13:25:00', 700137, 'DOH', 'AMM'),
(48, 300, '22:00:00', '01:25:00', 300180, 'DOH', 'AMM'),
(49, 650, '10:00:00', '07:15:00', 300180, 'CMN', 'AMM'),
(50, 160, '11:15:00', '14:00:00', 700137, 'ATH', 'AMM'),
(51, 340, '21:40:00', '23:25:00', 700137, 'ATH', 'AMM'),
(52, 60, '11:30:00', '15:00:00', 700137, 'FCO', 'AMM'),
(53, 100, '04:00:00', '07:30:00', 700137, 'FCO', 'AMM'),
(54, 720, '03:00:00', '09:30:00', 700187, 'CDG', 'AMM'),
(55, 510, '13:00:00', '20:30:00', 700187, 'CDG', 'AMM'),
(56, 470, '12:00:00', '19:45:00', 300180, 'MAD', 'AMM'),
(57, 390, '00:20:00', '07:25:00', 300180, 'MAD', 'AMM'),
(58, 299, '17:00:00', '23:05:00', 300180, 'LHR', 'AMM'),
(59, 310, '22:30:00', '04:35:00', 300180, 'LHR', 'AMM'),
(60, 410, '02:30:00', '09:30:00', 300180, 'BRU', 'AMM'),
(61, 280, '20:20:00', '03:20:00', 300180, 'BRU', 'AMM'),
(62, 40, '21:10:00', '01:10:00', 300130, 'VIE', 'AMM'),
(63, 110, '06:40:00', '10:40:00', 300130, 'VIE', 'AMM'),
(64, 990, '01:20:00', '17:00:00', 700187, 'LAX', 'AMM'),
(65, 1250, '07:20:00', '00:00:00', 700187, 'LAX', 'AMM'),
(66, 1150, '10:40:00', '22:30:00', 700187, 'JFK', 'AMM'),
(67, 1300, '19:10:00', '11:00:00', 700187, 'JFK', 'AMM'),
(68, 970, '02:15:00', '22:00:00', 700187, 'IAH', 'AMM'),
(69, 720, '16:00:00', '10:10:00', 700187, 'IAH', 'AMM'),
(70, 1000, '09:20:00', '22:30:00', 700187, 'BOS', 'AMM'),
(71, 1100, '20:00:00', '07:20:00', 700187, 'BOS', 'AMM'),
(72, 1520, '12:00:00', '02:00:00', 700187, 'YVR', 'AMM'),
(73, 1140, '03:00:00', '17:00:00', 700187, 'YVR', 'AMM'),
(74, 880, '14:15:00', '02:35:00', 700187, 'YYZ', 'AMM'),
(75, 1230, '21:30:00', '09:40:00', 700187, 'YYZ', 'AMM'),
(76, 140, '21:00:00', '23:10:00', 100170, 'ATH', 'FCO'),
(77, 170, '21:30:00', '01:40:00', 100190, 'ATH', 'LHR'),
(78, 160, '16:30:00', '20:40:00', 100190, 'ATH', 'VIE'),
(79, 120, '17:30:00', '20:50:00', 100190, 'ATH', 'MAD'),
(80, 200, '15:00:00', '19:40:00', 100190, 'FCO', 'VIE'),
(81, 180, '16:30:00', '19:00:00', 100175, 'FCO', 'LHR'),
(82, 210, '18:20:00', '20:50:00', 100175, 'LHR', 'FCO'),
(83, 140, '16:50:00', '20:40:00', 100175, 'FCO', 'MAD'),
(84, 60, '14:15:00', '15:40:00', 100171, 'CDG', 'MAD'),
(85, 80, '03:00:00', '04:30:00', 100171, 'CDG', 'LHR'),
(86, 95, '00:45:00', '03:00:00', 100190, 'BRU', 'FCO'),
(87, 110, '09:00:00', '11:00:00', 100190, 'VIE', 'ATH'),
(88, 30, '17:00:00', '18:05:00', 100171, 'VIE', 'BRU'),
(89, 75, '19:00:00', '21:15:00', 100171, 'LHR', 'MAD'),
(90, 120, '22:00:00', '00:45:00', 100175, 'MAD', 'VIE'),
(91, 690, '17:00:00', '00:00:00', 700137, 'JFK', 'LAX'),
(92, 710, '10:00:00', '17:00:00', 700137, 'LAX', 'JFK'),
(93, 499, '12:00:00', '16:00:00', 700137, 'JFK', 'IAH'),
(94, 550, '13:00:00', '18:00:00', 700137, 'IAH', 'LAX'),
(95, 800, '21:00:00', '03:00:00', 700137, 'LAX', 'YVR'),
(96, 475, '19:00:00', '00:00:00', 700137, 'YYZ', 'BOS'),
(97, 430, '12:00:00', '19:00:00', 700137, 'JFK', 'CDG'),
(98, 399, '13:00:00', '17:00:00', 700137, 'BOS', 'YVR'),
(99, 399, '12:00:00', '15:00:00', 700137, 'LAX', 'BOS');

-- --------------------------------------------------------

--
-- Stand-in structure for view `gate_flights`
-- (See below for the actual view)
--
CREATE TABLE `gate_flights` (
);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `username`, `password`) VALUES
(1, 'abdallah', '1234'),
(2, 'mohammed', '5678'),
(31, 'alia', '0000'),
(35, 'amer', '2222'),
(37, 'aya', '5555');

-- --------------------------------------------------------

--
-- Table structure for table `passenger`
--

CREATE TABLE `passenger` (
  `PASSPORT_NUMBER` int(11) NOT NULL,
  `FIRST_NAME` varchar(15) DEFAULT NULL,
  `LAST_NAME` varchar(15) DEFAULT NULL,
  `AGE` int(11) DEFAULT NULL,
  `GENDER` enum('M','F') DEFAULT 'M'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `passenger`
--

INSERT INTO `passenger` (`PASSPORT_NUMBER`, `FIRST_NAME`, `LAST_NAME`, `AGE`, `GENDER`) VALUES
(20052005, 'RAMI', 'IBRAHIM', 40, 'M'),
(21220017, 'ABDALLAH', 'ALMUHTASEB', 21, 'M'),
(57312902, 'SARA', 'AHMAD', 25, 'F');

-- --------------------------------------------------------

--
-- Table structure for table `passenger_email`
--

CREATE TABLE `passenger_email` (
  `PASSPORT_NUMBER` int(11) NOT NULL,
  `EMAIL` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `passenger_email`
--

INSERT INTO `passenger_email` (`PASSPORT_NUMBER`, `EMAIL`) VALUES
(20052005, 'RAMIIBRAHIM@GMAIL.COM'),
(20052005, 'RAMIIBRAHIM@HTU.EDU.JO'),
(21220017, '21220017@HTU.EDU.JO'),
(21220017, 'ABDALLAHALMUHTASEB@GMAIL.COM'),
(21220017, 'MR.MUHTASEB02@GMAIL.COM'),
(57312902, 'SARA.AHMAD@GMAIL.COM'),
(57312902, 'SARAAHMAD32@YAHOO.COM'),
(57312902, 'SARAAHMAD@OUTLOOK.COM');

-- --------------------------------------------------------

--
-- Stand-in structure for view `passenger_em_ph`
-- (See below for the actual view)
--
CREATE TABLE `passenger_em_ph` (
`PASSPORT_NUMBER` int(11)
,`FIRST_NAME` varchar(15)
,`LAST_NAME` varchar(15)
,`GENDER` enum('M','F')
,`PHONE_NUMBER` varchar(20)
,`EMAIL` varchar(50)
);

-- --------------------------------------------------------

--
-- Table structure for table `passenger_phone`
--

CREATE TABLE `passenger_phone` (
  `passport_number` int(11) NOT NULL,
  `PHONE_NUMBER` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `passenger_phone`
--

INSERT INTO `passenger_phone` (`passport_number`, `PHONE_NUMBER`) VALUES
(20052005, '962782542136'),
(20052005, '962796225417'),
(21220017, '962775793884'),
(21220017, '962779918918'),
(57312902, '962776971257'),
(57312902, '962782461728');

-- --------------------------------------------------------

--
-- Stand-in structure for view `pas_avg_age`
-- (See below for the actual view)
--
CREATE TABLE `pas_avg_age` (
`AVG (AGE)` decimal(14,4)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `pas_res_flight`
-- (See below for the actual view)
--
CREATE TABLE `pas_res_flight` (
`PASSPORT_NUMBER` int(11)
,`FIRST_NAME` varchar(15)
,`LAST_NAME` varchar(15)
,`AGE` int(11)
,`GENDER` enum('M','F')
,`RESERVATION_ID` int(11)
,`FLIGHT_ID` int(11)
,`DEPARTURE_AIRPORT_CODE` varchar(10)
,`ARRIVAL_AIRPORT_CODE` varchar(10)
);

-- --------------------------------------------------------

--
-- Table structure for table `payment_details`
--

CREATE TABLE `payment_details` (
  `TRANSACTION_ID` int(11) NOT NULL,
  `CARDHOLDER_FNAME` varchar(15) DEFAULT NULL,
  `CARDHOLDER_LNAME` varchar(15) DEFAULT NULL,
  `CARD_NUMBER` varchar(20) NOT NULL,
  `CVC` int(11) DEFAULT NULL,
  `EXP_DATE` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment_details`
--

INSERT INTO `payment_details` (`TRANSACTION_ID`, `CARDHOLDER_FNAME`, `CARDHOLDER_LNAME`, `CARD_NUMBER`, `CVC`, `EXP_DATE`) VALUES
(1, 'ABDALLAH', 'ALMUHTASEB', '43331234567891', 122, '2026-04-16'),
(2, 'RAMI', 'IBRAHIM', '43336262514238', 471, '2025-09-27'),
(3, 'SARA', 'AHMAD', '43337312964383', 397, '2028-11-04');

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `RESERVATION_ID` int(11) NOT NULL,
  `RESERVATION_DATE` date NOT NULL DEFAULT current_timestamp(),
  `FLIGHT_ID` int(11) NOT NULL,
  `PASSPORT_NUMBER` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`RESERVATION_ID`, `RESERVATION_DATE`, `FLIGHT_ID`, `PASSPORT_NUMBER`) VALUES
(1, '2023-09-02', 17, 21220017),
(2, '2023-09-02', 17, 21220017),
(3, '2023-08-27', 11, 20052005),
(4, '2023-09-06', 1, 20052005),
(5, '2023-09-09', 1, 57312902),
(6, '2023-09-20', 2, 57312902);

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `TICKET_ID` int(11) NOT NULL,
  `FARE` int(11) DEFAULT NULL,
  `RESERVATION_ID` int(11) NOT NULL,
  `TRANSACTION_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`TICKET_ID`, `FARE`, `RESERVATION_ID`, `TRANSACTION_ID`) VALUES
(1, 700, 1, 1),
(2, 700, 1, 1),
(3, 700, 1, 1),
(4, 480, 3, 2),
(5, 630, 6, 3),
(6, 630, 6, 3);

-- --------------------------------------------------------

--
-- Structure for view `abdallah_reservation`
--
DROP TABLE IF EXISTS `abdallah_reservation`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `abdallah_reservation`  AS SELECT `reservation`.`RESERVATION_ID` AS `RESERVATION_ID`, `reservation`.`RESERVATION_DATE` AS `RESERVATION_DATE`, `reservation`.`FLIGHT_ID` AS `FLIGHT_ID`, `reservation`.`PASSPORT_NUMBER` AS `PASSPORT_NUMBER` FROM `reservation` WHERE `reservation`.`PASSPORT_NUMBER` = 21220017 ;

-- --------------------------------------------------------

--
-- Structure for view `gate_flights`
--
DROP TABLE IF EXISTS `gate_flights`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `gate_flights`  AS SELECT `flight`.`FLIGHT_ID` AS `FLIGHT_ID`, `flight`.`GATE` AS `GATE`, `flight`.`DEPARTURE_TIME` AS `DEPARTURE_TIME`, `flight`.`ARRIVAL_TIME` AS `ARRIVAL_TIME`, `flight`.`AIRCRAFT_SN` AS `AIRCRAFT_SN`, `flight`.`DEPARTURE_AIRPORT_CODE` AS `DEPARTURE_AIRPORT_CODE`, `flight`.`ARRIVAL_AIRPORT_CODE` AS `ARRIVAL_AIRPORT_CODE` FROM `flight` WHERE `flight`.`GATE` = 1 ORDER BY `flight`.`DEPARTURE_TIME` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `passenger_em_ph`
--
DROP TABLE IF EXISTS `passenger_em_ph`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `passenger_em_ph`  AS SELECT DISTINCT `p`.`PASSPORT_NUMBER` AS `PASSPORT_NUMBER`, `p`.`FIRST_NAME` AS `FIRST_NAME`, `p`.`LAST_NAME` AS `LAST_NAME`, `p`.`GENDER` AS `GENDER`, `pp`.`PHONE_NUMBER` AS `PHONE_NUMBER`, `pe`.`EMAIL` AS `EMAIL` FROM ((`passenger` `p` join `passenger_phone` `pp` on(`pp`.`passport_number` = `p`.`PASSPORT_NUMBER`)) join `passenger_email` `pe` on(`pe`.`PASSPORT_NUMBER` = `p`.`PASSPORT_NUMBER`)) WHERE `p`.`FIRST_NAME` = 'ABDALLAH' ;

-- --------------------------------------------------------

--
-- Structure for view `pas_avg_age`
--
DROP TABLE IF EXISTS `pas_avg_age`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pas_avg_age`  AS SELECT avg(`passenger`.`AGE`) AS `AVG (AGE)` FROM `passenger` ;

-- --------------------------------------------------------

--
-- Structure for view `pas_res_flight`
--
DROP TABLE IF EXISTS `pas_res_flight`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pas_res_flight`  AS SELECT `p`.`PASSPORT_NUMBER` AS `PASSPORT_NUMBER`, `p`.`FIRST_NAME` AS `FIRST_NAME`, `p`.`LAST_NAME` AS `LAST_NAME`, `p`.`AGE` AS `AGE`, `p`.`GENDER` AS `GENDER`, `r`.`RESERVATION_ID` AS `RESERVATION_ID`, `r`.`FLIGHT_ID` AS `FLIGHT_ID`, `f`.`DEPARTURE_AIRPORT_CODE` AS `DEPARTURE_AIRPORT_CODE`, `f`.`ARRIVAL_AIRPORT_CODE` AS `ARRIVAL_AIRPORT_CODE` FROM ((`passenger` `p` join `reservation` `r` on(`r`.`PASSPORT_NUMBER` = `p`.`PASSPORT_NUMBER`)) join `flight` `f` on(`f`.`FLIGHT_ID` = `r`.`FLIGHT_ID`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aircraft`
--
ALTER TABLE `aircraft`
  ADD PRIMARY KEY (`AIRCRAFT_SN`);

--
-- Indexes for table `airport`
--
ALTER TABLE `airport`
  ADD PRIMARY KEY (`AIRPORT_CODE`);

--
-- Indexes for table `flight`
--
ALTER TABLE `flight`
  ADD PRIMARY KEY (`FLIGHT_ID`),
  ADD KEY `FLIGHT_FK1` (`AIRCRAFT_SN`),
  ADD KEY `DEPARTURE_AIRPORT_CODE` (`DEPARTURE_AIRPORT_CODE`),
  ADD KEY `ARRIVAL_AIRPORT_CODE` (`ARRIVAL_AIRPORT_CODE`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `passenger`
--
ALTER TABLE `passenger`
  ADD PRIMARY KEY (`PASSPORT_NUMBER`);

--
-- Indexes for table `passenger_email`
--
ALTER TABLE `passenger_email`
  ADD PRIMARY KEY (`PASSPORT_NUMBER`,`EMAIL`),
  ADD UNIQUE KEY `EMAIL` (`EMAIL`);

--
-- Indexes for table `passenger_phone`
--
ALTER TABLE `passenger_phone`
  ADD PRIMARY KEY (`passport_number`,`PHONE_NUMBER`),
  ADD UNIQUE KEY `phone_number` (`passport_number`,`PHONE_NUMBER`);

--
-- Indexes for table `payment_details`
--
ALTER TABLE `payment_details`
  ADD PRIMARY KEY (`TRANSACTION_ID`),
  ADD UNIQUE KEY `CVC` (`CVC`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`RESERVATION_ID`),
  ADD KEY `RESERVATION_FK1` (`FLIGHT_ID`),
  ADD KEY `RESERVATION_FK2` (`PASSPORT_NUMBER`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`TICKET_ID`),
  ADD KEY `TICKET_FK1` (`RESERVATION_ID`),
  ADD KEY `TICKET_FK2` (`TRANSACTION_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `flight`
--
ALTER TABLE `flight`
  ADD CONSTRAINT `FLIGHT_FK1` FOREIGN KEY (`AIRCRAFT_SN`) REFERENCES `aircraft` (`AIRCRAFT_SN`),
  ADD CONSTRAINT `FLIGHT_FK2` FOREIGN KEY (`DEPARTURE_AIRPORT_CODE`) REFERENCES `airport` (`AIRPORT_CODE`),
  ADD CONSTRAINT `FLIGHT_FK3` FOREIGN KEY (`ARRIVAL_AIRPORT_CODE`) REFERENCES `airport` (`AIRPORT_CODE`),
  ADD CONSTRAINT `flight_ibfk_1` FOREIGN KEY (`DEPARTURE_AIRPORT_CODE`) REFERENCES `airport` (`AIRPORT_CODE`),
  ADD CONSTRAINT `flight_ibfk_2` FOREIGN KEY (`ARRIVAL_AIRPORT_CODE`) REFERENCES `airport` (`AIRPORT_CODE`);

--
-- Constraints for table `passenger_email`
--
ALTER TABLE `passenger_email`
  ADD CONSTRAINT `PE_FK` FOREIGN KEY (`PASSPORT_NUMBER`) REFERENCES `passenger` (`PASSPORT_NUMBER`);

--
-- Constraints for table `passenger_phone`
--
ALTER TABLE `passenger_phone`
  ADD CONSTRAINT `pasph_fk2` FOREIGN KEY (`passport_number`) REFERENCES `passenger` (`PASSPORT_NUMBER`),
  ADD CONSTRAINT `pp_fk` FOREIGN KEY (`passport_number`) REFERENCES `passenger` (`PASSPORT_NUMBER`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `RESERVATION_FK1` FOREIGN KEY (`FLIGHT_ID`) REFERENCES `flight` (`FLIGHT_ID`),
  ADD CONSTRAINT `RESERVATION_FK2` FOREIGN KEY (`PASSPORT_NUMBER`) REFERENCES `passenger` (`PASSPORT_NUMBER`);

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `TICKET_FK1` FOREIGN KEY (`RESERVATION_ID`) REFERENCES `reservation` (`RESERVATION_ID`),
  ADD CONSTRAINT `TICKET_FK2` FOREIGN KEY (`TRANSACTION_ID`) REFERENCES `payment_details` (`TRANSACTION_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
