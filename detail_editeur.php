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

// Récupération des données : l'éditeur dont l'id est sur l'URL
$sql = 'SELECT * FROM editeurs WHERE id=:id';
$query = $pdo->prepare($sql);
$query->bindValue(':id', $id, PDO::PARAM_INT);
$query->execute();
$editeur_unique = $query->fetch(PDO::FETCH_ASSOC);

// Lancement du moteur Twig avec les données
echo $twig->render('detail_editeur.twig', [
  'editeur' => $editeur_unique
]);
