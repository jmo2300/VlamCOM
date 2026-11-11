-- 01_setup_user_db.sql
-- Uit te voeren door MySQL root / admin gebruiker

-- Database opruimen indien aanwezig en opnieuw aanmaken
DROP DATABASE IF EXISTS vlamcomdb;
CREATE DATABASE vlamcomdb
DEFAULT CHARACTER SET utf8mb4
DEFAULT COLLATE utf8mb4_unicode_ci;

-- Gebruiker opruimen indien aanwezig en opnieuw aanmaken
DROP USER IF EXISTS 'vlamcom'@'localhost';
CREATE USER 'vlamcom'@'localhost' IDENTIFIED BY 'vlamcompw';

-- Rechten verlenen aan vlamcom op de vlamcomdb database
GRANT ALL PRIVILEGES ON vlamcomdb.* TO 'vlamcom'@'localhost';
FLUSH PRIVILEGES;
