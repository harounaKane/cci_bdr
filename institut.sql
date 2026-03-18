SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT;
SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS;
SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION;
SET NAMES utf8mb4;

--
-- Base de données : `institut`
--

-- --------------------------------------------------------

--
-- Structure de la table `matiere`
--

DROP TABLE IF EXISTS `matiere`;
CREATE TABLE IF NOT EXISTS `matiere` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `professeur_id` int(11) NOT NULL,
  `libelle` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9014574ABAB22EE9` (`professeur_id`)
) ENGINE=InnoDB;

--
-- Déchargement des données de la table `matiere`
--

INSERT INTO `matiere` (`id`, `professeur_id`, `libelle`) VALUES
(1, 1, 'Bases de données relationnelles'),
(2, 1, 'SQL avancé'),
(3, 1, 'Modélisation UML'),
(4, 1, 'Conception de systèmes d\'info'),
(5, 2, 'Développement Python'),
(6, 2, 'Algorithmique'),
(7, 2, 'Structures de données'),
(8, 3, 'Développement Web — HTML/CSS'),
(9, 3, 'JavaScript ES6+'),
(10, 3, 'Frameworks front-end (React/Vue)'),
(11, 4, 'Administration Linux'),
(12, 4, 'Scripting Bash'),
(13, 5, 'Réseaux TCP/IP'),
(14, 5, 'Sécurité des réseaux'),
(15, 6, 'Développement Java'),
(16, 6, 'Spring Boot'),
(17, 7, 'Gestion de projet Agile / Scrum'),
(18, 7, 'Management d\'équipe IT'),
(19, 8, 'Cloud computing AWS'),
(20, 8, 'DevOps & CI/CD'),
(21, 9, 'Machine Learning'),
(22, 9, 'Python Data Science'),
(23, 10, 'Cybersécurité offensive'),
(24, 10, 'Ethical Hacking'),
(25, 11, 'Développement mobile Android'),
(26, 12, 'Développement iOS (Swift)'),
(27, 13, 'Docker & Kubernetes'),
(28, 14, 'Architecture microservices'),
(29, 15, 'Power BI & Visualisation'),
(30, 16, 'Excel avancé & VBA'),
(31, 17, 'Gestion de bases NoSQL (MongoDB)'),
(32, 18, 'Tests logiciels & QA'),
(33, 19, 'UI/UX Design'),
(34, 20, 'Wordpress & CMS'),
(35, 20, 'E-commerce & SEO');

-- --------------------------------------------------------

--
-- Structure de la table `professeur`
--

DROP TABLE IF EXISTS `professeur`;
CREATE TABLE IF NOT EXISTS `professeur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

--
-- Déchargement des données de la table `professeur`
--

INSERT INTO `professeur` (`id`, `nom`, `prenom`) VALUES
(1, 'Martin', 'Sophie'),
(2, 'Bernard', 'Lucas'),
(3, 'Dubois', 'Emma'),
(4, 'Thomas', 'Hugo'),
(5, 'Robert', 'Léa'),
(6, 'Petit', 'Nathan'),
(7, 'Durand', 'Chloé'),
(8, 'Leroy', 'Maxime'),
(9, 'Moreau', 'Inès'),
(10, 'Simon', 'Théo'),
(11, 'Laurent', 'Jade'),
(12, 'Lefebvre', 'Raphaël'),
(13, 'Michel', 'Camille'),
(14, 'Garcia', 'Antoine'),
(15, 'David', 'Manon'),
(16, 'Bertrand', 'Quentin'),
(17, 'Roux', 'Océane'),
(18, 'Vincent', 'Alexis'),
(19, 'Fournier', 'Clara'),
(20, 'Morel', 'Sébastien'),
(21, 'Julie', 'Durand'),
(22, 'Ali', 'Manga');

-- --------------------------------------------------------

--
-- Structure de la table `stage`
--

