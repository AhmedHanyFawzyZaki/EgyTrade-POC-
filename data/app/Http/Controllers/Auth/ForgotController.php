<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Helper;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class ForgotController extends Controller {

    public function postForgot(Request $request) {
        $user = User::where('email', '=', $request->email)->first();

        if ($user) {
            $user->remember_token = $user->id . time();
            $user->save();
            $link = url('/') . '/resetPassword?code=' . urlencode(Helper::encryptAlgo($user->remember_token));
            $message = trans('messages.To reset your password please click') .
                    ' <a href="' . $link . '">' . trans('messages.here') . '</a>, ' .
                    trans('messages.or copy and paste the following link to your browser.')
                    . '<br/>' . trans('messages.Link:') . ' ' . $link;
            $sent = Helper::SendMail(env('ADMIN_EMAIL'), $user->email, trans('messages.Password Reset'), $message);
            if ($sent) {
                flash(trans('messages.forgot_successful'))->success();
                return redirect()->route('home');
            }
        }else{
            flash(trans('messages.forgot_fail'))->error();
            return redirect()->route('home');
        }
    }

    public function resetPassword() {
        $code = urldecode($_GET['code']);
        $code = Helper::decryptAlgo($code);
        $user = User::where('remember_token', '=', $code)->first();
        if ($user) {
            return view('/frontend/resetPassword', ['code' => $code]);
        }
    }

    public function changePassword(Request $request) {
        $request->flash(); //save the input before redirect
        $code = Helper::decryptAlgo($request->code);
        $user = User::where('remember_token', '=', $code)->first();
        if ($user) {
            $request->flash(); //save the input before redirect
            $validator = Validator::make($request->all(), $user->changePasswordRules);
            if ($validator->fails()) {
                return redirect()->back()->withErrors($validator);
            } else {
                $user->password = $request->input("password");
                $user->remember_token = NULL;

                $user->save();
                flash(trans('messages.change_password_done'))->success();
                return redirect()->route('home');
            }
        }
    }

}
