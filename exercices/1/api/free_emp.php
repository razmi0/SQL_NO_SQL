<?php

require_once "../../../vendor/autoload.php";


use SNoS\DAO\Connection;
use SNoS\DAO\Procs;
use SNoS\HTTP\Request;
use SNoS\HTTP\Response;


$request = new Request();
$date_debut = $request->getQueryParam("date_debut");
$date_fin = $request->getQueryParam("date_fin");
$connection = new Connection("db_camping");
$pdo = $connection->getPDO();
$procs = new Procs($pdo);

[$emplacement] = $procs->getAvailableEmplacements($date_debut, $date_fin);

Response::send(["data" => $emplacement]);
