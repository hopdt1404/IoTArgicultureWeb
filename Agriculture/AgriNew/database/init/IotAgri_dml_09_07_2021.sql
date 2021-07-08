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

-- Dumping data for table IotAgri.Controlling: ~0 rows (approximately)
DELETE FROM `Controlling`;
/*!40000 ALTER TABLE `Controlling` DISABLE KEYS */;
/*!40000 ALTER TABLE `Controlling` ENABLE KEYS */;

-- Dumping data for table IotAgri.cutivation_types: ~3 rows (approximately)
DELETE FROM `cutivation_types`;
/*!40000 ALTER TABLE `cutivation_types` DISABLE KEYS */;
INSERT INTO `cutivation_types` (`id`, `cutivation_type`) VALUES
	(1, 'Địa canh'),
	(2, 'Khí canh'),
	(3, 'Thủy canh');
/*!40000 ALTER TABLE `cutivation_types` ENABLE KEYS */;

-- Dumping data for table IotAgri.Devices: ~1 rows (approximately)
DELETE FROM `Devices`;
/*!40000 ALTER TABLE `Devices` DISABLE KEYS */;
INSERT INTO `Devices` (`DeviceID`, `DeviceName`, `DeviceTypeID`, `user_id`, `Status`, `PlotID`, `created_user`, `updated_user`, `created_at`, `updated_at`) VALUES
	(1, 'Asus_510UQ', NULL, NULL, 13, NULL, 'hopdt', 'nono', '2021-03-26 21:45:08', '2021-03-27 00:09:48');
/*!40000 ALTER TABLE `Devices` ENABLE KEYS */;

-- Dumping data for table IotAgri.DeviceTypes: ~0 rows (approximately)
DELETE FROM `DeviceTypes`;
/*!40000 ALTER TABLE `DeviceTypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `DeviceTypes` ENABLE KEYS */;

-- Dumping data for table IotAgri.failed_jobs: ~0 rows (approximately)
DELETE FROM `failed_jobs`;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Dumping data for table IotAgri.Farms: ~6 rows (approximately)
DELETE FROM `Farms`;
/*!40000 ALTER TABLE `Farms` DISABLE KEYS */;
INSERT INTO `Farms` (`FarmID`, `LocateID`, `name`, `Area`, `FarmTypeID`, `Status`, `UserID`, `created_user`, `updated_user`, `created_at`, `updated_at`) VALUES
	(1, '0', 'Farm 01', 10.40, NULL, 2, 0, 'hopdt', 'hopdt', '2021-05-07 22:57:27', '2021-05-17 23:34:06'),
	(2, '0', 'Farm 02 ed', 12.10, NULL, 2, 0, 'hopdt', 'hopdt', '2021-05-08 22:28:34', '2021-05-16 21:01:47'),
	(3, '0', 'Farm 03', 12.40, NULL, 2, 0, 'hopdt', 'hopdt', '2021-05-09 23:07:13', '2021-05-17 23:34:12'),
	(4, '0', 'Farm 04', 10.30, NULL, 1, 0, 'hopdt', 'hopdt', '2021-05-09 23:18:39', '2021-05-13 23:20:41'),
	(5, '0', 'Farm 05', 10.30, NULL, 1, 0, 'hopdt', 'hopdt', '2021-05-09 23:19:04', '2021-05-17 23:34:19'),
	(6, '0', 'farm 09', 12.40, NULL, 1, 0, 'hopdt', 'hopdt', '2021-05-11 22:54:05', '2021-05-17 23:33:16');
/*!40000 ALTER TABLE `Farms` ENABLE KEYS */;

-- Dumping data for table IotAgri.FarmTypes: ~1 rows (approximately)
DELETE FROM `FarmTypes`;
/*!40000 ALTER TABLE `FarmTypes` DISABLE KEYS */;
INSERT INTO `FarmTypes` (`FarmTypeID`, `FarmType`, `name`, `created_user`, `updated_user`, `created_at`, `updated_at`) VALUES
	(1, '0', 'Asus_510UQ', 'hopdt', NULL, '2021-03-26 14:29:19', NULL);
/*!40000 ALTER TABLE `FarmTypes` ENABLE KEYS */;

