-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-01-2019 a las 13:57:16
-- Versión del servidor: 10.1.36-MariaDB
-- Versión de PHP: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `onready`
--
CREATE DATABASE IF NOT EXISTS `onready` DEFAULT CHARACTER SET latin1 COLLATE latin1_general_ci;
USE `onready`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movies`
--

CREATE TABLE `movies` (
  `id` int(11) NOT NULL,
  `titulo` varchar(33) COLLATE latin1_general_ci NOT NULL,
  `estreno` int(4) NOT NULL,
  `pais` varchar(3) COLLATE latin1_general_ci NOT NULL,
  `sinopsis` text COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Volcado de datos para la tabla `movies`
--

INSERT INTO `movies` (`id`, `titulo`, `estreno`, `pais`, `sinopsis`) VALUES
(1, 'El Padrino.', 1972, 'USA', 'Una adaptación ganadora del Premio de la Academia, de la novela de Mario Puzo acerca de la familia Corleone.'),
(2, 'Gran Torino', 23234, 'AUS', 'Vecinos inmigrantes obligan a un veterano a enfrentarse a los prejuicios de mucho tiempo.'),
(3, 'Taxi Driver', 1973, 'USA', 'Un veterano de Vietnam inicia una confrontación violenta con los proxenetas que trabajan en las calles de Nueva York.'),
(6, 'La Naranja Mecánica', 1976, 'GBR', 'Un criminal en la Inglaterra del futuro pasa una serie de procesos experimentales para corregir sus impulsos violentos.'),
(17, 'Una Mente Brillante', 2001, 'USA', 'El genial matemático John Forbes Nash Jr. (Russell Crowe) sufre de esquizofrenia, pero logra obtener el Premio Nobel años más tarde.'),
(28, 'Pesadilla en la calle Elm', 1984, 'USA', 'Nancy, Quentin, Kris, Jesse y Dean, un grupo de amigos del mismo vecindario, comienzan a tener el mismo sueño relacionado con un hombre desfigurado. La única manera de escaparse de él es despertar.'),
(29, 'Avengers: Infinity War', 2018, 'USA', 'Los superhéroes se alían para vencer al poderoso Thanos, el peor enemigo al que se han enfrentado. Si Thanos logra reunir las seis gemas del infinito: poder, tiempo, alma, realidad, mente y espacio, nadie podrá detenerlo.'),
(30, 'Forest Gump', 1994, 'USA', 'La simpleza e inocencia de un sureño lo impulsan a través de hechos importantes de la historia moderna de EE.UU.'),
(31, 'El Viaje de Chihiro', 2003, 'JPN', 'Perdida en el bosque, una niña (Rumi Hîragi) de 10 años conoce animales, fantasmas y criaturas extrañas.'),
(32, 'Hellraiser', 1987, 'GBR', 'La historia gráfica de un rompecabezas oriental que abre la puerta a una dimensión llena de dolor y tortura.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movstaff`
--

