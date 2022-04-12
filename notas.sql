DROP DATABASE IF EXISTS `notes_db`;

CREATE DATABASE `notes_db`;

USE `notes_db`;

DROP TABLE IF EXISTS `users`;

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
    `id` INT(10) UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `email` VARCHAR(100) NOT NULL
);

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;

INSERT INTO users VALUES (1,'Julian','Julian@gmail.com'), (2,'Emiliano','Emiliano@gmail.com'), (3,'Bautista','Bautista@gmail.com'), (4,'Benjamin','Benjamin@gmail.com'), (5,'Lorenzo','Lorenzo@gmail.com'), (6,'Juan','Juan@gmail.com'), (7,'Franco','Franco@gmail.com'), (8,'Tomas','Tomas@gmail.com'), (9,'Veronica','Veronica@gmail.com'), (10,'Fabian','Fabian@gmail.com');

UNLOCK TABLES;

DROP TABLE IF EXISTS `categories`;

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
    `id` INT(10) UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL
);

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;

INSERT INTO categories VALUES (1,'Cine'), (2,'Musica'), (3,'Arte'), (4,'Deporte'), (5,'Teatro'), (6,'Educacion'), (7,'Finanzas'), (8,'Alimentacion'), (9,'Apuestas'), (10,'Decoracion');

UNLOCK TABLES;

DROP TABLE IF EXISTS `notes`;

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
    `id` INT(10) UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `user_id` INT(10) UNSIGNED NOT NULL,
    `title` VARCHAR(100) NOT NULL,
    `created_at` TIMESTAMP NULL DEFAULT NULL,
    `updated_at` TIMESTAMP NULL DEFAULT NULL,
    `description` TEXT NOT NULL,
    `deleted` TINYINT,
    `category_id` INT(10) UNSIGNED NOT NULL,
    KEY `notes_user_id_foreign` (`user_id`),
    KEY `notes_category_id` (`category_id`),
    CONSTRAINT `notes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
    CONSTRAINT `notes_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
);

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;

INSERT INTO notes VALUES (1,1,'titulo','11-11-11','10-10-10','descripcion',0,2), (2,2,'titulo 2','21-10-01','10-01-01','descripcion 2',0,4), (3,3,'titulo 3','11-11-11','10-10-10','descripcion 3',1,5), (4,4,'titulo 4','11-11-11','10-10-10','descripcion 4',0,1), (5,5,'titulo 5','11-11-11','10-10-10','descripcion 5',1,5), (6,6,'titulo 6','11-11-11','10-10-10','descripcion 6',0,6), (7,7,'titulo 7','11-11-11','10-10-10','descripcion 7',0,7), (8,8,'titulo 8','11-11-11','10-10-10','descripcion 8',0,8), (9,9,'titulo 9','11-11-11','10-10-10','descripcion 9',0,9), (10,10,'titulo 10','11-11-11','10-10-10','descripcion 10',0,10);

UNLOCK TABLES;
