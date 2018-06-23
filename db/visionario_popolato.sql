--
-- Database: VISIONARIO
--

-- --------------------------------------------------------
INSERT INTO VISIONARIO.`User` (`id`, `name`, `surname`, `email`, `password`, `sex`, `date_of_birth`, `permission`) VALUES
(1, 'Aymen', 'Naghmouchi', 'aymen@gmail.com', 0x3132333435363738397364686b6a, 'M', '2018-05-01', b'1'),
(2, 'Ilaria', 'Roma', 'ilaria@gmail.com', 0x3132333435363738397364686b6a, 'F', '2018-05-05', b'0'),
(3, 'Sandra', 'Caputo', 'sandra@live.it', 0x3132333435363738397364686b6a, 'F', '1990-10-1', b'0'),
(4, 'Salvatore', 'Fasano', 'salvo@hotmail.it', 0x3132333435363738397364686b6a, 'M', '1997-09-20', b'0'),
(5, 'Andrea', 'Mennillo', 'andrea@gmail.com', 0x3132333435363738397364686b6a, 'M', '1997-01-01', b'1'),
(6, 'Christian', 'Gemelli', 'christian@gmail.com', 0x3132333435363738397364686b6a, 'M', '1997-09-07', b'1');

INSERT INTO VISIONARIO.`Address` (`id`, `user`, `city`, `country`, `zip`, `phone_number`, `province`, `consignee`, `address_line`) VALUES
(1, 1, 'Salerno', 'Italy', '84121', '1234567890', 'SA', 'aymen', 'via armadillo 29'),
(2, 2, 'Budapest', 'Hungary', '1901', '0987654321', 'BD', 'ilaria', 'street budapest'),
(3, 3, 'Venezia', 'Italy', '30121', '3586210849', 'VE', 'sandra', 'via dei leoni'),
(4, 4, 'Napoli', 'Italy', '80121', '3309817350', 'NA', 'salvatore', 'via Michelangelo Buonarroti'),
(5, 5, 'Avellino', 'Italy', '83100', '3331295640', 'AV', 'andrea', 'via Pablo Picasso'),
(6, 6, 'Isola di Capo Rizzuto', 'Italy', '88841', '3331257670', 'KR', 'christian', 'via Van Gogh');

-- --------------------------------------------------------

INSERT INTO VISIONARIO.`Category` (`id`, `name`) VALUES
(1, 'T-Shirt'),
(2, 'Shorts'),
(3, 'Polo'),
(4, 'Camicia'),
(5, 'Jeans'),
(6, 'Scarpe'),
(7, 'Abiti e Giacche'),
(8, 'Orologi'),
(9, 'Intimo'),
(10, 'Giolielli');
-- --------------------------------------------------------