CREATE TABLE `movstaff` (
  `ID_movie` int(11) NOT NULL,
  `ID_staff` int(11) NOT NULL,
  `actor` varchar(1) COLLATE latin1_general_ci NOT NULL COMMENT 'S = si / N = no',
  `director` varchar(1) COLLATE latin1_general_ci NOT NULL COMMENT 'S = si / N = no'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Volcado de datos para la tabla `movstaff`
--

INSERT INTO `movstaff` (`ID_movie`, `ID_staff`, `actor`, `director`) VALUES
(1, 1, 'N', 'S'),
(1, 2, 'S', 'N'),
(1, 3, 'S', 'N'),
(1, 4, 'S', 'N'),
(1, 5, 'S', 'N');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paises`
--

CREATE TABLE `paises` (
  `iso3` varchar(3) COLLATE latin1_general_ci NOT NULL,
  `iso2` varchar(2) COLLATE latin1_general_ci NOT NULL,
  `nombre` varchar(33) COLLATE latin1_general_ci NOT NULL COMMENT 'Nombre Corto',
  `capital` varchar(33) COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Volcado de datos para la tabla `paises`
--

INSERT INTO `paises` (`iso3`, `iso2`, `nombre`, `capital`) VALUES
('AFG', 'AF', 'Afganistán', 'Kabul'),
('AGO', 'AO', 'Angola', 'Luanda'),
('ALB', 'AL', 'Albania', 'Tirana'),
('AND', 'AD', 'Andorra', 'Andorra la Vieja'),
('ARE', 'AE', 'Emiratos Árabes Unidos', 'Abu Dabi'),
('ARG', 'AR', 'Argentina', 'Buenos Aires'),
('ARM', 'AM', 'Armenia', 'Ereván'),
('ATG', 'AG', 'Antigua y Barbuda', 'Saint John'),
('AUS', 'AU', 'Australia', 'Canberra'),
('AUT', 'AT', 'Austria', 'Viena'),
('AZE', 'AZ', 'Azerbaiyán', 'Bakú'),
('BDI', 'BI', 'Burundi', 'Buyumbura'),
('BEL', 'BE', 'Bélgica', 'Bruselas'),
('BEN', 'BJ', 'Benín', 'Porto-Novo'),
('BFA', 'BF', 'Burkina Faso', 'Uagadugú'),
('BGD', 'BD', 'Bangladés', 'Daca'),
('BGR', 'BG', 'Bulgaria', 'Sofía'),
('BHR', 'BH', 'Baréin', 'Manama'),
('BHS', 'BS', 'Bahamas', 'Nasáu'),
('BIH', 'BA', 'Bosnia-Herzegovina', 'Sarajevo'),
('BLR', 'BY', 'Bielorrusia', 'Minsk'),
('BLZ', 'BZ', 'Belice', 'Belmopán'),
('BOL', 'BO', 'Bolivia', 'Sucre'),
('BRA', 'BR', 'Brasil', 'Brasilia'),
('BRB', 'BB', 'Barbados', 'Bridgetown'),
('BRN', 'BN', 'Brunéi', 'Bandar Seri Begawan'),
('BTN', 'BT', 'Bután', 'Thimphu'),
('BWA', 'BW', 'Botsuana', 'Gaborone'),
('CAF', 'CF', 'República Centroafricana', 'Bangui'),
('CAN', 'CA', 'Canadá', 'Ottawa'),
('CHE', 'CH', 'Suiza', 'Berna'),
('CHL', 'CL', 'Chile', 'Santiago'),
('CHN', 'CN', 'China', 'Pekín'),
('CIV', 'CI', 'Costa de Marfil', 'Yamusukro'),
('CMR', 'CM', 'Camerún', 'Yaundé'),
('COD', 'CD', 'República Democrática del Congo', 'Kinsasa'),
('COG', 'CG', 'Congo', 'Brazzaville'),
('COL', 'CO', 'Colombia', 'Bogotá'),
('COM', 'KM', 'Comoras', 'Moroni'),
('CPV', 'CV', 'Cabo Verde', 'Praia'),
('CRI', 'CR', 'Costa Rica', 'San José'),
('CUB', 'CU', 'Cuba', 'La Habana'),
('CYP', 'CY', 'Chipre', 'Nicosia'),
('CZE', 'CZ', 'República Checa', 'Praga'),
('DEU', 'DE', 'Alemania', 'Berlín'),
('DJI', 'DJ', 'Yibuti', 'Yibuti'),
('DMA', 'DM', 'Dominica', 'Roseau'),
('DNK', 'DK', 'Dinamarca', 'Copenhague'),
('DOM', 'DO', 'República Dominicana', 'Santo Domingo'),
('DZA', 'DZ', 'Argelia', 'Argel'),
('ECU', 'EC', 'Ecuador', 'Quito'),
('EGY', 'EG', 'Egipto', 'El Cairo'),
('ERI', 'ER', 'Eritrea', 'Asmara'),
('ESP', 'ES', 'España', 'Madrid'),
('EST', 'EE', 'Estonia', 'Tallin'),
('ETH', 'ET', 'Etiopía', 'Adís Abeba'),
('FIN', 'FI', 'Finlandia', 'Helsinki'),
('FJI', 'FJ', 'Fiyi', 'Suva'),
('FRA', 'FR', 'Francia', 'París'),
('FSM', 'FM', 'Micronesia', 'Palikir'),
('GAB', 'GA', 'Gabón', 'Libreville'),
('GBR', 'GB', 'Reino Unido', 'Londres'),
('GEO', 'GE', 'Georgia', 'Tiflis'),
('GHA', 'GH', 'Ghana', 'Accra'),
('GIN', 'GN', 'Guinea', 'Conakri'),
('GMB', 'GM', 'Gambia', 'Banjul'),
('GNB', 'GW', 'Guinea-Bisáu', 'Bisáu'),
('GNQ', 'GQ', 'Guinea Ecuatorial', 'Malabo'),
('GRC', 'GR', 'Grecia', 'Atenas'),
('GRD', 'GD', 'Granada', 'Saint George'),
('GTM', 'GT', 'Guatemala', 'Guatemala'),
('GUY', 'GY', 'Guyana', 'Georgetown'),
('HND', 'HN', 'Honduras', 'Tegucigalpa'),
('HRV', 'HR', 'Croacia', 'Zagreb'),
('HTI', 'HT', 'Haití', 'Puerto Príncipe'),
('HUN', 'HU', 'Hungría', 'Budapest'),
('IDN', 'ID', 'Indonesia', 'Yakarta'),
('IND', 'IN', 'India', 'Nueva Delhi'),
('IRL', 'IE', 'Irlanda', 'Dublín'),
('IRN', 'IR', 'Irán', 'Teherán'),
('IRQ', 'IQ', 'Irak', 'Bagdad'),
('ISL', 'IS', 'Islandia', 'Reikiavik'),
('ISR', 'IL', 'Israel', 'Jerusalén'),
('ITA', 'IT', 'Italia', 'Roma'),
('JAM', 'JM', 'Jamaica', 'Kingston'),
('JOR', 'JO', 'Jordania', 'Amán'),
('JPN', 'JP', 'Japón', 'Tokio'),
('KAZ', 'KZ', 'Kazajistán', 'Astaná'),
('KEN', 'KE', 'Kenia', 'Nairobi'),
('KGZ', 'KG', 'Kirguistán', 'Biskek'),
('KHM', 'KH', 'Camboya', 'Nom Pen'),
('KIR', 'KI', 'Kiribati', 'Tarawa'),
('KNA', 'KN', 'San Cristóbal y Nieves', 'Basseterre'),
('KOR', 'KR', 'Corea del Sur', 'Seúl'),
('KWT', 'KW', 'Kuwait', 'Kuwait City'),
('LAO', 'LA', 'Laos', 'Vientián'),
('LBN', 'LB', 'Líbano', 'Beirut'),
('LBR', 'LR', 'Liberia', 'Monrovia'),
('LBY', 'LY', 'Libia', 'Trípoli'),
('LCA', 'LC', 'Santa Lucía', 'Castries'),
('LIE', 'LI', 'Liechtenstein', 'Vaduz'),
('LKA', 'LK', 'Sri Lanka', 'Sri Jayawardenapura Kotte'),
('LSO', 'LS', 'Lesoto', 'Maseru'),
('LTU', 'LT', 'Lituania', 'Vilna'),
('LUX', 'LU', 'Luxemburgo', 'Luxemburgo'),
('LVA', 'LV', 'Letonia', 'Riga'),
('MAR', 'MA', 'Marruecos', 'Rabat'),
('MCO', 'MC', 'Mónaco', 'Mónaco'),
('MDA', 'MD', 'Moldavia', 'Chisináu'),
('MDG', 'MG', 'Madagascar', 'Antananarivo'),
('MDV', 'MV', 'Maldivas', 'Malé'),
('MEX', 'MX', 'México', 'México'),
('MHL', 'MH', 'Islas Marshall', 'Majuro'),
('MKD', 'MK', 'Macedonia', 'Skopie'),
('MLI', 'ML', 'Malí', 'Bamako'),
('MLT', 'MT', 'Malta', 'La Valeta'),
('MMR', 'MM', 'Birmania', 'Naipyidó'),
('MNE', 'ME', 'Montenegro', 'Podgorica'),
('MNG', 'MN', 'Mongolia', 'Ulán Bator'),
('MOZ', 'MZ', 'Mozambique', 'Maputo'),
('MRT', 'MR', 'Mauritania', 'Nuakchot'),
('MUS', 'MU', 'Mauricio', 'Port Louis'),
('MWI', 'MW', 'Malaui', 'Lilongüe'),
('MYS', 'MY', 'Malasia', 'Kuala Lumpur'),
('NAM', 'NA', 'Namibia', 'Windhoek'),
('NER', 'NE', 'Níger', 'Niamey'),
('NGA', 'NG', 'Nigeria', 'Abuya'),
('NIC', 'NI', 'Nicaragua', 'Managua'),
('NLD', 'NL', 'Países Bajos', 'Ámsterdam'),
('NOR', 'NO', 'Noruega', 'Oslo'),
('NPL', 'NP', 'Nepal', 'Katmandú'),
('NRU', 'NR', 'Nauru', 'Yaren'),
('NZL', 'NZ', 'Nueva Zelanda', 'Wellington'),
('OMN', 'OM', 'Omán', 'Mascate'),
('PAK', 'PK', 'Pakistán', 'Islamabad'),
('PAN', 'PA', 'Panamá', 'Panamá'),
('PER', 'PE', 'Perú', 'Lima'),
('PHL', 'PH', 'Filipinas', 'Manila'),
('PLW', 'PW', 'Palaos', 'Melekeok'),
('PNG', 'PG', 'Papúa Nueva Guinea', 'Puerto Moresby'),
('POL', 'PL', 'Polonia', 'Varsovia'),
('PRK', 'KP', 'Corea del Norte', 'Pionyang'),
('PRT', 'PT', 'Portugal', 'Lisboa'),
('PRY', 'PY', 'Paraguay', 'Asunción'),
('PSE', 'PS', 'Palestina', 'Jerusalén Este'),
('QAT', 'QA', 'Catar', 'Doha'),
('ROU', 'RO', 'Rumania', 'Bucarest'),
('RUS', 'RU', 'Rusia', 'Moscú'),
('RWA', 'RW', 'Ruanda', 'Kigali'),
('SAU', 'SA', 'Arabia Saudita', 'Riad'),
('SDN', 'SD', 'Sudán', 'Jartum'),
('SEN', 'SN', 'Senegal', 'Dakar'),
('SGP', 'SG', 'Singapur', 'Singapur'),
('SLB', 'SB', 'Islas Salomón', 'Honiara'),
('SLE', 'SL', 'Sierra Leona', 'Freetown'),
('SLV', 'SV', 'El Salvador', 'San Salvador'),
('SMR', 'SM', 'San Marino', 'San Marino'),
('SOM', 'SO', 'Somalia', 'Mogadiscio'),
('SRB', 'RS', 'Serbia', 'Belgrado'),
('SSD', 'SS', 'Sudán del Sur', 'Yuba'),
('STP', 'ST', 'Santo Tomé y Príncipe', 'Santo Tomé'),
('SUR', 'SR', 'Surinam', 'Paramaribo'),
('SVK', 'SK', 'Eslovaquia', 'Bratislava'),
('SVN', 'SI', 'Eslovenia', 'Liubliana'),
('SWE', 'SE', 'Suecia', 'Estocolmo'),
('SWZ', 'SZ', 'Suazilandia', 'Mbabane'),
('SYC', 'SC', 'Seychelles', 'Victoria'),
('SYR', 'SY', 'Siria', 'Damasco'),
('TCD', 'TD', 'Chad', 'Yamena'),
('TGO', 'TG', 'Togo', 'Lomé'),
('THA', 'TH', 'Tailandia', 'Bangkok'),
('TJK', 'TJ', 'Tayikistán', 'Dusambé'),
('TKM', 'TM', 'Turkmenistán', 'Asjabad'),
('TLS', 'TL', 'Timor Oriental', 'Dili'),
('TON', 'TO', 'Tonga', 'Nukualofa'),
('TTO', 'TT', 'Trinidad y Tobago', 'Puerto España'),
('TUN', 'TN', 'Túnez', 'Túnez'),
('TUR', 'TR', 'Turquía', 'Ankara'),
('TUV', 'TV', 'Tuvalu', 'Funafuti'),
('TWN', 'TW', 'Taiwán', 'Taipéi'),
('TZA', 'TZ', 'Tanzania', 'Dodoma'),
('UGA', 'UG', 'Uganda', 'Kampala'),
('UKR', 'UA', 'Ucrania', 'Kiev'),
('URY', 'UY', 'Uruguay', 'Montevideo'),
('USA', 'US', 'Estados Unidos', 'Washington D. C.'),
('UZB', 'UZ', 'Uzbekistán', 'Taskent'),
('VAT', 'VA', 'Vaticano', 'Vaticano'),
('VCT', 'VC', 'San Vicente y las Granadinas', 'Kingstown'),
('VEN', 'VE', 'Venezuela', 'Caracas'),
('VNM', 'VN', 'Vietnam', 'Hanói'),
('VUT', 'VU', 'Vanuatu', 'Port Vila'),
('WSM', 'WS', 'Samoa', 'Apia'),
('YEM', 'YE', 'Yemen', 'Saná'),
('ZAF', 'ZA', 'Sudáfrica', 'Pretoria'),
('ZMB', 'ZM', 'Zambia', 'Lusaka'),
('ZWE', 'ZW', 'Zimbabue', 'Harare');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `staff`
--

CREATE TABLE `staff` (
  `ID` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `apellido` varchar(50) COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Volcado de datos para la tabla `staff`
--

INSERT INTO `staff` (`ID`, `nombre`, `apellido`) VALUES
(1, 'Francis', 'Ford Coppola'),
(2, 'Marlon', 'Brando'),
(3, 'Al', 'Pacino'),
(4, 'James', 'Caan'),
(5, 'Sofia', 'Coppola');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pais` (`pais`);

--
-- Indices de la tabla `movstaff`
--
ALTER TABLE `movstaff`
  ADD KEY `ID_movie` (`ID_movie`),
  ADD KEY `ID_staff` (`ID_staff`);

--
-- Indices de la tabla `paises`
--
ALTER TABLE `paises`
  ADD PRIMARY KEY (`iso3`);

--
-- Indices de la tabla `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `staff`
--
ALTER TABLE `staff`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `movstaff`
--
ALTER TABLE `movstaff`
  ADD CONSTRAINT `movstaff_ibfk_1` FOREIGN KEY (`ID_movie`) REFERENCES `movies` (`ID`),
  ADD CONSTRAINT `movstaff_ibfk_2` FOREIGN KEY (`ID_staff`) REFERENCES `staff` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
