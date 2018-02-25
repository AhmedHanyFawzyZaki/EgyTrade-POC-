<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class UserType extends BaseModel {

    protected $table = 'user_type';
    public $timestamps = false;

    /**
     * get user type relation
     * @return type
     */
    public function users() {
        return $this->hasMany(User::class, 'user_type_id');
    }

}