INSERT INTO VISIONARIO.`Product` (`id`, `title`, `description`, `category`, `priceMin`, `priceMax`, `numReviews`, `gender`) VALUES
(1, 'T-Shirt Colmar', 'jersey sintetico, logo, fantasia multicolore, collo a polo, maniche corte, chiusura sul fronte, bottoni, senza tasche, elasticizzato, vestibilità ridotta', 1, '65.00', '99.00', 120, 'M'),
(2, 'Shorts Dolce&Gabbana', 'tela, logo, tinta unita basic, vita normale, regular fit, zip e bottoni, multitasche, elasticizzato, pantalone, vestibilità ampia', 2, '90.00', '179.00', 10, 'F'),
(3, 'Polo Harmont&Blaine', 'piqué, senza applicazioni, tinta unita, collo a polo, maniche corte, chiusura sul fronte, bottoni, senza tasche', 3, '20.00', '30.00', 1, 'M'),
(4, 'Camicia Prada', 'tela, senza applicazioni, fantasia geometrica, chiusura sul fronte, bottoni, maniche lunghe, polsini con bottoni, collo classico, senza tasche', 4, '290.00', '340.00', 120, 'M'),
(5, 'Camicia Marni', 'raso, senza applicazioni, a righe, chiusura sul fronte, maniche corte, collo con fiocco, bottoni, senza tasche', 4, '200.00', '270.00', 350, 'F'),
(6, 'Miu Miu', 'raso, strass, tinta unita, fibbia, punta stretta, tacco a rocchetto, interno in pelle, suola di cuoio, contiene parti non tessili di origine animale', 2,'487.00', '550.99', 27, 'F'),
(7, 'Pantaloni Jeans Attico', 'denim, strass, paillettes, tinta unita, lavaggio medio, vita normale, chiusura sul fronte, zip e bottoni, multitasche, gamba a tubo', 5, '190.50', '289.70', 99, 'F'),
(8, 'Giacca Maison Margiela', 'tweed, senza applicazioni, tinta unita basic, multitasche, 3 bottoni, collo con revers, monopetto, maniche lunghe, interno foderato', 7, '260.20', '640.00', 300, 'M'),
(9, 'Espadrillas Dolce&Gabbana', 'gabardine, logo, applicazioni in pelle, a righe, punta tonda, senza tacco, interno in pelle, suola di cuoio e gomma, contiene parti non tessili di origine animale', 6, '220.00', '224.00', 10, 'M'),
(10, 'Polo Ralph Lauren', 'piqué, applicazioni a contrasto, logo, a righe, collo a polo, maniche corte, chiusura sul fronte, bottoni, fondo con spacchetti laterali, elasticizzato, vestibilità ampia', 3, '100.90', '135.39', 77, 'M'),
(11, 'Montblanc Summit Smartwatch Stainless Steel', 'Il primo smartwatch di lusso che unisce gli eleganti codici dell’orologeria svizzera alle tecnologie più avanzate. Design vintage classico ispirato alla pluripremiata collezione Montblanc 1858. Cassa da 46 mm dello spessore di soli 12,5 mm. Cassa, lunetta e corona in acciaio pregiato con finitura satinata e lucida. Vetro zaffiro bombato e antigraffio che copre un display AMOLED con risoluzione 400 x 400 e funzionalità multi-touch. Animato dal sistema Android Wear 2.0 che assicura compatibilità con smartphone iPhone & Android, prestazioni avanzate con processore Qualcomm Snapdragon 2100, facile da usare. Stile personalizzabile grazie ai cinturini facilmente intercambiabili e ai vari quadranti Montblanc. Controllo di tutte le notifiche e dell’agenda a colpo d’occhio e possibilità di rispondere in modalità scritta o vocale. Perfetto per viaggi “smart” grazie alle opzioni di traduzione vocale, navigazione, carta d’imbarco, prenotazione di un servizio taxi o l’impostazione dell’ora globale. Mantenersi in forma è facile con il cardiofrequenzimetro integrato, il barometro per l’altitudine e i sensori di rilevamento. Dotato di app precaricate (Runtastic, Uber e Foursquare) con possibilità di scaricarne altre direttamente dall’orologio via WiFi. Controllo e riproduzione della musica direttamente dal polso, con memoria da 4 GB per scaricare canzoni e ascoltarle in streaming con cuffie Bluetooth. Durata della batteria: un giorno intero, ricaricabile in meno di 2 ore. Impermeabilità IP68 (pioggia, sudorazione, lavaggio delle mani, non adatto a immersioni). Elegante cinturino in caucciù nero con dettagli in acciaio pregiato spazzolato, massima elasticità e vestibilità perfetta per ogni occasione, anche per attività sportive (Larghezza: 22 mm / Lunghezza: 65-170 mm).', 8, '900.00', '945.00', 100, 'M'),
(12, 'Nina Kastens Mini Bean Gold', 'senza applicazioni, senza chiusura', 10, '154,99', '175.10', 354, 'F'),
(13, 'Bracciale Emanuele Bicocchi', 'logo, gancetto', 10, '300.90', '310.99', 700, 'U'),
(14, 'Calzini Paul Smith', 'lavorato a maglia, logo, a righe', 9, '20.00', '25.00', 200, 'M'),
(15, 'Slip Tommy Hilfiger', 'jersey, logo, fantasia multicolore, elasticizzato', 9, '22.99', '25.99', 120, 'M' ),
(16, 'Mocassini Dior Homme', 'pelle martellata, applicazioni in metallo, logo, tinta unita, punta quadrata, senza tacco, interno in pelle, suola con gommini, contiene parti non tessili di origine animale, calzata ampia', 6, '500.00', '550.00', 10, 'M'),
(17, 'Orologio da polso Nixon', 'logo, chiusura con fibbia regolabile, cassa: acciaio inossidabile, cinturino: gomma, water resistant, movimento: digitale', 8, '100.90', '120.00', 90, 'U'),
(18, 'T-shirt Versace', 'jersey, logo, stampa, fantasia multicolore, collo tondo, maniche corte, vestibilità ampia', 1, '250.90', '264.00',100, 'M'),
(19, 'T-shirt N°21 Donna', 'jersey, strass, tinta unita, collo tondo, maniche corte, senza tasche, vestibilità ampia', 1, '96.00', '219.00',50, 'F'),
(20, 'Polo Giorgio Armani', 'piqué, logo, tinta unita, collo a polo, maniche lunghe, chiusura sul fronte, bottoni, senza tasche, fondo con spacchi laterali, contiene parti non tessili di origine animale', 3, '131.00', '269.00', 90, 'M'),
(21, 'T-Shirt Kenzo Bambina', 'jersey, logo, stampa, tinta unita, collo tondo, maniche corte, senza tasche, lavare a 30°, non lavabile a secco, stirare a max 110°, non candeggiare, non asciugare meccanicamente, elasticizzato', 1, '40.00', '43.00', 50, 'K'),
(22, 'T-Shirt Molo Bambino', 'jersey, logo, fantasia multicolore, collo tondo, maniche corte, senza tasche, lavare a 40°, lavabile a secco, stirare a max 150°, non candeggiare, non asciugare meccanicamente', 1, '35.00', '40.00', 10, 'K');
-- --------------0------------------------------------------

