<?php


require_once "./php/dao/Connection.php";
require_once "./php/dao/Procs.php";

use PHP\DAO\Connection;
use PHP\DAO\Procs;

$id = 5;
$date_debut = "2024-07-01 00:00:00";
$date_fin = "2024-07-10 00:00:00";

$connection = new Connection("db_camping");
$pdo = $connection->getPDO();
$procs = new Procs($pdo);

[$code_promo, $md_paiement, $emplacement, $activite, $client] = $procs->getInvoiceFromCommandId($id);
$free_emp = $procs->getAvailableEmplacements($date_debut, $date_fin);

$data_invoice = [
    "code_promo" => $code_promo,
    "md_paiement" => $md_paiement,
    "emplacement" => $emplacement,
    "activite" => $activite,
    "client" => $client
];

$data_free_emp = [
    "data_free_emp" => $free_emp
];

echo json_encode($data_free_emp, JSON_PRETTY_PRINT);
