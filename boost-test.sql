-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 13 oct. 2022 à 19:31
-- Version du serveur :  10.4.8-MariaDB
-- Version de PHP : 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `boost-test`
--

-- --------------------------------------------------------

--
-- Structure de la table `activite`
--

CREATE TABLE `activite` (
  `ID_ACTIVITE` int(11) NOT NULL,
  `ID_TICKET` int(11) NOT NULL,
  `ID_USER` int(11) NOT NULL,
  `ID_STATUT` int(11) DEFAULT NULL,
  `ID_PRIORITE` int(11) DEFAULT NULL,
  `ID_TYPE_TICKET` int(11) DEFAULT NULL,
  `DATE_ACTIVITE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `activite`
--

INSERT INTO `activite` (`ID_ACTIVITE`, `ID_TICKET`, `ID_USER`, `ID_STATUT`, `ID_PRIORITE`, `ID_TYPE_TICKET`, `DATE_ACTIVITE`) VALUES
(1, 1, 1, 2, 2, 3, '2022-10-13 17:47:41'),
(2, 2, 1, 2, 1, 1, '2022-10-13 17:51:41'),
(3, 1, 1, 1, NULL, NULL, '2022-10-13 18:47:41'),
(8, 7, 1, 2, 3, 3, '2022-10-13 19:19:43');

-- --------------------------------------------------------

--
-- Structure de la table `priorite_ticket`
--

CREATE TABLE `priorite_ticket` (
  `ID_PRIORITE` int(11) NOT NULL,
  `NOM_PRIORITE` varchar(255) NOT NULL,
  `COULEUR_PRIORITE` char(7) DEFAULT '#ffffff'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `priorite_ticket`
--

INSERT INTO `priorite_ticket` (`ID_PRIORITE`, `NOM_PRIORITE`, `COULEUR_PRIORITE`) VALUES
(1, 'Faible', '#34deeb'),
(2, 'Intermédiaire', '#ebe234'),
(3, 'Élevée', '#eb3734');

-- --------------------------------------------------------

--
-- Structure de la table `statut`
--

CREATE TABLE `statut` (
  `ID_STATUT` int(11) NOT NULL,
  `NOM_STATUT` varchar(255) NOT NULL,
  `COULEUR_STATUT` char(7) DEFAULT '#ffffff'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `statut`
--

INSERT INTO `statut` (`ID_STATUT`, `NOM_STATUT`, `COULEUR_STATUT`) VALUES
(1, 'pris en charge', '#7aeb34'),
(2, 'ouvert', '#ebab34');

-- --------------------------------------------------------

--
-- Structure de la table `ticket`
--

CREATE TABLE `ticket` (
  `ID_TICKET` int(11) NOT NULL,
  `TITRE_TICKET` varchar(255) NOT NULL,
  `DESC_TICKET` text NOT NULL,
  `PAGE_TICKET` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `ticket`
--

INSERT INTO `ticket` (`ID_TICKET`, `TITRE_TICKET`, `DESC_TICKET`, `PAGE_TICKET`) VALUES
(1, 'Bug page d\'accueil', 'Problème au niveau du scroll.', NULL),
(2, 'Pouvoir ajouter une pièce jointe', 'Il serait intéressant de pouvoir ajouter des images aux tickets !', NULL),
(7, 'Bug affichage', 'Illisible grand écran', '');

-- --------------------------------------------------------

--
-- Structure de la table `type_ticket`
--

CREATE TABLE `type_ticket` (
  `ID_TYPE_TICKET` int(11) NOT NULL,
  `NOM_TYPE_TICKET` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `type_ticket`
--

INSERT INTO `type_ticket` (`ID_TYPE_TICKET`, `NOM_TYPE_TICKET`) VALUES
(1, 'idée d\'amélioration'),
(2, 'demande d\'amélioration'),
(3, 'bug');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `ID_USER` int(11) NOT NULL,
  `USERNAME` varchar(255) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `PICTURE_USER` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`ID_USER`, `USERNAME`, `PASSWORD`, `PICTURE_USER`) VALUES
(1, 'Fabien', 'fsdfds', NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `activite`
--
ALTER TABLE `activite`
  ADD PRIMARY KEY (`ID_ACTIVITE`),
  ADD KEY `ID_USER` (`ID_USER`),
  ADD KEY `ID_TICKET` (`ID_TICKET`),
  ADD KEY `DATE_ACTIVITE` (`DATE_ACTIVITE`);

--
-- Index pour la table `priorite_ticket`
--
ALTER TABLE `priorite_ticket`
  ADD PRIMARY KEY (`ID_PRIORITE`);

--
-- Index pour la table `statut`
--
ALTER TABLE `statut`
  ADD PRIMARY KEY (`ID_STATUT`);

--
-- Index pour la table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`ID_TICKET`);

--
-- Index pour la table `type_ticket`
--
ALTER TABLE `type_ticket`
  ADD PRIMARY KEY (`ID_TYPE_TICKET`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID_USER`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `activite`
--
ALTER TABLE `activite`
  MODIFY `ID_ACTIVITE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `priorite_ticket`
--
ALTER TABLE `priorite_ticket`
  MODIFY `ID_PRIORITE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `statut`
--
ALTER TABLE `statut`
  MODIFY `ID_STATUT` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `ID_TICKET` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `type_ticket`
--
ALTER TABLE `type_ticket`
  MODIFY `ID_TYPE_TICKET` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `ID_USER` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `activite`
--
ALTER TABLE `activite`
  ADD CONSTRAINT `activite_ibfk_1` FOREIGN KEY (`ID_USER`) REFERENCES `user` (`ID_USER`),
  ADD CONSTRAINT `activite_ibfk_2` FOREIGN KEY (`ID_TICKET`) REFERENCES `ticket` (`ID_TICKET`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
