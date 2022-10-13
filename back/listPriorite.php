<?php

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");

require "db.php";

$query =    "SELECT ID_PRIORITE, NOM_PRIORITE, COULEUR_PRIORITE
            FROM priorite_ticket";

$request = $pdo->prepare($query);
$request->execute();

$listPriorite = [];

while($priorite = $request->fetch()) {
    $listPriorite[$priorite["ID_PRIORITE"]] = [
        "nomPriorite" => $priorite["NOM_PRIORITE"],
        "couleurPriorite" => $priorite["COULEUR_PRIORITE"]
    ];
}

echo json_encode($listPriorite);

exit();