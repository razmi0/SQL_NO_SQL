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
$date_debut = $request->getQueryParam("date_debut");
$date_fin = $request->getQueryParam("date_fin");

$connection = new Connection("db_camping");
$pdo = $connection->getPDO();
$procs = new Procs($pdo);

[$emplacement] = $procs->getAvailableEmplacements($date_debut, $date_fin);


Response::send(["data" => $emplacement]);
