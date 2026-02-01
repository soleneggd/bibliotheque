-- phpMyAdmin SQL Dump
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Base de données : `biblio`
--

-- --------------------------------------------------------

--
-- Structure de la table `auteurs`
--

CREATE TABLE `auteurs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom` text DEFAULT NULL,
  `prenom` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `auteurs`
--

INSERT INTO `auteurs` (`id`, `nom`, `prenom`) VALUES
(1, 'Hugo', 'Victor'),
(2, 'MontBlanc', 'Michel'),
(3, 'Simmons', 'Dan'),
(4, 'Dorbien', 'Jean'),
(5, 'Daudet', 'Alphonse');

-- --------------------------------------------------------

--
-- Structure de la table `editeurs`
--

CREATE TABLE `editeurs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom` text DEFAULT NULL,
  `adresse` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `editeurs`
--

INSERT INTO `editeurs` (`id`, `nom`, `adresse`) VALUES
(1, 'Campus Presse', '10, rue de la Paix, 75015 Paris'),
(2, 'Flammarion', '12, avenue des Champs Elysés, 75010 Paris'),
(3, 'Larousse', '20, rue du Peuple Belge, 59000 Lille'),
(4, 'Plein Air', '20, rue du Ciel, 666666 Paradis');

-- --------------------------------------------------------

--
-- Structure de la table `livres`
--

