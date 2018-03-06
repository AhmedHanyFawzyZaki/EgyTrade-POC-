<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ApplicationPx extends Model {

    //
    protected $table = 'application_px';

    public function px_type_id_rel() {
        return $this->belongsTo('\App\Models\PxTypes', 'px_type_id');
    }

}
