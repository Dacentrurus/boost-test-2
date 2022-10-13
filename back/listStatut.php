<?php

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");

require "db.php";

$query =    "SELECT ID_STATUT, NOM_STATUT, COULEUR_STATUT
            FROM statut";

$request = $pdo->prepare($query);
$request->execute();

$listStatut = [];

while($statut = $request->fetch()) {
    $listStatut[$statut["ID_STATUT"]] = [
        "nomStatut" => $statut["NOM_STATUT"],
        "couleurStatut" => $statut["COULEUR_STATUT"]
    ];
}

echo json_encode($listStatut);

exit();