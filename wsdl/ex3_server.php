<?php

ini_set("soap.wsdl_cache_enabled", "0");
$server = new \SoapServer('update_app_status.wsdl', [
//        'classmap' => [
//            'notification' => '\App\Models\Application', // 'book' complex type in WSDL file mapped to the Book PHP class
//        ],
//        'soap_version' => SOAP_1_1,
        ]);

$server->setClass('\App\Models\Application');
$server->handle();

