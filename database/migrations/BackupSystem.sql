-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           8.0.30 - MySQL Community Server - GPL
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour carmaintain
DROP DATABASE IF EXISTS `carmaintain`;
CREATE DATABASE IF NOT EXISTS `carmaintain` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `carmaintain`;

-- Listage de la structure de table carmaintain. addon_requests
DROP TABLE IF EXISTS `addon_requests`;
CREATE TABLE IF NOT EXISTS `addon_requests` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table carmaintain.addon_requests : ~0 rows (environ)

-- Listage de la structure de table carmaintain. asset_bundles
DROP TABLE IF EXISTS `asset_bundles`;
CREATE TABLE IF NOT EXISTS `asset_bundles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `version` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `platform` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_size` bigint unsigned DEFAULT NULL,
  `file_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `asset_bundles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table carmaintain.asset_bundles : ~3 rows (environ)
INSERT INTO `asset_bundles` (`id`, `name`, `description`, `version`, `platform`, `file_size`, `file_path`, `created_at`, `updated_at`) VALUES
	(1, 'fine', 'Dolorem non voluptates sed provident commodi exercitationem.', '1', 'ea', NULL, 'public/storage/files/file_1.txt', '2024-02-15 19:38:06', '2024-02-15 20:03:23'),
	(2, 'Ratione sit quia quasi aut qui accusantium necessitatibus.', 'Animi velit unde deleniti illo iste alias voluptas.', '7', 'totam', 788, 'public/storage/files/file_2.txt', '2024-02-15 19:38:06', '2024-02-15 19:38:06'),
	(3, 'Qui iste molestiae dolores tempore dignissimos dolores.', 'Qui expedita quibusdam blanditiis pariatur quia tempora laborum voluptas.', '7', 'non', 672, 'public/storage/files/file_3.txt', '2024-02-15 19:38:06', '2024-02-15 19:38:06');

-- Listage de la structure de table carmaintain. asset_bundles_device
DROP TABLE IF EXISTS `asset_bundles_device`;
CREATE TABLE IF NOT EXISTS `asset_bundles_device` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `asset_bundles_id` bigint unsigned NOT NULL,
  `device_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `asset_bundles_device_device_id_foreign` (`device_id`),
  KEY `asset_bundles_device_asset_bundle_id_foreign` (`asset_bundles_id`) USING BTREE,
  CONSTRAINT `asset_bundles_device_asset_bundle_id_foreign` FOREIGN KEY (`asset_bundles_id`) REFERENCES `asset_bundles` (`id`),
  CONSTRAINT `asset_bundles_device_device_id_foreign` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table carmaintain.asset_bundles_device : ~0 rows (environ)

-- Listage de la structure de table carmaintain. connections
DROP TABLE IF EXISTS `connections`;
CREATE TABLE IF NOT EXISTS `connections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vehicle_id` bigint unsigned NOT NULL,
  `device_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `connection_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate` decimal(20,1) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `installationdate` date DEFAULT NULL,
  `review_id` int DEFAULT NULL,
  `comment_id` int DEFAULT NULL,
  `reminder_id` bigint unsigned DEFAULT NULL,
  `schedules_id` bigint unsigned DEFAULT NULL,
  `service` int DEFAULT NULL,
  `report_id` bigint unsigned DEFAULT NULL,
  `purchase_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`,`device_id`) USING BTREE,
  KEY `connections_vehicle_id_foreign` (`vehicle_id`) USING BTREE,
  KEY `FK_connections_devices` (`device_id`) USING BTREE,
  KEY `user_id` (`user_id`),
  KEY `review_id` (`review_id`),
  KEY `comment_id` (`comment_id`),
  KEY `reminder_id` (`reminder_id`),
  KEY `schedules_id` (`schedules_id`),
  KEY `report_id` (`report_id`),
  KEY `purchase_id` (`purchase_id`),
  CONSTRAINT `FK_connections_devices` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`),
  CONSTRAINT `FK_connections_purchases` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`),
  CONSTRAINT `FK_connections_reminders` FOREIGN KEY (`reminder_id`) REFERENCES `reminders` (`id`),
  CONSTRAINT `FK_connections_reports` FOREIGN KEY (`report_id`) REFERENCES `reports` (`id`),
  CONSTRAINT `FK_connections_schedules` FOREIGN KEY (`schedules_id`) REFERENCES `schedules` (`id`),
  CONSTRAINT `FK_connections_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_connections_vehicles` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table carmaintain.connections : ~1 rows (environ)
