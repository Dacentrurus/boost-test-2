<?php

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");

require "db.php";

$query =    "SELECT t.ID_TICKET, t.TITRE_TICKET, a.ID_TYPE_TICKET, a.ID_PRIORITE, a.DATE_ACTIVITE, u.USERNAME, s.ID_STATUT
            FROM activite a, ticket t, priorite_ticket p, type_ticket tt, user u, statut s
            WHERE t.ID_TICKET = a.ID_TICKET AND a.ID_PRIORITE = p.ID_PRIORITE AND a.ID_TYPE_TICKET = tt.ID_TYPE_TICKET AND a.ID_USER = u.ID_USER AND a.ID_STATUT = s.ID_STATUT
            ORDER BY a.DATE_ACTIVITE DESC";

$request = $pdo->prepare($query);
$request->execute();

$listTicket = [];

while($ticket = $request->fetch()) {
    $listTicket[] = [
        "idTicket" => $ticket["ID_TICKET"],
        "titreTicket" => $ticket["TITRE_TICKET"],
        "idTypeTicket" => $ticket["ID_TYPE_TICKET"],
        "idPrioriteTicket" => $ticket["ID_PRIORITE"],
        "idStatut" => $ticket["ID_STATUT"],
        "lastUser" => $ticket["USERNAME"],
        "dateActivite" => $ticket["DATE_ACTIVITE"]
    ];
}

echo json_encode($listTicket);

exit();