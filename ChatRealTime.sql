-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               11.3.2-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for chat_project
CREATE DATABASE IF NOT EXISTS `chat_project` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
USE `chat_project`;

-- Dumping structure for table chat_project.chat_box
CREATE TABLE IF NOT EXISTS `chat_box` (
  `chat_box_id` varchar(255) NOT NULL,
  `chat_box_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `customer_id` varchar(255) DEFAULT NULL,
  `employee_id` varchar(255) DEFAULT NULL,
  `website_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`chat_box_id`),
  KEY `employeechat` (`employee_id`),
  KEY `customerchat` (`customer_id`),
  KEY `websitechat` (`website_id`),
  CONSTRAINT `customerchat` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `employeechat` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`),
  CONSTRAINT `websitechat` FOREIGN KEY (`website_id`) REFERENCES `website` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table chat_project.chat_box: ~7 rows (approximately)
INSERT INTO `chat_box` (`chat_box_id`, `chat_box_name`, `customer_id`, `employee_id`, `website_id`) VALUES
	('17500ab4-bfac-472b-acad-10da130fd17d', 'luong', 'e1edc6ed-af33-4a72-acfc-9219ce778d46', '6dc6e559-54fe-4f27-9b7a-d34a828cc6e1', '0b540eb8-967d-4e71-99bb-4a8731c554a7'),
	('92666ea4-fd59-45e9-a224-bf3ff2df6b20', 'Test User', 'ea6d0c66-2e3a-4432-87ed-bc5e7023f18b', '6dc6e559-54fe-4f27-9b7a-d34a828cc6e1', '0b540eb8-967d-4e71-99bb-4a8731c554a7'),
	('b85297be-4a41-4e77-9675-aa9a14639d99', 'luong', '3103225b-b88a-468f-b769-34cfc9237ec9', '6dc6e559-54fe-4f27-9b7a-d34a828cc6e1', '0b540eb8-967d-4e71-99bb-4a8731c554a7'),
	('bbbeb90a-d513-42df-b99e-795d79f7d876', 'luong', '6bb2a0ea-e0cb-4110-9b7b-2ae2474d8aca', '6dc6e559-54fe-4f27-9b7a-d34a828cc6e1', '0b540eb8-967d-4e71-99bb-4a8731c554a7'),
	('dfa87236-4621-4259-a2f4-8a829aff715c', 'Viet', '94f5b377-2790-4c93-89be-a9552add21bd', '6dc6e559-54fe-4f27-9b7a-d34a828cc6e1', '0b540eb8-967d-4e71-99bb-4a8731c554a7'),
	('e1d275da-21ce-42cc-abb8-b78aaaa14f4f', '', '6311b23e-bcfa-4983-83ab-89db0dfee54f', '6dc6e559-54fe-4f27-9b7a-d34a828cc6e1', '0b540eb8-967d-4e71-99bb-4a8731c554a7'),
	('fdd6d34b-b74f-4aea-842d-ef5d120cf35a', NULL, '70c7ff92-d696-45e8-afef-d1010147af90', '6dc6e559-54fe-4f27-9b7a-d34a828cc6e1', '0b540eb8-967d-4e71-99bb-4a8731c554a7');

-- Dumping structure for table chat_project.customer
CREATE TABLE IF NOT EXISTS `customer` (
  `customer_id` varchar(255) NOT NULL,
  `customer_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `oauth_key` varchar(255) DEFAULT NULL,
  `oauth_token` varchar(255) DEFAULT NULL,
  `source` tinyint(4) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `is_online` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table chat_project.customer: ~7 rows (approximately)
INSERT INTO `customer` (`customer_id`, `customer_name`, `oauth_key`, `oauth_token`, `source`, `phone_number`, `is_online`) VALUES
	('3103225b-b88a-468f-b769-34cfc9237ec9', 'luong', 'no', 'no', 0, '13', 0),
	('6311b23e-bcfa-4983-83ab-89db0dfee54f', '', 'no', 'no', 0, 'no', 0),
	('6bb2a0ea-e0cb-4110-9b7b-2ae2474d8aca', 'luong', 'no', 'no', 0, '13', 0),
	('70c7ff92-d696-45e8-afef-d1010147af90', 'Guest 70c7ff92-d696-45e8-afef-d1010147af90', 'no', 'no', 0, '0123456780', 0),
	('94f5b377-2790-4c93-89be-a9552add21bd', 'Viet', 'no', 'no', 0, '012342130', 0),
	('e1edc6ed-af33-4a72-acfc-9219ce778d46', 'luong', 'no', 'no', 0, '1', 0),
	('ea6d0c66-2e3a-4432-87ed-bc5e7023f18b', 'Test User', 'no', 'no', 0, '0123456789', 0);

