-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 17-07-2021 a las 17:42:52
-- Versión del servidor: 8.0.21
-- Versión de PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tocornal`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administradores`
--

DROP TABLE IF EXISTS `administradores`;
CREATE TABLE IF NOT EXISTS `administradores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `usuario` varchar(30) NOT NULL DEFAULT '',
  `contrasena` varchar(30) NOT NULL DEFAULT '',
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `administradores`
--

INSERT INTO `administradores` (`id`, `nombre`, `email`, `usuario`, `contrasena`) VALUES
(2, 'jorge', 'jserrano@gmail.com', 'jserrano', '123abc'),
(4, 'admin_temporal', 'admin_temporal@gmail.com', 'admin', 'admin'),
(6, 'enzo torre', 'etorre@gmail.com', 'tenzo', '12345'),
(7, 'nicoles jimenez', 'njimenez@gmail.com', 'njimenez', '12345');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `telefono` varchar(9) NOT NULL,
  `usuario` varchar(30) NOT NULL DEFAULT '',
  `contrasena` varchar(20) NOT NULL DEFAULT '',
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `email`, `telefono`, `usuario`, `contrasena`) VALUES
(15, 'jorge', 'prueba@gmail.com', '+56978653', 'prueba', 'prueba02'),
(16, 'locaenzo', 'locaenzo@gmail.com', '+56987864', 'enzo21', 'abc123'),
(17, 'enzo torre', 'tenzo@gmail.com', '+56997864', 'tenzo', '12345');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

DROP TABLE IF EXISTS `compras`;
CREATE TABLE IF NOT EXISTS `compras` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cliente` varchar(100) NOT NULL DEFAULT '',
  `codigo` varchar(14) NOT NULL DEFAULT '',
  `nombre` varchar(50) NOT NULL DEFAULT '',
  `precio` float NOT NULL DEFAULT '0',
  `cantidad` int NOT NULL DEFAULT '0',
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`id`, `cliente`, `codigo`, `nombre`, `precio`, `cantidad`) VALUES
(80, '16', 'VIN01', 'Vino Carmen', 2580, 2),
(81, '16', 'WIS001', 'Wisky', 22000, 2),
(82, '', 'RON01', 'Ron Flor de Caña 50cc.', 5350, 2),
(85, '17', 'WIS01', 'Whisky Disaronno', 22000, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE IF NOT EXISTS `productos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) NOT NULL,
  `codigo` char(12) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `unidad` set('Unid','Pote','Paquete','Mata','Malla','Litro','Kilo','Cabeza','Bandeja de 20 und','Bandeja 250 gr','Bandeja 200 gr','Bandeja 100 gr','Bandeja','900 gr','875 gr','850 gr','6 Unid','500 gr','50 Unid','400 gr','370 cc','3 Unid','250 gr','200 gr','2 Kilo','2 Kg','100 gr','1/4 Kilo','1/2 Litro','1/2 Kilo Jumbo','1/2 Kilo') NOT NULL,
  `precio` float NOT NULL,
  `disponibilidad` enum('1','0') NOT NULL,
  `descripcion` mediumtext NOT NULL,
  `promocion` enum('Si','No') NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `id_2` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=249 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `codigo`, `categoria`, `unidad`, `precio`, `disponibilidad`, `descripcion`, `promocion`, `fecha`) VALUES
(214, 'Whisky Disaronno', 'WIS01', 'Whisky', '', 22000, '1', 'Fino Whisky de alta calidad', 'No', '2021-07-16 23:38:21'),
(215, 'Vino Carmen', 'VIN01', 'Vino', '', 2580, '1', 'Margaux Cabenet Sauvignon 14° 700cc.', '', '2021-07-17 01:33:03'),
(216, 'Vino Concha Y Toro', 'VIN02', 'Vino', '', 3500, '1', 'Vino de Exportación 700C', '', '2021-07-17 01:49:46'),
(217, 'Vino Santa Emiliana', 'VIN03', 'Vino', '', 3500, '1', 'SELECT TERROIR cc750', '', '2021-07-17 02:27:04'),
(218, 'Vino Santa Emiliana', 'VIN04', 'Vino', '', 3000, '1', 'Tinto de 750cc', '', '2021-07-17 02:34:36'),
(219, 'Vino Santa Ema ', 'VIN05', 'Vino', '', 2580, '1', 'Proviene de uvas seleccionadas del Valle del Maipo. De un color amarillo pajizo brillante y perfumados aromas a frutas cítricas y peras maduras. En boca es un vino fresco, de una equilibrada acidez y un delicioso final marcado por notas frutales.', 'No', '2021-07-17 02:50:41'),
(220, 'Sauvignon Blanc 750cc.', 'VIN06', 'Vino', '', 3690, '1', 'Vino color amarillo pajizo con matices verdosos. Ligeras flores blancas, notas de hierba verdes frescas, hinojo, algo de pimentón verde. Boca agradable, intensa, herbal, con notas cítricas. Firme en retrogusto.', 'No', '2021-07-17 03:00:42'),
(221, 'Vino Oveja Negra ', 'VIN07', 'Vino', '', 3990, '1', 'Vino expresivo en nariz, con aromas de berries, cerezas, especias y un toque de pimienta verde, todo agradablemente mezclado con suaves notas a madera.', 'No', '2021-07-17 03:18:49'),
(222, 'Vino Caliterra 750cc.', 'VIN08', 'Vino', '', 4550, '1', 'Rojo cereza levemente opaco. Aromas frutales maduros, de cereza y guinda, en un fondo suavemente tostado. Boca media, de acidez media, buen balance, algo amargo hacia el final.', 'No', '2021-07-17 03:22:27'),
(223, 'Whisky Jameson 750cc.', 'WIS02', 'Whisky', '', 20900, '1', 'Jameson es un whiskey irlandés mezclado, producido por primera vez en 1780. Originalmente uno de los cuatro whiskeys más importantes de Dublín, hoy en día es destilado en Cork, aunque la mezcla sigue llevándose a cabo en Dublín.', '', '2021-07-17 03:52:19'),
(224, 'Whisky Ballantine 750cc.', 'WIS03', 'Whisky', 'Unid', 9900, '1', 'Ballantine\'s es un whisky blended procedente de Escocia. Para la producción del whisky Ballantine\'s se emplean diferentes whiskies de malta y grano que proceden de las cuatro regiones de Escocia.', '', '2021-07-17 04:11:59'),
(225, 'Whisky Sandy Mc 750cc.', 'WIS04', 'Whisky', '', 7990, '1', 'De color dorado ámbar e intensos aromas, sorprende gratamente las notas frutales (banana y luego naranja) de este whisky. Acompañan toques a caramelo, roble, vainilla, mantequilla y miel.', '', '2021-07-17 04:21:34'),
(226, 'Cerveza Corona 710cc.', 'CER01', 'Cerveza', '', 1890, '1', 'La cerveza Corona es una marca mundialmente conocida, distribuida a lo largo de más de 159 países en los cinco continentes. También es la más vendida de todas las cervezas mexicanas exportadas del país mesoamericano.', '', '2021-07-17 04:33:05'),
(227, 'Cerveza Royal 355cc.', 'CER02', 'Cerveza', '', 1100, '1', 'Royal Guard nace en Chile en 1974 y por mucho tiempo fue la única cerveza Premium del país, reconocida por su calidad junto a su agradable y refinado sabor.', '', '2021-07-17 04:36:55'),
(228, 'Pack 12 Cerveza Kunstmann ', 'CER03', 'Cerveza', '', 33480, '1', 'Cerveza Gran Torobayo de  500cc agradable aroma que en boca deja una sensación liviana de fino ahumado. Gran color, gran aroma, gran sabor y gran cuerpo.', 'No', '2021-07-17 04:40:38'),
(229, 'Pack 12 Cerveza Mahou 330cc.', 'CER04', 'Cerveza', '', 6000, '1', 'Cerveza lager en (Lata) envejecida en barrica de roble.', '', '2021-07-17 04:43:51'),
(230, 'Ron Flor de Caña 50cc.', 'RON01', 'Ron', '', 5350, '1', 'Ron de cuerpo medio, ámbar-dorado, con un bouquet de vainilla. Excelente con sodas y agua mineral. También perfecto para ponches y Cócteles refrescantes. Ganador de mejor en su clase en 2005 en el International Wine & Spirits Competition de Londres', '', '2021-07-17 05:05:18'),
(231, 'Ron Barcelo dorado 750cc.', 'RON02', 'Ron', '', 5490, '1', 'Barceló Dorado es un ron suave, de color ámbar y aromas a nuez, fruta y madera. Premiado numerosas veces en competencias y festivales alrededor del mundo, su entrada a boca es redonda y profunda.', '', '2021-07-17 05:07:30'),
(232, 'Ron Bacardi Blanco 750cc.', 'RON03', 'Ron', '', 6290, '0', 'CONSUMO: ideal para el maridaje o solista de lujo ya que sus características singulares, entre las que destacamos el equilibrio y pureza de este ron; le permiten complementar en lugar de dominar como ningún otro ron.', '', '2021-07-17 05:11:12'),
(233, 'Ron Havana Añejo 700cc.', 'RON04', 'Ron', '', 6990, '1', 'Havana Club Añejo Especial es un ron dorado premium que combina la ligereza de los rones blancos y el potente aroma de los rones oscuros.', '', '2021-07-17 05:19:46'),
(234, 'Vodka PL 40° 700cc', 'VOD01', 'Vodka', '', 3650, '1', 'Vodka de origen Polaco.', '', '2021-07-17 05:24:28'),
(235, 'Vodka Wyborowa 750cc', 'VOD02', 'Vodka', '', 5590, '1', 'Es una de las marcas de vodka de Polonia , se obtiene por un proceso de triple destilación de granos de centeno con alambique de cobre, y con triple filtrado por celulosa y paño, mezclado con agua de pozo. \"Wyborowa\" se traduce como \"exquisito\",', '', '2021-07-17 05:26:49'),
(236, 'Vodka Stolichnaya Ruso 750cc.', 'VOD03', 'Vodka', '', 6590, '1', 'Stolichnaya Vodka es un vodka elaborado por la destilería Cristal, en Moscú, Rusia. Stolichnaya Vodka tiene sus orígenes en las tierras negras de la región rusa de Tambov, al sur de Moscú.', '', '2021-07-17 05:28:37'),
(237, 'Vodka Absolut Blue 750cc', 'VOD04', 'Vodka', '', 10.82, '1', 'De origen sueco. Fue introducido por el empresario Lars Olsson Smith, en 1879. Actualmente es la tercera bebida blanca detrás de Bacardí y Smirnoff, con mercado en más de 120 países, y de gran importancia en EE.UU., donde el 20% del vodka importado allí', '', '2021-07-17 05:32:57'),
(238, 'Pisco Campanario 35°', 'PIS01', 'Pisco', '', 4360, '1', 'Pisco rico en aromas frutales, de una tonalidad tostada y exquisito sabor, perfecto para ser tomado solo, en cócteles, con hielo o acompañado de bebidas de fantasía o jugos naturales', '', '2021-07-17 15:12:49'),
(239, 'Pisco Capel  750cc.', 'PIS02', 'Pisco', '', 4390, '1', 'Nace de la combinación de alcoholes doble destilado para lograr un pisco con gran carácter, elegante y complejo. Su color ámbar otorgado por la madera de roble americano sumado al exquisito aroma de nuestras finas uvas logran la armonía perfecta.', '', '2021-07-17 15:15:55'),
(240, 'Pisco Mistral 750cc.', 'PIS03', 'Pisco', '', 5990, '1', 'Es un pisco premium, elegante, en el cual resalta uno de sus atributos más importantes: Añejado en Barricas de Roble Americano. El tiempo en las barricas le otorga el característico color dorado, como también le aporta redondez y consistencia.', '', '2021-07-17 15:20:20'),
(241, 'Pisco Tres Erres 700cc.', 'PIS04', 'Pisco', '', 6390, '1', 'Pisco añejado en roble, es una excelente alternativa para preparar pisco sour o combinados. Su curioso nombre remite a las iniciales de su creador, Rigoberto Rodríguez Rodríguez.', '', '2021-07-17 15:24:16'),
(242, 'Bebida Sprite Des 3000cc.', 'beb01', 'Bebida', '', 2590, '1', 'Bebida Sprite Desechable 3 Lts.', '', '2021-07-17 15:30:30'),
(243, 'Bebida Fanta Des 3000cc.', 'beb02', 'Bebida', '', 2590, '1', 'Bebida Fanta Desechable 3 Lts.', '', '2021-07-17 15:32:09'),
(244, 'Bebida Canada Ginger 500cc.', 'BEB03', 'Bebida', '', 1490, '1', 'Bebida Canada Dry Ginger Ale', '', '2021-07-17 15:34:37'),
(245, 'Bebida Coca Cola Des 1500cc.', 'BEB04', 'Bebida', '', 1890, '1', 'Bebida de fantasía gasificada', '', '2021-07-17 15:37:39'),
(246, 'Red Bull 250cc.', 'red01', 'Energetica', '', 1370, '1', 'Tiene un efecto revitalizador y desintoxicante científicamente comprobado, incrementan las capacidades físicas y potencia la velocidad mental.', 'Si', '2021-07-17 15:40:27'),
(247, 'Jugos Watts Naranja 1500cc.', 'JUG01', 'Jugos', '', 1690, '1', 'Jugo Néctar Naranja', '', '2021-07-17 15:43:35'),
(248, 'Jugos Watts Durazno 1500cc.', 'JUG02', 'Jugos', '', 1690, '1', 'Jugo néctar sabor durazno', '', '2021-07-17 15:49:37');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
