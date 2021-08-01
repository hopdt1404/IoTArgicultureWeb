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

-- Dumping structure for table single_page_application.plants
CREATE TABLE IF NOT EXISTS `plants` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `cultivars` varchar(255) DEFAULT NULL COMMENT 'giong cay trong',
  `plant_type` smallint DEFAULT NULL,
  `growth_period` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Thoi gian sinh truong',
  `planting_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'thoi gian gieo trong',
  `plant_density` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'mat do cay trong',
  `width_bed` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Do rong hang',
  `height_bed` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'do cao cua hang',
  `row_spacing` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'khoa cach giua cac hang',
  `tree_spacing` varchar(255) DEFAULT NULL COMMENT 'khoang cach giua cac cay',
  `plant_soil` varchar(255) DEFAULT NULL COMMENT 'Dat canh tac',
  `info` text COMMENT 'Thong tin khac',
  `created_at` datetime DEFAULT NULL,
  `created_user` varchar(255) DEFAULT NULL,
  `updated_user` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table single_page_application.plant_stage_info
CREATE TABLE IF NOT EXISTS `plant_stage_info` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `plant_state_id` tinyint unsigned DEFAULT NULL,
  `plant_id` bigint unsigned DEFAULT NULL,
  `plant_temp` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Nhiet do',
  `plant_moisture` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'do am',
  `plant_light` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'cuong do anh sang',
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table single_page_application.plant_state
CREATE TABLE IF NOT EXISTS `plant_state` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table single_page_application.plant_types
CREATE TABLE IF NOT EXISTS `plant_types` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT '',
  `created_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '',
  `created_at` datetime DEFAULT NULL,
  `updated_user` varchar(50) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
