<?php


require_once "../../../php/dao/Connection.php";
require_once "../../../php/dao/Procs.php";

use PHP\DAO\Connection;
use PHP\DAO\Procs;

$id = 5;
$connection = new Connection("db_camping");
$pdo = $connection->getPDO();
$procs = new Procs($pdo);

[$code_promo, $md_paiement, $emplacement, $activite, $client] = $procs->getInvoiceFromCommandId($id);

$data_invoice = [
    "code_promo" => $code_promo,
    "md_paiement" => $md_paiement,
    "emplacement" => $emplacement,
    "activite" => $activite,
    "client" => $client
];

header('Content-Type: application/json');
echo json_encode($data_invoice, JSON_UNESCAPED_SLASHES);
