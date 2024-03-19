-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3306
-- Üretim Zamanı: 19 Mar 2024, 19:04:58
-- Sunucu sürümü: 8.0.31
-- PHP Sürümü: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `ip_database`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `branches`
--

DROP TABLE IF EXISTS `branches`;
CREATE TABLE IF NOT EXISTS `branches` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8mb4_general_ci NOT NULL,
  `adress` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `branches`
--

INSERT INTO `branches` (`id`, `title`, `adress`, `created_at`) VALUES
(1, 'Ankara Kızılay', 'dsafsdfasd adsfsdaf', '2024-03-19 19:02:52'),
(2, 'Ankara Keçiören', 'asdfadsfda ffdgsdfgdf', '2024-03-19 19:02:52');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `brands`
--

DROP TABLE IF EXISTS `brands`;
CREATE TABLE IF NOT EXISTS `brands` (
  `id` int NOT NULL AUTO_INCREMENT,
  `img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `rank` tinyint NOT NULL,
  `is_active` tinyint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tetikleyiciler `brands`
--
DROP TRIGGER IF EXISTS `brands_log_deleted`;
DELIMITER $$
CREATE TRIGGER `brands_log_deleted` BEFORE DELETE ON `brands` FOR EACH ROW INSERT INTO brands_log (log_type, old_id, old_img_url, old_title, old_rank, old_is_active, created_at) VALUES ("Deleted Brand:", OLD.id, OLD.img_url, OLD.title, OLD.rank, OLD.is_active, NOW())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `brands_log_updated`;
DELIMITER $$
CREATE TRIGGER `brands_log_updated` BEFORE UPDATE ON `brands` FOR EACH ROW INSERT INTO brands_log (log_type, old_id, old_img_url, old_title, old_rank, old_is_active, created_at) VALUES ("Updated Brand:", OLD.id, OLD.img_url, OLD.title, OLD.rank, OLD.is_active, NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `brands_log`
--

DROP TABLE IF EXISTS `brands_log`;
CREATE TABLE IF NOT EXISTS `brands_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `log_type` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `old_id` int NOT NULL,
  `old_img_url` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `old_title` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `old_rank` tinyint NOT NULL,
  `old_is_active` tinyint NOT NULL,
  `users_id` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `brands_log`
--

INSERT INTO `brands_log` (`id`, `log_type`, `old_id`, `old_img_url`, `old_title`, `old_rank`, `old_is_active`, `users_id`, `created_at`) VALUES
(1, 'Deleted Brand:', 1, 'assd', 'asdas', 1, 1, NULL, '2024-03-14 10:58:05');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `rank` tinyint NOT NULL,
  `is_active` tinyint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tetikleyiciler `products`
--
DROP TRIGGER IF EXISTS `products_log_delete`;
DELIMITER $$
CREATE TRIGGER `products_log_delete` BEFORE DELETE ON `products` FOR EACH ROW INSERT INTO products_log (log_type, old_id, old_img_url, old_title, old_description, old_rank, old_is_active, created_at) VALUES ("Products Deleted:", OLD.id, OLD.img_url, OLD.title, OLD.description, OLD.rank, OLD.is_active, NOW())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `products_log_update`;
DELIMITER $$
CREATE TRIGGER `products_log_update` BEFORE UPDATE ON `products` FOR EACH ROW INSERT INTO products_log (log_type, old_id, old_img_url, old_title, old_description, old_rank, old_is_active, created_at) VALUES ("Products Updateded:", OLD.id, OLD.img_url, OLD.title, OLD.description, OLD.rank, OLD.is_active, NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `products_categories`
--

DROP TABLE IF EXISTS `products_categories`;
CREATE TABLE IF NOT EXISTS `products_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `products_categories`
--

INSERT INTO `products_categories` (`id`, `title`, `is_active`, `created_at`) VALUES
(1, 'Kıyafet', 1, '2024-03-14 11:26:23'),
(2, 'Temizlik', 1, '2024-03-14 11:26:23');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `products_images_log`
--

DROP TABLE IF EXISTS `products_images_log`;
CREATE TABLE IF NOT EXISTS `products_images_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `log_type` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `old_id` int NOT NULL,
  `old_product_id` tinyint NOT NULL,
  `old_rank` tinyint NOT NULL,
  `old_is_cover` tinyint NOT NULL,
  `old_img_url` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `old_is_active` tinyint NOT NULL,
  `users_id` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `products_log`
--

DROP TABLE IF EXISTS `products_log`;
CREATE TABLE IF NOT EXISTS `products_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `log_type` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `old_id` int NOT NULL,
  `old_img_url` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `old_title` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `old_description` text COLLATE utf8mb4_general_ci NOT NULL,
  `old_rank` tinyint NOT NULL,
  `old_is_active` tinyint NOT NULL,
  `users_id` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `product_images`
--

DROP TABLE IF EXISTS `product_images`;
CREATE TABLE IF NOT EXISTS `product_images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `rank` tinyint NOT NULL,
  `is_cover` tinyint NOT NULL,
  `img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_active` tinyint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tetikleyiciler `product_images`
--
DROP TRIGGER IF EXISTS `products_images_log_delete`;
DELIMITER $$
CREATE TRIGGER `products_images_log_delete` BEFORE DELETE ON `product_images` FOR EACH ROW INSERT INTO products_images_log(log_type, old_id, old_product_id, old_rank, old_is_cover, old_img_url, old_is_active, created_at) VALUES ("Products İmages Deleted:",OLD.id, OLD.product_id, OLD.rank, OLD.is_cover, OLD.img_url, OLD.is_active,NOW())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `products_images_log_update`;
DELIMITER $$
CREATE TRIGGER `products_images_log_update` BEFORE UPDATE ON `product_images` FOR EACH ROW INSERT INTO products_images_log(log_type, old_id, old_product_id, old_rank, old_is_cover, old_img_url, old_is_active, created_at) VALUES ("Products İmages Updated:",OLD.id, OLD.product_id, OLD.rank, OLD.is_cover, OLD.img_url, OLD.is_active,NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `references`
--

DROP TABLE IF EXISTS `references`;
CREATE TABLE IF NOT EXISTS `references` (
  `id` int NOT NULL AUTO_INCREMENT,
  `img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `rank` tinyint NOT NULL,
  `is_active` tinyint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tetikleyiciler `references`
--
DROP TRIGGER IF EXISTS `references_log_delete`;
DELIMITER $$
CREATE TRIGGER `references_log_delete` BEFORE DELETE ON `references` FOR EACH ROW INSERT INTO references_log (log_type, old_id, old_img_url, old_title, old_description, old_rank, old_is_active, created_at) VALUES ("References Deleted:", OLD.id, OLD.img_url, OLD.title, OLD.description, OLD.rank, OLD.is_active, NOW())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `references_log_update`;
DELIMITER $$
CREATE TRIGGER `references_log_update` BEFORE UPDATE ON `references` FOR EACH ROW INSERT INTO references_log (log_type, old_id, old_img_url, old_title, old_description, old_rank, old_is_active, created_at) VALUES ("References Updated:", OLD.id, OLD.img_url, OLD.title, OLD.description, OLD.rank, OLD.is_active, NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `references_log`
--

DROP TABLE IF EXISTS `references_log`;
CREATE TABLE IF NOT EXISTS `references_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `log_type` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `old_id` int NOT NULL,
  `old_img_url` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `old_title` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `old_description` text COLLATE utf8mb4_general_ci NOT NULL,
  `old_rank` tinyint NOT NULL,
  `old_is_active` tinyint NOT NULL,
  `users_id` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `services`
--

DROP TABLE IF EXISTS `services`;
CREATE TABLE IF NOT EXISTS `services` (
  `id` int NOT NULL AUTO_INCREMENT,
  `img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `rank` tinyint NOT NULL,
  `is_active` tinyint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tetikleyiciler `services`
--
DROP TRIGGER IF EXISTS `services_log_delete`;
DELIMITER $$
CREATE TRIGGER `services_log_delete` BEFORE DELETE ON `services` FOR EACH ROW INSERT INTO services_log (log_type, old_id, old_img_url, old_title, old_url, old_description, old_rank, old_is_active, created_at) VALUES ("Services Deleted:", OLD.id, OLD.img_url, OLD.title, OLD.url, OLD.description, OLD.rank, OLD.is_active, NOW())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `services_log_update`;
DELIMITER $$
CREATE TRIGGER `services_log_update` BEFORE UPDATE ON `services` FOR EACH ROW INSERT INTO services_log (log_type, old_id, old_img_url, old_title, old_url, old_description, old_rank, old_is_active, created_at) VALUES ("Services Updated:", OLD.id, OLD.img_url, OLD.title, OLD.url, OLD.description, OLD.rank, OLD.is_active, NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `services_log`
--

DROP TABLE IF EXISTS `services_log`;
CREATE TABLE IF NOT EXISTS `services_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `log_type` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `old_id` int NOT NULL,
  `old_img_url` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `old_title` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `old_url` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `old_description` text COLLATE utf8mb4_general_ci NOT NULL,
  `old_rank` tinyint NOT NULL,
  `old_is_active` tinyint NOT NULL,
  `users_id` tinyint DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `about_us` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `slogan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mission` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `vision` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mobile_image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `favicon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phone1` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phone2` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `facebook` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `twitter` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `instagram` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `linkedin` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `gsm1` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `gsm2` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tetikleyiciler `settings`
--
DROP TRIGGER IF EXISTS `settins_log_delete`;
DELIMITER $$
CREATE TRIGGER `settins_log_delete` BEFORE DELETE ON `settings` FOR EACH ROW INSERT INTO settings_log (log_type, old_id, old_company_name, old_address, old_about_us, old_slogan, old_mission, old_vision, old_image_url, old_mobile_image_url, old_favicon, old_phone1, old_phone2, old_email, old_facebook, old_twitter, old_instagram, old_linkedin, old_gsm1, old_gsm2, created_at) 
VALUES ("Setting Delete", OLD.id, OLD.company_name, OLD.address, OLD.about_us, OLD.slogan, OLD.mission, OLD.vision, OLD.img_url, OLD.mobile_image_url, OLD.favicon, OLD.phone1, OLD.phone2, OLD.email, OLD.facebook, OLD.twitter, OLD.instagram, OLD.linkedin, OLD.gsm1, OLD.gsm2,NOW())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `settins_log_update`;
DELIMITER $$
CREATE TRIGGER `settins_log_update` BEFORE UPDATE ON `settings` FOR EACH ROW INSERT INTO settings_log (log_type, old_id, old_company_name, old_address, old_about_us, old_slogan, old_mission, old_vision, old_image_url, old_mobile_image_url, old_favicon, old_phone1, old_phone2, old_email, old_facebook, old_twitter, old_instagram, old_linkedin, old_gsm1, old_gsm2, created_at) 
VALUES ("Setting Update", OLD.id, OLD.company_name, OLD.address, OLD.about_us, OLD.slogan, OLD.mission, OLD.vision, OLD.img_url, OLD.mobile_image_url, OLD.favicon, OLD.phone1, OLD.phone2, OLD.email, OLD.facebook, OLD.twitter, OLD.instagram, OLD.linkedin, OLD.gsm1, OLD.gsm2,NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `settings_log`
--

DROP TABLE IF EXISTS `settings_log`;
CREATE TABLE IF NOT EXISTS `settings_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `log_type` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `old_id` int NOT NULL,
  `old_company_name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `old_address` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `old_about_us` text COLLATE utf8mb4_general_ci NOT NULL,
  `old_slogan` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `old_mission` text COLLATE utf8mb4_general_ci NOT NULL,
  `old_vision` text COLLATE utf8mb4_general_ci NOT NULL,
  `old_img_url` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `old_mobile_image_url` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `old_favicon` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `old_phone1` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `old_phone2` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `old_email` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `old_facebook` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `old_twitter` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `old_instagram` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `old_linkedin` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `old_gsm1` int NOT NULL,
  `old_gsm2` int NOT NULL,
  `users_id` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `testimonials`
--

DROP TABLE IF EXISTS `testimonials`;
CREATE TABLE IF NOT EXISTS `testimonials` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `full_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `company` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `rank` tinyint NOT NULL,
  `is_active` tinyint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tetikleyiciler `testimonials`
--
DROP TRIGGER IF EXISTS `testimonials_log_delete`;
DELIMITER $$
CREATE TRIGGER `testimonials_log_delete` BEFORE DELETE ON `testimonials` FOR EACH ROW INSERT INTO testimonials_log (log_type, old_id, old_title, old_description, old_full_name, old_company, old_img_url, old_rank, old_is_active, created_at) VALUES ("Testimonals Delete:", OLD.id, OLD.title, OLD.description, OLD.full_name, OLD.company, OLD.rank, OLD.is_active, NOW())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `testimonials_log_update`;
DELIMITER $$
CREATE TRIGGER `testimonials_log_update` BEFORE UPDATE ON `testimonials` FOR EACH ROW INSERT INTO testimonials_log (log_type, old_id, old_title, old_description, old_full_name, old_company, old_img_url, old_rank, old_is_active, created_at) VALUES ("Testimonals Update:", OLD.id, OLD.title, OLD.description, OLD.full_name, OLD.company, OLD.rank, OLD.is_active, NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `testimonials_log`
--

DROP TABLE IF EXISTS `testimonials_log`;
CREATE TABLE IF NOT EXISTS `testimonials_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `log_type` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `old_id` int NOT NULL,
  `old_title` int NOT NULL,
  `old_description` int NOT NULL,
  `old_full_name` int NOT NULL,
  `old_company` int NOT NULL,
  `old_img_url` int NOT NULL,
  `old_rank` int NOT NULL,
  `old_is_active` int NOT NULL,
  `users_id` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `surname` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_active` tinyint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tetikleyiciler `users`
--
DROP TRIGGER IF EXISTS `users_log_deleted`;
DELIMITER $$
CREATE TRIGGER `users_log_deleted` BEFORE DELETE ON `users` FOR EACH ROW INSERT INTO users_log (log_type, old_id, old_img_url, old_email, old_name, old_surname, old_password, created_at) VALUES ("Deleted User:", OLD.id, OLD.img_url, OLD.email, OLD.name, OLD.surname, OLD.password,NOW() )
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `users_log_updated`;
DELIMITER $$
CREATE TRIGGER `users_log_updated` BEFORE UPDATE ON `users` FOR EACH ROW INSERT INTO users_log (old_id, old_img_url, old_email, old_name, old_surname, old_password,created_at) VALUES ("Updated User:", OLD.id, OLD.img_url, OLD.email, OLD.name, OLD.surname, OLD.password, NOW() )
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users_log`
--

DROP TABLE IF EXISTS `users_log`;
CREATE TABLE IF NOT EXISTS `users_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `log_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `old_id` int NOT NULL,
  `old_img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `old_email` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `old_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `old_surname` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `old_password` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `users_id` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

--
-- Tablo döküm verisi `users_log`
--

INSERT INTO `users_log` (`id`, `log_type`, `old_id`, `old_img_url`, `old_email`, `old_name`, `old_surname`, `old_password`, `users_id`, `created_at`) VALUES
(1, 'Updated User:', 1, 'aaa', 'aaaa', 'aaaaa', 'aaaaa', 'aaaa', NULL, '2024-03-10 14:32:55'),
(2, 'Deleted User:', 2, 'aaaaaa', 'aaaaaa', 'aaaaa', 'aaaa', 'aaaaa', NULL, '2024-03-12 11:16:09');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
