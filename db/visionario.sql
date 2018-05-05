-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mag 04, 2018 alle 13:21
-- Versione del server: 10.1.31-MariaDB
-- Versione PHP: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `visionario`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `address`
--

CREATE TABLE `address` (
  `ID` int(11) NOT NULL,
  `User` int(11) NOT NULL,
  `city` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `zip` varchar(5) NOT NULL,
  `phone_number` varchar(12) NOT NULL,
  `province` varchar(2) NOT NULL,
  `consignee` varchar(50) NOT NULL,
  `address_line` int(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `category`
--

CREATE TABLE `category` (
  `ID` int(11) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `color`
--

CREATE TABLE `color` (
  `ID` int(11) NOT NULL,
  `hex` varchar(8) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `coloration`
--

CREATE TABLE `coloration` (
  `Product` int(11) NOT NULL,
  `Color` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `composition`
--

CREATE TABLE `composition` (
  `Product` int(11) NOT NULL,
  `Order_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `image`
--

CREATE TABLE `image` (
  `ID` int(11) NOT NULL,
  `Product` int(11) NOT NULL,
  `path` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `order_table`
--

CREATE TABLE `order_table` (
  `ID` int(11) NOT NULL,
  `total` double NOT NULL,
  `shipping_date` date NOT NULL,
  `ordering_date` date NOT NULL,
  `User` int(11) NOT NULL,
  `delivery_date` date NOT NULL,
  `shipping_fees` double NOT NULL,
  `status` varchar(50) NOT NULL,
  `sign` varchar(70) NOT NULL,
  `payment_method` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `product`
--

CREATE TABLE `product` (
  `ID` int(11) NOT NULL,
  `size` varchar(4) NOT NULL,
  `discount` decimal(8,0) NOT NULL,
  `sold` int(11) NOT NULL,
  `price` decimal(8,0) NOT NULL,
  `weight` double NOT NULL,
  `title` varchar(50) NOT NULL,
  `type` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `available` tinyint(1) NOT NULL,
  `Category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `review`
--

CREATE TABLE `review` (
  `Product` int(11) NOT NULL,
  `User` int(11) NOT NULL,
  `date` date NOT NULL,
  `comment` varchar(100) NOT NULL,
  `score` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `showcase`
--

CREATE TABLE `showcase` (
  `Product` int(11) NOT NULL,
  `top` tinyint(1) NOT NULL,
  `img` varchar(255) NOT NULL,
  `sale` int(11) NOT NULL,
  `path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `user`
--

CREATE TABLE `user` (
  `ID` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `surname` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(30) NOT NULL,
  `sex` varchar(1) NOT NULL,
  `dateo_of_birth` date NOT NULL,
  `permission` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `variable`
--

CREATE TABLE `variable` (
  `ID` int(11) NOT NULL,
  `value` varchar(50) NOT NULL,
  `web_page` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `whishlist`
--

CREATE TABLE `whishlist` (
  `Product` int(11) NOT NULL,
  `User` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `User` (`User`);

--
-- Indici per le tabelle `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `coloration`
--
ALTER TABLE `coloration`
  ADD UNIQUE KEY `Product` (`Product`),
  ADD UNIQUE KEY `Color` (`Color`);

--
-- Indici per le tabelle `composition`
--
ALTER TABLE `composition`
  ADD UNIQUE KEY `Product` (`Product`,`Order_id`);

--
-- Indici per le tabelle `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Product` (`Product`);

--
-- Indici per le tabelle `order_table`
--
ALTER TABLE `order_table`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `User` (`User`);

--
-- Indici per le tabelle `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Category` (`Category`);

--
-- Indici per le tabelle `review`
--
ALTER TABLE `review`
  ADD UNIQUE KEY `Product` (`Product`,`User`);

--
-- Indici per le tabelle `showcase`
--
ALTER TABLE `showcase`
  ADD UNIQUE KEY `Product` (`Product`);

--
-- Indici per le tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `variable`
--
ALTER TABLE `variable`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `whishlist`
--
ALTER TABLE `whishlist`
  ADD UNIQUE KEY `Product` (`Product`,`User`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `product`
--
ALTER TABLE `product`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `user`
--
ALTER TABLE `user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