INSERT INTO VISIONARIO.`ProductVariant` (`id`, `product`, `size`, `discounted_price`, `sold`, `price`, `weight`, `available`, `color`) VALUES
(1, 1, 'XL', '17.00', 90, '20.00', 200, 9, "blue"),
(1, 2, 'S', '7.00', 1, '10.00', 500, 100, "red"),
(1, 3, 'XXL', '125.00', 22, '135.00', 0.200, 100, "green"),
(1, 4, 'M', '110.00', 10, '135', 0.200, 1, "yellow"),
(1, 5, 'L', '160.00', 100, '260.00', 0.300, 0, "blue"),
(1, 6, 'S', '35.00', 7, '40.00', 0.200, 9, "grey"),
(1, 7, 'XL', '17.00', 90, '20.00', 200, 9, "black"),
(1, 8, 'S', '7.00', 1, '10.00', 500, 100, "white"),
(1, 9, 'XXL', '125.00', 22, '135.00', 0.200, 100, "green"),
(1, 10, 'M', '110.00', 10, '135', 0.200, 1, "pink"),
(1, 11, 'L', '160.00', 100, '260.00', 0.300, 0, "violet"),
(1, 12, 'S', '35.00', 7, '40.00', 0.200, 9, "orange"),
(1, 13, 'XL', '17.00', 90, '20.00', 200, 9, "brown"),
(1, 14, 'S', '7.00', 1, '10.00', 500, 100, "violet"),
(1, 15, 'XXL', '125.00', 22, '135.00', 0.200, 100, "black"),
(1, 16, 'M', '110.00', 10, '135', 0.200, 1, "gold"),
(1, 17, 'L', '160.00', 100, '260.00', 0.300, 0, "silver"),
(1, 18, 'S', '35.00', 7, '40.00', 0.200, 9, "grey"),
(1, 19, 'XL', '17.00', 90, '20.00', 200, 9, "black"),
(1, 20, 'S', '7.00', 1, '10.00', 500, 100, "lemon"),
(1, 21, 'XXL', '125.00', 22, '135.00', 0.200, 100, "grey"),
(1, 22, 'M', '110.00', 10, '135', 0.200, 1, "white"),
(2, 5, 'L', '160.00', 100, '260.00', 0.300, 0, "blue"),
(2, 6, 'S', '35.00', 7, '40.00', 0.200, 9, "skyblue"),
(2, 7, 'XL', '17.00', 90, '20.00', 200, 9, "brown"),
(2, 8, 'S', '7.00', 1, '10.00', 500, 100, "black"),
(2, 9, 'XXL', '125.00', 22, '135.00', 0.200, 100, "white"),
(2, 10, 'M', '110.00', 10, '135', 0.200, 1, "grey"),
(2, 11, 'L', '160.00', 100, '260.00', 0.300, 0, "red"),
(2, 12, 'S', '35.00', 7, '40.00', 0.200, 9, "pink"),
(2, 13, 'XL', '17.00', 90, '20.00', 200, 9, "violet"),
(2, 14, 'S', '7.00', 1, '10.00', 500, 100, "grey"),
(2, 15, 'XXL', '125.00', 22, '135.00', 0.200, 100, "blue"),
(2, 16, 'M', '110.00', 10, '135', 0.200, 1, "sky"),
(2, 17, 'L', '160.00', 100, '260.00', 0.300, 0, "purple"),
(2, 18, 'S', '35.00', 7, '40.00', 0.200, 9, "black")
;

