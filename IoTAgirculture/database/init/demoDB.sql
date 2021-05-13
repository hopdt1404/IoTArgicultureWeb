-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.23-0ubuntu0.20.04.1 - (Ubuntu)
-- Server OS:                    Linux
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for irrigation_database
CREATE DATABASE IF NOT EXISTS `irrigation_database` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `irrigation_database`;

-- Dumping structure for table irrigation_database.Controlling
CREATE TABLE IF NOT EXISTS `Controlling` (
  `ControllingID` bigint NOT NULL,
  `DeviceID` bigint DEFAULT NULL,
  `PlotID` int DEFAULT NULL,
  `created_user` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `AmountOfWater` float DEFAULT NULL,
  `WateringDuration` int DEFAULT NULL,
  `TimeOfControl` datetime DEFAULT NULL,
  `updated_user` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`ControllingID`),
  KEY `DeviceID` (`DeviceID`),
  KEY `PlotID` (`PlotID`),
  CONSTRAINT `Controlling_ibfk_1` FOREIGN KEY (`DeviceID`) REFERENCES `Devices` (`DeviceID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `Controlling_ibfk_2` FOREIGN KEY (`PlotID`) REFERENCES `Plots` (`PlotID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table irrigation_database.Controlling: ~0 rows (approximately)
/*!40000 ALTER TABLE `Controlling` DISABLE KEYS */;
/*!40000 ALTER TABLE `Controlling` ENABLE KEYS */;

-- Dumping structure for table irrigation_database.Devices
CREATE TABLE IF NOT EXISTS `Devices` (
  `DeviceID` bigint NOT NULL,
  `DeviceTypeID` int DEFAULT NULL,
  `DeviceName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Status` tinyint(1) DEFAULT NULL,
  `PlotID` int DEFAULT NULL,
  `created_user` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_user` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`DeviceID`),
  KEY `DeviceTypeID` (`DeviceTypeID`),
  KEY `PlotID` (`PlotID`),
  CONSTRAINT `Devices_ibfk_1` FOREIGN KEY (`DeviceTypeID`) REFERENCES `DeviceTypes` (`DeviceTypeID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `Devices_ibfk_2` FOREIGN KEY (`PlotID`) REFERENCES `Plots` (`PlotID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table irrigation_database.Devices: ~0 rows (approximately)
/*!40000 ALTER TABLE `Devices` DISABLE KEYS */;
/*!40000 ALTER TABLE `Devices` ENABLE KEYS */;

-- Dumping structure for table irrigation_database.DeviceTypes
CREATE TABLE IF NOT EXISTS `DeviceTypes` (
  `DeviceTypeID` int NOT NULL AUTO_INCREMENT,
  `DeviceType` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_user` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_user` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`DeviceTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table irrigation_database.DeviceTypes: ~0 rows (approximately)
/*!40000 ALTER TABLE `DeviceTypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `DeviceTypes` ENABLE KEYS */;

-- Dumping structure for table irrigation_database.Farms
CREATE TABLE IF NOT EXISTS `Farms` (
  `FarmID` int NOT NULL AUTO_INCREMENT,
  `LocateID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Area` double DEFAULT NULL,
  `FarmTypeID` int DEFAULT NULL,
  `Status` tinyint(1) DEFAULT NULL,
  `UserID` int DEFAULT NULL,
  `created_user` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_user` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`FarmID`),
  KEY `UserID` (`UserID`),
  KEY `FarmTypeID` (`FarmTypeID`),
  KEY `LocateID` (`LocateID`),
  CONSTRAINT `Farms_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `Users` (`UserID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `Farms_ibfk_2` FOREIGN KEY (`FarmTypeID`) REFERENCES `FarmTypes` (`FarmTypeID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `Farms_ibfk_3` FOREIGN KEY (`LocateID`) REFERENCES `Locates` (`LocateID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table irrigation_database.Farms: ~0 rows (approximately)
/*!40000 ALTER TABLE `Farms` DISABLE KEYS */;
/*!40000 ALTER TABLE `Farms` ENABLE KEYS */;

-- Dumping structure for table irrigation_database.FarmTypes
CREATE TABLE IF NOT EXISTS `FarmTypes` (
  `FarmTypeID` int NOT NULL AUTO_INCREMENT,
  `FarmType` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_user` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_user` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`FarmTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table irrigation_database.FarmTypes: ~0 rows (approximately)
/*!40000 ALTER TABLE `FarmTypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `FarmTypes` ENABLE KEYS */;

-- Dumping structure for table irrigation_database.Locates
CREATE TABLE IF NOT EXISTS `Locates` (
  `LocateID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `LocateName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_user` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_user` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`LocateID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table irrigation_database.Locates: ~0 rows (approximately)
/*!40000 ALTER TABLE `Locates` DISABLE KEYS */;
/*!40000 ALTER TABLE `Locates` ENABLE KEYS */;

-- Dumping structure for table irrigation_database.mst_display
CREATE TABLE IF NOT EXISTS `mst_display` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `display_name` varchar(50) NOT NULL,
  `role` tinyint unsigned NOT NULL COMMENT '0: Admin, 1: Farmer',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

-- Dumping data for table irrigation_database.mst_display: ~0 rows (approximately)
/*!40000 ALTER TABLE `mst_display` DISABLE KEYS */;
/*!40000 ALTER TABLE `mst_display` ENABLE KEYS */;

-- Dumping structure for table irrigation_database.mst_operation_info
CREATE TABLE IF NOT EXISTS `mst_operation_info` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `info` varchar(200) NOT NULL,
  `role` tinyint unsigned NOT NULL COMMENT '0: Admin, 1: Farmer',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8;

-- Dumping data for table irrigation_database.mst_operation_info: ~0 rows (approximately)
/*!40000 ALTER TABLE `mst_operation_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `mst_operation_info` ENABLE KEYS */;

-- Dumping structure for table irrigation_database.operation_history
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
  PRIMARY KEY (`id`) USING BTREE,
  KEY `mst_display_id` (`mst_display_id`),
  KEY `mst_operation_id` (`mst_operation_id`),
  CONSTRAINT `operation_history_ibfk_1` FOREIGN KEY (`mst_display_id`) REFERENCES `mst_display` (`id`),
  CONSTRAINT `operation_history_ibfk_2` FOREIGN KEY (`mst_operation_id`) REFERENCES `mst_operation_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table irrigation_database.operation_history: ~0 rows (approximately)
/*!40000 ALTER TABLE `operation_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `operation_history` ENABLE KEYS */;

-- Dumping structure for table irrigation_database.Plots
CREATE TABLE IF NOT EXISTS `Plots` (
  `PlotID` int NOT NULL AUTO_INCREMENT,
  `Area` double DEFAULT NULL,
  `PlotTypeID` int DEFAULT NULL,
  `FarmID` int DEFAULT NULL,
  `created_user` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_user` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`PlotID`),
  KEY `FarmID` (`FarmID`),
  KEY `PlotTypeID` (`PlotTypeID`),
  CONSTRAINT `Plots_ibfk_1` FOREIGN KEY (`FarmID`) REFERENCES `Farms` (`FarmID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `Plots_ibfk_2` FOREIGN KEY (`PlotTypeID`) REFERENCES `PlotTypes` (`PlotTypeID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table irrigation_database.Plots: ~0 rows (approximately)
/*!40000 ALTER TABLE `Plots` DISABLE KEYS */;
/*!40000 ALTER TABLE `Plots` ENABLE KEYS */;

-- Dumping structure for table irrigation_database.PlotTypes
CREATE TABLE IF NOT EXISTS `PlotTypes` (
  `PlotTypeID` int NOT NULL AUTO_INCREMENT,
  `PlotType` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_user` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_user` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`PlotTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table irrigation_database.PlotTypes: ~0 rows (approximately)
/*!40000 ALTER TABLE `PlotTypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `PlotTypes` ENABLE KEYS */;

-- Dumping structure for table irrigation_database.Sensing
CREATE TABLE IF NOT EXISTS `Sensing` (
  `SensingID` bigint NOT NULL AUTO_INCREMENT,
  `DeviceID` bigint DEFAULT NULL,
  `PlotID` int DEFAULT NULL,
  `SoilMoisture` float DEFAULT NULL,
  `Humidity` float DEFAULT NULL,
  `Temperature` float DEFAULT NULL,
  `LightLevel` int DEFAULT NULL,
  `TimeOfMeasurement` datetime DEFAULT NULL,
  `created_user` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`SensingID`),
  KEY `PlotID` (`PlotID`),
  KEY `DeviceID` (`DeviceID`),
  CONSTRAINT `Sensing_ibfk_1` FOREIGN KEY (`PlotID`) REFERENCES `Plots` (`PlotID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `Sensing_ibfk_2` FOREIGN KEY (`DeviceID`) REFERENCES `Devices` (`DeviceID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table irrigation_database.Sensing: ~0 rows (approximately)
/*!40000 ALTER TABLE `Sensing` DISABLE KEYS */;
/*!40000 ALTER TABLE `Sensing` ENABLE KEYS */;

-- Dumping structure for table irrigation_database.Users
CREATE TABLE IF NOT EXISTS `Users` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `UserName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `UPassword` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_type_id` tinyint unsigned NOT NULL DEFAULT '0',
  `avatar` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_user` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_user` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  KEY `user_type_id` (`user_type_id`),
  CONSTRAINT `Users_ibfk_1` FOREIGN KEY (`user_type_id`) REFERENCES `user_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table irrigation_database.Users: ~0 rows (approximately)
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;

-- Dumping structure for table irrigation_database.user_types
CREATE TABLE IF NOT EXISTS `user_types` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_user` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_user` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table irrigation_database.user_types: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_types` ENABLE KEYS */;

-- Dumping structure for table irrigation_database.WeatherForecastAtATimes
CREATE TABLE IF NOT EXISTS `WeatherForecastAtATimes` (
  `WeatherForecastID` int NOT NULL,
  `ForecastTime` timestamp NOT NULL,
  `EpochTime` bigint DEFAULT NULL,
  `ForecastStatus` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IsDayLight` tinyint(1) DEFAULT NULL,
  `Temperature` float DEFAULT NULL,
  `WindSpeed` float DEFAULT NULL,
  `RelativeHumidity` float DEFAULT NULL,
  `RainProbability` tinyint DEFAULT NULL,
  `PrecipitationProbability` tinyint DEFAULT NULL,
  `RainValue` float DEFAULT NULL,
  `CloudCover` tinyint DEFAULT NULL,
  `created_user` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`WeatherForecastID`,`ForecastTime`),
  CONSTRAINT `WeatherForecastAtATimes_ibfk_1` FOREIGN KEY (`WeatherForecastID`) REFERENCES `WeatherForecasts` (`WeatherForecastID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table irrigation_database.WeatherForecastAtATimes: ~0 rows (approximately)
/*!40000 ALTER TABLE `WeatherForecastAtATimes` DISABLE KEYS */;
/*!40000 ALTER TABLE `WeatherForecastAtATimes` ENABLE KEYS */;

-- Dumping structure for table irrigation_database.WeatherForecasts
CREATE TABLE IF NOT EXISTS `WeatherForecasts` (
  `WeatherForecastID` int NOT NULL AUTO_INCREMENT,
  `LocateID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CurrentTime` timestamp NULL DEFAULT NULL,
  `created_user` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`WeatherForecastID`),
  KEY `LocateID` (`LocateID`),
  CONSTRAINT `WeatherForecasts_ibfk_1` FOREIGN KEY (`LocateID`) REFERENCES `Locates` (`LocateID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table irrigation_database.WeatherForecasts: ~0 rows (approximately)
/*!40000 ALTER TABLE `WeatherForecasts` DISABLE KEYS */;
/*!40000 ALTER TABLE `WeatherForecasts` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
