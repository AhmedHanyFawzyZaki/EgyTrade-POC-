<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ApplicationCn extends Model {

    //
    protected $table = 'application_cn';

    /**
     * get company relationship
     * @return type
     */
    public function getHsCode() {
        return $this->belongsTo(HsCodes::class, 'cn_hs_code_id');
    }

}
