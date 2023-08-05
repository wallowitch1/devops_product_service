-- --------------------------------------------------------
-- 호스트:                          192.168.219.31
-- 서버 버전:                        8.0.32-0ubuntu0.20.04.2 - (Ubuntu)
-- 서버 OS:                        Linux
-- HeidiSQL 버전:                  11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- shop 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `shop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `shop`;

-- 테이블 shop.Deliveries 구조 내보내기
CREATE TABLE IF NOT EXISTS `Deliveries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` varchar(255) NOT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `order_id` int NOT NULL,
  `delivery_address` varchar(255) NOT NULL,
  `delivery_date` datetime DEFAULT NULL,
  `delivery_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Deliveries_users` (`delivery_id`),
  KEY `FK_Deliveries_Orders` (`order_id`),
  CONSTRAINT `FK_Deliveries_Orders` FOREIGN KEY (`order_id`) REFERENCES `Orders` (`id`),
  CONSTRAINT `FK_Deliveries_users` FOREIGN KEY (`delivery_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 shop.Deliveries:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `Deliveries` DISABLE KEYS */;
INSERT INTO `Deliveries` (`id`, `status`, `memo`, `order_id`, `delivery_address`, `delivery_date`, `delivery_id`) VALUES
	(1, '보류', '', 1, '강남', '2023-04-02 10:14:12', 3),
	(2, '보류', '', 2, '강남', '2023-04-02 12:13:54', 3);
/*!40000 ALTER TABLE `Deliveries` ENABLE KEYS */;

-- 테이블 shop.Delivery 구조 내보내기
CREATE TABLE IF NOT EXISTS `Delivery` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` varchar(255) NOT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `order_id` int NOT NULL,
  `delivery_address` varchar(255) NOT NULL,
  `delivery_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `Delivery_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `Orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 shop.Delivery:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `Delivery` DISABLE KEYS */;
/*!40000 ALTER TABLE `Delivery` ENABLE KEYS */;

-- 테이블 shop.Orders 구조 내보내기
CREATE TABLE IF NOT EXISTS `Orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `state` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '준비중',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `Orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `Orders_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `Products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 shop.Orders:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
INSERT INTO `Orders` (`id`, `user_id`, `product_id`, `quantity`, `order_date`, `createdAt`, `updatedAt`, `state`) VALUES
	(1, 1, 1, 1, '2023-04-02 15:41:10', '2023-04-02 06:41:10', '2023-04-02 12:30:42', '보류'),
	(2, 1, 1, 1, '2023-04-02 15:41:38', '2023-04-02 06:41:38', '2023-04-02 12:30:41', '보류');
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;

-- 테이블 shop.Products 구조 내보내기
CREATE TABLE IF NOT EXISTS `Products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `price` float NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 shop.Products:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `Products` DISABLE KEYS */;
INSERT INTO `Products` (`id`, `name`, `description`, `price`, `image_url`, `createdAt`, `updatedAt`) VALUES
	(1, 'test', '테스트입니다.', 1000, '1680417019677-template1-designer (2).png', '2023-04-02 06:30:19', '2023-04-02 06:30:19');
/*!40000 ALTER TABLE `Products` ENABLE KEYS */;

-- 테이블 shop.users 구조 내보내기
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `accounttype` varchar(255) NOT NULL,
  `tel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'test',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 shop.users:~1 rows (대략적) 내보내기
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `username`, `password`, `email`, `accounttype`, `tel`, `address`) VALUES
	(1, 'user', 'zmfpdl12', 'user@test.com', 'admin', '010-1111-1111', '강남'),
	(2, 'test', 'zmfpdl12', 'test@test.com', 'custom', '010-2222-2222', '성남'),
	(3, 'deli', 'zmfpdl12', 'deli@test.com', 'delivery', '010-3333-3333', ''),
	(4, 'deli2', 'zmfpdl12', 'deli2@test.com', 'delivery', '01044444444', '강남');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
