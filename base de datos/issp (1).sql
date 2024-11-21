-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-11-2024 a las 22:45:30
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `issp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `id_alumno` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `DNI` int(9) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `telefono` varchar(11) NOT NULL,
  `calle` varchar(255) NOT NULL,
  `nro` int(5) NOT NULL,
  `codigo_postal` int(4) NOT NULL,
  `estado_civil` varchar(20) NOT NULL,
  `genero` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`id_alumno`, `nombre`, `apellido`, `email`, `DNI`, `fecha_nacimiento`, `telefono`, `calle`, `nro`, `codigo_postal`, `estado_civil`, `genero`) VALUES
(24, 'Geronimo', 'Aguirre', 'geroaguirre@gmail.com', 44657890, '2003-11-19', '3364775823', 'Moreno', 3080, 2919, 'Soltero/a', 'Masculino'),
(25, 'Mauricio', 'Rapari', 'mauriciorapari@gmail.com', 36758394, '1988-12-12', '3364886953', 'Eva Peron', 1300, 2919, 'Soltero/a', 'Masculino'),
(26, 'Dario', 'Flores', 'floresdariocarc@gmal.com', 39875254, '1993-07-19', '3364485960', 'Brown', 346, 2919, 'Casado/a', 'Masculino'),
(27, 'Nazareno', 'Serra', 'nazaserra@gmail.com', 44576823, '2003-03-06', '340086754', 'San Juan', 869, 2919, 'Casado/a', 'Masculino'),
(28, 'Vital', 'Longo', 'vitallongo@gmail.com', 38756498, '1990-04-30', '3400857463', 'Hipolito Yrigoyen', 334, 2919, 'Soltero/a', 'Masculino'),
(29, 'Alejo', 'Herrera', 'alejo@gmail.com', 44576294, '2000-10-19', '340076452', 'Cordoba', 3745, 2919, 'Soltero/a', 'Masculino'),
(30, 'Estefani', 'Saiquita', 'Teff@gmail.com', 456437859, '2003-04-22', '3364003537', 'Zeballos', 8593, 2919, 'Casado/a', 'Femenino'),
(31, 'Sara', 'Meliti', 'sarameliti@gmail.com', 45414317, '2004-01-05', '3364003537', 'Florencia', 902, 2919, 'Divorciado/a', 'Femenino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia`
--

CREATE TABLE `materia` (
  `id_materia` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `carga_horaria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `materia`
--

INSERT INTO `materia` (`id_materia`, `nombre`, `carga_horaria`) VALUES
(15, 'Ingles', 15),
(16, 'Matematicas', 25),
(17, 'Bases de datos', 30),
(18, 'Desarrollo de sistemas web', 32),
(19, 'Seguridad de los sistemas', 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias_alumnos`
--

CREATE TABLE `materias_alumnos` (
  `id` int(11) NOT NULL,
  `id_materia` int(11) NOT NULL,
  `id_alumno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `materias_alumnos`
--

INSERT INTO `materias_alumnos` (`id`, `id_materia`, `id_alumno`) VALUES
(44, 16, 24),
(45, 17, 24),
(46, 19, 24),
(47, 17, 26),
(48, 18, 26),
(49, 19, 25);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias_profesores`
--

CREATE TABLE `materias_profesores` (
  `id` int(11) NOT NULL,
  `id_materia` int(11) NOT NULL,
  `id_profesor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `materias_profesores`
--

INSERT INTO `materias_profesores` (`id`, `id_materia`, `id_profesor`) VALUES
(8, 17, 6),
(9, 18, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesores`
--

CREATE TABLE `profesores` (
  `id_profesor` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `DNI` int(11) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `telefono` varchar(11) NOT NULL,
  `calle` varchar(255) NOT NULL,
  `nro` int(11) NOT NULL,
  `codigo_postal` int(5) NOT NULL,
  `estado_civil` varchar(255) NOT NULL,
  `genero` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `profesores`
--

INSERT INTO `profesores` (`id_profesor`, `nombre`, `apellido`, `DNI`, `fecha_nacimiento`, `telefono`, `calle`, `nro`, `codigo_postal`, `estado_civil`, `genero`) VALUES
(6, 'Walter', 'Bur', 24635860, '1977-06-16', '3364998653', 'Eva Peron', 567, 2919, 'Casado/a', 'Masculino'),
(7, 'Karina', 'Gigli', 26789643, '1981-05-04', '3400456275', 'Bolivar', 7865, 2919, 'Casado/a', 'Femenino'),
(8, 'Nicolas', 'Rotili', 38756420, '1993-08-31', '3364885427', 'Catamarca', 2345, 2919, 'Casado/a', 'Masculino'),
(9, 'Federico', 'Rossini', 39867352, '1990-04-17', '3400842536', 'San Martin ', 1768, 2919, 'Soltero/a', 'Masculino'),
(10, 'Hector', 'Adreani', 19982456, '1960-03-05', '336409365', 'Salta', 6757, 2919, 'Casado/a', 'Masculino');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`id_alumno`);

--
-- Indices de la tabla `materia`
--
ALTER TABLE `materia`
  ADD PRIMARY KEY (`id_materia`);

--
-- Indices de la tabla `materias_alumnos`
--
ALTER TABLE `materias_alumnos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `materias_alumnos_ibfk_1` (`id_alumno`),
  ADD KEY `materias_alumnos_ibfk_2` (`id_materia`);

--
-- Indices de la tabla `materias_profesores`
--
ALTER TABLE `materias_profesores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `materias_profesores_ibfk_1` (`id_profesor`),
  ADD KEY `materias_profesores_ibfk_2` (`id_materia`);

--
-- Indices de la tabla `profesores`
--
ALTER TABLE `profesores`
  ADD PRIMARY KEY (`id_profesor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  MODIFY `id_alumno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `materia`
--
ALTER TABLE `materia`
  MODIFY `id_materia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `materias_alumnos`
--
ALTER TABLE `materias_alumnos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de la tabla `materias_profesores`
--
ALTER TABLE `materias_profesores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `profesores`
--
ALTER TABLE `profesores`
  MODIFY `id_profesor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `materias_alumnos`
--
ALTER TABLE `materias_alumnos`
  ADD CONSTRAINT `materias_alumnos_ibfk_1` FOREIGN KEY (`id_alumno`) REFERENCES `alumnos` (`id_alumno`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `materias_alumnos_ibfk_2` FOREIGN KEY (`id_materia`) REFERENCES `materia` (`id_materia`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `materias_profesores`
--
ALTER TABLE `materias_profesores`
  ADD CONSTRAINT `materias_profesores_ibfk_1` FOREIGN KEY (`id_profesor`) REFERENCES `profesores` (`id_profesor`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `materias_profesores_ibfk_2` FOREIGN KEY (`id_materia`) REFERENCES `materia` (`id_materia`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
