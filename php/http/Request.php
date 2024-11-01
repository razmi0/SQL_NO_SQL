<?php

namespace PHP\HTTP;

class Request
{
    private array $query_string_array = [];

    public function __construct()
    {
        parse_str($_SERVER['QUERY_STRING'], $this->query_string_array);
    }

    public function getQueryParam(string $key = null): array | string
    {
        if ($key) {
            return $this->query_string_array[$key];
        }
        return $this->query_string_array;
    }
}
