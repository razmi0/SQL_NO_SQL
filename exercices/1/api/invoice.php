<?php

require_once "../../../php/dao/Connection.php";
require_once "../../../php/dao/Procs.php";
require_once "../../../php/http/Request.php";
require_once "../../../php/http/Response.php";

use PHP\DAO\Connection;
use PHP\DAO\Procs;
use PHP\HTTP\Request;
use PHP\HTTP\Response;


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
