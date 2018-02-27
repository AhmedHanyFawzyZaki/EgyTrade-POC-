<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;

/*
 * LDAP
 */

//use Adldap\Laravel\Facades\Adldap;

class LoginController extends Controller {

    public function index() {
        return view('auth/login');
    }

    public function login(Request $request) {
        $attempt = Auth::attempt([
                    'email' => $request->email,
                    'password' => $request->password,
                    'active' => 1
        ]);
        if ($attempt) {
            $user = User::where('email', $request->email)->first();
            if ($user->user_type_id == env('UT_ADMIN')) //admin
                return redirect()->route('dashboard');
            return redirect()->route('home');
        }
        return redirect()->back()->withErrors(['error' => trans('messages.LoginError')]);
    }

    public function loginAjax(Request $request) {
        $attempt = Auth::attempt([
                    'email' => $request->email,
                    'password' => $request->password,
                    'active' => 1
        ]);
        if ($attempt) {
            $user = User::where('email', $request->email)->first();
            if ($user->user_type_id == env('UT_ADMIN')) //admin
                echo json_encode(array('status' => 1, 'path' => 'dashboard'));
            else
                echo json_encode(array('status' => 1, 'path' => ''));
        }else {
            echo json_encode(array('status' => 0, 'msg' => trans('messages.LoginError')));
        }
    }

    public function logout() {
        Auth::logout();
        return redirect()->route('landingPage');
    }

}
