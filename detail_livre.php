<?php
// Initialise Twig
include('include/twig.php');
$twig = init_twig();

// Récupération de la variable $isbn sur l'URL et conversion en entier
$isbn = (int)($_GET['isbn'] ?? 0);

// Récupère les identifiants dans un fichier de configuration
include('include/config.php');

// Connexion à la base de données et force l'affichage des erreurs SQL
$pdo = new PDO('mysql:host=' . SERVER . ';dbname=' . BDD . ';charset=utf8', USER, PASSWORD);
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING);

// Récupération des données : le livre dont l'isbn est sur l'URL
$sql = 'SELECT livres.*, editeurs.nom AS editeur
FROM livres LEFT JOIN editeurs ON livres.id_editeur = editeurs.id
WHERE isbn=:isbn';
$query = $pdo->prepare($sql);
$query->bindValue(':isbn', $isbn, PDO::PARAM_INT);
$query->execute();
$livre_unique = $query->fetch(PDO::FETCH_ASSOC);

// Récupération des données : les auteurs du livre dont l'isbn est sur l'URL
$sql = 'SELECT * FROM
auteurs JOIN livres_auteurs ON auteurs.id = livres_auteurs.auteur_id
WHERE livres_auteurs.livre_isbn = :isbn';
$query = $pdo->prepare($sql);
$query->bindValue(':isbn', $isbn, PDO::PARAM_INT);
$query->execute();
$livre_auteurs = $query->fetchAll(PDO::FETCH_ASSOC);

// Lancement du moteur Twig avec les données
echo $twig->render('detail_livre.twig', [
  'livre' => $livre_unique,
  'auteurs' => $livre_auteurs
]);
