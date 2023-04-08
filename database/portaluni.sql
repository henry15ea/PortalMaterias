-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-03-2023 a las 19:13:14
-- Versión del servidor: 5.6.17
-- Versión de PHP: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `portaluni`
--
CREATE DATABASE IF NOT EXISTS `portaluni` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `portaluni`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_carrera`
--

DROP TABLE IF EXISTS `tbl_carrera`;
CREATE TABLE `tbl_carrera` (
  `cid` varchar(120) NOT NULL DEFAULT '',
  `cnombre` varchar(200) DEFAULT NULL,
  `cdet` varchar(250) DEFAULT 'Detalle de carrera',
  `c_facdid` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_cuenta`
--

DROP TABLE IF EXISTS `tbl_cuenta`;
CREATE TABLE `tbl_cuenta` (
  `carnet_id` varchar(12) NOT NULL DEFAULT '',
  `c_userid` varchar(120) NOT NULL DEFAULT '',
  `c_pass` varchar(120) DEFAULT '202cb962ac59075b964b07152d234b70',
  `c_alternativepass` varchar(120) DEFAULT '202cb962ac59075b964b07152d234b70',
  `c_datereg` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_departamento`
--

DROP TABLE IF EXISTS `tbl_departamento`;
CREATE TABLE `tbl_departamento` (
  `d_id` int(11) NOT NULL DEFAULT '0',
  `d_nombre` varchar(200) DEFAULT 'SAN SALVADOR'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_facultad`
--

DROP TABLE IF EXISTS `tbl_facultad`;
CREATE TABLE `tbl_facultad` (
  `f_id` varchar(120) NOT NULL DEFAULT '',
  `f_nombre` varchar(50) DEFAULT NULL,
  `f_detalle` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_materias`
--

DROP TABLE IF EXISTS `tbl_materias`;
CREATE TABLE `tbl_materias` (
  `m_id` varchar(120) NOT NULL DEFAULT '',
  `m_nombre` varchar(200) DEFAULT 'nombre materia',
  `m_carreraid` varchar(120) DEFAULT NULL,
  `m_noid` varchar(10) DEFAULT '01',
  `m_ciclo` varchar(10) DEFAULT NULL,
  `m_unvalorativas` varchar(10) DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_mun`
--

DROP TABLE IF EXISTS `tbl_mun`;
CREATE TABLE `tbl_mun` (
  `m_id` int(11) NOT NULL DEFAULT '0',
  `m_depid` int(11) NOT NULL DEFAULT '0',
  `m_nombre` varchar(120) DEFAULT 'SAN SALVADOR'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_notas`
--

DROP TABLE IF EXISTS `tbl_notas`;
CREATE TABLE `tbl_notas` (
  `n_id` varchar(120) NOT NULL DEFAULT '',
  `n_user` varchar(120) DEFAULT NULL,
  `n_materiaid` varchar(120) DEFAULT NULL,
  `n_nota` varchar(4) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_relmateria`
--

DROP TABLE IF EXISTS `tbl_relmateria`;
CREATE TABLE `tbl_relmateria` (
  `r_id` int(11) NOT NULL,
  `r_materia_base` varchar(120) NOT NULL DEFAULT '',
  `r_relmateria` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_role`
--

DROP TABLE IF EXISTS `tbl_role`;
CREATE TABLE `tbl_role` (
  `rid` varchar(120) NOT NULL DEFAULT '',
  `r_role` varchar(50) DEFAULT 'USER',
  `r_detalle` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user` (
  `u_id` varchar(120) NOT NULL DEFAULT '',
  `u_nombre` varchar(120) DEFAULT 'nombre',
  `u_apellido` varchar(120) DEFAULT 'apellido',
  `u_edad` int(3) DEFAULT '18',
  `u_tel` varchar(20) DEFAULT '00-0000-00',
  `u_munid` int(11) DEFAULT NULL,
  `u_dui` varchar(20) DEFAULT NULL,
  `u_nit` varchar(20) DEFAULT NULL,
  `u_carnet` varchar(12) DEFAULT NULL,
  `u_mail` varchar(20) DEFAULT NULL,
  `u_carreraid` varchar(120) DEFAULT NULL,
  `u_role` varchar(120) DEFAULT NULL,
  `u_datereg` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_carrera`
--
ALTER TABLE `tbl_carrera`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `fk_facid` (`c_facdid`);

--
-- Indices de la tabla `tbl_cuenta`
--
ALTER TABLE `tbl_cuenta`
  ADD PRIMARY KEY (`carnet_id`,`c_userid`),
  ADD KEY `fk_userid` (`c_userid`);

--
-- Indices de la tabla `tbl_departamento`
--
ALTER TABLE `tbl_departamento`
  ADD PRIMARY KEY (`d_id`);

--
-- Indices de la tabla `tbl_facultad`
--
ALTER TABLE `tbl_facultad`
  ADD PRIMARY KEY (`f_id`);

--
-- Indices de la tabla `tbl_materias`
--
ALTER TABLE `tbl_materias`
  ADD PRIMARY KEY (`m_id`),
  ADD KEY `fk_carreid` (`m_carreraid`);

--
-- Indices de la tabla `tbl_mun`
--
ALTER TABLE `tbl_mun`
  ADD PRIMARY KEY (`m_id`,`m_depid`),
  ADD KEY `fk_mun` (`m_depid`);

--
-- Indices de la tabla `tbl_notas`
--
ALTER TABLE `tbl_notas`
  ADD PRIMARY KEY (`n_id`),
  ADD KEY `fk_muserid` (`n_user`),
  ADD KEY `fk_matid` (`n_materiaid`);

--
-- Indices de la tabla `tbl_relmateria`
--
ALTER TABLE `tbl_relmateria`
  ADD PRIMARY KEY (`r_id`,`r_materia_base`),
  ADD KEY `fk_relmat` (`r_relmateria`);

--
-- Indices de la tabla `tbl_role`
--
ALTER TABLE `tbl_role`
  ADD PRIMARY KEY (`rid`);

--
-- Indices de la tabla `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`u_id`),
  ADD KEY `fk_mids` (`u_munid`),
  ADD KEY `fk_rolid` (`u_role`),
  ADD KEY `fk_cids` (`u_carreraid`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_relmateria`
--
ALTER TABLE `tbl_relmateria`
  MODIFY `r_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_carrera`
--
ALTER TABLE `tbl_carrera`
  ADD CONSTRAINT `fk_facid` FOREIGN KEY (`c_facdid`) REFERENCES `tbl_facultad` (`f_id`);

--
-- Filtros para la tabla `tbl_cuenta`
--
ALTER TABLE `tbl_cuenta`
  ADD CONSTRAINT `fk_userid` FOREIGN KEY (`c_userid`) REFERENCES `tbl_user` (`u_id`);

--
-- Filtros para la tabla `tbl_materias`
--
ALTER TABLE `tbl_materias`
  ADD CONSTRAINT `fk_carreid` FOREIGN KEY (`m_carreraid`) REFERENCES `tbl_carrera` (`cid`);

--
-- Filtros para la tabla `tbl_mun`
--
ALTER TABLE `tbl_mun`
  ADD CONSTRAINT `fk_mun` FOREIGN KEY (`m_depid`) REFERENCES `tbl_departamento` (`d_id`);

--
-- Filtros para la tabla `tbl_notas`
--
ALTER TABLE `tbl_notas`
  ADD CONSTRAINT `fk_muserid` FOREIGN KEY (`n_user`) REFERENCES `tbl_user` (`u_id`),
  ADD CONSTRAINT `fk_matid` FOREIGN KEY (`n_materiaid`) REFERENCES `tbl_materias` (`m_id`);

--
-- Filtros para la tabla `tbl_relmateria`
--
ALTER TABLE `tbl_relmateria`
  ADD CONSTRAINT `fk_relmat` FOREIGN KEY (`r_relmateria`) REFERENCES `tbl_materias` (`m_id`);

--
-- Filtros para la tabla `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD CONSTRAINT `fk_mids` FOREIGN KEY (`u_munid`) REFERENCES `tbl_mun` (`m_id`),
  ADD CONSTRAINT `fk_rolid` FOREIGN KEY (`u_role`) REFERENCES `tbl_role` (`rid`),
  ADD CONSTRAINT `fk_cids` FOREIGN KEY (`u_carreraid`) REFERENCES `tbl_carrera` (`cid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
