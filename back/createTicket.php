<?php

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");

require "db.php";

if(isset($_POST["titre"]) && $_POST["titre"] != ""
    && isset($_POST["desc"]) && $_POST["desc"] != ""
    && isset($_POST["idTypeTicket"]) && $_POST["idTypeTicket"] != ""
    && isset($_POST["idPriorite"]) && $_POST["idPriorite"] != ""
    && isset($_POST["page"])
)
{
    $query = "INSERT INTO ticket(TITRE_TICKET, DESC_TICKET, PAGE_TICKET) VALUES(?,?,?)";

    $request = $pdo->prepare($query);
    $request->bindValue(1, $_POST["titre"]);
    $request->bindValue(2, $_POST["desc"]);
    $request->bindValue(3, $_POST["page"]);

    $request->execute();

    $id = $pdo->lastInsertId();

    $query = "INSERT INTO activite(ID_TICKET, ID_USER, ID_STATUT, ID_PRIORITE, ID_TYPE_TICKET, DATE_ACTIVITE) VALUES(?,?,?,?,?,NOW())";

    $request = $pdo->prepare($query);
    $request->bindValue(1, $id);

    // HARDCODED USER
    $request->bindValue(2, 1);
    // HARDCODED STATUS (ouvert par défaut)
    $request->bindValue(3, 2);

    $request->bindValue(4, $_POST["idPriorite"]);
    $request->bindValue(5, $_POST["idTypeTicket"]);

    $request->execute();

}

exit();