--
-- Database: VISIONARIO
--

-- --------------------------------------------------------
INSERT INTO VISIONARIO.`User` (`id`, `name`, `surname`, `email`, `password`, `sex`, `date_of_birth`, `permission`) VALUES
(1, 'Aymen', 'Naghmouchi', 'aymen.aymen@live.it', '1:76:52532f456df8ea630acd2f730e783410aafed23281974eb9f79f50677bed605ca41301b0431581dc29779f3ff601eccd731749fd06a12ddd5e8d38bf4a75517df138bc2aad29eef9fb46dbd18f4968492e2aefe4eb98e195be342cd2bbb4cd3c0e51798afd47c7291f601767117f856aa3610b74e8fb668f97937274c5222623', 'M', '1994-02-10', b'1'),
(2, 'Ilaria', 'Roma', 'ilaria@gmail.com', '1:76:52532f456df8ea630acd2f730e783410aafed23281974eb9f79f50677bed605ca41301b0431581dc29779f3ff601eccd731749fd06a12ddd5e8d38bf4a75517df138bc2aad29eef9fb46dbd18f4968492e2aefe4eb98e195be342cd2bbb4cd3c0e51798afd47c7291f601767117f856aa3610b74e8fb668f97937274c5222623', 'F', '2018-05-05', b'0'),
(3, 'Sandra', 'Caputo', 'sandra@live.it', '1:76:52532f456df8ea630acd2f730e783410aafed23281974eb9f79f50677bed605ca41301b0431581dc29779f3ff601eccd731749fd06a12ddd5e8d38bf4a75517df138bc2aad29eef9fb46dbd18f4968492e2aefe4eb98e195be342cd2bbb4cd3c0e51798afd47c7291f601767117f856aa3610b74e8fb668f97937274c5222623', 'F', '1990-10-1', b'0'),
(4, 'Salvatore', 'Fasano', 'salvo@hotmail.it', '1:76:52532f456df8ea630acd2f730e783410aafed23281974eb9f79f50677bed605ca41301b0431581dc29779f3ff601eccd731749fd06a12ddd5e8d38bf4a75517df138bc2aad29eef9fb46dbd18f4968492e2aefe4eb98e195be342cd2bbb4cd3c0e51798afd47c7291f601767117f856aa3610b74e8fb668f97937274c5222623', 'M', '1997-09-20', b'0'),
(5, 'Andrea', 'Mennillo', 'andrea@gmail.com', '1:76:52532f456df8ea630acd2f730e783410aafed23281974eb9f79f50677bed605ca41301b0431581dc29779f3ff601eccd731749fd06a12ddd5e8d38bf4a75517df138bc2aad29eef9fb46dbd18f4968492e2aefe4eb98e195be342cd2bbb4cd3c0e51798afd47c7291f601767117f856aa3610b74e8fb668f97937274c5222623', 'M', '1997-01-01', b'1'),
(6, 'Christian', 'Gemelli', 'christian@gmail.com', '1:76:52532f456df8ea630acd2f730e783410aafed23281974eb9f79f50677bed605ca41301b0431581dc29779f3ff601eccd731749fd06a12ddd5e8d38bf4a75517df138bc2aad29eef9fb46dbd18f4968492e2aefe4eb98e195be342cd2bbb4cd3c0e51798afd47c7291f601767117f856aa3610b74e8fb668f97937274c5222623', 'M', '1997-09-07', b'1');

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
(2, 'Shorts Dolce&Gabbana', 'tela, logo, tinta unita basic, vita normale, regular fit, zip e bottoni, multitasche, elasticizzato, pantalone, vestibilità ampia', 2, '90.00', '179.00', 10, 'W'),
(3, 'Polo Harmont&Blaine', 'piqué, senza applicazioni, tinta unita, collo a polo, maniche corte, chiusura sul fronte, bottoni, senza tasche', 3, '20.00', '30.00', 1, 'M'),
(4, 'Camicia Prada', 'tela, senza applicazioni, fantasia geometrica, chiusura sul fronte, bottoni, maniche lunghe, polsini con bottoni, collo classico, senza tasche', 4, '290.00', '340.00', 120, 'M'),
(5, 'Camicia Marni', 'raso, senza applicazioni, a righe, chiusura sul fronte, maniche corte, collo con fiocco, bottoni, senza tasche', 4, '200.00', '270.00', 350, 'W'),
(6, 'Miu Miu', 'raso, strass, tinta unita, fibbia, punta stretta, tacco a rocchetto, interno in pelle, suola di cuoio, contiene parti non tessili di origine animale', 2,'487.00', '550.99', 27, 'W'),
(7, 'Pantaloni Jeans Attico', 'denim, strass, paillettes, tinta unita, lavaggio medio, vita normale, chiusura sul fronte, zip e bottoni, multitasche, gamba a tubo', 5, '190.50', '289.70', 99, 'W'),
(8, 'Giacca Maison Margiela', 'tweed, senza applicazioni, tinta unita basic, multitasche, 3 bottoni, collo con revers, monopetto, maniche lunghe, interno foderato', 7, '260.20', '640.00', 300, 'M'),
(9, 'Espadrillas Dolce&Gabbana', 'gabardine, logo, applicazioni in pelle, a righe, punta tonda, senza tacco, interno in pelle, suola di cuoio e gomma, contiene parti non tessili di origine animale', 6, '220.00', '224.00', 10, 'M'),
(10, 'Polo Ralph Lauren', 'piqué, applicazioni a contrasto, logo, a righe, collo a polo, maniche corte, chiusura sul fronte, bottoni, fondo con spacchetti laterali, elasticizzato, vestibilità ampia', 3, '100.90', '135.39', 77, 'M'),
(11, 'Montblanc Summit Smartwatch Stainless Steel', 'Il primo smartwatch di lusso che unisce gli eleganti codici dell’orologeria svizzera alle tecnologie più avanzate. Design vintage classico ispirato alla pluripremiata collezione Montblanc 1858. Cassa da 46 mm dello spessore di soli 12,5 mm. Cassa, lunetta e corona in acciaio pregiato con finitura satinata e lucida. Vetro zaffiro bombato e antigraffio che copre un display AMOLED con risoluzione 400 x 400 e funzionalità multi-touch. Animato dal sistema Android Wear 2.0 che assicura compatibilità con smartphone iPhone & Android, prestazioni avanzate con processore Qualcomm Snapdragon 2100, facile da usare. Stile personalizzabile grazie ai cinturini facilmente intercambiabili e ai vari quadranti Montblanc. Controllo di tutte le notifiche e dell’agenda a colpo d’occhio e possibilità di rispondere in modalità scritta o vocale. Perfetto per viaggi “smart” grazie alle opzioni di traduzione vocale, navigazione, carta d’imbarco, prenotazione di un servizio taxi o l’impostazione dell’ora globale. Mantenersi in forma è facile con il cardiofrequenzimetro integrato, il barometro per l’altitudine e i sensori di rilevamento. Dotato di app precaricate (Runtastic, Uber e Foursquare) con possibilità di scaricarne altre direttamente dall’orologio via WiFi. Controllo e riproduzione della musica direttamente dal polso, con memoria da 4 GB per scaricare canzoni e ascoltarle in streaming con cuffie Bluetooth. Durata della batteria: un giorno intero, ricaricabile in meno di 2 ore. Impermeabilità IP68 (pioggia, sudorazione, lavaggio delle mani, non adatto a immersioni). Elegante cinturino in caucciù nero con dettagli in acciaio pregiato spazzolato, massima elasticità e vestibilità perfetta per ogni occasione, anche per attività sportive (Larghezza: 22 mm / Lunghezza: 65-170 mm).', 8, '900.00', '945.00', 100, 'M'),
(12, 'Nina Kastens Mini Bean Gold', 'senza applicazioni, senza chiusura', 10, '154.99', '175.10', 354, 'W'),
(13, 'Bracciale Emanuele Bicocchi', 'logo, gancetto', 10, '300.90', '310.99', 700, 'U'),
(14, 'Calzini Paul Smith', 'lavorato a maglia, logo, a righe', 9, '20.00', '25.00', 200, 'M'),
(15, 'Slip Tommy Hilfiger', 'jersey, logo, fantasia multicolore, elasticizzato', 9, '22.99', '25.99', 120, 'M' ),
(16, 'Mocassini Dior Homme', 'pelle martellata, applicazioni in metallo, logo, tinta unita, punta quadrata, senza tacco, interno in pelle, suola con gommini, contiene parti non tessili di origine animale, calzata ampia', 6, '500.00', '550.00', 10, 'M'),
(17, 'Orologio da polso Nixon', 'logo, chiusura con fibbia regolabile, cassa: acciaio inossidabile, cinturino: gomma, water resistant, movimento: digitale', 8, '100.90', '120.00', 90, 'U'),
(18, 'T-shirt Versace', 'jersey, logo, stampa, fantasia multicolore, collo tondo, maniche corte, vestibilità ampia', 1, '250.90', '264.00',100, 'M'),
(19, 'T-shirt N°21 Donna', 'jersey, strass, tinta unita, collo tondo, maniche corte, senza tasche, vestibilità ampia', 1, '96.00', '219.00',50, 'W'),
(20, 'Polo Giorgio Armani', 'piqué, logo, tinta unita, collo a polo, maniche lunghe, chiusura sul fronte, bottoni, senza tasche, fondo con spacchi laterali, contiene parti non tessili di origine animale', 3, '131.00', '269.00', 90, 'M'),
(21, 'T-Shirt Kenzo Bambina', 'jersey, logo, stampa, tinta unita, collo tondo, maniche corte, senza tasche, lavare a 30°, non lavabile a secco, stirare a max 110°, non candeggiare, non asciugare meccanicamente, elasticizzato', 1, '40.00', '43.00', 50, 'K'),
(22, 'T-Shirt Molo Bambino', 'jersey, logo, fantasia multicolore, collo tondo, maniche corte, senza tasche, lavare a 40°, lavabile a secco, stirare a max 150°, non candeggiare, non asciugare meccanicamente', 1, '35.00', '40.00', 10, 'K');
-- --------------0------------------------------------------

