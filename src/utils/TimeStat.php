<?php

namespace SNoS\Utils;

class TimeStat
{

    private array $measures = [];
    private $precision = 0;
    private const YELLOW = "\033[33m%s\033[0m";
    private const BLUE = "\033[34m%s\033[0m";

    /**
     * TimeStat constructor.
     * 
     * @param array $config
     * @example config $config = [
     * "labels" => ["label1", "label2", "label3"],
     * "precision" => 2
     * ];
     * 
     */
    public function __construct(array $config)
    {
        $labelsValues = key_exists("labels", $config) ? $config["labels"] : throw new \Exception("You must provide labels");
        $this->precision = key_exists("precision", $config) ? $config["precision"] : $this->precision;

        if (count($labelsValues) === 0) {
            throw new \Exception("You must provide labels");
        }

        foreach ($labelsValues as $label) {
            $this->measures[] = [
                'label' => $label,
                'startTime' => microtime(true),
                'endTime' => 0,
                'time' => 0
            ];
        }
    }


    public function end(string $label, array $config = [])
    {
        $display = key_exists("display", $config) ? $config["display"] : false;
        $index = $this->findMeasure($label, true);
        $this->measures[$index]['endTime'] = microtime(true);
        $this->measures[$index]['time'] = ($this->measures[$index]['endTime'] - $this->measures[$index]['startTime']) * 1000;
        if ($display) {
            $this->display(null, $this->measures[$index]);
        }
        return $this;
    }

    public function findMeasure(string | null $label = null, bool | null $getIndex = null)
    {
        if (!$label) {
            throw new \Exception("You must provide a label");
        }
        $index = array_search($label, array_column($this->measures, 'label'), true);
        if ($getIndex) {
            return $index;
        }
        return $this->measures[$index];
    }

    public function floorAt($number)
    {
        return floor($number * pow(10, $this->precision)) / pow(10, $this->precision);
    }

    public function display(string | null $label = null, array | null $measure = null)
    {
        if (!$measure && !$label) {
            throw new \Exception("You must provide a measure or a label");
        }
        if (!$measure && $label) {
            $measure = $this->findMeasure($label);
        }
        $prefix = "[ Execution time ] : ";
        $label_part = sprintf(self::YELLOW, $measure['label']) . " ";
        $time_part = sprintf(self::BLUE, $this->floorAt($measure["time"]) . " ms") . PHP_EOL;
        echo "$prefix $label_part $time_part";

        return $this;
    }
}
