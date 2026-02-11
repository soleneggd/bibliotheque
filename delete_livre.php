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
$sql = 'SELECT * FROM livres WHERE isbn=:isbn';
$query = $pdo->prepare($sql);
$query->bindValue(':isbn', $isbn, PDO::PARAM_INT);
$query->execute();
$livre = $query->fetch(PDO::FETCH_ASSOC);

// Suppression du livre
$sql = 'DELETE FROM livres WHERE isbn=:isbn';
$query = $pdo->prepare($sql);
$query->bindValue(':isbn', $isbn, PDO::PARAM_INT);
$query->execute();

if ($query->errorCode() == '00000') {
  $message = 'Le livre ' . $livre['titre'] . ' a été supprimé.';
} else {
  $message = 'Une erreur est survenue lors de la suppression du livre.';
}

// Lancement du moteur Twig avec les données
echo $twig->render('delete_livre.twig', [
  'message' => $message,
]);
