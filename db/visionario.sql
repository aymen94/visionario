-- Database: VISIONARIO
-- --------------------------------------------------------

CREATE SCHEMA VISIONARIO;

-- Struttura della tabella User

CREATE TABLE VISIONARIO.User (
  id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(20) NOT NULL,
  surname VARCHAR(20),
  email VARCHAR(50) NOT NULL,
  `password` BLOB NOT NULL, -- JArgon2
  sex BIT(1) COMMENT "1->Female 0->Male NULL-> otherwise",
  date_of_birth date NOT NULL,
  permission BIT(1) NOT NULL DEFAULT 0 COMMENT "1->Admin 0->otherwise",
  UNIQUE(email)
);

-- Struttura della tabella Address

CREATE TABLE VISIONARIO.Address (
  id INT UNSIGNED NOT NULL,
  user INT UNSIGNED NOT NULL,
  city VARCHAR(50) NOT NULL,
  country VARCHAR(50) NOT NULL,
  zip CHAR(5) NOT NULL,
  phone_number CHAR(12) NOT NULL,
  province CHAR(2) NOT NULL,
  consignee VARCHAR(50) NOT NULL,
  address_line VARCHAR(70) NOT NULL,
  FOREIGN KEY (user) REFERENCES `User`(id),
  PRIMARY KEY (user,id)
  );

-- Struttura della tabella Category

CREATE TABLE VISIONARIO.Category (
  id TINYINT UNSIGNED PRIMARY KEY,
  `name` VARCHAR(20) NOT NULL
);

-- Struttura della tabella Product

CREATE TABLE VISIONARIO.Product (
  id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  size VARCHAR(4) NOT NULL,
  discounted_price decimal(8,2),
  sold MEDIUMINT UNSIGNED NOT NULL,
  price DECIMAL(8,2) NOT NULL,
  weight MEDIUMINT NOT NULL,
  title VARCHAR(50) NOT NULL,
  `type` VARCHAR(20) NOT NULL,
  description VARCHAR(2048),
  available SMALLINT NOT NULL,
  category TINYINT UNSIGNED NOT NULL,
  FOREIGN KEY (category) REFERENCES Category(id)
);

-- Struttura della tabella Color

CREATE TABLE VISIONARIO.Color (
  id TINYINT UNSIGNED PRIMARY KEY,
  hex CHAR(8) NOT NULL,
  `name` VARCHAR(20) NOT NULL
);

-- Struttura della tabella Coloration

CREATE TABLE VISIONARIO.Coloration (
  product INT UNSIGNED NOT NULL,
  color TINYINT UNSIGNED NOT NULL,
  FOREIGN KEY (product) REFERENCES Product(id),
  FOREIGN KEY (color) REFERENCES Color(id),
  PRIMARY KEY (color, product)
);

-- Struttura della tabella `Order`

CREATE TABLE VISIONARIO.`Order` (
  id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  total DECIMAL(8,2) NOT NULL,
  shipping_date DATE,
  ordering_date DATE,
  delivery_date DATE,
  user INT UNSIGNED NOT NULL,
  shipping_fees DECIMAL(8,2) NOT NULL,
  `status` TINYINT UNSIGNED NOT NULL,
  sign VARCHAR(70),
  payment_method varchar(50),
  FOREIGN KEY (user) REFERENCES User(id)
);

-- Struttura della tabella Composition

CREATE TABLE VISIONARIO.Composition (
  product INT UNSIGNED NOT NULL,
  `order` BIGINT UNSIGNED NOT NULL,
  quantity TINYINT UNSIGNED NOT NULL,
  price DECIMAL(8,2) NOT NULL,
  FOREIGN KEY (`order`) REFERENCES `Order`(id),
  PRIMARY KEY (product, `order`)
);

-- Struttura della tabella Image

CREATE TABLE VISIONARIO.Image (
  id TINYINT UNSIGNED NOT NULL,
  product INT UNSIGNED NOT NULL,
  path VARCHAR(255) NOT NULL,
  FOREIGN KEY (product) REFERENCES Product(id),
  PRIMARY KEY (id,product)
);

-- Struttura della tabella Review

CREATE TABLE VISIONARIO.Review (
  product INT UNSIGNED NOT NULL,
  user INT UNSIGNED NOT NULL,
  `date` DATE NOT NULL,
  `comment` VARCHAR(100) NOT NULL,
  score TINYINT UNSIGNED NOT NULL,
  FOREIGN KEY (product) REFERENCES Product(id),
  FOREIGN KEY (user) REFERENCES `User`(id),
  PRIMARY KEY(product, user)
);

-- Struttura della tabella Showcase

CREATE TABLE VISIONARIO.Showcase (
  product INT UNSIGNED NOT NULL,
  top BIT(1) NOT NULL COMMENT "1->The product should go to carousel 0->Otherwise",
  img VARCHAR(255) NOT NULL,
  sale TINYINT UNSIGNED NOT NULL,
  FOREIGN KEY (product) REFERENCES Product(id)
);

-- Struttura della tabella Variable

CREATE TABLE VISIONARIO.Variable (
  id VARCHAR(10) PRIMARY KEY,
  `value` VARCHAR(50),
  web_page VARCHAR(50) NOT NULL
);

-- Struttura della tabella `Wishlist`

CREATE TABLE VISIONARIO.Wishlist (
  product INT UNSIGNED NOT NULL,
  user INT UNSIGNED NOT NULL,
  FOREIGN KEY (product) REFERENCES Product(id),
  FOREIGN KEY (user) REFERENCES `User`(id),
  PRIMARY KEY (user, product)
);
