<?php

$host    = "localhost";
$db      = "boost-test";
$charset = "utf8";

$user    = "root";
$psw     = "";

$dsn     = "mysql:host=$host;dbname=$db;charset=$charset";

// Connexion à la base de données
$pdo = new PDO(
    $dsn,
    $user,
    $psw,
    array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION)
);

$query = $pdo->prepare("SELECT DATABASE();");
$query->execute();

var_dump($query->fetch());