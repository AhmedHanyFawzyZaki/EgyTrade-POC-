<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;

class HomeController extends Controller {

    public function __construct() {
        $this->middleware('auth', ['except' => 'index']);
    }

    public function index() {
        return view('/frontend/home/landing-page');
    }

    public function home() {
        return view('/frontend/home/home');
    }

    public function services() {
        return view('/frontend/home/services');
    }

}
