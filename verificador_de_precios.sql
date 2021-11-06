-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-11-2021 a las 21:32:31
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `verificador_de_precios`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `producto_codigo` bigint(13) UNSIGNED NOT NULL,
  `producto_nombre` varchar(255) NOT NULL,
  `producto_cantidad` smallint(10) NOT NULL,
  `producto_precio` double(10,2) NOT NULL,
  `producto_imagen` varchar(255) NOT NULL,
  `producto_desc` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`producto_codigo`, `producto_nombre`, `producto_cantidad`, `producto_precio`, `producto_imagen`, `producto_desc`) VALUES
(1, 'Jabon antibacterial', 855, 120.90, 'https://mx.openfoodfacts.org/images/products/001/238/800/2996/front_en.3.200.jpg', 'Marca Lirio - 600g '),
(2, 'Clamato El Original ', 250, 42.50, 'https://mx.openfoodfacts.org/images/products/001/480/051/5336/front_es.5.200.jpg', 'Grupo peñafiel - 946 ml'),
(3, 'Instant Lunch', 500, 11.60, 'https://mx.openfoodfacts.org/images/products/004/178/900/1956/front_es.7.400.jpg', 'Maruchan - 64 g'),
(4, 'Pan blanco', 151, 39.00, 'https://mx.openfoodfacts.org/images/products/750/100/012/2332/front_es.8.400.jpg', 'Bimbo - 640 grs'),
(5, 'Barritas Piña', 789, 12.00, 'https://mx.openfoodfacts.org/images/products/750/100/013/3031/front_es.7.400.jpg', 'Marinela - 75 g'),
(6, 'Submarinos', 50, 12.00, 'https://mx.openfoodfacts.org/images/products/750/100/015/3282/front_es.13.400.jpg', 'Marinela - 105 g'),
(7, 'Mc Cormick Mermelada ', 500, 20.00, 'https://mx.openfoodfacts.org/images/products/750/100/333/6125/front_es.8.200.jpg', 'Frutos rojos - 235 g'),
(8, 'sopa Mexicana', 600, 20.00, 'https://mx.openfoodfacts.org/images/products/750/100/510/7662/front_es.4.200.jpg', 'Knorr - 77 g'),
(9, 'Caldo de pollo', 423, 8.90, 'https://mx.openfoodfacts.org/images/products/750/100/518/1365/front_es.7.400.jpg', 'Knorr - 8 cubos de 11 g c/u'),
(10, 'Zucaritas Kellogs', 150, 34.90, 'https://mx.openfoodfacts.org/images/products/750/100/804/2953/front_es.15.200.jpg', 'KELLOGGS - 490 g'),
(11, 'Cheetos Nacho ', 700, 12.00, 'https://mx.openfoodfacts.org/images/products/750/101/114/3999/front_es.7.200.jpg', 'Sabritas - 52 g'),
(12, 'Doritos Nacho', 250, 16.00, 'https://mx.openfoodfacts.org/images/products/750/101/113/1064/front_es.15.400.jpg', 'Sabritas - 245g'),
(13, 'Jarabe sabor a chocolate', 222, 52.50, 'https://mx.openfoodfacts.org/images/products/750/102/457/7057/front_es.9.200.jpg', ' Hershey\'s - 456 ml'),
(14, 'Jabón Blanco', 580, 21.50, 'https://mx.openfoodfacts.org/images/products/750/102/600/5374/front_es.6.200.jpg', 'Zote - 400g'),
(15, 'Barra Trigo ', 235, 35.00, 'https://mx.openfoodfacts.org/images/products/750/103/042/4369/front_es.18.200.jpg', 'Avena Con Nuez y Almendra Caja Display - 204 g'),
(16, 'Refresco ', 100, 16.00, 'https://mitienda.mx/media/catalog/product/cache/9f5ec31302878493d9ed0ac40a398e12/r/e/refresco-regular-600-ml_x1.jpg', 'Coca Cola 600ML'),
(17, 'Aderezo para nachos ', 150, 35.60, 'https://mx.openfoodfacts.org/images/products/750/166/980/4198/front_es.4.400.jpg', 'El ciervo - 1 kg'),
(18, 'Stevia', 362, 111.00, 'https://mx.openfoodfacts.org/images/products/450/143/320/1324/front_es.5.200.jpg', 'Great Value - 300 g'),
(19, 'Te de Manzanilla', 620, 35.50, 'https://mx.openfoodfacts.org/images/products/750/225/449/6019/front_es.14.200.jpg', 'Doblett - 30 g'),
(20, 'Myonesa reducida en grasa', 350, 27.90, 'https://mx.openfoodfacts.org/images/products/750/630/631/1510/front_es.8.200.jpg', 'Hellmann\'s - 390 g');

