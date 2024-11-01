<?php


require_once "../../../php/dao/Connection.php";
require_once "../../../php/dao/Procs.php";

use PHP\DAO\Connection;
use PHP\DAO\Procs;


class Response
{
    public static function send($data)
    {
        header('Content-Type: application/json');
        echo json_encode($data, JSON_UNESCAPED_SLASHES);
    }
}


$date_debut = "2024-07-01 00:00:00";
$date_fin = "2024-07-10 00:00:00";

$connection = new Connection("db_camping");
$pdo = $connection->getPDO();
$procs = new Procs($pdo);

$emplacement = $procs->getAvailableEmplacements($date_debut, $date_fin);

Response::send(["data_free_emp" => $emplacement]);
