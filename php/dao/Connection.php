<?php

namespace PHP\DAO;

use PDO;
use PDOException;

class Connection
{

    private $pdo = null;
    private $host = "localhost:3306";
    private $username = "root";
    private $password = "";
    private $db_name = "db_labrest";
    private $table_name = "T_PRODUIT";


    public function __construct(string $db_name = "db_labrest")
    {
        try {
            $this->db_name = $db_name;
            $this->pdo = new PDO("mysql:host=$this->host;dbname=$this->db_name", $this->username, $this->password);
            $this->setPDOAttributes();
        } catch (PDOException $e) {
            error_log($e->getMessage());
            throw new PDOException($e->getMessage());
        }
    }

    public function getTableName()
    {
        return $this->table_name;
    }

    public function getPDO()
    {
        return $this->pdo;
    }

    public function closeConnection()
    {
        $this->pdo = null;
    }

    private function setPDOAttributes()
    {
        $this->pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $this->pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
        $this->pdo->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
        return $this;
    }
}
