<?php
// Initialise Twig
include('include/twig.php');
$twig = init_twig();

// Récupère les identifiants dans un fichier de configuration
include('include/config.php');

// Connexion à la base de données et force l'affichage des erreurs SQL
$pdo = new PDO('mysql:host=' . SERVER . ';dbname=' . BDD . ';charset=utf8', USER, PASSWORD);
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING);

// Récupération des données POST
$nom = htmlspecialchars(strip_tags($_POST['nom'] ?? ''));
$adresse = htmlspecialchars(strip_tags($_POST['adresse'] ?? ''));

// Insertion des données dans la base de données
if (!empty($nom) && !empty($adresse)) {
  $sql_insert = 'INSERT INTO editeurs (nom, adresse) VALUES (:nom, :adresse)';
  $query_insert = $pdo->prepare($sql_insert);
  $query_insert->bindParam(':nom', $nom);
  $query_insert->bindParam(':adresse', $adresse);
  $query_insert->execute();
}

// Récupération des données : listes des éditeurs
$sql = 'SELECT * FROM editeurs';
$query = $pdo->prepare($sql);
$query->execute();
$tableau_editeurs = $query->fetchAll(PDO::FETCH_ASSOC);

// Lancement du moteur Twig avec les données
echo $twig->render('liste_editeurs.twig', [
  'tableau_editeurs' => $tableau_editeurs
]);
