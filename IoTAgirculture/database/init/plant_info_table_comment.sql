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

-- Dumping structure for table irrigation_database.cutivation_types
CREATE TABLE IF NOT EXISTS `cutivation_types` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Loai hinh canh tac',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Loai hinh canh tac cay trong';

-- Dumping data for table irrigation_database.cutivation_types: ~3 rows (approximately)
/*!40000 ALTER TABLE `cutivation_types` DISABLE KEYS */;
INSERT INTO `cutivation_types` (`id`, `name`) VALUES
	(1, 'Địa canh'),
	(2, 'Khí canh'),
	(3, 'Thủy canh');
/*!40000 ALTER TABLE `cutivation_types` ENABLE KEYS */;

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

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
