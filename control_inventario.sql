-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-07-2024 a las 19:51:20
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `control_inventario`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingreso`
--

CREATE TABLE `ingreso` (
  `ingresoid` int(11) NOT NULL,
  `productoid` int(11) DEFAULT NULL,
  `marcaid` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `categoriaid` int(11) DEFAULT NULL,
  `proveedorid` int(11) DEFAULT NULL,
  `usuarioid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `productoid` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `marcaid` int(11) DEFAULT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `categoriaid` int(11) DEFAULT NULL,
  `proveedorid` int(11) DEFAULT NULL,
  `usuarioid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `proveedorid` int(11) NOT NULL,
  `empresa` varchar(50) DEFAULT NULL,
  `ubicacion` varchar(50) DEFAULT NULL,
  `telefono` varchar(9) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `ruc` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salida`
--

CREATE TABLE `salida` (
  `salidaid` int(11) NOT NULL,
  `productoid` int(11) DEFAULT NULL,
  `marcaid` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `categoriaid` int(11) DEFAULT NULL,
  `proveedorid` int(11) DEFAULT NULL,
  `usuarioid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `usuarioid` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `dni` varchar(8) DEFAULT NULL,
  `telefono` varchar(9) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `rolid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ingreso`
--
ALTER TABLE `ingreso`
  ADD PRIMARY KEY (`ingresoid`),
  ADD KEY `productoid` (`productoid`),
  ADD KEY `proveedorid` (`proveedorid`),
  ADD KEY `usuarioid` (`usuarioid`),
  ADD KEY `categoriaid` (`categoriaid`),
  ADD KEY `marcaid` (`marcaid`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`productoid`),
  ADD KEY `proveedorid` (`proveedorid`),
  ADD KEY `categoriaid` (`categoriaid`),
  ADD KEY `usuarioid` (`usuarioid`),
  ADD KEY `marcaid` (`marcaid`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`proveedorid`),
  ADD UNIQUE KEY `empresa` (`empresa`),
  ADD UNIQUE KEY `telefono` (`telefono`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `ruc` (`ruc`);

--
-- Indices de la tabla `salida`
--
ALTER TABLE `salida`
  ADD PRIMARY KEY (`salidaid`),
  ADD KEY `productoid` (`productoid`),
  ADD KEY `marcaid` (`marcaid`),
  ADD KEY `categoriaid` (`categoriaid`),
  ADD KEY `proveedorid` (`proveedorid`),
  ADD KEY `usuarioid` (`usuarioid`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usuarioid`),
  ADD UNIQUE KEY `nombre` (`nombre`),
  ADD UNIQUE KEY `dni` (`dni`),
  ADD UNIQUE KEY `telefono` (`telefono`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `usuario` (`usuario`),
  ADD KEY `rolid` (`rolid`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ingreso`
--
ALTER TABLE `ingreso`
  MODIFY `ingresoid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `productoid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `proveedorid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `salida`
--
ALTER TABLE `salida`
  MODIFY `salidaid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `usuarioid` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ingreso`
--
ALTER TABLE `ingreso`
  ADD CONSTRAINT `ingreso_producto` FOREIGN KEY (`productoid`) REFERENCES `producto` (`productoid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ingreso_proveedor` FOREIGN KEY (`proveedorid`) REFERENCES `proveedor` (`proveedorid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ingreso_usuario` FOREIGN KEY (`usuarioid`) REFERENCES `usuario` (`usuarioid`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_proveedor` FOREIGN KEY (`proveedorid`) REFERENCES `proveedor` (`proveedorid`),
  ADD CONSTRAINT `producto_usuario` FOREIGN KEY (`usuarioid`) REFERENCES `usuario` (`usuarioid`);

--
-- Filtros para la tabla `salida`
--
ALTER TABLE `salida`
  ADD CONSTRAINT `salida_producto` FOREIGN KEY (`productoid`) REFERENCES `producto` (`productoid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `salida_proveedor` FOREIGN KEY (`proveedorid`) REFERENCES `proveedor` (`proveedorid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `salida_usuario` FOREIGN KEY (`usuarioid`) REFERENCES `usuario` (`usuarioid`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
