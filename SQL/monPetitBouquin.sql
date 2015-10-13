-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Mar 13 Octobre 2015 à 11:29
-- Version du serveur :  5.6.20
-- Version de PHP :  5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `monPetitBouquin`
--

-- --------------------------------------------------------

--
-- Structure de la table `AUTHOR`
--

CREATE TABLE IF NOT EXISTS `AUTHOR` (
`Id` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Firstname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `BOOK`
--

CREATE TABLE IF NOT EXISTS `BOOK` (
  `ISBN` int(13) NOT NULL,
  `Title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `BOOK_AUTHOR`
--

CREATE TABLE IF NOT EXISTS `BOOK_AUTHOR` (
  `IdBook` int(11) NOT NULL,
  `IdAuthor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `CRITICISM`
--

CREATE TABLE IF NOT EXISTS `CRITICISM` (
  `IdBook` int(13) NOT NULL,
  `IdUser` int(13) NOT NULL,
  `Rate` int(1) DEFAULT NULL,
  `Comment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `AUTHOR`
--
ALTER TABLE `AUTHOR`
 ADD PRIMARY KEY (`Id`);

--
-- Index pour la table `BOOK`
--
ALTER TABLE `BOOK`
 ADD PRIMARY KEY (`ISBN`);

--
-- Index pour la table `BOOK_AUTHOR`
--
ALTER TABLE `BOOK_AUTHOR`
 ADD PRIMARY KEY (`IdBook`,`IdAuthor`), ADD KEY `fk_author` (`IdAuthor`);

--
-- Index pour la table `CRITICISM`
--
ALTER TABLE `CRITICISM`
 ADD PRIMARY KEY (`IdBook`,`IdUser`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `AUTHOR`
--
ALTER TABLE `AUTHOR`
MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `BOOK_AUTHOR`
--
ALTER TABLE `BOOK_AUTHOR`
ADD CONSTRAINT `fk_author` FOREIGN KEY (`IdAuthor`) REFERENCES `AUTHOR` (`Id`),
ADD CONSTRAINT `fk_book` FOREIGN KEY (`IdBook`) REFERENCES `BOOK` (`ISBN`);

--
-- Contraintes pour la table `CRITICISM`
--
ALTER TABLE `CRITICISM`
ADD CONSTRAINT `fk_book_criticism` FOREIGN KEY (`IdBook`) REFERENCES `BOOK` (`ISBN`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
