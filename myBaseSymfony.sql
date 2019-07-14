-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:3306
-- Généré le :  Dim 14 Juillet 2019 à 02:37
-- Version du serveur :  5.7.26-0ubuntu0.18.04.1
-- Version de PHP :  7.2.19-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `myBaseSymfony`
--

-- --------------------------------------------------------

--
-- Structure de la table `employe`
--

CREATE TABLE `employe` (
  `id` int(11) NOT NULL,
  `service_id` int(11) DEFAULT NULL,
  `matricule` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nomcomplet` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `datenaiss` date NOT NULL,
  `salaire` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `employe`
--

INSERT INTO `employe` (`id`, `service_id`, `matricule`, `nomcomplet`, `datenaiss`, `salaire`) VALUES
(17, 1, 'aaa01', 'seynabou ndiaye', '2019-07-06', 1000000),
(18, 2, 'aaa02', 'oumy diop', '2019-07-11', 500000),
(19, 1, 'aaa03', 'babacar camara', '2019-07-02', 100000),
(20, 1, 'aaa04', 'daba aw', '2019-07-05', 200000),
(22, 1, 'aaa05', 'jean marie', '2019-07-04', 300000),
(23, 4, 'aaa06', 'coumba sy', '2019-07-26', 120000),
(24, 5, 'aaa07', 'moustapha fall', '2019-07-22', 225000),
(25, 3, 'aaa08', 'omar', '2019-07-18', 100000),
(26, 5, 'aaa09', 'fallou kane', '2019-07-18', 150000),
(27, 2, 'aaa010', 'mar seck', '2019-07-03', 100000);

-- --------------------------------------------------------

--
-- Structure de la table `migration_versions`
--

CREATE TABLE `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
('20190712161530', '2019-07-12 16:18:07');

-- --------------------------------------------------------

--
-- Structure de la table `service`
--

CREATE TABLE `service` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `service`
--

INSERT INTO `service` (`id`, `libelle`) VALUES
(1, 'administration'),
(2, 'informatique'),
(3, 'securite'),
(4, 'restauration'),
(5, 'hygiéne');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `employe`
--
ALTER TABLE `employe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_F804D3B9ED5CA9E6` (`service_id`);

--
-- Index pour la table `migration_versions`
--
ALTER TABLE `migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `employe`
--
ALTER TABLE `employe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT pour la table `service`
--
ALTER TABLE `service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `employe`
--
ALTER TABLE `employe`
  ADD CONSTRAINT `FK_F804D3B9ED5CA9E6` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
