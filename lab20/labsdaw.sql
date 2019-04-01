-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-04-2019 a las 21:33:25
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
-- Base de datos: `labsdaw`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amigos`
--

CREATE TABLE `amigos` (
  `cod_amigo` smallint(10) NOT NULL,
  `Nombre` varchar(150) COLLATE latin1_spanish_ci NOT NULL,
  `Carrera` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `Estado` varchar(100) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `amigos`
--

INSERT INTO `amigos` (`cod_amigo`, `Nombre`, `Carrera`, `Estado`) VALUES
(1, 'Erendira', 'Sistemas Computacionales', 'Morelia'),
(2, 'Daniel ', 'Sistemas Computacionales', 'Queretaro'),
(3, 'Yafte', 'Sistemas Computacionales', 'Aguascalientes'),
(4, 'Daniela', 'Negocios Internacionales', 'Queretaro'),
(5, 'Paula', 'Administracion Financiera', 'Guanajuato'),
(6, 'Lisieux', 'Sistemas Computacionales', 'Guanajuato'),
(7, 'Marlita', 'Sistemas Computacionales', 'Guanajuato'),
(8, 'Javier', 'Sistemas Computacionales', 'Jalisco');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `amigos`
--
ALTER TABLE `amigos`
  ADD PRIMARY KEY (`cod_amigo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `amigos`
--
ALTER TABLE `amigos`
  MODIFY `cod_amigo` smallint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
