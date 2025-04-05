-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Már 18. 15:19
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `database`
--
CREATE DATABASE IF NOT EXISTS `database` DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
USE `database`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `carts`
--

CREATE TABLE IF NOT EXISTS `carts` (
  `username` varchar(20) NOT NULL,
  `game_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  KEY `username` (`username`),
  KEY `game_id` (`game_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `carts`
--

INSERT INTO `carts` (`username`, `game_id`, `quantity`) VALUES
('rekaflora', 1, 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `companies`
--

CREATE TABLE IF NOT EXISTS `companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `companies`
--

INSERT INTO `companies` (`id`, `name`) VALUES
(1, 'FatalCage'),
(2, 'CloudCage');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `games`
--

CREATE TABLE IF NOT EXISTS `games` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_img` varchar(256) NOT NULL DEFAULT '',
  `preview_img` varchar(256) NOT NULL DEFAULT '',
  `icon_img` varchar(256) NOT NULL DEFAULT '',
  `title` varchar(64) NOT NULL DEFAULT 'Untitled game',
  `description` varchar(1024) NOT NULL DEFAULT '',
  `price` float NOT NULL DEFAULT 0,
  `min_spec` int(11) DEFAULT NULL,
  `rec_spec` int(11) DEFAULT NULL,
  `publisher` int(11) DEFAULT NULL,
  `developer` int(11) DEFAULT NULL,
  `steamid` bigint(20) DEFAULT NULL,
  `release_date` datetime DEFAULT NULL,
  `downloads` int(11) NOT NULL DEFAULT 0,
  `wishlists` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `developer_fk` (`developer`),
  KEY `min_spec_fk` (`min_spec`),
  KEY `publisher_fk` (`publisher`),
  KEY `rec_spec_fk` (`rec_spec`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `games`
--

INSERT INTO `games` (`id`, `banner_img`, `preview_img`, `icon_img`, `title`, `description`, `price`, `min_spec`, `rec_spec`, `publisher`, `developer`, `steamid`, `release_date`, `downloads`, `wishlists`) VALUES
(1, '', '', '', 'Memetric: Final Lifeforms', 'The Original Memetric game', 20, 1, 1, 2, 1, NULL, NULL, 0, 0),
(2, '', '', '', 'Memetric: Classic', 'The Classic Memetric game', 20, 1, 1, 2, 2, NULL, NULL, 0, 0),
(3, '', '', '', 'The Last Experiment', 'The Newest Memetric game', 30, 1, 1, 2, 2, NULL, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `libraries`
--

CREATE TABLE IF NOT EXISTS `libraries` (
  `username` varchar(32) NOT NULL,
  `game_id` int(11) NOT NULL,
  `playtime` int(11) NOT NULL DEFAULT 0,
  `is_favourite` tinyint(1) NOT NULL DEFAULT 0,
  UNIQUE KEY `username` (`username`,`game_id`),
  KEY `lib_game_id_fk` (`game_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `libraries`
--

INSERT INTO `libraries` (`username`, `game_id`, `playtime`, `is_favourite`) VALUES
('Bence', 3, 632, 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `reviews`
--

CREATE TABLE IF NOT EXISTS `reviews` (
  `username` varchar(32) NOT NULL,
  `game_id` int(11) NOT NULL,
  `is_positive` tinyint(1) NOT NULL,
  `content` varchar(512) NOT NULL,
  UNIQUE KEY `username` (`username`,`game_id`),
  KEY `rev_game_id_fk` (`game_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `specifications`
--

CREATE TABLE IF NOT EXISTS `specifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `system` varchar(32) NOT NULL DEFAULT 'Not specified',
  `cpu` varchar(64) NOT NULL DEFAULT 'Not specified',
  `gpu` varchar(64) NOT NULL DEFAULT 'Not specified',
  `ram` varchar(64) NOT NULL DEFAULT 'Not specified',
  `storage` varchar(64) NOT NULL DEFAULT 'Not specified',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `specifications`
--

INSERT INTO `specifications` (`id`, `system`, `cpu`, `gpu`, `ram`, `storage`) VALUES
(1, 'Not specified', 'Not specified', 'Not specified', 'Not specified', 'Not specified');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `username` varchar(32) NOT NULL,
  `email` varchar(64) NOT NULL,
  `passwd` char(64) NOT NULL,
  `image` varchar(256) NOT NULL DEFAULT '',
  `description` varchar(1024) NOT NULL DEFAULT '',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`username`, `email`, `passwd`, `image`, `description`) VALUES
('Bence', 'albertbence.official@gmail.com', '$2y$10$iIdw7EUmQ3f3mIxq2zEVWeZgN2qIl5NEzpK5fL44y0WS15fCSnv3i', '', 'Admin account'),
('rekaflora', 'rekaflorabi@gmail.com', '$2y$10$u5.m/ZNWT1Hnm2TtwE2ODOs1gDzZul/A74lut1p5m/i9Fs5YF3w9a', '', '');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `wishlists`
--

CREATE TABLE IF NOT EXISTS `wishlists` (
  `username` varchar(32) NOT NULL,
  `game_id` int(11) NOT NULL,
  UNIQUE KEY `username` (`username`,`game_id`),
  KEY `wish_game_id_fk` (`game_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `wishlists`
--

INSERT INTO `wishlists` (`username`, `game_id`) VALUES
('Bence', 1),
('Bence', 2);

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `carts_ibfk_2` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `games`
--
ALTER TABLE `games`
  ADD CONSTRAINT `developer_fk` FOREIGN KEY (`developer`) REFERENCES `companies` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `min_spec_fk` FOREIGN KEY (`min_spec`) REFERENCES `specifications` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `publisher_fk` FOREIGN KEY (`publisher`) REFERENCES `companies` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `rec_spec_fk` FOREIGN KEY (`rec_spec`) REFERENCES `specifications` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Megkötések a táblához `libraries`
--
ALTER TABLE `libraries`
  ADD CONSTRAINT `lib_game_id_fk` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `lib_username_fk` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `rev_game_id_fk` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rev_username_fk` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wish_game_id_fk` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `wish_username_fk` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
