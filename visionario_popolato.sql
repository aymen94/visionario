-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mag 08, 2018 alle 13:14
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
  `id` int(10) UNSIGNED NOT NULL,
  `user` int(10) UNSIGNED NOT NULL,
  `city` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `zip` char(5) NOT NULL,
  `phone_number` char(15) NOT NULL,
  `province` char(2) NOT NULL,
  `consignee` varchar(50) NOT NULL,
  `address_line` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `address`
--

INSERT INTO `address` (`id`, `user`, `city`, `country`, `zip`, `phone_number`, `province`, `consignee`, `address_line`) VALUES
(1, 1, 'Salerno', 'Italy', '84121', '1234567890', 'SA', 'aymen', 'via armadillo 29'),
(2, 2, 'Budapest', 'Hungary', '1901', '0987654321', 'BD', 'ilaria', 'street budapest');

-- --------------------------------------------------------

--
-- Struttura della tabella `category`
--

CREATE TABLE `category` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL DEFAULT 'ALTRO'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'T-Shirt'),
(2, 'Shorts');

-- --------------------------------------------------------

--
-- Struttura della tabella `color`
--

CREATE TABLE `color` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `hex` char(8) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `color`
--

INSERT INTO `color` (`id`, `hex`, `name`) VALUES
(1, '#7fffd4', 'acquamarine'),
(2, '#d2691e', 'chocolate');

-- --------------------------------------------------------

--
-- Struttura della tabella `coloration`
--

