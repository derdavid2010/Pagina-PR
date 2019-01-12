-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Jan 12, 2019 at 07:58 AM
-- Server version: 5.7.23
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `proyecto`
--

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id_client` int(11) NOT NULL,
  `nom_client` varchar(50) NOT NULL,
  `nom_responsable` varchar(100) DEFAULT NULL,
  `adresse` varchar(200) DEFAULT NULL,
  `CP` int(11) DEFAULT NULL,
  `tel_responsable` int(11) DEFAULT NULL,
  `tel_mobile` int(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `date_derniere_visite` date DEFAULT NULL,
  `commentaire` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id_client`, `nom_client`, `nom_responsable`, `adresse`, `CP`, `tel_responsable`, `tel_mobile`, `email`, `date_derniere_visite`, `commentaire`) VALUES
(1, 'FEMEXFUT', 'Héctor Gonzalez Iñarritu', 'CECAP avenida del iman', NULL, NULL, NULL, 'rmancilla@femexfut.org', '2012-10-24', NULL),
(2, 'D1-Diademas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'LA-Diademas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'D1-Banderines', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'LA-Banderines', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'Tableros', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `intervenants`
--

CREATE TABLE `intervenants` (
  `id_interv` int(11) NOT NULL,
  `nom_interv` varchar(100) NOT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `pass` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `intervenants`
--

INSERT INTO `intervenants` (`id_interv`, `nom_interv`, `correo`, `pass`) VALUES
(1, 'Christian lehingue', 'lehingue.christian@lfm.edu.mx', '123'),
(2, 'Jorge Paredes', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `machine`
--

CREATE TABLE `machine` (
  `id_machine` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `nom_machine` varchar(50) NOT NULL,
  `designation` varchar(150) DEFAULT NULL,
  `type` varchar(50) NOT NULL,
  `reference` varchar(100) DEFAULT NULL,
  `marque` varchar(50) DEFAULT NULL,
  `fournisseur` varchar(50) DEFAULT NULL,
  `commentaire` text,
  `compteur` int(11) DEFAULT NULL,
  `nb_arrets` int(11) DEFAULT NULL,
  `temps_arrets` int(11) DEFAULT NULL,
  `montant_pieces` int(11) DEFAULT NULL,
  `tps_mo` int(11) DEFAULT NULL,
  `nb_inter` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `machine`
--

INSERT INTO `machine` (`id_machine`, `id_client`, `nom_machine`, `designation`, `type`, `reference`, `marque`, `fournisseur`, `commentaire`, `compteur`, `nb_arrets`, `temps_arrets`, `montant_pieces`, `tps_mo`, `nb_inter`) VALUES
(3, 3, 'D-Kit 3', 'Kit de radiocomunicacion 3 ex N5-modele 2010', 'ARF 37', NULL, 'Adeunis-RF', 'Christian Lehingue MSPT', 'modelo 2010', 1, 2, 8, 4, 4, 2),
(4, 3, 'D-Kit 4', 'Kit de radiocomunicacion 4 ex N6-modele 2010\r\n', 'ARF 37', NULL, 'Adeunis-RF', 'Christian Lehingue MSPT', 'modelo 2010\r\n', NULL, NULL, 0, 0, 1, 1),
(7, 3, 'D-Kit 7', 'Kit de radiocomunicacion 7 ex N7-modele 2010\r\n', 'ARF 37 Wireless', 'ARF7531AB\r\n', 'Adeunis-RF', 'Christian Lehingue MSPT', 'modelo 2010\r\n', NULL, 1, 7, 1, 2, 1),
(9, 3, 'D-Kit 9', 'Kit de radiocomunicacion 9 ex N8-modele 2009\r\n', 'ARF 37', NULL, 'Adeunis-RF', 'Christian Lehingue MSPT', 'modelo 2009-equipo reformado el 15-2-2017\r\n', 1, 1, 5, 1, 6, 3),
(10, 3, 'D-Kit 10', 'Kit de radiocomunicacion 10 ex N9-modele 2010\r\n', 'ARF 37', NULL, 'Adeunis-RF', 'Christian Lehingue MSPT', 'modelo 2010\r\n', 1, 7, 83, 8, 7, 10),
(11, 3, 'D-Kit 11', 'Kit de radiocomunicacion 11 ex N11-modele 2010\r\n', 'ARF 37', NULL, 'Adeunis-RF', 'Christian Lehingue MSPT', 'modelo 2010\r\n', NULL, NULL, 0, 0, 1, 1),
(16, 2, 'D-kit N1', 'kit N1 de diademas\r\n', 'ARF7531', NULL, 'Adeunis-RF', 'MSPT', 'modelo 2010\r\n', 10, 8, 36, 14, 12, 12),
(17, 2, 'D-kit N2', 'kit N2 de diademas\r\n', 'ARF7531', NULL, 'Adeunis-RF', 'MSPT', 'modelo 2010- \r\n', 1, 2, 13, 3, 3, 4),
(18, 2, 'D-kit N3', 'kit N3 de diademas\r\n', 'ARF7531', NULL, 'Adeunis-RF', 'MSPT', 'modelo 2010\r\n', 1, 5, 23, 4, 11, 9),
(19, 2, 'D-kit N4', 'kit N4 de diademas\r\n', 'ARF7531', NULL, 'Adeunis-RF', 'MSPT', 'modelo 2010\r\n', 1, 3, 15, 6, 5, 5),
(20, 2, 'D-kit N5', 'kit N5 de diademas\r\n', 'ARF7531', 'puebla\r\n', 'Adeunis-RF', 'MSPT', 'Vokkero EVO3 modelo 2012\r\n', 1, 7, 24, 6, 15, 14),
(21, 2, 'D-kit N6', 'kit N6 de diademas\r\n', 'ARF7531', 'ARF7672AA-S/N:M122500052 a 56\r\n', 'Adeunis-RF', 'MSPT', 'modelo 2012\r\n', 1, 10, 53, 12, 20, 15),
(22, 2, 'D-kit N7', 'kit N7 de diademas\r\n', 'ARF7531', NULL, 'Adeunis-RF', 'MSPT', 'modelo 2012\r\n', 1, 7, 41, 8, 22, 9),
(23, 2, 'D-kit N8-LMX8', 'kit N8 de diademas\r\n', 'ARF7531', NULL, 'Adeunis-RF', 'MSPT', 'modelo 2012-Vokkero EVO3\r\n', 1, 10, 39, 16, 29, 17),
(24, 2, 'D-kit N9', 'kit N9 de diademas\r\n', 'ARF7531', 'ARF7672AA-S/N:M12250005A,5B,5D,63,65\r\n', 'Adeunis-RF', 'MSPT', 'modelo 2012\r\n', 1, 9, 56, 16, 30, 12),
(25, 2, 'D-kit N10', 'kit N10 de diademas\r\n', 'ARF7531', NULL, 'Adeunis-RF', 'MSPT', 'modelo 2010\r\n', 1, 7, 49, 12, 14, 8),
(26, 2, 'D-kit N11', 'kit N11 de diademas\r\n', 'ARF7531', NULL, 'Adeunis-RF', 'MSPT', 'modelo 2012\r\n', 1, 8, 31, 508, 317, 16),
(27, 2, 'D-kit N12', 'kit N12 de diademas\r\n', 'ARF7531', NULL, 'Adeunis-RF', 'MSPT', 'modelo 2010\r\n', 1, 7, 34, 10, 8, 10),
(28, 2, 'D-kit N13', 'kit N13 de diademas\r\n', 'ARF7531', NULL, 'Adeunis-RF', 'MSPT', 'modelo 2010- equipo ya muy desgastado\r\n', 1, 4, 32, 7, 7, 11),
(29, 4, 'B-N1', 'Kit de banderines N1\r\n', 'RPS2056-2', NULL, 'ERVOCOM', 'MSPT', 'modelo 2011\r\n', 2, 6, 33, 10, 14, 11),
(30, 4, 'B-N2', 'Kit de banderines N2\r\n', 'RPS2056-2', NULL, 'ERVOCOM', 'MSPT', 'modelo 2011-equipo fuera de servicio\r\n', 1, 7, 48, 5, 10, 9),
(31, 4, 'B-N3', 'Kit de banderines N3\r\n', 'RPS2056-2', NULL, 'ERVOCOM', 'MSPT', 'modelo 2011\r\n', 1, 4, 18, 4, 6, 7),
(32, 4, 'B-N4', 'Kit de banderines N4\r\n', 'RPS2056-2', NULL, 'ERVOCOM', 'MSPT', 'equipo de 2008-prever reemplazo, equipo ya viejo y oxidado-20-4-2015\r\n', 1, 2, 8, 2, 6, 3),
(33, 4, 'B-N5', 'Kit de banderines N5\r\n', 'RPS2056-2', NULL, 'ERVOCOM', 'MSPT', 'modelo 2011\r\n', 1, 1, 5, 1, 2, 3),
(34, 4, 'B-N6', 'Kit de banderines N6\r\n\r\n', 'RPS2056-2', '2056.02.0098\r\n', 'ERVOCOM', 'MSPT', 'modelo 2011\r\n', 1, 8, 41, 5, 12, 11),
(35, 4, 'B-N7', 'Kit de banderines N7\r\n', 'RPS2056-2', NULL, 'ERVOCOM', 'MSPT', 'modelo 2011\r\n', 1, 3, 18, 5, 7, 5),
(36, 4, 'B-N8', 'Kit de banderines N8\r\n', 'RPS2056-2', NULL, 'ERVOCOM', 'MSPT', 'modelo 2011\r\n', 1, 1, 4, 1, 4, 5),
(37, 4, 'B-N9', 'Kit de banderines N9\r\n', 'RPS2056-2', NULL, 'ERVOCOM', 'MSPT', 'modelo 2011\r\n', 2, 3, 16, 4, 7, 12),
(38, 4, 'B-N10', 'Kit de banderines N10\r\n', 'RPS2056-2', NULL, 'ERVOCOM', 'MSPT', 'modelo 2012-maneja Julio Escobar\r\n', 1, 2, 8, 3, 4, 5),
(39, 4, 'B-N11', 'Kit de banderines N11\r\n', 'RPS2056-2', NULL, 'ERVOCOM', 'MSPT', 'modelo 2011\r\n', 1, 2, 4, 53, 5, 5),
(40, 4, 'B-N12', 'Kit de banderines N12\r\n', 'RPS2056-2', NULL, 'ERVOCOM', 'MSPT', 'modelo 2011\r\n', 1, NULL, 0, 1, 0, 2),
(41, 4, 'B-N13', 'Kit de banderines N13\r\n', 'RPS2056-2', NULL, 'ERVOCOM', 'MSPT', 'modelo 2011\r\n', NULL, NULL, 0, 1, 0, 2),
(42, 4, 'B-F1', 'Kit de banderines F1\r\n', 'RPS2056-2', NULL, 'ERVOCOM', 'MSPT', 'modelo 2012\r\n', 1, 1, 9, 2, 3, 2),
(43, 4, 'B-F2', 'Kit de banderines F2\r\n', 'RPS2056-2', NULL, 'ERVOCOM', 'MSPT', 'modelo 2012\r\n', 1, 1, 3, 1, 2, 5),
(44, 5, 'B-KIT1', 'Kit de banderines viejos 1\r\n', 'RPS2016', '2009\r\n', 'ERVOCOM', 'MSPT', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(45, 5, 'B-KIT2', 'Kit de banderines viejos 2\r\n', 'RPS2016', '2009\r\n', 'ERVOCOM', 'MSPT', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(46, 5, 'B-KIT3', 'Kit de banderines viejos 3\r\n', 'RPS2016', '2009\r\n', 'ERVOCOM', 'MSPT', 'Tamaulipas-Arturo Segura\r\n', 0, 2, 12, 2, 3, 3),
(47, 5, 'B-KIT4', 'Kit de banderines viejos 4\r\n', 'RPS2016', '2009\r\n', 'ERVOCOM', 'MSPT', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(48, 5, 'B-KIT5', 'Kit de banderines viejos 5\r\n', 'RPS2016', '2009\r\n', 'ERVOCOM', 'MSPT', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(49, 5, 'B-KIT6', 'Kit de banderines viejos 6\r\n', 'RPS2016', '2009\r\n', 'ERVOCOM', 'MSPT', NULL, 1, 2, 17, 2, 6, 3),
(50, 5, 'B-KIT7', 'Kit de banderines viejos 7\r\n', 'RPS2016', '2009\r\n', 'ERVOCOM', 'MSPT', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(51, 5, 'B-KIT8', 'Kit de banderines viejos 8\r\n', 'RPS2016', '2009\r\n', 'ERVOCOM', 'MSPT', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(52, 5, 'B-KIT9', 'Kit de banderines viejos 9\r\n', 'RPS2016', '2009\r\n', 'ERVOCOM', 'MSPT', 'equipo de 2009\r\n', NULL, NULL, NULL, NULL, NULL, NULL),
(53, 5, 'B-KIT10', 'Kit de banderines viejos 10\r\n', 'RPS2016', '2009\r\n', 'ERVOCOM', 'MSPT', NULL, 0, 1, 5, 1, 1, 2),
(54, 5, 'B-KIT11', 'Kit de banderines viejos 11-reemplazado por equipo del 2010\r\n', 'RPS2016', '2009\r\n', 'ERVOCOM', 'MSPT', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(55, 5, 'B-KIT12', 'Kit de banderines viejos 12\r\n', 'RPS2016', '2009\r\n', 'ERVOCOM', 'MSPT', NULL, 1, NULL, 0, 0, 0, 1),
(56, 5, 'B-KIT13', 'Kit de banderines viejos 13\r\n', 'RPS2016', '2009\r\n', NULL, 'MSPT', 'prever pronto reemplazo. equipo muy desgastado y con corrosion-20-4-2015-lo mismo dicho el 29-9-2015\r\n', 1, 2, 8, 1, 1, 2),
(57, 5, 'B-KIT14', 'Kit de banderines viejos 14\r\n', 'RPS2016', '2009\r\n', 'ERVOCOM', 'MSPT', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(58, 5, 'B-KIT15', 'Kit de banderines viejos 15\r\n', 'RPS2016', '2009\r\n', 'ERVOCOM', 'MSPT', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(59, 6, 'T1-Oficina 1', 'Tablero 1\r\n', 'Delta 2F', '2009\r\n', NULL, 'AMB Elettronici', '2009\r\n', 1, NULL, 0, 0, 0, 1),
(60, 6, 'T2-Atlante', 'Tablero 2\r\n', 'Delta 2F', '2009\r\n', NULL, 'AMB Elettronici', 'Equipo del Atlante\r\n', 1, NULL, 0, 0, 0, 1),
(61, 6, 'T3-Queretaro', 'Tablero 3\r\n', 'Delta 2F', '01-2013\r\n', NULL, 'AMB Elettronici', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(62, 6, 'T4-Monterrey', 'Tablero 4\r\n', 'Delta 2F', '31-8-2010\r\n', NULL, 'AMB Elettronici', 'equipo de 2010.\r\n', 1, 3, 11, 2, 4, 4),
(63, 6, 'T5-Indios', 'Tablero 5\r\n', 'Delta 2F', '2009\r\n', NULL, 'AMB Elettronici', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(64, 6, 'T6-Atlas', 'Tablero 6\r\n', 'Delta 2F', '2011\r\n', NULL, 'AMB Elettronici', NULL, 1, NULL, 0, 0, 1, 2),
(65, 6, 'T7-Tecos', 'Tablero 7\r\n', 'Delta 2F', '2009\r\n', NULL, 'AMB Elettronici', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(66, 6, 'T8-Pumas', 'Tablero 8\r\n', 'Delta 2F', '01-2010\r\n', NULL, 'AMB Elettronici', NULL, 1, 2, 8, 1, 8, 3),
(67, 6, 'T9-San Luis', 'Tablero 9\r\n', 'Delta 2F', '01-2013\r\n', NULL, 'AMB Elettronici', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(68, 6, 'T10-Puebla', 'Tablero 10\r\n', 'Delta 2F', '2011\r\n', NULL, 'AMB Elettronici', NULL, 1, NULL, 0, 0, 1, 1),
(69, 6, 'T11-pachuca', 'Tablero 11\r\n', 'Delta 2F', '26/07/2014\r\n', NULL, 'AMB Elettronici', 'pilas bajas el 29-6-2016\r\n', 1, 4, 29, 3, 14, 5),
(70, 6, 'T12-Morelia', 'Tablero 12\r\n', 'Delta 2F', '2005 renovado en 2012 por AMB\r\n', 'AMB', 'AMB Elettronici', '2005 renovado en 2012 por AMB- Le cambie sus baterías en 2017\r\n', 1, NULL, 0, 0, 1, 2),
(71, 6, 'T13-Santos', 'Tablero 13\r\n', 'Delta 2F', '2006\r\n', NULL, 'AMB Elettronici', 'equipo de 2006- cambio de pilas en 2010\r\n', 1, NULL, 0, 0, 2, 1),
(72, 6, 'T14-Tigres', 'Tablero 14\r\n', 'Delta 2F', '12-2014\r\n', NULL, 'AMB Elettronici', 'tablero de diciembre 2014\r\n', 1, 2, 10, 0, 3, 2),
(73, 6, 'T15-Guadalajara', 'Tablero 15\r\n', 'Delta 2F', '01-2013\r\n', NULL, 'AMB Elettronici', 'tablero de 2010 re acondicionado en noviembre de 2012 por AMB.\r\n', 1, NULL, 0, 0, 0, 2),
(74, 6, 'T16-Toluca', 'Tablero 16\r\n', 'Delta 2F', '01-2013\r\n', NULL, 'AMB Elettronici', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(75, 6, 'T17-Necaxa', 'Tablero 17\r\n', 'Delta 2F', '2011\r\n', NULL, 'AMB Elettronici', NULL, 1, NULL, 0, 1, 1, 2),
(76, 6, 'T18-Jaguares', 'Tablero 18\r\n', 'Delta 2F', '2011\r\n', NULL, 'AMB Elettronici', NULL, 1, NULL, 0, 0, 1, 1),
(77, 6, 'T19-America', 'Tablero 19\r\n', 'Delta 2F', '01-2013\r\n', NULL, 'AMB Elettronici', 'equipo originalmente del 2008- reacondicionado en 2012- le cambie las pilas el 19-9-2014\r\n', 1, NULL, 0, 0, 5, 3),
(78, 6, 'T20-Cruz azul viejo', 'Tablero 20\r\n', 'Delta 2F', '01-2013\r\n', NULL, 'AMB Elettronici', NULL, 1, 1, 5, 0, 4, 2),
(79, 6, 'T21-Correcaminos', 'Tablero 21\r\n', 'Delta 2F', '2011\r\n', NULL, 'AMB Elettronici', NULL, 1, 1, 5, 2, 3, 2),
(80, 6, 'T22-Tijuana', 'Tablero 22\r\n', 'Delta 2F', '01-2013\r\n', NULL, 'AMB Elettronici', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(81, 6, 'T23-Lobos', 'Tablero 23\r\n', 'Delta 2F', '2011\r\n', NULL, 'AMB Elettronici', NULL, 1, 1, 5, 1, 4, 4),
(82, 6, 'T24-Monarcas', 'Tablero 24\r\n', 'Delta 2F', '2011\r\n', NULL, 'AMB Elettronici', NULL, 1, NULL, 0, 0, 0, 1),
(83, 6, 'T25-Pumas Morelos', 'Tablero 25\r\n', 'Delta 2F', '2011\r\n', NULL, 'AMB Elettronici', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(84, 6, 'T26-Veracruz', 'Tablero 26\r\n', 'Delta 2F', '2011\r\n', NULL, 'AMB Elettronici', 'Equipo de 2011, rehabilitado en agosto de 2013\r\n', 1, 3, 13, 4, 7, 5),
(85, 6, 'T27-Univ. Guada', 'Tablero 27\r\n', 'Delta 2F', '2011\r\n', NULL, 'AMB Elettronici', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(86, 6, 'T28-Merida', 'Tablero 28\r\n', 'Delta 2F', '2011\r\n', NULL, 'AMB Elettronici', 'equipo del 2011\r\n', 1, NULL, 0, 0, 0, 2),
(87, 6, 'T29-Cafetaleros', 'Tablero 29\r\n', 'Delta 2F', '2011\r\n', NULL, 'AMB Elettronici', 'equipo de 2011\r\n', NULL, NULL, NULL, NULL, NULL, NULL),
(88, 6, 'T30-Juarez', 'Tablero 30\r\n', 'Delta 2F', '2013\r\n', NULL, 'AMB Elettronici', NULL, 1, NULL, 0, 0, 1, 1),
(89, 2, 'D-KIT S1-LMX1', 'equipo completo SQUADRA con 5 radios\r\n', 'SQUADRA US', '2013\r\n', 'VOKKERO', 'ADEUNIS-RF', 'PUESTA EN SERVICIO:12/10/2013\r\n', 1, NULL, NULL, NULL, NULL, NULL),
(90, 2, 'D-KIT S2-LMX2', 'equipo completo SQUADRA con 5 radios\r\n', 'SQUADRA US', '2013\r\n', 'VOKKERO', 'ADEUNIS-RF', 'PUESTA EN SERVICIO:12/10/2013  S08104 a S08108\r\n', 1, 3, 13, 4, 4, 5),
(91, 2, 'D-KIT S3-LMX3', 'equipo completo SQUADRA con 5 radios\r\n', 'SQUADRA US', '2013\r\n', 'VOKKERO', 'ADEUNIS-RF', 'PUESTA EN SERVICIO:12/10/2013\r\n', 1, 1, 3, 1, 2, 1),
(92, 2, 'D-KIT S4-LMX4', 'equipo completo SQUADRA con 5 radios\r\n', 'SQUADRA US', '2013\r\n', 'VOKKERO', 'ADEUNIS-RF', 'PUESTA EN SERVICIO:12/10/2014    LMX4\r\n', 1, 3, 15, 3, 13, 5),
(94, 2, 'D-KIT S5-LMX5', 'equipo completo SQUADRA con 5 radios\r\n', 'SQUADRA US', '2013\r\n', 'VOKKERO', 'ADEUNIS-RF', 'PUESTA EN SERVICIO:12/10/2013    S08122 a S08126\r\n', 1, NULL, 0, 4, 1, 1),
(95, 2, 'D-KIT S6-LMX6', 'equipo completo SQUADRA con 5 radios\r\n', 'SQUADRA US', '2013\r\n', 'VOKKERO', 'ADEUNIS-RF', 'PUESTA EN SERVICIO:12/10/2013\r\n', 1, 2, 28, 1, 1, 4),
(96, 2, 'D-KIT S7-LMX7', 'equipo completo SQUADRA con 5 radios\r\n', 'SQUADRA US', '2013\r\n', 'VOKKERO', 'ADEUNIS-RF', 'PUESTA EN SERVICIO:12/10/2013\r\n', 1, 2, 8, 1, 5, 3),
(97, 2, 'D-kit P1', 'Kit FIFA 1\r\n', 'diademas Vokkero', 'modelo 2010\r\n', 'Adeunis RF', 'Christian Lehingue', '2010\r\n', 1, NULL, 0, 0, 1, 1),
(98, 2, 'D-kit P2', 'Kit FIFA 2\r\n', 'Vokkero', 'modelo 2010\r\n', 'Adeunis RF', 'Christian Lehingue', '2010-Equipo reformado el 15-2-2017\r\n', 1, 2, 10, 3, 3, 6),
(99, 2, 'D-kit P3', 'Kit FIFA N°3\r\n', 'Vokkero 7672AA-modelo 2010', 'modelo 2010\r\n', 'Adeunios RF', 'Christian Lehingue', '2010\r\n', 1, 3, 11, 1, 9, 6),
(100, 2, 'D-kit P4', 'Kit FIFA N°4\r\n', 'Vokkero 7672AA-modelo 2010', 'modelo 2010\r\n', 'Adeunios RF', 'Christian Lehingue', '2010\r\n', 1, 1, 4, 1, 1, 1),
(101, 6, 'T31-Leon', 'Tablero 31\r\n', 'Delta 2F', '2011\r\n', NULL, 'AMB Elettronici', '2011\r\n', 1, NULL, 0, 0, 1, 3),
(102, 2, 'D-KIT S8', 'equipo completo SQUADRA con 5 radios\r\n', 'ARF7830AB', NULL, 'VOKKERO', 'ADEUNIS-RF', 'PUESTA EN SERVICIO:19/9/2014\r\n', 1, 4, 14, 4, 9, 4),
(103, 2, 'D-KIT S9', 'equipo completo SQUADRA con 5 radios\r\n', 'ARF7830AB', NULL, 'VOKKERO', 'ADEUNIS-RF', 'PUESTA EN SERVICIO:19/9/2014\r\n', 1, 4, 20, 4, 9, 6),
(104, 2, 'D-KIT S10', 'equipo completo SQUADRA con 5 radios\r\n', 'ARF7830AB', NULL, 'VOKKERO', 'ADEUNIS-RF', 'PUESTA EN SERVICIO:19/9/2014\r\n', 1, 1, 5, 1, 1, 4),
(105, 2, 'D-KIT S11', 'equipo completo SQUADRA con 5 radios\r\n', 'ARF7830AB', NULL, 'VOKKERO', 'ADEUNIS-RF', 'PUESTA EN SERVICIO:19/9/2014    S08129 a S08133\r\n', 1, NULL, 0, 0, 0, 2),
(106, 2, 'D-KIT S12', 'equipo completo SQUADRA con 5 radios\r\n', 'ARF7830AB', 'A143600008\r\n', 'VOKKERO', 'ADEUNIS-RF', 'PUESTA EN SERVICIO:19/9/2014    S08097 a S08101\r\n', 1, NULL, 0, 0, 0, 3),
(107, 2, 'D-KIT S13-LMX11', 'equipo completo SQUADRA con 5 radios\r\n', 'ARF7830AB', '\r\n', 'S08114 a S08118', 'ADEUNIS-RF', 'PUESTA EN SERVICIO:19/9/2014    S08114 a S08118', 1, 2, 8, 1, 9, 4),
(108, 6, 'T32-Celaya', 'Tablero equipo Celaya\r\n', 'Delta 2F', NULL, 'AMB', 'AMB', 'modelo 2009-Modelo intervenido, le falta una cinta que lo cierra bien y las baterías no son las originales\r\n', 1, 1, 3, 1, 1, 2),
(109, 6, 'T33-Zacatepec', NULL, 'Delta 2F', NULL, 'AMB', 'AMB', 'Modelo 2009\r\n', 1, NULL, 0, 0, 1, 1),
(110, 6, 'T34- CRuz azul nuevo', NULL, 'Delta 2F', NULL, 'AMB', 'AMB', '2013\r\n', 1, 1, 5, 0, 4, 2),
(111, 6, 'T35-Puebla nuevo', 'Delta 2F\r\n', 'Delta 2F', NULL, 'AMB', 'AMB', '2012\r\n', 1, NULL, 0, 0, 1, 1),
(112, 6, 'T36-zacatepec', 'zacatepec\r\n', 'Delta2F', NULL, 'AMB', 'AMB', '2012\r\n', 1, NULL, 0, 0, 1, 1),
(113, 6, 'T37- Zacatecas', 'Mineros de Zacatecas\r\n', 'Delta2F', '\r\n', 'AMB', 'AMB', '2012\r\n', 1, NULL, 0, 0, 3, 3),
(114, 6, 'T38-Santos Laguna', 'Santos Laguna\r\n', 'Delta2F', NULL, 'AMB', 'AMB', 'es de 2010 reacondicionado en 2012\r\n', 1, NULL, 0, 0, 2, 3),
(115, 6, 'T39-cruz azul hidalgo', 'Cruz azul hidalgo\r\n', 'Delta2F', NULL, 'AMB', 'AMB', '2011\r\n', 1, NULL, 0, 0, 2, 2),
(116, 6, 'T88-Pumas viejo tablero', NULL, 'modelo 2006', NULL, NULL, NULL, 'baterias cambiadas en 2010 asi como un cargador nuevo generico nacional.\r\n', 1, 1, 5, 0, 2, 1),
(117, 6, 'T40-Cimarrones Sonora', NULL, 'equipo de 2011', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(118, 4, 'B-LMX1', 'Kit de banderines LMX1\r\n', 'RPS2056-2', 'S/N:2056.03.5402\r\n', 'ERVOCOM', 'MSPT', 'modelo 2014\r\n', 1, 6, 35, 9, 12, 4),
(119, 4, 'B-LMX2', 'Kit de banderines LMX2\r\n', 'RPS2056-2', NULL, 'ERVOCOM', 'MSPT', 'modelo 2014-Equipo sin pager al 15-2-2017\r\n', 1, 5, 30, 8, 12, 6),
(120, 4, 'B-LMX3', 'Kit de banderines LMX3\r\n', 'RPS2056-2', NULL, 'ERVOCOM', 'MSPT', 'modelo 2014\r\n', 1, 5, 30, 8, 13, 8),
(121, 4, 'B-LMX4', 'Kit de banderines LMX4\r\n', 'RPS2056-2', NULL, 'ERVOCOM', 'MSPT', 'modelo 2014\r\n', 1, 5, 30, 8, 12, 7),
(122, 4, 'B-LMX5', 'Kit de banderines LMX5\r\n', 'RPS2056-2', NULL, 'ERVOCOM', 'MSPT', 'modelo 2014\r\n', 1, 5, 30, 8, 12, 6),
(123, 4, 'B-LMX6', 'Kit de banderines LMX6\r\n', 'RPS2056-2', NULL, 'ERVOCOM', 'MSPT', 'modelo 2014\r\n', 1, 6, 33, 9, 13, 7),
(124, 4, 'B-LMX7', 'Kit de banderines LMX7\r\n', 'RPS2056-2', '', 'ERVOCOM', 'MSPT', 'modelo 2014\r\n', 1, 6, 33, 9, 13, 8),
(125, 4, 'B-LMX8', 'Kit de banderines LMX8\r\n', 'RPS2056-2', NULL, 'ERVOCOM', 'MSPT', 'modelo 2014\r\n', 1, 8, 41, 8, 15, 11),
(126, 2, 'D-kit S20_01C', 'Kit de diademas SQUADRA\r\n', 'ARF7830AB', 'A15450001C\r\n', 'Adeunis-RF', 'Christian jean roger LEHINGUE', 'Mise en service : 16 decembre 2015  equipo de carlos gonzalez\r\n', 1, 1, 3, 3, 0, 1),
(127, 2, 'D-kit S21', 'Kit de diademas SQUADRA\r\n', 'ARF7830AB', 'A15450001D\r\n', 'Adeunis-RF', 'Christian jean roger LEHINGUE', 'Mise en service : 16 decembre 2015\r\n', NULL, NULL, NULL, NULL, NULL, NULL),
(128, 2, 'D-kit S22-01E', 'Kit de diademas SQUADRA\r\n', 'ARF7830AB', 'A15450001E\r\n', 'Adeunis-RF', 'Christian jean roger LEHINGUE', 'Mise en service : 16 decembre 2015\r\n', 1, 0, 0, 0, 0, 3),
(129, 2, 'D-kit S23', 'Kit de diademas SQUADRA\r\n', 'ARF7830AB', 'A15450001F\r\n', 'Adeunis-RF', 'Christian jean roger LEHINGUE', 'Mise en service : 16 decembre 2015\r\n', NULL, NULL, NULL, NULL, NULL, NULL),
(130, 2, 'D-kit S24', 'Kit de diademas SQUADRA\r\n', 'ARF7830AB', 'A154500020\r\n', 'Adeunis-RF', 'Christian jean roger LEHINGUE', 'Mise en service : 16 decembre 2015\r\n', NULL, NULL, NULL, NULL, NULL, NULL),
(131, 2, 'D-kit S25', 'Kit de diademas SQUADRA\r\n', 'ARF7830AB', 'A154500021\r\n', 'Adeunis-RF', 'Christian jean roger LEHINGUE', 'Mise en service : 16 decembre 2015\r\n', NULL, NULL, NULL, NULL, NULL, NULL),
(132, 2, 'D-kit S26', 'Kit de diademas SQUADRA\r\n', 'ARF7830AB', 'A154500022\r\n', 'Adeunis-RF', 'Christian jean roger LEHINGUE', 'Mise en service : 16 decembre 2015\r\n', NULL, NULL, NULL, NULL, NULL, NULL),
(133, 2, 'D-01F- Kit Squadra-01D', 'Kit SQUADRA 2015\r\n', 'SQUADRA modelo US', 'ARF7822AA\r\n', 'Ki', 'Adeunis RF', 'S/N. tranbsceivers : M153500049-M15350004-M153500045-M15350003-M153500047-M153500048 Kit incompleto al 26-10-2016, le falta 1 diadema con botón PTT\r\n', 1, 1, 3, 0, 2, 2),
(134, 2, 'D-02F- Kit Squadra-22D', 'Kit SQUADRA 2015\r\n', 'SQUADRA modelo US', 'ARF7822AA\r\n', 'Squadra', 'Adeunis RF', '2015\r\n', 1, 1, 5, 1, 0, 4),
(135, 2, 'D-02F- Kit Squadra 21D', 'Kit SQUADRA 2015\r\n', 'SQUADRA modelo US', 'ARF7822AA\r\n', 'Squadra', 'Adeunis RF', NULL, 1, NULL, 0, 0, 0, 1),
(136, 2, 'D-04F- Kit Squadra', 'Kit SQUADRA 2015\r\n', 'SQUADRA modelo US', 'ARF7822AA\r\n', 'Squadra', 'Adeunis RF', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(137, 2, 'D-05F- Kit Squadra', 'Kit SQUADRA 2015\r\n', 'SQUADRA modelo US', 'ARF7822AA\r\n', 'Squadra', 'Adeunis RF', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(138, 2, 'D-06F- Kit Squadra', 'Kit SQUADRA 2015\r\n', 'SQUADRA modelo US', 'ARF7822AA\r\n', 'Squadra', 'Adeunis RF', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(139, 2, 'D-07F- Kit Squadra', 'Kit SQUADRA 2015\r\n', 'SQUADRA modelo US', 'ARF7822AA\r\n', 'Squadra', 'Adeunis RF', 'Kit SQUADRA 2015\r\n', 1, NULL, 0, 0, 0, 2),
(140, 6, 'T41-Necaxa', 'Tablero MODELO DELTA 2 F - AMB Elettronici\r\n', 'DELTA2F', 'modelo diciembre 2015\r\n', 'AMB Elettronici', 'Christian jean roger LEHINGUE', NULL, 1, 1, 5, 1, 0, 1),
(141, 6, 'T42-Dorados de culiacan', 'Tablero MODELO DELTA 2 F - AMB Elettronici\r\n', 'DELTA2F', 'modelo 2011\r\n', 'AMB Elettronici', 'Christian jean roger LEHINGUE', NULL, 1, 0, 0, 0, 0, 1),
(142, 6, 'T43-Queretaro nuevo', 'Tablero MODELO DELTA 2 F - AMB Elettronici\r\n', 'DELTA2F', 'modelo diciembre 2015\r\n', 'AMB Elettronici', 'Christian jean roger LEHINGUE', 'equipo de 2015-comprado por la FEMEXFUT directamente\r\n', 1, NULL, 0, 0, 3, 1),
(143, 6, 'T44-Correcaminos nuevo', 'Tablero MODELO DELTA 2 F - AMB Elettronici\r\n', 'DELTA2F', 'modelo diciembre 2015\r\n', 'AMB Elettronici', 'Christian jean roger LEHINGUE', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(144, 6, 'T45', 'Tablero MODELO DELTA 2 F - AMB Elettronici\r\n\r\n', 'DELTA2F', 'modelo diciembre 2015\r\n', 'AMB Elettronici', 'Christian jean roger LEHINGUE', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(145, 6, 'T46-Lobos BUAP nuevo', 'Tablero MODELO DELTA 2 F - AMB Elettronici\r\n', 'DELTA2F', 'modelo diciembre 2015\r\n', 'AMB Elettronici', 'Christian jean roger LEHINGUE', 'modelo diciembre 2015\r\n', NULL, NULL, NULL, NULL, NULL, NULL),
(146, 6, 'T47-Cruz azul nuevo', 'Tablero MODELO DELTA 2 F - AMB Elettronici\r\n', 'DELTA2F', 'modelo diciembre 2015\r\n', 'AMB Elettronici', 'Christian jean roger LEHINGUE', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(147, 4, 'B-LMX9', 'Kit de banderines LMX9\r\n', 'RPS2056-2', NULL, 'ERVOCOM', 'MSPT', 'modelo DICIEMBRE 2015\r\n', 1, NULL, 0, 0, 0, 1),
(148, 4, 'B-LMX10', 'Kit de banderines LMX10\r\n', 'RPS2056-2', 'S/N:2056.02.0109\r\n', 'ERVOCOM', 'MSPT', 'modelo DICIEMBRE 2015\r\n', 1, 1, 3, 1, 0, 1),
(149, 4, 'B-LMX11', 'Kit de banderines LMX11\r\n', 'RPS2056-2', NULL, 'ERVOCOM', 'MSPT', 'modelo DICIEMBRE 2015\r\n', NULL, NULL, NULL, NULL, NULL, NULL),
(150, 4, 'B-LMX12', 'Kit de banderines LMX12\r\n', 'RPS2056-2', NULL, 'ERVOCOM', 'MSPT', 'modelo DICIEMBRE 2015\r\n', 1, NULL, 0, 0, 0, 2),
(151, 4, 'B-LMX13', 'Kit de banderines LMX13\r\n', 'RPS2056-2', NULL, 'ERVOCOM', 'MSPT', 'modelo DICIEMBRE 2015\r\n', 1, NULL, 0, 0, 0, 1),
(152, 4, 'N11-2', 'banderines RPS2056-2\r\n', 'RPS2056-2', '\r\n', 'ERVOCOM', 'reftools', 'COMPRADOS EN 2015\r\n', 1, NULL, NULL, NULL, NULL, NULL),
(153, 6, 'T48- Celaya nuevo', 'Tablero nuevo elaya\r\n', 'DELTA2F', 'comprado por FMF en febrero 2016\r\n', 'AMB Elettronici', 'AMB Elettronici', 'modelo 2010-Este tablero no lo compre yo. lo compraron por fuera yo solo le agregue la clavija europea- americana\r\n', NULL, NULL, NULL, NULL, NULL, NULL),
(154, 2, 'D-kit S30', 'Kit de diademas SQUADRA-enero 2017\r\n', 'SQUADRA modelo US', 'ARF7822AA\r\n', 'Adeunis-RF', 'Christian jean roger LEHINGUE', '\"Mise en service : 16 enero 2017-S/N:M162900056, 57, 58, 59, 5D\r\nFEMEXFUT: S08073,4,5,6,7\"\r\n', 1, 1, 5, 1, 5, 4),
(155, 2, 'D-kit S31', 'Kit de diademas SQUADRA-enero 2017\r\n', 'SQUADRA modelo US', 'ARF7822AA\r\n', 'Adeunis-RF', 'Christian jean roger LEHINGUE', 'Mise en service : 16 enero 2017    S/N:M162900002, 5, 7, 8, 9\r\n', NULL, NULL, NULL, NULL, NULL, NULL),
(156, 2, 'D-kit S32', 'Kit de diademas SQUADRA-enero 2017\r\n', 'SQUADRA modelo US', 'ARF7822AA\r\n', 'Adeunis-RF', 'Christian jean roger LEHINGUE', 'Mise en service : 16 enero 2017       S/N:M162900020, 21, 40, 5C, 3A\r\n', NULL, NULL, NULL, NULL, NULL, NULL),
(157, 2, 'D-kit S33', 'Kit de diademas SQUADRA-enero 2017\r\n', 'SQUADRA modelo US', 'ARF7822AA\r\n', 'Adeunis-RF', 'Christian jean roger LEHINGUE', '\"Mise en service : 16 enero 2017            S/N:M16290000A, D, F,M162900010, 1D\r\nFEMEXFUT:S08081, y terminaciones 2,3,4,5\"\r\n', 1, 0, 0, 0, 0, 2),
(158, 2, 'D-kit S34', 'Kit de diademas SQUADRA-enero 2017\r\n', 'SQUADRA modelo US', 'ARF7822AA\r\n', 'Adeunis-RF', 'Christian jean roger LEHINGUE', 'Mise en service : 16 enero 2017     S/N:M162900006, B, E, 11, 13\r\n', 1, NULL, 0, 0, 0, 1),
(159, 2, 'D-kit S35', 'Kit de diademas SQUADRA-enero 2017\r\n', 'SQUADRA modelo US', 'ARF7822AA\r\n', 'Adeunis-RF', 'Christian jean roger LEHINGUE', 'Mise en service : 16 enero 2017      S/N:M16290001B, 1C, 1E, 1F, 26\r\n', NULL, NULL, NULL, NULL, NULL, NULL),
(160, 2, 'D-kit S36', 'Kit de diademas SQUADRA-enero 2017\r\n', 'SQUADRA modelo US', 'ARF7822AA\r\n', 'Adeunis-RF', 'Christian jean roger LEHINGUE', 'Mise en service : 16 enero 2017      S/N:M162900001, 3, 5A, 15, 55\r\n', NULL, NULL, NULL, NULL, NULL, NULL),
(161, 4, 'B-LMX14', 'Kit de banderines LMX14\r\n', 'RPS2056-2', 'S/N:2056.03.5404\r\n', 'ERVOCOM', 'MSPT', 'modelo Marzo 2016\r\n', NULL, NULL, NULL, NULL, NULL, NULL),
(162, 4, 'B-LMX15', 'Kit de banderines LMX15\r\n', 'RPS2056-2', 'S/N:2056.03.4358\r\n', 'ERVOCOM', 'MSPT', 'modelo Marzo 2016\r\n', 1, NULL, 0, 0, 0, 1),
(163, 4, 'B-LMX16', 'Kit de banderines LMX16\r\n', 'RPS2056-2', 'S/N:2056.03.5405\r\n', 'ERVOCOM', 'MSPT', 'modelo Marzo 2016\r\n', 2, NULL, 1, 1, 1, 2),
(164, 4, 'B-LMX17', 'Kit de banderines LMX17\r\n', 'RPS2056-2', 'modelo Marzo 2016\r\n', 'ERVOCOM', 'MSPT', 'modelo Marzo 2016\r\n', 1, 1, 1, 1, 0, 1),
(165, 4, 'B-LMX18', 'Kit de banderines LMX18\r\n', 'RPS2056-2', 'modelo Marzo 2016\r\n', 'ERVOCOM', 'MSPT', 'modelo Marzo 2016\r\n', 1, 1, 1, 1, 1, 1),
(166, 4, 'B-LMX19', 'Kit de banderines LMX19\r\n', 'RPS2056-2', 'modelo Marzo 2016\r\n', 'ERVOCOM', 'MSPT', 'modelo Marzo 2016\r\n', NULL, NULL, NULL, NULL, NULL, NULL),
(167, 4, 'B-LMX20', 'Kit de banderines LMX20\r\n', 'RPS2056-2', 'modelo Marzo 2016\r\n', 'ERVOCOM', 'MSPT', 'modelo Marzo 2016\r\n', 1, 1, 12, 1, 1, 1),
(168, 4, 'B-LMX21', 'Kit de banderines LMX21\r\n', 'RPS2056-2', 'modelo Marzo 2016\r\n', 'ERVOCOM', 'MSPT', 'modelo Marzo 2016\r\n', 1, NULL, 0, 0, 0, 2),
(169, 2, 'D-kit S37', 'Kit de diademas SQUADRA-marzo 2018\r\n', 'SQUADRA modelo US', 'ARF7822AA\r\n', 'Adeunis-RF', 'Christian jean roger LEHINGUE', 'Mise en service : 28 marzo 2018      S/N:\r\n', NULL, NULL, NULL, NULL, NULL, NULL),
(170, 2, 'D-kit S38', 'Kit de diademas SQUADRA-marzo 2018\r\n', 'SQUADRA modelo US', 'ARF7822AA\r\n', 'Adeunis-RF', 'Christian jean roger LEHINGUE', 'Mise en service : 28 marzo 2018      S/N:\r\n', NULL, NULL, NULL, NULL, NULL, NULL),
(171, 2, 'D-kit S39', 'Kit de diademas SQUADRA-marzo 2018\r\n', 'SQUADRA modelo US', 'ARF7822AA\r\n', 'Adeunis-RF', 'Christian jean roger LEHINGUE', 'Mise en service : 28 marzo 2018      S/N:\r\n', NULL, NULL, NULL, NULL, NULL, NULL),
(172, 2, 'D-kit S40', 'Kit de diademas SQUADRA-marzo 2018\r\n', 'SQUADRA modelo US', 'ARF7822AA\r\n', 'Adeunis-RF', 'Christian jean roger LEHINGUE', 'Mise en service : 28 marzo 2018      S/N:\r\n', NULL, NULL, NULL, NULL, NULL, NULL),
(173, 2, 'D-kit S41', 'Kit de diademas SQUADRA-marzo 2018\r\n', 'SQUADRA modelo US', 'ARF7822AA\r\n', 'Adeunis-RF', 'Christian jean roger LEHINGUE', 'Mise en service : 28 marzo 2018      S/N:\r\n', NULL, NULL, NULL, NULL, NULL, NULL),
(174, 4, 'B-N9-2', 'Banderin ervocom\r\n', '2056.02.0109', NULL, NULL, 'ERVOCOM', '2013\r\n', 1, NULL, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `maintenance`
--

CREATE TABLE `maintenance` (
  `id_maint` int(11) NOT NULL,
  `id_machine` int(11) NOT NULL,
  `id_oper` int(11) NOT NULL,
  `id_interv` int(11) NOT NULL,
  `date` date NOT NULL,
  `echeance` date DEFAULT NULL,
  `compteur` int(11) DEFAULT NULL,
  `commentaire` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `maintenance`
--

INSERT INTO `maintenance` (`id_maint`, `id_machine`, `id_oper`, `id_interv`, `date`, `echeance`, `compteur`, `commentaire`) VALUES
(1, 37, 1, 1, '2012-11-09', NULL, 0, 'pager desconfigurado-debe tener el codigo naranja para funcionar. cambie 2 pilas de 9V'),
(2, 34, 1, 1, '2013-02-18', NULL, 1, NULL),
(3, 26, 1, 1, '2014-01-06', NULL, 1, NULL),
(4, 34, 1, 1, '2014-01-14', NULL, 0, NULL),
(5, 34, 1, 1, '2014-01-14', NULL, 1, NULL),
(6, 37, 1, 1, '2014-02-13', NULL, 0, NULL),
(7, 24, 1, 1, '2014-02-21', NULL, 1, NULL),
(8, 10, 1, 1, '2014-03-18', NULL, 1, NULL),
(9, 16, 1, 1, '2014-03-18', '2014-09-18', 1, NULL),
(10, 18, 1, 1, '2014-03-18', NULL, 1, NULL),
(11, 20, 1, 1, '2014-03-18', NULL, 1, NULL),
(12, 24, 1, 1, '2014-03-18', NULL, 1, NULL),
(13, 26, 1, 1, '2014-03-18', NULL, 1, NULL),
(14, 31, 1, 1, '2014-03-18', '2015-03-18', 1, 'cambie las 3 pilas preventivamente'),
(15, 36, 1, 1, '2014-03-18', '2014-09-18', 1, NULL),
(16, 37, 1, 1, '2014-03-18', NULL, 1, NULL),
(17, 38, 1, 1, '2014-03-18', '2014-09-18', 1, NULL),
(18, 39, 1, 1, '2014-03-18', NULL, 1, NULL),
(19, 98, 1, 1, '2014-03-18', NULL, 1, NULL),
(20, 31, 1, 1, '2014-03-25', NULL, 1, 'equipo funcional- ya revisado el 18-3-2014'),
(21, 42, 1, 1, '2014-03-25', '2014-09-18', 1, 'repuse una rondana de banderin que faltaba'),
(22, 43, 1, 1, '2014-03-25', NULL, 1, 'equipo en buenas condiciones de uso'),
(23, 97, 1, 1, '2014-03-25', '2014-09-18', 1, 'equipo con 1 pila muy descargada y que ya no recibe carga por falta de uso. la reemplace por nueva.'),
(24, 98, 1, 1, '2014-03-25', NULL, 1, 'equipo completo pero con pilas muy descargadas. Hay que prever cargarlas antes de usarlo.'),
(25, 26, 1, 1, '2014-08-20', NULL, 0, NULL),
(26, 26, 1, 1, '2014-10-13', NULL, 1, NULL),
(27, 9, 1, 1, '2015-05-11', NULL, 1, 'Equipo funcional. Le falta el botón de 4to. Equipo modelo 2009 en malas condiciones. Prever pronto reemplazo.'),
(28, 10, 1, 1, '2015-05-11', '2015-11-11', 1, 'Equipo funcional y completo pero ya muy desgatado. Equipo modelo 2010 en malas condiciones. Prever pronto reemplazo.'),
(29, 18, 1, 1, '2015-05-11', '2015-11-11', 1, 'Equipo completo y funcional. Equipo modelo 2010 en malas condiciones. Prever reemplazo.'),
(30, 19, 1, 1, '2015-05-11', NULL, 1, 'Equipo revisado. Le falta el cable de alimentación eléctrica del contacto al cargador.\r\nEquipo ya muy desgastado y con problemas de escucha debido a corrosión de los equipos.\r\nPrever pronto reemplazo.\r\n'),
(31, 21, 1, 1, '2015-05-11', NULL, 1, 'Equipo completo y funcional. buene stado'),
(32, 23, 1, 1, '2015-05-11', NULL, 1, 'Equipo funcional y completo. buen estado'),
(33, 25, 1, 1, '2015-05-11', '2015-11-11', 1, 'Equipo revisado. Equipo ya muy desgastado y con problemas de escucha debido a corrosión de los equipos.\r\nPrever pronto reemplazo.\r\n'),
(34, 26, 1, 1, '2015-05-11', NULL, 1, 'Equipo revisado. Completo y funcional. Buen estado general.'),
(35, 27, 1, 1, '2015-05-11', '2015-11-11', 1, 'Equipo. Equipo completo y funcional. Equipo modelo 2010 en condiciones regulares a malas. Prever reemplazo.'),
(36, 28, 1, 1, '2015-05-11', NULL, 1, 'Equipo completo y funcional. Equipo modelo 2010 en condiciones regulares. Prever reemplazo.'),
(37, 98, 1, 1, '2015-05-11', '2015-09-18', 1, 'Equipo revisado. 1 diadema (5ta) con leve perdida de sensibilidad. Equipo Completo y funcional. Muy  estado general de los radios.'),
(38, 62, 1, 1, '2015-05-27', NULL, 1, 'Tablero incompleto. Le falta el cargador. Equipo funcional. Equipo bien cuidado - carga bien pero sus pilas ya están a la mitad de vida'),
(39, 66, 1, 1, '2015-05-27', '2015-11-27', 1, 'Tablero incompleto. Le falta el cargador. Equipo funcional pero su manija esta rota. Equipo muy descuidado con caras rayadas- carga bien pero sus pilas ya están a la mitad de vida'),
(40, 68, 1, 1, '2015-05-27', '2015-11-27', 1, 'Tablero incompleto. Le falta el cargador. Equipo funcional. carga bien pero sus pilas ya están a la mitad de vida'),
(41, 70, 1, 1, '2015-05-27', NULL, 1, 'Tablero incompleto me fue entregado sin estuche de transporte. Equipo funcional. Equipo carga bien pero sus pilas estan al 50% de vida útil.'),
(42, 77, 1, 1, '2015-05-27', NULL, 1, 'Tablero completo y funcional- carga al 99%'),
(43, 78, 1, 1, '2015-05-27', '2015-11-27', 1, 'Tablero completo y funcional-Equipo ya muy viejo y descuidado. carga bien pero sus pilas ya pasaron más de la mitad de vida'),
(44, 81, 1, 1, '2015-05-27', NULL, 1, 'Tablero incompleto. Le falta el cargador. Equipo funcional. Equipo con cuidado regular- carga bien pero sus pilas ya están a la mitad de vida'),
(45, 84, 1, 1, '2015-05-27', '2015-11-27', 1, 'Tablero completo y funcional- carga al 99%'),
(46, 101, 1, 1, '2015-05-27', '2015-11-27', 1, 'Tablero completo y funcional- carga bien pero sus pilas a la mitad de vida'),
(47, 108, 1, 1, '2015-05-27', '2015-11-27', 1, 'Tablero con apagado por switch no original agregado. Equipo completo y funcional aunque ya desgastado'),
(48, 109, 1, 1, '2015-05-27', '2015-11-27', 1, 'Tablero completo y funcional. Equipo ya antiguo y muy descuidado. Su estuche de transporte ya no cierra. Pilas a mitad de vida.'),
(49, 110, 1, 1, '2015-05-27', '2015-11-27', 1, 'Tablero incompleto. Le falta el cargador. Equipo funcional- carga bien pero sus pilas ya pasaron la mitad de vida'),
(50, 111, 1, 1, '2015-05-27', '2015-11-27', 1, 'Tablero incompleto. Le falta el cargador. Equipo funcional. carga bien pero sus pilas ya están a la mitad de vida'),
(51, 112, 1, 1, '2015-05-27', '2015-11-27', 1, 'Tablero completo y funcional, con apariencia nueva. Sus pilas tienen todavía más de la mitad de vida'),
(52, 71, 1, 1, '2015-06-18', '2015-12-18', 1, 'Tablero con manija rota y muy desgastado. Sus pilas están totalmente agotadas y su chip de control fuera de servicio. Ya no funciona.'),
(53, 75, 1, 1, '2015-06-18', '2015-12-18', 1, 'Tablero desgastado. Sus pilas están al 50%'),
(54, 76, 1, 1, '2015-06-18', '2015-12-18', 1, 'Tablero completo y funcional. Equipo con baja iluminación de los números rojos.'),
(55, 113, 1, 1, '2015-06-18', '2016-06-18', 1, 'Tablero completo y funcional, con apariencia nueva. Sus pilas tienen todavía tienen el tope de vida'),
(56, 114, 1, 1, '2015-06-18', '2015-12-18', 1, 'Tablero completo y funcional, con apariencia nueva. Sus pilas tienen todavía más de la mitad de vida'),
(57, 115, 1, 1, '2015-06-18', '2015-12-18', 1, 'Tablero completo y funcional.'),
(58, 64, 1, 1, '2015-07-02', '2016-01-02', 1, 'TABLERO COMPLETO EN ESTADO REGULAR. Modelo 2011'),
(59, 102, 1, 1, '2015-07-02', '2016-01-02', 1, 'cambio 1 diadema PHO221 por nueva'),
(60, 104, 1, 1, '2015-07-02', '2016-01-02', 1, 'equipo en excelente estado'),
(61, 19, 1, 1, '2015-08-24', '2016-05-11', 1, 'Equipo completo pero ya con bastante uso. Un a diadema con leve pérdida de sensibilidad dejada para el 5to.'),
(62, 70, 1, 1, '2015-08-24', '2016-05-27', 1, 'Equipo completo.Pilas al 50% de vida útil.'),
(63, 81, 1, 1, '2015-08-24', '2016-05-27', 0, 'Tablero completo. Pilas con apennas 20% de vida útil. Prever reemplazo.'),
(64, 21, 1, 1, '2015-09-04', NULL, 1, 'oxidación de las membranas de los microfonos, pilas desgastadas. Reemplazo de 2 pilas y 2 diademas PHO 020 por nuevas. equipo funcional y completo.'),
(65, 62, 1, 1, '2015-09-17', '2016-05-27', 1, 'se había pérdido el enchufe redondo del cargador. repuse un conector redondo 3 pines nuevo'),
(66, 28, 1, 1, '2015-09-29', '2016-05-11', 1, 'prever pronto reemplazo pues el equipo ya esta muy desgastado.'),
(67, 30, 1, 1, '2015-12-16', '2015-12-16', NULL, NULL),
(68, 79, 1, 1, '2015-12-16', '2015-12-16', NULL, NULL),
(69, 91, 1, 1, '2015-12-16', '2015-12-16', NULL, NULL),
(70, 96, 1, 1, '2015-12-16', '2015-12-16', NULL, NULL),
(71, 121, 1, 1, '2015-12-16', '2015-12-16', NULL, NULL),
(72, 124, 1, 1, '2015-12-16', '2015-12-16', NULL, NULL),
(73, 24, 1, 1, '2016-01-07', NULL, 1, 'agregue 1 diadema pues solo contaba con 4. Equipo completo y funcional, pero ya se nota su desgaste.'),
(74, 77, 1, 1, '2016-01-07', '2016-05-27', 1, NULL),
(75, 88, 1, 1, '2016-01-07', '2016-07-07', 1, 'Tablero funcional y completo. carga al 99%. baterias a 3/4 de vida util'),
(76, 113, 1, 1, '2016-01-07', NULL, 1, NULL),
(77, 9, 1, 1, '2016-01-20', NULL, 1, 'Equipo ya muy viejo y desgastado\r\nNo usarlo en partidos sino para refacciones\r\nLleva 5 radios, 4 diademas, 0 abrazabrazo, 0 boton 4to, 5 pilas, 1 cargador completo\r\n'),
(78, 20, 1, 1, '2016-01-20', NULL, 1, 'equipo funcional revisado'),
(79, 23, 1, 1, '2016-01-20', NULL, 1, 'equipo funcional revisado, ya con desgaste visible'),
(80, 24, 1, 1, '2016-01-20', NULL, 1, 'Equipo incompleto (le faltan 3 abrazabrazos) y ya con desgaste visible'),
(81, 26, 1, 1, '2016-01-20', NULL, 1, 'Equipo incompleto (le falta 1 abrazabrazo) y ya con desgaste visible'),
(82, 29, 1, 1, '2016-01-20', NULL, 1, 'equipo funcional pero ya con desgaste visible (2011)'),
(83, 39, 1, 1, '2016-01-20', NULL, 1, 'equipo de 2011 ya muy desgastado. el equipo estaba desconfigurado de los swithces que codifican el color de los banderines.'),
(84, 43, 1, 1, '2016-01-20', NULL, 1, 'equipo en buen estado y completo'),
(85, 120, 1, 1, '2016-01-20', NULL, 1, 'equipo de 2014 en buen estado y funcional'),
(86, 21, 1, 1, '2016-03-15', NULL, 1, NULL),
(87, 21, 1, 1, '2016-03-15', NULL, 1, 'equipo revisado. equipo ya con uso notable pero funcional'),
(88, 99, 1, 1, '2016-03-15', NULL, 1, 'revise todo el equipo. equ pero bien cuidado.equipo funcional y compl,eto . equipo de 2010'),
(89, 26, 1, 1, '2017-02-23', NULL, 1, NULL),
(90, 20, 1, 1, '2017-04-11', NULL, 1, 'equipo ya desgastado, prever su reemplazo'),
(91, 34, 1, 1, '2017-04-11', NULL, 1, NULL),
(92, 99, 1, 1, '2017-04-11', NULL, 1, 'equipo en estado muy regular- prever su reemplazo'),
(93, 125, 1, 1, '2017-04-11', NULL, 1, 'codigo de color desconfigurado'),
(94, 155, 1, 1, '2017-10-18', NULL, NULL, NULL),
(95, 157, 1, 1, '2017-10-18', NULL, NULL, NULL),
(96, 29, 1, 1, '2017-11-15', NULL, 1, NULL),
(97, 35, 1, 1, '2017-11-15', NULL, 1, NULL),
(98, 37, 1, 1, '2017-11-15', NULL, 1, NULL),
(99, 37, 1, 1, '2017-11-15', NULL, 2, NULL),
(100, 125, 1, 1, '2017-11-15', NULL, 1, 'equipo OK'),
(101, 151, 1, 1, '2017-11-15', NULL, 1, NULL),
(102, 161, 1, 1, '2017-11-15', NULL, NULL, NULL),
(103, 168, 1, 1, '2017-11-15', NULL, 1, NULL),
(104, 142, 1, 1, '2017-11-29', NULL, 1, 'equipo revisado.Lleva cargador pero le falta su estuche. equipo funcional y en buen estado'),
(105, 82, 1, 1, '2018-01-10', NULL, 1, 'equipo de 2011 en buen estado. buena carga de baterías  todavía'),
(106, 168, 1, 1, '2018-09-12', NULL, 1, NULL),
(107, 128, 1, 1, '2018-09-19', NULL, 1, NULL),
(108, 134, 1, 1, '2018-09-19', NULL, 1, NULL),
(109, 139, 1, 1, '2018-09-19', NULL, 1, NULL),
(110, 154, 1, 1, '2018-09-19', NULL, 1, NULL),
(111, 73, 1, 1, '2018-10-03', NULL, NULL, NULL),
(112, 90, 1, 1, '2018-10-03', NULL, NULL, NULL),
(113, 94, 1, 1, '2018-10-03', NULL, NULL, NULL),
(114, 103, 1, 1, '2018-10-03', NULL, NULL, NULL),
(115, 105, 1, 1, '2018-10-03', NULL, NULL, NULL),
(116, 106, 1, 1, '2018-10-03', NULL, 1, NULL),
(117, 154, 1, 1, '2018-10-03', NULL, 1, NULL),
(118, 164, 1, 1, '2018-10-03', NULL, 1, NULL),
(119, 165, 1, 1, '2018-10-03', NULL, 1, NULL),
(120, 167, 1, 1, '2018-10-03', NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `operation`
--

CREATE TABLE `operation` (
  `id_oper` int(11) NOT NULL,
  `intitule` varchar(100) NOT NULL,
  `operation` varchar(200) NOT NULL,
  `periode` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `operation`
--

INSERT INTO `operation` (`id_oper`, `intitule`, `operation`, `periode`) VALUES
(1, 'revision', 'revision completa del funcionamiento  del equipo', 'm6');

-- --------------------------------------------------------

--
-- Table structure for table `panne`
--

CREATE TABLE `panne` (
  `id_panne` int(11) NOT NULL,
  `id_machine` int(11) NOT NULL,
  `id_interv` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `organe` varchar(200) DEFAULT NULL,
  `operation` varchar(200) DEFAULT NULL,
  `nature_panne` varchar(200) DEFAULT NULL,
  `cause_panne` varchar(200) DEFAULT NULL,
  `garantie` tinyint(1) NOT NULL DEFAULT '0',
  `temps_darret` int(11) DEFAULT NULL,
  `PR` varchar(100) DEFAULT NULL,
  `tps_interv` int(11) DEFAULT NULL,
  `compteur` int(11) DEFAULT NULL,
  `commentaire` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `panne`
--

INSERT INTO `panne` (`id_panne`, `id_machine`, `id_interv`, `date`, `organe`, `operation`, `nature_panne`, `cause_panne`, `garantie`, `temps_darret`, `PR`, `tps_interv`, `compteur`, `commentaire`) VALUES
(1, 10, 1, '2012-10-24', NULL, 'revision completa de la comunicación', 'no funciona', 'seguramente los conectores de las diademas estaban mal enchufados', 0, 5, '0', 0, 0, NULL),
(2, 7, 1, '2012-10-31', 'pantalla 5to radio enuncia Problema DSP6900 pero se le quito solo...', 'reemplace pila, apague y volvi a prenderlo....y funcionó....', 'ya funciona el 5to radio, pero reemplace una diadema por una nueva PHO020', 'perdida de sensibilidad del micro de una diadema', 1, 7, '1Diadema PHO020', 2, 0, NULL),
(3, 34, 1, '2012-10-31', 'Pager', 'reemplazo pila por nueva', 'no chifla el pager', 'pila del pager baja', 1, 7, '1 pila 9V', 1, 0, 'Limpieza y secado del pager pues estaba humedo.'),
(4, 17, 1, '2012-10-31', '2 diademas fallando', 'reemplazo de 2 diademas por PHO020', '2 diademas fallando', 'perdida de sensibilidad de los microfonos', 1, 7, '2 Diademas PHO020', 1, 0, 'Le di al Profesor Carlos Gonzalez irribare 2 diademas nuevas PHO020'),
(5, 46, 1, '2012-11-09', 'Modulo completo del pager', 'reemplazo completo del modulo electronico de pager y del buzzer', 'componentes electronicos fuera de servicio', 'Parece que hubo un golpe fuerte en el medio de la caja de hule del pager, esta muy marcado el hule en su interior', 0, 7, '1', 2, 0, 'equipo muy dañado. le cambie el modulo electronico completo de pager + buzzer + 1 eje'),
(6, 41, 1, '2012-11-09', 'soldadura conector pila-circuito del pager jalada', 'resoldé las conexiones de la pila al circuito electronico', 'no prende el pager', 'jalon del conector de pila', 0, 0, '1', 0, 0, NULL),
(7, 28, 1, '2012-11-09', NULL, 'cambio de 2 pilas y 1 diadema', 'no funciona', '1 diadema con perdida de sensibilidad del micro', 1, 0, '2', 0, 0, NULL),
(8, 34, 1, '2012-12-12', NULL, 'revision completa', NULL, NULL, 0, 0, '0', 0, 0, 'ok'),
(9, 53, 1, '2012-12-12', NULL, 'revision completa', NULL, NULL, 0, 0, '0', 0, 0, NULL),
(10, 46, 1, '2012-12-12', NULL, 'revision completa', NULL, NULL, 0, 0, '0', 0, 0, NULL),
(11, 36, 1, '2012-12-12', NULL, 'revision completa', NULL, NULL, 0, 0, '0', 0, 0, NULL),
(12, 38, 1, '2012-12-12', 'pila pager', 'revision completa', 'pila pager baja-la reemplaze por nueva', NULL, 0, 0, '0', 0, 0, NULL),
(13, 37, 1, '2012-12-12', NULL, 'revision completa', NULL, NULL, 0, 0, '0', 0, 0, NULL),
(14, 39, 1, '2012-12-12', NULL, 'revision completa', NULL, NULL, 0, 0, '0', 0, 0, NULL),
(15, 41, 1, '2012-12-12', NULL, 'revision completa', NULL, NULL, 0, 0, '0', 0, 0, NULL),
(16, 40, 1, '2012-12-12', NULL, 'revision completa', NULL, NULL, 0, 0, '0', 0, 0, NULL),
(17, 4, 1, '2012-12-12', NULL, 'revision completa', NULL, NULL, 0, 0, '0', 1, 0, NULL),
(18, 11, 1, '2012-12-12', NULL, 'revisión completa', NULL, NULL, 0, 0, '0', 1, 0, NULL),
(19, 10, 1, '2012-12-12', NULL, 'revision completa', NULL, NULL, 0, 0, '0', 1, 0, 'equipo con 4 radios, 1 radio faltante desaparecido...!'),
(20, 20, 1, '2012-12-12', NULL, 'revision completa', NULL, NULL, 0, 0, '0', 1, 0, 'equipo en perfecto estado y bien cuidado'),
(21, 27, 1, '2012-12-12', NULL, 'revision completa', NULL, NULL, 0, 0, '0', 1, 0, 'equipo en perfecto estado'),
(22, 28, 1, '2012-12-12', NULL, 'revision completa', NULL, NULL, 0, 0, '0', 1, 0, 'equipo en perfecto estado'),
(23, 39, 1, '2013-01-24', 'pager', 'cambio de la pila del pager', 'pila del pager baja', 'desgaste', 0, 1, '50', 1, 0, NULL),
(24, 19, 1, '2013-01-28', 'pantalla radio 5 HS-tiene rayas horizontales apagadas', 'cambio de la pantalla', 'pantalla HS', '?', 0, 7, '1', 1, 0, 'cambie la pantalla del radio 5 por nueva'),
(25, 25, 1, '2013-01-28', 'diadema rota y con cables jalados y le falta 1 diadema al equipo', 'remmplazo de 2 diademas', 'diadema fallando', 'cables jalados y descuido del equipo', 0, 8, '2', 1, 0, 'el equipo venia con 4 diademas solamente. repuse 1 diadema PHO 020 y otra ya usada. en total repuse 2 diademas al equipo N10'),
(26, 31, 1, '2013-02-13', 'paqer', 'reemplazo de la pila del pager', 'pila 9V baja', 'uso', 0, 3, '1', 1, 0, 'reemplace la píla del pager que estaba baja.'),
(27, 21, 1, '2013-02-18', 'diadema pho 020', 'reemplazo por nueva', 'extremidad micro roto', 'choque?', 0, 5, '1', 1, 0, '1 diadema pho020 rota en la punta del mkicrofono, la reemplaze por nuieva'),
(28, 46, 1, '2013-02-18', 'pager', 'reemplazo pila', 'pila delpager HS', 'uso', 0, 5, '1', 1, 0, 'reemplazo de la pila del pager'),
(29, 53, 1, '2013-02-18', 'pager', 'cambio de pila', 'pila HS', 'uso', 0, 5, '1', 1, 0, 'reemplazo de la piloa del pager'),
(30, 28, 1, '2013-02-18', 'diadema faltante', 'repuse 1 diadema nueva PHO020', 'faltaba 1 diadema', 'se perdio 1 diadema', 0, 1, '1', 1, 1, 'faltaba 1 diadema estandar PHO020, la repuse'),
(31, 25, 1, '2013-02-18', '1 pila y 1 diadema', 'reemplazo de pila y diadema', '1 pila y 1 diadema fallando', 'cable de diadema maltratado- 1 pila totalmente descargada', 0, 2, '2', 2, 1, NULL),
(32, 28, 1, '2013-03-04', '1 radio ya no prende Y 1 DIADEMA CON MICRO perdida de sensibilidad', 'me lo llevo para checarlo', 'a identificar con diagnostico profundo', NULL, 0, 8, '1', 0, 0, 'me llevo el radio a diagnostico de falla Y REPONGO 1 DIADEMA ESTANDAR pho020'),
(33, 27, 1, '2013-03-04', '1 bateria HS', 'reemplazo de bateria', 'bateria dañada, ya no lleva ninguna carga y no quiere cargar...', 'Choque?', 0, 8, '1', 1, 0, NULL),
(34, 38, 1, '2013-03-04', 'pager ', 'reemplazo del speaker', 'el mpager vibra pero no chilla', 'speaker HS, membrana perforada', 0, 8, '2', 2, 1, 'cambie un speaker y la bateria del pager'),
(35, 49, 1, '2013-03-13', NULL, 'reencryptado y reemplazo 2 diademas estandares', 'desencryptado y 2 diademas fallando', 'secado mal realizado de las diademas y intervencion en el equipo que causo desencryptado', 0, 8, '0', 0, 1, NULL),
(36, 60, 1, '2013-03-13', 'cargador', 'cambio de cargador pues el que estaba solo da 6Vcc', 'cargador ya no carga', 'uso?', 0, 0, '0', 0, 1, NULL),
(37, 16, 1, '2013-04-08', NULL, 'falta 1 diadema y 1 cable de cargador-repuse 2 diademas', 'se escucha un ruido de fondo', '2 diademas generan el ruido de fondo', 0, 4, '2', 0, 0, 'cuidar todas las partes del equipo'),
(38, 20, 1, '2013-04-08', NULL, 'reemplazo 1 diadema', '1 diadema genera interferencias', NULL, 0, 1, '1', 1, 0, NULL),
(39, 21, 1, '2013-04-08', NULL, 'reemplazo de 1 diadema', '1 diadema PHO020 fuera de servicio', 'descuido de la diadema', 0, 0, '0', 0, 0, NULL),
(40, 25, 1, '2013-04-08', NULL, 'reemplazo 1 diadema y de 1 pila', '1 pila totalmente descargada y 1 diadema fallando', 'descuido del equipo', 0, 5, '1', 2, 0, NULL),
(41, 27, 1, '2013-04-08', NULL, 'reemplazo 2 diademas y 1 pila', '2 diademas generan interferencias y 1 pila fuera de servicio', 'descuido del equipo', 0, 5, '1', 0, 0, NULL),
(42, 28, 1, '2013-04-08', '1 radio HS', 'me lleve 1 radio para reparacion mayor', '1 radio fuera de servicio', 'no se que origino esta falla', 0, 0, '0', 0, 0, 'el radio fue reparado por adeunis-RRF en francia'),
(43, 9, 1, '2013-04-08', NULL, 'reemplazo de 2 diademas', '2 diademas fallando', 'humedad, perdida de sensibilidad del microfono', 0, 6, '2', 1, 0, NULL),
(44, 10, 1, '2013-04-08', NULL, 'repuse el 5to radio reparado y 1 diadema PHO010', 'pilas totalmente descargadas', NULL, 0, 5, '1', 0, 0, NULL),
(45, 11, 1, '2013-04-08', NULL, 'reemplazo 1 diadema', 'perdida de sensibilidad del microfono de 1 diadema', 'humedad', 0, 5, '0', 0, 0, NULL),
(46, 11, 1, '2013-08-30', NULL, 'limpieza con espray dielectrico', 'diadema 5to radio con perdida de sensibilidad', NULL, 0, 5, '0', 0, 0, NULL),
(47, 7, 1, '2013-08-30', NULL, 'reemplazo 1 diadema', '1 diadema con perdida de sensibilidad', NULL, 0, 8, '0', 0, 0, NULL),
(48, 10, 1, '2013-08-30', NULL, 'reemplazo de 2 diademas-ajuste sensibilidad 5to radio', 'radio 5 con perdida de sensibilidad en la entrada microfono', NULL, 0, 6, '0', 0, 1, NULL),
(49, 9, 1, '2013-08-30', NULL, 'hay que insistir para que cargue-fijarse en foco rojo fijo del cargador', 'cargador delicado', NULL, 0, 5, '2', 0, 0, NULL),
(50, 3, 1, '2013-08-30', 'reemplazo de 2 diademas', 'me lleve el 5to radio para reparacion', '5to radio, no funciona la entrada microfono y se apága de repente', 'probable choque del 5to radio', 0, 5, '2', 2, 0, 'el equipo no lleva cargador'),
(51, 27, 1, '2013-08-30', NULL, 'reconfiguracion 5to y reemplazo de 2 diademas', '5to radio en m odo listener-2 diadema scon poca sensibilidad de microfono', NULL, 0, 5, '2', 2, 0, NULL),
(52, 26, 1, '2013-09-03', NULL, 'cambio de 1 pantalla y 1 diadema', '1 radio con pantalla rota', NULL, 0, 4, '1', 2, 1, NULL),
(53, 23, 1, '2013-09-11', NULL, 'ajuste de sensibilidad', 'perdida de sensibilidad entrada micro radio 1', 'propblema de conector, agrega impedencia', 0, 5, '0', 2, 0, NULL),
(54, 25, 1, '2013-09-11', NULL, 'reemplazo de 1 boton PTT y 1 diadema', 'boton PTT fuera de servicio', 'probable choque del boton', 0, 7, '1', 2, 0, NULL),
(55, 11, 1, '2013-09-17', NULL, 'reemplazo de 2 diademas y reencryptado', 'equipo desencryptado y perdida de sensibilidad en 2 diademas', NULL, 0, 6, '2', 3, 0, NULL),
(56, 11, 1, '2013-10-10', NULL, 'el equipo se queda para efecto de refacciones', 'equipo incompleto, le falta las 5 diademas, el cargador y su cable de alimentacion asi como 1 radio', 'perdida de material', 0, 4, '0', 1, 0, 'el equipo se queda para efecto de refacciones'),
(57, 23, 1, '2013-10-21', NULL, 'reemplazo de 2 diademas', 'radio 3 no funciona', 'microfon de diadema roto', 0, 4, '2', 2, 1, 'le faltaba 1 diadema al equipo mas otra rota...pantalla 5to radio parpadea...parece que tuvo choque.'),
(58, 3, 1, '2013-10-21', '2 diademas', 'reemplazo de 2 diaqdemas', 'comunicacion cortada en 2ndo tiempo', '2 diademas con perdida de sensibilidad (oxidacion microfono)', 0, 3, '2', 2, 1, 'bien secar las diademas al finalizar cada partido'),
(59, 27, 1, '2013-10-21', '1 diadema', 'reemplazo de 1 diadema', 'no se escucha radio 2', 'cable de diadema arrancado', 0, 4, '1', 1, 1, 'hay que desconectar jalando el conector y no el cable'),
(60, 40, 1, '2013-11-04', NULL, NULL, 'equipo fuera de servicio', 'mal uso y falta de partes', 0, 1000, '0', 3, 0, NULL),
(61, 52, 1, '2013-11-04', NULL, NULL, 'equipo fuera de servicio', 'mal uso', 0, 1000, '0', 3, 0, 'equipo de 2009 ya muy desgastado. funciona pero mal puies el silbido asi como las vibraciones sonb muy débiles.'),
(62, 45, 1, '2013-11-04', NULL, NULL, 'equipo fuera de servicio', 'faltan partes....', 0, 1000, '0', 3, 0, NULL),
(63, 49, 1, '2013-11-04', NULL, 'recodificacion emisores-receptor', 'no hay comunicacion banderines-pager', 'se mezclaron pagers entre equipos', 0, 9, '1', 5, 1, 'cambio de  2 pilas 9V'),
(64, 47, 1, '2013-11-04', NULL, 'recodificacion emisores-receptor', 'no hay comunicacion banderines-pager', 'se mezclaron pagers entre equipos', 0, 9, '1', 5, 1, 'cambio de  2 pilas 9V'),
(65, 50, 1, '2013-11-04', NULL, 'recodificacion emisores-receptor', 'no hay comunicacion banderines-pager', 'se mezclaron pagers entre equipos', 0, 9, '1', 5, 1, 'cambio de  2 pilas 9V'),
(66, 44, 1, '2013-11-04', NULL, 'recodificacion emisores-receptor', 'no hay comunicacion banderines-pager', 'se mezclaron pagers entre equipos', 0, 9, '1', 5, 1, 'cambio de  2 pilas 9V'),
(67, 30, 1, '2013-11-04', NULL, 'recodificacion emisores-receptor', 'no hay comunicacion banderines-pager', 'se mezclaron pagers entre equipos', 0, 9, '1', 5, 1, 'cambio de  2 pilas 9V'),
(68, 18, 1, '2013-11-11', NULL, 'cambio 1 diadema y del boton PTT', 'no se escucha bien', NULL, 0, 8, '2', 5, 1, NULL),
(69, 23, 1, '2013-11-11', NULL, 'cambio 1 diadema', 'no se escucha bien', NULL, 0, 8, '1', 4, 1, NULL),
(70, 20, 1, '2014-01-06', 'diadema estandar PHO 020 no funciona', 'diadema estandar PHO 020 reemplazada por nueva', '1 diadema fuera de servicio', 'cables de la diadema jalados', 0, 4, '2', 2, 1, 'equipo revisado enteramente hoy, funciona perfectamente pero le faltan los 4 abrazabrazos, solo lleva 1 cinturón'),
(71, 26, 1, '2014-01-06', NULL, 'revision completa', 'ninguna', NULL, 0, 0, '1', 1, 1, 'revision completa del equipo. funciona perfectamente.'),
(72, 27, 1, '2014-01-06', 'pila', 'cambio de 1 pila por nueva', '1 pila HS', 'No sé', 0, 4, '1', 2, 1, 'equipo revisado y operacional'),
(73, 28, 1, '2014-01-06', 'pilas y diademas', 'reemplazo 2 pilas y 1 diadema', '2 pilas HS y 1 diademas con cables arrancados', 'no se', 0, 20, '2', 4, 1, 'equipo descuidado y desgastado, prever su reemplazo.'),
(74, 33, 1, '2014-01-06', NULL, NULL, 'revision completa', NULL, 0, 0, '0', 1, 1, 'equipo perfectamente funcional'),
(75, 39, 1, '2014-01-06', NULL, NULL, 'revision completa', NULL, 0, 0, '0', 1, 1, 'equipo perfectamente funcional'),
(76, 69, 1, '2014-01-06', 'cargador fuera de servicio', 'el cargador fue intervenido, hay rastros de perforación', 'cargador de batería fuera de servicio', 'el cargador fue manipulado por una persona que no lleva la responsabilidad del mantenimiento del equipo', 0, 10, '0', 2, 1, 'el equipo debe comprar un nuevo cargador con el proveedor AMB Elettronic'),
(77, 36, 1, '2014-01-06', NULL, NULL, 'revision completa', NULL, 0, 0, '0', 1, 1, 'funciona OK'),
(78, 37, 1, '2014-01-06', NULL, NULL, 'revision completa', NULL, 0, 0, '0', 1, 1, 'funciona OK'),
(79, 38, 1, '2014-01-06', 'pila 9V', 'reemplazo 1 pila del pager', 'revision completa', NULL, 0, 0, '1', 2, 1, 'funciona OK'),
(80, 31, 1, '2014-01-06', NULL, NULL, 'revision completa', NULL, 0, 0, '0', 1, 1, 'funciona OK'),
(81, 35, 1, '2014-01-06', 'trajeta electronica del pager', 'reemplazo de la tarjeta del pager', 'diodo LED desoldado y tarjeta electronica pager fuera de servicio', 'pager abierto por tercero', 0, 12, '1', 5, 1, 'revision completa, equipo OK'),
(82, 22, 1, '2014-01-06', NULL, NULL, 'revision completa', NULL, 0, 0, '0', 1, 1, 'equipo OK'),
(83, 23, 1, '2014-01-06', NULL, NULL, 'revision completa', NULL, 0, 0, '0', 1, 1, 'equipo OK'),
(84, 25, 1, '2014-01-06', NULL, 'reemplazo 1 diadema y 1 pila', '1 diadema no funciona', '1 diadema con cables jalados', 0, 14, '1', 3, 1, 'equipo OK aun que muy descuidado'),
(85, 24, 1, '2014-01-06', 'diademas dañadas', 'reemplazo de 3 diademas', 'no funciona', 'humedad, descuidom jalon de los cables?', 0, 16, '3', 7, 1, 'equipo OK'),
(86, 18, 1, '2014-01-06', NULL, NULL, 'revision completa', NULL, 0, 0, '0', 1, 1, 'equipo OK'),
(87, 25, 1, '2014-01-14', 'diadema estandar fallanado', 'reemplazo de 1 diadema estandar', '1 diadema estandar con perdida de sensibilidad en el microfono', 'humedad?', 0, 6, '1', 1, 1, NULL),
(88, 29, 1, '2014-01-14', NULL, NULL, 'revision completa del equipo', NULL, 0, 0, '0', 2, 1, 'equipo OK'),
(89, 16, 1, '2014-01-14', '5 pilas desgastadas', 'reemplazo de las 5 pilas por nuevas', 'el equipo deja de funcionar despues de 50\'', 'pilas bajas-no almacenan suficiente energía', 0, 3, '5', 3, 1, 'equipo OK'),
(90, 34, 1, '2014-01-14', '1 pila 9V y 2 ejes', 'reemplazo de 1 pila y 2 ejes', 'pila del pager HS', 'uso normal', 0, 6, '1', 3, 1, 'equipo OK pero no lleva las 2 banderas'),
(91, 17, 1, '2014-01-14', NULL, 'reemplazo de 1 diadema', 'no funciona', '1 diadema con perdida de sensibilidad en el microfono', 0, 0, '0', 0, 1, 'equipo OK'),
(92, 30, 1, '2014-01-14', NULL, 'reemplazo pila del pager', 'pila del pager baja', 'uso', 0, 5, '1', 2, 1, 'equipo OK'),
(93, 69, 1, '2014-01-20', 'CI AMB V3.9', 'reemplazo del CI', 'equipo abierto por persona ajena', 'patita del CI AMB V3.9 cortada', 0, 4, '1', 4, 1, 'Cabe mencionar que el equipo ya no lleva un solo tornillo que lo mantenga cerrado'),
(94, 18, 1, '2014-01-20', 'diadema PHO 020', 'reemplazo 1 diadema PHO 020', '1 diadema ya no se escuicha', '1 diadema con cables jalados, ', 0, 3, '1', 1, 1, NULL),
(95, 22, 1, '2014-01-20', NULL, 'limpieza completa de los conectores tanto de diademas como de radios', '1 diadema no funciona', 'no encontre una diadema que este fallando, tal vez estaba mal enchufada', 0, 4, '0', 2, 1, NULL),
(96, 30, 1, '2014-01-27', 'boton de encendido que cuyidar, prever su reemplazo en el caso que vuelva a suceder', 'Devolvi movilidad al boton de encendido con lipidor de contactos.', 'boton de encendido se queda empujado', 'corrosion debida a la humedad en el pager', 0, 5, '0', 2, 1, NULL),
(97, 29, 1, '2014-01-27', 'palo con rosca roto', 'reemplazo completo del palo, tope y tubo liso', 'Palo de un banderin roto', 'golpe?', 0, 6, '1', 3, 1, NULL),
(98, 38, 1, '2014-01-27', 'topede tubo  con rosca', 'reemplazo por nuevo del tope con rosca', 'tope con rosca de tubo roto', 'golpe?', 0, 5, '1', 1, 1, NULL),
(99, 22, 1, '2014-01-27', 'diadema fallando', 'retiro de la esfera', '1 didadema no se escucha', 'esta diadema llevaba una esferita que tapaba el canal auricular de la diadema', 0, 5, '0', 2, 1, NULL),
(100, 30, 1, '2014-02-04', 'Circuito electroniuco del pager', 'cambie por nuevo el circuito electronico.', 'se queda atorado el vibrador', 'circuito electronico en corto por infiltracion de agua.', 0, 5, '1', 3, 1, NULL),
(101, 34, 1, '2014-02-04', NULL, 'reemplazo completo de un tubo con rosca, tapon y rondana', 'sa zafa la bandera del palo', 'tubo roto y no trae tapon', 0, 5, '1', 2, 1, NULL),
(102, 17, 1, '2014-02-04', '1 diadema estandar', 'reemplazo de 1 diadema', 'se escucha mal', '1 micro con perdida de sensibilidad genera perturbaciones que molestan.', 0, 6, '1', 1, 1, NULL),
(103, 22, 1, '2014-02-04', NULL, NULL, 'cambio de 1 diuadema por lesly', NULL, 0, 2, '1', 1, 1, NULL),
(104, 24, 1, '2014-02-04', 'cambio de 1 pila', 'reemplazo de 1 pila y carga completa de las 5 pilas', 'el radio 3 se apaga solo', '1 pila que ya no aguanta carga', 0, 5, '1', 3, 1, NULL),
(105, 21, 1, '2014-02-13', 'reemplazo de 1 diadema estandar', 'limpieza de las conexiones', 'boton de cuarto y 1 diadema fallando', 'malas conecciones', 0, 6, '1', 2, 1, NULL),
(106, 37, 1, '2014-02-13', NULL, 'cambio de 2 pilas y resolde el cable de alimentación', 'se apaga solo', '2 pilas HS y cable de alimentacion desoldado', 0, 7, '2', 3, 1, NULL),
(107, 24, 1, '2014-02-21', '2 pilas cambiadas', 'limpieza de los pines y reemplazo de 2 pilas muy rayadas en los contactos', 'el radio 1 se apaga solo y se pierde toda comunicacion', 'falso contacto entre pila y pines de cobre', 0, 7, '2', 3, 1, NULL),
(108, 36, 1, '2014-02-21', NULL, 'reemplazo de una tapa roscada y 1 rondana', 'tapa rota en un banderin', 'choque?', 0, 4, '1', 2, 1, NULL),
(109, 16, 1, '2014-02-21', '1 pila reemplazada por nueva', 'limpieza de los contactos y cambio de 1 pila', 'radio 1 se apaga solo', 'contactos de obre de la pila muy rayados, se pierde continuidad', 0, 4, '1', 1, 1, NULL),
(110, 10, 1, '2014-02-21', NULL, 'cambio de 2 diademas y 1 bton de cuarto', 'una diadema y el boton de cuarto no funcionan', '2 diademas fuera de servicio', 0, 6, '2', 3, 1, NULL),
(111, 69, 1, '2014-02-21', NULL, 'recarga de las baterías', 'no prende', 'tarjeta electronica dañada pues el equipo no funciona si el voltaje esta por debajo de los 13V', 0, 10, '0', 5, 1, 'hay que preveer el reemplazoi del equipo pues el costo de la tarjeta equivale al precio de un equipo nuevo'),
(112, 29, 1, '2014-02-28', NULL, 'cambio de pila del pager', 'pager no funciona', 'volatje de pila del pager bajo', 0, 3, '1', 2, 1, NULL),
(113, 16, 1, '2014-02-28', 'contactos de pila muy rayados, cambio por pila nueva', 'limpiador de contactos y cambio de pila del radio 1', 'solo funcionan los radios 3 y 4', 'perdida de conductividad en los contactos de pila del radio 1', 0, 5, '1', 2, 1, NULL),
(114, 20, 1, '2014-02-28', NULL, 'cambio de pila (contactos rayados) y limpieza de contactos radio 1', 'se pierde la comunicación', 'radio 1 se apaga por discontinuidad en conector pila', 0, 5, '1', 1, 1, NULL),
(115, 20, 1, '2014-03-05', NULL, 'revisión completa del equipo-equipo 100% funcional', NULL, NULL, 0, 0, '0', 0, 1, NULL),
(116, 30, 1, '2014-03-05', NULL, 'reemplazo de la pila del pager y repuse un eje', 'pila del pager con bajo voltaje', 'uso...', 0, 5, '1', 0, 1, NULL),
(117, 33, 1, '2014-03-05', NULL, NULL, 'revision completa del equipo. equipo 100% funcional', NULL, 0, 0, '0', 0, 1, NULL),
(118, 69, 1, '2014-03-05', NULL, NULL, 'revision completa del equipo. equipo 100% funcional y 100& cargado', NULL, 0, 0, '0', 0, 1, NULL),
(119, 29, 1, '2014-03-05', NULL, NULL, 'cambio de las 3 pilas pues ya no tenían suficiente carga', NULL, 0, 5, '3', 2, 1, NULL),
(120, 23, 1, '2014-03-11', NULL, 'ajustes y limpieza de conectores', '2 diademas con microfono fallando', 'equipo ya viejo y coon varios detalles', 0, 5, '2', 3, 1, 'prever reemplazo del equipo'),
(121, 10, 1, '2014-03-11', 'repuse tuerca de conector al radio 3 que ya no llevaba', 'reencryptado y cambio por nevas de 2 diademas', 'radios 2,3 y4 fallando', 'equipo desencryptado', 0, 5, '2', 3, 1, 'equipo ya muy desgastado, prever su reemplazo'),
(122, 33, 1, '2014-03-18', NULL, NULL, 'no funciona', 'pila del pager FS', 0, 5, '1', 1, 1, NULL),
(123, 10, 1, '2014-03-18', NULL, NULL, '3 pilas FS', 'Corto circuito en las pilas? cargador erroneo?', 0, 6, '3', 0, 1, NULL),
(124, 42, 1, '2014-03-18', 'repuse los 2 ejes del abrazabrazo', 'cambio de 2 pilas 1 de banderin y otra del pager', NULL, NULL, 0, 9, '2', 3, 1, NULL),
(125, 29, 1, '2014-03-18', 'cambio de las 3 pilas', 'repuse y rearme los tubos y rondanas de los 2 banderines', 'no funciona', 'pilas descargadas', 0, 9, '3', 3, 1, NULL),
(126, 18, 1, '2014-03-25', NULL, 'removí la oxidacio del contaco + radio 1', 'radio 1 se apagó repentinamente durante el partido', 'contacto + radio con pila muy oxidado impidiendo continuidad electrica', 0, 5, '1', 3, 1, NULL),
(127, 92, 1, '2014-04-08', 'reemplazo 1 diadema PHO 220', 'limpieza complk,eta del conector radio 4', 'microfono radio 4 no se escucha', 'conector radio 4 con suciedades', 1, 0, '1', 3, 1, 'ademas reemplaze 1 diadema PHO220 que tenía los pines de plastico rotos'),
(128, 18, 1, '2014-04-08', 'pilas HS', 'reemplazo de 2 pilas por nuevas', 'problema de carga de las pilas', '2 pilkas HS y oxidacion en conectores', 0, 5, '2', 2, 1, NULL),
(129, 23, 1, '2014-04-08', '4 pílas FS', 'cambie las 5 pilas y limpie conectores', 'boton y 2 diademas fallan', 'conectores oxidados y 4 pilas FS', 0, 5, '5', 3, 1, NULL),
(130, 34, 1, '2014-04-08', NULL, 'cambio de 1 pila de banderin', 'pila de 1 banderin baja', 'uso', 0, 5, '1', 1, 1, NULL),
(131, 31, 1, '2014-04-08', NULL, 'cambio de la pila del pager', 'revisar equipo', 'pila del pager baja', 0, 3, '1', 1, 1, NULL),
(132, 36, 1, '2014-04-08', NULL, 'equipo funcional', 'revisar equipo', NULL, 0, 0, '0', 1, 1, NULL),
(133, 20, 1, '2014-04-14', NULL, NULL, 'comiunicacion se entre corta', 'no encontre problema, cambie de tabla- ahora estan en US2', 0, 5, '0', 2, 1, 'cambie a tabla US2 para ver si asi no se entrecorta la comunicacion.'),
(134, 18, 1, '2014-07-22', '2 conectores de diademas hacian falsos contactos', 'limpieza completa de conectores y enderazado de pines', 'noi funcionaron 2 diademas', 'problemas de conectores...', 0, 5, '0', 2, 1, NULL),
(135, 92, 1, '2014-07-22', 'repuse radio 4 reparado', NULL, 'PTT fallando', 'lo probe y funciona', 0, 0, '0', 3, 1, NULL),
(136, 22, 1, '2014-07-22', NULL, 'cambio por nuevo de boton PTT', 'falla boton PTT', 'boton PTT HS-no da ni hp ni micro...', 0, 5, '1', 3, 1, NULL),
(137, 95, 1, '2014-07-22', 'repuse el boton PTT traido de francia', 'cambio del boton PTT por nuevo', NULL, NULL, 0, 25, '1', 1, 1, NULL),
(138, 26, 1, '2014-08-20', NULL, 'ajustes de sensibilidad y limpiador de contactos', 'solo se escuchan 2 radios', 'perdida de sensibilidad en los microfonos y fallas de conectividad en conectores de diademas', 0, 5, '0', 3, 1, NULL),
(139, 94, 1, '2014-08-20', NULL, NULL, '4 diademas con guias rotas, las cambie por 4 diademas PHO220 nuevas', NULL, 1, 0, '4', 1, 1, NULL),
(140, 23, 1, '2014-08-21', NULL, 'reemplazo de 1 diadema', 'no se escucha una diadema', 'cable de la diadema arrancado', 0, 5, '1', 3, 1, NULL),
(141, 84, 1, '2014-08-21', NULL, 'reemplazo de las 2 pilas', 'las 2 pilas aunque de 2013 ya no aguantaban la carga', 'defecto en las pilas????', 0, 5, '2', 3, 1, 'Cabe mencionar que este equipo fue abierto, ya no lleva ningun tornillo que lo mantenga cerrado y se perdio el tapa conector para la carga.'),
(142, 16, 1, '2014-08-25', NULL, 'reemplazo de 2 diademas', '2 diademas HS', 'perdida de sensibilidad en el microfono', 0, 5, '2', 3, 1, NULL),
(143, 23, 1, '2014-08-25', NULL, 'cambio de 2 diademas por nuevas', 'le faltaba 1 diadema y otra falla de microfono', 'humedad?', 0, 3, '2', 2, 1, NULL),
(144, 24, 1, '2014-08-25', NULL, 'reemplazo de 2 diademas por nuevas', '2 diademas FS, perdida de sensibilidad del microfono', 'humedad?', 0, 6, '2', 3, 1, NULL),
(145, 22, 1, '2014-08-25', NULL, 'cambio de boton nuevamente', 'nuevamente falla del boton 4to que no comuta microfono al radio', 'Que hacen con este botón?', 0, 5, '1', 5, 1, NULL),
(146, 16, 1, '2014-09-02', 'pantalla de radio con lineas de led apagadas', 'cambio de la pantalla del radio por nueva', '1 radio con pantalla rayada', 'choque en la pantalla', 0, 5, '1', 0, 1, NULL),
(147, 90, 1, '2014-09-02', NULL, 'reubique la pantalla bien colocada en el CI', '1 radio se apaga solo', 'pantalla desenc hufada del CI', 0, 5, '0', 3, 1, NULL),
(148, 17, 1, '2014-09-02', NULL, NULL, 'revision del equipo - OK', NULL, 0, 0, '0', 1, 1, NULL),
(149, 24, 1, '2014-09-02', NULL, 'la diadema con perdida de sensibilidad se queda de 5ta diadema en el equipo, como refaccion', '1 diadema con perdida de sensibilidad', 'humedad', 0, 5, '0', 3, 1, NULL),
(150, 23, 1, '2014-09-02', NULL, NULL, 'revision del equipo - equipo funcional y completo', NULL, 0, 0, '0', 1, 1, NULL),
(151, 35, 1, '2014-09-02', NULL, 'cambio de la pila del pager por nueva', 'pila del pager baja', 'uso', 0, 3, '1', 1, 1, NULL),
(152, 18, 1, '2014-09-15', NULL, 'recorte aislante del 4to radio', 'no se escucha 4to', 'aislante desborda en conector 4to radio', 0, 5, '0', 2, 1, NULL),
(153, 21, 1, '2014-09-15', NULL, NULL, '1 diadema no se escucha y 1 pila no carga', 'reemplazo 1 diadema y 1 pila', 0, 3, '1', 3, 1, NULL),
(154, 95, 1, '2014-09-15', NULL, 'recorte aislante', '4to no se escucha', 'aislante desborda en conector', 0, 3, '0', 0, 1, NULL),
(155, 27, 1, '2014-09-15', NULL, 'reemplazo de 1 diadema', '1 diadema no se escucha', 'perdida de sensibilidad del microfono', 0, 3, '1', 0, 1, NULL),
(156, 26, 1, '2014-09-15', NULL, 'reemplazo de 1 diadema', '1 diadema con perdida de sensibilidad', 'oxidacion de la membrana del microfono', 0, 3, '1', 0, 1, NULL),
(157, 40, 1, '2014-09-15', NULL, 'cambio de la pila por nueva', 'pila del pager baja', 'uso', 0, 0, '1', 0, 1, NULL),
(158, 31, 1, '2014-09-15', NULL, 'resolde cable y cambio pila', 'corto en alimentacion', 'cable hace corto', 0, 5, '1', 0, 1, NULL),
(159, 96, 1, '2014-09-15', NULL, 'recorte el aislante', '1 diadema no se escucha', 'aislante conector desborda', 0, 3, '0', 0, 1, NULL),
(160, 72, 1, '2014-09-15', NULL, 'use el 3ro pin para poder cargar, pero es una reparacion provisional', 'pin del conector macho del tablero roto', 'se jalo chueco el conector', 0, 7, '0', 0, 1, 'Contemplar el cambio de este equipo por nuevo, pues la reparacion no va a durar mucho....'),
(161, 59, 1, '2014-09-19', NULL, NULL, 'pilas descargadas', 'le falta recargarlo', 0, 0, '0', 0, 1, NULL),
(162, 77, 1, '2014-09-19', NULL, 'cambio de las pilas por nuevas', 'pilas totalement descargadas', 'no se pone a cargar', 0, 0, '0', 3, 1, 'equipo originalmente del 2006-reacondicionado en 2012 por AMB'),
(163, 81, 1, '2014-09-19', NULL, NULL, 'pilas descargadas', 'falta cargarlo', 0, 0, '0', 0, 1, 'equipo viejo del 2009-le cambié las pilas el 27-5-2010'),
(164, 23, 1, '2014-09-29', NULL, NULL, 'equipo revisado - OK', NULL, 0, 0, '0', 1, 1, NULL),
(165, 21, 1, '2014-10-13', NULL, 'cambio de 2 diademas por nuevas', '2 diademas con microfono con gran perdida de sensibilidad', 'oxidacion de la membrana del microfono', 0, 5, '2', 3, 1, NULL),
(166, 26, 1, '2014-10-13', 'diademas', 'cambio de 3 diademas por nuevas', '3 diademas fuera de servicio, microfono HS', 'oxidacion de las membranas de microfono', 0, 5, '3', 3, 1, NULL),
(167, 24, 1, '2014-10-13', NULL, 'cambio de 1 diadema por nueva', '1 diadema con microfono fallando', 'oxidacion membrana del microfono', 0, 5, '1', 2, 1, NULL),
(168, 55, 1, '2014-10-31', NULL, 'reemplazo 1 pila 9V', 'pila banderin baja', 'uso normal', 0, 0, '0', 0, 1, NULL),
(169, 34, 1, '2014-10-31', NULL, 'cambiom 1 pila', 'pila pager baja', 'uso', 0, 3, '1', 1, 1, NULL),
(170, 21, 1, '2015-03-23', 'diadema con microfono fallando', 'reemplazo de una diadema por nueva', 'cable del microfono cortado', 'jalon sobre el cable', 0, 5, '1', 2, 1, NULL),
(171, 27, 1, '2015-04-08', NULL, NULL, '3 pilas FS y 1 diadema FS reemplazadas', 'uso', 0, 5, '3', 1, 1, 'equipo ya desgastado, prever su reemplazo'),
(172, 21, 1, '2015-04-08', NULL, NULL, '2 pilas y 1 diadema FS, reemplazadas por nuevas', 'uso', 0, 5, '2', 1, 1, NULL),
(173, 100, 1, '2015-04-08', NULL, NULL, '1 diadema y 1 pila FS', 'uso', 0, 4, '1', 1, 1, NULL),
(174, 25, 1, '2015-04-08', NULL, NULL, '4 pilas y 1 diadema FS', 'uso', 0, 7, '4', 3, 1, 'equipo desgastado, prever reemplazo'),
(175, 26, 1, '2015-04-08', 'faltaba 1 diadema', 'repuse 1 diadema', '1 pila FS', 'uso', 0, 1, '1', 1, 1, NULL),
(176, 23, 1, '2015-04-08', NULL, NULL, '2 pilas y 1 diadema FS', 'uso', 0, 3, '1', 1, 1, NULL),
(177, 31, 1, '2015-04-08', 'antena faltante, tubo roscado sin tapa', 'resolde una antena nueva al equipo, cambie el tubo roscado por un nuevo con tapa', 'antena inyterna arrancada faltante', 'se abrió el pager', 0, 7, '1', 3, 1, NULL),
(178, 92, 1, '2015-04-20', NULL, 'cambio 1 diadema por nueva', '1 diadema genera zumbido', 'falta masa en diadema lo que genera zumbido', 0, 5, '1', 3, 1, 'equipo de jorge Gasso'),
(179, 99, 1, '2015-04-20', NULL, 'cambio 1 pila y 1 diadema por nuevas', '1 diadema y 1 poila fallando', 'pila fuera de carga y diadema con perdida de sensibilidad', 0, 5, '1', 3, 1, NULL),
(180, 32, 1, '2015-04-20', NULL, 'resolde speaker y cambio pila del pager', 'speaker desoldado y pila FS', 'un choque seguramente ocasiono esto', 0, 5, '1', 3, 1, NULL),
(181, 43, 1, '2015-04-20', NULL, 'cambio de la pila del pager por nueva', 'pila del pager baja', 'uso', 0, 3, '1', 1, 1, NULL),
(182, 56, 1, '2015-04-20', NULL, 'cambio pila del pager', 'pila del pager FS', 'uso ? pero estaba en cero voltios...', 0, 3, '1', 1, 1, 'eauipo muy desgastado. la caja ya no cierra bien y hay mucha corrosion dentro en el circuito electronico. prever pronto reemplazo.'),
(183, 35, 1, '2015-04-20', NULL, 'cambio de 2 pilas', 'pila del pager y de 1 banderin bajas', 'uso', 0, 3, '2', 1, 1, NULL),
(184, 72, 1, '2015-04-20', NULL, 'recargue las pilas y si cargan bien', 'pilas descargadas pero ya cargadas el equipo prende y se apaga solo', '???', 0, 3, '0', 3, 1, 'equipo de diciembre 2014-mandarlo a Italia para reparacion bajo garantía.'),
(185, 22, 1, '2015-05-11', NULL, 'reconfiguracion y reencriptado de los 5 radios', 'radio 5 en speaker mode', 'el menu de opciones fur manipulado', 0, 5, '0', 1, 1, NULL),
(186, 38, 1, '2015-07-02', NULL, 'reemplazo de la pila del pager por nueva', 'Equipo se queda vibrando sin para', 'pila baja', 0, 3, '1', 1, 1, 'equipo 2012'),
(187, 102, 1, '2015-07-02', NULL, 'cambio de una diadema PHO221 por nueva', '1 diadema fuera de servicio', 'agua se metio en speaker?', 0, 3, '1', 3, 1, NULL),
(188, 81, 1, '2015-08-17', NULL, NULL, '1 pila con bajo voltaje', 'pila en fin de vida (era de 2012)', 0, 5, '1', 3, 1, 'jorge ya había cambiado 1 pila el 3-8-2015. el arbitro me dijo que el equipo marca cargado pero rapido se agota la carga y ya no marca.yo le cambie nuevamente las 2 pilas pero igual se descargan rapido, el tablero tiene un consumo (fuga) aunque no este prendido. reemplazar el tablero.\nEste tablero ya no tiene tornillos que lo mantenga cerrado, solamente las cintas.'),
(189, 19, 1, '2015-08-17', NULL, NULL, '1 diadema y el boton PTT fuera de servicio', 'Humedad???', 0, 0, '0', 0, 1, 'reemplazo de 1 diadema y el boton PTT'),
(190, 90, 1, '2015-08-24', NULL, NULL, '1 radio fuera de servicio, lo reemplace por uno nuevo', NULL, 0, 3, '1', 1, 1, '1 radio fuera de servicio, lo reemplace por uno nuevo\r\nCarga completa y encriptado.'),
(191, 92, 1, '2015-08-24', NULL, NULL, '1 Diadema fuera de servicio, la reemplace por una nueva PHO 221', NULL, 0, 5, '1', 1, 1, '1 Diadema fuera de servicio, la reemplace por una nueva PHO 221\r\nCarga completa y encriptado.'),
(192, 30, 1, '2015-08-24', NULL, NULL, 'cambio de pila del pager', NULL, 0, 0, '0', 0, 1, NULL),
(193, 32, 1, '2015-08-24', NULL, NULL, 'cambio de pila del pager', NULL, 0, 0, '0', 0, 1, NULL),
(194, 49, 1, '2015-09-04', NULL, 'cambio de tubo roscado y tapon por nuevos', 'tubo roto y tapon que se zafa', 'golpe?', 0, 0, '1', 1, 1, NULL),
(195, 20, 1, '2015-09-04', NULL, 'cambio de 2 pilas por nuevas', '2 pilas fuera de servicio', 'uso...', 0, 0, '0', 0, 1, NULL),
(196, 21, 1, '2015-09-04', NULL, 'reemplazo de 2 diademas y 2 pilas', '2 diademas y 2 pilas fuera de servicio', 'oxidación de las membranas de los microfonos, pilas desgastadas', 0, 3, '2', 2, 1, NULL),
(197, 62, 1, '2015-09-17', NULL, 'cambio del conector 3 pines por nuevo', 'conector del cargador sin enchufe lado tablero', 'se perdió el enchufe redondo del conector del cargador', 0, 5, '1', 3, 1, 'reemplace el conector redondo 3 pines del cargador'),
(198, 24, 1, '2015-09-17', NULL, NULL, '3 diademas fuera de servicio', 'la humedad oxidó el micrófono que perdió mucha sensibilidad ( los 3)', 0, 5, '3', 3, 1, 'reemplazo por nuevo de 3 diademas PHO 020'),
(199, 62, 1, '2015-09-17', NULL, NULL, '1 pila fuera de servicio', 'no se la había cambiado el 29-9-2104', 0, 3, '1', 0, 1, 'le cambie una pila de 6V por una nueva....'),
(200, 56, 1, '2015-09-29', NULL, 'repuse 2 ejes y 1 pila 9V', 'caja de plastico rota donde cierran los tornillos', 'edad del equipo', 0, 5, '0', 0, 1, 'equipo ya muy desgastado que ya no aguanta más pues la caja ya no cierra bien y se mete el agua en los circuitos'),
(201, 19, 1, '2015-09-29', NULL, 'cambio de 2 diademas por nuevas PHO 020', 'no se escucha', '2 diademas con muy poca sensibilidad del microfono', 0, 5, '5', 3, 1, 'equipo ya muy desgastado-prever pronto reemplazo'),
(202, 73, 1, '2015-10-12', 'baterias', 'cambio de las 2 baterias por nuevas', 'baterias muy bajas (9V la suma de las 2)', 'las 2 baterías fuiera de servicio (1 en menos de 4V)', 0, 0, '0', 0, 1, 'estas baterias habian sido cambiadas por AMB en noviembre de 2012 con el reacondicionamiento del tablero.'),
(203, 23, 1, '2015-10-12', NULL, 'cambio de 1 diadema por una nueva PHO 020', '1 diadema con hp fuera de servicio', '???', 0, 3, '1', 3, 1, NULL),
(204, 66, 1, '2015-10-21', NULL, 'limpieza completa de todos los contactos electricos', 'deslumbran mal los diodos', NULL, 0, 3, '0', 3, 1, 'Di una carga completa a las pilas : OK'),
(205, 28, 1, '2015-10-21', NULL, NULL, 'cambio de 1 diadema por nueva', 'micro HS', 0, 3, '1', 1, 1, NULL),
(206, 89, 1, '2015-11-09', NULL, 'curage connecteru et nettoyage', 'aislante conector radio 3 doblado', NULL, 0, 3, '0', 0, 1, NULL),
(207, 90, 1, '2015-11-09', NULL, NULL, '2 diademas fuera de servicio', 'cambio de 2 diademas PHO221 por nuevas', 0, 5, '2', 0, 1, NULL),
(208, 16, 1, '2015-11-09', NULL, 'reemplace 2 diademas por nuevas', '2 diademas fuera de servicio', NULL, 0, 5, '2', 0, 1, NULL),
(209, 18, 1, '2015-11-09', NULL, 'cambie 3 diademas viejo modelo(beige) por nuevas (negras)', NULL, NULL, 0, 0, '0', 0, 1, NULL),
(210, 29, 1, '2015-11-09', NULL, 'cambio pila del pager y 2 ejes', 'pila pager fuera de servicio', NULL, 0, 7, '0', 0, 1, NULL),
(211, 30, 1, '2015-11-09', NULL, NULL, '3 pilas fuera de servicio', NULL, 0, 20, '0', 0, 1, 'cambio 3 pilas , 2 ejes y 1 abrazabrazo'),
(212, 96, 1, '2015-12-16', '2 diademas fallando', NULL, NULL, NULL, 0, 0, '0', 0, 1, 'cambio de 2 diademas por nuevas'),
(213, 106, 1, '2015-12-16', NULL, NULL, '1 diadema fallando', NULL, 0, 0, '0', 0, 1, 'reemplace 1 diadema por nueva. Al equipo le falta la pantalla de configuracion'),
(214, 23, 1, '2015-12-16', NULL, 'agregue un abrazabrazo nuevo', 'le falta un abrazabrazo', NULL, 0, 0, '0', 0, 1, NULL),
(215, 16, 1, '2015-12-16', NULL, 'agregue una diadema nueva', 'una diadema rota', NULL, 0, 0, '0', 0, 1, NULL),
(216, 98, 1, '2015-12-16', NULL, NULL, NULL, NULL, 0, 0, '0', 0, 1, 'revision'),
(217, 99, 1, '2015-12-16', NULL, NULL, NULL, NULL, 0, 0, '0', 0, 1, 'revision'),
(218, 29, 1, '2015-12-16', NULL, 'cambie pila pager y repuse un eje', 'pila pager baja y falta un eje', NULL, 0, 0, '0', 0, 0, NULL),
(219, 30, 1, '2015-12-16', NULL, NULL, NULL, NULL, 0, 0, '0', 0, 1, 'revision. equipo en mal estado pero funciona...'),
(220, 37, 1, '2015-12-16', NULL, NULL, NULL, NULL, 0, 0, '0', 0, 1, 'revision. equipo en malestado pero funciona'),
(221, 120, 1, '2015-12-16', NULL, NULL, NULL, NULL, 0, 0, '0', 0, 1, 'revision. ok'),
(222, 121, 1, '2015-12-16', NULL, NULL, NULL, NULL, 0, 0, '0', 0, 1, 'revision. ok'),
(223, 124, 1, '2015-12-16', NULL, NULL, NULL, NULL, 0, 0, '0', 0, 1, 'revision. ok'),
(224, 125, 1, '2015-12-16', NULL, NULL, NULL, NULL, 0, 0, '0', 0, 1, 'revision. ok'),
(225, 43, 1, '2015-12-16', NULL, NULL, NULL, NULL, 0, 0, '0', 0, 1, 'revision. ok'),
(226, 75, 1, '2015-12-16', NULL, NULL, 'tablero con los LEDs verdes que no prenden', 'golpe o descarga', 0, 0, '0', 0, 1, 'Tablero fuera de servicio.'),
(227, 79, 1, '2015-12-16', NULL, NULL, NULL, NULL, 0, 0, '0', 0, 1, 'baterias a mitad de vida'),
(228, 101, 1, '2015-12-16', NULL, NULL, 'le falta el cargador', NULL, 0, 0, '0', 0, 1, 'falta el cargador. baterias a mitad de vida útil.'),
(229, 101, 1, '2015-12-16', NULL, 'cambio de las 2 pilas por nuevas', 'las 2 pilas fuera de servcio', NULL, 0, 0, '0', 0, 1, NULL),
(230, 66, 1, '2016-01-07', 'panel de LED verde lado opuesto a botones con falla', 'lo reemplacxe por el panel del otro equipo de pumes, el viejo T88', 'panel de LED verde lado opuesto a botones con falla', 'uso', 0, 5, '1', 4, 1, 'equipo de 2004 renovado en 2012'),
(231, 116, 1, '2016-01-07', NULL, NULL, 'panel LED vberdes lado opuesto a botones fuera de servicio, baterias HS tambien', 'uso', 0, 0, '0', 0, 1, 'equipo de 2003 renovado en 2006. ahora fuera de servicio'),
(232, 91, 1, '2016-01-13', 'I DIADEMA fs', 'cambio de 1 diadema por nueva', '1 diadema fs y conector lado transceiver con aislante desbordando sobre contactos', 'mal uso al conectar', 0, 3, '1', 2, 1, NULL),
(233, 133, 1, '2016-01-13', NULL, 'abri el redio y compuse el boton de encendido', 'boton de encendido totalmente sumido en la caja-radio 3', 'fue presionado muy fuertement', 1, 3, '0', 2, 1, 'equipo de 2015'),
(234, 96, 1, '2016-01-13', NULL, 'cambio boyton del 4to y 1 diadema por nuevos', 'ya no se esccuhan 2 radiuos', 'boton del 4to y 1 diadema FS', 0, 5, '1', 5, 1, NULL),
(235, 20, 1, '2016-01-20', NULL, 'reconfigure los 5 radios y encryptado', 'desconfiguracion de roles (2 números 4)', 'metieron las manos en la configuracion...', 0, 3, '0', 1, 1, 'equipo de 2012 ya con desgate visible, prever cambio por nuevo '),
(236, 23, 1, '2016-01-20', NULL, NULL, 'le falta 1 diadema, sololleva 4', NULL, 0, 0, '0', 1, 1, 'Equipo incompleto (le faltan 1 abrazabrazo (lleva 3)y 1 diadema (lleva 4)) y ya con desgaste visible'),
(237, 24, 1, '2016-01-20', NULL, NULL, NULL, NULL, 0, 0, '0', 1, 1, 'Equipo incompleto (le faltan 3 abrazabrazos) y ya con desgaste visible'),
(238, 26, 1, '2016-01-20', NULL, NULL, 'Equipo incompleto (le falta 1 abrazabrazo) y ya con desgaste visible', NULL, 0, 0, '0', 0, 1, 'Equipo incompleto (le falta 1 abrazabrazo) y ya con desgaste visible'),
(239, 9, 1, '2016-01-20', NULL, NULL, 'Equipo ya muy viejo y desgastado\r\nNo usarlo en partidos sino para refacciones\r\nLleva 5 radios, 4 diademas, 0 abrazabrazo, 0 boton 4to, 5 pilas, 1 cargador completo\r\n', NULL, 0, 0, '0', 4, 1, 'Equipo ya muy viejo y desgastado\r\nNo usarlo en partidos sino para refacciones\r\nLleva 5 radios, 4 diademas, 0 abrazabrazo, 0 boton 4to, 5 pilas, 1 cargador completo\r\n'),
(240, 39, 1, '2016-01-20', NULL, NULL, 'el equipo estaba desconfigurado de los swithces que codifican el color de los banderines.', 'alguien abrió el pager', 0, 3, '1', 3, 1, 'equipo de 2011 ya muy desgastado. el equipo estaba desconfigurado de los swithces que codifican el color de los banderines.'),
(241, 39, 1, '2016-01-20', NULL, NULL, 'Platina electronica fuera de servicio', 'se metió agua dentro', 0, 0, '0', 5, 1, 'equipo ya fuera de servicio este día.'),
(242, 116, 1, '2016-02-18', NULL, 'repare y cerre de nuevo el cargador pero prever su reemplazo', 'cargador mexicano abierto y en corto circuito', 'alguien le metio las manos', 0, 5, '0', 2, 1, NULL),
(243, 86, 1, '2016-02-18', NULL, 'cambie las baterias por nuevas de 2016-puse un nuevo cargador mio', 'carga de las baterias muy baja- cargador AMB fuera de servicio, lo cambie por un nuevo mío', 'baterias viejas ya, son de 2011', 0, 0, '0', 0, 1, '2 cnuevas baterias de 2016.'),
(244, 9, 1, '2016-02-18', NULL, 'cambio de 1 diadema', '1 diadema falla y genera perturbaciones', 'microfono con membrana oxidada', 0, 5, '1', 3, 1, NULL),
(245, 30, 1, '2016-02-18', NULL, 'cambie el boton de apagado por nuevo', 'boton del pager fuera de servicio', 'uso??', 0, 3, '1', 0, 1, NULL),
(246, 98, 1, '2016-02-18', NULL, 'reencripte el equipo y repuse una diadema nueva', ' equipo desencriptado y 1 diadema fallando', NULL, 0, 5, '1', 0, 1, NULL),
(247, 103, 1, '2016-02-24', NULL, NULL, '2 diademas fallando', 'microfonos oxidados', 0, 5, '2', 3, 1, NULL),
(248, 105, 1, '2016-02-24', NULL, 'repuse 1 diadema', 'equipo con 1 diadema faltante', '1 diadema perdida', 0, 0, '0', 0, 1, NULL),
(249, 30, 1, '2016-02-24', NULL, NULL, 'a veces no prende....', 'falsos contactos debidos a la oxidacion', 0, 5, '0', 3, 1, 'espero refacciones para cambiar el circuito completo.'),
(250, 26, 1, '2016-02-24', NULL, NULL, '1 diadema fallando', 'mic rofono oxidado', 0, 3, '1', 3, 1, 'equipo de 2012-prever su reemplazo'),
(251, 29, 1, '2016-03-15', 'ambos tubos rotos', 'cambio de los 2 tubos por nuevos', NULL, 'rompieron el banderin', 0, 3, '2', 0, 1, NULL),
(252, 152, 1, '2016-03-15', NULL, NULL, 'FALTA UNA TAPA ROSCADA DE TUBO', 'se perdio', 0, 0, '0', 0, 1, 'equipo de 2015'),
(253, 21, 1, '2016-03-15', NULL, 'reemplcae una diadema por nueva', 'una diadema con perdida de sensibilidad', 'humedad', 0, 3, '1', 3, 1, NULL),
(254, 98, 1, '2016-04-13', NULL, NULL, '2 diademas fuera de servicio', 'microfono oxidado por la humedad', 0, 5, '2', 3, 1, NULL),
(255, 22, 1, '2016-04-13', NULL, NULL, '1 Vokkero US1 fuera de servicio', 'pin de pila sumido. ya no hace contacto con el potencial de la pila', 0, 5, '0', 3, 1, 'equipo con 4  tranbsceivers solamente pero funcional'),
(256, 32, 1, '2016-04-13', NULL, 'cambio del speaker y resoldado', 'Ya no chilla-Speaker roto', 'se jaló el speaker y se rompió un pin de conexion', 0, 3, '1', 3, 1, NULL),
(257, 23, 1, '2016-04-13', NULL, NULL, 'radio 5 con role 3', 'se metieron en la configuracionj', 0, 3, '1', 3, 1, NULL),
(258, 154, 1, '2016-04-13', NULL, NULL, 'no chilla ni vibra pager', 'sitches desconfigurados', 0, 3, '0', 3, 1, NULL),
(259, 118, 1, '2016-04-13', 'turbo roscado roto', NULL, 'turbo roscado roto', NULL, 0, 0, '0', 0, 1, 'en espera de refacciones'),
(260, 20, 1, '2016-04-27', NULL, 'cambio de 2 diademas por nuevas genericas', 'equipo con 2 diademas personalizadas con micro fallando', 'oxidacion', 0, 3, '2', 3, 1, NULL),
(261, 22, 1, '2016-04-27', NULL, NULL, '1 vokkero EVO3 US fallando, lo desmonte pero es la tarjeta', NULL, 0, 15, '5', 7, 1, 'cambie los 5 radiso por equipos Tabla europea (T1) vokkero EVO1'),
(262, 23, 1, '2016-04-27', 'cambie 1 diadema por nueva', NULL, '1 diadema con micro fallando', 'oxidacion', 0, 3, '1', 3, 1, NULL),
(263, 124, 1, '2016-04-27', 'cambie la pila del pager por una nueva', NULL, 'pila del pager baja', 'uso', 0, 3, '1', 1, 1, NULL),
(264, 69, 1, '2016-06-29', NULL, 'cambio de las 2 pilas por nuevas', 'pilas fuera de servicio-1 en corto circuito', '?', 0, 5, '2', 3, 1, NULL),
(265, 99, 1, '2016-06-29', NULL, 'agregue una diadema al equipo', 'le falta 1 diadema', NULL, 0, 0, '0', 0, 1, NULL),
(266, 22, 1, '2016-09-07', NULL, 'cambie las 3 diademas por nuevas', '3 diademas fallando', 'oxidacion de microfonos', 0, 0, '0', 0, 1, 'este equipo solamente cuenta con 4 diademas.'),
(267, 86, 1, '2016-09-07', NULL, 'recarga completa al 99%', 'nivel de baterias bajo', NULL, 0, 0, '0', 0, 1, NULL),
(268, 21, 1, '2016-09-07', NULL, 'cambie 3 diademas por nuevas', '3 diademas con microfono fallando', 'oxidacion de la membrana del microfono', 0, 0, '0', 0, 1, NULL),
(269, 28, 1, '2016-09-07', NULL, 'reencrypte todo el equipo', 'equipo desencryptado', 'alguien le metió la mano...', 0, 0, '0', 0, 1, 'equipo ya muy desgastado de 2010, perever su reemplazo'),
(270, 16, 1, '2016-09-07', NULL, 'reencrypte todo el equipo', 'equipo totalmente desencryptado', 'alguien lo modificó', 0, 0, '0', 0, 1, 'equipo ya muy desgastado , es de 2010, prever su reemplazo'),
(271, 114, 1, '2016-09-07', NULL, 'cambioe 1 batería por nueva', '1 batería fallando', 'batería con 1 elemento en corto circuito', 0, 0, '0', 0, 1, 'equipo funcional'),
(272, 114, 1, '2016-09-07', NULL, NULL, 'tarjeta de mando ya no prende', 'la batería en corto tronó la tarjeta', 0, 0, '0', 0, 1, 'equipo ya fuera de servicio'),
(273, 84, 1, '2016-09-12', NULL, NULL, 'la barrita de LEDs de arriba se prendía aunque no se lopidiera.', 'falso contacto en un conector', 0, 5, '0', 3, 1, 'equipo intervenido, le falktaba sus 6 tornillos'),
(274, 84, 1, '2016-09-22', NULL, 'cambio de tarjeta madre y panel de LEds verdes lado teclado', 'los LEDs tanto rojos como verdes de narriba y de ambos lados a veces se prendian cuando no debian', 'tarjeta madre y panel de LEDs verdes lado teclado con falso contacto', 0, 0, '0', 0, 1, NULL),
(275, 110, 1, '2016-09-22', NULL, 'separe bien los potenciales rayando el barniz', 'se prendian levemente los LEDs que no debian', 'fuga de corriente en soldaduras de conector en la tarjeta madre', 0, 5, '0', 3, 1, NULL),
(276, 78, 1, '2016-09-22', 'teclado izquierdo del tablero', 'abri, desebgrase y limpie los contactos del tablero', 'teclado izquierdo se aloca y solito sube o baja los numeros', 'teclado con falso contacto', 0, 5, '0', 3, 0, NULL),
(277, 30, 1, '2016-09-22', 'sitch desoldado', 'desolde y resolde en su lugar el swwitch', 'soldadura en sitch rota lo que impide prender el pager', 'parece que un golpe movió el switch', 0, 5, '1', 3, 1, NULL),
(278, 17, 1, '2016-09-22', NULL, NULL, 'equipo ya fuera de servicio', NULL, 0, 0, '0', 0, 0, 'tarjeta de pager fuera de servicio.'),
(279, 20, 1, '2016-09-22', NULL, NULL, '3 diademas fallando por mucha perdida de sensibilidad', 'humedad???', 0, 0, '0', 0, 1, 'equipo de 2012, prever su reemplazo'),
(280, 27, 1, '2016-10-10', NULL, NULL, 'Equipo con 2 pilas bajas, se las cambie por nuevas', NULL, 0, 0, '0', 0, 1, 'equipo ya desgastado, prever reemplazo'),
(281, 103, 1, '2016-10-10', NULL, NULL, 'Equipo con 2 transceivers con botón de apagado sumido Lo arregle\r\n', NULL, 0, 0, '0', 0, 1, NULL),
(282, 133, 1, '2016-10-10', NULL, NULL, 'Equipo incompleto, le falta 1 transceiver y 1 diadema', NULL, 0, 0, '0', 0, 1, NULL),
(283, 107, 1, '2016-10-10', NULL, NULL, '1 transceiver con conector deformado, enderecé y limpie su conector', NULL, 0, 0, '0', 0, 1, NULL),
(284, 134, 1, '2016-10-10', NULL, NULL, 'Equipo con 2 transceivers con botón de apagado sumido dentro del equipo Repare los 2 transceivers\r\n', NULL, 0, 0, '0', 0, 1, NULL),
(285, 20, 1, '2016-10-10', NULL, NULL, '2 diademas con pérdida de sensibilidad en el micrófono', NULL, 0, 0, '0', 0, 1, NULL),
(286, 23, 1, '2016-10-10', NULL, NULL, 'Equipo con una pérdida de sensibilidad en diadema del  radio 5', NULL, 0, 0, '0', 0, 1, 'equipo ya muy desgastado'),
(287, 95, 1, '2016-10-10', NULL, NULL, 'Equipo con problemas de conectores sucios y aislantes desviado', NULL, 0, 0, '0', 0, 1, NULL),
(288, 16, 1, '2016-10-10', NULL, NULL, 'Equipo con 3 pilas fuera de servicio', NULL, 0, 0, '0', 0, 1, NULL),
(289, 37, 1, '2016-10-10', NULL, NULL, 'equipo revisado-ok', NULL, 0, 0, '0', 0, 1, NULL),
(290, 147, 1, '2016-10-10', NULL, NULL, 'Le faltaba los 2 ejes que detienen el abrazabrazo', NULL, 0, 0, '0', 0, 1, NULL),
(291, 150, 1, '2016-10-10', NULL, NULL, 'Equipo que lleva en su estuche también un equipo de radiocomunicación Vokkero EVO3 del cual le  falta 1 diadema', NULL, 0, 0, '0', 0, 1, NULL),
(292, 125, 1, '2016-10-26', NULL, NULL, 'pila del pager baja y no se para el silbato', 'pila baja', 0, 5, '0', 0, 1, NULL),
(293, 16, 1, '2016-10-26', NULL, NULL, 'conectores de transceiver con mugre. limpieza y reencryptado', NULL, 0, 5, '0', 3, 1, 'equipo incompleto, le falta el boton PTT con su diadema'),
(294, 102, 1, '2016-10-26', NULL, 'Reemplace 3 diademas por nuevas\r\n', 'Equipo con 3 diademas con micrófonos fuera de servicio a raíz de la oxidación \r\n', NULL, 0, 3, '0', 3, 1, NULL),
(295, 103, 1, '2016-10-26', NULL, 'Los arregles pero hay que encender y apagar sin mandar al fondo el botón (ya es la segunda vez seguida que esto ocurre)', 'Equipo con 2 transceivers con botón de apagado sumido', NULL, 0, 5, '0', 3, 1, NULL),
(296, 107, 1, '2016-10-26', NULL, 'Limpieza y dielectrico\r\nReencrypte el equipo y ahora si funciona bien\r\n', 'Unos transceivers tenían mugre en los conectores lo que impedía el buen contacto eléctrico\r\nLimpieza y dielectrico\r\n', NULL, 0, 3, '0', 3, 1, NULL),
(297, 140, 1, '2017-01-16', 'cambie el cargador por nuevo bajo garantía.', NULL, 'baterias totalmente descargadas', 'cargador fuera de servicio', 1, 5, '1', 0, 1, NULL),
(298, 102, 1, '2017-01-24', NULL, NULL, 'conectores con defectos aislante', NULL, 0, 5, '0', 0, 1, NULL),
(299, 103, 1, '2017-01-24', NULL, NULL, 'boton de 4to y 1 diadema con mucha perdida de sensibilidad', 'uso', 0, 5, '1', 0, 1, NULL),
(300, 134, 1, '2017-01-24', NULL, 'cambio caja de radio y boton de encendido por nuevos.', 'boton de encendido radio 2 roto', 'uso', 0, 5, '1', 0, 1, NULL),
(301, 162, 1, '2017-02-15', 'cambio de pila del pager', NULL, 'pile du pager HS', 'uso', 1, 0, '0', 0, 1, NULL),
(302, 148, 1, '2017-02-15', NULL, NULL, 'pila del pager fuera de servicio', 'uso', 0, 3, '1', 0, 1, NULL);
INSERT INTO `panne` (`id_panne`, `id_machine`, `id_interv`, `date`, `organe`, `operation`, `nature_panne`, `cause_panne`, `garantie`, `temps_darret`, `PR`, `tps_interv`, `compteur`, `commentaire`) VALUES
(303, 118, 1, '2017-02-15', 'cambio de 1 tubo roscado', NULL, 'tubo roscado roto', '???', 0, 5, '1', 0, 1, NULL),
(304, 84, 1, '2017-02-15', NULL, NULL, 'en las 2 pantallitas, se pone un\"-\" delante donde el 1er digito', 'es un falso contacto en la trajeta madre, se borra cuando se aprieta el display', 0, 5, '0', 0, 1, 'No puedo reparar este defecto pues AMB no me provee refacciones originales.'),
(305, 21, 1, '2017-02-23', NULL, NULL, '1 diadema y 3 pilas Fuera de servicio', 'uso...', 0, 15, '1', 3, 1, 'prever su pronto reemplazo'),
(306, 26, 1, '2017-02-23', NULL, NULL, NULL, NULL, 0, 0, '0', 0, 1, 'le falta 1 abrazabrazo pero es funcional'),
(307, 126, 1, '2017-03-10', NULL, NULL, '2 botones de apagado de transceivers sumidos', 'empujan con algo mas que el dedo', 0, 3, '3', 0, 1, NULL),
(308, 104, 1, '2017-03-10', NULL, NULL, 'encriptadop de los 5 transceivers', NULL, 0, 0, '0', 0, 1, NULL),
(309, 84, 1, '2017-03-29', NULL, NULL, 'las 2 baterias fuera de servicio', 'ya tenian casi 6 años...', 0, 3, '2', 0, 1, NULL),
(310, 79, 1, '2017-03-29', NULL, NULL, '2 baterias fuera de servicio', 'equipo de 2011-uso', 0, 5, '2', 3, 1, NULL),
(311, 118, 1, '2017-04-11', NULL, 'cambio del palo por nuevo', 'palo roscado roto', NULL, 0, 0, '0', 0, 1, NULL),
(312, 34, 1, '2017-04-11', NULL, 'resolde el switch y cambie la pila del oager', 'switch desoldado', 'golpe?', 0, 5, '0', 3, 1, 'equipo de 2011-prever su pronto reemplazo'),
(313, 125, 1, '2017-04-11', NULL, NULL, 'codigo de color desconfigurado', '???', 0, 3, '0', 0, 1, NULL),
(314, 99, 1, '2017-04-11', NULL, 'cambie 2 diademas por nuevas', '2 diademas fuera de servicio', NULL, 0, 3, '0', 3, 1, NULL),
(315, 92, 1, '2017-05-17', NULL, 'volvi a colocar los botones correctamente y los pegue', '2 botones de encendido sumidos', 'apretaron muy a fondo los botones', 0, 5, '0', 3, 1, NULL),
(316, 28, 1, '2017-05-17', NULL, NULL, '2 diademas fuera de servicio', 'jalaron los cables', 0, 0, '0', 0, 1, 'repuse 1 diadema nueva- equipo con 4 diademas'),
(317, 141, 1, '2017-10-18', NULL, 'cambie las 2 baterías de 6V por nuevas', '2 baterias muertas', 'uso pues tenían 6 años', 0, 0, '0', 0, 1, 'el caragdor esta fuera de servicio y fue intervenido pues tiene los cables cortados'),
(318, 150, 1, '2017-11-15', 'tubo roscado roto', NULL, 'cambio de untubo roscado por nuevo', 'jugaron a dark vador', 0, 7, '1', 2, 1, NULL),
(319, 37, 1, '2017-11-15', '2 pilas de los banderines muy bajas', NULL, 'cambie las 2 pilas', 'uso', 0, 3, '2', 3, 1, NULL),
(320, 35, 1, '2017-11-15', NULL, NULL, 'pila del mpager HS', NULL, 0, 0, '1', 0, 1, NULL),
(321, 29, 1, '2017-11-15', NULL, NULL, '1 pila de banderin baja', 'uso', 0, 0, '0', 0, 2, NULL),
(322, 108, 1, '2017-11-29', '1 panel de LED Fuera de servicio', 'cambio por otro reciclado', '1 panel de LED HS', 'Tableroo intervenido, le falta una cinta que lo cierra bien y las baterías no son las originales', 0, 3, '1', 0, 1, NULL),
(323, 123, 1, '2017-11-29', NULL, 'cambie el tubo por un nuevo', 'tubo roscado roto', NULL, 0, 3, '1', 1, 1, NULL),
(324, 128, 1, '2018-01-10', NULL, NULL, '4 botones de encendido sumidos', 'mal uso', 0, 0, '0', 0, 1, NULL),
(325, 64, 1, '2018-05-16', NULL, 'revision completa', NULL, NULL, 0, 0, '0', 0, 1, NULL),
(326, 62, 1, '2018-08-30', NULL, NULL, '2 pilas HS', 'pilas cambiadas en 2015', 0, 0, '0', 0, 1, 'el LED del guion medio del digit decenas se apaga solito o se prende si se presiona el display'),
(327, 107, 1, '2018-09-12', NULL, NULL, '1 diadema con poca sensibilidad', 'oxidacion', 0, 0, '0', 0, 1, NULL),
(328, 154, 1, '2018-09-12', NULL, NULL, 'cambio 1 diadema por nueva', NULL, 0, 0, '0', 0, 1, NULL),
(329, 158, 1, '2018-09-12', NULL, NULL, ' le falta 1 radio y 1 diadema', NULL, 0, 0, '0', 0, 1, NULL),
(330, 134, 1, '2018-09-12', NULL, NULL, '1 diadema con mucha pérdida de sensibilidad en el micro', NULL, 0, 0, '0', 0, 1, NULL),
(331, 103, 1, '2018-09-12', NULL, NULL, '2 botones PTT fuera de servicio', 'sumidos', 0, 0, '0', 0, 1, NULL),
(332, 90, 1, '2018-09-12', NULL, NULL, '2 diademas fallando, las cambie por nuevas', NULL, 0, 0, '0', 0, 1, NULL),
(333, 135, 1, '2018-09-12', NULL, NULL, NULL, NULL, 0, 0, '0', 0, 1, NULL),
(334, 104, 1, '2018-09-12', NULL, NULL, NULL, NULL, 0, 0, '0', 0, 1, NULL),
(335, 106, 1, '2018-09-12', NULL, NULL, NULL, NULL, 0, 0, '0', 0, 1, NULL),
(336, 105, 1, '2018-09-12', NULL, NULL, NULL, NULL, 0, 0, '0', 0, 1, NULL),
(337, 157, 1, '2018-09-12', NULL, NULL, NULL, NULL, 0, 0, '0', 0, 1, NULL),
(338, 150, 1, '2018-09-12', NULL, NULL, NULL, NULL, 0, 0, '0', 0, 1, NULL),
(339, 174, 1, '2018-09-12', NULL, NULL, NULL, NULL, 0, 0, '0', 0, 1, NULL),
(340, 43, 1, '2018-09-12', NULL, NULL, NULL, NULL, 0, 0, '0', 0, 1, NULL),
(341, 157, 1, '2018-09-19', NULL, NULL, '1 diadema avec micro HS', 'cambio por 1 nueva', 0, 0, '0', 0, 1, NULL),
(342, 128, 1, '2018-09-19', NULL, 'cambio por 1 diadema nueva', '1 diadema con HP vibrando', 'oxidación', 0, 0, '0', 0, 1, NULL),
(343, 139, 1, '2018-09-19', NULL, 'cambio 1 diadema por nueva', '1 diadema HS', 'oxidación', 0, 0, '0', 0, 1, NULL),
(344, 73, 1, '2018-10-03', NULL, NULL, 'error de display en el digit decenas', 'falso contacto en un conector del panel trasero', 0, 0, '0', 0, 1, NULL),
(345, 107, 1, '2018-10-03', '1  diadema con gran perdida de sensibilidad', 'cambio de  1 diadema por nueva', NULL, '1 diadema fuera de servicio', 0, 5, '1', 6, 1, NULL),
(346, 154, 1, '2018-09-12', ' 1  diadema con gran perdida de sensibilidad', 'cambio 1 diadema por nueva', NULL, NULL, 0, 5, '1', 5, 1, NULL),
(347, 104, 1, '2018-10-03', 'boton PTT con los cables jalados', 'cambie el boton PTT por uno nuevo', NULL, NULL, 0, 5, '1', 0, 1, NULL),
(348, 103, 1, '2018-10-03', NULL, 'cambie 1 diadema por nueva PHO221', '1 diadema fuera de servicio', NULL, 0, 5, '1', 3, 1, NULL),
(349, 95, 1, '2018-10-03', NULL, 'cambio de pila por nueva', '1 transceiver ya no retiene carga', '5 años', 0, 0, '0', 0, 1, NULL),
(350, 90, 1, '2018-10-03', NULL, 'cambio de 1 pila de radio', '1 pila de transceiver FS', 'equipo de 2013', 0, 0, '1', 0, 1, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id_client`);

--
-- Indexes for table `intervenants`
--
ALTER TABLE `intervenants`
  ADD PRIMARY KEY (`id_interv`);

--
-- Indexes for table `machine`
--
ALTER TABLE `machine`
  ADD PRIMARY KEY (`id_machine`),
  ADD KEY `id_client` (`id_client`);

--
-- Indexes for table `maintenance`
--
ALTER TABLE `maintenance`
  ADD PRIMARY KEY (`id_maint`),
  ADD KEY `id_machine` (`id_machine`),
  ADD KEY `id_oper` (`id_oper`),
  ADD KEY `id_interv` (`id_interv`);

--
-- Indexes for table `operation`
--
ALTER TABLE `operation`
  ADD PRIMARY KEY (`id_oper`);

--
-- Indexes for table `panne`
--
ALTER TABLE `panne`
  ADD PRIMARY KEY (`id_panne`),
  ADD KEY `id_interv` (`id_interv`),
  ADD KEY `id_machine` (`id_machine`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `intervenants`
--
ALTER TABLE `intervenants`
  MODIFY `id_interv` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `machine`
--
ALTER TABLE `machine`
  MODIFY `id_machine` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=175;

--
-- AUTO_INCREMENT for table `maintenance`
--
ALTER TABLE `maintenance`
  MODIFY `id_maint` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `operation`
--
ALTER TABLE `operation`
  MODIFY `id_oper` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `panne`
--
ALTER TABLE `panne`
  MODIFY `id_panne` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=351;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `machine`
--
ALTER TABLE `machine`
  ADD CONSTRAINT `machine_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id_client`);

--
-- Constraints for table `maintenance`
--
ALTER TABLE `maintenance`
  ADD CONSTRAINT `maintenance_ibfk_1` FOREIGN KEY (`id_machine`) REFERENCES `machine` (`id_machine`),
  ADD CONSTRAINT `maintenance_ibfk_2` FOREIGN KEY (`id_oper`) REFERENCES `operation` (`id_oper`),
  ADD CONSTRAINT `maintenance_ibfk_3` FOREIGN KEY (`id_interv`) REFERENCES `intervenants` (`id_interv`);

--
-- Constraints for table `panne`
--
ALTER TABLE `panne`
  ADD CONSTRAINT `panne_ibfk_1` FOREIGN KEY (`id_interv`) REFERENCES `intervenants` (`id_interv`),
  ADD CONSTRAINT `panne_ibfk_2` FOREIGN KEY (`id_machine`) REFERENCES `machine` (`id_machine`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
