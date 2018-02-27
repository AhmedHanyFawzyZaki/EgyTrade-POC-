<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ApplicationNotifications extends Model
{
    protected $guarded = ['id'];

    public function applications() {
        return $this->hasMany('\App\Models\Applications', 'id', 'application_id');
    }
}
