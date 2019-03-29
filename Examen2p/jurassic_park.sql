-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-03-2019 a las 22:50:18
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `jurassic park`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getEventos` ()  BEGIN 
	SELECT fecha, nombre_lu,nombre_in FROM incidentes,lugares,tipo_in
    WHERE lugar=id_lugar and tipo=id_tipo
    ORDER BY hora_fecha ASC;
   END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getIncidentes` ()  BEGIN 
SELECT * FROM incidentes
ORDER BY fecha_hora ASC;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incidentes`
--

CREATE TABLE `incidentes` (
  `id_incidente` smallint(10) NOT NULL,
  `hora_fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lugar` smallint(10) NOT NULL,
  `tipo` smallint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `incidentes`
--

INSERT INTO `incidentes` (`id_incidente`, `hora_fecha`, `lugar`, `tipo`) VALUES
(1, '2019-03-29 20:49:02', 1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lugares`
--

CREATE TABLE `lugares` (
  `id_lugar` smallint(10) NOT NULL,
  `nombre_lu` varchar(300) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `lugares`
--

INSERT INTO `lugares` (`id_lugar`, `nombre_lu`) VALUES
(1, 'Centro Turístico'),
(2, 'Laboratorios'),
(3, 'Restaurante'),
(4, 'Centro operativo'),
(5, 'Triceratops'),
(6, 'Dilofosaurios'),
(7, 'Velociraptos'),
(8, 'TRex'),
(9, 'Planicie de los herbívoros');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_in`
--

CREATE TABLE `tipo_in` (
  `id_tipo` smallint(10) NOT NULL,
  `nombre_in` varchar(200) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `tipo_in`
--

INSERT INTO `tipo_in` (`id_tipo`, `nombre_in`) VALUES
(1, 'Falla eléctrica'),
(2, 'Fuga herbívoro'),
(3, 'Fuga Velociraptor'),
(4, 'Fuga Trex'),
(5, 'Robo de ADN'),
(6, 'Auto descompuesto'),
(7, 'Visitantes en zona no autorizada');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `incidentes`
--
ALTER TABLE `incidentes`
  ADD PRIMARY KEY (`id_incidente`),
  ADD KEY `lugar` (`lugar`),
  ADD KEY `tipo` (`tipo`);

--
-- Indices de la tabla `lugares`
--
ALTER TABLE `lugares`
  ADD PRIMARY KEY (`id_lugar`);

--
-- Indices de la tabla `tipo_in`
--
ALTER TABLE `tipo_in`
  ADD PRIMARY KEY (`id_tipo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `incidentes`
--
ALTER TABLE `incidentes`
  MODIFY `id_incidente` smallint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `lugares`
--
ALTER TABLE `lugares`
  MODIFY `id_lugar` smallint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `tipo_in`
--
ALTER TABLE `tipo_in`
  MODIFY `id_tipo` smallint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `incidentes`
--
ALTER TABLE `incidentes`
  ADD CONSTRAINT `incidentes_ibfk_1` FOREIGN KEY (`lugar`) REFERENCES `lugares` (`id_lugar`) ON UPDATE CASCADE,
  ADD CONSTRAINT `incidentes_ibfk_2` FOREIGN KEY (`tipo`) REFERENCES `tipo_in` (`id_tipo`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
