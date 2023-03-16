-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-02-2019 a las 18:19:10
-- Versión del servidor: 10.1.37-MariaDB
-- Versión de PHP: 7.3.1
USE INMUEBLES;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `inmuebles`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inmuebles`
--

CREATE TABLE `inmuebles` (
  `ID` int(11) NOT NULL,
  `TIPOINMUEBLE_ID` int(11) NOT NULL,
  `NUMEROPLANTAS` int(11) DEFAULT NULL,
  `DIRECCION` varchar(100) NOT NULL,
  `METROSCUADRADOS` int(11) NOT NULL,
  `MUNICIPIO_ID` int(11) NOT NULL,
  `PROPIETARIO_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `inmuebles`
--

INSERT INTO `inmuebles` (`ID`, `TIPOINMUEBLE_ID`, `NUMEROPLANTAS`, `DIRECCION`, `METROSCUADRADOS`, `MUNICIPIO_ID`, `PROPIETARIO_ID`) VALUES
(1, 1, 2, 'Calle de Juan Sanchez', 90, 1, 2),
(2, 1, 3, 'Calle de la Montaña', 80, 1, 1),
(3, 1, 3, 'Calle Benito Pérez Galdós', 90, 2, 1),
(4, 1, 3, 'Alonso Martin, 12', 900, 7, 14);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipios`
--

CREATE TABLE `municipios` (
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(50) NOT NULL,
  `NUMEROHABITANTES` int(11) DEFAULT NULL,
  `PROVINCIA_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `municipios`
--

INSERT INTO `municipios` (`ID`, `NOMBRE`, `NUMEROHABITANTES`, `PROVINCIA_ID`) VALUES
(1, 'Cáceres', 90000, 1),
(2, 'Trujillo', 9436, 1),
(3, 'Badajoz', 150000, 2),
(4, 'Mérida', 60000, 2),
(5, 'Madrid', 2000000, 3),
(6, 'Alcalá de Henares', 400000, 3),
(7, 'Don Benito', 35000, 2),
(8, 'Villanueva de la Serena', 25000, 2),
(11, 'Azuaga', 10000, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `id` int(11) NOT NULL,
  `DNI` varchar(9) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `APELLIDOS` varchar(50) NOT NULL,
  `DIRECCION` varchar(100) DEFAULT NULL,
  `MUNICIPIO_ID` int(11) NOT NULL,
  `PADRE_ID` int(11) DEFAULT NULL,
  `CODIGOVENDEDOR` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`id`, `DNI`, `nombre`, `APELLIDOS`, `DIRECCION`, `MUNICIPIO_ID`, `PADRE_ID`, `CODIGOVENDEDOR`) VALUES
(1, '99999999Y', 'Juan', 'Sánchez', 'Calle de Juan Sanchez', 1, NULL, 'cod999999'),
(2, '88888888O', 'Luis', 'Sánchez', 'Calle de Juan Sanchez', 1, 1, NULL),
(4, '77777777S', 'Fermin', 'Valiente', 'Calle de Fermin Valiente', 2, NULL, 'cod777777'),
(5, '66666666S', 'Magdalena', 'Cifuentes', 'Calle de Magdalena Cifuentes', 2, NULL, NULL),
(11, '55555555C', 'Antonia', 'López', 'Calle de Antonia López', 2, NULL, 'cod555555'),
(12, '44444444C', 'Pedro', 'Jiménez', 'Calle de Antonia López', 2, NULL, 'cod444444'),
(13, '33333333T', 'Carmina', 'Sánchez', 'Calle de Juan Sanchez', 1, 1, NULL),
(14, '06000243V', 'Consejería', 'de Educación y Cultura', 'Avda. Valhondo s/n', 4, NULL, 'cod8384349');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincias`
--

CREATE TABLE `provincias` (
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `provincias`
--

INSERT INTO `provincias` (`ID`, `NOMBRE`) VALUES
(1, 'Cáceres'),
(2, 'Badajoz'),
(3, 'Madrid');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoinmuebles`
--

