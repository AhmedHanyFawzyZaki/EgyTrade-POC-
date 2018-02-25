<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
//use Adldap\Laravel\Facades\Adldap;

class HomeController extends Controller {

    public function index() {
        /*$user = Adldap::search()->users()->find('ahany');
        echo var_dump($user->memberof);die;*/
        return view('/backend/home/index');
    }

}
