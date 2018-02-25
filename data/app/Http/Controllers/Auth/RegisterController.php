<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Helper;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class RegisterController extends Controller {

    public function registerAjax(Request $request) {
        $user = new User();
        $request->flash(); //save the input before redirect

        $validator = Validator::make($request->all(), $user->registerRules);
        if ($validator->fails()) {
            echo json_encode(array('status' => 0, 'errors' => $validator->messages()));
        } else {
            $user->email = $request->input("email");
            $user->password = $request->input("password");
            $user->user_type_id = env('UT_NORMAL');
            $user->save();
            $link = url('/') . '/activate?code=' . urlencode(Helper::encryptAlgo($user->id));
            $message = trans('messages.To activate your account please click') .
                    ' <a href="' . $link . '">' . trans('messages.here') . '</a>, ' .
                    trans('messages.or copy and paste the following link to your browser.')
                    . '<br/>' . trans('messages.Link:') . ' ' . $link;
            $sent = Helper::SendMail(env('ADMIN_EMAIL'), $user->email, trans('messages.Account activation'), $message);
            if ($sent) {
                flash(trans('messages.registration_successful'))->success();
                echo json_encode(array('status' => 1));
            }
        }
    }

    public function activate() {
        $code = urldecode($_GET['code']);
        $id = Helper::decryptAlgo($code);
        $user = User::findOrFail($id);
        if ($user && !$user->remember_token) {
            $user->active = 1;
            $user->save();
            flash(trans('messages.Done! Your account has been activated successfully.'));
            return redirect()->route('home');
        } else {
            return redirect()->route('home');
        }
    }

}