INSERT INTO `connections` (`id`, `vehicle_id`, `device_id`, `created_at`, `updated_at`, `connection_id`, `rate`, `name`, `user_id`, `installationdate`, `review_id`, `comment_id`, `reminder_id`, `schedules_id`, `service`, `report_id`, `purchase_id`) VALUES
	(4, 5, 2, '2024-03-04 22:04:25', '2024-03-04 22:04:25', NULL, NULL, NULL, NULL, '2024-03-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- Listage de la structure de table carmaintain. contacts
DROP TABLE IF EXISTS `contacts`;
CREATE TABLE IF NOT EXISTS `contacts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table carmaintain.contacts : ~0 rows (environ)
INSERT INTO `contacts` (`id`, `name`, `email`, `message`, `created_at`, `updated_at`) VALUES
	(1, 'Garrach Hazem', 'garrach76@gmail.com', 'yo hello', '2024-03-07 12:15:17', '2024-03-07 12:15:17'),
	(2, 'Garrach Hazem', 'garrach76@gmail.com', 'zrsetdryftugyihuojip', '2024-03-07 12:16:54', '2024-03-07 12:16:54'),
	(3, 'Garrach Hazem', 'garrach76@gmail.com', 'ytugyihuojipk;', '2024-03-07 12:21:35', '2024-03-07 12:21:35');

-- Listage de la structure de table carmaintain. dashboards
DROP TABLE IF EXISTS `dashboards`;
CREATE TABLE IF NOT EXISTS `dashboards` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `element` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `actions` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role` (`role`),
  KEY `element` (`element`),
  KEY `plan` (`plan`),
  CONSTRAINT `FK_dashboards_payment_plans` FOREIGN KEY (`plan`) REFERENCES `payment_plans` (`name`),
  CONSTRAINT `FK_dashboards_services` FOREIGN KEY (`element`) REFERENCES `services` (`name`),
  CONSTRAINT `FK_dashboards_users` FOREIGN KEY (`role`) REFERENCES `users` (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table carmaintain.dashboards : ~0 rows (environ)

-- Listage de la structure de table carmaintain. devices
DROP TABLE IF EXISTS `devices`;
CREATE TABLE IF NOT EXISTS `devices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `serial_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `installation_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table carmaintain.devices : ~8 rows (environ)
INSERT INTO `devices` (`id`, `serial_number`, `type`, `price`, `created_at`, `updated_at`, `installation_date`) VALUES
	(1, 'SN12345', 'GPS Tracker', 0.00, '2024-02-16 11:00:00', '2024-02-16 11:30:00', NULL),
	(2, 'SN67890', 'Dash Cam', 0.00, '2024-02-16 12:00:00', '2024-02-16 12:45:00', NULL),
	(3, 'SNABCDE', 'Radio', 0.00, '2024-02-16 13:30:00', '2024-02-16 14:15:00', NULL),
	(4, 'aeztrey', 'zyfgyzf', 0.00, '2024-02-18 18:31:46', '2024-02-18 18:31:46', NULL),
	(5, 'aeztrey', 'zyfgyzf', 0.00, '2024-02-18 18:32:16', '2024-02-18 18:32:16', NULL),
	(6, 'aeztrey', 'zyfgyzf', 0.00, '2024-02-18 18:32:27', '2024-02-18 18:32:27', NULL),
	(7, 'cool', 'zyfgyzf', 0.00, '2024-02-18 18:32:34', '2024-02-23 22:08:25', NULL),
	(8, 'new device', 'dffdty', 0.00, '2024-02-28 17:41:28', '2024-02-28 17:41:28', NULL),
	(9, 'cool', 'etryftugyihuoijpo', 0.00, '2024-03-05 18:26:08', '2024-03-05 18:31:14', '2024-03-05');

-- Listage de la structure de table carmaintain. failed_jobs
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

-- Listage des données de la table carmaintain.failed_jobs : ~0 rows (environ)

-- Listage de la structure de table carmaintain. jobs
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `resume` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `hash` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `approval` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table carmaintain.jobs : ~0 rows (environ)

-- Listage de la structure de table carmaintain. password_reset_tokens
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table carmaintain.password_reset_tokens : ~0 rows (environ)

-- Listage de la structure de table carmaintain. payment_plans
DROP TABLE IF EXISTS `payment_plans`;
CREATE TABLE IF NOT EXISTS `payment_plans` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table carmaintain.payment_plans : ~3 rows (environ)
INSERT INTO `payment_plans` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(4, 'Basic Plan', '2024-02-15 18:48:47', '2024-02-15 18:48:47'),
	(5, 'Standard Plan', '2024-02-15 18:48:47', '2024-02-15 18:48:47'),
	(6, 'Premium Plan', '2024-02-15 18:48:47', '2024-02-15 18:48:47');

-- Listage de la structure de table carmaintain. payment_plan_service
DROP TABLE IF EXISTS `payment_plan_service`;
CREATE TABLE IF NOT EXISTS `payment_plan_service` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `payment_plan_id` bigint unsigned NOT NULL,
  `service_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `payment_plan_service_payment_plan_id_service_id_unique` (`payment_plan_id`,`service_id`),
  KEY `payment_plan_service_service_id_foreign` (`service_id`),
  CONSTRAINT `payment_plan_service_payment_plan_id_foreign` FOREIGN KEY (`payment_plan_id`) REFERENCES `payment_plans` (`id`) ON DELETE CASCADE,
  CONSTRAINT `payment_plan_service_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table carmaintain.payment_plan_service : ~13 rows (environ)
INSERT INTO `payment_plan_service` (`id`, `payment_plan_id`, `service_id`, `created_at`, `updated_at`) VALUES
	(1, 4, 1, NULL, NULL),
	(3, 5, 6, NULL, NULL),
	(4, 5, 11, NULL, NULL),
	(5, 5, 10, NULL, NULL),
	(7, 6, 5, NULL, NULL),
	(8, 6, 6, NULL, NULL),
	(9, 6, 7, NULL, NULL),
	(10, 6, 8, NULL, NULL),
	(11, 6, 9, NULL, NULL),
	(12, 6, 10, NULL, NULL),
	(13, 6, 11, NULL, NULL);

-- Listage de la structure de table carmaintain. payment_plan_user
DROP TABLE IF EXISTS `payment_plan_user`;
CREATE TABLE IF NOT EXISTS `payment_plan_user` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `payment_plan_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `payment_plan_id` (`payment_plan_id`),
  CONSTRAINT `FK_payment_plan_user_payment_plans` FOREIGN KEY (`payment_plan_id`) REFERENCES `payment_plans` (`id`),
  CONSTRAINT `FK_payment_plan_user_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table carmaintain.payment_plan_user : ~1 rows (environ)
INSERT INTO `payment_plan_user` (`id`, `created_at`, `updated_at`, `payment_plan_id`, `user_id`) VALUES
	(1, '2024-03-06 22:35:42', '2024-03-06 22:35:43', 6, 5),
	(14, NULL, NULL, 6, 10);

-- Listage de la structure de table carmaintain. personal_access_tokens
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table carmaintain.personal_access_tokens : ~0 rows (environ)

-- Listage de la structure de table carmaintain. purchases
DROP TABLE IF EXISTS `purchases`;
CREATE TABLE IF NOT EXISTS `purchases` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL DEFAULT '0',
  `device_id` bigint unsigned NOT NULL DEFAULT '0',
  `date` date NOT NULL,
  `stat` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  KEY `device_id` (`device_id`),
  CONSTRAINT `FK__devices` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`),
  CONSTRAINT `FK__users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table carmaintain.purchases : ~0 rows (environ)

-- Listage de la structure de table carmaintain. reminders
DROP TABLE IF EXISTS `reminders`;
CREATE TABLE IF NOT EXISTS `reminders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table carmaintain.reminders : ~2 rows (environ)
INSERT INTO `reminders` (`id`, `title`, `description`, `date`, `created_at`, `updated_at`) VALUES
	(1, 'Sample Reminder 1', 'This is a sample reminder.', '2022-02-27', '2024-02-25 16:48:19', '2024-02-25 16:48:19'),
	(2, 'Sample Reminder 2', 'Another sample reminder.', '2022-03-05', '2024-02-25 16:48:19', '2024-02-25 16:48:19');

-- Listage de la structure de table carmaintain. reports
DROP TABLE IF EXISTS `reports`;
CREATE TABLE IF NOT EXISTS `reports` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `application_status` int DEFAULT NULL,
  `application_date` timestamp NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `job` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reports_user_id_foreign` (`user_id`),
  KEY `job` (`job`),
  CONSTRAINT `reports_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table carmaintain.reports : ~1 rows (environ)
INSERT INTO `reports` (`id`, `user_id`, `application_status`, `application_date`, `created_at`, `updated_at`, `job`, `title`, `description`) VALUES
	(25, 8, NULL, '2024-02-27 20:21:02', '2024-02-27 20:10:35', '2024-02-27 20:21:04', NULL, 'platfom is a bit slow', 'bbbbbbbbyyyyyyyyyy');

-- Listage de la structure de table carmaintain. schedules
DROP TABLE IF EXISTS `schedules`;
CREATE TABLE IF NOT EXISTS `schedules` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table carmaintain.schedules : ~2 rows (environ)
INSERT INTO `schedules` (`id`, `title`, `description`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES
	(1, 'Sample Schedule 1', 'This is a sample schedule.', '2022-02-27', '2022-03-05', '2024-02-25 16:48:20', '2024-02-25 16:48:20'),
	(2, 'Sample Schedule 2', 'Another sample schedule.', '2022-03-06', '2022-03-12', '2024-02-25 16:48:20', '2024-02-25 16:48:20');

-- Listage de la structure de table carmaintain. services
DROP TABLE IF EXISTS `services`;
CREATE TABLE IF NOT EXISTS `services` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table carmaintain.services : ~11 rows (environ)
INSERT INTO `services` (`id`, `name`, `description`, `created_at`, `updated_at`, `route`) VALUES
	(1, 'Basic Maintenance Tracking', 'Effortlessly track and manage your car maintenance schedule. Receive timely reminders for oil changes, inspections, and more.', '2024-02-15 18:31:37', '2024-02-15 18:31:37', 'basic-maintenance'),
	(4, 'Car Analytics', 'Gain insights into your car\'s performance with detailed analytics. Track fuel efficiency, mileage, and overall health of your vehicle.', '2024-02-15 18:48:47', '2024-02-15 18:48:47', 'car-analytics'),
	(5, 'Connected Services', 'Connect with partnered auto repair shops for seamless service appointments. Receive exclusive discounts and priority service.', '2024-02-15 18:48:47', '2024-02-15 18:48:47', 'connected-services'),
	(6, 'Reminder Notifications', 'Stay on top of your car maintenance with email and SMS notifications. Get alerted for upcoming services and never miss a beat.', '2024-02-15 18:48:47', '2024-02-15 18:48:47', 'reminder-notifications'),
	(7, 'Full Maintenance Suite', 'Unlock the full potential of our maintenance suite. Enjoy advanced features, priority support, and exclusive benefits.', '2024-02-15 18:48:47', '2024-02-15 18:48:47', 'full-maintenance-suite'),
	(8, 'Customizable Maintenance Schedules', 'Tailor your car maintenance schedules to fit your unique needs. Set personalized intervals for services and inspections.', '2024-02-15 18:48:47', '2024-02-15 18:48:47', 'customizable-maintenance-schedules'),
	(9, 'Exclusive Discounts on Partnered Auto Shops', 'As a premium member, enjoy special discounts when availing services from our partnered auto repair shops.', '2024-02-15 18:48:47', '2024-02-15 18:48:47', 'exclusive-discounts'),
	(10, 'Priority Customer Support', 'Experience top-notch customer support with our priority service for any queries or assistance you may need.', '2024-02-15 18:48:47', '2024-02-15 18:48:47', 'priority-customer-support'),
	(11, 'Advanced Maintenance Reports', 'Access detailed reports on your car\'s maintenance history and performance, helping you make informed decisions.', '2024-02-15 18:48:47', '2024-02-15 18:48:47', 'advanced-maintenance-reports');

-- Listage de la structure de table carmaintain. users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `role` (`role`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table carmaintain.users : ~5 rows (environ)
INSERT INTO `users` (`id`, `name`, `role`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(5, 'Garrach Hazem', 'admin', 'garrach76@gmail.com', NULL, '$2y$12$ArDh3fQ16xZ8J7pvtJgzEunTkYoIuMtFJBwYYBhdQDJBoMxN36fnW', NULL, '2024-02-25 00:14:59', '2024-02-28 15:08:32'),
	(6, 'garrach', 'client', 'garrach87@gmail.com', NULL, '$2y$12$yp0drNGhuG3X2D7NLtE06.XdnqJoKQZWvVqE8/H0cpTDnZW5tGGu.', NULL, '2024-02-25 15:27:59', '2024-02-28 13:22:07'),
	(7, 'user1', 'admin', 'admin@zedzd.com', NULL, '$2y$12$QRonZ01Zu3PKAMxLQqH3PuFXFejBRAMkjDiWX/Nn9OF/DzAAi8nHa', NULL, '2024-02-25 15:51:46', '2024-03-04 22:03:20'),
	(8, 'AdminAccount', 'client', 'garrach706@gmail.com', NULL, '$2y$12$Kk2n2SanT6YHYrvQJKNqB.RFQP0x0pDp4028eDNcHRmUA6.bqEg.2', NULL, '2024-02-27 17:19:09', '2024-03-01 12:08:11'),
	(9, 'ClientAccount', 'client', 'garrach809@gmail.com', NULL, '$2y$12$W2sPWoH0JwHTALAjcse8ueeLdVCOpXYJKSJAI/5v2OZmGArb0bAo6', NULL, '2024-02-27 17:20:03', '2024-03-01 12:08:33'),
	(10, 'anyUser', 'client', 'anyuser@gamil.com', NULL, '$2y$12$oOnjVKaY6TseRCRplZqczu/wdLP78IUFnFtlwmXlE4f1IUdGvy6ie', NULL, '2024-03-06 21:45:34', '2024-03-06 21:45:34');

-- Listage de la structure de table carmaintain. vehicles
DROP TABLE IF EXISTS `vehicles`;
CREATE TABLE IF NOT EXISTS `vehicles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `make` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` int NOT NULL,
  `license_plate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table carmaintain.vehicles : ~3 rows (environ)
INSERT INTO `vehicles` (`id`, `make`, `model`, `year`, `license_plate`, `created_at`, `updated_at`) VALUES
	(1, 'Toyota Default', 'Camry', 2020, 'ABC123', '2024-02-16 11:00:00', '2024-02-16 11:30:00'),
	(5, 'newVH', 'lara', 2015, '150BBH', '2024-02-20 04:09:33', '2024-02-20 04:09:34'),
	(6, 'jjtut', 'bbbbb', 2015, 'KKL88', NULL, NULL);

-- Listage de la structure de table carmaintain. wishlists
DROP TABLE IF EXISTS `wishlists`;
CREATE TABLE IF NOT EXISTS `wishlists` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table carmaintain.wishlists : ~0 rows (environ)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;