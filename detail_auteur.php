<?php
// Initialise Twig
include('include/twig.php');
$twig = init_twig();

// Récupération de la variable $id sur l'URL et conversion en entier
$id = (int)($_GET['id'] ?? 0);

// Récupère les identifiants dans un fichier de configuration
include('include/config.php');

// Connexion à la base de données et force l'affichage des erreurs SQL
$pdo = new PDO('mysql:host=' . SERVER . ';dbname=' . BDD . ';charset=utf8', USER, PASSWORD);
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING);

// Récupération des données : l'auteur dont l'id est sur l'URL
$sql = 'SELECT * FROM auteurs WHERE id=:id';
$query = $pdo->prepare($sql);
$query->bindValue(':id', $id, PDO::PARAM_INT);
$query->execute();
$auteur_unique = $query->fetch(PDO::FETCH_ASSOC);

// Récupération des données : les livres de l'auteur dont l'id est sur l'URL
$sql = 'SELECT livres.isbn, livres.titre FROM
livres JOIN livres_auteurs ON livres.isbn = livres_auteurs.livre_isbn
WHERE livres_auteurs.auteur_id = :id';
$query = $pdo->prepare($sql);
$query->bindValue(':id', $id, PDO::PARAM_INT);
$query->execute();
$livres_auteur = $query->fetchAll(PDO::FETCH_ASSOC);

// Lancement du moteur Twig avec les données
echo $twig->render('detail_auteur.twig', [
  'auteur' => $auteur_unique,
  'livres' => $livres_auteur
]);
