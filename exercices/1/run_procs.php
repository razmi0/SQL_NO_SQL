<?php


require_once "./php/dao/Connection.php";
require_once "./php/dao/Procs.php";
require_once "./php/utils/TimeStat.php";

use PHP\DAO\Connection;
use PHP\DAO\Procs;
use PHP\Utils\TimeStat;

$id = 5;
$date_debut = "2024-07-01 00:00:00";
$date_fin = "2024-07-15 00:00:00";

$connection = new Connection("db_camping");
$pdo = $connection->getPDO();
$procs = new Procs($pdo);

// Start timers
// --
$timeStat = new TimeStat(
    [
        "labels" => ["Invoice", "Emplacements"],
        "precision" => 2
    ]
);

// INVOICE
// --
[$code_promo, $md_paiement, $emplacement, $activite, $client] = $procs->getInvoiceFromCommandId($id);
$timeStat->end("Invoice");

// EMPLACEMENTS
// --
$free_emp = $procs->getAvailableEmplacements($date_debut, $date_fin);
$timeStat->end("Emplacements");

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

// Display timers
// --
$timeStat->display("Invoice");
$timeStat->display("Emplacements");
