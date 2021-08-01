-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.25-0ubuntu0.20.10.1 - (Ubuntu)
-- Server OS:                    Linux
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for single_page_application
CREATE DATABASE IF NOT EXISTS `single_page_application` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `single_page_application`;

-- Dumping structure for table single_page_application.Controlling
CREATE TABLE IF NOT EXISTS `Controlling` (
  `ControllingID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `DeviceID` bigint unsigned DEFAULT '0',
  `PlotID` bigint unsigned DEFAULT '0',
  `AmountOfWater` double unsigned DEFAULT NULL,
  `WateringDuration` int DEFAULT NULL,
  `TimeOfControl` datetime DEFAULT NULL,
  PRIMARY KEY (`ControllingID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table single_page_application.Controlling: ~0 rows (approximately)
/*!40000 ALTER TABLE `Controlling` DISABLE KEYS */;
/*!40000 ALTER TABLE `Controlling` ENABLE KEYS */;

-- Dumping structure for table single_page_application.cutivation_types
CREATE TABLE IF NOT EXISTS `cutivation_types` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `cutivation_type` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table single_page_application.cutivation_types: ~0 rows (approximately)
/*!40000 ALTER TABLE `cutivation_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `cutivation_types` ENABLE KEYS */;

-- Dumping structure for table single_page_application.Devices
CREATE TABLE IF NOT EXISTS `Devices` (
  `DeviceID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `DeviceName` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DeviceTypeID` tinyint unsigned DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `Status` tinyint DEFAULT NULL,
  `PlotID` bigint unsigned DEFAULT NULL,
  `created_user` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_user` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`DeviceID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table single_page_application.Devices: ~6 rows (approximately)
/*!40000 ALTER TABLE `Devices` DISABLE KEYS */;
INSERT INTO `Devices` (`DeviceID`, `DeviceName`, `DeviceTypeID`, `user_id`, `Status`, `PlotID`, `created_user`, `updated_user`, `created_at`, `updated_at`) VALUES
	(2, 'Device 01', 2, 1, 1, NULL, 'hopdt1404', 'hopdt1404', '2021-07-14 02:38:27', '2021-07-15 21:28:25'),
	(3, 'Device 02', 3, 1, 2, NULL, 'hopdt1404', 'hopdt1404', '2021-07-14 02:39:28', '2021-07-15 21:28:41'),
	(4, 'Device 03', 4, 1, -1, NULL, 'hopdt1404', 'hopdt1404', '2021-07-14 02:41:23', '2021-07-15 21:28:32'),
	(5, 'Device 04', NULL, 1, 1, NULL, 'hopdt1404', 'hopdt1404', '2021-07-14 02:41:35', '2021-07-14 22:21:25'),
	(6, 'Device 05', 1, 1, 2, NULL, 'hopdt1404', 'hopdt1404', '2021-07-14 02:42:35', '2021-07-15 21:28:52'),
	(7, 'Device 06', NULL, 1, 2, NULL, 'hopdt1404', NULL, '2021-07-14 02:45:05', NULL),
	(8, 'Device07', 2, 1, -1, NULL, 'hopdt1404', 'hopdt1404', '2021-07-15 21:30:46', '2021-07-15 21:30:53');
/*!40000 ALTER TABLE `Devices` ENABLE KEYS */;

-- Dumping structure for table single_page_application.DeviceTypes
CREATE TABLE IF NOT EXISTS `DeviceTypes` (
  `DeviceTypeID` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `DeviceType` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_user` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_user` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`DeviceTypeID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table single_page_application.DeviceTypes: ~4 rows (approximately)
/*!40000 ALTER TABLE `DeviceTypes` DISABLE KEYS */;
INSERT INTO `DeviceTypes` (`DeviceTypeID`, `DeviceType`, `name`, `created_user`, `updated_user`, `created_at`, `updated_at`) VALUES
	(1, 'Sensing', NULL, 'Admin', NULL, '2021-07-15 21:06:06', NULL),
	(2, 'Actuating', NULL, 'Admin', NULL, '2021-07-15 21:06:06', NULL),
	(3, 'Gateway', NULL, 'Admin', NULL, '2021-07-15 21:06:06', NULL),
	(4, 'Controlling', NULL, 'Admin', NULL, '2021-07-15 21:06:06', NULL);
/*!40000 ALTER TABLE `DeviceTypes` ENABLE KEYS */;

-- Dumping structure for table single_page_application.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table single_page_application.failed_jobs: ~0 rows (approximately)
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Dumping structure for table single_page_application.Farms
CREATE TABLE IF NOT EXISTS `Farms` (
  `FarmID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `LocateID` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Area` double(10,2) unsigned DEFAULT NULL,
  `FarmTypeID` tinyint unsigned DEFAULT NULL,
  `Status` smallint unsigned NOT NULL DEFAULT '0',
  `UserID` bigint unsigned NOT NULL,
  `created_user` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_user` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`FarmID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table single_page_application.Farms: ~11 rows (approximately)
/*!40000 ALTER TABLE `Farms` DISABLE KEYS */;
INSERT INTO `Farms` (`FarmID`, `LocateID`, `name`, `Area`, `FarmTypeID`, `Status`, `UserID`, `created_user`, `updated_user`, `created_at`, `updated_at`) VALUES
	(7, NULL, 'Farm02', 532.00, NULL, 0, 1, 'hopdt1404', 'hopdt1404', '2021-07-12 22:20:30', '2021-07-13 11:05:23'),
	(8, NULL, 'Farm03', 442.00, NULL, 0, 1, 'hopdt1404', 'hopdt1404', '2021-07-12 22:33:10', '2021-07-13 07:48:50'),
	(9, NULL, 'Farm01', 541.00, 2, 0, 1, 'hopdt1404', 'hopdt1404', '2021-07-12 22:36:24', '2021-07-14 23:37:09'),
	(10, NULL, 'Farm04', NULL, NULL, 0, 1, 'hopdt1404', 'hopdt1404', '2021-07-12 22:37:34', '2021-07-13 21:13:03'),
	(11, NULL, 'Farm06', NULL, NULL, 0, 1, 'hopdt1404', NULL, '2021-07-12 22:38:19', NULL),
	(12, NULL, 'Farm05', NULL, NULL, 0, 1, 'hopdt1404', NULL, '2021-07-12 22:39:28', NULL),
	(13, NULL, 'Farm07', NULL, NULL, 0, 1, 'hopdt1404', NULL, '2021-07-13 09:26:52', NULL),
	(14, NULL, 'Farm08', NULL, NULL, 0, 1, 'hopdt1404', NULL, '2021-07-13 09:27:03', NULL),
	(15, NULL, 'Farm09', NULL, NULL, 0, 1, 'hopdt1404', NULL, '2021-07-13 09:27:15', NULL),
	(16, NULL, 'Farm10', NULL, NULL, 0, 1, 'hopdt1404', NULL, '2021-07-13 09:27:28', NULL),
	(17, NULL, 'Farm11', NULL, NULL, 0, 1, 'hopdt1404', 'hopdt1404', '2021-07-13 09:27:38', '2021-07-13 09:28:44'),
	(18, NULL, 'Farm 13', NULL, NULL, 0, 1, 'hopdt1404', NULL, '2021-07-13 11:20:21', NULL);
/*!40000 ALTER TABLE `Farms` ENABLE KEYS */;

-- Dumping structure for table single_page_application.FarmTypes
CREATE TABLE IF NOT EXISTS `FarmTypes` (
  `FarmTypeID` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `FarmType` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_user` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_user` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`FarmTypeID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table single_page_application.FarmTypes: ~10 rows (approximately)
/*!40000 ALTER TABLE `FarmTypes` DISABLE KEYS */;
INSERT INTO `FarmTypes` (`FarmTypeID`, `FarmType`, `name`, `created_user`, `updated_user`, `created_at`, `updated_at`) VALUES
	(1, 'Arable Farming', NULL, 'Admin', NULL, '2021-07-14 22:54:18', NULL),
	(2, 'Pastoral Farming', NULL, 'Admin', NULL, '2021-07-14 22:54:18', NULL),
	(3, 'Mixed Farming', NULL, 'Admin', NULL, '2021-07-14 22:54:18', NULL),
	(4, 'Subsistence Farming', NULL, 'Admin', NULL, '2021-07-14 22:54:18', NULL),
	(5, 'Commercial Farming', NULL, 'Admin', NULL, '2021-07-14 22:54:18', NULL),
	(6, 'Extensive and Intensive Farming', NULL, 'Admin', NULL, '2021-07-14 22:54:18', NULL),
	(7, 'Nomadic Farming', NULL, 'Admin', NULL, '2021-07-14 22:54:18', NULL),
	(8, 'Nomadic Farming', NULL, 'Admin', NULL, '2021-07-14 22:54:18', NULL),
	(9, 'Poultry Farming', NULL, 'Admin', NULL, '2021-07-14 22:54:18', NULL),
	(10, 'Fish Farming', NULL, 'Admin', NULL, '2021-07-14 22:54:18', NULL);
/*!40000 ALTER TABLE `FarmTypes` ENABLE KEYS */;

-- Dumping structure for table single_page_application.Locates
CREATE TABLE IF NOT EXISTS `Locates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `LocateID` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `LocateName` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `locate` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_user` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_user` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table single_page_application.Locates: ~0 rows (approximately)
/*!40000 ALTER TABLE `Locates` DISABLE KEYS */;
/*!40000 ALTER TABLE `Locates` ENABLE KEYS */;

-- Dumping structure for table single_page_application.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table single_page_application.migrations: ~4 rows (approximately)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2017_12_07_122845_create_oauth_providers_table', 1),
	(4, '2019_08_19_000000_create_failed_jobs_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table single_page_application.mst_display
CREATE TABLE IF NOT EXISTS `mst_display` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `display_name` varchar(50) NOT NULL,
  `role` tinyint unsigned NOT NULL COMMENT '0: Admin, 1: Farmer',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table single_page_application.mst_display: ~0 rows (approximately)
/*!40000 ALTER TABLE `mst_display` DISABLE KEYS */;
/*!40000 ALTER TABLE `mst_display` ENABLE KEYS */;

-- Dumping structure for table single_page_application.mst_operation_info
CREATE TABLE IF NOT EXISTS `mst_operation_info` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `info` varchar(200) NOT NULL,
  `role` tinyint unsigned NOT NULL COMMENT '0: Admin, 1: Farmer',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table single_page_application.mst_operation_info: ~0 rows (approximately)
/*!40000 ALTER TABLE `mst_operation_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `mst_operation_info` ENABLE KEYS */;

-- Dumping structure for table single_page_application.oauth_providers
CREATE TABLE IF NOT EXISTS `oauth_providers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider_user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `refresh_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_providers_user_id_foreign` (`user_id`),
  KEY `oauth_providers_provider_user_id_index` (`provider_user_id`),
  CONSTRAINT `oauth_providers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table single_page_application.oauth_providers: ~0 rows (approximately)
/*!40000 ALTER TABLE `oauth_providers` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_providers` ENABLE KEYS */;

-- Dumping structure for table single_page_application.operation_history
CREATE TABLE IF NOT EXISTS `operation_history` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `auth_flg` tinyint(1) NOT NULL COMMENT '0: Admin, 1: Farmer',
  `user_id` bigint unsigned NOT NULL,
  `mst_display_id` bigint NOT NULL,
  `mst_operation_id` bigint NOT NULL,
  `result` int NOT NULL COMMENT '0: Success, 1: Error',
  `detail_info` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Detail info history',
  `ip_address` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'IP addess host',
  `create_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_user` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- Dumping data for table single_page_application.operation_history: ~0 rows (approximately)
/*!40000 ALTER TABLE `operation_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `operation_history` ENABLE KEYS */;

-- Dumping structure for table single_page_application.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table single_page_application.password_resets: ~0 rows (approximately)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table single_page_application.plants
CREATE TABLE IF NOT EXISTS `plants` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cultivars` varchar(255) DEFAULT NULL COMMENT 'giong cay trong',
  `plant_type_id` smallint DEFAULT NULL,
  `growth_period` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Thoi gian sinh truong',
  `planting_time` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT 'thoi gian gieo trong',
  `plant_density` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'mat do cay trong',
  `width_bed` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Do rong hang',
  `height_bed` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'do cao cua hang',
  `row_spacing` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'khoa cach giua cac hang',
  `tree_spacing` varchar(255) DEFAULT NULL COMMENT 'khoang cach giua cac cay',
  `soil_type_id` tinyint unsigned DEFAULT NULL COMMENT 'Dat canh tac',
  `info` text COMMENT 'Thong tin khac',
  `created_at` datetime DEFAULT NULL,
  `created_user` varchar(255) DEFAULT NULL,
  `updated_user` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table single_page_application.plants: ~2 rows (approximately)
/*!40000 ALTER TABLE `plants` DISABLE KEYS */;
INSERT INTO `plants` (`id`, `name`, `cultivars`, `plant_type_id`, `growth_period`, `planting_time`, `plant_density`, `width_bed`, `height_bed`, `row_spacing`, `tree_spacing`, `soil_type_id`, `info`, `created_at`, `created_user`, `updated_user`, `updated_at`) VALUES
	(1, 'Maize', 'Cereal grain', 5, '70 - 90 days', '1 năm 2 vụ mùa', NULL, '20 - 25 cm', '10 - 15cm', '25 - 30 cm', '20 - 25 cm', 5, '70 - 90 days', '2021-07-16 09:24:14', 'hopdt1404', 'hopdt1404@gmail.com', '2021-07-16 21:46:17'),
	(2, 'Potato', 'Solanum tuberosum', 6, '50 - 60', '– Vụ đông xuân: trồng cây tháng 10 – 11 dương lịch, thu hoạch vào tháng 1 – 2.\n\n– Vụ xuân hè: trồng cây tháng 12 – 1 dương lịch, thu hoạch vào 3 – 4 dương lịch.\n\n– Vụ hè thu: trồng cây tháng 6 – 7 dương lịch thu hoạch vào tháng 9 – 10.', NULL, '110 – 120cm', '30cm', '80cm', '40cm- 60cm', 3, '50 - 60', '2021-07-16 10:05:05', 'hopdt1404@gmail.com', 'hopdt1404@gmail.com', '2021-07-16 21:46:03');
/*!40000 ALTER TABLE `plants` ENABLE KEYS */;

-- Dumping structure for table single_page_application.plant_info
CREATE TABLE IF NOT EXISTS `plant_info` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cultivationtr` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'canh tac',
  `growth_period` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'thoi gain sinh truong',
  `haverst_period` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ky thu hoach',
  `start_crop` int DEFAULT NULL COMMENT 'bat dau mua vu',
  `end_crop` int DEFAULT NULL COMMENT 'thoi gian ket thuc',
  `width_bed` double(8,2) DEFAULT NULL COMMENT 'do rong luong',
  `height_bed` double(8,2) DEFAULT NULL COMMENT 'chieu cao luong',
  `plant_density` double(8,2) DEFAULT NULL COMMENT 'mat do',
  `row_spacing` double(8,2) DEFAULT NULL COMMENT 'khoang cah giua hang',
  `tree_spacing` double(8,2) DEFAULT NULL COMMENT 'khoang cach giua cay',
  `plant_soil` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cultivar` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table single_page_application.plant_info: ~0 rows (approximately)
/*!40000 ALTER TABLE `plant_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `plant_info` ENABLE KEYS */;

-- Dumping structure for table single_page_application.plant_light_types
CREATE TABLE IF NOT EXISTS `plant_light_types` (
  `id` int NOT NULL,
  `plant_light` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Anh sang cay trong',
  `lowest` double(8,2) DEFAULT NULL,
  `highest` double(8,2) DEFAULT NULL,
  `plant_light_typescol` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table single_page_application.plant_light_types: ~0 rows (approximately)
/*!40000 ALTER TABLE `plant_light_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `plant_light_types` ENABLE KEYS */;

-- Dumping structure for table single_page_application.plant_state
CREATE TABLE IF NOT EXISTS `plant_state` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table single_page_application.plant_state: ~0 rows (approximately)
/*!40000 ALTER TABLE `plant_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `plant_state` ENABLE KEYS */;

-- Dumping structure for table single_page_application.plant_states
CREATE TABLE IF NOT EXISTS `plant_states` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '',
  `note` text,
  `created_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '',
  `created_at` datetime DEFAULT NULL,
  `updated_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table single_page_application.plant_states: ~6 rows (approximately)
/*!40000 ALTER TABLE `plant_states` DISABLE KEYS */;
INSERT INTO `plant_states` (`id`, `name`, `note`, `created_user`, `created_at`, `updated_user`, `updated_at`) VALUES
	(1, 'Sprout', 'https://www.saferbrand.com/articles/plant-growth-stages', 'Admin', '2021-07-17 09:52:33', NULL, NULL),
	(2, 'Seedling', 'https://www.saferbrand.com/articles/plant-growth-stages', 'Admin', '2021-07-17 09:52:33', NULL, NULL),
	(3, 'Vegetative', 'https://www.saferbrand.com/articles/plant-growth-stages', 'Admin', '2021-07-17 09:52:33', NULL, NULL),
	(4, 'Budding', 'https://www.saferbrand.com/articles/plant-growth-stages', 'Admin', '2021-07-17 09:52:33', NULL, NULL),
	(5, 'Flowering', 'https://www.saferbrand.com/articles/plant-growth-stages', 'Admin', '2021-07-17 09:52:33', NULL, NULL),
	(6, 'Ripening', 'https://www.saferbrand.com/articles/plant-growth-stages', 'Admin', '2021-07-17 09:52:33', NULL, NULL);
/*!40000 ALTER TABLE `plant_states` ENABLE KEYS */;

-- Dumping structure for table single_page_application.plant_state_infos
CREATE TABLE IF NOT EXISTS `plant_state_infos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `plant_state_id` tinyint unsigned NOT NULL,
  `plant_id` bigint unsigned NOT NULL,
  `growth_period_state` mediumint unsigned DEFAULT NULL COMMENT 'thoi gian sinh truong cua trang thai',
  `temperature` float DEFAULT NULL COMMENT 'Nhiet do',
  `moisture` float DEFAULT NULL COMMENT 'do am',
  `light` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'cuong do anh sang',
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `created_user` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_user` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table single_page_application.plant_state_infos: ~3 rows (approximately)
/*!40000 ALTER TABLE `plant_state_infos` DISABLE KEYS */;
INSERT INTO `plant_state_infos` (`id`, `plant_state_id`, `plant_id`, `growth_period_state`, `temperature`, `moisture`, `light`, `note`, `created_at`, `created_user`, `updated_user`, `updated_at`) VALUES
	(1, 1, 2, 13, 29, 65, '4000 h', 'note update', '2021-07-17 10:50:09', 'hopdt1404@gmail.com', 'hopdt1404@gmail.com', '2021-07-18 00:14:47'),
	(3, 2, 2, 8, 36, 65, '4500 h', 'note seedling', '2021-07-17 10:51:06', 'hopdt1404@gmail.com', 'hopdt1404@gmail.com', '2021-07-18 00:16:34'),
	(4, 3, 2, 15, 27, 65, '4000 h', 'note vegetative', '2021-07-17 11:16:38', 'hopdt1404@gmail.com', NULL, NULL);
/*!40000 ALTER TABLE `plant_state_infos` ENABLE KEYS */;

-- Dumping structure for table single_page_application.plant_types
CREATE TABLE IF NOT EXISTS `plant_types` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT '',
  `created_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '',
  `created_at` datetime DEFAULT NULL,
  `updated_user` varchar(50) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table single_page_application.plant_types: ~17 rows (approximately)
/*!40000 ALTER TABLE `plant_types` DISABLE KEYS */;
INSERT INTO `plant_types` (`id`, `name`, `created_user`, `created_at`, `updated_user`, `updated_at`) VALUES
	(1, 'Annuals', 'Admin', '2021-07-16 10:49:34', NULL, NULL),
	(2, 'Bulbs', 'Admin', '2021-07-16 10:49:34', NULL, NULL),
	(3, 'Cactus - Succulents', 'Admin', '2021-07-16 10:49:34', NULL, NULL),
	(4, 'Climbers', 'Admin', '2021-07-16 10:49:34', NULL, NULL),
	(5, 'Conifers', 'Admin', '2021-07-16 10:49:34', NULL, NULL),
	(6, 'Ferns', 'Admin', '2021-07-16 10:49:34', NULL, NULL),
	(7, 'Fruit', 'Admin', '2021-07-16 10:49:34', NULL, NULL),
	(8, 'Herbs', 'Admin', '2021-07-16 10:49:34', NULL, NULL),
	(9, 'Ornamental Grasses', 'Admin', '2021-07-16 10:49:34', NULL, NULL),
	(10, 'Perennials', 'Admin', '2021-07-16 10:49:34', NULL, NULL),
	(11, 'Roses', 'Admin', '2021-07-16 10:49:34', NULL, NULL),
	(12, 'Shrubs', 'Admin', '2021-07-16 10:49:34', NULL, NULL),
	(13, 'Trees', 'Admin', '2021-07-16 10:49:34', NULL, NULL),
	(14, 'Palms - Cycads', 'Admin', '2021-07-16 10:49:34', NULL, NULL),
	(15, 'Bamboos', 'Admin', '2021-07-16 10:49:34', NULL, NULL),
	(16, 'Aquatic Plants', 'Admin', '2021-07-16 10:49:34', NULL, NULL),
	(17, 'Orchids', 'Admin', '2021-07-16 10:49:34', NULL, NULL);
/*!40000 ALTER TABLE `plant_types` ENABLE KEYS */;

-- Dumping structure for table single_page_application.Plots
CREATE TABLE IF NOT EXISTS `Plots` (
  `PlotID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Area` double(8,2) unsigned DEFAULT NULL,
  `PlotTypeID` tinyint unsigned DEFAULT NULL,
  `FarmID` bigint unsigned DEFAULT NULL,
  `created_user` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_user` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`PlotID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table single_page_application.Plots: ~0 rows (approximately)
/*!40000 ALTER TABLE `Plots` DISABLE KEYS */;
/*!40000 ALTER TABLE `Plots` ENABLE KEYS */;

-- Dumping structure for table single_page_application.PlotTypes
CREATE TABLE IF NOT EXISTS `PlotTypes` (
  `PlotTypeID` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `PlotType` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_user` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_user` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`PlotTypeID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table single_page_application.PlotTypes: ~0 rows (approximately)
/*!40000 ALTER TABLE `PlotTypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `PlotTypes` ENABLE KEYS */;

-- Dumping structure for table single_page_application.Sensing
CREATE TABLE IF NOT EXISTS `Sensing` (
  `SensingID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `DeviceID` bigint unsigned DEFAULT NULL,
  `PlotID` bigint unsigned DEFAULT NULL,
  `SoilMoisture` float unsigned DEFAULT NULL,
  `Humidity` float unsigned DEFAULT NULL,
  `Temperature` float unsigned DEFAULT NULL,
  `LightLevel` smallint unsigned DEFAULT NULL,
  `TimeOfMeasurement` datetime DEFAULT NULL,
  `created_user` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_user` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`SensingID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table single_page_application.Sensing: ~0 rows (approximately)
/*!40000 ALTER TABLE `Sensing` DISABLE KEYS */;
/*!40000 ALTER TABLE `Sensing` ENABLE KEYS */;

-- Dumping structure for table single_page_application.sensor_detail
CREATE TABLE IF NOT EXISTS `sensor_detail` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `sensor_id` bigint unsigned DEFAULT NULL,
  `soil_moisture` double(8,2) DEFAULT NULL,
  `humidity` double(8,2) DEFAULT NULL,
  `temperature` double(8,2) DEFAULT NULL,
  `light_level` smallint unsigned DEFAULT NULL,
  `time_of_measurement` datetime DEFAULT NULL,
  `created_user` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_user` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table single_page_application.sensor_detail: ~0 rows (approximately)
/*!40000 ALTER TABLE `sensor_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `sensor_detail` ENABLE KEYS */;

-- Dumping structure for table single_page_application.soil_types
CREATE TABLE IF NOT EXISTS `soil_types` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `info` text,
  `created_at` datetime DEFAULT NULL,
  `created_user` varchar(255) DEFAULT NULL,
  `updated_user` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table single_page_application.soil_types: ~6 rows (approximately)
/*!40000 ALTER TABLE `soil_types` DISABLE KEYS */;
INSERT INTO `soil_types` (`id`, `name`, `info`, `created_at`, `created_user`, `updated_user`, `updated_at`) VALUES
	(1, 'Sandy soil', 'https://www.boughton.co.uk/products/topsoils/soil-types/', '2021-07-16 21:29:53', 'Admin', NULL, NULL),
	(2, 'Clay Soil', 'https://www.boughton.co.uk/products/topsoils/soil-types/', '2021-07-16 21:29:53', 'Admin', NULL, NULL),
	(3, 'Silt Soil', 'https://www.boughton.co.uk/products/topsoils/soil-types/', '2021-07-16 21:29:53', 'Admin', NULL, NULL),
	(4, 'Peat Soil', 'https://www.boughton.co.uk/products/topsoils/soil-types/', '2021-07-16 21:29:53', 'Admin', NULL, NULL),
	(5, 'Chalk Soil', 'https://www.boughton.co.uk/products/topsoils/soil-types/', '2021-07-16 21:29:53', 'Admin', NULL, NULL),
	(6, 'Loam Soil', 'https://www.boughton.co.uk/products/topsoils/soil-types/', '2021-07-16 21:29:53', 'Admin', NULL, NULL);
/*!40000 ALTER TABLE `soil_types` ENABLE KEYS */;

-- Dumping structure for table single_page_application.stage_types
CREATE TABLE IF NOT EXISTS `stage_types` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table single_page_application.stage_types: ~0 rows (approximately)
/*!40000 ALTER TABLE `stage_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `stage_types` ENABLE KEYS */;

-- Dumping structure for table single_page_application.Users
CREATE TABLE IF NOT EXISTS `Users` (
  `UserID` bigint unsigned DEFAULT NULL,
  `UserName` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Email` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UPassword` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table single_page_application.Users: ~0 rows (approximately)
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;

-- Dumping structure for table single_page_application.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table single_page_application.users: ~0 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'hopdt1404', 'hopdt1404@gmail.com', NULL, '$2y$10$Gyrelylnps2oW/bBvh68U.uBRaxhGp15rhH9OXBOWryzE2NHDWJJS', 'ROD0TyLkzRGRp1JQpevBCDxh1bpy7utm9VCuUWacFjQuiHNYSGlbNtEaxaSB', '2021-07-11 22:50:35', '2021-07-11 22:50:35');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table single_page_application.user_types
CREATE TABLE IF NOT EXISTS `user_types` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_user` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_user` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table single_page_application.user_types: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_types` ENABLE KEYS */;

-- Dumping structure for table single_page_application.WeatherForecastAtATimes
CREATE TABLE IF NOT EXISTS `WeatherForecastAtATimes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `WeatherForecastID` bigint unsigned NOT NULL,
  `ForecastTime` timestamp NOT NULL,
  `EpochTime` bigint unsigned DEFAULT NULL,
  `ForecastStatus` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IsDayLight` tinyint unsigned DEFAULT NULL,
  `Temperature` double(8,2) DEFAULT NULL,
  `WindSpeed` double(8,2) DEFAULT NULL,
  `RelativeHumidity` double(8,2) DEFAULT NULL,
  `RainProbability` double(4,1) DEFAULT NULL,
  `PrecipitationProbability` double(4,1) DEFAULT NULL,
  `RainValue` double(8,2) unsigned DEFAULT NULL,
  `CloudCover` smallint unsigned DEFAULT NULL,
  `created_user` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_user` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table single_page_application.WeatherForecastAtATimes: ~0 rows (approximately)
/*!40000 ALTER TABLE `WeatherForecastAtATimes` DISABLE KEYS */;
/*!40000 ALTER TABLE `WeatherForecastAtATimes` ENABLE KEYS */;

-- Dumping structure for table single_page_application.WeatherForecasts
CREATE TABLE IF NOT EXISTS `WeatherForecasts` (
  `WeatherForecastID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `LocateID` bigint unsigned DEFAULT NULL,
  `CurrentTime` timestamp NOT NULL,
  `created_at` datetime NOT NULL,
  `created_user` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_user` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`WeatherForecastID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table single_page_application.WeatherForecasts: ~0 rows (approximately)
/*!40000 ALTER TABLE `WeatherForecasts` DISABLE KEYS */;
/*!40000 ALTER TABLE `WeatherForecasts` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
