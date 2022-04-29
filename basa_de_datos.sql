-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 29-04-2022 a las 20:00:57
-- Versión del servidor: 8.0.17
-- Versión de PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `basa_de_datos`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `contarProductosPorEstado` (IN `nombre_estado` VARCHAR(25), OUT `numero` INT)  BEGIN
    SELECT count (id) 
    INTO numero
    FROM productos
    WHERE estado = nombre_estado;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerProductosPorEstado` (IN `nombre_estado` VARCHAR(255))  BEGIN
    SELECT * 
    FROM productos
    WHERE estado = nombre_estado;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `venderProducto` (INOUT `beneficio` INT(255), IN `id_producto` INT)  BEGIN
    SELECT @incremento_precio = precio 
    FROM productos
    WHERE id = id_producto;
    SET beneficio = beneficio + @incremento_precio;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `estado` varchar(20) NOT NULL DEFAULT 'disponible',
  `precio` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `estado`, `precio`) VALUES
(1, 'Producto A', 'disponible', 8),
(2, 'Producto B', 'disponible', 1.5),
(3, 'Producto C', 'agotado', 80);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
