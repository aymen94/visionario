-- Database: VISIONARIO
-- --------------------------------------------------------

CREATE SCHEMA VISIONARIO;

-- Struttura della tabella User

CREATE TABLE VISIONARIO.User (
  id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(20) NOT NULL,
  surname VARCHAR(20),
  email VARCHAR(50) NOT NULL,
  `password` BLOB NOT NULL, -- Password Hash
  sex char(1) COMMENT "1->Female 0->Male NULL-> otherwise",
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
  phone_number CHAR(15) NOT NULL,
  province CHAR(2) NOT NULL,
  consignee VARCHAR(50) NOT NULL,
  address_line VARCHAR(70) NOT NULL,
  FOREIGN KEY (user) REFERENCES `User`(id) ON DELETE CASCADE
    ON UPDATE CASCADE,
  PRIMARY KEY (user,id)
  );

-- Struttura della tabella Category

CREATE TABLE VISIONARIO.Category (
  id TINYINT UNSIGNED PRIMARY KEY,
  `name` VARCHAR(30) NOT NULL DEFAULT "ALTRO"
);

-- Struttura della tabella Product

CREATE TABLE VISIONARIO.Product(
  id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(20) NOT NULL,
  FULLTEXT(title),
  description VARCHAR(2048),
  category TINYINT UNSIGNED NOT NULL DEFAULT 0,
  priceMin decimal(8,2) NOT NULL,
  priceMax decimal(8,2) NOT NULL,
  numReviews int(11) NOT NULL,
  gender char(1) NOT NULL,
  FOREIGN KEY (category) REFERENCES Category(id) ON DELETE NO ACTION
    ON UPDATE CASCADE
);

CREATE TABLE VISIONARIO.ProductVariant (
  id TINYINT UNSIGNED AUTO_INCREMENT,
  product INT UNSIGNED NOT NULL,
  size VARCHAR(4) NOT NULL,
  discounted_price decimal(8,2),
  sold MEDIUMINT UNSIGNED NOT NULL DEFAULT 0,
  price DECIMAL(8,2) NOT NULL,
  weight MEDIUMINT NOT NULL,
  available SMALLINT NOT NULL,
  FOREIGN KEY (product) REFERENCES Product(id) ON DELETE CASCADE
    ON UPDATE CASCADE,
  PRIMARY KEY(id, product)
);

-- Struttura della tabella Coloration

CREATE TABLE VISIONARIO.Coloration (
  product INT UNSIGNED NOT NULL,
  variant TINYINT UNSIGNED NOT NULL,
  color VARCHAR(6) NOT NULL,
  FOREIGN KEY (variant,product) REFERENCES ProductVariant(id,product) ON DELETE CASCADE
    ON UPDATE CASCADE,
  PRIMARY KEY (color, product, variant)
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
  variant TINYINT UNSIGNED NOT NULL,
  `order` BIGINT UNSIGNED NOT NULL,
  quantity TINYINT UNSIGNED NOT NULL,
  price DECIMAL(8,2) NOT NULL,
  FOREIGN KEY (product,variant) REFERENCES ProductVariant(product,id) ON DELETE NO ACTION
    ON UPDATE CASCADE,
  FOREIGN KEY (`order`) REFERENCES `Order`(id) ON DELETE CASCADE
    ON UPDATE CASCADE,
  PRIMARY KEY (product, `order`)
);

-- Struttura della tabella Image

CREATE TABLE VISIONARIO.Image (
  product INT UNSIGNED NOT NULL,
  variant TINYINT UNSIGNED NOT NULL,
  path VARCHAR(64) NOT NULL,
  FOREIGN KEY (product,variant) REFERENCES ProductVariant(product,id) ON DELETE CASCADE
    ON UPDATE CASCADE,
  PRIMARY KEY (path,product,variant)
);

-- Struttura della tabella Review

CREATE TABLE VISIONARIO.Review (
  product INT UNSIGNED NOT NULL,
  user INT UNSIGNED NOT NULL,
  `date` DATE NOT NULL,
  `comment` VARCHAR(100) NOT NULL,
  score TINYINT UNSIGNED NOT NULL,
  FOREIGN KEY (product) REFERENCES Product(id) ON DELETE CASCADE
    ON UPDATE CASCADE,
  FOREIGN KEY (user) REFERENCES `User`(id) ON DELETE CASCADE
    ON UPDATE CASCADE,
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
  variant TINYINT UNSIGNED NOT NULL,
  user INT UNSIGNED NOT NULL,
  FOREIGN KEY (product,variant) REFERENCES ProductVariant(product,id) ON DELETE CASCADE
    ON UPDATE CASCADE,
  FOREIGN KEY (user) REFERENCES `User`(id)  ON DELETE CASCADE
    ON UPDATE CASCADE,
  PRIMARY KEY (user, product)
);
# vim: set ts=2 sw=2 ai si et :
