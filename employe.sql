-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 18 mars 2026 à 07:36
-- Version du serveur : 11.5.2-MariaDB
-- Version de PHP : 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `test`
--
CREATE DATABASE employe;
USE employe;
-- --------------------------------------------------------

--
-- Structure de la table `dept`
--

DROP TABLE IF EXISTS `dept`;
CREATE TABLE IF NOT EXISTS `dept` (
  `n_dept` int(11) NOT NULL,
  `nom` varchar(20) DEFAULT NULL,
  `lieu` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`n_dept`)
) ENGINE=InnoDB;

--
-- Déchargement des données de la table `dept`
--

INSERT INTO `dept` (`n_dept`, `nom`, `lieu`) VALUES
(10, 'recherche', 'renne'),
(20, 'vente', 'metz'),
(30, 'direction', 'gif'),
(40, 'fabrication', 'toulon');

-- --------------------------------------------------------

--
-- Structure de la table `employe`
--

DROP TABLE IF EXISTS `employe`;
CREATE TABLE IF NOT EXISTS `employe` (
  `nom` varchar(20) DEFAULT NULL,
  `num` int(5) NOT NULL,
  `fonction` varchar(20) DEFAULT NULL,
  `n_sup` int(5) DEFAULT NULL,
  `embauche` varchar(20) DEFAULT NULL,
  `salaire` int(10) DEFAULT NULL,
  `comm` int(10) DEFAULT NULL,
  `num_dept` int(5) DEFAULT NULL,
  PRIMARY KEY (`num`),
  KEY `n_dep` (`num_dept`)
) ENGINE=InnoDB;

--
-- Déchargement des données de la table `employe`
--

INSERT INTO `employe` (`nom`, `num`, `fonction`, `n_sup`, `embauche`, `salaire`, `comm`, `num_dept`) VALUES
('gardarin', 15155, 'ingénieur', 24533, '22-03-85', 24000, NULL, 10),
('lebreton', 16034, 'commercial', 27047, '01-06-91', 15000, 0, 20),
('delobel', 16278, 'ingénieur', 24533, '16-11-94', 21000, NULL, 10),
('martin', 16712, 'directeur', 25717, '23-05-90', 40000, NULL, 30),
('martin', 17147, 'commercial', 27047, '10-12-93', 20000, 500, 20),
('balin', 17232, 'administratif', 24533, '03-10-87', 13500, NULL, 10),
('dupont', 17574, 'administratif', 16712, '03-05-92', 9000, NULL, 30),
('codd', 24533, 'directeur', 25717, '12-09-75', 55000, NULL, 10),
('bara', 24831, 'administratif', 16712, '10-09-88', 15000, NULL, 30),
('lambert', 25012, 'administratif', 27047, '14-04-91', 12000, NULL, 20),
('adiba', 25067, 'ingénieur', 24533, '05-10-87', 30000, NULL, 10),
('joubert', 25717, 'president', NULL, '10-10-82', 50000, NULL, 30),
('lefebvre', 25935, 'commercial', 27047, '11-01-84', 23500, 1500, 20),
('dupond', 26691, 'commercial', 27047, '04-04-88', 25000, 2500, 20),
('simon', 26834, 'ingénieur', 24533, '04-10-88', 2000, NULL, 10),
('lamere', 27047, 'directeur', 25717, '07-09-89', 45000, NULL, 20),
('paquel', 27546, 'commercial', 27047, '03-09-83', 22000, 2000, 20);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `employe`
--
ALTER TABLE `employe`
  ADD CONSTRAINT `employe_ibfk_1` FOREIGN KEY (`num_dept`) REFERENCES `dept` (`n_dept`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
