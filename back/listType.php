<?php

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");

require "db.php";

$query =    "SELECT ID_TYPE_TICKET, NOM_TYPE_TICKET
            FROM type_ticket";

$request = $pdo->prepare($query);
$request->execute();

$listTypeTicket = [];

while($typeTicket = $request->fetch()) {
    $listTypeTicket[$typeTicket["ID_TYPE_TICKET"]] = [
        "nomTypeTicket" => $typeTicket["NOM_TYPE_TICKET"]
    ];
}

echo json_encode($listTypeTicket);

exit();