CREATE TABLE `livres` (
  `isbn` char(3) NOT NULL,
  `titre` text DEFAULT NULL,
  `resume` text DEFAULT NULL,
  `prix` decimal(6,2) DEFAULT NULL,
  `id_editeur` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `livres`
--

INSERT INTO `livres` (`isbn`, `titre`, `resume`, `prix`, `id_editeur`) VALUES
('100', 'Journal Interne', 'Présentation des services', NULL, NULL),
('214', 'Hypérion', 'Sur Hypérion, planète située aux confins de \r\nl\'Hégémonie, erre une terrifiante créature, à la fois adulée et crainte par les hommes : le Gritche. \r\nDans la mystérieuse vallée des Tombeaux du Temps, il attend son heure...\r\n \r\nÀ la veille d\'une guerre apocalyptique, sept pèlerins sont envoyés sur Hypérion. Leur mission : \r\nempêcher la réouverture des Tombeaux. Ils ne se connaissent pas, mais cachent tous un terrible secret \r\n– et un espoir démesuré.\r\nEt l\'un d\'entre eux pourrait même tenir le destin de l\'humanité entre ses mains.', '9.40', 2),
('215', 'La chute d\'Hypérion', 'L\'Hégémonie gouverne plus de trois cents \r\nmondes. Les Extros ont pris le LARGE après l\'Hégire mais un de leurs essaims, depuis trois cents ans, \r\nse rapproche d\'Hypérion.\r\n \r\nL\'ouverture des Tombeaux du temps est proche. L\'Hégémonie envoie sept pèlerins sur la planète.\r\nDrôles de pèlerins ! Celui-ci n\'arrive pas à se débarrasser d\'un parasite de résurrection ; \r\ncelui-là écrit un poème qui, selon lui, infléchira le cours des événements. Deux d\'entre eux veulent \r\ntuer le Gritche ; un autre hésite à lui sacrifier sa propre fille, qui naîtra dans trois jours. \r\nEt le dernier semble trahir tout le monde, ce qui étrangement ne trouble personne...\r\n', '6.95', 2),
('547', 'Les misérables', 'Le destin de Jean Valjean, forçat échappé du bagne,\r\nest bouleversé par sa rencontre avec Fantine. Mourante et sans le sou, celle-ci lui demande de prendre \r\nsoin de Cosette, sa fille confiée aux Thénardier. Ce couple d\'aubergistes, malhonnête et sans scrupules, \r\nexploitent la fillette jusqu\'à ce que Jean Valjean tienne sa promesse et l\'adopte. Cosette devient \r\nalors sa raison de vivre. Mais son passé le rattrape et l\'inspecteur Javert le traque.', '7.00', 2),
('548', 'Notre dame de Paris', 'Il était là, grave, immobile, absorbé dans \r\nun regard et dans une pensée. Tout Paris était sous ses pieds, avec les mille flèches de ses édifices \r\net son circulaire horizon de molles collines, avec son fleuve qui serpente sous ses ponts et son peuple \r\nqui ondule dans ses rues, avec le nuage de ses fumées, avec la chaîne montueuse de ses toits qui presse \r\nNotre-Dame de ses mailles redoublées. Mais dans toute cette ville, l\'archidiacre ne regardait qu\'un \r\npoint du pavé : la place du Parvis ; dans toute cette foule, qu\'une figure : la bohémienne.\r\n \r\nIl eût été difficile de dire de quelle nature était ce regard, et d\'où venait la flamme qui en \r\njaillissait. C\'était un regard fixe, et pourtant plein de trouble et de tumulte. Et à l\'immobilité \r\nprofonde de tout son corps, à peine agité par intervalles d\'un frisson machinal, comme un arbre au \r\nvent, à la roideur de ses coudes plus marbre que la rampe où ils s\'appuyaient, à voir le sourire \r\npétrifié qui contractait son visage, on eût dit qu\'il n\'y avait plus dans Claude Frollo que \r\nles yeux du vivant.', '7.00', 2),
('744', 'JavaScript pour les nuls', 'Tout savoir sur la programmation JavaScript', '11.00', 1),
('855', 'Dictionnaire', 'Avec plus de 63500 mots, 125000 sens et 20000 locutions, \r\n28000 noms propres. Et aussi : 1500 remarques de langue ou d\'orthographe. 2000 régionalismes et mots de la \r\nfrancophonie. 4500 compléments encyclopédiques. 5500 cartes, dessins, photographies, schémas et planches. \r\nAvec une carte d\'activation pour bénéficier d\'un accès  privilégié au Dictionnaire Internet Larousse 2020 \r\ncontenant plus de 80000 mots, 9600 verbes conjugués et des dossiers encyclopédiques sur les notions clés \r\nde la culture générale.', '44.00', 3),
('856', 'L\'officiel des prénoms', 'La 17ème édition du best-seller des livres \r\nde prénoms ! N°1 des guides de prénoms pour trouver le plus beau prénom pour son enfant.\r\n \r\nD\'Adam à Zélie, en passant par Côme, Gabin, Apolline ou Mila, votre coup de coeur figure forcément \r\nparmi les prénoms rares, répandus, classiques ou modernes de cet ouvrage !\r\n \r\nDécouvrez l\'origine, la signification, les variantes, les tendances et les fréquences d\'attribution \r\nde plus de 12 000 prénoms féminins et masculins. Croisant statistiques de l\'Insee et informations \r\npratiques, L\'Officiel des prénoms s\'est imposé depuis 17 ans comme le guide référence.', '17.95', 3);

-- --------------------------------------------------------

--
-- Structure de la table `livres_auteurs`
--

CREATE TABLE `livres_auteurs` (
  `auteur_id` bigint(11) UNSIGNED DEFAULT NULL,
  `livre_isbn` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `livres_auteurs`
--

INSERT INTO `livres_auteurs` (`auteur_id`, `livre_isbn`) VALUES
(2, '744'),
(4, '744'),
(1, '547'),
(1, '548'),
(3, '214'),
(3, '215');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `auteurs`
--
ALTER TABLE `auteurs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auid` (`id`);

--
-- Index pour la table `editeurs`
--
ALTER TABLE `editeurs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `edid` (`id`);

--
-- Index pour la table `livres`
--
ALTER TABLE `livres`
  ADD PRIMARY KEY (`isbn`),
  ADD KEY `edid` (`id_editeur`);

--
-- Index pour la table `livres_auteurs`
--
ALTER TABLE `livres_auteurs`
  ADD KEY `auid` (`auteur_id`),
  ADD KEY `livre_isbn` (`livre_isbn`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `auteurs`
--
ALTER TABLE `auteurs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `editeurs`
--
ALTER TABLE `editeurs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `livres`
--
ALTER TABLE `livres`
  ADD CONSTRAINT `livres_ibfk_1` FOREIGN KEY (`id_editeur`) REFERENCES `editeurs` (`id`);

--
-- Contraintes pour la table `livres_auteurs`
--
ALTER TABLE `livres_auteurs`
  ADD CONSTRAINT `livres_auteurs_ibfk_1` FOREIGN KEY (`auteur_id`) REFERENCES `auteurs` (`id`),
  ADD CONSTRAINT `livres_auteurs_ibfk_2` FOREIGN KEY (`livre_isbn`) REFERENCES `livres` (`isbn`);

COMMIT;
