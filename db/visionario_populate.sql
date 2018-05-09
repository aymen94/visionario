--
-- Database: `visionario`
--

-- --------------------------------------------------------

INSERT INTO `address` (`id`, `user`, `city`, `country`, `zip`, `phone_number`, `province`, `consignee`, `address_line`) VALUES
(1, 1, 'Salerno', 'Italy', '84121', '1234567890', 'SA', 'aymen', 'via armadillo 29'),
(2, 2, 'Budapest', 'Hungary', '1901', '0987654321', 'BD', 'ilaria', 'street budapest');

-- --------------------------------------------------------

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'T-Shirt'),
(2, 'Shorts');

-- --------------------------------------------------------

INSERT INTO `color` (`id`, `hex`, `name`) VALUES
(1, '#7fffd4', 'acquamarine'),
(2, '#d2691e', 'chocolate');

-- --------------------------------------------------------

INSERT INTO `coloration` (`product`, `variant`, `color`) VALUES
(1, 1, 1),
(2, 2, 2);

-- --------------------------------------------------------

INSERT INTO `composition` (`product`, `variant`, `order`, `quantity`, `price`) VALUES
(1, 1, 1, 1, '20.99'),
(2, 2, 2, 1, '10.99');

-- --------------------------------------------------------

INSERT INTO `image` (`id`, `product`, `variant`, `path`) VALUES
(1, 1, 1, 'percorso'),
(2, 2, 2, 'percorsoooo');

-- --------------------------------------------------------

INSERT INTO `order` (`id`, `total`, `shipping_date`, `ordering_date`, `delivery_date`, `user`, `shipping_fees`, `status`, `sign`, `payment_method`) VALUES
(1, '20.99', '2018-05-01', '2018-05-02', '2018-05-05', 1, '0.00', 101, 'aymen', 'PayPal 123456'),
(2, '10.99', '2018-04-23', '2018-05-24', '2018-05-27', 2, '3.00', 100, 'ilaria', 'Cash on delivery');

-- --------------------------------------------------------

INSERT INTO `product` (`id`, `title`, `description`, `category`, `priceMin`, `priceMax`, `numReviews`, `gender`) VALUES
(1, 'T-Shirt colmar', 'bella T-shirt', 1, '20.00', '30.00', 1, 'M'),
(2, 'Shorts dolce&gabbana', 'nice shorts', 2, '100.00', '200.00', 10, 'F');

-- --------------------------------------------------------

INSERT INTO `productvariant` (`id`, `product`, `size`, `discounted_price`, `sold`, `price`, `weight`, `available`) VALUES
(1, 1, 'XL', '17.00', 90, '20.00', 200, 9),
(2, 2, 'S', '7.00', 1, '10.00', 500, 100);

-- --------------------------------------------------------

INSERT INTO `review` (`product`, `user`, `date`, `comment`, `score`) VALUES
(1, 2, '2018-05-01', 'bella maglietta', 5),
(2, 2, '2018-04-27', 'bel colore', 4);

-- --------------------------------------------------------

INSERT INTO `showcase` (`product`, `top`, `img`, `sale`) VALUES
(1, b'1', 'immagine t-shirt', 20),
(2, b'0', 'immagine shorts', 0);

-- --------------------------------------------------------

INSERT INTO `user` (`id`, `name`, `surname`, `email`, `password`, `sex`, `date_of_birth`, `permission`) VALUES
(1, 'Aymen', 'Naghmouchi', 'aymen@gmail.com', 0x3132333435363738397364686b6a, 'M', '2018-05-01', b'1'),
(2, 'Ilaria', 'Condizionata', 'ilaria@gmail.com', 0x3132333435363738397364686b6a, 'F', '2018-05-05', b'0');

-- --------------------------------------------------------

INSERT INTO `variable` (`id`, `value`, `web_page`) VALUES
('1', 'commento inutile', 'review'),
('2', 'commento utile', 'showcase');

-- --------------------------------------------------------

INSERT INTO `wishlist` (`product`, `user`) VALUES
(2, 1),
(1, 2);
