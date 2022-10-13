<?php

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");

require "db.php";

//$query =    "SELECT t.ID_TICKET, t.TITRE_TICKET, a.ID_TYPE_TICKET, a.ID_PRIORITE, a.DATE_ACTIVITE, u.USERNAME
//            FROM activite a, ticket t, priorite_ticket p, type_ticket tt, user u
//            WHERE t.ID_TICKET = a.ID_TICKET AND a.ID_PRIORITE = p.ID_PRIORITE AND a.ID_TYPE_TICKET = tt.ID_TYPE_TICKET AND a.ID_USER = u.ID_USER
//            ORDER BY a.DATE_ACTIVITE DESC";

$request = $pdo->prepare($query);
$request->execute();

$ticket = $request->fetch();

echo json_encode($ticket);

exit();