--
-- Disparadores `productos`
--
DELIMITER $$
CREATE TRIGGER `actualizarCantidadProducto` BEFORE INSERT ON `productos` FOR EACH ROW BEGIN
  IF NEW.producto_cantidad <0
    THEN
      SET NEW.producto_cantidad = NEW.producto_cantidad * -1;
  END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `actualizarCodigoProducto` BEFORE INSERT ON `productos` FOR EACH ROW BEGIN
  IF NEW.producto_codigo <0
    THEN
      SET NEW.producto_codigo = NEW.producto_codigo * -1;
  END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `actualizarPrecioProducto` BEFORE INSERT ON `productos` FOR EACH ROW BEGIN
  IF NEW.producto_precio <0
    THEN
      SET NEW.producto_precio = NEW.producto_precio * -1;
  END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productosp`
--

CREATE TABLE `productosp` (
  `producto_codigo` bigint(13) UNSIGNED NOT NULL,
  `producto_nombre` varchar(255) NOT NULL,
  `producto_cantidad` int(3) NOT NULL,
  `producto_precio` double(10,2) NOT NULL,
  `producto_imagen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productosp`
--

INSERT INTO `productosp` (`producto_codigo`, `producto_nombre`, `producto_cantidad`, `producto_precio`, `producto_imagen`) VALUES
(0, 'prueba', 2, 1.00, NULL),
(1, 'Agua Ciel 600ml', 8, 10.00, 'https://www.super-deli.com.mx/img/p/5/0/50-thickbox_default.jpg'),
(2, 'Dulce Bubulubu 35 gr', 25, 5.00, 'https://despensaurbana.mx/content/images/thumbs/5f0e60b31721854af7ff1e39_Bubulubu_35_g_M05AWIGEOF.png_400.png'),
(3, 'Salsa valentina roja 370 ml', 5, 12.00, 'https://tiendasneto.com.mx/media/catalog/product/cache/cb1e6b076f68ee0ac6e5e542f63310fa/1/0/1040000292-1_12.jpg'),
(4, 'Doritos Nachos Sabritas 155g', 10, 30.24, 'https://despensaurbana.mx/content/images/thumbs/5f0e608a1721854af7ff17d3_doritos-nachos-sabritas-155-g_400.png'),
(5, 'Chocolate de mesa Abuelita 540gr', 4, 79.92, 'https://despensaurbana.mx/content/images/thumbs/5fde63ef2c4d0179319346f9_chocolate-de-mesa-abuelita-540-gr_400.jpeg'),
(6, 'Palomitas de maiz extra mantequilla Act II 80gr', 15, 11.00, 'https://despensaurbana.mx/content/images/thumbs/5f0e5fda1721854af7ff0a79_palomitas-de-maz-extra-mantequilla-act-ii-80-g_400.png'),
(7, 'Palomitas de maiz queso jalapeño Act II 80gr', 3, 14.00, 'https://despensaurbana.mx/content/images/thumbs/5f0e5fd81721854af7ff0a21_palomitas-de-maz-queso-jalapeo-act-ii-80-g_400.png'),
(8, 'Papas Chips fuego 170gr', 7, 42.12, 'https://despensaurbana.mx/content/images/thumbs/5f0e60a11721854af7ff18f5_papas-chips-fuego-de-barcel-170-g_400.png'),
(9, 'Pringles Crema y cebolla 124gr', 6, 41.58, 'https://despensaurbana.mx/content/images/thumbs/5f0e5ff81721854af7ff0edb_pringles-crema-y-cebolla-124-g_400.png'),
(10, 'Jugo de tomate Clamato El Original con almeja 946ml', 2, 40.00, 'https://despensaurbana.mx/content/images/thumbs/60355248894b812405b917e8_clamato-946-ml_400.jpeg'),
(11, 'Electrolit suero rehidratante sabor mora azul 625ml', 4, 20.00, 'https://despensaurbana.mx/content/images/thumbs/5fd1333c2cea0931bf4449bb_electrolit-suero-rehidratante-sabor-mora-azul-625-ml_400.jpeg'),
(12, 'Jugo Boing de mango 250ml', 23, 5.50, 'https://despensaurbana.mx/content/images/thumbs/5f0e60491721854af7ff140a_jugo-boing-de-mango-250-ml_400.png'),
(13, 'Jugo Boing de manzana 1L', 6, 19.50, 'https://despensaurbana.mx/content/images/thumbs/5f0e60471721854af7ff13f8_jugo-boing-de-manzana-1-l_400.png'),
(14, 'Cafe soluble Nescafe clasico 42gr', 12, 27.00, 'https://despensaurbana.mx/content/images/thumbs/6064ac1b834fd8170988f941_caf-soluble-nescaf-clsico-42-g_400.webp'),
(15, 'Crema de avellanas Nutella 200gr', 1, 43.20, 'https://despensaurbana.mx/content/images/thumbs/60158f19894b812405967791_crema-de-avellanas-nutella-200-g_400.jpeg'),
(16, 'Aceite de Ajonjoli Tostado Ines 250ml', 3, 75.00, 'https://despensaurbana.mx/content/images/thumbs/608f4fec834fd81709e1f4a7_aceite-de-ajonjoli-tostado-ins-250-ml_400.png'),
(17, 'Azucar Zulka Refinada 1kg', 8, 36.00, 'https://despensaurbana.mx/content/images/thumbs/5f97259092ccc5311742f8a2_azcar-zulka-refinada-1kg_400.jpeg'),
(18, 'Catsup del Monte 320gr', 19, 13.50, 'https://despensaurbana.mx/content/images/thumbs/5f0e60af1721854af7ff1c77_catsup-del-monte-320-g_400.png'),
(19, 'Arroz Integral super extra SOS 1kg', 26, 39.50, 'https://despensaurbana.mx/content/images/thumbs/5f0e5fc41721854af7ff06d7_arroz-integral-super-extra-sos-1-kg_400.png'),
(20, 'Chicharos con Zanahoria Herdez 225gr', 13, 9.50, 'https://despensaurbana.mx/content/images/thumbs/5f0e5fc71721854af7ff077b_chcharos-con-zanahoria-herdez-225-g_400.png'),
(3990, 'taquitos de machaca', 50, 30.00, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `usuario_num_empleado` bigint(13) UNSIGNED NOT NULL,
  `usuario_nombre` varchar(255) NOT NULL,
  `usuario_apellido1` varchar(255) NOT NULL,
  `usuario_apellido2` varchar(255) NOT NULL,
  `usuario_celular` int(10) UNSIGNED NOT NULL,
  `usuario_curp` varchar(18) NOT NULL,
  `usuario_rfc` varchar(13) NOT NULL,
  `usuario_nss` bigint(11) UNSIGNED NOT NULL,
  `usuario_correo_electronico` varchar(255) NOT NULL,
  `usuario_direccion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usuario_num_empleado`, `usuario_nombre`, `usuario_apellido1`, `usuario_apellido2`, `usuario_celular`, `usuario_curp`, `usuario_rfc`, `usuario_nss`, `usuario_correo_electronico`, `usuario_direccion`) VALUES
(1123659452685, 'Raquel', 'Rojas', 'Zaragosa', 4294967295, 'ROZR940330MSRJRQ09', 'ROZR940330MF2', 7751272480, 'Raquel_RZ@gmail.com', '67757 Evelyn Shoal Suite 667'),
(1132456789521, 'Noel', 'Betanzos', 'Torres', 4294967295, 'TOBN940924HSPRTL03', 'TOBN940924726', 7757197808, 'Noel_BT@gmail.com', '32644 Aufderhar Road Suite 205'),
(1133325415543, 'Alegandra Guadalupe', 'Zepeda', 'Rios', 4294967295, 'ZERA900925MSRPSL00', 'ZERA900925LJA', 7755468780, 'Alejandra_ZR@gmail.com', '6715 Kuhlman Mills Apt. 745'),
(1135648795221, 'Humberto Alejandro', 'Blanco', 'Velasco', 4294967295, 'BAVH730115HSRLLM00', 'BAVH730115247', 7758219010, 'Humberto_BV@gmail.com', '52305 Crona Oval Suite 921'),
(1221451647854, 'Miguel Angel', 'Betancourt', 'Vazquez', 4294967295, 'BEVM960617HSLTZG02', 'BEVM960617PI4', 7756061021, 'Miguel_BV@gmail.com', '70880 Russel Throughway Apt. 730'),
(1235468975885, 'Jose Antonio', 'Bermudez', 'Manrique', 4294967295, 'BEMA950321HSRRNN01', 'BEMA950321II6', 7757642506, 'Jose_BM@gmail.com', '006 Medhurst Route Suite 371'),
(1254613894256, 'Carolina', 'Acevedo', 'Ruiz', 4294967295, 'AERC760919MSRCZR03', 'AERC760919UJ4', 7757546336, 'Carolina_AR@gmail.com', '4483 Frieda Locks Apt. 952'),
(1322155556632, 'Maria Lourdes', 'Bolaños', 'Sanchez', 4294967295, 'BOSL870607MSLLNR00', 'BOSL870607AEA', 7756952915, 'Maria_BS@gmail.com', '291 Eloy Springs Apt. 407'),
(1322564589994, 'Salvador Antonio', 'Hernan', 'Lopez', 4294967295, 'LOHS801210HSRPRL02', 'LOHS8012104N6', 7758744179, 'Salvador_HL@gmail.com', '663 Eldora Underpass Apt. 368'),
(1324659875432, 'Juan Miguel', 'Marquez', 'Vazquez', 4294967295, 'MAVJ900424HSRRZN01', 'MAVJ900424F33', 7759857201, 'Juan_MV@gmail.com', '477 Whitney Courts Suite 510'),
(1324685467985, 'Alejandro', 'Buruel', 'Mejia', 4294967295, 'MAVM940621HSRRZG00', 'MAVM940621JK5', 7750164533, 'Alejandro_BM@gmail.com', '1722 Swift Drives Suite 910'),
(1332465997752, 'Gloria Antonieta', 'Bernal', 'Rosales', 4294967295, 'BERG971025MSRRSL06', 'BERG971025551', 7756588505, 'Gloria_BR@gmail.com', '4801 Neva Hill Suite 371'),
(1346798521465, 'Maria Mireya', 'Acevedo', 'Manrquez', 4294967295, 'AEMM850911MSRCRR02', 'AEMM8509116L6', 7759650734, 'Maria_AM@gmail.com', '4234 Hammes Landing Apt. 014'),
(1364824562892, 'Alfredo Manuel', 'Bautista', 'Encina', 4294967295, 'BUMA920422HSRRJL03', 'BUMA920422T2A', 7754889247, 'Alfredo_BE@gmail.com', '5146 Parisian Brook Apt. 882'),
(1487564894325, 'Tomas Jose', 'Acosta', 'Canto', 4294967295, 'AOCT710923HASCNM08', 'AOCT710923LX4', 7754748595, 'Tomas_AC@gmail.com', '863 Koss Street Apt. 773');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD UNIQUE KEY `producto_codigo` (`producto_codigo`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usuario_num_empleado`),
  ADD UNIQUE KEY `numero_de_empleado` (`usuario_num_empleado`),
  ADD UNIQUE KEY `curp` (`usuario_curp`),
  ADD UNIQUE KEY `rfc` (`usuario_rfc`),
  ADD UNIQUE KEY `nss` (`usuario_nss`),
  ADD UNIQUE KEY `correo_electronico` (`usuario_correo_electronico`),
  ADD UNIQUE KEY `nss_2` (`usuario_nss`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