-- --------------------------------------------------------

INSERT INTO VISIONARIO.`Order` (`id`, `total`, `shipping_date`, `ordering_date`, `delivery_date`, `user`, `shipping_fees`, `status`, `sign`, `payment_method`) VALUES
(1, '20.99', '2018-05-01', '2018-05-02', '2018-05-05', 1, '10.00', 101, 'aymen', 'PayPal'),
(2, '10.99', '2018-04-23', '2018-05-24', '2018-05-27', 2, '10.00', 100, 'ilaria', 'Cash on delivery'),
(3, '225.00', '2018-06-19', '2018-06-18', '2018-06-22', 3, '0.00', 101, '', 'Paypal'),
(4, '160.00', '2018-06-20', '2018-06-19', '2018-06-24', 3, '0.00', 100, '', 'Cash on delivery'),
(5, '310.99', '2018-07-01', '2018-06-29', '2018-07-03', 4, '0.00', 100, '', 'PayPal'),
(6, '50.00', '2018-07-01', '2018-06-29', '2018-07-03', 5, '10.00', 100, '', 'PayPal');

-- --------------------------------------------------------

INSERT INTO VISIONARIO.`Composition` (`product`, `variant`, `order`, `quantity`, `price`) VALUES
(1, 1, 1, 1, '20.99'),
(2, 1, 2, 1, '10.99'),
(5, 2, 3, 2, '225.00'),
(22, 1, 6, 1, '50.00');

-- --------------------------------------------------------

INSERT INTO VISIONARIO.`Image` (`product`, `variant`, `path`) VALUES
(1, 1, 'default1.1.jpg'),
(2, 1, 'default2.2.jpg'),
(3, 1, 'default1.1.jpg'),
(4, 1, 'default2.2.jpg'),
(5, 1, 'default1.1.jpg'),
(6, 1, 'default2.2.jpg'),
(7, 1, 'default1.1.jpg'),
(8, 1, 'default2.2.jpg'),
(9, 1, 'default1.1.jpg'),
(10, 1, 'default2.2.jpg'),
(11, 1, 'default1.1.jpg'),
(12, 1, 'default2.2.jpg'),
(13, 1, 'default1.1.jpg'),
(14, 1, 'default2.2.jpg'),
(15, 1, 'default1.1.jpg'),
(16, 1, 'default2.2.jpg'),
(17, 1, 'default1.1.jpg'),
(18, 1, 'default2.2.jpg'),
(19, 1, 'default1.1.jpg'),
(20, 1, 'default2.2.jpg'),
(21, 1, 'default1.1.jpg'),
(22, 1, 'default2.2.jpg'),
(5, 2, 'default1.1.jpg'),
(6, 2, 'default2.2.jpg'),
(7, 2, 'default1.1.jpg'),
(8, 2, 'default2.2.jpg'),
(9, 2, 'default1.1.jpg'),
(10, 2, 'default2.2.jpg'),
(11, 2, 'default1.1.jpg'),
(12, 2, 'default2.2.jpg'),
(13, 2, 'default1.1.jpg'),
(14, 2, 'default2.2.jpg'),
(15, 2, 'default1.1.jpg'),
(16, 2, 'default2.2.jpg'),
(17, 2, 'default1.1.jpg'),
(18, 2, 'default2.2.jpg');


-- --------------------------------------------------------

INSERT INTO VISIONARIO.`Review` (`product`, `user`, `date`, `comment`, `score`) VALUES
(1, 2, '2018-05-01', 'bella maglietta', 5),
(2, 2, '2018-04-27', 'bel colore', 4),
(3, 2, '2018-06-23', 'Bel colore, materiale perfetto, spedita nwei tempi previsti', 5),
(22, 1, '2018-07-04', 'Delusione! Arrivata in tempo ma la taglia è sbagliata, chiederò un rimborso. Per adesso meriti 2 stelle', 2);

-- --------------------------------------------------------

INSERT INTO VISIONARIO.`Showcase` (`product`, `top`, `img`, `sale`) VALUES
(1, b'1', 'immagine t-shirt', 20),
(2, b'0', 'immagine shorts', 0);

-- --------------------------------------------------------

INSERT INTO VISIONARIO.`Variable` (`id`, `value`, `web_page`) VALUES
('1', 'commento inutile', 'review'),
('2', 'commento utile', 'showcase');

-- --------------------------------------------------------

INSERT INTO VISIONARIO.`Wishlist` (`product`, `variant`, `user`) VALUES
(2,1, 1),
(1,1, 2);
