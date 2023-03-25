-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-03-2023 a las 20:55:40
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ubicaciones`
--

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `cadena`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `cadena` (
`Mensaje` varchar(212)
,`llave` varchar(150)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consultas`
--

CREATE TABLE `consultas` (
  `CodPais` varchar(50) NOT NULL,
  `CodZona` varchar(50) NOT NULL,
  `CodDistrito` varchar(50) NOT NULL,
  `FechaRegistro` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `consultas`
--

INSERT INTO `consultas` (`CodPais`, `CodZona`, `CodDistrito`, `FechaRegistro`) VALUES
('001', '001', '001', '2023-03-25'),
('002', '001', '001', '2023-03-25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `distritos`
--

CREATE TABLE `distritos` (
  `CodPais` varchar(50) NOT NULL,
  `CodZona` varchar(50) NOT NULL,
  `CodDistrito` varchar(50) NOT NULL,
  `Distrito` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `distritos`
--

INSERT INTO `distritos` (`CodPais`, `CodZona`, `CodDistrito`, `Distrito`) VALUES
('001', '001', '001', 'San Pedro Sula'),
('002', '001', '001', 'Nuevo León');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paises`
--

CREATE TABLE `paises` (
  `CodPais` varchar(50) NOT NULL,
  `Pais` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `paises`
--

INSERT INTO `paises` (`CodPais`, `Pais`) VALUES
('001', 'Honduras'),
('002', 'Mexico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zonas`
--

CREATE TABLE `zonas` (
  `CodPais` varchar(50) NOT NULL,
  `CodZona` varchar(50) NOT NULL,
  `Zona` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `zonas`
--

INSERT INTO `zonas` (`CodPais`, `CodZona`, `Zona`) VALUES
('001', '001', 'Cortes'),
('002', '001', 'Hidalgo');

-- --------------------------------------------------------

--
-- Estructura para la vista `cadena`
--
DROP TABLE IF EXISTS `cadena`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cadena`  AS SELECT concat('Usted pertenece al pais ',`p`.`Pais`,' A la zona ',`z`.`Zona`,' Ubicado en el distrito de ',`d`.`Distrito`) AS `Mensaje`, concat(`d`.`CodPais`,`d`.`CodZona`,`d`.`CodDistrito`) AS `llave` FROM ((`distritos` `d` join `paises` `p` on(`p`.`CodPais` = `d`.`CodPais`)) join `zonas` `z` on(`z`.`CodZona` = `d`.`CodZona` and `z`.`CodPais` = `d`.`CodPais`))  ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `paises`
--
ALTER TABLE `paises`
  ADD PRIMARY KEY (`CodPais`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
