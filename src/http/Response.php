<?php

namespace SNoS\HTTP;

class Response
{
    public static function send($data)
    {
        header('Content-Type: application/json');
        http_response_code(200);
        echo json_encode($data);
    }
}