CREATE TABLE `coloration` (
  `product` int(10) UNSIGNED NOT NULL,
  `variant` int(10) UNSIGNED NOT NULL,
  `color` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `coloration`
--

INSERT INTO `coloration` (`product`, `variant`, `color`) VALUES
(1, 1, 1),
(2, 2, 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `composition`
--

CREATE TABLE `composition` (
  `product` int(10) UNSIGNED NOT NULL,
  `variant` int(10) UNSIGNED NOT NULL,
  `order` bigint(20) UNSIGNED NOT NULL,
  `quantity` tinyint(3) UNSIGNED NOT NULL,
  `price` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `composition`
--

INSERT INTO `composition` (`product`, `variant`, `order`, `quantity`, `price`) VALUES
(1, 1, 1, 1, '20.99'),
(2, 2, 2, 1, '10.99');

-- --------------------------------------------------------

--
-- Struttura della tabella `image`
--

CREATE TABLE `image` (
  `id` int(10) UNSIGNED NOT NULL,
  `product` int(10) UNSIGNED NOT NULL,
  `variant` int(10) UNSIGNED NOT NULL,
  `path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `image`
--

INSERT INTO `image` (`id`, `product`, `variant`, `path`) VALUES
(1, 1, 1, 'percorso'),
(2, 2, 2, 'percorsoooo');

-- --------------------------------------------------------

--
-- Struttura della tabella `order`
--

CREATE TABLE `order` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `total` decimal(8,2) NOT NULL,
  `shipping_date` date DEFAULT NULL,
  `ordering_date` date DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `user` int(10) UNSIGNED NOT NULL,
  `shipping_fees` decimal(8,2) NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `sign` varchar(70) DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `order`
--

INSERT INTO `order` (`id`, `total`, `shipping_date`, `ordering_date`, `delivery_date`, `user`, `shipping_fees`, `status`, `sign`, `payment_method`) VALUES
(1, '20.99', '2018-05-01', '2018-05-02', '2018-05-05', 1, '0.00', 101, 'aymen', 'PayPal 123456'),
(2, '10.99', '2018-04-23', '2018-05-24', '2018-05-27', 2, '3.00', 100, 'ilaria', 'Cash on delivery');

-- --------------------------------------------------------

--
-- Struttura della tabella `product`
--

CREATE TABLE `product` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(2048) DEFAULT NULL,
  `category` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `product`
--

INSERT INTO `product` (`id`, `title`, `description`, `category`) VALUES
(1, 'T-Shirt colmar', 'bella T-shirt', 1),
(2, 'Shorts dolce&gabbana', 'nice shorts', 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `productvariant`
--

CREATE TABLE `productvariant` (
  `id` int(10) UNSIGNED NOT NULL,
  `product` int(10) UNSIGNED NOT NULL,
  `size` varchar(4) NOT NULL,
  `discounted_price` decimal(8,2) DEFAULT NULL,
  `sold` mediumint(8) UNSIGNED NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `weight` mediumint(9) NOT NULL,
  `type` varchar(20) NOT NULL,
  `available` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `productvariant`
--

INSERT INTO `productvariant` (`id`, `product`, `size`, `discounted_price`, `sold`, `price`, `weight`, `type`, `available`) VALUES
(1, 1, 'XL', '17.00', 90, '20.00', 200, 'T-Shirt', 9),
(2, 2, 'S', '7.00', 1, '10.00', 500, 'Shorts', 100);

-- --------------------------------------------------------

--
-- Struttura della tabella `review`
--

CREATE TABLE `review` (
  `product` int(10) UNSIGNED NOT NULL,
  `user` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `comment` varchar(100) NOT NULL,
  `score` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `review`
--

INSERT INTO `review` (`product`, `user`, `date`, `comment`, `score`) VALUES
(1, 2, '2018-05-01', 'bella maglietta', 5),
(2, 2, '2018-04-27', 'bel colore', 4);

-- --------------------------------------------------------

--
-- Struttura della tabella `showcase`
--

CREATE TABLE `showcase` (
  `product` int(10) UNSIGNED NOT NULL,
  `top` bit(1) NOT NULL COMMENT '1->The product should go to carousel 0->Otherwise',
  `img` varchar(255) NOT NULL,
  `sale` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `showcase`
--

INSERT INTO `showcase` (`product`, `top`, `img`, `sale`) VALUES
(1, b'1', 'immagine t-shirt', 20),
(2, b'0', 'immagine shorts', 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `user`
--

CREATE TABLE `user` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `surname` varchar(20) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `password` blob NOT NULL,
  `sex` char(1) DEFAULT NULL,
  `date_of_birth` date NOT NULL,
  `permission` bit(1) NOT NULL DEFAULT b'0' COMMENT '1->Admin 0->otherwise'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `user`
--

INSERT INTO `user` (`id`, `name`, `surname`, `email`, `password`, `sex`, `date_of_birth`, `permission`) VALUES
(1, 'Aymen', 'Naghmouchi', 'aymen@gmail.com', 0x3132333435363738397364686b6a, 'M', '2018-05-01', b'1'),
(2, 'Ilaria', 'Condizionata', 'ilaria@gmail.com', 0x3132333435363738397364686b6a, 'F', '2018-05-05', b'0');

-- --------------------------------------------------------

--
-- Struttura della tabella `variable`
--

CREATE TABLE `variable` (
  `id` varchar(10) NOT NULL,
  `value` varchar(50) DEFAULT NULL,
  `web_page` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `variable`
--

INSERT INTO `variable` (`id`, `value`, `web_page`) VALUES
('1', 'commento inutile', 'review'),
('2', 'commento utile', 'showcase');

-- --------------------------------------------------------

--
-- Struttura della tabella `wishlist`
--

CREATE TABLE `wishlist` (
  `product` int(10) UNSIGNED NOT NULL,
  `user` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `wishlist`
--

INSERT INTO `wishlist` (`product`, `user`) VALUES
(2, 1),
(1, 2);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`user`,`id`);

--
-- Indici per le tabelle `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `coloration`
--
ALTER TABLE `coloration`
  ADD PRIMARY KEY (`color`,`product`),
  ADD KEY `variant` (`variant`,`product`);

--
-- Indici per le tabelle `composition`
--
ALTER TABLE `composition`
  ADD PRIMARY KEY (`product`,`order`),
  ADD KEY `product` (`product`,`variant`),
  ADD KEY `order` (`order`);

--
-- Indici per le tabelle `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`,`product`),
  ADD KEY `product` (`product`,`variant`);

--
-- Indici per le tabelle `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user` (`user`);

--
-- Indici per le tabelle `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category` (`category`);

--
-- Indici per le tabelle `productvariant`
--
ALTER TABLE `productvariant`
  ADD PRIMARY KEY (`id`,`product`),
  ADD KEY `product` (`product`);

--
-- Indici per le tabelle `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`product`,`user`),
  ADD KEY `user` (`user`);

--
-- Indici per le tabelle `showcase`
--
ALTER TABLE `showcase`
  ADD KEY `product` (`product`);

--
-- Indici per le tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indici per le tabelle `variable`
--
ALTER TABLE `variable`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`user`,`product`),
  ADD KEY `product` (`product`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `order`
--
ALTER TABLE `order`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `product`
--
ALTER TABLE `product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `productvariant`
--
ALTER TABLE `productvariant`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `coloration`
--
ALTER TABLE `coloration`
  ADD CONSTRAINT `coloration_ibfk_1` FOREIGN KEY (`variant`,`product`) REFERENCES `productvariant` (`id`, `product`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `coloration_ibfk_2` FOREIGN KEY (`color`) REFERENCES `color` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `composition`
--
ALTER TABLE `composition`
  ADD CONSTRAINT `composition_ibfk_1` FOREIGN KEY (`product`,`variant`) REFERENCES `productvariant` (`product`, `id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `composition_ibfk_2` FOREIGN KEY (`order`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `image_ibfk_1` FOREIGN KEY (`product`,`variant`) REFERENCES `productvariant` (`product`, `id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`user`) REFERENCES `user` (`id`);

--
-- Limiti per la tabella `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Limiti per la tabella `productvariant`
--
ALTER TABLE `productvariant`
  ADD CONSTRAINT `productvariant_ibfk_1` FOREIGN KEY (`product`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`product`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `showcase`
--
ALTER TABLE `showcase`
  ADD CONSTRAINT `showcase_ibfk_1` FOREIGN KEY (`product`) REFERENCES `product` (`id`);

--
-- Limiti per la tabella `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`product`) REFERENCES `productvariant` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