INSERT INTO VISIONARIO.`ProductVariant` (`product`, `id`, `size`, `discounted_price`, `sold`, `price`, `weight`, `available`, `color`) VALUES
(1,1,'XL',60.99,90,65.00,200,9,'blue'),
(2,1,'S',80.00,1,90.00,500,100,'red'),
(3,1,'XXL',24.99,22,25.00,100,100,'green'),
(4,1,'M',290.10,10,300.00,90,1,'yellow'),
(5,1,'L',250.00,100,260.00,200,0,'blue'),
(5,2,'L',255.90,100,260.00,200,0,'blue'),
(6,1,'S',500.99,7,500.00,300,9,'grey'),
(6,2,'S',500.30,7,510.00,300,9,'skyblue'),
(7,1,'XL',190.99,90,200.00,200,9,'black'),
(7,2,'XL',180.00,90,190.00,200,9,'brown'),
(8,1,'S',300.99,1,300.00,500,100,'white'),
(8,2,'S',310.00,1,320.00,500,100,'black'),
(9,1,'XXL',200.00,22,220.00,200,100,'green'),
(9,2,'XXL',220.00,22,223.00,200,100,'white'),
(10,1,'M',110.00,10,120.00,210,1,'pink'),
(10,2,'M',130.00,10,135.00,210,1,'grey'),
(11,1,'L',920.00,100,930.00,300,0,'black'),
(11,2,'L',910.99,100,935.00,300,0,'violet'),
(12,1,'S',150.00,7,155.00,200,9,'silver'),
(12,2,'S',150.50,7,160.00,200,9,'gold'),
(13,1,'XL',150.00,90,300.00,200,9,'violet'),
(13,2,'XL',170.90,90,310.00,200,9,'green'),
(14,1,'S',20.00,1,25.00,500,100,'violet'),
(14,2,'S',22.00,1,25.00,500,100,'grey'),
(15,1,'XXL',20.00,22,23.00,300,100,'black'),
(15,2,'XXL',23.00,22,24.00,300,100,'blue'),
(16,1,'M',500.00,10,510.00,300,1,'green'),
(16,2,'M',500.00,10,550.00,300,1,'blue'),
(17,1,'L',100.10,100,110.00,100,0,'turquoise'),
(17,2,'L',100.00,100,120.00,100,0,'bue'),
(18,1,'S',205.00,7,255.00,300,9,'grey'),
(18,2,'S',200.00,7,260.00,300,9,'black'),
(19,1,'XL',190.00,90,200.00,200,9,'black'),
(20,1,'S',200.00,1,210.00,500,100,'white'),
(21,1,'XXL',40.00,22,41.00,100,100,'grey'),
(22,1,'M',36.50,10,37.00,100,1,'blue');

