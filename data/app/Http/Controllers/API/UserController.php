<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\User;

class UserController extends Controller {

    public function index() {
        $file = file_get_contents(url('/files/img/logo1.jpg'));
        $base64 = chunk_split(base64_encode($file));
        //echo "<img src='data:image/jpeg;base64, $base64' />";die;
        return response()->json([
                    'Request_ID' => 1,
                    'Finger_Prints' => [
                            [
                            'FP_POS' => 1,
                            'FP_Image' => 'bytearray'
                        ], [
                            'FP_POS' => 2,
                            'FP_Image' => 'bytearray'
                        ], [
                            'FP_POS' => 3,
                            'FP_Image' => 'bytearray'
                        ]
                    ]
        ]);
    }

    public function allUsers() {
        $users = User::all();
        return response()->json($users);
    }

}
