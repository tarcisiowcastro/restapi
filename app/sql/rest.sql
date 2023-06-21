-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.28-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para targetin_rest
CREATE DATABASE IF NOT EXISTS `targetin_rest` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `targetin_rest`;

-- Copiando estrutura para tabela targetin_rest.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `users_id` bigint(20) unsigned NOT NULL,
  `user_lists_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_users_id_foreign` (`users_id`),
  KEY `categories_user_lists_id_foreign` (`user_lists_id`),
  CONSTRAINT `categories_user_lists_id_foreign` FOREIGN KEY (`user_lists_id`) REFERENCES `user_lists` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `categories_users_id_foreign` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela targetin_rest.categories: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`, `name`, `color`, `icon`, `users_id`, `user_lists_id`, `created_at`, `updated_at`) VALUES
	(1, 'Categoria 1', '1', '1', 1, 1, '2023-06-20 15:27:24', '2023-06-20 15:27:25'),
	(2, 'Categoria 2\r\n', '1', '1', 1, 1, '2023-06-20 15:27:24', '2023-06-20 15:27:25');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Copiando estrutura para tabela targetin_rest.category_items
CREATE TABLE IF NOT EXISTS `category_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `category_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_items_category_id_foreign` (`category_id`),
  CONSTRAINT `category_items_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela targetin_rest.category_items: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `category_items` DISABLE KEYS */;
INSERT INTO `category_items` (`id`, `name`, `category_id`, `created_at`, `updated_at`) VALUES
	(1, 'Item 1', 1, '2023-06-20 15:28:03', '2023-06-20 15:28:04'),
	(2, 'Item 2', 1, '2023-06-20 15:28:03', '2023-06-20 15:28:04'),
	(3, 'Item 3', 2, '2023-06-20 15:28:20', '2023-06-20 15:28:21'),
	(4, 'Item 4', 2, '2023-06-20 15:28:28', '2023-06-20 15:28:29');
/*!40000 ALTER TABLE `category_items` ENABLE KEYS */;

-- Copiando estrutura para tabela targetin_rest.check_lists
CREATE TABLE IF NOT EXISTS `check_lists` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `checked` tinyint(1) NOT NULL DEFAULT 0,
  `user_lists_id` bigint(20) unsigned NOT NULL,
  `category_items_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `check_lists_user_lists_id_foreign` (`user_lists_id`),
  KEY `check_lists_category_items_id_foreign` (`category_items_id`),
  CONSTRAINT `check_lists_category_items_id_foreign` FOREIGN KEY (`category_items_id`) REFERENCES `category_items` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `check_lists_user_lists_id_foreign` FOREIGN KEY (`user_lists_id`) REFERENCES `user_lists` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela targetin_rest.check_lists: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `check_lists` DISABLE KEYS */;
INSERT INTO `check_lists` (`id`, `checked`, `user_lists_id`, `category_items_id`, `created_at`, `updated_at`) VALUES
	(4, 0, 1, 1, '2023-06-20 15:33:14', '2023-06-20 15:33:15'),
	(5, 0, 1, 2, '2023-06-20 15:33:25', '2023-06-20 15:33:26'),
	(6, 0, 1, 3, '2023-06-20 15:33:34', '2023-06-20 15:33:35'),
	(7, 0, 1, 4, '2023-06-20 15:33:58', '2023-06-20 15:33:59');
/*!40000 ALTER TABLE `check_lists` ENABLE KEYS */;

-- Copiando estrutura para tabela targetin_rest.check_list__item_details
CREATE TABLE IF NOT EXISTS `check_list__item_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `message` varchar(255) NOT NULL,
  `dt_start` datetime NOT NULL,
  `dt_end` datetime NOT NULL,
  `price` double(8,2) NOT NULL,
  `check_list_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `check_list__item_details_check_list_id_foreign` (`check_list_id`),
  CONSTRAINT `check_list__item_details_check_list_id_foreign` FOREIGN KEY (`check_list_id`) REFERENCES `check_lists` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela targetin_rest.check_list__item_details: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `check_list__item_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `check_list__item_details` ENABLE KEYS */;

-- Copiando estrutura para tabela targetin_rest.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela targetin_rest.failed_jobs: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Copiando estrutura para tabela targetin_rest.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela targetin_rest.migrations: ~10 rows (aproximadamente)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(5, '2023_06_09_153225_create_user_lists_table', 1),
	(6, '2023_06_10_081815_create_categories_table', 1),
	(7, '2023_06_12_013200_create_category_items_table', 1),
	(8, '2023_06_12_034823_userconfig', 1),
	(9, '2023_06_12_154243_create_check_lists_table', 1),
	(10, '2023_06_12_154612_create_check_list__item_details_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Copiando estrutura para tabela targetin_rest.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela targetin_rest.password_resets: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Copiando estrutura para tabela targetin_rest.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela targetin_rest.personal_access_tokens: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;

-- Copiando estrutura para tabela targetin_rest.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela targetin_rest.users: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Usuário teste', '1', '2023-06-20 15:26:19', '1', '1', '2023-06-20 15:26:23', '2023-06-20 15:26:24');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Copiando estrutura para tabela targetin_rest.user_configs
CREATE TABLE IF NOT EXISTS `user_configs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tema` int(11) NOT NULL,
  `mostraValor` int(11) NOT NULL,
  `users_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_configs_users_id_foreign` (`users_id`),
  CONSTRAINT `user_configs_users_id_foreign` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela targetin_rest.user_configs: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `user_configs` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_configs` ENABLE KEYS */;

-- Copiando estrutura para tabela targetin_rest.user_lists
CREATE TABLE IF NOT EXISTS `user_lists` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `users_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_lists_users_id_foreign` (`users_id`),
  CONSTRAINT `user_lists_users_id_foreign` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela targetin_rest.user_lists: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `user_lists` DISABLE KEYS */;
INSERT INTO `user_lists` (`id`, `name`, `icon`, `users_id`, `created_at`, `updated_at`) VALUES
	(1, 'Lista Teste', '1', 1, '2023-06-20 15:26:47', '2023-06-20 15:26:48');
/*!40000 ALTER TABLE `user_lists` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