-- --------------------------------------------------------

INSERT INTO VISIONARIO.`Order` (`id`, `total`, `shipping_date`, `ordering_date`, `delivery_date`, `user`, `shipping_fees`, `status`, `sign`, `payment_method`,`address`,`consignee`) VALUES
(1, '20.99', '2018-05-01', '2018-05-02', '2018-05-05', 1, '10.00', 101, 'aymen', 'PayPal',1,'nome cognome'),
(2, '10.99', '2018-04-23', '2018-05-24', '2018-05-27', 2, '10.00', 100, 'ilaria', 'Cash on delivery',2,'nome cognome'),
(3, '225.00', '2018-06-19', '2018-06-18', '2018-06-22', 3, '0.00', 101, '', 'Paypal',3,'nome cognome'),
(4, '160.00', '2018-06-20', '2018-06-19', '2018-06-24', 3, '0.00', 100, '', 'Cash on delivery',4,'nome cognome'),
(5, '310.99', '2018-07-01', '2018-06-29', '2018-07-03', 4, '0.00', 100, '', 'PayPal',5,'nome cognome'),
(6, '50.00', '2018-07-01', '2018-06-29', '2018-07-03', 5, '10.00', 100, '', 'PayPal',6,'nome cognome');

-- --------------------------------------------------------

