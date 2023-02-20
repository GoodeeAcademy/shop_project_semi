-- --------------------------------------------------------
-- 호스트:                          43.201.140.134
-- 서버 버전:                        10.1.48-MariaDB-0ubuntu0.18.04.1 - Ubuntu 18.04
-- 서버 OS:                        debian-linux-gnu
-- HeidiSQL 버전:                  11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- shop 데이터베이스 구조 내보내기
DROP DATABASE IF EXISTS `shop`;
CREATE DATABASE IF NOT EXISTS `shop` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `shop`;

-- 테이블 shop.auth_info 구조 내보내기
DROP TABLE IF EXISTS `auth_info`;
CREATE TABLE IF NOT EXISTS `auth_info` (
  `auth_code` int(11) NOT NULL COMMENT '권한 코드',
  `auth_name` varchar(100) NOT NULL COMMENT '권한 이름',
  `auth_memo` text NOT NULL COMMENT '권한 별 설명',
  `createdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '권한 생성 날짜',
  `updatedate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '권한 최신 업데이트 날짜',
  PRIMARY KEY (`auth_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='관리자 등급';

-- 테이블 데이터 shop.auth_info:~3 rows (대략적) 내보내기
DELETE FROM `auth_info`;
/*!40000 ALTER TABLE `auth_info` DISABLE KEYS */;
INSERT INTO `auth_info` (`auth_code`, `auth_name`, `auth_memo`, `createdate`, `updatedate`) VALUES
	(1, '최고 관리자', '최고 관리자 : 모든 기능 활성화(중간관리자 임명 가능)', '2023-01-12 00:00:00', '2023-01-12 00:00:00'),
	(2, '중간 관리자', '중간 관리자 : 모든 기능 활성화(직원 활성화 가능)', '2023-01-12 00:00:00', '2023-01-12 00:00:00'),
	(3, '관리자', '관리자 : 직원관리 제외 기능 활성화', '2023-01-12 00:00:00', '2023-01-12 00:00:00');
/*!40000 ALTER TABLE `auth_info` ENABLE KEYS */;

-- 테이블 shop.cart 구조 내보내기
DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `goods_code` int(11) NOT NULL COMMENT '장바구니 코드',
  `customer_id` varchar(100) NOT NULL COMMENT '회원 ID',
  `cart_quantity` int(11) NOT NULL COMMENT '카트 물건 수량',
  `createdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '장바구니 생성 날짜',
  PRIMARY KEY (`goods_code`,`customer_id`),
  KEY `FK_cart_customer` (`customer_id`),
  CONSTRAINT `FK_cart_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_cart_goods` FOREIGN KEY (`goods_code`) REFERENCES `goods` (`goods_code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='장바구니';

-- 테이블 데이터 shop.cart:~4 rows (대략적) 내보내기
DELETE FROM `cart`;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` (`goods_code`, `customer_id`, `cart_quantity`, `createdate`) VALUES
	(3, 'goodee', 1, '2023-02-13 22:07:28'),
	(10, 'goodee', 2, '2023-02-13 22:07:35'),
	(18, 'goodee', 1, '2023-02-13 22:07:44'),
	(20, 'choi', 1, '2023-01-26 15:10:14');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;

-- 테이블 shop.category 구조 내보내기
DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `category_code` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) NOT NULL,
  PRIMARY KEY (`category_code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- 테이블 데이터 shop.category:~4 rows (대략적) 내보내기
DELETE FROM `category`;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`category_code`, `category_name`) VALUES
	(1, 'outwear'),
	(2, 'top'),
	(3, 'bottom'),
	(4, 'accessories');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

-- 테이블 shop.customer 구조 내보내기
DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `customer_code` int(11) NOT NULL AUTO_INCREMENT COMMENT '고객 번호',
  `customer_id` varchar(100) NOT NULL COMMENT '고객 ID',
  `customer_pw` varchar(100) NOT NULL COMMENT '고객 PW (반정규화)',
  `customer_name` varchar(100) NOT NULL COMMENT '고객 이름',
  `customer_phone` varchar(100) NOT NULL COMMENT '고객 전화번호',
  `point` int(11) NOT NULL COMMENT '보유 포인트(반정규화)',
  `createdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '고객 가입 날짜',
  `updatedate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '고객정보 최신 업데이트 날짜',
  PRIMARY KEY (`customer_code`),
  UNIQUE KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='고객';

-- 테이블 데이터 shop.customer:~5 rows (대략적) 내보내기
DELETE FROM `customer`;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` (`customer_code`, `customer_id`, `customer_pw`, `customer_name`, `customer_phone`, `point`, `createdate`, `updatedate`) VALUES
	(1, 'hong', '*F13ACB16013CCF84877CED35B9DB9105C0C98A43', '홍길동', '011-1999-4567', 3400, '2023-01-10 10:46:31', '2023-01-18 09:33:40'),
	(2, 'test', '*A4B6157319038724E3560894F7F932C8886EBFCF', '테스트', '010-2323-2323', 0, '2023-01-10 10:47:12', '2023-01-10 10:47:12'),
	(3, 'choi', '*A4B6157319038724E3560894F7F932C8886EBFCF', '최정헌', '010-1234-5678', 1800, '2023-01-10 15:58:04', '2023-01-10 15:58:04'),
	(4, 'addtest1', '*A4B6157319038724E3560894F7F932C8886EBFCF', '테스트', '010-1234-5678', 0, '2023-01-25 13:51:03', '2023-01-25 13:51:03'),
	(5, 'goodee', '*A4B6157319038724E3560894F7F932C8886EBFCF', '구원이', '010-9191-9191', 200, '2023-01-26 17:01:53', '2023-01-27 11:21:52');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;

-- 테이블 shop.customer_address 구조 내보내기
DROP TABLE IF EXISTS `customer_address`;
CREATE TABLE IF NOT EXISTS `customer_address` (
  `address_code` int(11) NOT NULL AUTO_INCREMENT COMMENT '주소 식별 번호',
  `customer_id` varchar(100) NOT NULL COMMENT '고객 ID',
  `address` text NOT NULL COMMENT '주소',
  `createdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '주소 생성 날짜',
  `updatedate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '주소 최신 업데이트 날짜',
  PRIMARY KEY (`address_code`),
  KEY `FK__customer` (`customer_id`),
  CONSTRAINT `FK__customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='고객 주소';

-- 테이블 데이터 shop.customer_address:~5 rows (대략적) 내보내기
DELETE FROM `customer_address`;
/*!40000 ALTER TABLE `customer_address` DISABLE KEYS */;
INSERT INTO `customer_address` (`address_code`, `customer_id`, `address`, `createdate`, `updatedate`) VALUES
	(1, 'hong', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '2023-01-10 10:46:31', '2023-01-10 10:46:31'),
	(2, 'test', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '2023-01-10 10:47:12', '2023-01-10 10:47:12'),
	(3, 'choi', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '2023-01-10 15:58:04', '2023-01-10 15:58:04'),
	(4, 'addtest1', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '2023-01-25 13:51:03', '2023-01-25 13:51:03'),
	(5, 'goodee', '08505/서울 금천구 가산디지털2로 115/11층 구디아카데미/ (가산동)', '2023-01-26 17:01:53', '2023-01-27 11:21:52');
/*!40000 ALTER TABLE `customer_address` ENABLE KEYS */;

-- 테이블 shop.emp 구조 내보내기
DROP TABLE IF EXISTS `emp`;
CREATE TABLE IF NOT EXISTS `emp` (
  `emp_code` int(11) NOT NULL AUTO_INCREMENT COMMENT '사원번호',
  `emp_id` varchar(100) NOT NULL COMMENT '사원 ID',
  `emp_pw` varchar(100) NOT NULL COMMENT '사원 PW',
  `emp_name` varchar(100) NOT NULL COMMENT '사원 이름',
  `active` enum('Y','N') NOT NULL DEFAULT 'N' COMMENT 'Y :계정사용가능, N:계정사용불가',
  `auth_code` int(11) NOT NULL COMMENT '관리자권한(최초 권한없음)',
  `createdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '계정 생성 날짜',
  `updatedate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '계정 최신 업데이트 날짜',
  PRIMARY KEY (`emp_code`),
  UNIQUE KEY `emp_id` (`emp_id`),
  KEY `FK_emp_auth_info` (`auth_code`),
  CONSTRAINT `FK_emp_auth_info` FOREIGN KEY (`auth_code`) REFERENCES `auth_info` (`auth_code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='사원 목록(해당 샵 직원)';

-- 테이블 데이터 shop.emp:~3 rows (대략적) 내보내기
DELETE FROM `emp`;
/*!40000 ALTER TABLE `emp` DISABLE KEYS */;
INSERT INTO `emp` (`emp_code`, `emp_id`, `emp_pw`, `emp_name`, `active`, `auth_code`, `createdate`, `updatedate`) VALUES
	(2, 'admin', '*A4B6157319038724E3560894F7F932C8886EBFCF', '관리자', 'Y', 1, '2023-01-10 10:31:34', '2023-01-10 10:31:34'),
	(3, 'mAdmin', '*A4B6157319038724E3560894F7F932C8886EBFCF', '중간관리자', 'Y', 2, '2023-01-12 00:00:00', '2023-01-12 00:00:00'),
	(4, 'fAdmin', '*A4B6157319038724E3560894F7F932C8886EBFCF', '하위관리자', 'N', 3, '2023-01-12 00:00:00', '2023-01-12 00:00:00');
/*!40000 ALTER TABLE `emp` ENABLE KEYS */;

-- 테이블 shop.goods 구조 내보내기
DROP TABLE IF EXISTS `goods`;
CREATE TABLE IF NOT EXISTS `goods` (
  `goods_code` int(11) NOT NULL AUTO_INCREMENT COMMENT '상품 번호',
  `category_code` int(11) NOT NULL,
  `goods_name` varchar(100) NOT NULL COMMENT '상품 이름',
  `goods_price` int(11) NOT NULL COMMENT '상품 가격',
  `sold_out` enum('Y','N') NOT NULL COMMENT 'Y:품절, N:재고있음',
  `emp_id` varchar(100) NOT NULL COMMENT '상품 등록한 스탭ID',
  `hit` int(11) NOT NULL DEFAULT '0' COMMENT '인기상품 반영',
  `createdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '상품 등록 날짜',
  `updatedate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '상품 최신 업데이트 날짜',
  PRIMARY KEY (`goods_code`),
  KEY `FK_goods_category` (`category_code`),
  CONSTRAINT `FK_goods_category` FOREIGN KEY (`category_code`) REFERENCES `category` (`category_code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='상품 목록';

-- 테이블 데이터 shop.goods:~20 rows (대략적) 내보내기
DELETE FROM `goods`;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` (`goods_code`, `category_code`, `goods_name`, `goods_price`, `sold_out`, `emp_id`, `hit`, `createdate`, `updatedate`) VALUES
	(3, 4, 'cap[denim]', 30000, 'N', 'admin', 2, '2023-01-10 10:36:56', '2023-01-10 10:36:56'),
	(4, 4, 'muffler[black]', 40000, 'N', 'admin', 3, '2023-01-10 10:37:44', '2023-01-10 10:37:44'),
	(5, 2, 'knit[skyblue]', 60000, 'N', 'admin', 0, '2023-01-10 10:38:02', '2023-01-10 10:38:02'),
	(6, 2, 'top[printing]', 40000, 'N', 'admin', 0, '2023-01-10 10:38:33', '2023-01-10 10:38:33'),
	(7, 4, 'beanie[skyblue]', 30000, 'N', 'admin', 1, '2023-01-10 10:38:48', '2023-01-10 10:38:48'),
	(8, 2, 'crop top[white]', 30000, 'N', 'admin', 0, '2023-01-10 10:39:12', '2023-01-10 10:39:12'),
	(9, 4, 'muffler[ivory]', 40000, 'N', 'admin', 2, '2023-01-10 10:39:37', '2023-01-10 10:39:37'),
	(10, 4, 'muffler[yellow]', 40000, 'N', 'admin', 0, '2023-01-10 10:39:53', '2023-01-10 10:39:53'),
	(11, 2, 'top[blue]', 30000, 'N', 'admin', 0, '2023-01-10 10:40:06', '2023-01-10 10:40:06'),
	(12, 2, 'top[multi]', 40000, 'N', 'admin', 0, '2023-01-10 10:41:58', '2023-01-10 10:41:58'),
	(13, 2, 'top[line]', 40000, 'N', 'admin', 0, '2023-01-10 10:42:13', '2023-01-10 10:42:13'),
	(14, 2, 'top[navy]', 35000, 'N', 'admin', 2, '2023-01-10 10:42:28', '2023-01-10 10:42:28'),
	(15, 2, 'top[stripe]', 35000, 'N', 'admin', 0, '2023-01-10 10:42:41', '2023-01-10 10:42:41'),
	(16, 2, 'vest[brown]', 30000, 'N', 'admin', 0, '2023-01-10 10:42:54', '2023-01-10 10:42:54'),
	(17, 1, 'jacket[navy]', 80000, 'N', 'admin', 0, '2023-01-10 10:43:36', '2023-01-10 10:43:36'),
	(18, 1, 'jacket[brown]', 90000, 'N', 'admin', 0, '2023-01-10 10:44:17', '2023-01-10 10:44:17'),
	(19, 1, 'jacket[khaki brown]', 80000, 'N', 'admin', 8, '2023-01-10 10:44:38', '2023-02-20 13:27:36'),
	(20, 1, 'jacket[gray]', 70000, 'Y', 'admin', 7, '2023-01-10 10:44:54', '2023-02-20 13:29:25'),
	(21, 2, 'vest[ivory]', 30000, 'N', 'admin', 1, '2023-01-10 10:45:07', '2023-01-10 10:45:07'),
	(25, 4, 'Two Pocket Denim Bag [Blue]', 137000, 'N', 'admin', 8, '2023-02-20 11:43:51', '2023-02-20 11:43:51');
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;

-- 테이블 shop.goods_img 구조 내보내기
DROP TABLE IF EXISTS `goods_img`;
CREATE TABLE IF NOT EXISTS `goods_img` (
  `goods_img_code` int(11) NOT NULL AUTO_INCREMENT,
  `goods_code` int(11) NOT NULL,
  `filename` varchar(100) NOT NULL COMMENT 'IMG File 이름',
  `origin_name` varchar(100) NOT NULL COMMENT 'IMG File origin 이름',
  `content_type` varchar(100) NOT NULL COMMENT 'IMG File 타입',
  `createdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '상품 이미지 등록날짜',
  `updatedate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '상품 이미지 최신 업데이트 날짜',
  PRIMARY KEY (`goods_img_code`),
  KEY `fk_goods_img_goods1_idx` (`goods_code`),
  CONSTRAINT `fk_goods_img_goods1` FOREIGN KEY (`goods_code`) REFERENCES `goods` (`goods_code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='상품 이미지';

-- 테이블 데이터 shop.goods_img:~20 rows (대략적) 내보내기
DELETE FROM `goods_img`;
/*!40000 ALTER TABLE `goods_img` DISABLE KEYS */;
INSERT INTO `goods_img` (`goods_img_code`, `goods_code`, `filename`, `origin_name`, `content_type`, `createdate`, `updatedate`) VALUES
	(1, 3, 'cap_denim1.jpg', 'cap_denim.jpg', 'image/jpeg', '2023-01-10 10:36:56', '2023-01-10 10:36:56'),
	(2, 4, 'muffler_black.jpg', 'muffler_black.jpg', 'image/jpeg', '2023-01-10 10:37:44', '2023-01-10 10:37:44'),
	(3, 5, 'knit_skyblue.jpg', 'knit_skyblue.jpg', 'image/jpeg', '2023-01-10 10:38:02', '2023-01-10 10:38:02'),
	(4, 6, 'top_printing.jpg', 'top_printing.jpg', 'image/jpeg', '2023-01-10 10:38:33', '2023-01-10 10:38:33'),
	(5, 7, 'beanie_skyblue.jpg', 'beanie_skyblue.jpg', 'image/jpeg', '2023-01-10 10:38:48', '2023-01-10 10:38:48'),
	(6, 8, 'top_crop.jpg', 'top_crop.jpg', 'image/jpeg', '2023-01-10 10:39:12', '2023-01-10 10:39:12'),
	(7, 9, 'muffler_ivory.jpg', 'muffler_ivory.jpg', 'image/jpeg', '2023-01-10 10:39:37', '2023-01-10 10:39:37'),
	(8, 10, 'muffler_yellow.jpg', 'muffler_yellow.jpg', 'image/jpeg', '2023-01-10 10:39:53', '2023-01-10 10:39:53'),
	(9, 11, 'top_blue.jpg', 'top_blue.jpg', 'image/jpeg', '2023-01-10 10:40:06', '2023-01-10 10:40:06'),
	(10, 12, 'top_multi.jpg', 'top_multi.jpg', 'image/jpeg', '2023-01-10 10:41:58', '2023-01-10 10:41:58'),
	(11, 13, 'top_line.jpg', 'top_line.jpg', 'image/jpeg', '2023-01-10 10:42:13', '2023-01-10 10:42:13'),
	(12, 14, 'top_navy.jpg', 'top_navy.jpg', 'image/jpeg', '2023-01-10 10:42:28', '2023-01-10 10:42:28'),
	(13, 15, 'top_stripe.jpg', 'top_stripe.jpg', 'image/jpeg', '2023-01-10 10:42:41', '2023-01-10 10:42:41'),
	(14, 16, 'vest_brown.jpg', 'vest_brown.jpg', 'image/jpeg', '2023-01-10 10:42:54', '2023-01-10 10:42:54'),
	(15, 17, 'jacket_navy.jpg', 'jacket_navy.jpg', 'image/jpeg', '2023-01-10 10:43:36', '2023-01-10 10:43:36'),
	(16, 18, 'jacket_brown.jpg', 'jacket_brown.jpg', 'image/jpeg', '2023-01-10 10:44:17', '2023-01-10 10:44:17'),
	(17, 19, 'jacket_khakibrown.jpg', 'jacket_khakibrown.jpg', 'image/jpeg', '2023-01-10 10:44:38', '2023-01-10 10:44:38'),
	(18, 20, 'jacket_gray.jpg', 'jacket_gray.jpg', 'image/jpeg', '2023-01-10 10:44:54', '2023-01-10 10:44:54'),
	(19, 21, 'vest_ivory.jpg', 'vest_ivory.jpg', 'image/jpeg', '2023-01-10 10:45:07', '2023-01-10 10:45:07'),
	(27, 25, 'bag_blue.jpg', 'bag_blue.jpg', 'image/jpeg', '2023-02-20 11:43:51', '2023-02-20 11:43:51');
/*!40000 ALTER TABLE `goods_img` ENABLE KEYS */;

-- 테이블 shop.notice 구조 내보내기
DROP TABLE IF EXISTS `notice`;
CREATE TABLE IF NOT EXISTS `notice` (
  `notice_code` int(11) NOT NULL AUTO_INCREMENT COMMENT '공지사항 식별 코드',
  `notice_title` varchar(200) NOT NULL COMMENT '공지사항 제목',
  `notice_content` text NOT NULL COMMENT '공지사항 내용',
  `emp_name` varchar(100) NOT NULL COMMENT '작성자(사원) 이름',
  `createdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '공지사항 작성일',
  PRIMARY KEY (`notice_code`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COMMENT='공지사항 게시판';

-- 테이블 데이터 shop.notice:~100 rows (대략적) 내보내기
DELETE FROM `notice`;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` (`notice_code`, `notice_title`, `notice_content`, `emp_name`, `createdate`) VALUES
	(1, 'justo etiam', 'at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus', '관리자', '2023-01-10 14:25:32'),
	(2, 'sodales scelerisque', 'ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae', '관리자', '2023-01-10 14:25:32'),
	(3, 'sapien', 'sem duis aliquam convallis nunc proin at turpis a pede posuere', '관리자', '2023-01-10 14:25:32'),
	(4, 'dolor vel est', 'vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel', '관리자', '2023-01-10 14:25:32'),
	(5, 'semper porta volutpat', 'neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis', '관리자', '2023-01-10 14:25:32'),
	(6, 'erat vestibulum', 'amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus', '관리자', '2023-01-10 14:25:32'),
	(7, 'pellentesque eget', 'sagittis nam congue risus semper porta volutpat quam pede lobortis ligula', '관리자', '2023-01-10 14:25:32'),
	(8, 'enim leo', 'vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla', '관리자', '2023-01-10 14:25:32'),
	(9, 'faucibus accumsan', 'lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat', '관리자', '2023-01-10 14:25:32'),
	(10, 'dis', 'curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend', '관리자', '2023-01-10 14:25:32'),
	(11, 'nunc purus', 'a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id', '관리자', '2023-01-10 14:25:32'),
	(12, 'sit amet nulla', 'mi integer ac neque duis bibendum morbi non quam nec', '관리자', '2023-01-10 14:25:32'),
	(13, 'penatibus', 'justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque', '관리자', '2023-01-10 14:25:32'),
	(14, 'vulputate nonummy maecenas', 'mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel', '관리자', '2023-01-10 14:25:32'),
	(15, 'turpis', 'augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis', '관리자', '2023-01-10 14:25:39'),
	(16, 'nulla', 'non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis', '관리자', '2023-01-10 14:25:32'),
	(17, 'quis turpis sed', 'hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec', '관리자', '2023-01-10 14:25:32'),
	(18, 'laoreet ut', 'in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur', '관리자', '2023-01-10 14:25:32'),
	(19, 'odio', 'tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit', '관리자', '2023-01-10 14:25:32'),
	(20, 'curae nulla', 'sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam', '관리자', '2023-01-10 14:25:32'),
	(21, 'et magnis', 'blandit non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia', '관리자', '2023-01-10 14:25:32'),
	(22, 'interdum venenatis', 'dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis', '관리자', '2023-01-10 14:25:32'),
	(23, 'sit', 'consequat lectus in est risus auctor sed tristique in tempus sit', '관리자', '2023-01-10 14:25:32'),
	(24, 'aliquam', 'a suscipit nulla elit ac nulla sed vel enim sit amet', '관리자', '2023-01-10 14:25:32'),
	(25, 'luctus', 'odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac', '관리자', '2023-01-10 14:25:32'),
	(26, 'orci', 'posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros', '관리자', '2023-01-10 14:25:32'),
	(27, 'elit proin interdum', 'pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla', '관리자', '2023-01-10 14:25:32'),
	(28, 'lorem quisque ut', 'neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi', '관리자', '2023-01-10 14:25:32'),
	(29, 'cubilia curae donec', 'libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit', '관리자', '2023-01-10 14:25:32'),
	(30, 'mauris eget', 'sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed', '관리자', '2023-01-10 14:25:32'),
	(31, 'quam pede', 'sapien arcu sed augue aliquam erat volutpat in congue etiam', '관리자', '2023-01-10 14:25:32'),
	(32, 'lobortis sapien sapien', 'risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis', '관리자', '2023-01-10 14:25:32'),
	(33, 'pellentesque volutpat dui', 'tempus vivamus in felis eu sapien cursus vestibulum proin eu mi', '관리자', '2023-01-10 14:25:32'),
	(34, 'turpis', 'consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id', '관리자', '2023-01-10 14:25:32'),
	(35, 'amet', 'consequat lectus in est risus auctor sed tristique in tempus sit amet sem', '관리자', '2023-01-10 14:25:32'),
	(36, 'elementum', 'ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum', '관리자', '2023-01-10 14:25:32'),
	(37, 'ac est lacinia', 'at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam', '관리자', '2023-01-10 14:25:32'),
	(38, 'ultrices mattis', 'consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque', '관리자', '2023-01-10 14:25:32'),
	(39, 'condimentum', 'duis bibendum morbi non quam nec dui luctus rutrum nulla', '관리자', '2023-01-10 14:25:32'),
	(40, 'justo sollicitudin ut', 'lacus at turpis donec posuere metus vitae ipsum aliquam non mauris', '관리자', '2023-01-10 14:25:32'),
	(41, 'diam', 'aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede', '관리자', '2023-01-10 14:25:32'),
	(42, 'vestibulum', 'mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis', '관리자', '2023-01-10 14:25:32'),
	(43, 'id', 'quam nec dui luctus rutrum nulla tellus in sagittis dui', '관리자', '2023-01-10 14:25:32'),
	(44, 'quis tortor id', 'condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas', '관리자', '2023-01-10 14:25:32'),
	(45, 'eu massa', 'erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam', '관리자', '2023-01-10 14:25:32'),
	(46, 'convallis nulla neque', 'pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus', '관리자', '2023-01-10 14:25:32'),
	(47, 'suscipit nulla', 'habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut', '관리자', '2023-01-10 14:25:32'),
	(48, 'metus', 'sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus', '관리자', '2023-01-10 14:25:32'),
	(49, 'aliquam augue quam', 'curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec', '관리자', '2023-01-10 14:25:32'),
	(50, 'posuere', 'erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non', '관리자', '2023-01-10 14:25:32'),
	(51, 'dui vel', 'integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla', '관리자', '2023-01-10 14:25:32'),
	(52, 'curae duis faucibus', 'sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum', '관리자', '2023-01-10 14:25:32'),
	(53, 'sapien cursus', 'cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien', '관리자', '2023-01-10 14:25:32'),
	(54, 'et eros vestibulum', 'erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis', '관리자', '2023-01-10 14:25:32'),
	(55, 'tincidunt eget tempus', 'morbi porttitor lorem id ligula suspendisse ornare consequat lectus in', '관리자', '2023-01-10 14:25:32'),
	(56, 'aliquam lacus', 'vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed', '관리자', '2023-01-10 14:25:32'),
	(57, 'quam a', 'magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et', '관리자', '2023-01-10 14:25:32'),
	(58, 'lobortis est', 'dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum', '관리자', '2023-01-10 14:25:32'),
	(59, 'ante ipsum primis', 'orci nullam molestie nibh in lectus pellentesque at nulla suspendisse', '관리자', '2023-01-10 14:25:32'),
	(60, 'sagittis sapien', 'et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit', '관리자', '2023-01-10 14:25:32'),
	(61, 'nunc', 'at nulla suspendisse potenti cras in purus eu magna vulputate luctus', '관리자', '2023-01-10 14:25:32'),
	(62, 'tortor duis mattis', 'nisi at nibh in hac habitasse platea dictumst aliquam augue quam', '관리자', '2023-01-10 14:25:32'),
	(63, 'libero', 'nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci', '관리자', '2023-01-10 14:25:32'),
	(64, 'dui vel', 'molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis', '관리자', '2023-01-10 14:25:32'),
	(65, 'nec', 'malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer', '관리자', '2023-01-10 14:25:32'),
	(66, 'eu magna vulputate', 'at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem', '관리자', '2023-01-10 14:25:32'),
	(67, 'in', 'eleifend pede libero quis orci nullam molestie nibh in lectus', '관리자', '2023-01-10 14:25:32'),
	(68, 'at', 'nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend', '관리자', '2023-01-10 14:25:32'),
	(69, 'ultrices erat tortor', 'parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur', '관리자', '2023-01-10 14:25:32'),
	(70, 'amet turpis elementum', 'metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere', '관리자', '2023-01-10 14:25:32'),
	(71, 'platea dictumst etiam', 'eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum', '관리자', '2023-01-10 14:25:32'),
	(72, 'congue etiam justo', 'tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat', '관리자', '2023-01-10 14:25:32'),
	(73, 'hendrerit at vulputate', 'augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl', '관리자', '2023-01-10 14:25:32'),
	(74, 'sapien', 'cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac', '관리자', '2023-01-10 14:25:32'),
	(75, 'volutpat dui', 'tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu', '관리자', '2023-01-10 14:25:32'),
	(76, 'vel augue vestibulum', 'nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris', '관리자', '2023-01-10 14:25:32'),
	(77, 'ut erat id', 'euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam', '관리자', '2023-01-10 14:25:32'),
	(78, 'blandit', 'ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra', '관리자', '2023-01-10 14:25:32'),
	(79, 'molestie nibh in', 'donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi', '관리자', '2023-01-10 14:25:32'),
	(80, 'odio justo sollicitudin', 'nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti', '관리자', '2023-01-10 14:25:32'),
	(81, 'amet consectetuer adipiscing', 'cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus', '관리자', '2023-01-10 14:25:32'),
	(82, 'luctus', 'sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus', '관리자', '2023-01-10 14:25:32'),
	(83, 'semper', 'sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at', '관리자', '2023-01-10 14:25:32'),
	(84, 'purus phasellus in', 'metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci', '관리자', '2023-01-10 14:25:32'),
	(85, 'cursus', 'sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus', '관리자', '2023-01-10 14:25:32'),
	(86, 'vestibulum sit amet', 'donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed', '관리자', '2023-01-10 14:25:32'),
	(87, 'in', 'sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in', '관리자', '2023-01-10 14:25:32'),
	(88, 'mauris ullamcorper', 'imperdiet nullam orci pede venenatis non sodales sed tincidunt eu', '관리자', '2023-01-10 14:25:32'),
	(89, 'mattis', 'venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl', '관리자', '2023-01-10 14:25:32'),
	(90, 'natoque penatibus et', 'id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi', '관리자', '2023-01-10 14:25:32'),
	(91, 'ac diam cras', 'bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce', '관리자', '2023-01-10 14:25:32'),
	(92, 'est', 'massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo', '관리자', '2023-01-10 14:25:32'),
	(93, 'imperdiet sapien urna', 'at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam', '관리자', '2023-01-10 14:25:32'),
	(94, 'vestibulum sit', 'suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus', '관리자', '2023-01-10 14:25:32'),
	(95, 'quis odio consequat', 'parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur', '관리자', '2023-01-10 14:25:32'),
	(96, 'id ornare', 'dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non', '관리자', '2023-01-10 14:25:32'),
	(97, 'posuere cubilia curae', 'sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae', '관리자', '2023-01-10 14:25:32'),
	(98, 'habitasse platea', 'feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac', '관리자', '2023-01-10 14:25:32'),
	(99, 'suscipit ligula', 'turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel', '관리자', '2023-01-10 14:25:32'),
	(100, 'fusce lacus', 'ac tellus semper interdum mauris ullamcorper purus sit amet nulla', '관리자', '2023-01-10 14:25:32');
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;

-- 테이블 shop.orders 구조 내보내기
DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `order_code` int(11) NOT NULL AUTO_INCREMENT COMMENT '주문번호',
  `customer_id` varchar(100) NOT NULL,
  `order_name` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `order_price` int(11) NOT NULL COMMENT '주문 총 금액',
  `createdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '주문 날짜',
  PRIMARY KEY (`order_code`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8 COMMENT='주문 목록';

-- 테이블 데이터 shop.orders:~76 rows (대략적) 내보내기
DELETE FROM `orders`;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`order_code`, `customer_id`, `order_name`, `address`, `phone`, `order_price`, `createdate`) VALUES
	(1, 'hong', '홍길동', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 80000, '2022-08-02 00:00:00'),
	(2, 'test', '홍길동', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 80000, '2022-12-22 00:00:00'),
	(3, 'test', '홍길동', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 60000, '2022-06-04 00:00:00'),
	(4, 'test', '홍길동', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 60000, '2022-11-05 00:00:00'),
	(5, 'hong', '홍길동', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 240000, '2022-05-21 00:00:00'),
	(6, 'test', '홍길동', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 340000, '2022-04-16 00:00:00'),
	(7, 'test', '홍길동', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 160000, '2022-11-03 00:00:00'),
	(8, 'hong', '홍길동', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 380000, '2022-06-04 00:00:00'),
	(9, 'hong', '테스트', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 280000, '2022-04-16 00:00:00'),
	(10, 'hong', '테스트', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 460000, '2022-09-03 00:00:00'),
	(11, 'hong', '테스트', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 190000, '2022-12-18 00:00:00'),
	(12, 'hong', '홍길동', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 480000, '2022-04-13 00:00:00'),
	(13, 'test', '홍길동', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 90000, '2022-07-11 00:00:00'),
	(14, 'test', '테스트', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 200000, '2022-12-20 00:00:00'),
	(15, 'test', '테스트', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 240000, '2022-09-25 00:00:00'),
	(16, 'hong', '홍길동', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 690000, '2022-09-26 00:00:00'),
	(17, 'test', '테스트', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 780000, '2023-01-03 00:00:00'),
	(18, 'hong', '홍길동', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 200000, '2022-06-01 00:00:00'),
	(19, 'hong', '홍길동', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 210000, '2022-12-20 00:00:00'),
	(20, 'test', '테스트', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 120000, '2022-01-31 00:00:00'),
	(21, 'hong', '테스트', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 410000, '2022-03-18 00:00:00'),
	(22, 'hong', '홍길동', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 120000, '2022-10-02 00:00:00'),
	(23, 'hong', '테스트', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 160000, '2022-03-06 00:00:00'),
	(24, 'hong', '홍길동', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 750000, '2022-11-02 00:00:00'),
	(25, 'test', '테스트', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 60000, '2022-12-22 00:00:00'),
	(26, 'hong', '테스트', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 160000, '2022-03-28 00:00:00'),
	(27, 'test', '홍길동', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 270000, '2022-05-09 00:00:00'),
	(28, 'hong', '테스트', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 300000, '2022-04-12 00:00:00'),
	(29, 'hong', '홍길동', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 40000, '2022-07-20 00:00:00'),
	(30, 'test', '테스트', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 400000, '2022-04-17 00:00:00'),
	(31, 'test', '테스트', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 310000, '2022-03-27 00:00:00'),
	(32, 'test', '테스트', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 260000, '2022-06-06 00:00:00'),
	(33, 'hong', '테스트', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 160000, '2022-12-21 00:00:00'),
	(34, 'test', '홍길동', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 125000, '2022-08-02 00:00:00'),
	(35, 'hong', '테스트', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 210000, '2022-11-08 00:00:00'),
	(36, 'test', '홍길동', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 380000, '2022-07-11 00:00:00'),
	(37, 'test', '테스트', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 380000, '2022-04-18 00:00:00'),
	(38, 'test', '홍길동', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 105000, '2022-02-07 00:00:00'),
	(39, 'test', '테스트', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 200000, '2022-07-29 00:00:00'),
	(40, 'test', '테스트', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 310000, '2022-11-11 00:00:00'),
	(41, 'test', '홍길동', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 360000, '2022-08-12 00:00:00'),
	(42, 'test', '홍길동', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 150000, '2022-05-06 00:00:00'),
	(43, 'hong', '홍길동', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 180000, '2022-12-25 00:00:00'),
	(44, 'hong', '테스트', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 600000, '2022-09-19 00:00:00'),
	(45, 'hong', '홍길동', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 315000, '2022-03-23 00:00:00'),
	(46, 'hong', '테스트', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 160000, '2022-05-04 00:00:00'),
	(47, 'test', '홍길동', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 860000, '2023-01-03 00:00:00'),
	(48, 'hong', '홍길동', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 120000, '2022-03-07 00:00:00'),
	(49, 'test', '테스트', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 60000, '2022-03-26 00:00:00'),
	(50, 'test', '테스트', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 160000, '2022-03-04 00:00:00'),
	(51, 'choi', '최정헌', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 30000, '2023-01-10 16:00:07'),
	(52, 'choi', '최정헌', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 70000, '2023-01-10 16:00:26'),
	(53, 'choi', '최정헌', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 70000, '2023-01-10 16:02:57'),
	(54, 'choi', '최정헌', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 70000, '2023-01-10 16:15:07'),
	(55, 'choi', '최정헌', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 70000, '2023-01-10 16:45:37'),
	(56, 'choi', '최정헌', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 70000, '2023-01-10 17:39:24'),
	(58, 'choi', '최정헌', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 30000, '2023-01-10 21:23:44'),
	(59, 'choi', '최정헌', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 140000, '2023-01-10 21:52:14'),
	(60, 'choi', '최정헌', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 70000, '2023-01-10 22:12:08'),
	(61, 'choi', '최정헌', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 338889, '2023-01-10 22:18:23'),
	(64, 'choi', '최정헌', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 350000, '2023-01-10 22:20:35'),
	(65, 'choi', '최정헌', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 300000, '2023-01-11 00:38:37'),
	(66, 'choi', '최정헌', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 80000, '2023-01-11 00:44:08'),
	(67, 'choi', '최정헌', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 140000, '2023-01-11 09:37:13'),
	(68, 'choi', '최정헌', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 28600, '2023-01-11 20:12:59'),
	(69, 'hong', '홍길동', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 365000, '2023-01-12 11:10:56'),
	(70, 'hong', '홍길동', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 70000, '2023-01-18 10:15:59'),
	(71, 'hong', '홍길동', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '010-1234-5678', 70000, '2023-01-18 10:18:34'),
	(72, 'hong', '홍길동', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', 'null-4568-7567', 160000, '2023-01-18 10:39:23'),
	(73, 'hong', '홍길동', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '011-0000-0000', 70000, '2023-01-18 10:45:00'),
	(81, 'hong', '홍길동', '08505/서울 금천구 가산디지털2로 115/509호/ (가산동, 대륭테크노타운3차)', '011-1999-4567', 69100, '2023-01-18 12:12:02'),
	(82, 'test', '테스트', '08505 서울 금천구 가산디지털2로 115 509호  (가산동, 대륭테크노타운3차)', '010-2323-2323', 150000, '2023-01-26 15:25:11'),
	(83, 'addtest1', '테스트', '08505 서울 금천구 가산디지털2로 115 509호  (가산동, 대륭테크노타운3차)', '010-1234-5678', 70000, '2023-01-26 15:27:55'),
	(84, 'goodee', '구원이', '08505 서울 금천구 가산디지털2로 115 11층 구디아카데미  (가산동)', '010-9191-9191', 110000, '2023-01-26 17:02:27'),
	(85, 'goodee', '구원이', '08505 서울 금천구 가산디지털2로 115 11층 구디아카데미  (가산동)', '010-9191-9191', 30000, '2023-01-27 09:24:26'),
	(86, 'goodee', '구원이', '08505 서울 금천구 가산디지털2로 115 11층 구디아카데미  (가산동)', '010-9191-9191', 274900, '2023-01-27 09:41:31');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

-- 테이블 shop.order_goods 구조 내보내기
DROP TABLE IF EXISTS `order_goods`;
CREATE TABLE IF NOT EXISTS `order_goods` (
  `order_code` int(11) NOT NULL,
  `goods_code` int(11) NOT NULL,
  `order_goods_price` int(11) NOT NULL,
  `order_goods_quantity` int(11) NOT NULL,
  `order_goods_state` enum('결제전','결제완료','취소','배송준비중','배송중','배송완료','구매확정') NOT NULL,
  PRIMARY KEY (`order_code`,`goods_code`),
  KEY `fk_orders_has_goods_goods1_idx` (`goods_code`),
  KEY `fk_orders_has_goods_orders1_idx` (`order_code`),
  CONSTRAINT `fk_orders_has_goods_goods1` FOREIGN KEY (`goods_code`) REFERENCES `goods` (`goods_code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_has_goods_orders1` FOREIGN KEY (`order_code`) REFERENCES `orders` (`order_code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 shop.order_goods:~137 rows (대략적) 내보내기
DELETE FROM `order_goods`;
/*!40000 ALTER TABLE `order_goods` DISABLE KEYS */;
INSERT INTO `order_goods` (`order_code`, `goods_code`, `order_goods_price`, `order_goods_quantity`, `order_goods_state`) VALUES
	(1, 10, 40000, 2, '배송완료'),
	(2, 12, 40000, 2, '배송완료'),
	(3, 8, 30000, 2, '배송완료'),
	(4, 21, 30000, 2, '배송완료'),
	(5, 17, 80000, 3, '배송완료'),
	(6, 9, 40000, 1, '배송완료'),
	(6, 17, 80000, 2, '배송완료'),
	(6, 20, 70000, 2, '배송완료'),
	(7, 4, 40000, 2, '배송완료'),
	(7, 17, 80000, 1, '배송완료'),
	(8, 5, 60000, 4, '배송완료'),
	(8, 16, 30000, 2, '배송완료'),
	(8, 17, 80000, 1, '배송완료'),
	(9, 15, 35000, 2, '배송완료'),
	(9, 20, 70000, 3, '배송완료'),
	(10, 3, 30000, 2, '배송완료'),
	(10, 19, 80000, 5, '배송완료'),
	(11, 9, 40000, 3, '배송완료'),
	(11, 20, 70000, 1, '배송완료'),
	(12, 7, 30000, 4, '배송완료'),
	(12, 19, 80000, 3, '배송완료'),
	(12, 21, 30000, 4, '배송완료'),
	(13, 21, 30000, 3, '배송완료'),
	(14, 4, 40000, 5, '배송완료'),
	(15, 8, 30000, 4, '배송완료'),
	(15, 21, 30000, 4, '배송완료'),
	(16, 5, 60000, 4, '배송완료'),
	(16, 18, 90000, 5, '배송완료'),
	(17, 4, 40000, 3, '배송완료'),
	(17, 12, 40000, 2, '배송완료'),
	(17, 18, 90000, 2, '배송완료'),
	(17, 19, 80000, 5, '배송완료'),
	(18, 6, 40000, 5, '배송완료'),
	(19, 3, 30000, 3, '구매확정'),
	(19, 8, 30000, 1, '배송완료'),
	(19, 21, 30000, 3, '배송완료'),
	(20, 8, 30000, 4, '배송완료'),
	(21, 3, 30000, 4, '배송완료'),
	(21, 12, 40000, 5, '배송완료'),
	(21, 18, 90000, 1, '배송완료'),
	(22, 12, 40000, 3, '배송완료'),
	(23, 3, 30000, 4, '배송완료'),
	(23, 12, 40000, 1, '배송완료'),
	(24, 4, 40000, 5, '배송완료'),
	(24, 7, 30000, 5, '배송완료'),
	(24, 19, 80000, 5, '배송완료'),
	(25, 16, 30000, 2, '배송완료'),
	(26, 9, 40000, 4, '배송완료'),
	(27, 16, 30000, 3, '배송완료'),
	(27, 18, 90000, 2, '배송완료'),
	(28, 5, 60000, 3, '배송완료'),
	(28, 10, 40000, 3, '배송완료'),
	(29, 9, 40000, 1, '배송완료'),
	(30, 17, 80000, 5, '배송완료'),
	(31, 3, 30000, 1, '배송완료'),
	(31, 4, 40000, 2, '배송완료'),
	(31, 6, 40000, 5, '배송완료'),
	(32, 9, 40000, 1, '배송완료'),
	(32, 13, 40000, 2, '배송완료'),
	(32, 14, 35000, 4, '배송완료'),
	(33, 17, 80000, 2, '구매확정'),
	(34, 14, 35000, 1, '배송완료'),
	(34, 21, 30000, 3, '배송완료'),
	(35, 3, 30000, 3, '배송완료'),
	(35, 7, 30000, 4, '배송완료'),
	(36, 4, 40000, 1, '배송완료'),
	(36, 5, 60000, 1, '배송완료'),
	(36, 6, 40000, 2, '배송완료'),
	(36, 10, 40000, 5, '배송완료'),
	(37, 14, 35000, 4, '배송완료'),
	(37, 17, 80000, 3, '배송완료'),
	(38, 14, 35000, 3, '배송완료'),
	(39, 12, 40000, 5, '배송완료'),
	(40, 8, 30000, 5, '배송완료'),
	(40, 13, 40000, 4, '배송완료'),
	(41, 4, 40000, 4, '배송완료'),
	(41, 12, 40000, 1, '배송완료'),
	(41, 17, 80000, 2, '배송완료'),
	(42, 7, 30000, 5, '배송완료'),
	(43, 18, 90000, 2, '구매확정'),
	(44, 13, 40000, 5, '배송완료'),
	(44, 17, 80000, 5, '배송완료'),
	(45, 14, 35000, 5, '배송완료'),
	(45, 15, 35000, 4, '배송완료'),
	(46, 17, 80000, 2, '배송완료'),
	(47, 5, 60000, 2, '배송완료'),
	(47, 6, 40000, 2, '배송완료'),
	(47, 18, 90000, 5, '배송완료'),
	(47, 20, 70000, 3, '배송완료'),
	(48, 7, 30000, 4, '배송완료'),
	(49, 21, 30000, 2, '배송완료'),
	(50, 17, 80000, 2, '배송완료'),
	(51, 3, 30000, 1, '배송완료'),
	(52, 3, 30000, 1, '배송완료'),
	(52, 4, 40000, 1, '배송완료'),
	(53, 3, 30000, 1, '배송완료'),
	(53, 4, 40000, 1, '배송완료'),
	(54, 3, 30000, 1, '배송완료'),
	(54, 4, 40000, 1, '배송완료'),
	(55, 3, 30000, 1, '배송완료'),
	(55, 4, 40000, 1, '배송완료'),
	(56, 3, 30000, 1, '배송완료'),
	(56, 4, 40000, 1, '배송완료'),
	(58, 3, 30000, 1, '배송완료'),
	(59, 3, 30000, 1, '배송완료'),
	(59, 6, 40000, 1, '배송완료'),
	(59, 8, 30000, 1, '배송완료'),
	(59, 10, 40000, 1, '배송완료'),
	(60, 3, 30000, 2, '배송완료'),
	(60, 4, 40000, 5, '배송완료'),
	(61, 3, 30000, 5, '배송완료'),
	(61, 4, 40000, 5, '배송완료'),
	(64, 3, 30000, 5, '구매확정'),
	(64, 4, 40000, 5, '구매확정'),
	(65, 3, 30000, 10, '배송완료'),
	(66, 4, 40000, 2, '배송준비중'),
	(67, 3, 30000, 2, '취소'),
	(67, 4, 40000, 2, '결제완료'),
	(68, 3, 30000, 1, '결제전'),
	(69, 3, 30000, 1, '결제전'),
	(69, 9, 40000, 2, '결제전'),
	(69, 14, 35000, 1, '결제전'),
	(69, 19, 80000, 1, '결제전'),
	(69, 20, 70000, 2, '결제전'),
	(70, 20, 70000, 1, '결제전'),
	(71, 20, 70000, 1, '결제전'),
	(72, 19, 80000, 2, '결제전'),
	(73, 20, 70000, 1, '결제전'),
	(81, 20, 70000, 1, '결제전'),
	(82, 4, 40000, 3, '결제전'),
	(82, 21, 30000, 1, '결제전'),
	(83, 20, 70000, 1, '결제전'),
	(84, 7, 30000, 1, '배송완료'),
	(84, 19, 80000, 1, '구매확정'),
	(85, 3, 30000, 1, '구매확정'),
	(86, 14, 35000, 1, '구매확정'),
	(86, 19, 80000, 3, '배송완료');
/*!40000 ALTER TABLE `order_goods` ENABLE KEYS */;

-- 테이블 shop.outid 구조 내보내기
DROP TABLE IF EXISTS `outid`;
CREATE TABLE IF NOT EXISTS `outid` (
  `id` varchar(100) NOT NULL COMMENT '사용했던 ID',
  `createdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '탈퇴일자'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer, Emp에서 탈퇴한 ID 목록\\r\\n\\r\\n새로운 ID 생성시 ID목록(customer + emp + outId)에 존재하지 않는 아이디만 사용가능';

-- 테이블 데이터 shop.outid:~1 rows (대략적) 내보내기
DELETE FROM `outid`;
/*!40000 ALTER TABLE `outid` DISABLE KEYS */;
INSERT INTO `outid` (`id`, `createdate`) VALUES
	('out', '2023-01-10 14:26:14');
/*!40000 ALTER TABLE `outid` ENABLE KEYS */;

-- 테이블 shop.point_history 구조 내보내기
DROP TABLE IF EXISTS `point_history`;
CREATE TABLE IF NOT EXISTS `point_history` (
  `order_code` int(11) NOT NULL,
  `point_kind` enum('적립','사용') NOT NULL COMMENT '포인트 적립(사용)식별',
  `point` int(11) NOT NULL COMMENT '포인트',
  `createdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '적립(사용)일',
  KEY `fk_point_history_order_goods1` (`order_code`),
  CONSTRAINT `fk_point_history_order_goods1` FOREIGN KEY (`order_code`) REFERENCES `order_goods` (`order_code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='포인트 이력 테이블\\r\\n리뷰를 달면 포인트 지급';

-- 테이블 데이터 shop.point_history:~20 rows (대략적) 내보내기
DELETE FROM `point_history`;
/*!40000 ALTER TABLE `point_history` DISABLE KEYS */;
INSERT INTO `point_history` (`order_code`, `point_kind`, `point`, `createdate`) VALUES
	(67, '적립', 800, '2023-01-11 19:36:02'),
	(67, '적립', 600, '2023-01-11 19:36:37'),
	(68, '사용', 1400, '2023-01-11 20:12:59'),
	(58, '적립', 300, '2023-01-12 09:58:45'),
	(64, '적립', 1500, '2023-01-12 11:07:10'),
	(69, '사용', 0, '2023-01-12 11:10:56'),
	(70, '사용', 0, '2023-01-18 10:15:59'),
	(71, '사용', 0, '2023-01-18 10:18:34'),
	(72, '사용', 0, '2023-01-18 10:39:23'),
	(73, '사용', 0, '2023-01-18 10:45:00'),
	(19, '적립', 900, '2023-01-18 11:08:15'),
	(81, '사용', 900, '2023-01-18 12:12:02'),
	(43, '적립', 1800, '2023-01-18 12:13:23'),
	(33, '적립', 1600, '2023-01-18 12:13:30'),
	(82, '사용', 0, '2023-01-26 15:25:11'),
	(83, '사용', 0, '2023-01-26 15:27:55'),
	(84, '사용', 0, '2023-01-26 17:02:27'),
	(85, '사용', 0, '2023-01-27 09:24:26'),
	(85, '적립', 300, '2023-01-27 09:28:18'),
	(86, '사용', 100, '2023-01-27 09:41:31');
/*!40000 ALTER TABLE `point_history` ENABLE KEYS */;

-- 테이블 shop.pw_history 구조 내보내기
DROP TABLE IF EXISTS `pw_history`;
CREATE TABLE IF NOT EXISTS `pw_history` (
  `customer_id` varchar(100) NOT NULL COMMENT '고객 ID',
  `pw` varchar(100) NOT NULL COMMENT 'PW',
  `createdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '변경일',
  PRIMARY KEY (`customer_id`,`pw`),
  CONSTRAINT `FK_pw_history_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='pw 변경 이력 = id 당 최근 3개만';

-- 테이블 데이터 shop.pw_history:~6 rows (대략적) 내보내기
DELETE FROM `pw_history`;
/*!40000 ALTER TABLE `pw_history` DISABLE KEYS */;
INSERT INTO `pw_history` (`customer_id`, `pw`, `createdate`) VALUES
	('addtest1', '*A4B6157319038724E3560894F7F932C8886EBFCF', '2023-01-25 13:51:03'),
	('choi', '*A4B6157319038724E3560894F7F932C8886EBFCF', '2023-01-10 15:58:04'),
	('goodee', '*A4B6157319038724E3560894F7F932C8886EBFCF', '2023-01-26 17:01:53'),
	('hong', '*A4B6157319038724E3560894F7F932C8886EBFCF', '2023-01-10 10:46:31'),
	('hong', '*F13ACB16013CCF84877CED35B9DB9105C0C98A43', '2023-01-16 16:05:07'),
	('test', '*A4B6157319038724E3560894F7F932C8886EBFCF', '2023-01-10 10:47:12');
/*!40000 ALTER TABLE `pw_history` ENABLE KEYS */;

-- 테이블 shop.question 구조 내보내기
DROP TABLE IF EXISTS `question`;
CREATE TABLE IF NOT EXISTS `question` (
  `question_code` int(11) NOT NULL AUTO_INCREMENT COMMENT '문의내역 식별 코드',
  `order_code` int(11) NOT NULL,
  `goods_code` int(11) NOT NULL,
  `category` enum('배송','반품','교환','기타') NOT NULL COMMENT '문의내역 종류',
  `question_title` varchar(100) NOT NULL COMMENT '문의 제목',
  `question_memo` text NOT NULL COMMENT '문의내역 내용',
  `createdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '작성일',
  PRIMARY KEY (`question_code`),
  KEY `fk_question_order_goods1_idx` (`order_code`,`goods_code`),
  CONSTRAINT `fk_question_order_goods1` FOREIGN KEY (`order_code`, `goods_code`) REFERENCES `order_goods` (`order_code`, `goods_code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='문의내역';

-- 테이블 데이터 shop.question:~14 rows (대략적) 내보내기
DELETE FROM `question`;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` (`question_code`, `order_code`, `goods_code`, `category`, `question_title`, `question_memo`, `createdate`) VALUES
	(5, 1, 10, '배송', 'adipiscing lorem', 'ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia', '2022-04-27 00:00:00'),
	(6, 15, 8, '교환', 'massa', 'id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus', '2022-06-17 00:00:00'),
	(7, 4, 21, '배송', 'nec', 'nulla nunc purus phasellus in felis donec semper sapien a libero', '2022-10-21 00:00:00'),
	(8, 17, 18, '배송', 'nascetur', 'eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse', '2022-07-05 00:00:00'),
	(9, 11, 9, '배송', 'iaculis', 'in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst', '2022-10-11 00:00:00'),
	(10, 10, 3, '배송', 'sit', 'eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit', '2022-06-20 00:00:00'),
	(11, 17, 19, '배송', 'quam pharetra magna', 'ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac', '2022-09-06 00:00:00'),
	(12, 30, 17, '교환', 'at ipsum', 'quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis', '2022-02-20 00:00:00'),
	(13, 32, 9, '배송', 'faucibus accumsan', 'duis consequat dui nec nisi volutpat eleifend donec ut dolor', '2022-12-01 00:00:00'),
	(14, 31, 3, '교환', 'suspendisse potenti', 'lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque', '2022-06-18 00:00:00'),
	(16, 34, 21, '배송', 'suspendisse potenti', 'sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa', '2022-07-08 00:00:00'),
	(17, 35, 7, '배송', 'ut erat id', 'facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit', '2022-12-07 00:00:00'),
	(18, 36, 4, '배송', 'vulputate nonummy', 'sed vestibulum sit amet cursus id turpis integer aliquet massa', '2022-04-22 00:00:00'),
	(19, 40, 13, '반품', 'convallis', 'dictumst etiam faucibus cursus urna ut tellus nulla ut erat', '2022-06-07 00:00:00');
/*!40000 ALTER TABLE `question` ENABLE KEYS */;

-- 테이블 shop.question_comment 구조 내보내기
DROP TABLE IF EXISTS `question_comment`;
CREATE TABLE IF NOT EXISTS `question_comment` (
  `comment_code` int(11) NOT NULL AUTO_INCREMENT COMMENT '답변 식별 코드',
  `question_code` int(11) NOT NULL COMMENT '문의내역 식별 코드',
  `comment_memo` text NOT NULL COMMENT '답변 내용',
  `createdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '답변 작성일',
  PRIMARY KEY (`comment_code`),
  KEY `FK_question_comment_question` (`question_code`),
  CONSTRAINT `FK_question_comment_question` FOREIGN KEY (`question_code`) REFERENCES `question` (`question_code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='문의내역에 대한 답변';

-- 테이블 데이터 shop.question_comment:~11 rows (대략적) 내보내기
DELETE FROM `question_comment`;
/*!40000 ALTER TABLE `question_comment` DISABLE KEYS */;
INSERT INTO `question_comment` (`comment_code`, `question_code`, `comment_memo`, `createdate`) VALUES
	(1, 5, 'viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit', '2023-01-10 14:22:10'),
	(2, 19, 'curabitur in libero ut massa volutpat convallis morbi odio odio', '2023-01-10 14:22:10'),
	(3, 9, 'vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia', '2023-01-10 14:22:10'),
	(4, 16, 'turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo', '2023-01-10 14:22:10'),
	(5, 6, 'neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut', '2023-01-10 14:22:10'),
	(6, 8, 'mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient', '2023-01-10 14:22:10'),
	(7, 11, 'curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel', '2023-01-10 14:22:10'),
	(8, 12, 'nisi volutpat eleifend donec ut dolor morbi vel lectus in quam', '2023-01-10 14:22:10'),
	(9, 16, 'ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a', '2023-01-10 14:22:10'),
	(10, 7, 'viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris', '2023-01-10 14:22:10'),
	(11, 12, 'dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend', '2023-01-10 14:22:10');
/*!40000 ALTER TABLE `question_comment` ENABLE KEYS */;

-- 테이블 shop.review 구조 내보내기
DROP TABLE IF EXISTS `review`;
CREATE TABLE IF NOT EXISTS `review` (
  `order_code` int(11) NOT NULL,
  `goods_code` int(11) NOT NULL,
  `review_memo` text NOT NULL,
  `star` int(11) NOT NULL,
  `createdate` datetime NOT NULL,
  PRIMARY KEY (`order_code`,`goods_code`),
  CONSTRAINT `fk_review_order_goods1` FOREIGN KEY (`order_code`, `goods_code`) REFERENCES `order_goods` (`order_code`, `goods_code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 shop.review:~5 rows (대략적) 내보내기
DELETE FROM `review`;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` (`order_code`, `goods_code`, `review_memo`, `star`, `createdate`) VALUES
	(19, 3, '9jhjkh', 2, '2023-01-18 11:08:15'),
	(33, 17, '4214', 4, '2023-01-18 12:13:30'),
	(43, 18, 'kk', 4, '2023-01-18 12:13:23'),
	(64, 3, 'fgc', 2, '2023-01-12 11:07:10'),
	(85, 3, 'gooooooooooooooooooooood', 5, '2023-01-27 09:28:18');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;

-- 테이블 shop.site_count 구조 내보내기
DROP TABLE IF EXISTS `site_count`;
CREATE TABLE IF NOT EXISTS `site_count` (
  `count_date` date NOT NULL COMMENT '일자',
  `count_num` int(11) NOT NULL COMMENT '일자 별 접속자 수',
  PRIMARY KEY (`count_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='해당 사이트 방문자';

-- 테이블 데이터 shop.site_count:~25 rows (대략적) 내보내기
DELETE FROM `site_count`;
/*!40000 ALTER TABLE `site_count` DISABLE KEYS */;
INSERT INTO `site_count` (`count_date`, `count_num`) VALUES
	('2022-12-30', 77),
	('2023-01-01', 5),
	('2023-01-24', 59),
	('2023-01-25', 100),
	('2023-01-26', 50),
	('2023-01-27', 48),
	('2023-01-28', 38),
	('2023-01-30', 9),
	('2023-01-31', 4),
	('2023-02-01', 5),
	('2023-02-02', 3),
	('2023-02-03', 1),
	('2023-02-05', 2),
	('2023-02-06', 1),
	('2023-02-07', 3),
	('2023-02-08', 8),
	('2023-02-09', 4),
	('2023-02-13', 4),
	('2023-02-14', 2),
	('2023-02-15', 4),
	('2023-02-16', 2),
	('2023-02-17', 1),
	('2023-02-18', 2),
	('2023-02-19', 26),
	('2023-02-20', 15);
/*!40000 ALTER TABLE `site_count` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
