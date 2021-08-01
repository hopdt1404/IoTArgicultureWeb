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


-- Dumping database structure for IotAgri
DROP DATABASE IF EXISTS `IotAgri`;
CREATE DATABASE IF NOT EXISTS `IotAgri` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `IotAgri`;

-- Dumping structure for table IotAgri.Controlling
DROP TABLE IF EXISTS `Controlling`;
CREATE TABLE IF NOT EXISTS `Controlling` (
  `ControllingID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `DeviceID` bigint unsigned DEFAULT '0',
  `PlotID` bigint unsigned DEFAULT '0',
  `AmountOfWater` double unsigned DEFAULT NULL,
  `WateringDuration` int DEFAULT NULL,
  `TimeOfControl` datetime DEFAULT NULL,
  PRIMARY KEY (`ControllingID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table IotAgri.cutivation_types
DROP TABLE IF EXISTS `cutivation_types`;
CREATE TABLE IF NOT EXISTS `cutivation_types` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `cutivation_type` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table IotAgri.Devices
DROP TABLE IF EXISTS `Devices`;
CREATE TABLE IF NOT EXISTS `Devices` (
  `DeviceID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `DeviceName` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DeviceTypeID` tinyint unsigned DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `Status` tinyint unsigned DEFAULT NULL,
  `PlotID` bigint unsigned DEFAULT NULL,
  `created_user` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_user` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`DeviceID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table IotAgri.DeviceTypes
DROP TABLE IF EXISTS `DeviceTypes`;
CREATE TABLE IF NOT EXISTS `DeviceTypes` (
  `DeviceTypeID` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `DeviceType` char(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_user` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_user` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`DeviceTypeID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table IotAgri.failed_jobs
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table IotAgri.Farms
DROP TABLE IF EXISTS `Farms`;
CREATE TABLE IF NOT EXISTS `Farms` (
  `FarmID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `LocateID` char(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Area` double(10,2) unsigned DEFAULT NULL,
  `FarmTypeID` tinyint unsigned DEFAULT NULL,
  `Status` smallint unsigned NOT NULL DEFAULT '0',
  `UserID` bigint unsigned NOT NULL,
  `created_user` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_user` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`FarmID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table IotAgri.FarmTypes
DROP TABLE IF EXISTS `FarmTypes`;
CREATE TABLE IF NOT EXISTS `FarmTypes` (
  `FarmTypeID` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `FarmType` char(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_user` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_user` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`FarmTypeID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table IotAgri.Locates
DROP TABLE IF EXISTS `Locates`;
CREATE TABLE IF NOT EXISTS `Locates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `LocateID` char(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `LocateName` char(50) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `locate` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_user` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_user` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table IotAgri.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table IotAgri.mst_display
DROP TABLE IF EXISTS `mst_display`;
CREATE TABLE IF NOT EXISTS `mst_display` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `display_name` varchar(50) NOT NULL,
  `role` tinyint unsigned NOT NULL COMMENT '0: Admin, 1: Farmer',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table IotAgri.mst_operation_info
DROP TABLE IF EXISTS `mst_operation_info`;
CREATE TABLE IF NOT EXISTS `mst_operation_info` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `info` varchar(200) NOT NULL,
  `role` tinyint unsigned NOT NULL COMMENT '0: Admin, 1: Farmer',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table IotAgri.oauth_providers
DROP TABLE IF EXISTS `oauth_providers`;
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

-- Data exporting was unselected.

-- Dumping structure for table IotAgri.operation_history
DROP TABLE IF EXISTS `operation_history`;
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

-- Dumping structure for table IotAgri.password_resets
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table IotAgri.plant_info
DROP TABLE IF EXISTS `plant_info`;
CREATE TABLE IF NOT EXISTS `plant_info` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cultivation` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `growth_period` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `haverst_period` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_crop` int DEFAULT NULL,
  `end_crop` int DEFAULT NULL,
  `width_bed` double(8,2) DEFAULT NULL,
  `height_bed` double(8,2) DEFAULT NULL,
  `plant_density` double(8,2) DEFAULT NULL,
  `row_spacing` double(8,2) DEFAULT NULL,
  `tree_spacing` double(8,2) DEFAULT NULL,
  `plant_soil` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cultivar` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table IotAgri.plant_light_types
DROP TABLE IF EXISTS `plant_light_types`;
CREATE TABLE IF NOT EXISTS `plant_light_types` (
  `id` int NOT NULL,
  `plant_light` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lowest` double(8,2) DEFAULT NULL,
  `highest` double(8,2) DEFAULT NULL,
  `plant_light_typescol` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table IotAgri.plant_stage
DROP TABLE IF EXISTS `plant_stage`;
CREATE TABLE IF NOT EXISTS `plant_stage` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `plant_temp` double(8,2) DEFAULT NULL,
  `plant_moisture` double(8,2) DEFAULT NULL,
  `plant_light` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stage_period` int DEFAULT NULL,
  `stage_intruction` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table IotAgri.Plots
DROP TABLE IF EXISTS `Plots`;
CREATE TABLE IF NOT EXISTS `Plots` (
  `PlotID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Area` double(8,2) unsigned DEFAULT NULL,
  `PlotTypeID` tinyint unsigned DEFAULT NULL,
  `FarmID` bigint unsigned DEFAULT NULL,
  `created_user` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_user` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`PlotID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table IotAgri.PlotTypes
DROP TABLE IF EXISTS `PlotTypes`;
CREATE TABLE IF NOT EXISTS `PlotTypes` (
  `PlotTypeID` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `PlotType` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_user` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_user` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`PlotTypeID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table IotAgri.Sensing
DROP TABLE IF EXISTS `Sensing`;
CREATE TABLE IF NOT EXISTS `Sensing` (
  `SensingID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `DeviceID` bigint unsigned DEFAULT NULL,
  `PlotID` bigint unsigned DEFAULT NULL,
  `SoilMoisture` float unsigned DEFAULT NULL,
  `Humidity` float unsigned DEFAULT NULL,
  `Temperature` float unsigned DEFAULT NULL,
  `LightLevel` smallint unsigned DEFAULT NULL,
  `TimeOfMeasurement` datetime DEFAULT NULL,
  `created_user` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_user` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`SensingID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table IotAgri.sensor_detail
DROP TABLE IF EXISTS `sensor_detail`;
CREATE TABLE IF NOT EXISTS `sensor_detail` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `sensor_id` bigint unsigned DEFAULT NULL,
  `soil_moisture` double(8,2) DEFAULT NULL,
  `humidity` double(8,2) DEFAULT NULL,
  `temperature` double(8,2) DEFAULT NULL,
  `light_level` smallint unsigned DEFAULT NULL,
  `time_of_measurement` datetime DEFAULT NULL,
  `created_user` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_user` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table IotAgri.stage_types
DROP TABLE IF EXISTS `stage_types`;
CREATE TABLE IF NOT EXISTS `stage_types` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table IotAgri.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_type_id` tinyint unsigned NOT NULL DEFAULT '0',
  `avatar` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table IotAgri.Users
DROP TABLE IF EXISTS `Users`;
CREATE TABLE IF NOT EXISTS `Users` (
  `UserID` bigint unsigned DEFAULT NULL,
  `UserName` char(50) DEFAULT NULL,
  `Email` char(50) DEFAULT NULL,
  `UPassword` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table IotAgri.user_types
DROP TABLE IF EXISTS `user_types`;
CREATE TABLE IF NOT EXISTS `user_types` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_user` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_user` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table IotAgri.WeatherForecastAtATimes
DROP TABLE IF EXISTS `WeatherForecastAtATimes`;
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
  `created_user` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_user` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table IotAgri.WeatherForecasts
DROP TABLE IF EXISTS `WeatherForecasts`;
CREATE TABLE IF NOT EXISTS `WeatherForecasts` (
  `WeatherForecastID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `LocateID` bigint unsigned DEFAULT NULL,
  `CurrentTime` timestamp NOT NULL,
  `created_at` datetime NOT NULL,
  `created_user` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_user` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`WeatherForecastID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
