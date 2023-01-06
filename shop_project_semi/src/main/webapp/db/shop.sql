-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.5.17-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- shop 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `shop` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `shop`;

-- 테이블 shop.auth_info 구조 내보내기
CREATE TABLE IF NOT EXISTS `auth_info` (
  `auth_code` int(11) NOT NULL COMMENT '권한 코드',
  `auth_memo` text NOT NULL COMMENT '권한 별 설명',
  `createdate` datetime NOT NULL DEFAULT current_timestamp() COMMENT '권한 생성 날짜',
  `updatedate` datetime NOT NULL DEFAULT current_timestamp() COMMENT '권한 최신 업데이트 날짜',
  PRIMARY KEY (`auth_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='관리자 등급';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 shop.cart 구조 내보내기
CREATE TABLE IF NOT EXISTS `cart` (
  `goods_code` int(11) NOT NULL COMMENT '장바구니 코드',
  `customer_id` varchar(100) NOT NULL COMMENT '회원 ID',
  `cart_quantity` int(11) NOT NULL COMMENT '카트 물건 수량',
  `createdate` datetime NOT NULL DEFAULT current_timestamp() COMMENT '장바구니 생성 날짜',
  PRIMARY KEY (`goods_code`,`customer_id`),
  KEY `FK_cart_customer` (`customer_id`),
  CONSTRAINT `FK_cart_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_cart_goods` FOREIGN KEY (`goods_code`) REFERENCES `goods` (`goods_code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='장바구니';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 shop.customer 구조 내보내기
CREATE TABLE IF NOT EXISTS `customer` (
  `customer_code` int(11) NOT NULL AUTO_INCREMENT COMMENT '고객 번호',
  `customer_id` varchar(100) NOT NULL COMMENT '고객 ID',
  `customer_pw` varchar(100) NOT NULL COMMENT '고객 PW (반정규화)',
  `customer_name` varchar(100) NOT NULL COMMENT '고객 이름',
  `customer_phone` varchar(100) NOT NULL COMMENT '고객 전화번호',
  `point` int(11) NOT NULL COMMENT '보유 포인트(반정규화)',
  `createdate` datetime NOT NULL DEFAULT current_timestamp() COMMENT '고객 가입 날짜',
  `updatedate` datetime NOT NULL DEFAULT current_timestamp() COMMENT '고객정보 최신 업데이트 날짜',
  PRIMARY KEY (`customer_code`),
  UNIQUE KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='고객';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 shop.customer_address 구조 내보내기
CREATE TABLE IF NOT EXISTS `customer_address` (
  `address_code` int(11) NOT NULL AUTO_INCREMENT COMMENT '주소 식별 번호',
  `customer_id` varchar(100) NOT NULL COMMENT '고객 ID',
  `address` text NOT NULL COMMENT '주소',
  `createdate` datetime NOT NULL DEFAULT current_timestamp() COMMENT '주소 생성 날짜',
  `updatedate` datetime NOT NULL DEFAULT current_timestamp() COMMENT '주소 최신 업데이트 날짜',
  PRIMARY KEY (`address_code`),
  KEY `FK__customer` (`customer_id`),
  CONSTRAINT `FK__customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='고객 주소';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 shop.emp 구조 내보내기
CREATE TABLE IF NOT EXISTS `emp` (
  `emp_code` int(11) NOT NULL AUTO_INCREMENT COMMENT '사원번호',
  `emp_id` varchar(100) NOT NULL COMMENT '사원 ID',
  `emp_pw` varchar(100) NOT NULL COMMENT '사원 PW',
  `emp_name` varchar(100) NOT NULL COMMENT '사원 이름',
  `active` enum('Y','N') NOT NULL DEFAULT 'N' COMMENT 'Y :계정사용가능, N:계정사용불가',
  `auth_code` int(11) DEFAULT NULL COMMENT '관리자권한(최초 권한없음)',
  `createdate` datetime NOT NULL DEFAULT current_timestamp() COMMENT '계정 생성 날짜',
  `updatedate` datetime NOT NULL DEFAULT current_timestamp() COMMENT '계정 최신 업데이트 날짜',
  PRIMARY KEY (`emp_code`),
  UNIQUE KEY `emp_id` (`emp_id`),
  KEY `FK_emp_auth_info` (`auth_code`),
  CONSTRAINT `FK_emp_auth_info` FOREIGN KEY (`auth_code`) REFERENCES `auth_info` (`auth_code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='사원 목록(해당 샵 직원)';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 shop.goods 구조 내보내기
CREATE TABLE IF NOT EXISTS `goods` (
  `goods_code` int(11) NOT NULL AUTO_INCREMENT COMMENT '상품 번호',
  `goods_name` varchar(100) NOT NULL COMMENT '상품 이름',
  `goods_price` int(11) NOT NULL COMMENT '상품 가격',
  `sold_out` enum('Y','N') NOT NULL COMMENT 'Y:품절, N:재고있음',
  `emp_id` varchar(100) NOT NULL COMMENT '상품 등록한 스탭ID',
  `hit` int(11) NOT NULL DEFAULT 0 COMMENT '인기상품 반영',
  `createdate` datetime NOT NULL DEFAULT current_timestamp() COMMENT '상품 등록 날짜',
  `updatedate` datetime NOT NULL DEFAULT current_timestamp() COMMENT '상품 최신 업데이트 날짜',
  PRIMARY KEY (`goods_code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='상품 목록';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 shop.goods_img 구조 내보내기
CREATE TABLE IF NOT EXISTS `goods_img` (
  `goods_img_code` int(11) NOT NULL,
  `filename` varchar(100) NOT NULL COMMENT 'IMG File 이름',
  `origin_name` varchar(100) NOT NULL COMMENT 'IMG File origin 이름',
  `content_type` varchar(100) NOT NULL COMMENT 'IMG File 타입',
  `createdate` datetime NOT NULL DEFAULT current_timestamp() COMMENT '상품 이미지 등록날짜',
  `updatedate` datetime NOT NULL DEFAULT current_timestamp() COMMENT '상품 이미지 최신 업데이트 날짜',
  `goods_code` int(11) NOT NULL,
  PRIMARY KEY (`goods_img_code`),
  KEY `fk_goods_img_goods1_idx` (`goods_code`) USING BTREE,
  CONSTRAINT `fk_goods_img_goods1` FOREIGN KEY (`goods_code`) REFERENCES `goods` (`goods_code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='상품 이미지';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 shop.notice 구조 내보내기
CREATE TABLE IF NOT EXISTS `notice` (
  `notice_code` int(11) NOT NULL AUTO_INCREMENT COMMENT '공지사항 식별 코드',
  `notice_title` varchar(200) NOT NULL COMMENT '공지사항 제목',
  `notice_content` text NOT NULL COMMENT '공지사항 내용',
  `emp_name` varchar(100) NOT NULL COMMENT '작성자(사원) 이름',
  `createdate` datetime NOT NULL DEFAULT current_timestamp() COMMENT '공지사항 작성일',
  PRIMARY KEY (`notice_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='공지사항 게시판';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 shop.orders 구조 내보내기
CREATE TABLE IF NOT EXISTS `orders` (
  `order_code` int(11) NOT NULL AUTO_INCREMENT COMMENT '주문번호',
  `address_code` int(11) NOT NULL COMMENT '주소 식별 코드',
  `customer_id` varchar(100) NOT NULL COMMENT '고객 ID',
  `order_price` int(11) NOT NULL COMMENT '주문 총 금액',
  `order_state` enum('결제','취소','배송중','배송완료','구매확정') NOT NULL COMMENT '주문 상태',
  `createdate` datetime NOT NULL DEFAULT current_timestamp() COMMENT '주문 날짜',
  PRIMARY KEY (`order_code`),
  KEY `FK_orders_customer_address` (`address_code`),
  KEY `FK_orders_customer` (`customer_id`),
  CONSTRAINT `FK_orders_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_orders_customer_address` FOREIGN KEY (`address_code`) REFERENCES `customer_address` (`address_code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='주문 목록';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 shop.order_goods 구조 내보내기
CREATE TABLE IF NOT EXISTS `order_goods` (
  `order_code` int(11) NOT NULL,
  `goods_code` int(11) NOT NULL,
  `order_goods_price` int(11) NOT NULL,
  `order_goods_quantity` int(11) NOT NULL,
  PRIMARY KEY (`order_code`,`goods_code`),
  KEY `fk_orders_has_goods_goods1_idx` (`goods_code`),
  KEY `fk_orders_has_goods_orders1_idx` (`order_code`),
  CONSTRAINT `fk_orders_has_goods_goods1` FOREIGN KEY (`goods_code`) REFERENCES `goods` (`goods_code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_has_goods_orders1` FOREIGN KEY (`order_code`) REFERENCES `orders` (`order_code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 shop.outid 구조 내보내기
CREATE TABLE IF NOT EXISTS `outid` (
  `id` varchar(100) NOT NULL COMMENT '사용했던 ID',
  `createdate` datetime NOT NULL DEFAULT current_timestamp() COMMENT '탈퇴일자'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer, Emp에서 탈퇴한 ID 목록\\r\\n\\r\\n새로운 ID 생성시 ID목록(customer + emp + outId)에 존재하지 않는 아이디만 사용가능';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 shop.point_history 구조 내보내기
CREATE TABLE IF NOT EXISTS `point_history` (
  `order_goods_order_code` int(11) NOT NULL,
  `order_goods_goods_code` int(11) NOT NULL,
  `point_kind` enum('적립','사용') NOT NULL COMMENT '포인트 적립(사용)식별',
  `point` int(11) NOT NULL COMMENT '포인트',
  `createdate` datetime NOT NULL DEFAULT current_timestamp() COMMENT '적립(사용)일',
  PRIMARY KEY (`order_goods_order_code`,`order_goods_goods_code`),
  CONSTRAINT `fk_point_history_order_goods1` FOREIGN KEY (`order_goods_order_code`, `order_goods_goods_code`) REFERENCES `order_goods` (`order_code`, `goods_code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='포인트 이력 테이블\\r\\n리뷰를 달면 포인트 지급';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 shop.pw_history 구조 내보내기
CREATE TABLE IF NOT EXISTS `pw_history` (
  `customer_id` varchar(100) NOT NULL COMMENT '고객 ID',
  `pw` varchar(100) NOT NULL COMMENT 'PW',
  `createdate` datetime NOT NULL DEFAULT current_timestamp() COMMENT '변경일',
  PRIMARY KEY (`customer_id`,`pw`),
  CONSTRAINT `FK_pw_history_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='pw 변경 이력 = id 당 최근 3개만';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 shop.question 구조 내보내기
CREATE TABLE IF NOT EXISTS `question` (
  `question_code` int(11) NOT NULL AUTO_INCREMENT COMMENT '문의내역 식별 코드',
  `order_code` int(11) NOT NULL COMMENT '주문 식별 코드',
  `category` enum('배송','반품','교환','기타') NOT NULL COMMENT '문의내역 종류',
  `question_memo` text NOT NULL COMMENT '문의내역 내용',
  `createdate` datetime NOT NULL DEFAULT current_timestamp() COMMENT '작성일',
  PRIMARY KEY (`question_code`),
  KEY `FK_question_orders` (`order_code`),
  CONSTRAINT `FK_question_orders` FOREIGN KEY (`order_code`) REFERENCES `orders` (`order_code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='문의내역';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 shop.question_comment 구조 내보내기
CREATE TABLE IF NOT EXISTS `question_comment` (
  `comment_code` int(11) NOT NULL AUTO_INCREMENT COMMENT '답변 식별 코드',
  `question_code` int(11) NOT NULL COMMENT '문의내역 식별 코드',
  `comment_memo` text NOT NULL COMMENT '답변 내용',
  `createdate` datetime NOT NULL DEFAULT current_timestamp() COMMENT '답변 작성일',
  PRIMARY KEY (`comment_code`),
  KEY `FK_question_comment_question` (`question_code`),
  CONSTRAINT `FK_question_comment_question` FOREIGN KEY (`question_code`) REFERENCES `question` (`question_code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='문의내역에 대한 답변';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 shop.review 구조 내보내기
CREATE TABLE IF NOT EXISTS `review` (
  `order_goods_order_code` int(11) NOT NULL,
  `order_goods_goods_code` int(11) NOT NULL,
  `review_memo` varchar(100) NOT NULL,
  `star` int(11) NOT NULL,
  `createdate` datetime NOT NULL,
  PRIMARY KEY (`order_goods_order_code`,`order_goods_goods_code`),
  CONSTRAINT `fk_review_order_goods1` FOREIGN KEY (`order_goods_order_code`, `order_goods_goods_code`) REFERENCES `order_goods` (`order_code`, `goods_code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 shop.site_count 구조 내보내기
CREATE TABLE IF NOT EXISTS `site_count` (
  `count_date` date NOT NULL COMMENT '일자',
  `count_num` int(11) NOT NULL COMMENT '일자 별 접속자 수',
  PRIMARY KEY (`count_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='해당 사이트 방문자';

-- 내보낼 데이터가 선택되어 있지 않습니다.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
