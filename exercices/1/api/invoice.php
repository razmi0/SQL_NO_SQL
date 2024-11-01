<?php

require_once "../../../vendor/autoload.php";

use SNoS\DAO\{Connection, Procs};
use SNoS\HTTP\{Request, Response};

$request = new Request();
$id = $request->getQueryParam("id");
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

Response::send(["data" => $data_invoice]);