-- Dumping structure for table chat_project.employee
CREATE TABLE IF NOT EXISTS `employee` (
  `employee_id` varchar(255) NOT NULL,
  `employee_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` bigint(20) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table chat_project.employee: ~2 rows (approximately)
INSERT INTO `employee` (`employee_id`, `employee_name`, `phone_number`, `username`, `password`, `email`, `status`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES
	('33d75a3d-f934-4857-aa31-3ee3e4b1ae22', 'Dương', '0988888888', 'duong', '1', 'duong@chat.com', 1, 'admin', 1713712605421, 'admin', 1713712605421),
	('6dc6e559-54fe-4f27-9b7a-d34a828cc6e1', 'Luong', '0988888888', 'luong', '1', 'sale@chat.com', 1, 'admin', 1713712428420, 'admin', 1713712428420);

-- Dumping structure for table chat_project.employee_role
CREATE TABLE IF NOT EXISTS `employee_role` (
  `employee_role_id` varchar(255) NOT NULL,
  `employee_id` varchar(255) DEFAULT NULL,
  `role_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`employee_role_id`),
  KEY `employeerole` (`employee_id`),
  CONSTRAINT `employeerole` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table chat_project.employee_role: ~2 rows (approximately)
INSERT INTO `employee_role` (`employee_role_id`, `employee_id`, `role_id`) VALUES
	('20d56fa7-e779-48c0-874a-55236be36796', '6dc6e559-54fe-4f27-9b7a-d34a828cc6e1', 'SALE'),
	('d6a1488d-7e80-4c91-bad1-fe76d4fac2eb', '33d75a3d-f934-4857-aa31-3ee3e4b1ae22', 'ADMIN');

-- Dumping structure for table chat_project.group_web
CREATE TABLE IF NOT EXISTS `group_web` (
  `group_id` varchar(255) NOT NULL,
  `group_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `allow_guest` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table chat_project.group_web: ~98 rows (approximately)
INSERT INTO `group_web` (`group_id`, `group_name`, `allow_guest`) VALUES
	('00e5856e-86ea-4745-bb2e-228d19171c8a', NULL, 1),
	('01f349cc-3dcd-4747-8baa-85b1bdf13013', NULL, 1),
	('0348bd27-c7a1-4102-8dab-ce100e386be3', NULL, 1),
	('04f1940b-94f8-4a98-afc3-633004af14c3', 'nhom', 1),
	('06cfe82a-5975-4612-a2dc-3e83a982698a', NULL, 0),
	('09068c42-4568-42cc-9b3a-aad1b01b156c', NULL, 0),
	('0beea999-66aa-460e-a8c7-7596c726f9cf', NULL, 1),
	('163158f1-3c55-4aff-8443-b4adb5d5bc2a', NULL, 1),
	('19bf3cbc-c11f-42f2-b7e8-f033d76e3f4d', NULL, 1),
	('1b390a03-98c4-4f6a-9cc5-0e0427283ea6', NULL, 1),
	('1c9b1507-c113-4a8f-8e17-cb6c5f340f61', NULL, 1),
	('1daa1631-ad91-4042-8716-9c772d779260', NULL, 0),
	('1e2b09b9-acb9-479c-8ebc-40982915e73e', 'ac', 0),
	('1f9e00f7-9f86-46b9-abe6-bace393ccb3d', 'ab', 0),
	('1fbe3188-bde6-4e86-85fb-acda4041753c', NULL, 1),
	('223e4571-6a04-430a-8007-464575416ea1', 'nhom guest', 1),
	('22688123-2f10-4c75-af00-c47711900a54', NULL, 1),
	('23125ad1-7ce4-46f3-becc-c287a8eb2a20', NULL, 1),
	('24413ae7-9004-4658-8394-d9c4f758c183', NULL, 0),
	('2843a83e-7ef9-4345-a44a-899f3481ce67', NULL, 0),
	('2a1bd4e4-3dc9-426c-b1af-918a2932b648', NULL, 1),
	('2aca9a63-e99d-49b9-8acc-f8ad690b00e9', NULL, 1),
	('31d4a188-e2f7-4885-a327-ec3cc1c010a1', NULL, 1),
	('3837d660-4895-4299-aac3-6b3115f93d49', NULL, 0),
	('39391d36-10db-4d0c-a4c5-d5f994c3d29b', NULL, 1),
	('3b8d843f-3b90-4580-8002-288935d67fda', NULL, 1),
	('3f53a1aa-71e2-4f86-ae2d-ccec02c70529', NULL, 1),
	('42388ffc-a9d1-4ca6-b69b-e3ac11030bb1', NULL, 1),
	('4b4959ec-4a36-4544-9e7f-07faabcb5fe0', NULL, 0),
	('4b5835bd-e64a-4110-b991-cea1c25d2c97', NULL, 1),
	('4d607a93-2142-435b-9884-10c790159034', NULL, 1),
	('52578e38-43a9-4756-93de-4cc733ff3f3d', NULL, 1),
	('54121cc2-0a1e-4e02-8df4-4a2c6017e0e0', NULL, 0),
	('55f913c4-bc43-4b6a-9949-37bc9f3e1add', NULL, 1),
	('5ef09730-3f3f-404d-969a-34df1eed8ce8', NULL, 0),
	('5f293ffe-c079-460a-9e7e-711805fba492', NULL, 0),
	('65da7b86-b461-40ca-90d7-5e17b45636ef', NULL, 0),
	('65fa1e32-9dd8-49f2-b61e-305288b2c644', NULL, 0),
	('662dc6fa-dae2-4ae3-a5b3-12900e359eb4', NULL, 0),
	('66e6f3b3-b029-4012-a4d0-746bbf068657', NULL, 0),
	('67b7a0af-abe2-41d4-a83e-e8849a468d30', NULL, 1),
	('6b5679b0-f2e8-455e-9332-02c86a75a978', NULL, 1),
	('6bd8eeff-bf97-42c5-a06c-4c3aafc3675a', NULL, 1),
	('709175c2-b261-4e64-8ed9-9667e21bb388', NULL, 0),
	('70b1cf42-0a3c-4fa6-901a-144536cc1024', NULL, 0),
	('73386904-7279-4669-b075-a3af754fb478', NULL, 1),
	('7a77699c-bc8e-4519-bd5c-82634af459fe', NULL, 1),
	('7aeebb62-d014-46b8-9dee-2fa7b949dd32', NULL, 0),
	('7deb9919-65f5-400d-a6d3-16d036b4cd7b', NULL, 0),
	('80facb3e-a0ba-4c35-93c6-bd665ec7bb38', NULL, 1),
	('83832e1e-5d40-41e8-928e-def0664ccab5', NULL, 1),
	('85b35e6f-e260-4287-a230-18068420d713', NULL, 1),
	('86f9d837-9a64-4843-b29b-d6fea8c0d199', NULL, 0),
	('885d9472-3534-4d08-a3a6-26836ece7fc0', NULL, 0),
	('8a633053-7ac5-46ac-97b4-b79200e38baf', NULL, 0),
	('8a78419f-fe10-46e1-b34a-1ae19019c7ca', NULL, 1),
	('8e6e9255-51e0-4eb0-b861-afe6f9c8aa45', NULL, 0),
	('8ea9f263-aab8-4553-bd23-df3a8212631b', NULL, 1),
	('8ff94d5e-c904-4335-b0c7-30c2d356940b', NULL, 1),
	('909f7dcb-1aec-4720-9f27-38ae64b10d3c', NULL, 0),
	('920a545f-45c8-47be-98a1-cc95fc29d8ed', NULL, 0),
	('94368ef8-0a5e-456b-ab4e-fa4e9c4255cc', NULL, 1),
	('9c34aff4-20da-49cd-8a6e-86757956fad0', NULL, 1),
	('9c581a89-72ef-4888-9271-1a3a7eb15650', NULL, 0),
	('a13a931a-a733-402e-a436-136b3b635be6', '', 0),
	('a2ca2350-9471-49d3-8510-2593582d7dd9', NULL, 1),
	('a593942c-52ed-4cfe-936f-9708c60ebe4c', NULL, 1),
	('a887cf1e-c97b-413c-bf4d-47503fc4c2d2', NULL, 0),
	('a98f9a88-f2da-4cc4-bc6d-e07cc5cbe7c1', NULL, 0),
	('ae72db2f-040c-43ab-8860-ffc0594bbd39', NULL, 0),
	('b3dad172-578c-415a-abc5-7c10e8e3a556', NULL, 0),
	('b78de597-ff24-4514-b3e4-4bcc91d972c4', NULL, 0),
	('b95b6989-c015-4098-ab30-58db975f6ea1', NULL, 1),
	('b9e91af8-da49-4c44-89fa-b78339bfe5c3', NULL, 1),
	('bb487e04-92b7-4886-9259-2f8da90584f4', NULL, 0),
	('c25ba2d5-2e84-478a-93eb-9d121144648c', NULL, 1),
	('c2ef4bc3-9868-4ba4-a49b-896cb9711435', NULL, 0),
	('c4ff2cb0-8637-4a49-a794-859849100b97', NULL, 1),
	('c55fd8b7-8516-4102-a96f-404f0426fead', NULL, 0),
	('c8dfd4fc-eb63-4300-839f-0898ca047d3a', NULL, 1),
	('cca2372c-1bcc-4233-81a8-7f12bb336786', NULL, 0),
	('ce1dc9fd-dc1e-48f8-b91d-b6d4d7e1b0f2', NULL, 1),
	('d01dcae0-d25a-48a6-ae59-e9d2c1aa686b', NULL, 1),
	('d4af95f2-58ee-44df-9b35-5933f63c1e56', NULL, 0),
	('d7ea60ec-2d6b-413c-9b04-51b17a7d24be', NULL, 1),
	('dc6dcf79-dc14-4062-b70e-a60b2ffd26e9', NULL, 0),
	('ddd56067-b0de-4572-a856-a14e48239f6a', NULL, 1),
	('e81d3047-01ea-4234-8743-ec2efbd734d7', NULL, 1),
	('e9e05b74-9151-4716-95e5-5a44df56b82c', NULL, 0),
	('ef110bb4-e29b-4384-9c84-67af2d31c0a7', NULL, 1),
	('f18972d1-fcb3-4662-bc14-a64b047ff64e', NULL, 1),
	('f1a5e256-aba4-4441-907b-fa4e3c71cdff', NULL, 1),
	('f34f98c5-208e-4ffd-b05b-a1e4f8dea2ad', NULL, 1),
	('f4298fb3-b80e-475e-a681-c6fd127366bc', NULL, 1),
	('f787278f-61bf-4385-b3fe-d3a2ff06d8d6', NULL, 0),
	('f813eefd-5e31-4293-8f96-7728eff4d807', NULL, 0),
	('fb3ec2a4-a9bf-4564-8790-d2eba9500720', 'nhom khong guest', 0),
	('fd46132c-6de9-443f-8726-c40a62dcfa61', NULL, 0);

-- Dumping structure for table chat_project.message
CREATE TABLE IF NOT EXISTS `message` (
  `message_id` varchar(255) NOT NULL,
  `message_type` tinyint(4) DEFAULT NULL,
  `send_time` bigint(20) DEFAULT NULL,
  `chat_box_id` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `message_content` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`message_id`),
  KEY `chat_box_id_message` (`chat_box_id`),
  CONSTRAINT `chat_box_id_message` FOREIGN KEY (`chat_box_id`) REFERENCES `chat_box` (`chat_box_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table chat_project.message: ~152 rows (approximately)
INSERT INTO `message` (`message_id`, `message_type`, `send_time`, `chat_box_id`, `status`, `message_content`) VALUES
	('17500ab4-bfac-472b-acad-10da130fd17d1713945906744\0\0\0iiS000JL4wPX2MPPP222622YYaYZI', 0, 1713945906744, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'aaaaa'),
	('17500ab4-bfac-472b-acad-10da130fd17d1713946009706\0BnY6tdjKAsqQQ54qR72YYY06ZJJOOK8', 0, 1713946009706, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'aaaa'),
	('17500ab4-bfac-472b-acad-10da130fd17d1713946011321882ccww4RAQQQIAAPMMMz87711KeEPPe', 0, 1713946011321, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'aaa'),
	('17500ab4-bfac-472b-acad-10da130fd17d1713946011473VjTVCGGcBPKrdM8JJ87777zN6ub5PPOL', 0, 1713946011473, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'aaa'),
	('17500ab4-bfac-472b-acad-10da130fd17d1713946011623CaXXTTVDTTTT8ll3nn6jjj0PPVVGUUcT', 0, 1713946011623, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'aaa'),
	('17500ab4-bfac-472b-acad-10da130fd17d1713946011771UUTTTTQQIwwHsZE0UU44RLgbbnn2K666', 0, 1713946011771, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'aa'),
	('17500ab4-bfac-472b-acad-10da130fd17d1713946011921\0\072q77Qbbb4III4TWh00A3111QQFBBS', 0, 1713946011921, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'aaa'),
	('17500ab4-bfac-472b-acad-10da130fd17d1713946082947DDDyKH2JJ00xxDpp77fZ0SSiirfffSSv', 0, 1713946082947, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'aaaa'),
	('17500ab4-bfac-472b-acad-10da130fd17d1713946106559LLLa33SAE666sssHHooZeYYMMXXX5hpK', 0, 1713946106559, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'aaaa'),
	('17500ab4-bfac-472b-acad-10da130fd17d1713946408069fUSRpX22Ve5ls11HHZUcJJXX28ttt1YE', 0, 1713946408069, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'cặk'),
	('17500ab4-bfac-472b-acad-10da130fd17d1713946518840Y8ZZGG7I7CA27c2P5WWIBKKVhSci5voE', 0, 1713946518840, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'aaaa'),
	('17500ab4-bfac-472b-acad-10da130fd17d1713946838150JMLLrkISUR077Dmmm6py55SJJ555222e', 0, 1713946838150, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'a'),
	('17500ab4-bfac-472b-acad-10da130fd17d1713946841661\0zzS44444iHHHSwQEECXJJJQEFUvCXKT', 0, 1713946841661, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'a'),
	('17500ab4-bfac-472b-acad-10da130fd17d17139475473565aaHCRHRHNXXXC5tt2K86GXkkEE7Lz5A', 0, 1713947547356, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'aaaaa'),
	('17500ab4-bfac-472b-acad-10da130fd17d1713947547514\0\0\0331i44rNNoUrrJJJC44ICSDDJqSKD', 0, 1713947547514, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'aaaaa'),
	('17500ab4-bfac-472b-acad-10da130fd17d1713947547653\0\0DxGFFtSSSSSLsNqjCTTgP71778W2LS', 0, 1713947547653, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'aaaaa'),
	('17500ab4-bfac-472b-acad-10da130fd17d1713947547787HHHXXgggx7yyyeJJaaqV4vYYYLZEqqcc', 0, 1713947547787, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'aaaaa'),
	('17500ab4-bfac-472b-acad-10da130fd17d1713947547925\0TsdI6pHfZHT47AP6RyttSSZ25VVFJJG', 0, 1713947547925, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'aaaaa'),
	('17500ab4-bfac-472b-acad-10da130fd17d1713947548079jjjP4IVVUUhh4YVVww11IBBZZZZZ5wwK', 0, 1713947548079, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'aaaaa'),
	('17500ab4-bfac-472b-acad-10da130fd17d1713947548242Xzoo2piqqqqV33KQSK558GU33OHHHHHI', 0, 1713947548242, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'aaaaa'),
	('17500ab4-bfac-472b-acad-10da130fd17d1713947548389TTTt633TOOgggOTdduO33rrQ55tNWed3', 0, 1713947548389, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'aaaaa'),
	('17500ab4-bfac-472b-acad-10da130fd17d1713947548587FDDA0g1NNNNjR11UUUMlHHtv2jjjqVpe', 0, 1713947548587, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'aaaaa'),
	('17500ab4-bfac-472b-acad-10da130fd17d1713947548720XG3fOEE2221HnnnwwaEEEkI5A8ZZiiiv', 0, 1713947548720, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'aaaaa'),
	('17500ab4-bfac-472b-acad-10da130fd17d1713947548883\0\0\0RDD2KXJGPPPo1HTT663888XXP7j33', 0, 1713947548883, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'aaaaa'),
	('17500ab4-bfac-472b-acad-10da130fd17d1713947549105888y00bU77Ek5RCC3H7UKKETT3Xkv6RT', 0, 1713947549105, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'aaaaa'),
	('17500ab4-bfac-472b-acad-10da130fd17d1713948001059K1wXEBBe0IIP666k4RRRiiiKpppppNQQ', 0, 1713948001059, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'aaa'),
	('17500ab4-bfac-472b-acad-10da130fd17d1713948014620\0\0ErrrSbJ22YKKDH4VVe8jhq5liiiiTT', 0, 1713948014620, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'alo'),
	('17500ab4-bfac-472b-acad-10da130fd17d1713948255551EEQQOON6QKsFLLggg8888gQTHCC8mN6N', 0, 1713948255551, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'a'),
	('17500ab4-bfac-472b-acad-10da130fd17d1713948289048\0O7dft7PPPDiUBVIII2d0uXs2226dddd', 0, 1713948289048, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'alooo'),
	('17500ab4-bfac-472b-acad-10da130fd17d1713948322375\0p7FFFFAqqZ33qqq4i1UT55QQBNNmOLL', 0, 1713948322375, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'a'),
	('17500ab4-bfac-472b-acad-10da130fd17d1713948326741\0ANaiiGWY1PPPP44Q4iQ6FRr2pppyWSB', 0, 1713948326741, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'ffff'),
	('17500ab4-bfac-472b-acad-10da130fd17d171394848236966III77IlZZO10p0L8FFwSO6ccSzdHmX', 0, 1713948482369, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'a'),
	('17500ab4-bfac-472b-acad-10da130fd17d1713948564005rrrrAA3YV880OOOMLaaSCD555qrB6FFF', 0, 1713948564005, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'hi'),
	('17500ab4-bfac-472b-acad-10da130fd17d1713964021440\0\0DJJmmccTRLNEBGGJQQQ34DCeeeeiii', 0, 1713964021440, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'aa'),
	('17500ab4-bfac-472b-acad-10da130fd17d1713965216228111z5RRLLLCCCBBXggJDyyT7777700uC', 0, 1713965216228, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'aaa'),
	('17500ab4-bfac-472b-acad-10da130fd17d1713965414126\0uFWGTYYOFFFKKgggK2qrf04D5X7G288', 0, 1713965414126, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'llll'),
	('17500ab4-bfac-472b-acad-10da130fd17d1713965793284DDsssnn411U3G3388000W8B666GFV81Z', 0, 1713965793284, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'mmm'),
	('17500ab4-bfac-472b-acad-10da130fd17d1713965816296V6o886PUKK880bxK555V000m8XMM1wo8', 0, 1713965816296, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'xxx'),
	('17500ab4-bfac-472b-acad-10da130fd17d1713965935940\0MMMMMxE2cGG666HHHeeDD864WWu2228', 0, 1713965935940, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'a'),
	('17500ab4-bfac-472b-acad-10da130fd17d1713966075422\0YKKKKKMCC8ssdH5C30ORZZZZOQIIwww', 0, 1713966075422, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'a'),
	('17500ab4-bfac-472b-acad-10da130fd17d1713970315381\0GGGGIIJYNNZZZZFjWWW407OC555iuqq', 0, 1713970315381, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'aaaaa'),
	('17500ab4-bfac-472b-acad-10da130fd17d1713970624595vTGt6D7LomKaaaTTddIILL34GKKKXGNU', 0, 1713970624595, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'aaa'),
	('17500ab4-bfac-472b-acad-10da130fd17d1713970631805Z4rqaaRR4444448S7iTG5380jSVV7552', 0, 1713970631805, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'cccc'),
	('17500ab4-bfac-472b-acad-10da130fd17d17139713287670mHXYYNI8NMMor6vppEEEUuOPUFFFNcv', 0, 1713971328767, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'aaaa'),
	('17500ab4-bfac-472b-acad-10da130fd17d1713971649598OOgXLMaBLLuujBVVVc2S52xW86IIEEn2', 0, 1713971649598, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'a'),
	('17500ab4-bfac-472b-acad-10da130fd17d1713971654860D221DD1555555CLqqLLL322EElBLQ66H', 0, 1713971654860, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'aa'),
	('17500ab4-bfac-472b-acad-10da130fd17d1713971743305c4YeZBOOViPMM7777777xxxnnOOGy444', 0, 1713971743305, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'aaa'),
	('17500ab4-bfac-472b-acad-10da130fd17d1713971840774\0MR0wJNV4qllZg33333ICQX4YuWIIJLL', 0, 1713971840774, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'ccc'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714017399194BBB11xB78TT773RVw8LUssNN44mmmBnK', 0, 1714017399194, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'aaa'),
	('17500ab4-bfac-472b-acad-10da130fd17d17140174550501AExxxxYxxxTTTVVDlqVV6dkkQN15ooo', 0, 1714017455050, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'x'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714017582120ZZ6S3puuCCCGmLQQOOOEj88HeJJWWWWi', 0, 1714017582120, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'a'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714017605542\0sV8MbDDDDDzWHXGRRYY8KKzzzzEFmmm', 0, 1714017605542, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'a'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714017686447\0cccT45555yyF4444EEIkk46Qv770yyy', 0, 1714017686447, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'a'),
	('17500ab4-bfac-472b-acad-10da130fd17d17140177111526hhh6yBjEEEEVVcUqNNokv855554gxWW', 0, 1714017711152, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'fff'),
	('17500ab4-bfac-472b-acad-10da130fd17d17140178825086CCjjSm4B0000H66S6bQQQQBZhhttdKK', 0, 1714017882508, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'a'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714025134682HH00031JS2VVcc1FFFFG55fQ333U1dP1', 0, 1714025134682, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'll'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714028971332\0PPHHKVV8te1E2Nrp62TEnnu1U88vULu', 0, 1714028971332, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'a'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714038771258\0\0\0\0mooooW21AAhIIII5505FFFFbbHHH', 0, 1714038771258, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'a'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714038799029PP333RIIwcc72255DDDDVX8zEV22225S', 0, 1714038799029, '17500ab4-bfac-472b-acad-10da130fd17d', 0, '33'),
	('17500ab4-bfac-472b-acad-10da130fd17d17140518554333PS3rrrZEEttNj66Z5WgJJTTIImII255', 0, 1714051855433, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'a'),
	('17500ab4-bfac-472b-acad-10da130fd17d17140518569664PLS4rrTTyFYvCOT11JY5SD533RRixdD', 0, 1714051856966, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'aaaa'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714051867287\0CMPH0rZVs0H4rrNTTTTnnBCSV4UR00J', 0, 1714051867287, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'aaaa'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714051869814\0V1TGT4J3JtbbbTQQOTUQX77IzzzzC44', 0, 1714051869814, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'vvvv'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714051925709\0TAAvvvm778KTUUiNWjBVVVVQQnnE44S', 0, 1714051925709, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'aaa'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714052084638467Q2mH44PPPPPkkk54TFkG00U86666O', 0, 1714052084638, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'aaa'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714052107507EEOO5g777777vgiKGGGGsss22288Vq7g', 0, 1714052107507, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'aaaa'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714052132323\0Td20PIGB0InNPPWPggLLLssrrTfA300', 0, 1714052132323, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'qqqq'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714054608221WW5888PP33JhIICC00IjttppSS1p5555', 0, 1714054608221, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'a'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714054610490ffZDX6BKVMMRuZZZ5oooooocFOOOOWhh', 0, 1714054610490, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'd'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714070295872\0BBBsOOO433m66ITb55J32LLLvABI111', 0, 1714070295872, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'aaaa'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714070300909\0Z15IVGF13M77EE8mmUU6WW5J2KyyG83', 0, 1714070300909, '17500ab4-bfac-472b-acad-10da130fd17d', 0, '332'),
	('17500ab4-bfac-472b-acad-10da130fd17d171407030812214H4RffffA477VaAQ11PPMFFFQKmGGjj', 0, 1714070308122, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'ccc'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714070332581I77DELNDNZL03JJxYgg55HHJ8BB8HH0j', 0, 1714070332581, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'a'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714070362095qc07eeeuuzGatC7ZINu1DZZZcO87dRRR', 0, 1714070362095, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'a'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714070518843\0Vhhh4UKlwuuLv7gFF4cGBBKhccVC005', 0, 1714070518843, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'a'),
	('17500ab4-bfac-472b-acad-10da130fd17d17140705212033RG70RSR4BYfo6eU11KS447333KD11XX', 0, 1714070521203, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'dđs'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714070523539C6V5P60kkkKYDDi44BrrbMMMUU5TIWQQ', 0, 1714070523539, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'câcscas'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714070534731r566t14RLFB077BOIL6RRR7TAS1NN00s', 0, 1714070534731, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'ádasdsa'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714070538569\0NQGNNNQQj3QHHUUggg44c6666AF66qP', 0, 1714070538569, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'ccc'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714085529392\0VVVZWMMCeccccc6T00Yd66KI7TTla33', 0, 1714085529392, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'aa'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714085538448\0YY8JAF4DDPjBBbFF2R333HP777WROO7', 0, 1714085538448, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'ccc'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714085549586\0TJ55RKK633Ch3333ehiXXf5CCO0HKZI', 0, 1714085549586, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'av'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714085569146QQzq2FFrJ33WGR43v8wwwKNNNMSS045O', 0, 1714085569146, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'ad'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714085574112\0\0C15u6rrQ11WCCaSQQQQ66zz21MAOpK', 0, 1714085574112, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'cas'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714085853304\01NNNNNN80KOJJJJJ4FYAHH3377775WW', 0, 1714085853304, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'a'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714085880502QQQk5MMMWWO002LLdjjjjKn6kTJJ5055', 0, 1714085880502, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'aaa'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714085883702TiiI0MUAWw001EE433s4488uuqqqq117', 0, 1714085883702, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'cxcxcsad'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714085920400\0\0\05555555YU6bbVQ888xxxUUP7N4JLF', 0, 1714085920400, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'câcs'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714085953566sssOXAIII22mWOOOrALLO5PyyMMEBdd2', 0, 1714085953566, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'luong'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714085991353muDiKddPI23MMXXXXXww7B18Yoooogg4', 0, 1714085991353, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'luong'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714086018787FQQ44OGGWWEEEElBHHHr55mINDDwJ726', 0, 1714086018787, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'luong'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714086035508\0\0\0Q46nnjjjjr2Mm6KnXST888JzC5Z74', 0, 1714086035508, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'luong'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714086055195IIHwNdoSVV6kVII66bbFFUXXWMJhhhqq', 0, 1714086055195, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'luong1'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714086456979DDK6W1Foqq2NQfSSSSQQ6zzz00YnnKvv', 0, 1714086456979, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'dsdas'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714086482902\0aiifccGGG7VFIIvvRJJrruuuVFFbbTo', 0, 1714086482902, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'dsadas'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714086504112588FMMXDDDlJEETKGGg11BBBBZHF5HTT', 0, 1714086504112, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'đâs'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714087809670CSU777XXXXKH4kK700Mjjj4lllNLLLZS', 0, 1714087809670, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'dsadas'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714087875450\0\01UXAQXgqJJRET881YMXZZxMIPt022C', 0, 1714087875450, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'đâsd'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714087877566\0\0I6VJJ33ukkXXHH7T2mAAVPppvlIPPy', 0, 1714087877566, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'fsafas'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714087891007dtt886Xs440F555BuZTHHwwwwvv3kkxH', 0, 1714087891007, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'dsadasd'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714087968126\0\03337774vv787777fVDOOAWSSPXH08K', 0, 1714087968126, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'đâs'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714087982711YT218BVLsmmoopLLwwCMVVd3PwVVVVGG', 0, 1714087982711, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'đâsd'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714087988046\0\0frSeeIAhh8BZZB111tt6P8k22EDw0J', 0, 1714087988046, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'dsadas'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714088106429WWWWAEDd880Lee25S1QYLLC0DSBKVIL1', 0, 1714088106429, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'đâs'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714089134366NNNNNtHH444PPPP4hUPi6P8PP88qqPHH', 0, 1714089134366, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'đâsd'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714089136620mYeeGGGhVaN66aaMF22ZWRP557Y3kv88', 0, 1714089136620, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'dsa'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714089143040cVVmm8TB3j555505888L2K00MtQID3ZB', 0, 1714089143040, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'đâs'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714089241895vvv418TrPPPr11vv73XSSSYIIcIIuUPP', 0, 1714089241895, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'đâs'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714089284181oCKK0ww7766777jvvR4AlJTSCCppppam', 0, 1714089284181, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'đâs'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714089290053hhw477o66O222OOJJ344CGUUULTnnP33', 0, 1714089290053, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'd'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714089300023000RRUUmrrUM70YY2222NJYYYZZZXxxm', 0, 1714089300023, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'd'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714089337812TT6NN83G8IIIujg2bD4IWSWJJGGKHHLL', 0, 1714089337812, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'dđ'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714089350935\0\0jJSi8FdV666Hz6555If5FAJiii1222', 0, 1714089350935, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'd'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714093409353\0\0bc77L66DBFa50A0UTTTTT61yyyWiVg', 0, 1714093409353, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'dsadsad'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714093443403PRSVZVAARL0t06gRVMd2g333KKvgZZvk', 0, 1714093443403, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'kkk'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714093544374\0tHHHHSS222277dkhXXv8NRRTlaII3DT', 0, 1714093544374, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'dsadasd'),
	('17500ab4-bfac-472b-acad-10da130fd17d171409361152986Xr4ccoFFFF00D5RRisxQlIIITTT22x', 0, 1714093611529, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'đâsdsa'),
	('17500ab4-bfac-472b-acad-10da130fd17d17140936317353qUUDDDKddhUN8WJPPVUM5ggq2PPkk5X', 0, 1714093631735, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'dsadasdas'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714093641828BnnHHHHX2EB77N88x33AA6IfB77U6ZrJ', 0, 1714093641828, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'dmsadas'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714093825031i464XBB4Lddss3cx8QaaaaGX00BBPsMc', 0, 1714093825031, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'dsadasasd'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714094534654FF6VQQX3ppGGGG35YYY2111CZpLLISSv', 0, 1714094534654, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'gfg'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714094596564\0\0\0\0cwww2EXXXE3Zf4pBaaL8MINMTGPJ', 0, 1714094596564, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'snf'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714094752993\0QX88000000EEpJJJtCv66RW2n8224EV', 0, 1714094752993, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'agasdg'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714094793690n7L05aNu6xx8YFaaFoD1II1FFFDDDEF7', 0, 1714094793690, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'agsdg'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714094825048\0\0884iWKKKL001C67zHTTT44ovv2vkkM', 0, 1714094825048, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'HELLO'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714094861095\0W00FFuyYX777ssLLLZZ88sSHNB8AA86', 0, 1714094861095, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'Hello'),
	('17500ab4-bfac-472b-acad-10da130fd17d17140949252460gLYYv2220GGtt777xJJJ22Zss888AZJ', 0, 1714094925246, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'jrll'),
	('17500ab4-bfac-472b-acad-10da130fd17d171409500728111LOORDHHHKTT444EEILBBtddddj333g', 0, 1714095007281, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'hello'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714095028409\0XrmRppH33SSaBSSH8WWWWWA111vW33Y', 0, 1714095028409, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'hooo'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714095068649\0\06MI22U1gFhbbbk433Adddd5Kx44Yyy', 0, 1714095068649, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'dsadsa'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714095071061RFZbYUIItjjj2VNNAA15FAACC88WKOxx', 0, 1714095071061, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'dsadsa'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714095074154E2AETHHN2l8PPWJEYI855RRRRo0GG222', 0, 1714095074154, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'ddd'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714095270168hv6aWTqqqYUQQEEl1hGGGaaU4wJ5HH11', 0, 1714095270168, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'ddd'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714095421141DHLLL6666ZZZZZaLLNC2222xxPPpFZbb', 0, 1714095421141, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'aaaa'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714095858629\0aajyKKKm20yF552nXqyy3VVdyw5QQ6x', 0, 1714095858629, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'dsadasd'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714095894026\03MMMlqZGrdddddr8QTnPPPUrrur5Goo', 0, 1714095894026, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'ddd'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714095911376vvvvvGiikDFFFzzIXddqqqq66eeeNNNX', 0, 1714095911376, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'dsad'),
	('17500ab4-bfac-472b-acad-10da130fd17d171409596677766HEE0044ZXRRREP1eegIIIX777TTHAA', 0, 1714095966777, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'ddd'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714096285906HI8AAkkkkkkkb5HHVVCmmZ222RAAAt4W', 0, 1714096285906, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'aaaa'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714096676421bN42WWLllOO00Ap061zzzzS5INIJJPjj', 0, 1714096676421, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'aaa'),
	('17500ab4-bfac-472b-acad-10da130fd17d171409669575763ffX2266vppp8mYVRuv1kk3PPPPK778', 0, 1714096695757, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'aaaa'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714096705002R770000GWb111VV0MTTTjUUUU2JMMMPP', 0, 1714096705002, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'cajwk'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714097401119\0\063QFkkC8ppppppppwxxxxJJZZNNNDW', 0, 1714097401119, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'cawj'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714097409340S555BBB7FQQLLjYuT07B7vEIn00dIZ52', 0, 1714097409340, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'caw'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714103084735U2777UBBB7DaaHZr4PPK3MMOmL333222', 0, 1714103084735, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'zzz'),
	('17500ab4-bfac-472b-acad-10da130fd17d17141030861561b1154466TSSSOHuIIIR52eZZaVQTT7L', 0, 1714103086156, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'zzz'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714103752548\0ddkkMYY11FTT22KBBBApff222zz11KZ', 0, 1714103752548, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'css'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714103867811MMMK0C2222ww8n52ppMnYIrrXPPP222A', 0, 1714103867811, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'â'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714148785414\0\0LQssF5WFFFJJJJFFUUs6qqOWGGWxAA', 0, 1714148785414, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'aa'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714175524816vvv0XXXWWWNsBG7XXX5CCSSStoooofff', 0, 1714175524816, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'aa'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714176889394ZjbCR6N111mUU2aFgh8FFg5DDDDDDDDM', 0, 1714176889394, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'aa'),
	('17500ab4-bfac-472b-acad-10da130fd17d1714180315213DHVuQQy8VVlllPPPPqqHYYqTTTMEooHH', 0, 1714180315213, '17500ab4-bfac-472b-acad-10da130fd17d', 0, 'aa');

-- Dumping structure for table chat_project.role
CREATE TABLE IF NOT EXISTS `role` (
  `role_id` varchar(255) NOT NULL,
  `role_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` bigint(20) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table chat_project.role: ~2 rows (approximately)
INSERT INTO `role` (`role_id`, `role_name`, `status`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES
	('ADMIN', 'Quản trị hệ thống', 1, 'admin', 1713713988465, 'admin', 1713713988465),
	('SALE', 'Nhân viên chăm sóc khách hàng', 1, 'admin', 1713714012481, 'admin', 1713714012481);

-- Dumping structure for table chat_project.website
CREATE TABLE IF NOT EXISTS `website` (
  `website_id` varchar(255) NOT NULL,
  `website_name` varchar(255) DEFAULT NULL,
  `website_key` varchar(255) DEFAULT NULL,
  `show_from` bigint(20) DEFAULT NULL,
  `group_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`website_id`),
  KEY `group_web` (`group_id`),
  CONSTRAINT `group_web` FOREIGN KEY (`group_id`) REFERENCES `group_web` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table chat_project.website: ~19 rows (approximately)
INSERT INTO `website` (`website_id`, `website_name`, `website_key`, `show_from`, `group_id`) VALUES
	('0829bc25-70ee-4b8b-95b2-e037ae36d3d5', 'test3', NULL, 1714089749997, NULL),
	('0b540eb8-967d-4e71-99bb-4a8731c554a7', 'localhost:4200', 'no key', 1713713701279, '04f1940b-94f8-4a98-afc3-633004af14c3'),
	('0d4cf9b4-114e-497a-ba8f-aaad4153cd8c', NULL, NULL, 1714089544524, NULL),
	('2b69cc20-40ae-4db0-bbb3-9794767e2759', NULL, NULL, 1714089544538, NULL),
	('2fca5b7f-6c07-4499-86e1-638a55dc21cc', 'abc', '2', 0, '1f9e00f7-9f86-46b9-abe6-bace393ccb3d'),
	('4659e392-2ff1-4e47-9944-1f4c3c8e714e', 'test3', NULL, 1714089750004, NULL),
	('661c3b33-d13a-49df-b00f-804d88432120', NULL, NULL, 1714089599537, NULL),
	('6a9abc7e-6821-4f3d-bd29-b40974a19025', NULL, NULL, 1714089512192, NULL),
	('749f0712-7f41-480c-8b8d-6bc677a1d7f7', 'batdongsan.commm', '', 0, 'fb3ec2a4-a9bf-4564-8790-d2eba9500720'),
	('899a45ae-54a6-4adf-bd4a-0d3c4912f362', NULL, NULL, 1714089544545, NULL),
	('a77725e9-4d14-4e5d-b923-2d3d986f4ea2', 'test3', NULL, 1714089749983, NULL),
	('ad251b4e-45bb-446c-84f2-630b68515a29', NULL, NULL, 1714089599530, NULL),
	('bb5a1ef6-c6d0-4c8b-a08b-7d8cef0a694c', 'test3', NULL, 1714089749992, NULL),
	('c2808601-fbc4-41a8-8c65-7d07643ce0e3', NULL, NULL, 1714089599514, NULL),
	('c7a4016f-d35c-41b0-8a9e-eb7b6936ebe9', NULL, NULL, 1714089512192, NULL),
	('c8a8ca2c-6421-4381-a16e-27f3a5bb3e81', NULL, NULL, 1714089512192, NULL),
	('e809266d-fd0f-408a-9e52-3edf145d0956', NULL, NULL, 1714089544531, NULL),
	('f0224f74-feaf-4900-b0ca-b8878f329fe0', NULL, NULL, 1714089512192, NULL),
	('f1b7ba71-5fe2-4397-b8b6-5792d3090e6b', NULL, NULL, 1714089599523, NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
