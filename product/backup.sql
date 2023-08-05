-- --------------------------------------------------------
-- 호스트:                          200.200.200.248
-- 서버 버전:                        8.0.32-0ubuntu0.22.10.2 - (Ubuntu)
-- 서버 OS:                        Linux
-- HeidiSQL 버전:                  12.4.0.6659
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- 테이블 데이터 shop.Deliveries:~0 rows (대략적) 내보내기

-- 테이블 데이터 shop.deliveries:~0 rows (대략적) 내보내기

-- 테이블 데이터 shop.Orders:~0 rows (대략적) 내보내기

-- 테이블 데이터 shop.Products:~0 rows (대략적) 내보내기
INSERT INTO `Products` (`id`, `name`, `description`, `price`, `image_url`, `createdAt`, `updatedAt`) VALUES
	(1, 'test', '테스트입니다.', 1000, '1680173682811-s3ë¦¬ì¬ì´ì¦íì¤í¸ì±ê³µ.PNG', '2023-03-30 10:54:42', '2023-03-30 10:54:42');

-- 테이블 데이터 shop.users:~0 rows (대략적) 내보내기
INSERT INTO `users` (`id`, `username`, `password`, `accounttype`, `email`) VALUES
	(1, 'user', 'zmfpdl12', 'admin', 'user@kh.com'),
	(2, 'test', 'zmfpdl12', 'custom', 'test@kh.com');

-- 테이블 데이터 shop.usertables:~0 rows (대략적) 내보내기

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