CREATE TABLE `tipoinmuebles` (
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipoinmuebles`
--

INSERT INTO `tipoinmuebles` (`ID`, `NOMBRE`) VALUES
(1, 'Vivienda'),
(2, 'Finca'),
(3, 'Garaje');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `DESCRIPCION` varchar(500) NOT NULL,
  `INMUEBLE_ID` int(11) NOT NULL,
  `COMPRADOR_ID` int(11) NOT NULL,
  `VENDEDOR_ID` varchar(10) NOT NULL,
  `IMPORTE` float NOT NULL,
  `MUNICIPIODEFIRMAVENTA_ID` int(11) NOT NULL,
  `FECHA` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `DESCRIPCION`, `INMUEBLE_ID`, `COMPRADOR_ID`, `VENDEDOR_ID`, `IMPORTE`, `MUNICIPIODEFIRMAVENTA_ID`, `FECHA`) VALUES
(1, 'Contrato privado de compra-venta', 1, 1, 'cod555555', 125000, 3, '2018-12-07'),
(2, 'Compra por impago de deuda', 2, 1, 'cod555555', 93000, 2, '2005-12-01');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `inmuebles`
--
ALTER TABLE `inmuebles`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `MUNICIPIO_ID` (`MUNICIPIO_ID`),
  ADD KEY `PROPIETARIO_ID` (`PROPIETARIO_ID`),
  ADD KEY `TIPOINMUEBLE_ID` (`TIPOINMUEBLE_ID`);

--
-- Indices de la tabla `municipios`
--
ALTER TABLE `municipios`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `PROVINCIA_ID` (`PROVINCIA_ID`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `CODIGOVENDEDOR` (`CODIGOVENDEDOR`),
  ADD KEY `PADRE_ID` (`PADRE_ID`),
  ADD KEY `MUNICIPIO_ID` (`MUNICIPIO_ID`);

--
-- Indices de la tabla `provincias`
--
ALTER TABLE `provincias`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `tipoinmuebles`
--
ALTER TABLE `tipoinmuebles`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `COMPRADOR_ID` (`COMPRADOR_ID`),
  ADD KEY `VENDEDOR_ID` (`VENDEDOR_ID`),
  ADD KEY `INMUEBLE_ID` (`INMUEBLE_ID`),
  ADD KEY `MUNICIPIODEFIRMAVENTA_ID` (`MUNICIPIODEFIRMAVENTA_ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `inmuebles`
--
ALTER TABLE `inmuebles`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `municipios`
--
ALTER TABLE `municipios`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `personas`
--
ALTER TABLE `personas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `provincias`
--
ALTER TABLE `provincias`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipoinmuebles`
--
ALTER TABLE `tipoinmuebles`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `inmuebles`
--
ALTER TABLE `inmuebles`
  ADD CONSTRAINT `inmuebles_ibfk_1` FOREIGN KEY (`MUNICIPIO_ID`) REFERENCES `municipios` (`ID`) ON DELETE NO ACTION,
  ADD CONSTRAINT `inmuebles_ibfk_2` FOREIGN KEY (`PROPIETARIO_ID`) REFERENCES `personas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `inmuebles_ibfk_3` FOREIGN KEY (`TIPOINMUEBLE_ID`) REFERENCES `tipoinmuebles` (`ID`) ON DELETE CASCADE;

--
-- Filtros para la tabla `municipios`
--
ALTER TABLE `municipios`
  ADD CONSTRAINT `municipios_ibfk_1` FOREIGN KEY (`PROVINCIA_ID`) REFERENCES `provincias` (`ID`) ON DELETE CASCADE;

--
-- Filtros para la tabla `personas`
--
ALTER TABLE `personas`
  ADD CONSTRAINT `personas_ibfk_2` FOREIGN KEY (`MUNICIPIO_ID`) REFERENCES `municipios` (`ID`),
  ADD CONSTRAINT `personas_ibfk_3` FOREIGN KEY (`PADRE_ID`) REFERENCES `personas` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`COMPRADOR_ID`) REFERENCES `personas` (`id`),
  ADD CONSTRAINT `ventas_ibfk_3` FOREIGN KEY (`VENDEDOR_ID`) REFERENCES `personas` (`CODIGOVENDEDOR`),
  ADD CONSTRAINT `ventas_ibfk_4` FOREIGN KEY (`INMUEBLE_ID`) REFERENCES `inmuebles` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `ventas_ibfk_5` FOREIGN KEY (`MUNICIPIODEFIRMAVENTA_ID`) REFERENCES `municipios` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