INSERT INTO VISIONARIO.`Composition` (`product`, `variant`, `order`, `quantity`, `price`) VALUES
(1, 1, 1, 1, '20.99'),
(2, 1, 2, 1, '10.99'),
(5, 2, 3, 2, '225.00'),
(22, 1, 6, 1, '50.00');

-- --------------------------------------------------------

INSERT INTO VISIONARIO.`Image` (`product`, `variant`, `path`) VALUES
(1,1,'default1.1.jpg'),
(2,1,'default2.1.jpg'),
(3,1,'default3.1.jpg'),
(4,1,'default4.1.jpg'),
(5,1,'default5.1.jpg'),
(5,2,'default5.2.jpg'),
(6,1,'default6.1.jpg'),
(6,2,'default6.2.jpg'),
(7,1,'default7.1.jpg'),
(7,2,'default7.2.jpg'),
(8,1,'default8.1.jpg'),
(8,2,'default8.2.jpg'),
(9,1,'default9.1.jpg'),
(9,2,'default9.2.jpg'),
(10,1,'default10.1.jpg'),
(10,2,'default10.2.jpg'),
(11,1,'default11.1.jpg'),
(11,2,'default11.2.jpg'),
(12,1,'default12.1.jpg'),
(12,2,'default12.2.jpg'),
(13,1,'default13.1.jpg'),
(13,2,'default13.2.jpg'),
(14,1,'default14.1.jpg'),
(14,2,'default14.2.jpg'),
(15,1,'default15.1.jpg'),
(15,2,'default15.2.jpg'),
(16,1,'default16.1.jpg'),
(16,2,'default16.2.jpg'),
(17,1,'default17.1.jpg'),
(17,2,'default17.2.jpg'),
(18,1,'default18.1.jpg'),
(18,2,'default18.2.jpg'),
(19,1,'default19.1.jpg'),
(20,1,'default20.1.jpg'),
(21,1,'default21.1.jpg'),
(22,1,'default22.1.jpg');


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