DROP TABLE IF EXISTS `stage`;
CREATE TABLE IF NOT EXISTS `stage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) NOT NULL,
  `cout` float(10,2) NOT NULL,
  `date_debut` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

--
-- Déchargement des données de la table `stage`
--

INSERT INTO `stage` (`id`, `libelle`, `cout`, `date_debut`) VALUES
(1, 'Formation Développeur Web Full-Stack', 1800.00, '2024-09-02 09:00:00'),
(2, 'Formation SQL & Bases de Données', 1200.00, '2024-09-09 09:00:00'),
(3, 'Formation Python & Data Science', 1600.00, '2024-09-16 09:00:00'),
(4, 'Formation Cybersécurité', 2000.00, '2024-09-23 09:00:00'),
(5, 'Formation Cloud AWS', 1900.00, '2024-09-30 09:00:00'),
(6, 'Formation DevOps & CI/CD', 1750.00, '2024-10-07 09:00:00'),
(7, 'Formation Gestion de Projet Agile', 1100.00, '2024-10-14 09:00:00'),
(8, 'Formation Java & Spring Boot', 1650.00, '2024-10-21 09:00:00'),
(9, 'Formation Administration Linux', 1300.00, '2024-10-28 09:00:00'),
(10, 'Formation Machine Learning', 2100.00, '2024-11-04 09:00:00'),
(11, 'Formation Développement Mobile', 1500.00, '2024-11-11 09:00:00'),
(12, 'Formation Docker & Kubernetes', 1850.00, '2024-11-18 09:00:00'),
(13, 'Formation Excel & Power BI', 950.00, '2024-11-25 09:00:00'),
(14, 'Formation Réseaux & Sécurité', 1400.00, '2024-12-02 09:00:00'),
(15, 'Formation UML & Conception SI', 1250.00, '2024-12-09 09:00:00'),
(16, 'Formation UI/UX Design', 1050.00, '2024-12-16 09:00:00'),
(17, 'Formation NoSQL & MongoDB', 1150.00, '2025-01-06 09:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `stage_matiere`
--

DROP TABLE IF EXISTS `stage_matiere`;
CREATE TABLE IF NOT EXISTS `stage_matiere` (
  `stage_id` int(11) NOT NULL,
  `matiere_id` int(11) NOT NULL,
  PRIMARY KEY (`stage_id`,`matiere_id`),
  KEY `IDX_1AED17072298D193` (`stage_id`),
  KEY `IDX_1AED1707F46CD258` (`matiere_id`)
) ENGINE=InnoDB;

--
-- Déchargement des données de la table `stage_matiere`
--

INSERT INTO `stage_matiere` (`stage_id`, `matiere_id`) VALUES
(1, 8),
(1, 9),
(1, 10),
(1, 15),
(2, 1),
(2, 2),
(2, 3),
(2, 31),
(3, 5),
(3, 6),
(3, 22),
(3, 29),
(4, 13),
(4, 14),
(4, 23),
(4, 24),
(5, 19),
(5, 20),
(5, 27),
(6, 11),
(6, 20),
(6, 27),
(6, 28),
(7, 17),
(7, 18),
(8, 15),
(8, 16),
(8, 28),
(9, 11),
(9, 12),
(9, 13),
(10, 5),
(10, 6),
(10, 21),
(10, 22),
(11, 25),
(11, 26),
(12, 11),
(12, 20),
(12, 27),
(13, 29),
(13, 30),
(14, 12),
(14, 13),
(14, 14),
(15, 3),
(15, 4),
(15, 17),
(16, 8),
(16, 9),
(16, 33),
(17, 1),
(17, 28),
(17, 31);

-- --------------------------------------------------------

--
-- Structure de la table `stagiaire`
--

DROP TABLE IF EXISTS `stagiaire`;
CREATE TABLE IF NOT EXISTS `stagiaire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  `adresse` varchar(100) DEFAULT NULL,
  `cp` int(5) DEFAULT NULL,
  `ville` varchar(45) DEFAULT NULL,
  `date_inscription` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

--
-- Déchargement des données de la table `stagiaire`
--

