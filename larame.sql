/*
 Navicat Premium Data Transfer

 Source Server         : LocalConnection
 Source Server Type    : MariaDB
 Source Server Version : 100329
 Source Host           : 127.0.0.1:3306
 Source Schema         : larame

 Target Server Type    : MariaDB
 Target Server Version : 100329
 File Encoding         : 65001

 Date: 09/07/2021 22:34:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
BEGIN;
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (4, '2020_12_19_202005_create_projects_table', 1);
INSERT INTO `migrations` VALUES (5, '2020_12_19_202416_create_tasks_table', 1);
INSERT INTO `migrations` VALUES (6, '2020_12_23_090318_create_project_participants', 1);
COMMIT;

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for project_participants
-- ----------------------------
DROP TABLE IF EXISTS `project_participants`;
CREATE TABLE `project_participants` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `project_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of project_participants
-- ----------------------------
BEGIN;
INSERT INTO `project_participants` VALUES (1, 11, 1, '2021-07-09 22:31:05', '2021-07-09 22:31:05');
INSERT INTO `project_participants` VALUES (2, 12, 1, '2021-07-09 22:31:05', '2021-07-09 22:31:05');
COMMIT;

-- ----------------------------
-- Table structure for projects
-- ----------------------------
DROP TABLE IF EXISTS `projects`;
CREATE TABLE `projects` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of projects
-- ----------------------------
BEGIN;
INSERT INTO `projects` VALUES (1, 'project one', 'project one body', '2021-07-09 20:32:49', '2021-07-09 20:32:49');
COMMIT;

-- ----------------------------
-- Table structure for tasks
-- ----------------------------
DROP TABLE IF EXISTS `tasks`;
CREATE TABLE `tasks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tasks_project_id_index` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tasks
-- ----------------------------
BEGIN;
INSERT INTO `tasks` VALUES (1, 'Task number one', 1, '2021-07-09 16:03:15', '2021-07-09 16:03:15');
INSERT INTO `tasks` VALUES (2, 'task number two', 1, '2021-07-09 16:24:35', '2021-07-09 16:24:35');
INSERT INTO `tasks` VALUES (3, 'task number three', 1, '2021-07-09 16:28:41', '2021-07-09 16:28:41');
INSERT INTO `tasks` VALUES (4, 'task number four', 1, '2021-07-09 18:02:30', '2021-07-09 18:02:30');
INSERT INTO `tasks` VALUES (5, 'hello', 1, '2021-07-09 18:03:39', '2021-07-09 18:03:39');
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES (1, 'Nicklaus Stark Jr.', 'qgibson@example.net', '2021-07-09 15:58:20', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'h42Y7yRQXD', '2021-07-09 15:58:20', '2021-07-09 15:58:20');
INSERT INTO `users` VALUES (2, 'Leilani Mante', 'sonny.frami@example.net', '2021-07-09 15:58:20', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'fTftvgPJXe', '2021-07-09 15:58:20', '2021-07-09 15:58:20');
INSERT INTO `users` VALUES (3, 'Mr. Brad Sawayn III', 'fwalsh@example.org', '2021-07-09 15:58:20', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '0YKO4vtcJn', '2021-07-09 15:58:20', '2021-07-09 15:58:20');
INSERT INTO `users` VALUES (4, 'Adelia Torphy', 'terrance88@example.com', '2021-07-09 15:58:20', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'DNspZLNl4l', '2021-07-09 15:58:20', '2021-07-09 15:58:20');
INSERT INTO `users` VALUES (5, 'Adriel Feest', 'swaniawski.jodie@example.org', '2021-07-09 15:58:20', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Cq3yLzxcWx', '2021-07-09 15:58:20', '2021-07-09 15:58:20');
INSERT INTO `users` VALUES (6, 'Dr. Vicente Koelpin Sr.', 'hirthe.pierce@example.com', '2021-07-09 15:58:20', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'E46crXlDfs', '2021-07-09 15:58:20', '2021-07-09 15:58:20');
INSERT INTO `users` VALUES (7, 'Ova Keeling', 'scollier@example.org', '2021-07-09 15:58:20', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '1LNOKh9kp1', '2021-07-09 15:58:20', '2021-07-09 15:58:20');
INSERT INTO `users` VALUES (8, 'Prof. Tyree Kunde', 'heidenreich.lottie@example.org', '2021-07-09 15:58:20', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ncULvS9DWi', '2021-07-09 15:58:20', '2021-07-09 15:58:20');
INSERT INTO `users` VALUES (9, 'Adeline Gorczany', 'houston31@example.org', '2021-07-09 15:58:20', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ssUJw75WNz', '2021-07-09 15:58:20', '2021-07-09 15:58:20');
INSERT INTO `users` VALUES (10, 'Friedrich Abshire', 'ziemann.alvah@example.net', '2021-07-09 15:58:20', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ukgpuDWYZr', '2021-07-09 15:58:20', '2021-07-09 15:58:20');
INSERT INTO `users` VALUES (11, 'Mahdi Arjangi', 'mahdi@mail.com', NULL, '$2y$10$q2wyHAns0E6xCHnoSMpHb.5Xocu7ZB8tJBpjIUOhj9xs6kjHokS5G', NULL, '2021-07-09 15:58:57', '2021-07-09 15:58:57');
INSERT INTO `users` VALUES (12, 'Rezvan Sheykhi', 'rezvan@mail.com', NULL, '$2y$10$ZsF4lYWqaKPLVEG1ZDC6LOBELBa/u37pw8Of.dlHtdpnMGN0/sxLO', NULL, '2021-07-09 16:11:48', '2021-07-09 16:11:48');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
