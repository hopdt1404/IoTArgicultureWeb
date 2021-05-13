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

-- Dumping structure for table irrigation_database.irrigation_plant
CREATE TABLE IF NOT EXISTS `irrigation_plant` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `farm_id` int DEFAULT NULL,
  `plant_id` bigint unsigned DEFAULT NULL,
  `irrigation` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `FK_irrigation_plant_Users` (`user_id`),
  KEY `FK_irrigation_plant_Farms` (`farm_id`),
  KEY `FK_irrigation_plant_plants` (`plant_id`),
  CONSTRAINT `FK_irrigation_plant_Farms` FOREIGN KEY (`farm_id`) REFERENCES `Farms` (`FarmID`),
  CONSTRAINT `FK_irrigation_plant_plants` FOREIGN KEY (`plant_id`) REFERENCES `plants` (`id`),
  CONSTRAINT `FK_irrigation_plant_Users` FOREIGN KEY (`user_id`) REFERENCES `Users` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Thiet lap tuoi tieu cho cay trong';

-- Dumping data for table irrigation_database.irrigation_plant: ~0 rows (approximately)
/*!40000 ALTER TABLE `irrigation_plant` DISABLE KEYS */;
/*!40000 ALTER TABLE `irrigation_plant` ENABLE KEYS */;

-- Dumping structure for table irrigation_database.my_plant
CREATE TABLE IF NOT EXISTS `my_plant` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `farm_id` int DEFAULT NULL,
  `plant_id` bigint unsigned DEFAULT NULL,
  `detail` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_my_plant_Users` (`user_id`),
  KEY `FK_my_plant_Farms` (`farm_id`),
  KEY `FK_my_plant_plants` (`plant_id`),
  CONSTRAINT `FK_my_plant_Farms` FOREIGN KEY (`farm_id`) REFERENCES `Farms` (`FarmID`),
  CONSTRAINT `FK_my_plant_plants` FOREIGN KEY (`plant_id`) REFERENCES `plants` (`id`),
  CONSTRAINT `FK_my_plant_Users` FOREIGN KEY (`user_id`) REFERENCES `Users` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Cay trong cua toi';

-- Dumping data for table irrigation_database.my_plant: ~0 rows (approximately)
/*!40000 ALTER TABLE `my_plant` DISABLE KEYS */;
/*!40000 ALTER TABLE `my_plant` ENABLE KEYS */;

-- Dumping structure for table irrigation_database.plants
CREATE TABLE IF NOT EXISTS `plants` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cultivation` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Loai hinh canh tac ?? co 1 loai hinh canh tac hay nhieu loai hinh canh tac voi moi cay trong ?\r\nVa voi moi loai hinh canh tac thi cac thong so co ban (thong tin chung) ve cay co khac nhau khong ? Cac giai doan phat trien cua cay co khac nhau ve dieu kien (nhiet do, do am, anh sang khong)? \r\n\r\nVD:\r\nCay Dua Le co 2 loaij hinh canh tac\r\nCay bof duoi dat hay cho leo len gianf\r\n\r\nThong tin co ban:\r\nThoi gian cho thu hoach: 50 - 60 ngay\r\n\r\n=> Leo gian va trồng (trong) cay  bò (bof) duoi dat van laf 50-60 ngay chu ?\r\n\r\nThong tin qua trinh phat trien\r\n\r\nGiai doan truong thanh\r\nCach cham soc va cac thong so vef nhiet do va do am co khac biet gif khong \r\nLeo Gianf - trong bo\r\n\r\n',
  `growth_period` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Thoi gian cay cho thu hoach ?? hieu nhu the nay sat hon tu (Thoi ki sinh truong) khong ?',
  `haverst_period` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Qua trinh thu hoach ?? lam ro nghia hon cai nay bang mo ta hoac vi du cang tot\r\n',
  `start_crop` int DEFAULT NULL COMMENT 'Bat dau mua vu',
  `end_crop` int DEFAULT NULL COMMENT 'ket thuc mua vu',
  `width_bed` double(8,2) DEFAULT NULL COMMENT 'Do rong cua luong ?? luong la gi ?? (co the bo sung link dinh nghia Luoosng (Luống)) anh hoi ngai search ',
  `height_bed` double(8,2) DEFAULT NULL COMMENT '?? Do cao cua luong',
  `plant_density` double(8,2) DEFAULT NULL COMMENT 'Mat do trong cay',
  `row_spacing` double(8,2) DEFAULT NULL COMMENT 'khoang cach giua cac hang la gi, tinh tu dau toi dau ?? (co the gui link hoac giai thich)',
  `tree_spacing` double(8,2) DEFAULT NULL COMMENT 'Khoang cach giua cac cay la gi ??  tinh tu goc 2 cay hay nhu the nao ??',
  `plant_soil` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '?? Dat trong?? mo ta chi tiet hon duoc khong ? (cac loai dat trong hay nhu the nao)',
  `cultivar` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '?? Giong cay trong',
  `plant_detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Thong tin chi tiet dang nhu ben duoi.\r\ncan bo sung thong tin gi thi tu sua vaf comment\r\n\r\n{\r\n  \r\n  "0" : {\r\n    "stage_type":"Seed", // trang thai cay: Hat\r\n    "plant_temp":"25.00", // nhiet do 25 oC\r\n    "plant_moisture":"p80", // do am 80%\r\n    "stage_period":"20", // Thoi gian sinh truong cua gian doan hat 20 ngay ??\r\n    "stage_intruction":"BMW", // Day la gif ?? ?? Huong dan cham soc cho giai doan ?? mo ta chi tiet hon\r\n    "plant_light_info": {\r\n        "light intensity": "Low", // this column update => check later : muc cuong do sang\r\n        "lowest": "0.00", // nguong muc sang thap nhat\r\n        "highest": "200.00" // muc sang cao nhat\r\n    }\r\n  },\r\n  "1": {\r\n      "tuong_tu": "temp_val"\r\n  },\r\n  "2": {\r\n\r\n  }\r\n }\r\n',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Cac cay trong';

-- Dumping data for table irrigation_database.plants: ~2 rows (approximately)
/*!40000 ALTER TABLE `plants` DISABLE KEYS */;
INSERT INTO `plants` (`id`, `name`, `cultivation`, `growth_period`, `haverst_period`, `start_crop`, `end_crop`, `width_bed`, `height_bed`, `plant_density`, `row_spacing`, `tree_spacing`, `plant_soil`, `cultivar`, `plant_detail`) VALUES
	(1, 'Dưa lê', 'C', '60', '25', 2, 11, 1.80, 0.30, 1.20, 1.50, 0.50, 'Clay', NULL, NULL),
	(2, 'Dưa lê2', 'T', '40', '20', 0, 0, 0.00, NULL, 1.50, NULL, 0.30, 'Nutrient solution', NULL, NULL);
/*!40000 ALTER TABLE `plants` ENABLE KEYS */;

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