INSERT INTO `stagiaire` (`id`, `nom`, `prenom`, `adresse`, `cp`, `ville`, `date_inscription`) VALUES
(1, 'Aubert', 'Lucie', '12 rue de Rivoli', 75001, 'Paris', '2024-07-15 10:00:00'),
(2, 'Carpentier', 'Tom', '5 allée des Roses', 93100, 'Montreuil', '2024-07-16 10:00:00'),
(3, 'Deschamps', 'Pauline', '8 avenue Victor Hugo', 94300, 'Vincennes', '2024-07-17 10:00:00'),
(4, 'Ferreira', 'Diego', '22 bd Voltaire', 75011, 'Paris', '2024-07-18 10:00:00'),
(5, 'Gilles', 'Marie', '3 rue des Lilas', 92200, 'Neuilly-sur-Seine', '2024-07-19 10:00:00'),
(6, 'Hubert', 'Pierre', '17 rue Pasteur', 93200, 'Saint-Denis', '2024-07-22 10:00:00'),
(7, 'Jacquet', 'Elise', '9 impasse du Moulin', 78000, 'Versailles', '2024-07-23 10:00:00'),
(8, 'Klein', 'Mathieu', '45 avenue de la Gare', 91000, 'Évry-Courcouronnes', '2024-07-24 10:00:00'),
(9, 'Lambert', 'Sarah', '6 rue du Général de Gaulle', 95100, 'Argenteuil', '2024-07-25 10:00:00'),
(10, 'Masson', 'Florian', '31 bd Jean Jaurès', 94200, 'Ivry-sur-Seine', '2024-07-26 10:00:00'),
(11, 'Noel', 'Amandine', '14 rue Victor Hugo', 92100, 'Boulogne-Billancourt', '2024-07-29 10:00:00'),
(12, 'Olivier', 'Romain', '2 allée des Peupliers', 93300, 'Aubervilliers', '2024-07-30 10:00:00'),
(13, 'Perrin', 'Julie', '55 rue de la République', 94400, 'Vitry-sur-Seine', '2024-07-31 10:00:00'),
(14, 'Quentin', 'Bastien', '7 rue du Commerce', 75015, 'Paris', '2024-08-01 10:00:00'),
(15, 'Richard', 'Céline', '18 avenue Foch', 92300, 'Levallois-Perret', '2024-08-02 10:00:00'),
(16, 'Schmitt', 'Adrien', '23 rue des Écoles', 93400, 'Saint-Ouen', '2024-08-05 10:00:00'),
(17, 'Tessier', 'Laura', '11 boulevard Haussmann', 75009, 'Paris', '2024-08-06 10:00:00'),
(18, 'Ullmann', 'Kevin', '4 rue des Fleurs', 91300, 'Massy', '2024-08-07 10:00:00'),
(19, 'Vidal', 'Anaïs', '29 rue Nationale', 94000, 'Créteil', '2024-08-08 10:00:00'),
(20, 'Weber', 'Damien', '16 avenue de la Paix', 78200, 'Mantes-la-Jolie', '2024-08-09 10:00:00'),
(21, 'Xavier', 'Noémie', '8 rue Carnot', 92400, 'Courbevoie', '2024-08-12 10:00:00'),
(22, 'Youssef', 'Karim', '33 bd de la Liberté', 93500, 'Pantin', '2024-08-13 10:00:00'),
(23, 'Zimmermann', 'Estelle', '21 rue Molière', 94500, 'Champigny-sur-Marne', '2024-08-14 10:00:00'),
(24, 'Allard', 'Baptiste', '6 passage de la Bonne Graine', 75011, 'Paris', '2024-08-15 10:00:00'),
(25, 'Bonnet', 'Laetitia', '10 rue de la Mairie', 95200, 'Sarcelles', '2024-08-16 10:00:00'),
(26, 'Colin', 'Thibault', '38 avenue Jean Moulin', 94700, 'Maisons-Alfort', '2024-08-19 10:00:00'),
(27, 'Denis', 'Marion', '5 rue des Acacias', 92600, 'Asnières-sur-Seine', '2024-08-20 10:00:00'),
(28, 'Etienne', 'Valentin', '27 rue du 8 Mai 1945', 93600, 'Aulnay-sous-Bois', '2024-08-21 10:00:00'),
(29, 'Fleury', 'Clémence', '3 allée du Château', 95300, 'Pontoise', '2024-08-22 10:00:00'),
(30, 'Grondin', 'Alexis', '19 rue de la Paix', 77000, 'Melun', '2024-08-23 10:00:00'),
(31, 'Herve', 'Mathilde', '12 rue Gambetta', 91200, 'Athis-Mons', '2024-08-26 10:00:00'),
(32, 'Ibrahim', 'Yassine', '44 avenue du Président', 93700, 'Drancy', '2024-08-27 10:00:00'),
(33, 'Joubert', 'Charlotte', '7 rue de la Source', 94600, 'Choisy-le-Roi', '2024-08-28 10:00:00'),
(34, 'Kessler', 'Florent', '2 rue des Martyrs', 75018, 'Paris', '2024-08-29 10:00:00'),
(35, 'Lepage', 'Camille', '15 av Georges Clemenceau', 92700, 'Colombes', '2024-08-30 10:00:00'),
(36, 'Moulin', 'Rémi', '9 bd de Strasbourg', 93800, 'Épinay-sur-Seine', '2024-09-02 10:00:00'),
(37, 'Navarro', 'Sabrina', '26 rue des Boulangers', 94800, 'Villejuif', '2024-09-03 10:00:00'),
(38, 'Oury', 'Jonathan', '1 place de la Concorde', 75008, 'Paris', '2024-09-04 10:00:00'),
(39, 'Pasquier', 'Virginie', '30 rue Voltaire', 92800, 'Puteaux', '2024-09-05 10:00:00'),
(40, 'Renaud', 'Mickael', '13 av du Maréchal Foch', 95400, 'Villiers-le-Bel', '2024-09-06 10:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `stagiaire_stage`
--

DROP TABLE IF EXISTS `stagiaire_stage`;
CREATE TABLE IF NOT EXISTS `stagiaire_stage` (
  `stagiaire_id` int(11) NOT NULL,
  `stage_id` int(11) NOT NULL,
  PRIMARY KEY (`stagiaire_id`,`stage_id`),
  KEY `IDX_979FD2C5BBA93DD6` (`stagiaire_id`),
  KEY `IDX_979FD2C52298D193` (`stage_id`)
) ENGINE=InnoDB;

--
-- Déchargement des données de la table `stagiaire_stage`
--

INSERT INTO `stagiaire_stage` (`stagiaire_id`, `stage_id`) VALUES
(1, 1),
(1, 7),
(1, 13),
(2, 2),
(2, 8),
(2, 15),
(3, 3),
(3, 9),
(3, 16),
(4, 1),
(4, 4),
(4, 11),
(5, 5),
(5, 10),
(5, 17),
(6, 2),
(6, 6),
(6, 12),
(7, 3),
(7, 7),
(7, 14),
(8, 4),
(8, 13),
(9, 1),
(9, 8),
(9, 16),
(10, 2),
(10, 9),
(10, 15),
(11, 3),
(11, 7),
(11, 10),
(12, 5),
(12, 17),
(13, 6),
(13, 12),
(14, 1),
(14, 11),
(14, 16),
(15, 4),
(15, 7),
(15, 13),
(16, 3),
(16, 9),
(16, 14),
(17, 1),
(17, 8),
(17, 15),
(18, 6),
(18, 10),
(19, 2),
(19, 7),
(19, 13),
(20, 5),
(20, 12),
(20, 17),
(21, 3),
(21, 11),
(21, 16),
(22, 1),
(22, 9),
(23, 4),
(23, 7),
(23, 13),
(24, 6),
(24, 10),
(24, 15),
(25, 2),
(25, 12),
(26, 8),
(26, 13),
(27, 3),
(27, 7),
(27, 16),
(28, 5),
(28, 11),
(28, 17),
(29, 4),
(29, 9),
(29, 14),
(30, 1),
(30, 10),
(30, 15),
(31, 6),
(31, 12),
(32, 3),
(32, 11),
(33, 2),
(33, 7),
(33, 13),
(34, 4),
(34, 9),
(34, 14),
(35, 8),
(35, 13),
(35, 16),
(36, 5),
(36, 10),
(36, 17),
(37, 3),
(37, 7),
(37, 10),
(38, 1),
(38, 6),
(38, 12),
(38, 16),
(39, 3),
(39, 9),
(39, 13),
(40, 2),
(40, 7),
(40, 10),
(40, 15);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `matiere`
--
ALTER TABLE `matiere`
  ADD CONSTRAINT `FK_9014574ABAB22EE9` FOREIGN KEY (`professeur_id`) REFERENCES `professeur` (`id`);

--
-- Contraintes pour la table `stage_matiere`
--
ALTER TABLE `stage_matiere`
  ADD CONSTRAINT `FK_1AED17072298D193` FOREIGN KEY (`stage_id`) REFERENCES `stage` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1AED1707F46CD258` FOREIGN KEY (`matiere_id`) REFERENCES `matiere` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `stagiaire_stage`
--
ALTER TABLE `stagiaire_stage`
  ADD CONSTRAINT `FK_979FD2C52298D193` FOREIGN KEY (`stage_id`) REFERENCES `stage` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_979FD2C5BBA93DD6` FOREIGN KEY (`stagiaire_id`) REFERENCES `stagiaire` (`id`) ON DELETE CASCADE;


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
