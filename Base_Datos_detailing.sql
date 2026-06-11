-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: fdb1032.awardspace.net
-- Tiempo de generación: 11-06-2026 a las 07:19:24
-- Versión del servidor: 8.0.32
-- Versión de PHP: 8.1.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `4765355_detailing`
--
CREATE DATABASE IF NOT EXISTS `4765355_detailing` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `4765355_detailing`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `id` int NOT NULL,
  `paquete` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `precio` int DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora_inicio` time DEFAULT NULL,
  `hora_fin` time DEFAULT NULL,
  `usuario_id` int DEFAULT NULL,
  `nombre_usuario` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `opcion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `estado` varchar(20) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Agendada'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `citas`
--

INSERT INTO `citas` (`id`, `paquete`, `precio`, `fecha`, `hora_inicio`, `hora_fin`, `usuario_id`, `nombre_usuario`, `opcion`, `estado`) VALUES
(13, 'Básico', 250, '2026-06-10', '10:00:00', '12:00:00', 13, 'Brian Humberto', 'Carro chico', 'Realizada'),
(14, 'Básico', 250, '2026-06-10', '11:00:00', '13:00:00', 22, 'RUSO', 'Carro chico', 'Cancelada'),
(15, 'Semi Detallado', 600, '2026-06-10', '13:00:00', '19:00:00', 22, 'RUSO', 'Carro chico', 'Realizada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paquete`
--

CREATE TABLE `paquete` (
  `id` int NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `precio` decimal(10,2) NOT NULL DEFAULT '0.00',
  `estado` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Activo',
  `duracion` int NOT NULL DEFAULT '60'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `paquete`
--

INSERT INTO `paquete` (`id`, `nombre`, `descripcion`, `precio`, `estado`, `duracion`) VALUES
(1, 'Básico', 'Lavado interior/exterior + cera', 0.00, 'Activo', 120),
(2, 'Semi Detallado', 'Interior/exterior, plásticos y cerámica', 0.00, 'Activo', 360),
(3, 'Detallado Completo', 'Interior/exterior, motor y cerámica completa', 0.00, 'Activo', 480),
(4, 'Tapicería', 'Salas, sillones y comedor', 0.00, 'Activo', 360),
(6, 'Pulido de Focos ', 'Tren de Lijado y Pulido con borla y pulimento 100_%', 0.00, 'Activo', 60),
(7, 'Brian', 'hhh', 0.00, 'Activo', 80);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paquetes`
--

CREATE TABLE `paquetes` (
  `id` int NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `precio` decimal(10,2) NOT NULL,
  `estado` enum('Activo','Inactivo') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'Activo',
  `fecha_actualizacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paquete_opciones`
--

CREATE TABLE `paquete_opciones` (
  `id` int NOT NULL,
  `paquete_id` int NOT NULL,
  `nombre_opcion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `precio` decimal(10,2) NOT NULL DEFAULT '0.00',
  `estado` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `paquete_opciones`
--

INSERT INTO `paquete_opciones` (`id`, `paquete_id`, `nombre_opcion`, `precio`, `estado`) VALUES
(46, 1, 'Carro chico', 250.00, 'Activo'),
(47, 1, 'Carro mediano', 300.00, 'Activo'),
(48, 1, 'Carro grande', 350.00, 'Activo'),
(49, 2, 'Carro chico', 600.00, 'Activo'),
(50, 2, 'Carro mediano', 750.00, 'Activo'),
(51, 2, 'Carro grande', 900.00, 'Activo'),
(52, 3, 'Carro chico', 1200.00, 'Activo'),
(53, 3, 'Carro mediano', 1500.00, 'Activo'),
(54, 3, 'Carro grande', 1800.00, 'Activo'),
(55, 4, 'Sillón sencillo', 300.00, 'Activo'),
(56, 4, 'Dos sillones', 500.00, 'Activo'),
(57, 4, 'Sala completa', 900.00, 'Activo'),
(58, 4, 'Colchón individual', 400.00, 'Activo'),
(59, 4, 'Colchón matrimonial', 600.00, 'Activo'),
(60, 4, 'Mesa comedor 2 a 6 sillas', 800.00, 'Activo'),
(61, 6, 'Par de focos', 280.00, 'Activo'),
(63, 1, 'Caarro color azul', 190.00, 'Activo'),
(64, 7, 'aasfdss', 1900.00, 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `correo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `rol` enum('admin','cliente') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'cliente',
  `creado_en` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `correo`, `password`, `rol`, `creado_en`, `estado`) VALUES
(12, 'admin', 'admin@detailed.com', '$2y$10$gIB4SM5nc1eI1KpsgVxy8uInFgpZ8OE7ZrmIzqM6i7Hw.ujiwI2Ma', 'admin', '2026-05-27 23:10:47', 'Activo'),
(13, 'Brian Humberto', 'perpulylaguna2003@gmail.com', '$2y$10$c4bPMU0j06MiMbe9I/PEiuAS54cJg2eCvExVnZFlAmZyPbGDdDt1u', 'cliente', '2026-05-27 23:17:15', 'Activo'),
(20, 'ISAIAS TERAN GOMEZ', 'isateran295@gmail.com', '$2y$12$P44XdrlkaIXDrKUD73fo6eY7AYZQl8tNyCodJtUZkR7F5Qly5.ufC', 'cliente', '2026-06-06 01:36:53', 'Activo'),
(21, 'ISAIAS TERAN GOMEZ', 'iteran@itscc.edu.mx', '$2y$12$U8pYVu0Wu9qI1EurAd828.SoxKWaxAGxMYD6ZgDyvbRxc3zsaK2EC', 'cliente', '2026-06-10 00:28:38', 'Activo'),
(22, 'RUSO', 'ruso@gmil.com', '$2y$12$JlnQD47/jCpKv8Oljjqcj.UBUTlXRr0/vWF/JPjlOYOU5QTJxE56G', 'cliente', '2026-06-10 01:18:23', 'Activo');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `paquete`
--
ALTER TABLE `paquete`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `paquetes`
--
ALTER TABLE `paquetes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `paquete_opciones`
--
ALTER TABLE `paquete_opciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `paquete`
--
ALTER TABLE `paquete`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `paquetes`
--
ALTER TABLE `paquetes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `paquete_opciones`
--
ALTER TABLE `paquete_opciones`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
