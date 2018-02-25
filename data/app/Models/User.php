<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable {

    //public $password_confirmation;
    protected $table = 'user';
    protected $fillable = ['email', 'password', 'user_type_id'];
    public $rules = [
        'email' => 'required|email|unique:user',
        'user_type_id' => 'required',
    ];
    public $passwordRule = [
        'password' => 'required|min:6'
    ];
    public $registerRules = [
        'email' => 'required|email|unique:user',
        'password' => 'min:6|required',
        'password_confirmation' => 'required|min:6|same:password',
        'captcha' => 'required|bone_captcha',
    ];
    public $changePasswordRules = [
        'password' => 'min:6|required',
        'password_confirmation' => 'required|min:6|same:password',
        'captcha' => 'required|bone_captcha',
    ];

    /*
     * Relations
     */

    public function usertype() {
        //var_dump($this->belongsTo('\App\Models\UserType'));die;
        return $this->belongsTo(UserType::class, 'user_type_id');
    }

    /*
     * before save, if the password has been updated re-hash it
     */

    public function save(array $options = []) {
        // before save
        if ($this->password != '' && (!$this->exists || $this->isDirty('password'))) {
            $this->password = bcrypt($this->password);
        }

        parent::save();
        // after save code
    }

    /*
     * get active
     */

    public function getActive() {
        return $this->active ? trans('messages.active') : trans('messages.inactive');
    }

}
