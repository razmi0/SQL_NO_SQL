<?php

namespace PHP\DAO;

use DateTime;
use Exception;
use PDO;

/**
 * 
 * Class Procs
 * 
 * @method static getInvoiceFromCommandId (id INT)
 * @method static getAvailableEmplacements( date_debut DATETIME date_fin DATETIME)
 */
class Procs
{

    private $pdo = null;

    public function __construct(PDO $pdo)
    {
        $this->pdo = $pdo;
    }

    /**
     * getInvoiceFromCommandId
     * @param id INT
     */

    public function getInvoiceFromCommandId($id)
    {
        return $this->runProc("CALL getInvoiceFromCommandId($id);", $this->pdo);
    }

    /**
     * getAvailableEmplacements
     * @param date_debut string YYYY-MM-DD HH:MM:SS
     * @param date_fin string YYYY-MM-DD HH:MM:SS
     */

    public function getAvailableEmplacements($date_debut, $date_fin)
    {
        return $this->runProc("CALL getAvailableEmplacements(\"$date_debut\", \"$date_fin\");", $this->pdo);
    }

    /**
     * runProc
     * @param string $proc_call
     * @param PDO $pdo
     * @return array
     */
    private function runProc(string $proc_call, PDO $pdo)
    {
        $result = [];
        try {
            $pdo->beginTransaction();
            $stmt = $pdo->prepare($proc_call);
            $stmt->execute();
            do {
                $result[] = $stmt->fetchAll(PDO::FETCH_ASSOC);
            } while ($stmt->nextRowset());
            $pdo->commit();
        } catch (Exception $e) {
            $pdo->rollBack();
            echo "Failed: " . $e->getMessage();
        }
        return $result;
    }
}