-- Dumping data for table IotAgri.Locates: ~0 rows (approximately)
DELETE FROM `Locates`;
/*!40000 ALTER TABLE `Locates` DISABLE KEYS */;
/*!40000 ALTER TABLE `Locates` ENABLE KEYS */;

-- Dumping data for table IotAgri.migrations: ~17 rows (approximately)
DELETE FROM `migrations`;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2017_12_07_122845_create_oauth_providers_table', 1),
	(4, '2019_08_19_000000_create_failed_jobs_table', 1),
	(5, '2021_03_25_042331_add_column_to_users_table', 1),
	(6, '2021_03_25_044351_create_user_types_table', 1),
	(7, '2021_03_26_105045_create_farms_table', 1),
	(8, '2021_03_26_105107_create_farm_types_table', 1),
	(9, '2021_03_26_105120_create_locates_table', 1),
	(10, '2021_03_26_105147_create_weather_forecasts_table', 1),
	(11, '2021_03_26_105157_create_weather_forecast_detail_table', 1),
	(12, '2021_03_26_105209_create_plots_table', 1),
	(13, '2021_03_26_105231_create_plot_types_table', 1),
	(14, '2021_03_26_105254_create_sensors_table', 1),
	(15, '2021_03_26_105305_create_sensor_detail_table', 1),
	(16, '2021_03_26_105321_create_devices_table', 1),
	(17, '2021_03_26_105328_create_device_types_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping data for table IotAgri.mst_display: ~0 rows (approximately)
DELETE FROM `mst_display`;
/*!40000 ALTER TABLE `mst_display` DISABLE KEYS */;
/*!40000 ALTER TABLE `mst_display` ENABLE KEYS */;

-- Dumping data for table IotAgri.mst_operation_info: ~0 rows (approximately)
DELETE FROM `mst_operation_info`;
/*!40000 ALTER TABLE `mst_operation_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `mst_operation_info` ENABLE KEYS */;

-- Dumping data for table IotAgri.oauth_providers: ~0 rows (approximately)
DELETE FROM `oauth_providers`;
/*!40000 ALTER TABLE `oauth_providers` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_providers` ENABLE KEYS */;

-- Dumping data for table IotAgri.operation_history: ~0 rows (approximately)
DELETE FROM `operation_history`;
/*!40000 ALTER TABLE `operation_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `operation_history` ENABLE KEYS */;

-- Dumping data for table IotAgri.password_resets: ~0 rows (approximately)
DELETE FROM `password_resets`;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping data for table IotAgri.plant_info: ~2 rows (approximately)
DELETE FROM `plant_info`;
/*!40000 ALTER TABLE `plant_info` DISABLE KEYS */;
INSERT INTO `plant_info` (`id`, `name`, `cultivation`, `growth_period`, `haverst_period`, `start_crop`, `end_crop`, `width_bed`, `height_bed`, `plant_density`, `row_spacing`, `tree_spacing`, `plant_soil`, `cultivar`) VALUES
	(1, 'Dưa lê', 'C', '60', '25', 2, 11, 1.80, 0.30, 1.20, 1.50, 0.50, 'Clay', NULL),
	(2, 'Dưa lê2', 'T', '40', '20', 0, 0, 0.00, NULL, 1.50, NULL, 0.30, 'Nutrient solution', NULL);
/*!40000 ALTER TABLE `plant_info` ENABLE KEYS */;

-- Dumping data for table IotAgri.plant_light_types: ~3 rows (approximately)
DELETE FROM `plant_light_types`;
/*!40000 ALTER TABLE `plant_light_types` DISABLE KEYS */;
INSERT INTO `plant_light_types` (`id`, `plant_light`, `lowest`, `highest`, `plant_light_typescol`) VALUES
	(1, 'Low', 0.00, 200.00, NULL),
	(2, 'Medium', 200.00, 800.00, NULL),
	(3, 'Hight', 800.00, 1200.00, NULL);
/*!40000 ALTER TABLE `plant_light_types` ENABLE KEYS */;

-- Dumping data for table IotAgri.plant_stage: ~3 rows (approximately)
DELETE FROM `plant_stage`;
/*!40000 ALTER TABLE `plant_stage` DISABLE KEYS */;
INSERT INTO `plant_stage` (`id`, `plant_temp`, `plant_moisture`, `plant_light`, `stage_period`, `stage_intruction`) VALUES
	(1, 25.00, 80.00, 'Medium', 20, '...'),
	(2, 25.00, 75.00, 'Medium', 20, '...'),
	(3, 27.00, 70.00, 'Low', 20, '...');
/*!40000 ALTER TABLE `plant_stage` ENABLE KEYS */;

-- Dumping data for table IotAgri.Plots: ~0 rows (approximately)
DELETE FROM `Plots`;
/*!40000 ALTER TABLE `Plots` DISABLE KEYS */;
/*!40000 ALTER TABLE `Plots` ENABLE KEYS */;

-- Dumping data for table IotAgri.PlotTypes: ~0 rows (approximately)
DELETE FROM `PlotTypes`;
/*!40000 ALTER TABLE `PlotTypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `PlotTypes` ENABLE KEYS */;

-- Dumping data for table IotAgri.Sensing: ~0 rows (approximately)
DELETE FROM `Sensing`;
/*!40000 ALTER TABLE `Sensing` DISABLE KEYS */;
/*!40000 ALTER TABLE `Sensing` ENABLE KEYS */;

-- Dumping data for table IotAgri.sensor_detail: ~0 rows (approximately)
DELETE FROM `sensor_detail`;
/*!40000 ALTER TABLE `sensor_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `sensor_detail` ENABLE KEYS */;

-- Dumping data for table IotAgri.stage_types: ~4 rows (approximately)
DELETE FROM `stage_types`;
/*!40000 ALTER TABLE `stage_types` DISABLE KEYS */;
INSERT INTO `stage_types` (`id`, `name`) VALUES
	(1, 'Seed'),
	(2, 'Sapling'),
	(3, 'Mature'),
	(4, 'Harvesting');
/*!40000 ALTER TABLE `stage_types` ENABLE KEYS */;

-- Dumping data for table IotAgri.users: ~3 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `address`, `phone_number`, `user_type_id`, `avatar`) VALUES
	(1, 'hopdt1404', 'hopdt1404@gmail.com', NULL, '$2y$10$kNTMhdMROIkVSUy.jPgxQeagG4Kz/SHsYT.pr1/2uYrlYCTsm4G2q', NULL, '2021-07-04 16:49:14', '2021-05-17 15:43:00', 'Vua hai san truong xax', '(+84)38.635.784', 0, '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'),
	(2, '17021389@vnu.edu.vn', '17021389@vnu.edu.vn', NULL, '$2y$10$YJ.LGrLV8E7Eg7cqVabMhOslhMD7nd6c172y6v.wnaJH8RytDuvUq', NULL, '2021-07-04 16:24:33', '2021-07-04 16:24:33', NULL, NULL, 0, NULL),
	(3, 'thjenhop99', 'thjenhop99@gmail.com', NULL, '$2y$10$ubvlmtnrXfcmdsbqlkicMegAdhHBuwvCgNwP9Mtg7ctOhoh8DpTz.', NULL, '2021-07-04 16:29:24', '2021-07-04 16:29:24', NULL, NULL, 0, NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping data for table IotAgri.Users: ~0 rows (approximately)
DELETE FROM `Users`;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;

-- Dumping data for table IotAgri.user_types: ~0 rows (approximately)
DELETE FROM `user_types`;
/*!40000 ALTER TABLE `user_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_types` ENABLE KEYS */;

-- Dumping data for table IotAgri.WeatherForecastAtATimes: ~0 rows (approximately)
DELETE FROM `WeatherForecastAtATimes`;
/*!40000 ALTER TABLE `WeatherForecastAtATimes` DISABLE KEYS */;
/*!40000 ALTER TABLE `WeatherForecastAtATimes` ENABLE KEYS */;

-- Dumping data for table IotAgri.WeatherForecasts: ~0 rows (approximately)
DELETE FROM `WeatherForecasts`;
/*!40000 ALTER TABLE `WeatherForecasts` DISABLE KEYS */;
/*!40000 ALTER TABLE `WeatherForecasts` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
