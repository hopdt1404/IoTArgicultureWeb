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

-- Data exporting was unselected.

-- Dumping structure for table single_page_application.plant_light_types
CREATE TABLE IF NOT EXISTS `plant_light_types` (
  `id` int NOT NULL,
  `plant_light` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Anh sang cay trong',
  `lowest` double(8,2) DEFAULT NULL,
  `highest` double(8,2) DEFAULT NULL,
  `plant_light_typescol` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table single_page_application.plant_stage
CREATE TABLE IF NOT EXISTS `plant_stage` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `plant_temp` double(8,2) DEFAULT NULL,
  `plant_moisture` double(8,2) DEFAULT NULL,
  `plant_light` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stage_period` int DEFAULT NULL,
  `stage_intruction` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
