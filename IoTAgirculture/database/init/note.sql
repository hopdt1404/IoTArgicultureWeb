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

-- Dumping structure for table single_page_application.agriculture_plants
CREATE TABLE IF NOT EXISTS `agriculture_plants` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `plant_id` bigint unsigned DEFAULT NULL,
  `plant_state_id` tinyint unsigned DEFAULT NULL,
  `FarmID` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `growth_period` mediumint unsigned DEFAULT NULL,
  `temperature` float DEFAULT NULL,
  `moisture` float DEFAULT NULL,
  `light` text COLLATE utf8_unicode_ci,
  `note` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `created_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table single_page_application.Controlling
CREATE TABLE IF NOT EXISTS `Controlling` (
  `ControllingID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `DeviceID` bigint unsigned DEFAULT '0',
  `PlotID` bigint unsigned DEFAULT '0',
  `AmountOfWater` double DEFAULT NULL,
  `WateringDuration` int DEFAULT NULL,
  `TimeOfControl` datetime DEFAULT NULL,
  PRIMARY KEY (`ControllingID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table single_page_application.cutivation_types
CREATE TABLE IF NOT EXISTS `cutivation_types` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `cutivation_type` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table single_page_application.Devices
CREATE TABLE IF NOT EXISTS `Devices` (
  `DeviceID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `DeviceName` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `DeviceTypeID` tinyint unsigned DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `Status` tinyint DEFAULT NULL,
  `FarmID` bigint unsigned DEFAULT NULL,
  `PlotID` bigint unsigned DEFAULT NULL,
  `created_user` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_user` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`DeviceID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table single_page_application.DeviceTypes
CREATE TABLE IF NOT EXISTS `DeviceTypes` (
  `DeviceTypeID` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `DeviceType` char(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_user` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `updated_user` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`DeviceTypeID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table single_page_application.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table single_page_application.Farms
CREATE TABLE IF NOT EXISTS `Farms` (
  `FarmID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `LocateID` char(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '0',
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Area` double(10,2) unsigned DEFAULT NULL,
  `FarmTypeID` tinyint unsigned DEFAULT NULL,
  `Status` smallint unsigned NOT NULL DEFAULT '0',
  `info` text COLLATE utf8_unicode_ci,
  `UserID` bigint unsigned NOT NULL,
  `created_user` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `updated_user` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`FarmID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table single_page_application.FarmTypes
CREATE TABLE IF NOT EXISTS `FarmTypes` (
  `FarmTypeID` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `FarmType` char(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_user` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `updated_user` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`FarmTypeID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table single_page_application.farm_plants
CREATE TABLE IF NOT EXISTS `farm_plants` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `FarmID` bigint unsigned DEFAULT NULL,
  `plant_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table single_page_application.Locates
CREATE TABLE IF NOT EXISTS `Locates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `LocateID` char(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `LocateName` char(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '0',
  `locate` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_user` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `updated_user` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table single_page_application.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table single_page_application.mst_display
CREATE TABLE IF NOT EXISTS `mst_display` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `display_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `role` tinyint unsigned NOT NULL COMMENT '0: Admin, 1: Farmer',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table single_page_application.mst_operation_info
CREATE TABLE IF NOT EXISTS `mst_operation_info` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `info` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `role` tinyint unsigned NOT NULL COMMENT '0: Admin, 1: Farmer',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table single_page_application.oauth_providers
CREATE TABLE IF NOT EXISTS `oauth_providers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `provider_user_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `access_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `refresh_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_providers_user_id_foreign` (`user_id`),
  KEY `oauth_providers_provider_user_id_index` (`provider_user_id`),
  CONSTRAINT `oauth_providers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.

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

-- Data exporting was unselected.

-- Dumping structure for table single_page_application.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table single_page_application.plants
CREATE TABLE IF NOT EXISTS `plants` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `cultivars` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'giong cay trong',
  `plant_type_id` smallint DEFAULT NULL,
  `growth_period` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Thoi gian sinh truong',
  `planting_time` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT 'thoi gian gieo trong',
  `plant_density` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'mat do cay trong',
  `width_bed` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Do rong hang',
  `height_bed` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'do cao cua hang',
  `row_spacing` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'khoa cach giua cac hang',
  `tree_spacing` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'khoang cach giua cac cay',
  `soil_type_id` tinyint unsigned DEFAULT NULL COMMENT 'Dat canh tac',
  `info` text COLLATE utf8_unicode_ci COMMENT 'Thong tin khac',
  `created_at` datetime DEFAULT NULL,
  `created_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table single_page_application.plant_info
CREATE TABLE IF NOT EXISTS `plant_info` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `cultivationtr` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'canh tac',
  `growth_period` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'thoi gain sinh truong',
  `haverst_period` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ky thu hoach',
  `start_crop` int DEFAULT NULL COMMENT 'bat dau mua vu',
  `end_crop` int DEFAULT NULL COMMENT 'thoi gian ket thuc',
  `width_bed` double(8,2) DEFAULT NULL COMMENT 'do rong luong',
  `height_bed` double(8,2) DEFAULT NULL COMMENT 'chieu cao luong',
  `plant_density` double(8,2) DEFAULT NULL COMMENT 'mat do',
  `row_spacing` double(8,2) DEFAULT NULL COMMENT 'khoang cah giua hang',
  `tree_spacing` double(8,2) DEFAULT NULL COMMENT 'khoang cach giua cay',
  `plant_soil` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `cultivar` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table single_page_application.plant_light_types
CREATE TABLE IF NOT EXISTS `plant_light_types` (
  `id` int NOT NULL,
  `plant_light` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Anh sang cay trong',
  `lowest` double(8,2) DEFAULT NULL,
  `highest` double(8,2) DEFAULT NULL,
  `plant_light_typescol` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table single_page_application.plant_states
CREATE TABLE IF NOT EXISTS `plant_states` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `note` text COLLATE utf8_unicode_ci,
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `created_at` datetime DEFAULT NULL,
  `updated_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table single_page_application.plant_state_infos
CREATE TABLE IF NOT EXISTS `plant_state_infos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `plant_state_id` tinyint unsigned NOT NULL,
  `plant_id` bigint unsigned NOT NULL,
  `growth_period_state` mediumint unsigned DEFAULT NULL COMMENT 'thoi gian sinh truong cua trang thai',
  `temperature` float DEFAULT NULL COMMENT 'Nhiet do',
  `moisture` float DEFAULT NULL COMMENT 'do am',
  `light` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT 'cuong do anh sang',
  `note` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `created_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table single_page_application.plant_types
CREATE TABLE IF NOT EXISTS `plant_types` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `created_at` datetime DEFAULT NULL,
  `updated_user` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table single_page_application.Plots
CREATE TABLE IF NOT EXISTS `Plots` (
  `PlotID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Area` double(8,2) unsigned DEFAULT NULL,
  `PlotTypeID` tinyint unsigned DEFAULT NULL,
  `FarmID` bigint unsigned DEFAULT NULL,
  `created_user` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `updated_user` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`PlotID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table single_page_application.PlotTypes
CREATE TABLE IF NOT EXISTS `PlotTypes` (
  `PlotTypeID` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `PlotType` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_user` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `updated_user` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`PlotTypeID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.

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
  `created_user` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `updated_user` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`SensingID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table single_page_application.sensor_detail
CREATE TABLE IF NOT EXISTS `sensor_detail` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `sensor_id` bigint unsigned DEFAULT NULL,
  `soil_moisture` double(8,2) DEFAULT NULL,
  `humidity` double(8,2) DEFAULT NULL,
  `temperature` double(8,2) DEFAULT NULL,
  `light_level` smallint unsigned DEFAULT NULL,
  `time_of_measurement` datetime DEFAULT NULL,
  `created_user` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `updated_user` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table single_page_application.soil_types
CREATE TABLE IF NOT EXISTS `soil_types` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `info` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `created_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table single_page_application.stage_types
CREATE TABLE IF NOT EXISTS `stage_types` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table single_page_application.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table single_page_application.Users
CREATE TABLE IF NOT EXISTS `Users` (
  `UserID` bigint unsigned DEFAULT NULL,
  `UserName` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Email` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UPassword` char(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table single_page_application.user_types
CREATE TABLE IF NOT EXISTS `user_types` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_user` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `updated_user` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table single_page_application.WeatherForecastAtATimes
CREATE TABLE IF NOT EXISTS `WeatherForecastAtATimes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `WeatherForecastID` bigint unsigned NOT NULL,
  `ForecastTime` timestamp NOT NULL,
  `EpochTime` bigint unsigned DEFAULT NULL,
  `ForecastStatus` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `IsDayLight` tinyint unsigned DEFAULT NULL,
  `Temperature` double(8,2) DEFAULT NULL,
  `WindSpeed` double(8,2) DEFAULT NULL,
  `RelativeHumidity` double(8,2) DEFAULT NULL,
  `RainProbability` double(4,1) DEFAULT NULL,
  `PrecipitationProbability` double(4,1) DEFAULT NULL,
  `RainValue` double(8,2) unsigned DEFAULT NULL,
  `CloudCover` smallint unsigned DEFAULT NULL,
  `created_user` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `updated_user` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table single_page_application.WeatherForecasts
CREATE TABLE IF NOT EXISTS `WeatherForecasts` (
  `WeatherForecastID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `LocateID` bigint unsigned DEFAULT NULL,
  `CurrentTime` timestamp NOT NULL,
  `created_at` datetime NOT NULL,
  `created_user` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `updated_user` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`WeatherForecastID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_single_page_applicationFOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
