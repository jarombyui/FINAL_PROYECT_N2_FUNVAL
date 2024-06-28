-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-06-2024 a las 00:11:07
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `blogging_platform`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Tecnología', '2024-06-25 02:46:46', '2024-06-25 02:46:46'),
(2, 'Ciencia', '2024-06-25 02:46:46', '2024-06-25 02:46:46'),
(3, 'Salud', '2024-06-25 02:46:46', '2024-06-25 02:46:46'),
(4, 'Educación', '2024-06-25 02:46:46', '2024-06-25 02:46:46'),
(5, 'Deportes', '2024-06-25 02:46:46', '2024-06-25 02:46:46'),
(6, 'Entretenimiento', '2024-06-25 02:46:46', '2024-06-25 02:46:46'),
(7, 'Política', '2024-06-25 02:46:46', '2024-06-25 02:46:46'),
(8, 'Negocios', '2024-06-25 02:46:46', '2024-06-25 02:46:46'),
(9, 'Viajes', '2024-06-25 02:46:46', '2024-06-25 02:46:46'),
(10, 'Gastronomía', '2024-06-25 02:46:46', '2024-06-25 02:46:46'),
(11, 'Arte', '2024-06-25 02:46:46', '2024-06-25 02:46:46'),
(12, 'Literatura', '2024-06-25 02:46:46', '2024-06-25 02:46:46'),
(13, 'Música', '2024-06-25 02:46:46', '2024-06-25 02:46:46'),
(14, 'Cine', '2024-06-25 02:46:46', '2024-06-25 02:46:46'),
(15, 'Videojuegos', '2024-06-25 02:46:46', '2024-06-25 02:46:46'),
(16, 'Moda', '2024-06-25 02:46:46', '2024-06-25 02:46:46'),
(17, 'Fotografía', '2024-06-25 02:46:46', '2024-06-25 02:46:46'),
(18, 'Historia', '2024-06-25 02:46:46', '2024-06-25 02:46:46'),
(19, 'Medio Ambiente', '2024-06-25 02:46:46', '2024-06-25 02:46:46'),
(20, 'Psicología', '2024-06-25 02:46:46', '2024-06-25 02:46:46'),
(21, 'Religión', '2024-06-25 02:46:46', '2024-06-25 02:46:46'),
(22, 'Filosofía', '2024-06-25 02:46:46', '2024-06-25 02:46:46'),
(23, 'Cultura Pop', '2024-06-25 02:46:46', '2024-06-25 02:46:46'),
(24, 'Finanzas', '2024-06-25 02:46:46', '2024-06-25 02:46:46'),
(25, 'Derecho', '2024-06-25 02:46:46', '2024-06-25 02:46:46'),
(26, 'Ingeniería', '2024-06-25 02:46:46', '2024-06-25 02:46:46'),
(27, 'Matemáticas', '2024-06-25 02:46:46', '2024-06-25 02:46:46'),
(28, 'Astronomía', '2024-06-25 02:46:46', '2024-06-25 02:46:46'),
(29, 'Arquitectura', '2024-06-25 02:46:46', '2024-06-25 02:46:46'),
(30, 'Diseño', '2024-06-25 02:46:46', '2024-06-25 02:46:46'),
(31, 'Marketing', '2024-06-25 02:46:46', '2024-06-25 02:46:46'),
(32, 'Publicidades', '2024-06-25 02:46:46', '2024-06-25 02:46:46'),
(33, 'Turismo', '2024-06-25 02:46:46', '2024-06-25 02:46:46'),
(34, 'Bienestar', '2024-06-25 02:46:46', '2024-06-25 02:46:46'),
(35, 'Familia', '2024-06-25 02:46:46', '2024-06-25 02:46:46'),
(36, 'Locura', '2024-06-28 21:00:39', '2024-06-28 21:00:39'),
(37, 'petrologia', '2024-06-28 21:03:02', '2024-06-28 21:10:23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `user_id`, `content`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'Comentario 1 en la publicación 1', '2024-06-25 02:49:51', '2024-06-25 02:49:51'),
(2, 2, 3, 'Comentario 2 en la publicación 2', '2024-06-25 02:49:51', '2024-06-25 02:49:51'),
(3, 3, 4, 'Comentario 3 en la publicación 3', '2024-06-25 02:49:51', '2024-06-25 02:49:51'),
(4, 4, 5, 'Comentario 4 en la publicación 4', '2024-06-25 02:49:51', '2024-06-25 02:49:51'),
(5, 5, 6, 'Comentario 5 en la publicación 5', '2024-06-25 02:49:51', '2024-06-25 02:49:51'),
(6, 6, 7, 'Comentario 6 en la publicación 6', '2024-06-25 02:49:51', '2024-06-25 02:49:51'),
(7, 7, 8, 'Comentario 7 en la publicación 7', '2024-06-25 02:49:51', '2024-06-25 02:49:51'),
(8, 8, 9, 'Comentario 8 en la publicación 8', '2024-06-25 02:49:51', '2024-06-25 02:49:51'),
(9, 9, 10, 'Comentario 9 en la publicación 9', '2024-06-25 02:49:51', '2024-06-25 02:49:51'),
(10, 10, 11, 'Comentario 10 en la publicación 10', '2024-06-25 02:49:51', '2024-06-25 02:49:51'),
(11, 11, 12, 'Comentario 11 en la publicación 11', '2024-06-25 02:49:51', '2024-06-25 02:49:51'),
(12, 12, 13, 'Comentario 12 en la publicación 12', '2024-06-25 02:49:51', '2024-06-25 02:49:51'),
(13, 13, 14, 'Comentario 13 en la publicación 13', '2024-06-25 02:49:51', '2024-06-25 02:49:51'),
(14, 14, 15, 'Comentario 14 en la publicación 14', '2024-06-25 02:49:51', '2024-06-25 02:49:51'),
(15, 15, 16, 'Comentario 15 en la publicación 15', '2024-06-25 02:49:51', '2024-06-25 02:49:51'),
(16, 16, 17, 'Comentario 16 en la publicación 16', '2024-06-25 02:49:51', '2024-06-25 02:49:51'),
(17, 17, 18, 'Comentario 17 en la publicación 17', '2024-06-25 02:49:51', '2024-06-25 02:49:51'),
(18, 18, 19, 'Comentario 18 en la publicación 18', '2024-06-25 02:49:51', '2024-06-25 02:49:51'),
(19, 19, 20, 'Comentario 19 en la publicación 19', '2024-06-25 02:49:51', '2024-06-25 02:49:51'),
(20, 20, 21, 'Comentario 20 en la publicación 20', '2024-06-25 02:49:51', '2024-06-25 02:49:51'),
(21, 21, 22, 'Comentario 21 en la publicación 21', '2024-06-25 02:49:51', '2024-06-25 02:49:51'),
(22, 22, 23, 'Comentario 22 en la publicación 22', '2024-06-25 02:49:51', '2024-06-25 02:49:51'),
(23, 23, 24, 'Comentario 23 en la publicación 23', '2024-06-25 02:49:51', '2024-06-25 02:49:51'),
(24, 24, 25, 'Comentario 24 en la publicación 24', '2024-06-25 02:49:51', '2024-06-25 02:49:51'),
(25, 25, 26, 'Comentario 25 en la publicación 25', '2024-06-25 02:49:51', '2024-06-25 02:49:51'),
(26, 26, 27, 'Comentario 26 en la publicación 26', '2024-06-25 02:49:51', '2024-06-25 02:49:51'),
(27, 27, 28, 'Comentario 27 en la publicación 27', '2024-06-25 02:49:51', '2024-06-25 02:49:51'),
(28, 28, 29, 'Comentario 28 en la publicación 28', '2024-06-25 02:49:51', '2024-06-25 02:49:51'),
(29, 29, 30, 'Comentario 29 en la publicación 29', '2024-06-25 02:49:51', '2024-06-25 02:49:51'),
(31, 31, 32, 'Comentario 31 en la publicación 31', '2024-06-25 02:49:51', '2024-06-25 02:49:51'),
(34, 34, 35, 'Comentario 34 en la publicación 34', '2024-06-25 02:49:51', '2024-06-25 02:49:51'),
(35, 35, 1, 'Comentario 35 en la publicación 35', '2024-06-25 02:49:51', '2024-06-25 02:49:51'),
(36, 1, 2, 'Este es el nuevo contenido del comentario.', '2024-06-28 18:33:12', '2024-06-28 18:50:46'),
(37, 1, 3, 'Este es un comentario de ejemplo.', '2024-06-28 18:34:15', '2024-06-28 18:34:15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `title`, `content`, `created_at`, `updated_at`) VALUES
(1, 1, 'Publicación 1', 'Contenido de la publicación 1', '2024-06-25 02:47:03', '2024-06-25 02:47:03'),
(2, 2, 'Publicación 2', 'Contenido de la publicación 2', '2024-06-25 02:47:03', '2024-06-25 02:47:03'),
(3, 3, 'Publicación 3', 'Contenido de la publicación 3', '2024-06-25 02:47:03', '2024-06-25 02:47:03'),
(4, 4, 'Publicación 4', 'Contenido de la publicación 4', '2024-06-25 02:47:03', '2024-06-25 02:47:03'),
(5, 5, 'Publicación 5', 'Contenido de la publicación 5', '2024-06-25 02:47:03', '2024-06-25 02:47:03'),
(6, 6, 'Publicación 6', 'Contenido de la publicación 6', '2024-06-25 02:47:03', '2024-06-25 02:47:03'),
(7, 7, 'Publicación 7', 'Contenido de la publicación 7', '2024-06-25 02:47:03', '2024-06-25 02:47:03'),
(8, 8, 'Publicación 8', 'Contenido de la publicación 8', '2024-06-25 02:47:03', '2024-06-25 02:47:03'),
(9, 9, 'Publicación 9', 'Contenido de la publicación 9', '2024-06-25 02:47:03', '2024-06-25 02:47:03'),
(10, 10, 'Publicación 10', 'Contenido de la publicación 10', '2024-06-25 02:47:03', '2024-06-25 02:47:03'),
(11, 11, 'Publicación 11', 'Contenido de la publicación 11', '2024-06-25 02:47:03', '2024-06-25 02:47:03'),
(12, 12, 'Publicación 12', 'Contenido de la publicación 12', '2024-06-25 02:47:03', '2024-06-25 02:47:03'),
(13, 13, 'Publicación 13', 'Contenido de la publicación 13', '2024-06-25 02:47:03', '2024-06-25 02:47:03'),
(14, 14, 'Publicación 14', 'Contenido de la publicación 14', '2024-06-25 02:47:03', '2024-06-25 02:47:03'),
(15, 15, 'Publicación 15', 'Contenido de la publicación 15', '2024-06-25 02:47:03', '2024-06-25 02:47:03'),
(16, 16, 'Publicación 16', 'Contenido de la publicación 16', '2024-06-25 02:47:03', '2024-06-25 02:47:03'),
(17, 17, 'Publicación 17', 'Contenido de la publicación 17', '2024-06-25 02:47:03', '2024-06-25 02:47:03'),
(18, 18, 'Publicación 18', 'Contenido de la publicación 18', '2024-06-25 02:47:03', '2024-06-25 02:47:03'),
(19, 19, 'Publicación 19', 'Contenido de la publicación 19', '2024-06-25 02:47:03', '2024-06-25 02:47:03'),
(20, 20, 'Publicación 20', 'Contenido de la publicación 20', '2024-06-25 02:47:03', '2024-06-25 02:47:03'),
(21, 21, 'Publicación 21', 'Contenido de la publicación 21', '2024-06-25 02:47:03', '2024-06-25 02:47:03'),
(22, 22, 'Publicación 22', 'Contenido de la publicación 22', '2024-06-25 02:47:03', '2024-06-25 02:47:03'),
(23, 23, 'Publicación 23', 'Contenido de la publicación 23', '2024-06-25 02:47:03', '2024-06-25 02:47:03'),
(24, 24, 'Publicación 24', 'Contenido de la publicación 24', '2024-06-25 02:47:03', '2024-06-25 02:47:03'),
(25, 25, 'Publicación 25', 'Contenido de la publicación 25', '2024-06-25 02:47:03', '2024-06-25 02:47:03'),
(26, 26, 'Publicación 26', 'Contenido de la publicación 26', '2024-06-25 02:47:03', '2024-06-25 02:47:03'),
(27, 27, 'Publicación 27', 'Contenido de la publicación 27', '2024-06-25 02:47:03', '2024-06-25 02:47:03'),
(28, 28, 'Publicación 28', 'Contenido de la publicación 28', '2024-06-25 02:47:03', '2024-06-25 02:47:03'),
(29, 29, 'Publicación 29', 'Contenido de la publicación 29', '2024-06-25 02:47:03', '2024-06-25 02:47:03'),
(30, 30, 'Publicación 30', 'Contenido de la publicación 30', '2024-06-25 02:47:03', '2024-06-25 02:47:03'),
(31, 31, 'Publicación 31', 'Contenido de la publicación 31', '2024-06-25 02:47:03', '2024-06-25 02:47:03'),
(32, 32, 'Publicación 32', 'Contenido de la publicación 32', '2024-06-25 02:47:03', '2024-06-25 02:47:03'),
(34, 34, 'Publicación 34', 'Contenido de la publicación 34', '2024-06-25 02:47:03', '2024-06-25 02:47:03'),
(35, 35, 'Publicación 35', 'Contenido de la publicación 35', '2024-06-25 02:47:03', '2024-06-25 02:47:03'),
(36, 36, 'Publicación 366', 'Nuevo contenido de la publicación 366', '2024-06-28 15:54:31', '2024-06-28 17:17:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `post_categories`
--

CREATE TABLE `post_categories` (
  `post_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `post_categories`
--

INSERT INTO `post_categories` (`post_id`, `category_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20),
(21, 21),
(22, 22),
(23, 23),
(24, 24),
(25, 25),
(26, 26),
(27, 27),
(28, 28),
(29, 29),
(30, 30),
(31, 31),
(32, 32),
(34, 34),
(35, 35);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('user','admin') DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role`, `created_at`, `updated_at`) VALUES
(1, 'usuario1', 'usuario1@example.com', 'password1', 'user', '2024-06-25 02:46:02', '2024-06-25 02:46:02'),
(2, 'usuario2', 'usuario2@example.com', 'password2', 'user', '2024-06-25 02:46:02', '2024-06-25 02:46:02'),
(3, 'usuario3', 'usuario3@example.com', 'password3', 'user', '2024-06-25 02:46:02', '2024-06-25 02:46:02'),
(4, 'usuario4', 'usuario4@example.com', 'password4', 'user', '2024-06-25 02:46:02', '2024-06-25 02:46:02'),
(5, 'usuario5', 'usuario5@example.com', 'password5', 'user', '2024-06-25 02:46:02', '2024-06-25 02:46:02'),
(6, 'usuario6', 'usuario6@example.com', 'password6', 'user', '2024-06-25 02:46:02', '2024-06-25 02:46:02'),
(7, 'usuario7', 'usuario7@example.com', 'password7', 'user', '2024-06-25 02:46:02', '2024-06-25 02:46:02'),
(8, 'usuario8', 'usuario8@example.com', 'password8', 'user', '2024-06-25 02:46:02', '2024-06-25 02:46:02'),
(9, 'usuario9', 'usuario9@example.com', 'password9', 'user', '2024-06-25 02:46:02', '2024-06-25 02:46:02'),
(10, 'usuario10', 'usuario10@example.com', 'password10', 'user', '2024-06-25 02:46:02', '2024-06-25 02:46:02'),
(11, 'usuario11', 'usuario11@example.com', 'password11', 'user', '2024-06-25 02:46:02', '2024-06-25 02:46:02'),
(12, 'usuario12', 'usuario12@example.com', 'password12', 'user', '2024-06-25 02:46:02', '2024-06-25 02:46:02'),
(13, 'usuario13', 'usuario13@example.com', 'password13', 'user', '2024-06-25 02:46:02', '2024-06-25 02:46:02'),
(14, 'usuario14', 'usuario14@example.com', 'password14', 'user', '2024-06-25 02:46:02', '2024-06-25 02:46:02'),
(15, 'usuario15', 'usuario15@example.com', 'password15', 'user', '2024-06-25 02:46:02', '2024-06-25 02:46:02'),
(16, 'usuario16', 'usuario16@example.com', 'password16', 'user', '2024-06-25 02:46:02', '2024-06-25 02:46:02'),
(17, 'usuario17', 'usuario17@example.com', 'password17', 'user', '2024-06-25 02:46:02', '2024-06-25 02:46:02'),
(18, 'usuario18', 'usuario18@example.com', 'password18', 'user', '2024-06-25 02:46:02', '2024-06-25 02:46:02'),
(19, 'usuario19', 'usuario19@example.com', 'password19', 'user', '2024-06-25 02:46:02', '2024-06-25 02:46:02'),
(20, 'usuario20', 'usuario20@example.com', 'password20', 'user', '2024-06-25 02:46:02', '2024-06-25 02:46:02'),
(21, 'usuario21', 'usuario21@example.com', 'password21', 'user', '2024-06-25 02:46:02', '2024-06-25 02:46:02'),
(22, 'usuario22', 'usuario22@example.com', 'password22', 'user', '2024-06-25 02:46:02', '2024-06-25 02:46:02'),
(23, 'usuario23', 'usuario23@example.com', 'password23', 'user', '2024-06-25 02:46:02', '2024-06-25 02:46:02'),
(24, 'usuario24', 'usuario24@example.com', 'password24', 'user', '2024-06-25 02:46:02', '2024-06-25 02:46:02'),
(25, 'usuario25', 'usuario25@example.com', 'password25', 'user', '2024-06-25 02:46:02', '2024-06-25 02:46:02'),
(26, 'usuario26', 'usuario26@example.com', 'password26', 'user', '2024-06-25 02:46:02', '2024-06-25 02:46:02'),
(27, 'usuario27', 'usuario27@example.com', 'password27', 'user', '2024-06-25 02:46:02', '2024-06-25 02:46:02'),
(28, 'usuario28', 'usuario28@example.com', 'password28', 'user', '2024-06-25 02:46:02', '2024-06-25 02:46:02'),
(29, 'usuario29', 'usuario29@example.com', 'password29', 'user', '2024-06-25 02:46:02', '2024-06-25 02:46:02'),
(30, 'usuario30', 'usuario30@example.com', 'password30', 'user', '2024-06-25 02:46:02', '2024-06-25 02:46:02'),
(31, 'usuario31', 'usuario31@example.com', 'password31', 'user', '2024-06-25 02:46:02', '2024-06-25 02:46:02'),
(32, 'usuario32', 'usuario32@example.com', 'password32', 'user', '2024-06-25 02:46:02', '2024-06-25 02:46:02'),
(34, 'usuario34', 'usuario34@example.com', 'password3444', 'user', '2024-06-28 03:48:34', '2024-06-28 05:43:43'),
(35, 'usuario35', 'usuario35@example.com', 'password35', 'admin', '2024-06-25 02:46:02', '2024-06-25 02:46:02'),
(36, 'Jarom', 'Jarom@gmail.com', '1111', 'admin', '2024-06-27 19:15:03', '2024-06-27 19:15:03'),
(37, 'usuario37', 'usuario37@example.com', 'password37', 'user', '2024-06-28 16:08:52', '2024-06-28 16:08:52'),
(39, 'usuario38', 'usuario38@example.com', 'password38', 'user', '2024-06-28 17:27:27', '2024-06-28 17:27:27');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`post_id`,`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de la tabla `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `post_categories`
--
ALTER TABLE `post_categories`
  ADD CONSTRAINT `post_categories_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `post_categories_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
