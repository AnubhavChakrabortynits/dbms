DROP TABLE IF EXISTS `Categories`;
CREATE TABLE IF NOT EXISTS `Categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
);

INSERT INTO `Categories` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 'Continental', '2021-08-23 05:50:50', '2021-08-23 05:50:50'),
(2, 'Indian', '2021-08-23 05:50:50', '2021-08-23 05:50:50'),
(3, 'American', '2021-08-23 05:50:50', '2021-08-23 05:50:50'),
(4, 'Mexican', '2021-08-23 05:50:50', '2021-08-23 05:50:50'),
(5, 'Italian', '2021-08-23 05:50:50', '2021-08-23 05:50:50'),
(6, 'Spanish', '2021-08-23 05:50:50', '2021-08-23 05:50:50');


DROP TABLE IF EXISTS `Clients`;
CREATE TABLE IF NOT EXISTS `Clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL DEFAULT 'Address',
  `phone` varchar(255) NOT NULL DEFAULT '999999999',
  `email` varchar(255) NOT NULL,
  `dni` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `dni` (`dni`)
);


INSERT INTO `Clients` (`id`, `name`, `address`, `phone`, `email`, `dni`) VALUES
(1, 'AnubhavOp', 'xyz new york city', '999999999', 'anubhav@gamil.com', 'manager'),
(2, 'Swapnil Nath', 'Digboi', '3804123123', 'swapnil@example.com', 'cashier');


DROP TABLE IF EXISTS `OrderProducts`;
CREATE TABLE IF NOT EXISTS `OrderProducts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) DEFAULT NULL,
  `orderId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orderId` (`orderId`),
  KEY `productId` (`productId`)
);


DROP TABLE IF EXISTS `Orders`;
CREATE TABLE IF NOT EXISTS `Orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total` double NOT NULL,
  `isPaid` tinyint(1) NOT NULL DEFAULT '0',
  `delivery` tinyint(1) NOT NULL DEFAULT '0',
  `note` varchar(255) DEFAULT NULL,
  `userId` int(11) NOT NULL,
  `clientId` int(11) NOT NULL,
  `tableId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `clientId` (`clientId`),
  KEY `tableId` (`tableId`)
);



DROP TABLE IF EXISTS `Products`;
CREATE TABLE IF NOT EXISTS `Products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `stock` int(11) NOT NULL,
  `categoryId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `categoryId` (`categoryId`)
);


INSERT INTO `Products` (`id`, `name`, `price`, `stock`, `categoryId`, `createdAt`, `updatedAt`) VALUES
(1, 'Taco Bell', 120, 50, 4, '2021-08-23 05:50:51', '2021-08-23 05:50:51'),
(2, 'Burritos', 180, 70, 4, '2021-08-23 05:50:51', '2021-08-23 05:50:51'),
(3, 'Butter Chicken', 180, 70, 2, '2021-08-23 05:50:51', '2021-08-23 05:50:51'),
(4, 'Shahi Paneer', 180, 70, 2, '2021-08-23 05:50:51', '2021-08-23 05:50:51');


DROP TABLE IF EXISTS `Tables`;
CREATE TABLE IF NOT EXISTS `Tables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `occupied` tinyint(1) DEFAULT '0',
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
);


INSERT INTO `Tables` (`id`, `name`, `occupied`, `createdAt`, `updatedAt`) VALUES
(1, 'Table 1', 0, '2021-08-23 05:50:50', '2021-08-23 05:50:50'),
(2, 'Table 2', 0, '2021-08-23 05:50:50', '2021-08-23 05:50:50'),
(3, 'Table 3', 0, '2021-08-23 05:50:50', '2021-08-23 05:50:50'),
(4, 'Table 4', 0, '2021-08-23 05:50:50', '2021-08-23 05:50:50'),
(5, 'Table 5', 0, '2021-08-23 05:50:50', '2021-08-23 05:50:50'),
(6, 'Table 6', 0, '2021-08-23 05:50:50', '2021-08-23 05:50:50');


DROP TABLE IF EXISTS `Users`;
CREATE TABLE IF NOT EXISTS `Users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL DEFAULT '/avatar.png',
  `isAdmin` tinyint(1) NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
);

INSERT INTO `Users` (`id`, `name`, `email`, `password`, `image`, `isAdmin`, `createdAt`, `updatedAt`) VALUES
(1, 'Admin', 'admin@example.com', '$2b$10$Ob28q7LgYBCadB0mgVnPD.u8WtBVVoWs28iZTrxFF8LWuwG7xWiuO', '/avatar.png', 1, '2021-08-23 05:50:50', '2021-08-23 05:50:50'),
(2, 'User', 'user@example.com', '$2b$10$Ob28q7LgYBCadB0mgVnPD.u8WtBVVoWs28iZTrxFF8LWuwG7xWiuO', '/avatar.png', 0, '2021-08-23 05:50:50', '2021-08-23 05:50:50');

ALTER TABLE `OrderProducts`
  ADD CONSTRAINT `orderproducts_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `Orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orderproducts_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `Products` (`id`) ON DELETE CASCADE;

ALTER TABLE `Orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `Users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`clientId`) REFERENCES `Clients` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`tableId`) REFERENCES `Tables` (`id`) ON DELETE CASCADE;

ALTER TABLE `Products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `Categories` (`id`) ON DELETE CASCADE;
COMMIT;
