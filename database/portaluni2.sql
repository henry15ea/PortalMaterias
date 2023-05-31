-- Adminer 4.8.1 MySQL 5.5.5-10.2.39-MariaDB-log dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP DATABASE IF EXISTS `portaluni`;
CREATE DATABASE `portaluni` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `portaluni`;

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `tbl_departamentos`;
CREATE TABLE `tbl_departamentos` (
  `d_id` int(11) NOT NULL DEFAULT 0,
  `d_nombre` varchar(200) DEFAULT 'SAN SALVADOR',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`d_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `tbl_departamentos` (`d_id`, `d_nombre`, `created_at`, `updated_at`) VALUES
(0,	'SAN SALVADOR',	'2023-04-08 02:55:05',	'2023-04-08 02:55:07');

DROP TABLE IF EXISTS `tbl_facultads`;
CREATE TABLE `tbl_facultads` (
  `f_id` varchar(120) NOT NULL DEFAULT '',
  `f_nombre` varchar(50) DEFAULT NULL,
  `f_detalle` varchar(200) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`f_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `tbl_facultads` (`f_id`, `f_nombre`, `f_detalle`, `created_at`, `updated_at`) VALUES
('530785b89190ed64a7bb34714cbf8085',	'CIENCIAS SOCIALES',	'CARRERAS EN EL AREA DE COMUNICACIONES,PSICOLOGIA,IDIOMAS',	'2023-04-08 17:23:08',	'2023-04-08 17:23:08'),
('8a09e3d14d1bf3c977059801e55824a6',	'DERECHO',	'CARRERAS EN EL AREA DE LEYES',	'2023-04-08 17:22:27',	'2023-04-08 17:22:27'),
('a969bdf1b3c0706b3ee00d4538acbdf9',	'SIN CATEGORIZAR',	'NO SE HA ASIGNADO FACULTAD',	'2023-04-08 02:55:15',	'2023-04-08 02:55:17'),
('c7c28b07f2db63736f816e04d8f3e961',	'INFORMATICA Y CIENCIAS APLICADAS',	'CARRERAS EN EL AREA DE LAS CIENCIAS Y MATEMATICAS',	'2023-04-08 02:55:15',	'2023-04-08 17:17:23'),
('dc356a2d3f09fdf9163ccbbec460d836',	'CIENCIAS EMPRESARIALES',	'CARRERAS EN EL AREA DE EMPRESAS Y ECONOMIA',	'2023-04-08 17:20:06',	'2023-04-08 17:20:06'),
('e1cbeba84b8b303341b190dfb02acfb2',	'General',	'Aplicado a todas las carreras',	'2023-04-08 17:56:30',	'2023-04-08 17:56:30'),
('e465d3a0e81b43654fd24d7d39c082d7',	'MAESTRIAS Y ESTUDIOS DE POSTGRADO',	'CARRERAS EN EL AREA DE NEGOCIOS,FINANZAS,GOB,ETC',	'2023-04-08 17:21:29',	'2023-04-08 17:21:29');


DROP TABLE IF EXISTS `tbl_munis`;
CREATE TABLE `tbl_munis` (
  `m_id` int(11) NOT NULL DEFAULT 0,
  `m_depid` int(11) NOT NULL DEFAULT 0,
  `m_nombre` varchar(120) DEFAULT 'SAN SALVADOR',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`m_id`,`m_depid`),
  KEY `fk_mun` (`m_depid`),
  CONSTRAINT `fk_mun` FOREIGN KEY (`m_depid`) REFERENCES `tbl_departamentos` (`d_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `tbl_munis` (`m_id`, `m_depid`, `m_nombre`, `created_at`, `updated_at`) VALUES
(0,	0,	'SOYAPANGO',	'2023-04-08 02:55:42',	'2023-04-08 02:55:44'),
(1,	0,	'ILOPANGO',	'2023-04-08 02:55:42',	'2023-04-08 02:55:44'),
(2,	0,	'SAN MARTIN',	'2023-04-08 02:55:42',	'2023-04-08 02:55:44');




DROP TABLE IF EXISTS `tbl_roless`;
CREATE TABLE `tbl_roless` (
  `rid` varchar(120) NOT NULL DEFAULT '',
  `r_role` varchar(50) DEFAULT 'USER',
  `r_detalle` varchar(120) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `tbl_roless` (`rid`, `r_role`, `r_detalle`, `created_at`, `updated_at`) VALUES
('2c0e4baac41dc6801f635cf6b32d4fa1',	'ALUMNO',	'ALUMNO DE LA UNIVERSIDAD',	'2023-04-08 02:56:16',	'2023-04-08 02:56:18'),
('47d44566378322ab974095c117bbc7fb',	'DEVELOP',	'SIRVE A MODO DE PRUEBA DEL SISTEMA',	'2023-04-08 02:56:16',	'2023-04-08 02:56:18'),
('a3e18a3ab9e0a897ee71b42005636ceb',	'PROFESOR',	'DOCENTE DE LA UNIVERSIDAD',	'2023-04-08 02:56:16',	'2023-04-08 02:56:18');





DROP TABLE IF EXISTS `tbl_carreras`;
CREATE TABLE `tbl_carreras` (
  `cid` varchar(120) NOT NULL DEFAULT '',
  `cnombre` varchar(200) DEFAULT NULL,
  `cdet` varchar(250) DEFAULT 'Detalle de carrera',
  `c_facdid` varchar(120) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`cid`),
  KEY `fk_facid` (`c_facdid`),
  CONSTRAINT `fk_facid` FOREIGN KEY (`c_facdid`) REFERENCES `tbl_facultads` (`f_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `tbl_carreras` (`cid`, `cnombre`, `cdet`, `c_facdid`, `created_at`, `updated_at`) VALUES
('130a67df6c77e8bf7234d5ec4136d0e1',	'Técnico en Periodismo',	'sin detalle',	'530785b89190ed64a7bb34714cbf8085',	'2023-04-08 17:31:32',	'2023-04-08 17:31:32'),
('1ec1432e98919f4498011cf89f28679e',	'Ingeniería Industrial con énfasis en Idioma Inglés',	'sin detalle',	'c7c28b07f2db63736f816e04d8f3e961',	'2023-04-08 17:34:18',	'2023-04-08 17:34:18'),
('2d8ad8432607c180fa6744a18889100c',	'General',	'sin detalle',	'e1cbeba84b8b303341b190dfb02acfb2',	'2023-04-08 17:57:08',	'2023-04-08 17:57:08'),
('32f6c710faad5e72090dbf13b1c2b0e7',	'Ingeniería en Sistemas y Computación no presencial',	'sin detalle',	'c7c28b07f2db63736f816e04d8f3e961',	'2023-04-08 17:33:46',	'2023-04-08 17:33:46'),
('330af61409dbc8179f69b02524e55e86',	'Ingeniería Industrial',	'sin detalle',	'c7c28b07f2db63736f816e04d8f3e961',	'2023-04-08 17:33:58',	'2023-04-08 17:33:58'),
('37429f535eb9f111c59f5a9a2d6ceaf4',	'Ingeniería Industrial no presencial',	'sin detalle',	'c7c28b07f2db63736f816e04d8f3e961',	'2023-04-08 17:34:08',	'2023-04-08 17:34:08'),
('41a28258f792a6597b55d5f38b95903d',	'Licenciatura en Antropología',	'sin detalle',	'530785b89190ed64a7bb34714cbf8085',	'2023-04-08 17:31:12',	'2023-04-08 17:31:12'),
('583fa1d9969d1fa3499051c9b9acd65c',	'Licenciatura en Comunicaciones con énfasis en Idioma Inglés.',	'sin detalle',	'530785b89190ed64a7bb34714cbf8085',	'2023-04-08 17:29:54',	'2023-04-08 17:29:54'),
('5e69be5e65229fe155ca9b8023b531ec',	'INGENIERIA EN SISTEMAS Y COMPUTACION',	'RAMA DE LAS INGENIERIAS ENFOCADAS EN AMBITOS TECNOLOGICOS',	'c7c28b07f2db63736f816e04d8f3e961',	'2023-04-08 02:54:23',	'2023-04-08 02:54:26'),
('6ab029ee825537bfecfbec1cc7d02347',	'Licenciatura en Ciencias Jurídicas',	'sin detalle',	'8a09e3d14d1bf3c977059801e55824a6',	'2023-04-08 17:28:37',	'2023-04-08 17:31:54'),
('7319ef446b92f9cdf6cdc58ae49ddd28',	'Técnico en Ingeniería de Software',	'sin detalle',	'c7c28b07f2db63736f816e04d8f3e961',	'2023-04-08 17:34:54',	'2023-04-08 17:34:54'),
('80668d50305b2c180b17950af2a2e226',	'Licenciatura en Idioma Inglés no presencial',	'sin detalle',	'530785b89190ed64a7bb34714cbf8085',	'2023-04-08 17:30:35',	'2023-04-08 17:30:35'),
('a3d348fe698cce2f77f511541215d539',	'Licenciatura en Arqueología',	'sin detalle',	'530785b89190ed64a7bb34714cbf8085',	'2023-04-08 17:30:59',	'2023-04-08 17:30:59'),
('ad4c18f7bd895fcfe2c40301fd0ca68f',	'Técnico en Ingeniería de Redes Computacionales',	'sin detalle',	'c7c28b07f2db63736f816e04d8f3e961',	'2023-04-08 17:35:17',	'2023-04-08 17:35:17'),
('b0849f5b5fb7ab62389b297bedfcb6cf',	'Técnico en Diseño Gráfico',	'sin detalle',	'c7c28b07f2db63736f816e04d8f3e961',	'2023-04-08 17:34:45',	'2023-04-08 17:34:45'),
('bf65d40a172f51f6beaf669f8fcc131c',	'Licenciatura en Idioma Inglés',	'sin detalle',	'530785b89190ed64a7bb34714cbf8085',	'2023-04-08 17:30:20',	'2023-04-08 17:30:20'),
('c9fed6e9c21ce15888278611080f0cbd',	'Licenciatura en Informática no presencial',	'sin detalle',	'c7c28b07f2db63736f816e04d8f3e961',	'2023-04-08 17:33:01',	'2023-04-08 17:33:01'),
('d7b0ab4b8ac2a58baf753937c623e811',	'Licenciatura en Diseño Gráfico',	'sin detalle',	'c7c28b07f2db63736f816e04d8f3e961',	'2023-04-08 17:34:31',	'2023-04-08 17:34:31'),
('d7b23ca8e68d029d2bc5b99878f85f06',	'Licenciatura en Comunicaciones',	'sin detalle',	'530785b89190ed64a7bb34714cbf8085',	'2023-04-08 17:29:41',	'2023-04-08 17:29:41'),
('d9d1d92ddaf6be2892a45a6c5fb6d862',	'Técnico en Relaciones Públicas',	'sin detalle',	'530785b89190ed64a7bb34714cbf8085',	'2023-04-08 17:31:23',	'2023-04-08 17:31:23'),
('dc9df4be18bd7fb0cb879747a97abe9a',	'Arquitectura',	'sin detalle',	'c7c28b07f2db63736f816e04d8f3e961',	'2023-04-08 17:35:48',	'2023-04-08 17:35:48'),
('e10800d901f3df7dc0f42d38a2218a51',	'Licenciatura en Psicología',	'sin detalle',	'530785b89190ed64a7bb34714cbf8085',	'2023-04-08 17:30:46',	'2023-04-08 17:30:46'),
('e98387ab2b01ce88f1bfcb68c1a532cb',	'Licenciatura en Informática',	'sin detalle',	'c7c28b07f2db63736f816e04d8f3e961',	'2023-04-08 17:32:50',	'2023-04-08 17:32:50'),
('f9729dc98249ca7efbc2f594ac17ad44',	'Ingeniería en Gestión de Base de Datos',	'sin detalle',	'c7c28b07f2db63736f816e04d8f3e961',	'2023-04-08 17:35:30',	'2023-04-08 17:35:30'),
('fc1b7f67355f6ff1a90c380cccbc7904',	'Técnico en Ingeniería de Harware.',	'sin detalle',	'c7c28b07f2db63736f816e04d8f3e961',	'2023-04-08 17:35:05',	'2023-04-08 17:35:05');


DROP TABLE IF EXISTS `tbl_users`;
CREATE TABLE `tbl_users` (
  `u_id` varchar(120) NOT NULL DEFAULT '',
  `u_nombre` varchar(120) DEFAULT 'nombre',
  `u_apellido` varchar(120) DEFAULT 'apellido',
  `u_edad` int(3) DEFAULT 18,
  `u_tel` varchar(20) DEFAULT '00-0000-00',
  `u_munid` int(11) DEFAULT NULL,
  `u_dui` varchar(20) DEFAULT NULL,
  `u_nit` varchar(20) DEFAULT NULL,
  `u_carnet` varchar(120) DEFAULT NULL,
  `u_mail` varchar(20) DEFAULT NULL,
  `u_carreraid` varchar(120) DEFAULT NULL,
  `u_role` varchar(120) DEFAULT NULL,
  `u_datereg` timestamp NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`u_id`),
  KEY `fk_mids` (`u_munid`),
  KEY `fk_rolid` (`u_role`),
  KEY `fk_cids` (`u_carreraid`),
  CONSTRAINT `fk_cids` FOREIGN KEY (`u_carreraid`) REFERENCES `tbl_carreras` (`cid`),
  CONSTRAINT `fk_mids` FOREIGN KEY (`u_munid`) REFERENCES `tbl_munis` (`m_id`),
  CONSTRAINT `fk_rolid` FOREIGN KEY (`u_role`) REFERENCES `tbl_roless` (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `tbl_users` (`u_id`, `u_nombre`, `u_apellido`, `u_edad`, `u_tel`, `u_munid`, `u_dui`, `u_nit`, `u_carnet`, `u_mail`, `u_carreraid`, `u_role`, `u_datereg`, `created_at`, `updated_at`) VALUES
('230f4b4381961b2dbce865180df7c7d4',	'DEVELOPER',	'ADMIN',	26,	'70010101',	0,	'123456789',	'987654321',	'10101010',	'developer@',	'5e69be5e65229fe155ca9b8023b531ec',	'47d44566378322ab974095c117bbc7fb',	'2023-04-07 03:21:09',	'2023-04-08 02:56:27',	'2023-04-10 00:13:38');
DROP TABLE IF EXISTS `tbl_cuentas`;

CREATE TABLE `tbl_cuentas` (
  `carnet_id` varchar(12) NOT NULL DEFAULT '',
  `c_userid` varchar(120) NOT NULL DEFAULT '',
  `c_pass` varchar(120) DEFAULT '202cb962ac59075b964b07152d234b70',
  `c_alternativepass` varchar(120) DEFAULT '202cb962ac59075b964b07152d234b70',
  `c_datereg` timestamp NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`carnet_id`,`c_userid`),
  KEY `fk_userid` (`c_userid`),
  CONSTRAINT `fk_userid` FOREIGN KEY (`c_userid`) REFERENCES `tbl_users` (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `tbl_cuentas` (`carnet_id`, `c_userid`, `c_pass`, `c_alternativepass`, `c_datereg`, `created_at`, `updated_at`) VALUES
('10101010',	'230f4b4381961b2dbce865180df7c7d4',	'202cb962ac59075b964b07152d234b70',	'fe01ce2a7fbac8fafaed7c982a04e229',	'2023-04-07 03:17:23',	'2023-04-08 02:54:33',	'2023-04-08 02:54:35');



DROP TABLE IF EXISTS `tbl_tokenUsers`;
CREATE TABLE `tbl_tokenUsers` (
  `id_tkn` varchar(64) NOT NULL,
  `user_id` varchar(12) NOT NULL,
  `token_id` varchar(120) NOT NULL,
  `token_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `expiration_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_tkn`,`token_id`),
  KEY `fk_tokuser` (`user_id`),
  CONSTRAINT `fk_tokuser` FOREIGN KEY (`user_id`) REFERENCES `tbl_cuentas` (`carnet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `tbl_tokenUsers` (`id_tkn`, `user_id`, `token_id`, `token_time`, `expiration_time`, `created_at`, `updated_at`) VALUES
('fbf1c365fc3fbf98ee1a56d5651a4e2d',	'10101010',	'90d5b0f9e65c90a687028902419443cb',	'2023-04-08 03:07:24',	'2023-04-11 08:47:01',	'2023-04-08 03:07:24',	'2023-04-10 23:44:50');



DROP TABLE IF EXISTS `tbl_materias`;
CREATE TABLE `tbl_materias` (
  `m_id` varchar(120) NOT NULL DEFAULT '',
  `m_nombre` varchar(200) DEFAULT 'nombre materia',
  `m_carreraid` varchar(120) DEFAULT NULL,
  `m_noid` varchar(10) DEFAULT '01',
  `m_ciclo` varchar(10) DEFAULT NULL,
  `m_unvalorativas` varchar(10) DEFAULT '4',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `hts` int(11) DEFAULT 3,
  `hps` int(11) NOT NULL DEFAULT 2,
  `ht` int(11) DEFAULT 90,
  `pensum_orden` int(11) DEFAULT 0,
  PRIMARY KEY (`m_id`),
  KEY `fk_carreid` (`m_carreraid`),
  CONSTRAINT `fk_carreid` FOREIGN KEY (`m_carreraid`) REFERENCES `tbl_carreras` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `tbl_materias` (`m_id`, `m_nombre`, `m_carreraid`, `m_noid`, `m_ciclo`, `m_unvalorativas`, `created_at`, `updated_at`, `hts`, `hps`, `ht`, `pensum_orden`) VALUES
('018e183c78ef4e6a9c5c3f0891192594',	'Dibujo Natural',	'b0849f5b5fb7ab62389b297bedfcb6cf',	'DINA-DG',	'1',	'4',	'2023-04-09 00:08:38',	'2023-04-09 00:08:38',	1,	4,	90,	3),
('04d1fd97f38208897c52738d9085b324',	'Técnicas de Presentación Gráfica',	'd7b0ab4b8ac2a58baf753937c623e811',	'TEPR-AC',	'4',	'4',	'2023-04-08 23:54:34',	'2023-04-08 23:54:34',	1,	4,	90,	16),
('04f2666b08101688eb1bd7a7462f332f',	'Programación I',	'e98387ab2b01ce88f1bfcb68c1a532cb',	'PRO1-T',	'3',	'4',	'2023-04-08 22:50:55',	'2023-04-08 22:52:42',	2,	3,	90,	10),
('076a9abbf7ba30e27ed2b664050e8d22',	'Introducción al Derecho Procesal',	'6ab029ee825537bfecfbec1cc7d02347',	'IDPR-D',	'2',	'4',	'2023-04-08 18:16:13',	'2023-04-08 21:39:54',	3,	2,	90,	7),
('0847b81d4bcbc20cee3b5d445014ed97',	'Fotografía',	'd7b23ca8e68d029d2bc5b99878f85f06',	'FOTO-C',	'2',	'4',	'2023-04-08 22:20:26',	'2023-04-08 22:21:42',	2,	3,	90,	9),
('09f12ccbc6256d4bef04300aa1ddcc37',	'Derecho de Familia',	'6ab029ee825537bfecfbec1cc7d02347',	'DEFA-D',	'4',	'4',	'2023-04-08 22:05:47',	'2023-04-08 22:05:47',	3,	2,	90,	19),
('0c27f45cc53c7a919229430bc891f71a',	'Seminario Taller de Competencias',	'e98387ab2b01ce88f1bfcb68c1a532cb',	'SETA-P',	'1',	'4',	'2023-04-08 22:43:24',	'2023-04-08 22:43:24',	3,	2,	90,	4),
('0e785b00fb6da7f77c643bc4e089edfc',	'Introducción al Estudio del Derecho II',	'6ab029ee825537bfecfbec1cc7d02347',	'INED2-D',	'2',	'4',	'2023-04-08 21:43:27',	'2023-04-08 21:43:27',	3,	2,	90,	8),
('104d89b321e95a048633b756804bbffb',	'Administración',	'd7b23ca8e68d029d2bc5b99878f85f06',	'ADM1-N',	'2',	'4',	'2023-04-08 22:20:06',	'2023-04-08 22:21:42',	3,	2,	90,	8),
('14007094f8928132b07f5d450492fff7',	'Expresión Oral y Escrita del Español',	'd7b0ab4b8ac2a58baf753937c623e811',	'EXOE-I',	'1',	'4',	'2023-04-08 23:40:46',	'2023-04-08 23:40:46',	2,	3,	90,	4),
('14f367304ae121626826ea3f1df3c15c',	'Fotografía Publicitaria',	'd7b23ca8e68d029d2bc5b99878f85f06',	'FOPU-C',	'3',	'4',	'2023-04-08 22:29:56',	'2023-04-08 22:29:56',	2,	3,	90,	13),
('153e5b74d920f641272a8188bd6af2c3',	'Seminario Taller de Competencias',	'd7b23ca8e68d029d2bc5b99878f85f06',	'SETA-P',	'1',	'4',	'2023-04-08 22:15:43',	'2023-04-08 22:15:43',	2,	3,	90,	4),
('15e8f2a0861fe16056ec63d4edc63026',	'Teoría de la Comunicación',	'd7b23ca8e68d029d2bc5b99878f85f06',	'TECO-C',	'1',	'4',	'2023-04-08 22:13:17',	'2023-04-08 22:13:17',	3,	2,	90,	3),
('180c2cd0ccb15632b078b71f6f596d14',	'Expresión Oral y Escrita del Español',	'6ab029ee825537bfecfbec1cc7d02347',	'EXOE-I',	'3',	'4',	'2023-04-08 21:56:46',	'2023-04-08 21:56:46',	3,	2,	90,	13),
('184575c50e74a2f89244acc60edb60b1',	'Tecnología Digital II',	'd7b0ab4b8ac2a58baf753937c623e811',	'TED2-AC',	'2',	'4',	'2023-04-08 23:45:13',	'2023-04-08 23:45:13',	1,	4,	90,	7),
('186956e0211f9bcf3f71d72dd819f3a7',	'Taller de Diseño y Modelado',	'd7b0ab4b8ac2a58baf753937c623e811',	'TADI-AC',	'3',	'4',	'2023-04-08 23:51:03',	'2023-04-08 23:51:03',	1,	4,	90,	13),
('1e188294c3e609b49fd997d2acbe2ecb',	'Lenguaje Unificado de Modelado (UML)',	'e98387ab2b01ce88f1bfcb68c1a532cb',	'LUMO-T',	'3',	'4',	'2023-04-08 22:57:00',	'2023-04-08 22:57:00',	2,	3,	90,	12),
('22ad1e6d165e6f0ce247447df015a6bb',	'Diseño de Interfaces II',	'd7b0ab4b8ac2a58baf753937c623e811',	'DII2-AC',	'4',	'4',	'2023-04-09 00:00:21',	'2023-04-09 00:00:21',	1,	4,	90,	19),
('2546cc3f849640536c364fe5e8565ead',	'Expresión oral y escrita del español',	'330af61409dbc8179f69b02524e55e86',	'EXOE-A',	'1',	'4',	'2023-04-08 23:12:44',	'2023-04-08 23:12:44',	3,	2,	90,	4),
('288a0cb4cfc8c5c526b1b4136bd21db6',	'Diseño de Páginas Web',	'b0849f5b5fb7ab62389b297bedfcb6cf',	'DIPA-AC',	'4',	'4',	'2023-04-09 00:21:02',	'2023-04-09 00:21:02',	1,	4,	90,	16),
('2d4ef57dabe60ad4fab39fe19624015f',	'Ética',	'b0849f5b5fb7ab62389b297bedfcb6cf',	'ETIC-A',	'4',	'4',	'2023-04-09 00:23:54',	'2023-04-09 00:23:54',	3,	2,	90,	19),
('2ea9ef641dfb2ae814998291915bf000',	'Algoritmos II',	'e98387ab2b01ce88f1bfcb68c1a532cb',	'ALG2-T',	'2',	'4',	'2023-04-08 22:44:10',	'2023-04-08 22:44:10',	2,	3,	90,	5),
('319747f9827bfd0bd79c473dccd71ae4',	'Realidad Nacional',	'6ab029ee825537bfecfbec1cc7d02347',	'REA-A',	'1',	'4',	'2023-04-08 18:00:43',	'2023-04-08 21:39:54',	3,	2,	90,	1),
('32008e9bd010744f4afa3144e6584c98',	'Creatividad Editorial Gráfica',	'b0849f5b5fb7ab62389b297bedfcb6cf',	'CRED-AC',	'4',	'4',	'2023-04-09 00:22:51',	'2023-04-09 00:22:51',	1,	4,	90,	18),
('33836ce8d215d4423a6af8738319f418',	'Informática',	'6ab029ee825537bfecfbec1cc7d02347',	'INFO-T',	'4',	'4',	'2023-04-08 21:58:51',	'2023-04-08 21:58:51',	3,	2,	90,	15),
('36a0d7019782f120b6c26caf4d3af52c',	'Artes Gráficas II',	'd7b0ab4b8ac2a58baf753937c623e811',	'ARG2-AC',	'3',	'4',	'2023-04-08 23:49:09',	'2023-04-08 23:49:09',	1,	4,	90,	11),
('39a0fdb85b11328773ee35ed19185a5c',	'Diseño de Imagen Corporativa',	'b0849f5b5fb7ab62389b297bedfcb6cf',	'DIIM-AC',	'4',	'4',	'2023-04-09 00:20:02',	'2023-04-09 00:20:02',	3,	2,	90,	15),
('3fcdf21977562578fc7c90372e167dc6',	'Expresión Oral y Escrita del Español',	'b0849f5b5fb7ab62389b297bedfcb6cf',	'EXOE-I',	'1',	'4',	'2023-04-09 00:09:15',	'2023-04-09 00:10:03',	2,	3,	90,	4),
('44efd75d672e6cbcf666c21f1dfa5b92',	'Operaciones de fabricación',	'330af61409dbc8179f69b02524e55e86',	'OPFA-T',	'3',	'4',	'2023-04-08 23:20:09',	'2023-04-08 23:20:09',	3,	2,	90,	10),
('47d1370206decd2648a40bff74a07eef',	'Realidad Nacional',	'e98387ab2b01ce88f1bfcb68c1a532cb',	'REA-A',	'3',	'4',	'2023-04-08 22:59:57',	'2023-04-08 22:59:57',	2,	3,	90,	14),
('4bb596ef18ce52f75dbb34a2f2dd9990',	'Matemática II',	'330af61409dbc8179f69b02524e55e86',	'MAT2-T',	'3',	'4',	'2023-04-08 23:21:41',	'2023-04-08 23:21:41',	3,	2,	90,	12),
('4e272d721e64f172986302e22fd5984e',	'Inglés I',	'330af61409dbc8179f69b02524e55e86',	'ING1-I',	'3',	'4',	'2023-04-08 23:22:25',	'2023-04-08 23:22:25',	3,	2,	90,	13),
('4e331b7a09706beda07ce05698757e81',	'Gramática Superior',	'd7b23ca8e68d029d2bc5b99878f85f06',	'GRAS-I',	'3',	'4',	'2023-04-08 22:28:47',	'2023-04-08 22:28:47',	3,	2,	90,	12),
('4ea92e59fa8001d134297a537c9b4952',	'Inglés I',	'd7b23ca8e68d029d2bc5b99878f85f06',	'ING1-I',	'3',	'4',	'2023-04-08 22:30:46',	'2023-04-08 22:30:46',	2,	3,	90,	14),
('4ed8c92d957899922bf57ec3963ed69d',	'Estadística',	'e98387ab2b01ce88f1bfcb68c1a532cb',	'ESTA-T',	'4',	'4',	'2023-04-08 23:04:47',	'2023-04-08 23:04:47',	2,	3,	90,	18),
('5103622b644d076a19c2dab90e09ce80',	'Metodología y técnicas de la investigación',	'330af61409dbc8179f69b02524e55e86',	'MYTI-T',	'1',	'4',	'2023-04-08 23:13:37',	'2023-04-08 23:13:37',	3,	2,	90,	5),
('520aeac270895bbca783fa8bcc824f17',	'Matemática',	'd7b23ca8e68d029d2bc5b99878f85f06',	'MATE-T',	'4',	'4',	'2023-04-08 22:36:43',	'2023-04-08 22:36:43',	3,	2,	90,	18),
('52c3b2b985baf33d701961e4bce4ae91',	'Métodos de Programación I',	'e98387ab2b01ce88f1bfcb68c1a532cb',	'MET1-T',	'2',	'4',	'2023-04-08 22:48:14',	'2023-04-08 22:57:38',	2,	3,	90,	8),
('53018bd92cc510cd7ef7f21172e71a40',	'Dibujo Industrial',	'330af61409dbc8179f69b02524e55e86',	'DIBI-T',	'2',	'4',	'2023-04-08 23:16:02',	'2023-04-08 23:16:21',	2,	3,	90,	6),
('5ff323c120bb74140779b8cf74645486',	'Creatividad Publicitaria',	'b0849f5b5fb7ab62389b297bedfcb6cf',	'CRPU-AC',	'3',	'4',	'2023-04-09 00:15:09',	'2023-04-09 00:15:09',	2,	3,	90,	10),
('60165a0f97880e8878839d2e18642009',	'Tecnología Digital I',	'd7b0ab4b8ac2a58baf753937c623e811',	'TED1-AC',	'1',	'4',	'2023-04-08 23:39:20',	'2023-04-08 23:39:20',	1,	4,	90,	2),
('6406ef988df9df808ee81e11c78f406b',	'Inglés II',	'd7b23ca8e68d029d2bc5b99878f85f06',	'ING2-I',	'4',	'4',	'2023-04-08 22:37:30',	'2023-04-08 22:37:30',	2,	3,	90,	19),
('662595e7d57c23c768a2d85b53ec7486',	'Realidad Nacional',	'330af61409dbc8179f69b02524e55e86',	'REA-A',	'2',	'4',	'2023-04-08 23:17:05',	'2023-04-08 23:17:32',	3,	2,	90,	7),
('676e8cf800fac638bc8efcffb41eff2c',	'Fundamentos de Física Aplicada',	'e98387ab2b01ce88f1bfcb68c1a532cb',	'FFIS-T',	'2',	'4',	'2023-04-08 22:47:10',	'2023-04-08 22:47:10',	2,	3,	90,	7),
('6d84e69bca8c41929d03c5f92c871d37',	'Desarrollo Individual',	'6ab029ee825537bfecfbec1cc7d02347',	'DEIN-P',	'3',	'4',	'2023-04-08 21:53:31',	'2023-04-08 21:53:31',	3,	2,	90,	10),
('6f6f2c95adc2a5c5a280765b4437953b',	'Artes Gráficas',	'b0849f5b5fb7ab62389b297bedfcb6cf',	'ARAR-AC',	'2',	'4',	'2023-04-09 00:12:06',	'2023-04-09 00:12:06',	1,	4,	90,	7),
('70f21cebef8b0f89cd67276a88c870b6',	'Orientación técnica de ingeniería',	'330af61409dbc8179f69b02524e55e86',	'ORTI-T',	'1',	'4',	'2023-04-08 23:11:11',	'2023-04-08 23:11:11',	3,	2,	90,	2),
('717eb23a6af4b3a2a0472619dbbc1e07',	'Ética',	'd7b0ab4b8ac2a58baf753937c623e811',	'ETIC-A',	'3',	'4',	'2023-04-08 23:53:11',	'2023-04-08 23:53:11',	3,	2,	90,	15),
('745c0b589daba353cabede2f311dc9dc',	'Diseño de Interfaces I',	'd7b0ab4b8ac2a58baf753937c623e811',	'DII1-AC',	'3',	'4',	'2023-04-08 23:52:10',	'2023-04-08 23:52:10',	1,	4,	90,	14),
('7513f72a30547248611f6a4358b09ace',	'Diseño Infográfico',	'd7b0ab4b8ac2a58baf753937c623e811',	'DIIN-AC',	'4',	'4',	'2023-04-08 23:58:15',	'2023-04-08 23:58:15',	2,	3,	90,	17),
('79314437cc97cb0e1a7fc15670c26bb7',	'Programación II',	'e98387ab2b01ce88f1bfcb68c1a532cb',	'PRO2-T',	'4',	'4',	'2023-04-08 23:00:49',	'2023-04-08 23:00:49',	2,	3,	90,	15),
('79f3c916cd3a7b30ff43d96f9ae5d0a7',	'Estadística y probabilidades',	'330af61409dbc8179f69b02524e55e86',	'ESPR-T',	'4',	'4',	'2023-04-08 23:33:56',	'2023-04-08 23:33:56',	3,	2,	90,	18),
('7d951e4bf38a44d5ccd3793b8e198f70',	'Medios Publicitarios Gráficos',	'b0849f5b5fb7ab62389b297bedfcb6cf',	'MEPU-AC',	'3',	'4',	'2023-04-09 00:18:07',	'2023-04-09 00:18:07',	3,	2,	90,	13),
('7ed747ef07ead7a7502b738f6a6b555e',	'Arquitectura de las Computadoras',	'e98387ab2b01ce88f1bfcb68c1a532cb',	'ARCO-T',	'1',	'4',	'2023-04-08 22:42:03',	'2023-04-08 22:42:03',	2,	3,	90,	2),
('806e0988b86a0834d28f121af175b2c2',	'Procedimientos Constitucionales',	'6ab029ee825537bfecfbec1cc7d02347',	'PRCO-D',	'3',	'4',	'2023-04-08 21:57:45',	'2023-04-08 21:57:45',	3,	2,	90,	14),
('8189a64350b8576a2b8f9d2c5db1d963',	'Redacción para Medios de Comunicación',	'd7b23ca8e68d029d2bc5b99878f85f06',	'REME-C',	'4',	'4',	'2023-04-08 22:34:36',	'2023-04-08 22:34:36',	2,	3,	90,	16),
('8520a7850bc940efb78754b4a6347ed0',	'Metodología y Técnicas de la Investigación',	'd7b0ab4b8ac2a58baf753937c623e811',	'MYTI-T',	'1',	'4',	'2023-04-08 23:40:03',	'2023-04-08 23:40:03',	1,	4,	90,	3),
('85ac40a707f102b804c82a885fc21616',	'Introducción al Estudio del Derecho I',	'6ab029ee825537bfecfbec1cc7d02347',	'INED1-D',	'1',	'4',	'2023-04-08 18:03:05',	'2023-04-08 21:39:54',	3,	2,	90,	4),
('875203418d6d612e96eb2dd442f91caf',	'Física II',	'330af61409dbc8179f69b02524e55e86',	'FIS2-T',	'4',	'4',	'2023-04-08 23:30:38',	'2023-04-08 23:30:38',	3,	2,	90,	15),
('87ba80ecf6344f9f04fde829ff2b6f69',	'Seminario Taller de Competencias',	'd7b0ab4b8ac2a58baf753937c623e811',	'SETA-P',	'1',	'4',	'2023-04-08 23:41:23',	'2023-04-08 23:41:23',	2,	3,	90,	5),
('88880ebd99628de8e81a04b9a51f5bde',	'Matemática I',	'e98387ab2b01ce88f1bfcb68c1a532cb',	'MAT1-T',	'1',	'4',	'2023-04-08 22:42:48',	'2023-04-08 22:42:48',	3,	2,	90,	3),
('88d6c1b6335a7e39cfa696495d31083f',	'Dibujo Natural',	'd7b0ab4b8ac2a58baf753937c623e811',	'DINA-AC',	'1',	'4',	'2023-04-08 23:38:38',	'2023-04-08 23:38:38',	1,	4,	90,	1),
('8917510b14791cb433009582872a4f10',	'Técnicas De Presentación Gráfica',	'b0849f5b5fb7ab62389b297bedfcb6cf',	'TEPR-AC',	'3',	'4',	'2023-04-09 00:17:07',	'2023-04-09 00:17:07',	1,	4,	90,	12),
('8b60a08bb09866d03ade1aa9d967e2bc',	'Ética',	'd7b23ca8e68d029d2bc5b99878f85f06',	'ETIC-A',	'4',	'4',	'2023-04-08 22:33:09',	'2023-04-08 22:34:05',	3,	2,	90,	15),
('8c1e12d655d82b48fb65f4d9ebb472db',	'Derecho Constitucional',	'6ab029ee825537bfecfbec1cc7d02347',	'DECO-D',	'2',	'4',	'2023-04-08 21:47:18',	'2023-04-08 21:48:11',	3,	2,	90,	9),
('8c937715dd866409341be10fd9ae76cf',	'Programación Orientada a Objetos',	'e98387ab2b01ce88f1bfcb68c1a532cb',	'PROE-T',	'2',	'4',	'2023-04-08 22:46:00',	'2023-04-08 22:46:00',	2,	3,	90,	6),
('92fd84d2ca6929b583567ebbaee9d907',	'Algoritmos I',	'e98387ab2b01ce88f1bfcb68c1a532cb',	'ALG1-T',	'1',	'4',	'2023-04-08 22:41:18',	'2023-04-08 22:41:18',	2,	3,	90,	1),
('94944c961baa48f69d34060d48bec894',	'Inglés II',	'330af61409dbc8179f69b02524e55e86',	'ING2-I',	'4',	'4',	'2023-04-08 23:32:57',	'2023-04-08 23:32:57',	3,	2,	90,	17),
('953594ea0c3a9cd479a2a78b4cab8239',	'Taller de Creatividad y Métodos de Diseño',	'd7b0ab4b8ac2a58baf753937c623e811',	'TACR-AC',	'2',	'4',	'2023-04-08 23:46:03',	'2023-04-08 23:46:03',	2,	3,	90,	8),
('96b31a6a49e4c4ea058ca1be2301c39a',	'Redes de Datos I',	'e98387ab2b01ce88f1bfcb68c1a532cb',	'RED1-T',	'4',	'4',	'2023-04-08 23:02:04',	'2023-04-08 23:02:24',	2,	3,	90,	16),
('9df270564208e11b9fbdc4197ed34283',	'Derecho Penal I',	'6ab029ee825537bfecfbec1cc7d02347',	'DEP1-D',	'2',	'4',	'2023-04-08 18:15:25',	'2023-04-08 21:39:54',	3,	2,	90,	6),
('9f60b6145dcbdfe6067178a12f051c2f',	'Desarrollo Individual',	'd7b23ca8e68d029d2bc5b99878f85f06',	'DEIN-P',	'2',	'4',	'2023-04-08 22:18:28',	'2023-04-08 22:21:42',	3,	2,	90,	5),
('9f96123bb05187c2705a9f690f40b62c',	'Tecnología Digital II',	'b0849f5b5fb7ab62389b297bedfcb6cf',	'TED2-AC',	'2',	'4',	'2023-04-09 00:11:25',	'2023-04-09 00:11:25',	1,	4,	90,	6),
('a1f94fedc7a7ad0bb8a6a7e2ac70b824',	'Matemática I',	'330af61409dbc8179f69b02524e55e86',	'MAT1-T',	'2',	'4',	'2023-04-08 23:18:16',	'2023-04-08 23:18:16',	3,	2,	90,	8),
('a36a2a7777b8568cc2abf40fa051334c',	'Fotografía Artística I',	'd7b0ab4b8ac2a58baf753937c623e811',	'FOA1-AC',	'4',	'4',	'2023-04-08 23:59:08',	'2023-04-08 23:59:28',	1,	4,	90,	18),
('a50217533a52bd273913f66cb240d7ea',	'Expresión Oral y Escrita del Español',	'd7b23ca8e68d029d2bc5b99878f85f06',	'EXOE-I',	'2',	'4',	'2023-04-08 22:19:33',	'2023-04-08 22:21:42',	2,	3,	90,	7),
('a99d4d944321bdc6cf1c76bd8c1f4f47',	'Psicología General',	'd7b23ca8e68d029d2bc5b99878f85f06',	'PSIG-P',	'1',	'4',	'2023-04-08 22:12:19',	'2023-04-08 22:12:19',	3,	2,	90,	2),
('ab4954258a2d2aa62fb8649a29b872f3',	'Sociología de la Comunicación',	'd7b23ca8e68d029d2bc5b99878f85f06',	'SOCC-P',	'3',	'4',	'2023-04-08 22:27:44',	'2023-04-08 22:27:44',	3,	2,	90,	11),
('ac4b6e82b0567f49d24f5c094e8b9c08',	'Métodos de Investigación',	'6ab029ee825537bfecfbec1cc7d02347',	'METI-N',	'2',	'4',	'2023-04-08 18:13:47',	'2023-04-08 21:39:54',	3,	2,	90,	5),
('adaeb797ac05241af8d75ab522e1eae1',	'Métodos de Programación II',	'e98387ab2b01ce88f1bfcb68c1a532cb',	'MET2-T',	'3',	'4',	'2023-04-08 22:52:19',	'2023-04-08 22:55:49',	2,	3,	90,	11),
('af667afdaa2dd97652b790f28f877ac5',	'Matemática III',	'330af61409dbc8179f69b02524e55e86',	'MAT3-T',	'4',	'4',	'2023-04-08 23:32:08',	'2023-04-08 23:32:08',	3,	2,	90,	16),
('b17d95c245825bf7fa0d8f744de0fff3',	'Derecho Civil I (Bienes)',	'6ab029ee825537bfecfbec1cc7d02347',	'DEC1-D',	'3',	'4',	'2023-04-08 21:55:49',	'2023-04-08 21:55:49',	3,	2,	90,	12),
('b60747943614814118f3df94fb9dcc76',	'Psicología de la Comunicación',	'd7b23ca8e68d029d2bc5b99878f85f06',	'PSCC-P',	'2',	'4',	'2023-04-08 22:18:55',	'2023-04-08 22:21:42',	3,	2,	90,	6),
('b89fd9be05a8d8931bb370d23e08d99e',	'Seminario Taller de Competencias',	'6ab029ee825537bfecfbec1cc7d02347',	'STCD-D',	'1',	'4',	'2023-04-08 18:02:23',	'2023-04-08 21:39:54',	3,	2,	90,	2),
('bd1c743094c66ae25254b2546a737a5a',	'Fotografía Artística',	'b0849f5b5fb7ab62389b297bedfcb6cf',	'FOAR-AC',	'2',	'4',	'2023-04-09 00:14:18',	'2023-04-09 00:14:18',	1,	4,	90,	9),
('c03fbfda0476242a6afb97bbbaae00b3',	'Derecho Procesal Penal I',	'6ab029ee825537bfecfbec1cc7d02347',	'DPP1-D',	'4',	'4',	'2023-04-08 21:59:53',	'2023-04-08 22:03:30',	1,	4,	90,	16),
('c47e632630d761fb14173f53c463a452',	'Bachiller',	'2d8ad8432607c180fa6744a18889100c',	'BA',	'0',	'0',	'2023-04-08 17:58:57',	'2023-04-08 17:58:57',	0,	0,	0,	0),
('c48d20e3e1727bfc09554ab441b97f96',	'Dibujo Técnico',	'330af61409dbc8179f69b02524e55e86',	'DIBT-Q',	'1',	'4',	'2023-04-08 23:10:22',	'2023-04-08 23:10:22',	2,	3,	90,	1),
('c5348dac96b73453543f477a49f2fa84',	'Ética',	'330af61409dbc8179f69b02524e55e86',	'ETIC-A',	'2',	'4',	'2023-04-08 23:18:59',	'2023-04-08 23:18:59',	3,	2,	90,	9),
('cb00ad258dea962128f9af8011ff41af',	'Inglés I',	'b0849f5b5fb7ab62389b297bedfcb6cf',	'ING1-I',	'3',	'4',	'2023-04-09 00:19:17',	'2023-04-09 00:19:17',	3,	2,	90,	14),
('cb208cdb240e9d6931560fe0641f281b',	'Tecnología Digital III',	'b0849f5b5fb7ab62389b297bedfcb6cf',	'TED3-AC',	'3',	'4',	'2023-04-09 00:15:55',	'2023-04-09 00:15:55',	1,	4,	90,	11),
('cb71671184ca472296193e9b3d4a3e1c',	'Física I',	'330af61409dbc8179f69b02524e55e86',	'FIS1-T',	'3',	'4',	'2023-04-08 23:20:57',	'2023-04-08 23:20:57',	3,	2,	90,	11),
('cca06513bb40b5dfdc431df857cc5765',	'Teoría del Estado',	'6ab029ee825537bfecfbec1cc7d02347',	'TEES-D',	'1',	'4',	'2023-04-08 18:02:43',	'2023-04-08 21:39:54',	3,	2,	90,	3),
('d3250755f1061725dd935c00dd464434',	'Matemática II',	'e98387ab2b01ce88f1bfcb68c1a532cb',	'MD2-T',	'2',	'4',	'2023-04-08 22:49:09',	'2023-04-08 22:56:24',	3,	2,	90,	9),
('d51ce704d58b99f21c07eca2b8ddeb15',	'Técnicas Serigráficas',	'b0849f5b5fb7ab62389b297bedfcb6cf',	'TESE-AC',	'4',	'4',	'2023-04-09 00:21:50',	'2023-04-09 00:21:50',	2,	3,	90,	17),
('d8ee39215c1f96ab0337d933a30f7659',	'Redes de Datos II',	'e98387ab2b01ce88f1bfcb68c1a532cb',	'BAS2-T',	'4',	'4',	'2023-04-08 23:03:33',	'2023-04-08 23:03:46',	2,	3,	90,	17),
('dab2a41e1261588598e92d2c13ae705b',	'Base de Datos I',	'e98387ab2b01ce88f1bfcb68c1a532cb',	'BAS1-T',	'3',	'4',	'2023-04-08 22:58:55',	'2023-04-08 22:58:55',	2,	3,	90,	13),
('dea13b3d60b6524d7aff57ee5e51719f',	'Tecnología Digital III',	'd7b0ab4b8ac2a58baf753937c623e811',	'TED3-AC',	'3',	'4',	'2023-04-08 23:50:01',	'2023-04-08 23:50:01',	1,	4,	90,	12),
('e0e0873b2ac0668573d27ff404cdc839',	'Filosofía',	'd7b23ca8e68d029d2bc5b99878f85f06',	'FILO-A',	'3',	'4',	'2023-04-08 22:22:10',	'2023-04-08 22:22:10',	3,	2,	90,	10),
('e693f34259ac041d012ae6824f38a36e',	'Matemática I',	'd7b0ab4b8ac2a58baf753937c623e811',	'MAT1-T',	'2',	'4',	'2023-04-08 23:47:51',	'2023-04-08 23:47:51',	2,	3,	90,	10),
('ea89847dd5c6751726708d9d5cc49b64',	'Realidad Nacional',	'd7b23ca8e68d029d2bc5b99878f85f06',	'REA-A',	'1',	'4',	'2023-04-08 22:11:07',	'2023-04-08 22:16:43',	2,	3,	90,	1),
('ea8c4436ba683e520a1c3073e860d383',	'Pensamiento Lógico',	'd7b0ab4b8ac2a58baf753937c623e811',	'PELG-AC',	'2',	'4',	'2023-04-08 23:47:07',	'2023-04-08 23:47:07',	2,	3,	90,	9),
('eb4b7718649718aefc5188b0ba716e09',	'Derecho Civil II (Obligaciones)',	'6ab029ee825537bfecfbec1cc7d02347',	'DEC2-D',	'4',	'4',	'2023-04-08 22:01:56',	'2023-04-08 22:01:56',	3,	2,	90,	17),
('eb8c116d580ff1fa7025f90e10be0f58',	'Artes Gráficas I',	'd7b0ab4b8ac2a58baf753937c623e811',	'ARG1-AC',	'2',	'4',	'2023-04-08 23:42:19',	'2023-04-08 23:42:19',	1,	4,	90,	6),
('ebb3df96aa209eb24e84a630fd732185',	'Seminario Taller de Competencias',	'330af61409dbc8179f69b02524e55e86',	'SETA-P',	'1',	'4',	'2023-04-08 23:12:09',	'2023-04-08 23:12:09',	3,	2,	90,	3),
('edc58de1fc63950e8596cb72ae9cd187',	'Modelos de decisión',	'330af61409dbc8179f69b02524e55e86',	'MOD1-T',	'4',	'4',	'2023-04-08 23:24:29',	'2023-04-08 23:24:29',	3,	2,	90,	14),
('ef9d4c4c7e74a8ba8cec37ae4c00b139',	'Teoría de la Comunicación Gráfica',	'b0849f5b5fb7ab62389b297bedfcb6cf',	'TECG-AC',	'1',	'4',	'2023-04-09 00:07:18',	'2023-04-09 00:07:18',	3,	2,	90,	1),
('f08721ef326d796bd198f06fef853576',	'Técnicas de Oralidad',	'6ab029ee825537bfecfbec1cc7d02347',	'TECO-D',	'4',	'4',	'2023-04-08 22:04:16',	'2023-04-08 22:04:16',	3,	2,	90,	18),
('f260c0bfa5739943935d119202507415',	'Informática',	'd7b23ca8e68d029d2bc5b99878f85f06',	'INFO-T',	'4',	'4',	'2023-04-08 22:35:57',	'2023-04-08 22:35:57',	2,	3,	90,	17),
('f421312efab608f4fcdcb9074f3315e0',	'Taller de Diseño y Modelado',	'b0849f5b5fb7ab62389b297bedfcb6cf',	'TADI-AC',	'2',	'4',	'2023-04-09 00:10:24',	'2023-04-09 00:10:58',	1,	4,	90,	5),
('f4962c3c8a24cea8a30e328a6fb862b8',	'Historia del Diseño Gráfico',	'b0849f5b5fb7ab62389b297bedfcb6cf',	'HIDI-AC',	'2',	'4',	'2023-04-09 00:12:49',	'2023-04-09 00:12:49',	2,	3,	90,	8),
('fdcaa6c9fb442712caf383aa5dab8ef1',	'Derecho Penal II',	'6ab029ee825537bfecfbec1cc7d02347',	'DEP2-D',	'3',	'4',	'2023-04-08 21:54:35',	'2023-04-08 21:54:35',	3,	2,	90,	11),
('fe7912cadf766fe18db41904da8eb3df',	'Tecnología Digital I',	'b0849f5b5fb7ab62389b297bedfcb6cf',	'TED1-AC',	'1',	'4',	'2023-04-09 00:07:56',	'2023-04-09 00:07:56',	1,	4,	90,	2),
('fe91d11253e1bc6c12213aac0bd8ab1c',	'Programación Web I',	'e98387ab2b01ce88f1bfcb68c1a532cb',	'DPWEB-I',	'4',	'4',	'2023-04-08 23:06:02',	'2023-04-08 23:06:02',	2,	3,	90,	19),
('ff052f92a905150c455dc4107f9d7422',	'Historia del Diseño Gráfico',	'd7b0ab4b8ac2a58baf753937c623e811',	'HIDI-AC',	'4',	'4',	'2023-04-09 00:04:47',	'2023-04-09 00:04:47',	3,	2,	90,	20);

DROP TABLE IF EXISTS `tbl_relmaterias`;
CREATE TABLE `tbl_relmaterias` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT,
  `r_materia_base` varchar(120) NOT NULL DEFAULT '',
  `r_relmateria` varchar(120) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`r_id`,`r_materia_base`),
  KEY `fk_relmat` (`r_relmateria`),
  CONSTRAINT `fk_relmat` FOREIGN KEY (`r_relmateria`) REFERENCES `tbl_materias` (`m_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `tbl_relmaterias` (`r_id`, `r_materia_base`, `r_relmateria`, `created_at`, `updated_at`) VALUES
(1,	'319747f9827bfd0bd79c473dccd71ae4',	'c47e632630d761fb14173f53c463a452',	'2023-04-08 18:08:43',	'2023-04-08 18:08:43'),
(2,	'b89fd9be05a8d8931bb370d23e08d99e',	'c47e632630d761fb14173f53c463a452',	'2023-04-08 18:08:47',	'2023-04-08 18:11:01'),
(3,	'cca06513bb40b5dfdc431df857cc5765',	'c47e632630d761fb14173f53c463a452',	'2023-04-08 18:11:15',	'2023-04-08 18:11:15'),
(4,	'85ac40a707f102b804c82a885fc21616',	'c47e632630d761fb14173f53c463a452',	'2023-04-08 18:11:28',	'2023-04-08 18:11:28'),
(5,	'ac4b6e82b0567f49d24f5c094e8b9c08',	'c47e632630d761fb14173f53c463a452',	'2023-04-08 21:45:01',	'2023-04-08 21:45:01'),
(6,	'9df270564208e11b9fbdc4197ed34283',	'85ac40a707f102b804c82a885fc21616',	'2023-04-08 21:45:33',	'2023-04-08 21:45:33'),
(7,	'076a9abbf7ba30e27ed2b664050e8d22',	'85ac40a707f102b804c82a885fc21616',	'2023-04-08 21:46:10',	'2023-04-08 21:46:10'),
(8,	'0e785b00fb6da7f77c643bc4e089edfc',	'85ac40a707f102b804c82a885fc21616',	'2023-04-08 21:46:25',	'2023-04-08 21:46:25'),
(9,	'8c1e12d655d82b48fb65f4d9ebb472db',	'cca06513bb40b5dfdc431df857cc5765',	'2023-04-08 21:48:29',	'2023-04-08 21:48:29'),
(10,	'6d84e69bca8c41929d03c5f92c871d37',	'c47e632630d761fb14173f53c463a452',	'2023-04-08 21:53:55',	'2023-04-08 21:53:55'),
(11,	'fdcaa6c9fb442712caf383aa5dab8ef1',	'9df270564208e11b9fbdc4197ed34283',	'2023-04-08 21:55:08',	'2023-04-08 21:55:08'),
(12,	'b17d95c245825bf7fa0d8f744de0fff3',	'0e785b00fb6da7f77c643bc4e089edfc',	'2023-04-08 21:56:20',	'2023-04-08 21:56:20'),
(13,	'180c2cd0ccb15632b078b71f6f596d14',	'c47e632630d761fb14173f53c463a452',	'2023-04-08 21:57:09',	'2023-04-08 21:57:09'),
(14,	'806e0988b86a0834d28f121af175b2c2',	'076a9abbf7ba30e27ed2b664050e8d22',	'2023-04-08 21:58:08',	'2023-04-08 21:58:08'),
(15,	'806e0988b86a0834d28f121af175b2c2',	'8c1e12d655d82b48fb65f4d9ebb472db',	'2023-04-08 21:58:20',	'2023-04-08 21:58:20'),
(16,	'33836ce8d215d4423a6af8738319f418',	'c47e632630d761fb14173f53c463a452',	'2023-04-08 21:59:18',	'2023-04-08 21:59:18'),
(17,	'c03fbfda0476242a6afb97bbbaae00b3',	'076a9abbf7ba30e27ed2b664050e8d22',	'2023-04-08 22:00:34',	'2023-04-08 22:00:34'),
(18,	'c03fbfda0476242a6afb97bbbaae00b3',	'fdcaa6c9fb442712caf383aa5dab8ef1',	'2023-04-08 22:00:55',	'2023-04-08 22:00:55'),
(19,	'eb4b7718649718aefc5188b0ba716e09',	'b17d95c245825bf7fa0d8f744de0fff3',	'2023-04-08 22:02:31',	'2023-04-08 22:02:31'),
(20,	'f08721ef326d796bd198f06fef853576',	'076a9abbf7ba30e27ed2b664050e8d22',	'2023-04-08 22:04:40',	'2023-04-08 22:04:40'),
(21,	'f08721ef326d796bd198f06fef853576',	'180c2cd0ccb15632b078b71f6f596d14',	'2023-04-08 22:04:51',	'2023-04-08 22:04:51'),
(22,	'09f12ccbc6256d4bef04300aa1ddcc37',	'806e0988b86a0834d28f121af175b2c2',	'2023-04-08 22:06:35',	'2023-04-08 22:06:35'),
(23,	'ea89847dd5c6751726708d9d5cc49b64',	'c47e632630d761fb14173f53c463a452',	'2023-04-08 22:11:51',	'2023-04-08 22:11:51'),
(24,	'a99d4d944321bdc6cf1c76bd8c1f4f47',	'c47e632630d761fb14173f53c463a452',	'2023-04-08 22:12:54',	'2023-04-08 22:12:54'),
(25,	'15e8f2a0861fe16056ec63d4edc63026',	'c47e632630d761fb14173f53c463a452',	'2023-04-08 22:13:44',	'2023-04-08 22:13:44'),
(26,	'153e5b74d920f641272a8188bd6af2c3',	'c47e632630d761fb14173f53c463a452',	'2023-04-08 22:17:21',	'2023-04-08 22:17:21'),
(27,	'9f60b6145dcbdfe6067178a12f051c2f',	'c47e632630d761fb14173f53c463a452',	'2023-04-08 22:23:38',	'2023-04-08 22:23:38'),
(28,	'b60747943614814118f3df94fb9dcc76',	'a99d4d944321bdc6cf1c76bd8c1f4f47',	'2023-04-08 22:24:28',	'2023-04-08 22:24:28'),
(29,	'a50217533a52bd273913f66cb240d7ea',	'c47e632630d761fb14173f53c463a452',	'2023-04-08 22:24:55',	'2023-04-08 22:24:55'),
(30,	'104d89b321e95a048633b756804bbffb',	'c47e632630d761fb14173f53c463a452',	'2023-04-08 22:25:34',	'2023-04-08 22:25:34'),
(31,	'0847b81d4bcbc20cee3b5d445014ed97',	'15e8f2a0861fe16056ec63d4edc63026',	'2023-04-08 22:25:56',	'2023-04-08 22:25:56'),
(33,	'e0e0873b2ac0668573d27ff404cdc839',	'c47e632630d761fb14173f53c463a452',	'2023-04-08 22:26:46',	'2023-04-08 22:26:46'),
(35,	'ab4954258a2d2aa62fb8649a29b872f3',	'ab4954258a2d2aa62fb8649a29b872f3',	'2023-04-08 22:28:19',	'2023-04-08 22:28:19'),
(36,	'4e331b7a09706beda07ce05698757e81',	'a50217533a52bd273913f66cb240d7ea',	'2023-04-08 22:29:08',	'2023-04-08 22:29:08'),
(37,	'14f367304ae121626826ea3f1df3c15c',	'0847b81d4bcbc20cee3b5d445014ed97',	'2023-04-08 22:30:15',	'2023-04-08 22:30:15'),
(38,	'4ea92e59fa8001d134297a537c9b4952',	'c47e632630d761fb14173f53c463a452',	'2023-04-08 22:31:44',	'2023-04-08 22:31:44'),
(39,	'8b60a08bb09866d03ade1aa9d967e2bc',	'e0e0873b2ac0668573d27ff404cdc839',	'2023-04-08 22:33:32',	'2023-04-08 22:33:32'),
(40,	'8189a64350b8576a2b8f9d2c5db1d963',	'4e331b7a09706beda07ce05698757e81',	'2023-04-08 22:35:03',	'2023-04-08 22:35:03'),
(41,	'f260c0bfa5739943935d119202507415',	'c47e632630d761fb14173f53c463a452',	'2023-04-08 22:36:17',	'2023-04-08 22:36:17'),
(42,	'520aeac270895bbca783fa8bcc824f17',	'c47e632630d761fb14173f53c463a452',	'2023-04-08 22:36:59',	'2023-04-08 22:36:59'),
(43,	'6406ef988df9df808ee81e11c78f406b',	'4ea92e59fa8001d134297a537c9b4952',	'2023-04-08 22:37:48',	'2023-04-08 22:37:48'),
(44,	'92fd84d2ca6929b583567ebbaee9d907',	'c47e632630d761fb14173f53c463a452',	'2023-04-08 22:41:34',	'2023-04-08 22:41:34'),
(45,	'7ed747ef07ead7a7502b738f6a6b555e',	'c47e632630d761fb14173f53c463a452',	'2023-04-08 22:42:17',	'2023-04-08 22:42:17'),
(46,	'88880ebd99628de8e81a04b9a51f5bde',	'c47e632630d761fb14173f53c463a452',	'2023-04-08 22:43:02',	'2023-04-08 22:43:02'),
(47,	'0c27f45cc53c7a919229430bc891f71a',	'c47e632630d761fb14173f53c463a452',	'2023-04-08 22:43:37',	'2023-04-08 22:43:37'),
(48,	'2ea9ef641dfb2ae814998291915bf000',	'92fd84d2ca6929b583567ebbaee9d907',	'2023-04-08 22:44:30',	'2023-04-08 22:44:30'),
(50,	'8c937715dd866409341be10fd9ae76cf',	'92fd84d2ca6929b583567ebbaee9d907',	'2023-04-08 22:46:40',	'2023-04-08 22:46:40'),
(51,	'676e8cf800fac638bc8efcffb41eff2c',	'88880ebd99628de8e81a04b9a51f5bde',	'2023-04-08 22:47:30',	'2023-04-08 22:47:30'),
(52,	'52c3b2b985baf33d701961e4bce4ae91',	'92fd84d2ca6929b583567ebbaee9d907',	'2023-04-08 22:48:32',	'2023-04-08 22:48:32'),
(53,	'd3250755f1061725dd935c00dd464434',	'88880ebd99628de8e81a04b9a51f5bde',	'2023-04-08 22:49:27',	'2023-04-08 22:49:27'),
(54,	'04f2666b08101688eb1bd7a7462f332f',	'2ea9ef641dfb2ae814998291915bf000',	'2023-04-08 22:51:30',	'2023-04-08 22:51:30'),
(55,	'04f2666b08101688eb1bd7a7462f332f',	'8c937715dd866409341be10fd9ae76cf',	'2023-04-08 22:51:41',	'2023-04-08 22:51:41'),
(56,	'adaeb797ac05241af8d75ab522e1eae1',	'8c937715dd866409341be10fd9ae76cf',	'2023-04-08 22:53:10',	'2023-04-08 22:54:06'),
(57,	'adaeb797ac05241af8d75ab522e1eae1',	'52c3b2b985baf33d701961e4bce4ae91',	'2023-04-08 22:54:35',	'2023-04-08 22:54:35'),
(58,	'1e188294c3e609b49fd997d2acbe2ecb',	'8c937715dd866409341be10fd9ae76cf',	'2023-04-08 22:58:22',	'2023-04-08 22:58:22'),
(59,	'dab2a41e1261588598e92d2c13ae705b',	'52c3b2b985baf33d701961e4bce4ae91',	'2023-04-08 22:59:24',	'2023-04-08 22:59:24'),
(60,	'47d1370206decd2648a40bff74a07eef',	'c47e632630d761fb14173f53c463a452',	'2023-04-08 23:00:13',	'2023-04-08 23:00:13'),
(61,	'79314437cc97cb0e1a7fc15670c26bb7',	'04f2666b08101688eb1bd7a7462f332f',	'2023-04-08 23:01:14',	'2023-04-08 23:01:14'),
(62,	'79314437cc97cb0e1a7fc15670c26bb7',	'dab2a41e1261588598e92d2c13ae705b',	'2023-04-08 23:01:31',	'2023-04-08 23:01:31'),
(63,	'96b31a6a49e4c4ea058ca1be2301c39a',	'7ed747ef07ead7a7502b738f6a6b555e',	'2023-04-08 23:02:42',	'2023-04-08 23:02:42'),
(64,	'96b31a6a49e4c4ea058ca1be2301c39a',	'96b31a6a49e4c4ea058ca1be2301c39a',	'2023-04-08 23:02:53',	'2023-04-08 23:02:53'),
(65,	'd8ee39215c1f96ab0337d933a30f7659',	'1e188294c3e609b49fd997d2acbe2ecb',	'2023-04-08 23:03:59',	'2023-04-08 23:03:59'),
(66,	'd8ee39215c1f96ab0337d933a30f7659',	'dab2a41e1261588598e92d2c13ae705b',	'2023-04-08 23:04:10',	'2023-04-08 23:04:10'),
(67,	'4ed8c92d957899922bf57ec3963ed69d',	'd3250755f1061725dd935c00dd464434',	'2023-04-08 23:05:20',	'2023-04-08 23:05:20'),
(69,	'fe91d11253e1bc6c12213aac0bd8ab1c',	'1e188294c3e609b49fd997d2acbe2ecb',	'2023-04-08 23:06:32',	'2023-04-08 23:06:32'),
(70,	'c48d20e3e1727bfc09554ab441b97f96',	'c47e632630d761fb14173f53c463a452',	'2023-04-08 23:10:37',	'2023-04-08 23:10:37'),
(71,	'70f21cebef8b0f89cd67276a88c870b6',	'c47e632630d761fb14173f53c463a452',	'2023-04-08 23:11:40',	'2023-04-08 23:11:40'),
(72,	'ebb3df96aa209eb24e84a630fd732185',	'c47e632630d761fb14173f53c463a452',	'2023-04-08 23:12:22',	'2023-04-08 23:12:22'),
(73,	'2546cc3f849640536c364fe5e8565ead',	'c47e632630d761fb14173f53c463a452',	'2023-04-08 23:12:55',	'2023-04-08 23:12:55'),
(74,	'5103622b644d076a19c2dab90e09ce80',	'c47e632630d761fb14173f53c463a452',	'2023-04-08 23:13:48',	'2023-04-08 23:13:48'),
(75,	'53018bd92cc510cd7ef7f21172e71a40',	'c48d20e3e1727bfc09554ab441b97f96',	'2023-04-08 23:16:34',	'2023-04-08 23:16:34'),
(76,	'662595e7d57c23c768a2d85b53ec7486',	'c47e632630d761fb14173f53c463a452',	'2023-04-08 23:17:46',	'2023-04-08 23:17:46'),
(77,	'a1f94fedc7a7ad0bb8a6a7e2ac70b824',	'ebb3df96aa209eb24e84a630fd732185',	'2023-04-08 23:18:38',	'2023-04-08 23:18:38'),
(78,	'c5348dac96b73453543f477a49f2fa84',	'c47e632630d761fb14173f53c463a452',	'2023-04-08 23:19:17',	'2023-04-08 23:19:17'),
(79,	'44efd75d672e6cbcf666c21f1dfa5b92',	'53018bd92cc510cd7ef7f21172e71a40',	'2023-04-08 23:20:31',	'2023-04-08 23:20:31'),
(80,	'cb71671184ca472296193e9b3d4a3e1c',	'a1f94fedc7a7ad0bb8a6a7e2ac70b824',	'2023-04-08 23:21:16',	'2023-04-08 23:21:16'),
(81,	'4bb596ef18ce52f75dbb34a2f2dd9990',	'a1f94fedc7a7ad0bb8a6a7e2ac70b824',	'2023-04-08 23:22:01',	'2023-04-08 23:22:01'),
(82,	'4e272d721e64f172986302e22fd5984e',	'c47e632630d761fb14173f53c463a452',	'2023-04-08 23:22:45',	'2023-04-08 23:22:45'),
(83,	'edc58de1fc63950e8596cb72ae9cd187',	'44efd75d672e6cbcf666c21f1dfa5b92',	'2023-04-08 23:30:14',	'2023-04-08 23:30:14'),
(84,	'875203418d6d612e96eb2dd442f91caf',	'cb71671184ca472296193e9b3d4a3e1c',	'2023-04-08 23:30:59',	'2023-04-08 23:30:59'),
(86,	'af667afdaa2dd97652b790f28f877ac5',	'4bb596ef18ce52f75dbb34a2f2dd9990',	'2023-04-08 23:32:30',	'2023-04-08 23:32:30'),
(87,	'94944c961baa48f69d34060d48bec894',	'4e272d721e64f172986302e22fd5984e',	'2023-04-08 23:33:22',	'2023-04-08 23:33:22'),
(88,	'79f3c916cd3a7b30ff43d96f9ae5d0a7',	'4bb596ef18ce52f75dbb34a2f2dd9990',	'2023-04-08 23:34:21',	'2023-04-08 23:34:21'),
(89,	'88d6c1b6335a7e39cfa696495d31083f',	'c47e632630d761fb14173f53c463a452',	'2023-04-08 23:38:51',	'2023-04-08 23:38:51'),
(90,	'60165a0f97880e8878839d2e18642009',	'c47e632630d761fb14173f53c463a452',	'2023-04-08 23:39:33',	'2023-04-08 23:39:33'),
(91,	'8520a7850bc940efb78754b4a6347ed0',	'c47e632630d761fb14173f53c463a452',	'2023-04-08 23:40:14',	'2023-04-08 23:40:14'),
(92,	'14007094f8928132b07f5d450492fff7',	'c47e632630d761fb14173f53c463a452',	'2023-04-08 23:40:58',	'2023-04-08 23:40:58'),
(93,	'87ba80ecf6344f9f04fde829ff2b6f69',	'c47e632630d761fb14173f53c463a452',	'2023-04-08 23:41:34',	'2023-04-08 23:41:34'),
(95,	'eb8c116d580ff1fa7025f90e10be0f58',	'88d6c1b6335a7e39cfa696495d31083f',	'2023-04-08 23:42:36',	'2023-04-08 23:42:36'),
(96,	'184575c50e74a2f89244acc60edb60b1',	'60165a0f97880e8878839d2e18642009',	'2023-04-08 23:45:33',	'2023-04-08 23:45:33'),
(97,	'953594ea0c3a9cd479a2a78b4cab8239',	'8520a7850bc940efb78754b4a6347ed0',	'2023-04-08 23:46:26',	'2023-04-08 23:46:26'),
(98,	'ea8c4436ba683e520a1c3073e860d383',	'87ba80ecf6344f9f04fde829ff2b6f69',	'2023-04-08 23:47:26',	'2023-04-08 23:47:26'),
(99,	'e693f34259ac041d012ae6824f38a36e',	'87ba80ecf6344f9f04fde829ff2b6f69',	'2023-04-08 23:48:08',	'2023-04-08 23:48:08'),
(100,	'36a0d7019782f120b6c26caf4d3af52c',	'eb8c116d580ff1fa7025f90e10be0f58',	'2023-04-08 23:49:35',	'2023-04-08 23:49:35'),
(101,	'dea13b3d60b6524d7aff57ee5e51719f',	'184575c50e74a2f89244acc60edb60b1',	'2023-04-08 23:50:23',	'2023-04-08 23:50:23'),
(102,	'186956e0211f9bcf3f71d72dd819f3a7',	'953594ea0c3a9cd479a2a78b4cab8239',	'2023-04-08 23:51:29',	'2023-04-08 23:51:29'),
(103,	'745c0b589daba353cabede2f311dc9dc',	'ea8c4436ba683e520a1c3073e860d383',	'2023-04-08 23:52:44',	'2023-04-08 23:52:44'),
(104,	'717eb23a6af4b3a2a0472619dbbc1e07',	'c47e632630d761fb14173f53c463a452',	'2023-04-08 23:53:28',	'2023-04-08 23:53:28'),
(105,	'04d1fd97f38208897c52738d9085b324',	'36a0d7019782f120b6c26caf4d3af52c',	'2023-04-08 23:55:00',	'2023-04-08 23:55:00'),
(106,	'7513f72a30547248611f6a4358b09ace',	'dea13b3d60b6524d7aff57ee5e51719f',	'2023-04-08 23:58:40',	'2023-04-08 23:58:40'),
(107,	'a36a2a7777b8568cc2abf40fa051334c',	'184575c50e74a2f89244acc60edb60b1',	'2023-04-08 23:59:43',	'2023-04-08 23:59:43'),
(108,	'22ad1e6d165e6f0ce247447df015a6bb',	'745c0b589daba353cabede2f311dc9dc',	'2023-04-09 00:00:53',	'2023-04-09 00:00:53'),
(109,	'ff052f92a905150c455dc4107f9d7422',	'717eb23a6af4b3a2a0472619dbbc1e07',	'2023-04-09 00:05:14',	'2023-04-09 00:05:14'),
(110,	'ef9d4c4c7e74a8ba8cec37ae4c00b139',	'c47e632630d761fb14173f53c463a452',	'2023-04-09 00:07:35',	'2023-04-09 00:07:35'),
(111,	'fe7912cadf766fe18db41904da8eb3df',	'c47e632630d761fb14173f53c463a452',	'2023-04-09 00:08:13',	'2023-04-09 00:08:13'),
(112,	'018e183c78ef4e6a9c5c3f0891192594',	'c47e632630d761fb14173f53c463a452',	'2023-04-09 00:08:48',	'2023-04-09 00:08:48'),
(113,	'3fcdf21977562578fc7c90372e167dc6',	'c47e632630d761fb14173f53c463a452',	'2023-04-09 00:09:35',	'2023-04-09 00:09:35'),
(114,	'f421312efab608f4fcdcb9074f3315e0',	'ef9d4c4c7e74a8ba8cec37ae4c00b139',	'2023-04-09 00:10:46',	'2023-04-09 00:10:46'),
(115,	'9f96123bb05187c2705a9f690f40b62c',	'fe7912cadf766fe18db41904da8eb3df',	'2023-04-09 00:11:42',	'2023-04-09 00:11:42'),
(116,	'6f6f2c95adc2a5c5a280765b4437953b',	'018e183c78ef4e6a9c5c3f0891192594',	'2023-04-09 00:12:26',	'2023-04-09 00:12:26'),
(117,	'f4962c3c8a24cea8a30e328a6fb862b8',	'3fcdf21977562578fc7c90372e167dc6',	'2023-04-09 00:13:10',	'2023-04-09 00:13:10'),
(118,	'bd1c743094c66ae25254b2546a737a5a',	'fe7912cadf766fe18db41904da8eb3df',	'2023-04-09 00:14:39',	'2023-04-09 00:14:39'),
(119,	'5ff323c120bb74140779b8cf74645486',	'f421312efab608f4fcdcb9074f3315e0',	'2023-04-09 00:15:29',	'2023-04-09 00:15:29'),
(120,	'cb208cdb240e9d6931560fe0641f281b',	'9f96123bb05187c2705a9f690f40b62c',	'2023-04-09 00:16:36',	'2023-04-09 00:16:36'),
(121,	'8917510b14791cb433009582872a4f10',	'6f6f2c95adc2a5c5a280765b4437953b',	'2023-04-09 00:17:26',	'2023-04-09 00:17:26'),
(122,	'7d951e4bf38a44d5ccd3793b8e198f70',	'f421312efab608f4fcdcb9074f3315e0',	'2023-04-09 00:18:34',	'2023-04-09 00:18:34'),
(123,	'cb00ad258dea962128f9af8011ff41af',	'c47e632630d761fb14173f53c463a452',	'2023-04-09 00:19:35',	'2023-04-09 00:19:35'),
(124,	'39a0fdb85b11328773ee35ed19185a5c',	'5ff323c120bb74140779b8cf74645486',	'2023-04-09 00:20:26',	'2023-04-09 00:20:26'),
(125,	'288a0cb4cfc8c5c526b1b4136bd21db6',	'cb208cdb240e9d6931560fe0641f281b',	'2023-04-09 00:21:23',	'2023-04-09 00:21:23'),
(126,	'd51ce704d58b99f21c07eca2b8ddeb15',	'8917510b14791cb433009582872a4f10',	'2023-04-09 00:22:11',	'2023-04-09 00:22:11'),
(127,	'32008e9bd010744f4afa3144e6584c98',	'7d951e4bf38a44d5ccd3793b8e198f70',	'2023-04-09 00:23:20',	'2023-04-09 00:23:20'),
(128,	'2d4ef57dabe60ad4fab39fe19624015f',	'c47e632630d761fb14173f53c463a452',	'2023-04-09 00:24:09',	'2023-04-09 00:24:09');



DROP TABLE IF EXISTS `tbl_notas`;
CREATE TABLE `tbl_notas` (
  `n_id` varchar(120) NOT NULL DEFAULT '',
  `n_user` varchar(120) DEFAULT NULL,
  `n_materiaid` varchar(120) DEFAULT NULL,
  `n_nota` varchar(4) DEFAULT '0.00',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`n_id`),
  KEY `fk_muserid` (`n_user`),
  KEY `fk_matid` (`n_materiaid`),
  CONSTRAINT `fk_matid` FOREIGN KEY (`n_materiaid`) REFERENCES `tbl_materias` (`m_id`),
  CONSTRAINT `fk_muserid` FOREIGN KEY (`n_user`) REFERENCES `tbl_users` (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



-- 2023-04-11 01:01:07
