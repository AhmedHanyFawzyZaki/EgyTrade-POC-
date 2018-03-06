<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ApplicationCr extends Model {

    //
    protected $table = 'application_cr';
    
    public function cr_num_rel() {
        return $this->belongsTo('\App\Models\ContainerNumbers', 'cr_num');
    }

}
