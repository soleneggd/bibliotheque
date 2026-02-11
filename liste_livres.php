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
$isbn = htmlspecialchars(strip_tags($_POST['isbn'] ?? ''));
$titre = htmlspecialchars(strip_tags($_POST['titre'] ?? ''));
$resume = htmlspecialchars(strip_tags($_POST['resume'] ?? ''));
$prix = htmlspecialchars(strip_tags($_POST['prix'] ?? ''));
$editeur = htmlspecialchars(strip_tags($_POST['editeur'] ?? ''));

// Insertion des données dans la base de données
if (!empty($isbn) && !empty($titre)) {
  $sql_insert = 'INSERT INTO livres (isbn, titre, resume, prix, id_editeur) VALUES (:isbn, :titre, :resume, :prix, :editeur)';
  $query_insert = $pdo->prepare($sql_insert);
  $query_insert->bindParam(':isbn', $isbn);
  $query_insert->bindParam(':titre', $titre);
  $query_insert->bindParam(':resume', $resume);
  $query_insert->bindParam(':prix', $prix);
  $query_insert->bindParam(':editeur', $editeur);
  $query_insert->execute();
}

// Récupération des données : listes des livres
$sql = 'SELECT * FROM livres';
$query = $pdo->prepare($sql);
$query->execute();
$tableau_livres = $query->fetchAll(PDO::FETCH_ASSOC);

// Récupération des données : listes des éditeurs pour le formulaire
$sql = 'SELECT * FROM editeurs';
$query = $pdo->prepare($sql);
$query->execute();
$tableau_editeurs = $query->fetchAll(PDO::FETCH_ASSOC);

// Lancement du moteur Twig avec les données
echo $twig->render('liste_livres.twig', [
  'tableau_livres' => $tableau_livres,
  'tableau_editeurs' => $tableau_editeurs
]);
