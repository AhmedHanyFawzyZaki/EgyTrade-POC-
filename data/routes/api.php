<?php

use Illuminate\Http\Request;

/*
  |--------------------------------------------------------------------------
  | API Routes
  |--------------------------------------------------------------------------
  |
  | Here is where you can register API routes for your application. These
  | routes are loaded by the RouteServiceProvider within a group which
  | is assigned the "api" middleware group. Enjoy building your API!
  |
 */



Route::any('/send_app', function() {
    ini_set("soap.wsdl_cache_enabled", "0");
    \Log::info('send_app web service - '. request()->ip());
    
    $server = new \SoapServer(null, [
        'location' => env('API_SEND_APP_URL'),
        'uri' => env('APP_URL'),
        'trace' => 1,
        'soap_version' => SOAP_1_1,
    ]);

    $server->setClass('\App\Models\Applications');
    $server->handle();

    exit;
});


Route::any('/update_app_status', function() {
    ini_set("soap.wsdl_cache_enabled", "0");
//    \Log::info('update_app_status web service - '. request()->ip());
    
    $server = new \SoapServer(url('wsdl/update_app_status.wsdl'));

    $server->setClass('\App\Models\Applications');
    $server->handle();

//    dd($server->getFunctions());
    exit;
});
