<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Applications extends Model {
    use \App\Traits\ApplicationTrait;

    /**
     * get company relationship
     * @return type
     */
    public function getCompany() {
        return $this->belongsTo(Companies::class, 'company_id');
    }

    /**
     * get recipient country relationship
     * @return type
     */
    public function getRecipientCountry() {
        return $this->belongsTo(Countries::class, 'sd_recipient_country');
    }

}
